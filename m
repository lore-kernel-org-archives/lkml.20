Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688455;
	b=B0sOa3uH6Za6l0O/CP1TXWUD+PzfxYvKAl/uGMRJYQxSdWdL32iqWe6hNq6AESJv87kd
	 B7E/EFLDavIISInr6wkYAplsIL3iWf6x6GelJ1FK2wM9jN+DY2roLC19o99ZlUqIZWsE/
	 gbGTDy5xF+Es3cDdOCfm35yK+cV2hTWyKg1hfeA9FO8+c4nZiWaWOK4p9QaMFrO/0XfAv
	 oyPPDNCqMpaH0T+ntrXTWeISSs8e1V1IqGJCjurQjNKzcUYBehPNMiYUL91Xrut/H/UDX
	 yyb7RWKuVcx+5Tu+wmm8M5GzTIyqcXsk83on4fqs9h0cvZj/tJCT5cAUxNhLNP4K+qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2BkTeeT4yUW4MDUw4wQWVYeaWzFVBTJbCdo+ClnuZLg=;
	b=k5hg1tcJr4ql391eg/CR9d3QcNXY9Li+gnixnYwSKcnAJt437HqwwxgToydybxUeeuxe
	 oT4ZOieYoLMWuKGrGjyTgY36OlfxXCctOjxVUugwjS9RjKaPjM9dPV57ne5Ij4wlCzQJ/
	 gNHghj5lSnFgt2pyd6OZP4lc/ZSIN85RfEY8IO6YzZjoz8rREFs4iS6jdYT8YoRhgqt/b
	 ilN6iCV1iFi4mTxVbRDWY31KZJWFK/u8aUm+qz6AYU//IWokhyuhKbuHl8pAVoUDmA7Dh
	 WM/jL8PSFBdgPBnzUihQVZQPOtsorFMWK56KL9DqnddCqaeEGVHYUBAPOosFaM645fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EqOlfdut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCFD606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCFD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EqOlfdut
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8a83d2706fdso755587b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688454; cv=none;
        d=google.com; s=arc-20260327;
        b=V2vGKu7kCHAb4zLwn4clb6O3Hy6YXBt+KbLdd5YJj/NtLq6aQKdau0sD4XasHr+ZmT
         b7y5Hn/WwFbBA6kOTM5+I+UknQMg6mWw2of5UzB/D3VljxubZUg9ycjjtHobav6pBt7l
         Waui0h0Ps+bSWViHeP0HG5spmuHZRxJyc+w/cML6QTUki0VhQnqThcVBBGrpvwJW85nP
         veELyNFFSdrp7z8GEc4oPeqfhU70ggqM4Bv+rF++Hh4NN5zezqFx6tN0yMvYSZLrc7/v
         RfkYgaYKdYZD1EwBgDLCr7U5Bp9QSrbtZ/jEMOWEHAacvy56+3qgpIDc/wrEWh7I//4t
         /qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2BkTeeT4yUW4MDUw4wQWVYeaWzFVBTJbCdo+ClnuZLg=;
        fh=X8p/QLAk/3OIIAP0S7F5+nQdVj2SZBzwD74HO6yOqf8=;
        b=GC7aVAfB0km5MRPM+tEcGLpqwCta/DIItT68RgoYNdX2jES+H7qNTytkMixEhpjN1D
         HCRmjmMZ0KV7cAoptQYMPh78l6lqG21984QJ6D2BIvS8oMdJCb++PntZqlxRKRSHG8L4
         EnsUx398/EEyli89wO6Lmw3FfVtvOzvaKq4gGtCAtOyorlcv8dQFjwzN5ftKBCTSdcOT
         +Jf0NBiihizTrE5blUBMC6oGhwDJ84CtJyIfis8Iao5kdclKF8foWW3f1fc1fKmmz+VK
         kubz5FFUistfZZRMFb3lugfNlD/CHJ8Q2RXqHRacafeTjck8yFhUHXU9RNWaiyYORJej
         oFEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688454; x=1793293254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2BkTeeT4yUW4MDUw4wQWVYeaWzFVBTJbCdo+ClnuZLg=;
        b=EqOlfdutj9IAPnsyhfBjWnyDC+8JxcKRctzP45SOSVol+o3J4LsQGxwYISXKtXyCtX
         yuyEblNscR+r8OEfJ67XSkjzsmprAvmlVccOAt7NRktmeHRKATJ5MoRt6KCPPUStEjNS
         OatwC4hPXfGttIAzJ66EWWBJKk28UtgauFJ7IqDUXH4vwXVB0oPIvpng8qpq29EMtY95
         Oq37oPSYrGYbY29ahjIKoGRL/VUb/qcz19SFNZjp0jOZ8VtjPmxdGks4axdKiqOnJmHn
         uVIIBugxyV8fhvKHtiR6B0u7A6f53QxlocDLII6F/TQpyg11lJ7Gn1PZcz94BCT62RXA
         zS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688454; x=1793293254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BkTeeT4yUW4MDUw4wQWVYeaWzFVBTJbCdo+ClnuZLg=;
        b=ZB3BWxk50TlZ2buSefsw+70cRu54PG9WDoiJUX8Dvf+XxWxVuqWoI5EooZslNC4IQ7
         RSkONtoG1L8jtdJpIaVLAkDwi63xszMaabAbF6f1JgpP6D097o65raoKmMqJErrUCBxM
         SvtwmhL7OzYc6cOAfTIiSwGyLz9knW0Q5whGcp2R3T0L2cX2ENKmf5oSS0CpDNfurZ8O
         EF6A0lL0DpmCrS5gAAe3JzEvpCoNWBe3yVtnepMh0/ekRni1417QxX97SeOk7zS44xxF
         X1WfhJtgxG5I3ktTVWCTlox0Q87t0wddoQXD10cgcDOWt2XusTJZKR9Fu4MsPUR3GEDO
         ZBdQ==
