defmodule UneebeeWeb.Components.Dashboard.StepImage do
  @moduledoc false
  use UneebeeWeb, :live_component

  alias Uneebee.Content.Course
  alias Uneebee.Content.Lesson
  alias Uneebee.Content.LessonStep

  attr :course, Course, required: true
  attr :lesson, Lesson, required: true
  attr :step, LessonStep, required: true

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~H"""
    <div>
      <.link :if={@step.image} patch={~p"/dashboard/c/#{@course.slug}/l/#{@lesson.id}/s/#{@step.order}/image"} class="block w-full sm:w-1/3">
        <img src={@step.image} class="w-full" />
      </.link>

      <.link
        :if={is_nil(@step.image)}
        patch={~p"/dashboard/c/#{@course.slug}/l/#{@lesson.id}/s/#{@step.order}/image"}
        class="bg-gray-light2x text-gray-dark2x flex w-full flex-col items-center justify-center rounded-2xl py-12 sm:w-1/3"
      >
        <%= dgettext("orgs", "Click to add an image to this step.") %>
      </.link>
    </div>
    """
  end
end
