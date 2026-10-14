# Промпт генерации

Заполни только полезные поля; весь текст в изображении перечисли дословно. Промпт можно писать по-английски, но подписи оставляй на выбранном языке.

```text
Use case: infographic-diagram [or scientific-educational]
Asset type: premium educational infographic, PNG
Primary request: Explain <topic> for <audience>; core takeaway: <one sentence>.
Input images: <optional, ordered roles>
Style/medium: <selected preset and its concrete visual properties>
Scene/backdrop: <background>
Composition/framing: <aspect ratio>; <chosen visual grammar and hierarchy>; safe margins; readable at intended viewing size.
Subject: <central diagram/metaphor and the actual relationships it represents>
Content structure: <blocks in reading order, labels and connector direction>
Color palette: <semantic color mapping>
Lighting/materials: <style-appropriate depth and surfaces>
Typography: professional Cyrillic-capable sans serif; clear hierarchy; crisp, high-contrast text.
Text (verbatim):
Title: "<exact title>"
<each exact label and explanation, with its placement>
Constraints: <required scientific or conceptual invariants>; aspect ratio <ratio>; no invented data; no additional text.
Avoid: illegible microtext, spelling errors, random UI numbers, decorative false charts, watermark, overcrowding, ambiguous arrows.
```

Промпт должен содержать всю информацию для воспроизведения: имя пресета не заменяет описание. Для правки укажи изменяемое свойство и инварианты; в сохранённом финальном промпте приложи исходную спецификацию и точный текст последнего запроса правки, не называя его самостоятельным новым вызовом.