X-Forwarded-Encrypted: i=1; AKwUvByhMmSHevTPP13o9gRbUwb66Onpsmunl69hrbFhWFm9l5Pasa/tzh0Azx8lNtuPdY0LPxHn4V06J1+HI30=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8YJCXXM556VkeR7NkS1Bbnu7AJdsMwLcFqOKK9XvZFGlgFdqW
	V42VmtfuNjLQeMM+QCvgUGf0bE+VaB8VkLskkyKe7tCt9+STWcpZA213GXyfkYhY60NrYumeXBu
	23erE+xPW1db8/djh7gzh03cGjGGaHkSko58PDVBrcg==
X-Gm-Gg: AYBFou2DueqVRu7ae61NSX9rSwrkL7LITln2R9qFv8Ga81X0cOlKyCUrOw/6n5ocgW8
	N+JmgNEfTnSt92QLli3zO54JrnHHuJNQZLs/sxOqn0BfCTggsx0d2iu2ZlAtLrjwiqdrjygwR+w
	VcG8/DDAaUf55brt7dwPk5jwZTCNSOoozlwgToAWUgfa79DLs1hMSOUtjjgNHb/XeizrjZKnLzV
	ZcwXS8bNoTAy/wK4arWRtSRsiX8sFlSaXlr1z+yCPyFNhGKrqWLnDZy/0Gsupp09EjTduF9rmQE
	IZz4cNhmJ9cCBhf654576qTYh7PGN36Q2BTo+aE+wec/Hqtgss0xzWStEq+IIWWq1JLC6ZPjB4X
	cM77VLshR372w25G/BzBp2VxKFQxwlI8DOKBJ8VDb3xdLSXY9Uk+NjKB9tLMD0sOTGInpT0vMpC
	czbsV9ANgmUyLXv6/j8yWKcOAiUfyt67GFEGfmS0MXaQiITMkW
X-Received: by 2002:a05:690c:e00e:20b0:8b0:e13c:2858 with SMTP id
 00721157ae682-8b1340b8ffemr25681867b3.92.1792688452096; Thu, 22 Oct 2026
 10:00:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com>
 <20261020041340.447727-1-lucasadramalho@gmail.com> <20261020041340.447727-4-lucasadramalho@gmail.com>
