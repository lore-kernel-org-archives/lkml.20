Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552046AA7B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859289; cv=pass; b=E7nl19SoRTaZwz807e5XTa4MvwDZZ+g3zUgZYPnevFs2ZvFEn0uXFBqcrGDn8SSYLaSYX1LFpvwPMatt5TRaqL0voY0ukGDclMDbLwQv8eMHZ6OZFirHpd4Uz86mgNFUTFeLc+vI4Q2+U6QWcWXrMsasgRgwNFD2y2I4hXenB8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859289; c=relaxed/simple;
	bh=mcqwoHb8oDGvr+LfjmCNZColAsqn1zx4J9h+GC0v39U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElU0q0OTe59XfmQKwhZReJV8vHDFq45+2vHeJ9Rp740fO0Z5lOibPfcv9bJ4SxRLsiuChnqyM/4YMLgkLrVOhd2LI5iS1dx9jO3W+u26nLV9F16tTTu7RbjE2rWC+VcEgeaV0jdzidTwn4MDDpRSmsrKiI1ShFTpKnCup0JToFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXV97IQO; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXV97IQO"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-918f75a68f0so43869046d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791859287; cv=none;
        d=google.com; s=arc-20260327;
        b=QES4G9eszctkLKXllrhGEbdM1xvGgzukD5WYNFpkX0UHEHU1pruqbX4jB7gEGadqsh
         WqdBmvFNX5tvbzcz3RmtOVwmAOeQwn9ClH0WYlori4dQe7hF2w39NBv/Ek8kTb7CoyN2
         0f725MqohCwWjbsLV2hHC85rKs7VACvIC+k3BZY6TG4Z7ZL6JkdKDmovrHec0Km17Gqa
         md1anSjvRrCxof6tWo0lpj79l8WhH2LozBvrkT6RrK0o39wDBC21pwVA5HCoR+Feb/8H
         DfdGwfd4BfvIMxFm8lNc1E0bPXZCG8P42A9Cd5KQ8SZlT0y4hae5SwTZqmhN2J3cvS1x
         aTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        fh=UIhgfEOV5QlVQPHMDdwJQCZqXj1jwEusKIBqMqqjG6g=;
        b=bgaoXKZMnx4wOSeLw2+QIic0aiuu9LzM0MVfnKDNynGkGjlJ44CdK1Fg3WsrExHc+n
         cApV7IxJP5w/9jsO2inIumd8LkfFZJeqJGxITPfdlXtpEqpIX8Mu5fYLDiHqLVft6v57
         3zYGqbqEBhLV9IgnTi7LZKoldGcVrq0yntYsVLynWn5ZgxYaJf07lEKFoP8R4QFPv46D
         5PWrTTi6qaz1yDHppkORXyQGxQwAEuCVfEMCzevo1p1yJQUU3kHdvO4wmyGLFjpsM6r5
         MOInRS7hlRETaSfI61VyQiH5uLPkQaQKsmIVW1hVtv0aCxaXgOzAo+BDUuXfSSWHP+/z
         4l/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791859287; x=1792464087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        b=RXV97IQO1RVCn7mpe2MZlxLPDzoSIRG8+M/lWhPpbpwiWPfTbWPBzz0jhCgVRyGX1F
         JjYw/FQqzs0Fm8ZI4/XNSnrz4iHp/9PjigzQgbLvxzsHYRnwNM3zw5lTk/10Z1a8jSe6
         VBn7F0xZQAZigO4ZkQ1JMXV1plLH+YZJ4IHZM9ADGeLuk+iiB43lt4XziOyRDvn3TAq/
         rVZvj9JgrrS+s61maqCKuPdvGLbwibVnJ/EJKb5t17+Sf45RxXeiXU0iXpltHAElUZkO
         hH0uc4R3mDrhEoF1rlGpBSeUYQ0Q/5nFeOHw1oMfXEvtvwIgDdey6hPfT1h2yoRe/XO/
         Cpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859287; x=1792464087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        b=Vll6mtfhRTOvPAagxW4EtAj3cnO+Yz0dz2+lZJYDMpovMzDYLhjAGJDaujgUTrlmF5
         LKLDnr9zXZAI2LO32JSRyLWjag08MBNE9eu4YQqZSky5JhrtQkZA1cF22JuySNvE8CWs
         Zws85gGO6vs1lpC8VhnZnp20iqs1CjCllAzvrK1PUVnWifH2NQoIRToP2vJuZRaGqkEK
         mLE8MbY9jQurM6vA6oVaQSmidPDmgXxJEZGCSMCWsDr9ug4+NhHd2LbRzMh+/9pbO8Op
         ++iUmDsIn/an1UJ68RNKiKQnWcCEJnF3SGfldvIVktS3G1I+1/B6M6nr4+vFgeV875xO
         Vp3w==
X-Forwarded-Encrypted: i=1; AKwUvBwYXHcqduoJLZTQUyH7GlUtGqMNwDxwZsboD9ODoOhTZ7+0W47kqZrdaCks+A38naEaPcsim515BjXTxTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLco/RzPajmxaFngC0km8MPWZQjw16ZDns9vqdF6O+M1BMFxy8t
	auAOn8fuY8+D2u/4lNCaqNM0XkFiv7BX4RWn0YQ4GF7VefbHO8pzCElc+nAcMyXPu9VJpqa9y4y
	o05GkU+dUeZu6aOjLWyv8tI8c4WWRuzw=