In-Reply-To: <20261020041340.447727-4-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:00:40 -0300
X-Gm-Features: AclHuK9mNsktyYQTZRGse5bMK6lowPsYx1tHVuYkI7kw2250T2-nr76kGdpmr2k
Message-ID: <CAMAsx6e+PmKi06raBbpSdt9=960MhUGTL8K3qFviZRinrPUnAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: translations: pt_BR: Translate stable-kernel-rules.rst
To: lucasadramalho@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:13 AM Lucas Adryell Ramalho
<lucasadramalho@gmail.com> wrote:

Hi Lucas,

Thanks for switching to the pt_BR_submittingpatches and
pt_BR_securitybugs labels, both resolve correctly now. I found one
sentence where the meaning got inverted:

> +uma equivalente seja aplic=C3=A1vel, tenha sido enviada ou j=C3=A1 estej=
a presente em
> +todas as =C3=A1rvores stable mais novas que ainda recebem suporte. Isso =
evita
> +regress=C3=B5es que os usu=C3=A1rios poderiam encontrar ao atualizar. Po=
r exemplo,
> +uma corre=C3=A7=C3=A3o integrada para 5.19-rc1 poderia ser portada para
> +5.10.y, mas n=C3=A3o para 5.15.y.

The original says:

This is meant to prevent regressions that users might later
encounter on updating, if e.g. a fix merged for 5.19-rc1 would be
backported to 5.10.y, but not to 5.15.y.

In the English text the example describes the situation that causes
the regression (a fix backported to an older tree but missing from a
newer one). As translated, it reads as if this were allowed. Something
like this keeps the original meaning:

Isso evita regress=C3=B5es que os usu=C3=A1rios poderiam encontrar ao
atualizar caso, por exemplo, uma corre=C3=A7=C3=A3o integrada no 5.19-rc1
fosse portada para o 5.10.y, mas n=C3=A3o para o 5.15.y.

Thanks,
Daniel


Em ter., 20 de out. de 2026 =C3=A0s 01:14, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate the stable kernel rules documentation into Brazilian Portuguese=
.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../pt_BR/process/stable-kernel-rules.rst     | 258 ++++++++++++++++++
>  2 files changed, 259 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/stable-kerne=
l-rules.rst
>
> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documen=
tation/translations/pt_BR/process/index.rst
> index 31704e28d..29f6c7735 100644
> --- a/Documentation/translations/pt_BR/process/index.rst
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -63,6 +63,7 @@ Estas s=C3=A3o as regras pelas quais tentamos viver na =
comunidade do kernel
>     Declara=C3=A7=C3=A3o de Aplica=C3=A7=C3=A3o do Kernel Linux <kernel-e=
nforcement-statement>
>     Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement=
>
>     A interface de drivers do kernel Linux <stable-api-nonsense>
> +   Tudo o que voc=C3=AA sempre quis saber sobre as vers=C3=B5es est=C3=
=A1veis do Linux <stable-kernel-rules>
>     Estilo de gerenciamento do kernel Linux <management-style>
>     Diretrizes para pesquisadores <researcher-guidelines>
>     Assistentes de c=C3=B3digo <coding-assistants>
> diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules=
.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> new file mode 100644
> index 000000000..201c87150
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> @@ -0,0 +1,258 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_BR_stable_kernel_rules:
> +
> +Tudo o que voc=C3=AA sempre quis saber sobre as vers=C3=B5es est=C3=A1ve=
is do Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Regras sobre quais tipos de corre=C3=A7=C3=B5es s=C3=A3o aceitos na =C3=
=A1rvore "-stable" e
> +quais n=C3=A3o s=C3=A3o:
> +
> +- A corre=C3=A7=C3=A3o, ou uma equivalente, j=C3=A1 deve existir na linh=
a principal do
> +  Linux (upstream).
> +- Deve estar obviamente correta e ter sido testada.
> +- N=C3=A3o pode ter mais de 100 linhas, incluindo o contexto.
> +- Deve seguir as regras de
> +  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst
> +  <pt_BR_submittingpatches>`.
> +- Deve corrigir um erro real que afete as pessoas ou apenas adicionar um=
 ID
> +  de dispositivo. Em mais detalhes, o primeiro caso inclui:
> +
> +  - Corrigir um problema como um oops, travamento, corrup=C3=A7=C3=A3o d=
e dados,
> +    problema real de seguran=C3=A7a, peculiaridade de hardware, erro de
> +    compila=C3=A7=C3=A3o (exceto itens CONFIG_BROKEN) ou algum problema =
do tipo "isso
> +    n=C3=A3o =C3=A9 nada bom".
> +  - Problemas graves relatados por usu=C3=A1rios de um kernel de distrib=
ui=C3=A7=C3=A3o
> +    tamb=C3=A9m podem ser considerados se as corre=C3=A7=C3=B5es resolve=
rem um problema
> +    not=C3=A1vel de desempenho ou interatividade. Como essas corre=C3=A7=
=C3=B5es n=C3=A3o s=C3=A3o
> +    t=C3=A3o =C3=B3bvias e apresentam maior risco de causar uma regress=
=C3=A3o sutil, elas
> +    s=C3=B3 devem ser enviadas pelo mantenedor do kernel da distribui=C3=
=A7=C3=A3o e
> +    devem incluir um complemento com um link para uma entrada no Bugzill=
a,
> +    se houver, e informa=C3=A7=C3=B5es adicionais sobre o impacto perceb=
ido pelo
> +    usu=C3=A1rio.
> +  - N=C3=A3o s=C3=A3o aceitos problemas do tipo "isto pode ser um proble=
ma...", como
> +    uma "condi=C3=A7=C3=A3o de corrida te=C3=B3rica", a menos que tamb=
=C3=A9m seja fornecida
> +    uma explica=C3=A7=C3=A3o de como o erro pode ser explorado.
> +  - N=C3=A3o s=C3=A3o aceitas corre=C3=A7=C3=B5es "triviais" sem benef=
=C3=ADcio para os usu=C3=A1rios
> +    (altera=C3=A7=C3=B5es ortogr=C3=A1ficas, limpeza de espa=C3=A7os em =
branco etc.).
> +
> +
> +Procedimento para enviar corre=C3=A7=C3=B5es =C3=A0 =C3=A1rvore -stable
> +----------------------------------------------------
> +
> +.. note::
> +
> +   Corre=C3=A7=C3=B5es de seguran=C3=A7a n=C3=A3o devem ser tratadas exc=
lusivamente pelo
> +   processo de revis=C3=A3o -stable; devem seguir os procedimentos em
> +   :ref:`Documentation/translations/pt_BR/process/security-bugs.rst
> +   <pt_BR_securitybugs>`.
> +
> +H=C3=A1 tr=C3=AAs op=C3=A7=C3=B5es para enviar uma altera=C3=A7=C3=A3o =
=C3=A0s =C3=A1rvores -stable:
> +
> +1. Adicionar uma "stable tag" =C3=A0 descri=C3=A7=C3=A3o de uma corre=C3=
=A7=C3=A3o que ser=C3=A1 enviada
> +   para inclus=C3=A3o na linha principal.
> +2. Pedir =C3=A0 equipe stable que inclua uma corre=C3=A7=C3=A3o j=C3=A1 =
integrada =C3=A0 linha
> +   principal.
> +3. Enviar =C3=A0 equipe stable uma corre=C3=A7=C3=A3o equivalente a uma =
altera=C3=A7=C3=A3o j=C3=A1
> +   integrada =C3=A0 linha principal.
> +
> +As se=C3=A7=C3=B5es abaixo descrevem cada op=C3=A7=C3=A3o em mais detalh=
es.
> +
> +A :ref:`pt_BR_option_1` =C3=A9 **fortemente** preferida; =C3=A9 a op=C3=
=A7=C3=A3o mais f=C3=A1cil e
> +mais comum.
> +A :ref:`pt_BR_option_2` destina-se principalmente a altera=C3=A7=C3=B5es=
 para as
> +quais o backport n=C3=A3o foi considerado no momento do envio.
> +A :ref:`pt_BR_option_3` =C3=A9 uma alternativa =C3=A0s op=C3=A7=C3=B5es =
anteriores quando uma
> +corre=C3=A7=C3=A3o integrada =C3=A0 linha principal precisa de ajustes p=
ara ser aplicada
> +a s=C3=A9ries mais antigas (por exemplo, devido a altera=C3=A7=C3=B5es n=
a API).
> +
> +Ao usar a op=C3=A7=C3=A3o 2 ou 3, voc=C3=AA pode pedir que sua altera=C3=
=A7=C3=A3o seja inclu=C3=ADda em
> +s=C3=A9ries stable espec=C3=ADficas. Nesse caso, certifique-se de que a =
corre=C3=A7=C3=A3o ou
> +uma equivalente seja aplic=C3=A1vel, tenha sido enviada ou j=C3=A1 estej=
a presente em
> +todas as =C3=A1rvores stable mais novas que ainda recebem suporte. Isso =
evita
> +regress=C3=B5es que os usu=C3=A1rios poderiam encontrar ao atualizar. Po=
r exemplo,
> +uma corre=C3=A7=C3=A3o integrada para 5.19-rc1 poderia ser portada para
> +5.10.y, mas n=C3=A3o para 5.15.y.
> +
> +.. _pt_BR_option_1:
> +
> +Op=C3=A7=C3=A3o 1
> +*******
> +
> +Para que uma corre=C3=A7=C3=A3o enviada para inclus=C3=A3o na linha prin=
cipal seja
> +selecionada automaticamente depois pelas =C3=A1rvores stable, adicione e=
sta
> +etiqueta =C3=A0 se=C3=A7=C3=A3o de assinaturas (sign-off)::
> +
> +  Cc: stable@vger.kernel.org
> +
> +Use ``Cc: stable@kernel.org`` em vez disso ao corrigir vulnerabilidades
> +ainda n=C3=A3o divulgadas: isso reduz a chance de expor acidentalmente a
> +corre=C3=A7=C3=A3o ao p=C3=BAblico por meio do 'git send-email', pois as=
 mensagens
> +enviadas a esse endere=C3=A7o n=C3=A3o s=C3=A3o entregues.
> +
> +Depois que a corre=C3=A7=C3=A3o for integrada =C3=A0 linha principal, el=
a ser=C3=A1 aplicada =C3=A0
> +=C3=A1rvore stable sem que o autor ou o mantenedor do subsistema precise=
 fazer
> +mais nada.
> +
> +Para enviar instru=C3=A7=C3=B5es adicionais =C3=A0 equipe stable, use um=
 coment=C3=A1rio em
> +linha no estilo do shell para passar observa=C3=A7=C3=B5es arbitr=C3=A1r=
ias ou
> +predefinidas:
> +
> +* Especifique pr=C3=A9-requisitos adicionais para a sele=C3=A7=C3=A3o po=
r cherry-pick::
> +
> +    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
> +    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit new=
idle
> +    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity l=
ogic
> +    Cc: <stable@vger.kernel.org> # 3.3.x
> +    Signed-off-by: Ingo Molnar <mingo@elte.hu>
> +
> +  A sequ=C3=AAncia de etiquetas indica que se deve executar::
> +
> +    git cherry-pick a1f84a3
> +    git cherry-pick 1b9508f
> +    git cherry-pick fd21073
> +    git cherry-pick <this commit>
> +
> +  Observe que, em uma s=C3=A9rie de corre=C3=A7=C3=B5es, n=C3=A3o =C3=A9=
 necess=C3=A1rio listar como
> +  pr=C3=A9-requisitos as corre=C3=A7=C3=B5es que fazem parte da pr=C3=B3=
pria s=C3=A9rie. Por
> +  exemplo, nesta s=C3=A9rie::
> +
> +    patch1
> +    patch2
> +
> +  patch2 depende de patch1, mas n=C3=A3o =C3=A9 necess=C3=A1rio listar p=
atch1 como
> +  pr=C3=A9-requisito de patch2 se voc=C3=AA j=C3=A1 tiver marcado patch1=
 para inclus=C3=A3o no
> +  stable.
> +
> +* Indique os pr=C3=A9-requisitos de vers=C3=A3o do kernel::
> +
> +    Cc: <stable@vger.kernel.org> # 3.3.x
> +
> +  A etiqueta indica que se deve executar::
> +
> +    git cherry-pick <this commit>
> +
> +  em cada =C3=A1rvore -stable a partir da vers=C3=A3o especificada.
> +
> +  Observe que essa etiqueta =C3=A9 desnecess=C3=A1ria se a equipe stable=
 puder
> +  deduzir as vers=C3=B5es apropriadas a partir das etiquetas Fixes:.
> +
> +* Adiar a inclus=C3=A3o de corre=C3=A7=C3=B5es::
> +
> +    Cc: <stable@vger.kernel.org> # after -rc3
> +
> +* Aponte problemas conhecidos::
> +
> +    Cc: <stable@vger.kernel.org> # see patch description, needs adjustme=
nts for <=3D 6.3
> +
> +Tamb=C3=A9m h=C3=A1 uma variante da etiqueta stable que pode ser usada p=
ara fazer com
> +que as ferramentas de backport da equipe stable (por exemplo, AUTOSEL ou
> +scripts que procuram commits com uma etiqueta 'Fixes:') ignorem uma
> +altera=C3=A7=C3=A3o::
> +
> +     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be p=
resent
> +
> +.. _pt_BR_option_2:
> +
> +Op=C3=A7=C3=A3o 2
> +*******
> +
> +Se a corre=C3=A7=C3=A3o j=C3=A1 tiver sido integrada =C3=A0 linha princi=
pal, envie um e-mail
> +para stable@vger.kernel.org com o assunto da corre=C3=A7=C3=A3o, o ID do=
 commit, o
> +motivo pelo qual voc=C3=AA acredita que ela deve ser aplicada e as vers=
=C3=B5es do
> +kernel =C3=A0s quais deve ser aplicada.
> +
> +.. _pt_BR_option_3:
> +
> +Op=C3=A7=C3=A3o 3
> +*******
> +
> +Depois de verificar que a corre=C3=A7=C3=A3o segue as regras acima, envi=
e-a para
> +stable@vger.kernel.org e indique as vers=C3=B5es do kernel =C3=A0s quais=
 deseja que
> +ela seja aplicada. Nesse caso, voc=C3=AA deve indicar o ID do commit ups=
tream no
> +registro de altera=C3=A7=C3=B5es do envio, em uma linha separada acima d=
o texto do
> +commit, assim::
> +
> +  commit <sha1> upstream.
> +
> +Ou, alternativamente::
> +
> +  [ Upstream commit <sha1> ]
> +
> +Se a corre=C3=A7=C3=A3o enviada diferir da corre=C3=A7=C3=A3o upstream o=
riginal (por exemplo,
> +porque precisou ser adaptada =C3=A0 API mais antiga), isso deve ser docu=
mentado
> +e justificado com muita clareza na descri=C3=A7=C3=A3o da corre=C3=A7=C3=
=A3o.
> +
> +
> +Acompanhamento do envio
> +-----------------------
> +
> +O remetente receber=C3=A1 um ACK quando a corre=C3=A7=C3=A3o for aceita =
na fila, ou um NAK
> +se for rejeitada. Essa resposta pode levar alguns dias, dependendo da
> +disponibilidade dos membros da equipe stable.
> +
> +Se for aceita, a corre=C3=A7=C3=A3o ser=C3=A1 adicionada =C3=A0 fila -st=
able para revis=C3=A3o por
> +outros desenvolvedores e pelo mantenedor do subsistema relevante.
> +
> +
> +Ciclo de revis=C3=A3o
> +----------------
> +
> +- Quando os mantenedores -stable decidirem iniciar um ciclo de revis=C3=
=A3o, as
> +  corre=C3=A7=C3=B5es ser=C3=A3o enviadas ao comit=C3=AA de revis=C3=A3o=
, ao mantenedor da =C3=A1rea
> +  afetada pela corre=C3=A7=C3=A3o (a menos que o remetente seja o manten=
edor dessa
> +  =C3=A1rea) e em c=C3=B3pia (CC:) para a lista de discuss=C3=A3o linux-=
kernel.
> +- O comit=C3=AA de revis=C3=A3o tem 48 horas para aprovar (ACK) ou rejei=
tar (NAK) a
> +  corre=C3=A7=C3=A3o.
> +- Se um membro do comit=C3=AA rejeitar a corre=C3=A7=C3=A3o ou membros d=
a lista
> +  linux-kernel apresentarem obje=C3=A7=C3=B5es levantando problemas que =
os
> +  mantenedores e os membros n=C3=A3o perceberam, a corre=C3=A7=C3=A3o se=
r=C3=A1 removida da
> +  fila.
> +- As corre=C3=A7=C3=B5es aprovadas ser=C3=A3o publicadas novamente como =
parte de uma
> +  vers=C3=A3o candidata (-rc), para serem testadas por desenvolvedores e
> +  testadores.
> +- Geralmente =C3=A9 publicada apenas uma vers=C3=A3o -rc. No entanto, se=
 houver
> +  problemas pendentes, algumas corre=C3=A7=C3=B5es poder=C3=A3o ser modi=
ficadas ou
> +  removidas, ou outras poder=C3=A3o ser adicionadas =C3=A0 fila. Nesse c=
aso, vers=C3=B5es
> +  -rc adicionais ser=C3=A3o publicadas e testadas at=C3=A9 que nenhum pr=
oblema seja
> +  encontrado.
> +- =C3=89 poss=C3=ADvel responder =C3=A0s vers=C3=B5es -rc na lista de di=
scuss=C3=A3o enviando um
> +  e-mail "Tested-by:" com as informa=C3=A7=C3=B5es de teste desejadas. A=
s etiquetas
> +  "Tested-by:" ser=C3=A3o reunidas e adicionadas ao commit de lan=C3=A7a=
mento.
> +- Ao final do ciclo de revis=C3=A3o, a nova vers=C3=A3o -stable ser=C3=
=A1 lan=C3=A7ada com
> +  todas as corre=C3=A7=C3=B5es enfileiradas e testadas.
> +- Corre=C3=A7=C3=B5es de seguran=C3=A7a ser=C3=A3o aceitas diretamente n=
a =C3=A1rvore -stable pela
> +  equipe de seguran=C3=A7a do kernel e n=C3=A3o passar=C3=A3o pelo ciclo=
 normal de
> +  revis=C3=A3o. Entre em contato com a equipe de seguran=C3=A7a do kerne=
l para saber
> +  mais sobre esse procedimento.
> +
> +
> +=C3=81rvores
> +-------
> +
> +- As filas de corre=C3=A7=C3=B5es, tanto das vers=C3=B5es conclu=C3=ADda=
s quanto das vers=C3=B5es em
> +  andamento, podem ser encontradas em:
> +
> +    https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.=
git
> +
> +- As vers=C3=B5es finalizadas e identificadas por tags de todos os kerne=
ls
> +  est=C3=A1veis podem ser encontradas em ramifica=C3=A7=C3=B5es separada=
s por vers=C3=A3o em:
> +
> +    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> +
> +- As vers=C3=B5es candidatas de todas as vers=C3=B5es do kernel stable p=
odem ser
> +  encontradas em:
> +
> +    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git/
> +
> +  .. warning::
> +     A =C3=A1rvore -stable-rc =C3=A9 um instant=C3=A2neo da =C3=A1rvore =
stable-queue e muda com
> +     frequ=C3=AAncia; por isso, =C3=A9 rebaseada frequentemente. Ela dev=
e ser usada
> +     apenas para testes (por exemplo, por sistemas de integra=C3=A7=C3=
=A3o cont=C3=ADnua).
> +
> +
> +Comit=C3=AA de revis=C3=A3o
> +-----------------
> +
> +- =C3=89 formado por v=C3=A1rios desenvolvedores do kernel que se volunt=
ariaram para
> +  essa tarefa e por alguns que n=C3=A3o se voluntariaram.
> --
> 2.55.0
>