X-Gm-Gg: AYBFou3ElsMjp9tqFqlw0OT6cJO9rpBiwWSbDyEC7UUqSXZnlhMlCvHdKu07r9CPmJ1
	MTb68thIGCChSMbmeuG3GHjJb3bFJdKQRw0ZET7fa2K0MoH9PYAb6r92oXI6mvgKH9CL/WbMFq1
	sgpPqZ8IChv7k8n3sneqYP2+EAuJdXvDNjva0XqGXsBuKUOde+Jwrl0GglifLPHkpugoAVnv+eZ
	wSpNqaAlvaVYWW8WxowFua1V2feSzfPfoJIAiaxakl1Kiquallsqs2IIn76C3DFmb8ZPesFQkcx
	slaU0Odt+U2VTYtC8R62xfo06ZemcI7oST48LOuxfd3f1mXJWDzo7y+WueofQCamrOqGMVV1p2y
	kDf/WCvkJporatpX+HCEyg9A1yBKoczK53OzfK5DTJMlVoX6cwlzjtlmDP/p6cj4EnsAfvw==
X-Received: by 2002:a05:6214:1c45:b0:917:ac4f:f940 with SMTP id
 6a1803df08f44-91b554c2b35mr213008806d6.10.1791859286912; Mon, 12 Oct 2026
 19:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 23:41:15 -0300
X-Gm-Features: AclHuK_O75gzqvvxMcXM-Q-cX8ChNQmPIYoHNiGA_ffWm4Ywhgb2IEgORttjw0c
Message-ID: <CAMAsx6eGD6JiO_xRrrKDCZATqE_sc4MdRVL_n_ZpRJXgnDFAiw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate generated-content.rst
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ygor,

    Thanks for the patch and for working on this translation!
    The translation captures the intent well, but please see a few
  comments inline:

    > Subject: [PATCH v2] docs: translations: pt_BR: translate
  generated-content.rst

    Please include the subdirectory: "docs: pt_BR: translate
  process/generated-content.rst"

    > And fixed the errors in the commit.

    Changelogs (v1 -> v2) should go below the '---' cutline, not in
  the commit message.
    Also, consider adding: "Update the translation through commit
  <hash> ("<subject>")"

    > Assisted-by:LLM
    >
    > Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>

    Add a space ("Assisted-by: LLM") and remove the blank line between
  trailers.

    > ---
    > ---

    Note the duplicated '---' line here.

    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    > +Diretrizes do Kernel para Conte=C3=BAdo Gerado por Ferramentas
    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Please wrap text at 80 columns; 11 lines currently exceed the
  limit (11, 13, 16,
    17, 45, 46, 54, 68, 86, 105, 106).

    > +tempo, o tempo dispon=C3=ADvel de revisores e mantenedores =C3=A9 um
  recurso escasso.

    Avoid repeating "tempo": "Ao mesmo tempo, a disponibilidade de
  revisores..."

    > +grau de confian=C3=A7a entre submetedores e revisores.

    Avoid the calque "submetedor" throughout; use "autor",
  "contribuidor", or "quem submete".

    > +Fora do Escopo
    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Match underline length to title length (14 '=3D' instead of 15).
    Also applies to "No Escopo" (9 '=3D') and "Refer=C3=AAncias" (11 '=3D')=
.

    > + - Aux=C3=ADlios de digita=C3=A7=C3=A3o como completar identificador=
es,
  boilerplate

    Add comma ("Aux=C3=ADlios de digita=C3=A7=C3=A3o, como...") and transla=
te
  "common" ("boilerplate comum").

    > +Mesmo quando o uso da sua ferramenta estiver fora do escopo,
  voc=C3=AA
    > +ainda deve sempre considerar se informar ao revisor qual
  ferramenta
    > +voc=C3=AA usou ajudaria na revis=C3=A3o da sua contribui=C3=A7=C3=A3=
o.

    A bit clunky; suggest:
    "Mesmo quando o uso de ferramentas estiver fora do escopo,
  considere sempre
    se informar ao revisor a ferramenta utilizada ajudaria na revis=C3=A3o
  da sua contribui=C3=A7=C3=A3o."

    > +Como em todas as contribui=C3=A7=C3=B5es, cada mantenedor tem a
  discricionariedade de escolher

    Redundant; suggest: "tem a discricionariedade de decidir como
  lidar" or "tem autonomia".

    > + - Pedir ao submetedor que explique em mais detalhes sobre a
  contribui=C3=A7=C3=A3o, para
    > +   que o mantenedor possa se assegurar de que o submetedor
  entende completamente

    Avoid repeating "submetedor" twice, and fix verb regimen:
    "Pedir ao autor que explique a contribui=C3=A7=C3=A3o em mais detalhes.=
.."

    > +espere escrut=C3=ADnio adicional proporcional a quanto dela foi
  gerado.

    Missing article: "proporcional ao quanto dela foi gerado".

    > +Como com a sa=C3=ADda de qualquer ferramenta, o resultado pode estar
  incorreto ou

    Awkward cacophony; suggest: "Assim como ocorre com a sa=C3=ADda de
  qualquer ferramenta,".

    > +Para diretrizes espec=C3=ADficas sobre assistentes de codifica=C3=A7=
=C3=A3o de
    > IA, veja:
    > +
    > +
    > +* Documentation/process/coding-assistants.rst

    Remove the extra blank line before the bullet.

    > +   Diretrizes do Kernel para Conte=C3=BAdo Gerado por Ferramentas
  <generated-content>
    >     Conclave (Continuidade do projeto) <conclave>

    In pt_BR/process/index.rst, please place this right before
  'coding-assistants'
    to match the English index order.

    Looking forward to v3!

    Thanks,
    Daniel
