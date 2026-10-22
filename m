Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688390;
	b=YwPLzfxuV581+AWqqRbuUUJIZqqqpnVD113AI1ZpY7scCYkZzs/4Sfib90R/QyEQyXlJ
	 oeuOH7AsCnnfgsl/UczvCdaTRjo+6biuOp00y14/0MotK8q45GZJbxcUoKsecavvkKcMc
	 k0LPsEydWYOMGlHlyww5+7mZqiJ1mXyGoAw1e2S5jOQelF9qh1XpVQI8Qs8HuJri9yVxp
	 qrpkSkE2hWosVL3f3v2X7dI0kbOF8LVUtl+evJO1r2cN2Yvah2Pl8XGNy9Fzu9j2kLSOc
	 uc5LTd/tO8YNZvUDskjdg/HY7rlPBr/818vUH/k3fOEZ9ocyn/iBqlXksRW0x5Vr61A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U+nlvB24WiJ5Xsx9BG9draeOtG3TWuMTEr6ho6sWv1Y=;
	b=jq66IW0kPkoOvK2UCqJAVHCXiZpuj1X+4K4mtv1jMnxR/NEwcJu5bqZq7+gSmIxvKq1h
	 rznV1HuLeHgwMh3UVWTScsOAfoLKJKePpfQu7KJgwE9Szk74ykRS7XLKj9DeaVl67ehdG
	 8lE8nYUC+fVut+75N1dlIO7NdSjhe+bTUWsTQl4Hi0gi8SHBz9cWgGKcjRs6Dstz9M6iw
	 dozIQmQLXSlRT/zRFxMMNc/xPGK19v30sHKlKQrl2uGQ9eCSRHrERdfAY9ya42EmU3mgI
	 +3cS8A4WSXcxh1Qn6d9RAq5ObpGn+L6WZICBgYl+n5glTVMZH9uTnBLxsfLeatDTBHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ndJONazM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ndJONazM
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e503815adso199848085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688388; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7HwjGLPjBDBVQ8GpbZSrMJK8AyC1nELMsYr9U6Q8RgMaZ+uFZhKL2DvMPJdWU2Zsf
         GxwB4YxxmZRSob2adAjbjOoobgZyH8nzbdnh/ILVf+b02INZ5U6/pooTEzOYIwtE+TVW
         D/lJzleDQViS8oodAYQkdf1ndKbC0cP2hvxO0q3s+gG5M0ixFHFZoB46ZdpE8CE8EV+F
         BrwXj6/eR88FXk3JZ9pB3S+6pxeOW6cg1hQJp6dwf2Bn+azdPJDMudxGD1ZjLObbSQNC
         H0flUQVps3LQh/68mo0Vv/I/efaLw88f7+FfmCzraz9bMtkU+Wjmw+VS9vXWbIZ71JMN
         BABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U+nlvB24WiJ5Xsx9BG9draeOtG3TWuMTEr6ho6sWv1Y=;
        fh=CFy6Q9cKS+Ui4opxlwwd+SmlkHNt+0eqaY0V5oiX1bM=;
        b=OZBY3cIjafkwv8PKw4VnAE6YQ4fk2NOJjO/hHM4XwyQffsFefaGsRzR0u/ie5zabgv
         Gy3ICcHzEoVRPMv4J5YPTlW3e++Tb6i7iE+SlO6u46OfQsKo2nmAjpynjzZoy63oehOq
         2br2d0w6SsI1fVdiug+RB3Zgt+h6oJ8/HnRC0s3aLDTp19ZwtKfYxyM8l3eX50YuM/Ro
         mdH8ogJx5qjolTcEbpcHKjlAoMtqprVCC+m14HcnwBo1cNKlMfPFJfI4B1tQiqHd/LX2
         Yg++ti9OTDLpAgZgnq2r/hjoZBFqfoiUYMI/Q1JjA+GdGzOj4p4IGPriC4Ld6itYg1Sz
         7aBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688388; x=1793293188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+nlvB24WiJ5Xsx9BG9draeOtG3TWuMTEr6ho6sWv1Y=;
        b=ndJONazMc+De+lIs2ueXthRDG7m7DtFl4stLLXladZgfotO5Mq3Yjn/95k1PJfdlBf
         NAptIFu8R6xVp81WKm7qpk68Z4PI6etcNkqgLvlu+gDiiw82YCWSV7oshjSKUBkxwsEC
         59FDt03bOucyeD1AdCaAybdOtG3BqMSLi3xEzju849TFRuoiaqBLNU4bbg92cAqz5vfK
         szwIySNH1dhRcQc47LrS6U5D0XtPMAK/tDzUXzOMb5L9NxTnO6CfXOf393McrXjTZmp+
         +GBcOt0Q+69KNg26gh/YcCOC6iopp74oLInx1fjQwsSciqSge9EK7ejhJTsnqdg25ANn
         jq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688388; x=1793293188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+nlvB24WiJ5Xsx9BG9draeOtG3TWuMTEr6ho6sWv1Y=;
        b=mTdyesiPuNT06OzhNBFY5YKk3nez4/OXo6Mj0xVtFq7GMIT/nKBpj6u/se2IpcW5Xb
         MLh5TF559/XPZDfT7kjtEDl4fm6Kh6AcRsjEQ59+0c8cSDIPLixLbZvj5TI3aXxF8GpA
         +A4plrs//5jT3LJ6Eiei2uV6ZZPIhi5XI44TQN2E4VrkPPQIjLnYKSHkBFHcTajzrm6v
         cwBhvKU+8P8Yvzu3q7NqFpONwNYNsgGVBZh1yEgIkdCEuLZTdxN75CCpv3mDlhmTlERR
         vjWbFaXV0GRxUhcDzeyL+UH5bmUAp3lTO5aM1w9XeC/W98PryxlWrxrePiM5waBVfP8A
         qe3w==
X-Forwarded-Encrypted: i=1; AKwUvBx18XMcmCVrQUkG0vGohUPrU8xx9Jy3ba6gNJAIfhF0mDpSLK0YS1rxX2/9UpW+qMfqdJ/LJH0rCAkFdtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFvaDUCdAJj1HH8eqnyWg8aNQMJRgNvyQZUzsmF+IbLtzPM6we
	mDKvH6nJAxCt7C3x9dMVVJUxesDFwc9VmRuR3TuWz5U6whk94WTCU2CFX85QS3jwpovgvU7/0mf
	W0ODt9ur7ehS/AzqIooIz2LdUrsibyYM=
X-Gm-Gg: AYBFou0sj8l+IzRnUVSxfx5rL7eBww33jtIuD1XiE9xtu2OEsGaletYQRz2UZA1K33E
	cZ1zWR1YhqgteRCq2+YRxSyqajJRr6d9U7dKP9IoXdaHIGacwtiXzPP3l9UeGeHijqKevsO9Kpn
	9ITOzIki4lBfECtTybOXmV+TVFrqrroDv/RE2Wsw0BPPRe4WVW70UmWL9mOnX/5rwX4MBmVVXbu
	g5GQMyrMUpqkW6iD6UVhli0Nex7BKL6j7Hr5Kd9JwqeOZ7wrOgcN1MgDQ9s2TjLcb312STZETqp
	1uSF/UjS7qAAUttAJH363qMIaVZmbQLjzcpWQXLJ5ApOfrb7ofDzJ32rBpgjLxBHUYsHEeytjfP
	of3b17jj50NPQUQ90IoQRze2n9tJJF6/1FroaPDTaXXViqR7gYRFtEj1TuHtuJAwuHmLlUAM2j+
	MZochsLXqEzz9fTrFm3tZy3BDPtCJJS87sHtaUi5Klg+N04LE+
X-Received: by 2002:a05:620a:3184:b0:93f:4921:6965 with SMTP id
 af79cd13be357-93f6f7e4a5bmr9929285a.61.1792688388313; Thu, 22 Oct 2026
 09:59:48 -0700 (PDT)
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
 <20261020041340.447727-1-lucasadramalho@gmail.com> <20261020041340.447727-2-lucasadramalho@gmail.com>
In-Reply-To: <20261020041340.447727-2-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 13:59:36 -0300
X-Gm-Features: AclHuK9-CF7oQZhUU4snvH-gx30nPhn1nt8rxRQ0w55Maen2nixC1mUAAQ1Ww0o
Message-ID: <CAMAsx6eVreK6xWbBR6ixn7JCCFA4YMDPB8HJP3SiSUVKwVe-xQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] docs: translations: pt_BR: process: add driver_development_debugging_guide
To: lucasadramalho@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:13 AM Lucas Adryell Ramalho
<lucasadramalho@gmail.com> wrote:

Hi Lucas,

Thanks for the v2, the "registradores" change looks good. I built the
full documentation tree with this series applied and found one issue
in this patch, plus two small nits.

> +Simples printk()
> +~~~~~~~~~~~~~~~~

Nit: "printk() simples" reads more naturally in Portuguese.

> +Com esses arquivos, =C3=A9 poss=C3=ADvel armazenar valores de vari=C3=A1=
veis ou gerar
> +dumps de registradores/mem=C3=B3ria, ou ainda tornar esses arquivos grav=
=C3=A1veis e modificar
> +valores/configura=C3=A7=C3=B5es no driver.

Nit: after the v2 change this line is 84 columns long, please rewrap
it to stay within 80 columns.

> +Interfaces do devcoredump
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/linux/devcoredump.h
> +
> +.. kernel-doc:: drivers/base/devcoredump.c

These two kernel-doc directives document the same C functions that the
English document already documents, so "make htmldocs" now reports 7
new warnings:

WARNING: Duplicate C declaration, also defined at
translations/pt_BR/process/debugging/driver_development_debugging_guide:102=
.

(and the same for lines 256, 280, 293, 320, 343 and 449).

Please drop both directives and point readers to the original
document instead, for example:

A documenta=C3=A7=C3=A3o das interfaces est=C3=A1 dispon=C3=ADvel na
:doc:`vers=C3=A3o original em ingl=C3=AAs
</process/debugging/driver_development_debugging_guide>`.

Thanks,
Daniel


Em ter., 20 de out. de 2026 =C3=A0s 01:14, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate the driver debugging guide and update debugging/index.rst.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../driver_development_debugging_guide.rst    | 244 ++++++++++++++++++
>  .../pt_BR/process/debugging/index.rst         |   6 +-
>  2 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/process/debugging/dr=
iver_development_debugging_guide.rst
>
> diff --git a/Documentation/translations/pt_BR/process/debugging/driver_de=
velopment_debugging_guide.rst b/Documentation/translations/pt_BR/process/de=
bugging/driver_development_debugging_guide.rst
> new file mode 100644
> index 000000000..a5c318821
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/debugging/driver_developme=
nt_debugging_guide.rst
> @@ -0,0 +1,244 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Orienta=C3=A7=C3=B5es de depura=C3=A7=C3=A3o para o desenvolvimento de d=
rivers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Este documento serve como ponto de partida e refer=C3=AAncia geral para =
a
> +depura=C3=A7=C3=A3o de drivers de dispositivos.
> +Enquanto este guia se concentra na depura=C3=A7=C3=A3o que exige recompi=
lar o
> +m=C3=B3dulo ou o kernel, o :doc:`guia de depura=C3=A7=C3=A3o em espa=C3=
=A7o de usu=C3=A1rio
> +</process/debugging/userspace_debugging_guide>` orienta sobre ferramenta=
s
> +como depura=C3=A7=C3=A3o din=C3=A2mica, Ftrace e outras ferramentas =C3=
=BAteis para investigar
> +problemas e analisar comportamentos.
> +Para orienta=C3=A7=C3=B5es gerais sobre depura=C3=A7=C3=A3o, consulte o
> +:doc:`guia geral de depura=C3=A7=C3=A3o </process/debugging/index>`.
> +
> +.. contents::
> +    :depth: 3
> +
> +As se=C3=A7=C3=B5es a seguir mostram as ferramentas dispon=C3=ADveis.
> +
> +printk() e amigos
> +-----------------
> +
> +Esses derivados de printf() podem enviar mensagens a destinos diferentes=
 e
> +podem ser ativados ou desativados dinamicamente, quando h=C3=A1 suporte =
para isso.
> +
> +Simples printk()
> +~~~~~~~~~~~~~~~~
> +
> +O m=C3=A9todo cl=C3=A1ssico =C3=A9 simples e pode ser muito =C3=BAtil pa=
ra desenvolver m=C3=B3dulos
> +rapidamente ou extrair dados necess=C3=A1rios para investigar problemas.
> +
> +Pr=C3=A9-requisito: ``CONFIG_PRINTK`` (geralmente habilitado por padr=C3=
=A3o)
> +
> +**Pr=C3=B3s**:
> +
> +- N=C3=A3o h=C3=A1 necessidade de aprender nada, simples de usar
> +- F=C3=A1cil de adaptar =C3=A0s suas necessidades, incluindo a formata=
=C3=A7=C3=A3o dos dados
> +  (consulte :doc:`/core-api/printk-formats`) e a visibilidade no log
> +- Pode causar atrasos na execu=C3=A7=C3=A3o do c=C3=B3digo (ben=C3=A9fic=
o para confirmar se o
> +  tempo =C3=A9 um fator)
> +
> +**Contras**:
> +
> +- Requer reconstru=C3=A7=C3=A3o do kernel/m=C3=B3dulo
> +- Pode causar atrasos na execu=C3=A7=C3=A3o do c=C3=B3digo (o que pode f=
azer com que os
> +  problemas n=C3=A3o sejam reproduz=C3=ADveis)
> +
> +Para a documenta=C3=A7=C3=A3o completa, consulte :doc:`/core-api/printk-=
basics`.
> +
> +trace_printk()
> +~~~~~~~~~~~~~~
> +
> +Pr=C3=A9-requisito: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace=
.h>``
> +
> +=C3=89 um pouco menos confort=C3=A1vel de usar que printk(), porque as m=
ensagens devem
> +ser lidas no arquivo de rastreamento (consulte :ref:`read_ftrace_log`),
> +em vez de no log do kernel. Ainda assim, =C3=A9 muito =C3=BAtil quando p=
rintk() causa
> +atrasos indesejados na execu=C3=A7=C3=A3o do c=C3=B3digo, tornando os pr=
oblemas intermitentes
> +ou dif=C3=ADceis de reproduzir.
> +
> +Se isso ainda causar problemas de temporiza=C3=A7=C3=A3o, tente trace_pu=
ts().
> +
> +Para a documenta=C3=A7=C3=A3o completa, consulte trace_printk().
> +
> +dev_dbg
> +~~~~~~~
> +
> +Chamada de depura=C3=A7=C3=A3o que pode ser controlada por
> +:ref:`process/debugging/userspace_debugging_guide:dynamic debug` e inclu=
i
> +informa=C3=A7=C3=B5es adicionais sobre o dispositivo associado.
> +
> +**Quando =C3=A9 apropriado manter uma mensagem de depura=C3=A7=C3=A3o no=
 c=C3=B3digo?**
> +
> +
> +As mensagens de depura=C3=A7=C3=A3o permanentes devem ajudar o desenvolv=
edor a investigar
> +problemas no funcionamento do driver. Avaliar quais mensagens s=C3=A3o =
=C3=BAteis =C3=A9 mais
> +uma arte do que uma ci=C3=AAncia, mas algumas diretrizes est=C3=A3o nas
> +:ref:`Diretrizes de estilo de codifica=C3=A7=C3=A3o
> +<translations/pt_BR/process/coding-style:13) Imprimindo mensagens do ker=
nel>`.
> +Em quase todos os casos, as mensagens de depura=C3=A7=C3=A3o n=C3=A3o de=
vem ser enviadas
> +ao upstream, pois um driver funcional deve ser silencioso.
> +
> +printk personalizado
> +~~~~~~~~~~~~~~~~~~~~
> +
> +Exemplo::
> +
> +  #define core_dbg(fmt, arg...) do { \
> +         if (core_debug) \
> +                 printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
> +         } while (0)
> +
> +**Quando voc=C3=AA deve fazer isso?**
> +
> +=C3=89 melhor usar pr_debug(), que pode ser ativado ou desativado poster=
iormente
> +com a depura=C3=A7=C3=A3o din=C3=A2mica. Al=C3=A9m disso, muitos drivers=
 ativam essas mensagens
> +por meio de uma vari=C3=A1vel como ``core_debug``, definida por um par=
=C3=A2metro do
> +m=C3=B3dulo. No entanto, os par=C3=A2metros de m=C3=B3dulo `n=C3=A3o s=
=C3=A3o mais recomendados
> +<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
> +
> +Ftrace
> +------
> +
> +Criando um ponto de rastreamento Ftrace personalizado
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Um ponto de rastreamento adiciona um gancho ao seu c=C3=B3digo que ser=
=C3=A1 chamado e
> +registrado quando o ponto de rastreamento estiver ativado. Isso pode ser=
 usado,
> +por exemplo, para rastrear a execu=C3=A7=C3=A3o de um ramo condicional o=
u para gerar um
> +dump do estado interno em pontos espec=C3=ADficos do fluxo do c=C3=B3dig=
o durante uma
> +sess=C3=A3o de depura=C3=A7=C3=A3o.
> +
> +Aqui est=C3=A1 uma descri=C3=A7=C3=A3o b=C3=A1sica de
> +:ref:`como implementar novos pontos de rastreamento
> +<trace/tracepoints:usage>`.
> +
> +Para a documenta=C3=A7=C3=A3o completa sobre rastreamento de eventos, co=
nsulte
> +:doc:`/trace/events`.
> +
> +Para a documenta=C3=A7=C3=A3o completa do Ftrace, consulte :doc:`/trace/=
ftrace`.
> +
> +DebugFS
> +-------
> +
> +Pr=C3=A9-requisito: ``CONFIG_DEBUG_FS`` e ``#include <linux/debugfs.h>``
> +
> +O DebugFS difere das outras abordagens de depura=C3=A7=C3=A3o, pois n=C3=
=A3o grava mensagens
> +no log do kernel nem adiciona rastros ao c=C3=B3digo. Em vez disso, perm=
ite que o
> +desenvolvedor gerencie um conjunto de arquivos.
> +Com esses arquivos, =C3=A9 poss=C3=ADvel armazenar valores de vari=C3=A1=
veis ou gerar
> +dumps de registradores/mem=C3=B3ria, ou ainda tornar esses arquivos grav=
=C3=A1veis e modificar
> +valores/configura=C3=A7=C3=B5es no driver.
> +
> +Poss=C3=ADveis casos de uso, entre outros:
> +
> +- Armazenar valores de registradores
> +- Acompanhar vari=C3=A1veis
> +- Armazenar erros
> +- Armazenar configura=C3=A7=C3=B5es
> +- Ativar ou desativar uma configura=C3=A7=C3=A3o, como o modo de depura=
=C3=A7=C3=A3o
> +- Inje=C3=A7=C3=A3o de erros
> +
> +Isso =C3=A9 especialmente =C3=BAtil quando o tamanho de um dump de dados=
 dificultaria
> +sua an=C3=A1lise como parte do log geral do kernel (por exemplo, ao desp=
ejar dados
> +brutos de um fluxo de bits) ou quando voc=C3=AA n=C3=A3o precisa acompan=
har todos os
> +valores continuamente, mas quer poder inspecion=C3=A1-los quando necess=
=C3=A1rio.
> +
> +A ideia geral =C3=A9:
> +
> +- Criar um diret=C3=B3rio durante a execu=C3=A7=C3=A3o do ``probe`` (``s=
truct dentry *parent =3D
> +  debugfs_create_dir("my_driver", NULL);``)
> +- Criar um arquivo:
> +
> +  ``debugfs_create_u32("my_value", 444, parent, &my_variable);``
> +
> +  - Neste exemplo, o arquivo est=C3=A1 localizado em
> +    ``/sys/kernel/debug/my_driver/my_value`` (com permiss=C3=B5es de lei=
tura para
> +    usu=C3=A1rio/grupo/outros)
> +  - Qualquer leitura do arquivo retornar=C3=A1 o conte=C3=BAdo atual da =
vari=C3=A1vel
> +    ``my_variable``
> +
> +- Limpe o diret=C3=B3rio ao remover o dispositivo
> +  (``debugfs_remove(parent);``)
> +
> +Para a documenta=C3=A7=C3=A3o completa, consulte :doc:`/filesystems/debu=
gfs`.
> +
> +KASAN, UBSAN, lockdep e outros verificadores de erros
> +-----------------------------------------------------
> +
> +KASAN (Kernel Address Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Pr=C3=A9-requisito: ``CONFIG_KASAN``
> +
> +O KASAN =C3=A9 um detector din=C3=A2mico de erros de mem=C3=B3ria que aj=
uda a identificar
> +bugs de uso ap=C3=B3s libera=C3=A7=C3=A3o (*use-after-free*) e acessos f=
ora dos limites
> +(*out-of-bounds*). Ele utiliza instrumenta=C3=A7=C3=A3o em tempo de comp=
ila=C3=A7=C3=A3o para
> +verificar cada acesso =C3=A0 mem=C3=B3ria.
> +
> +Para a documenta=C3=A7=C3=A3o completa veja :doc:`/dev-tools/kasan`.
> +
> +UBSAN (Undefined Behavior Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Pr=C3=A9-requisito: ``CONFIG_UBSAN``
> +
> +O UBSAN usa instrumenta=C3=A7=C3=A3o do compilador e verifica=C3=A7=C3=
=B5es em tempo de execu=C3=A7=C3=A3o
> +para detectar comportamentos indefinidos. Ele identifica v=C3=A1rios pro=
blemas,
> +incluindo estouro de inteiro com sinal e =C3=ADndice de array fora dos l=
imites.
> +
> +Para a documenta=C3=A7=C3=A3o completa, consulte :doc:`/dev-tools/ubsan`=
.
> +
> +lockdep (Lock Dependency Validator)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Pr=C3=A9-requisito: ``CONFIG_DEBUG_LOCKDEP``
> +
> +O lockdep =C3=A9 um validador de depend=C3=AAncias de bloqueio em tempo =
de execu=C3=A7=C3=A3o que
> +detecta poss=C3=ADveis deadlocks e outros problemas relacionados a bloqu=
eios no
> +kernel. Ele rastreia a aquisi=C3=A7=C3=A3o e a libera=C3=A7=C3=A3o de bl=
oqueios, constr=C3=B3i um
> +gr=C3=A1fico de depend=C3=AAncias e o analisa em busca de poss=C3=ADveis=
 deadlocks. O lockdep
> +=C3=A9 especialmente =C3=BAtil para validar a ordem correta dos bloqueio=
s no kernel.
> +
> +PSI (Pressure stall information tracking)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Pr=C3=A9-requisito: ``CONFIG_PSI``
> +
> +O PSI =C3=A9 uma ferramenta de medi=C3=A7=C3=A3o que identifica a sobrec=
arga excessiva dos
> +recursos de hardware, capaz de causar perda de desempenho ou at=C3=A9 en=
cerramentos
> +de processos por falta de mem=C3=B3ria (OOM).
> +
> +coredump do dispositivo
> +-----------------------
> +
> +Pr=C3=A9-requisito: ``CONFIG_DEV_COREDUMP`` e ``#include <linux/devcored=
ump.h>``
> +
> +Essa infraestrutura permite que um driver envie dados arbitr=C3=A1rios a=
o espa=C3=A7o do
> +usu=C3=A1rio. Ela =C3=A9 usada com frequ=C3=AAncia em conjunto com o ude=
v ou outro aplicativo
> +de espa=C3=A7o de usu=C3=A1rio que monitore os uevents do kernel indican=
do que o dump
> +est=C3=A1 pronto. O udev pode ter regras para copiar o arquivo para arma=
zenamento e
> +an=C3=A1lise de longo prazo, pois, por padr=C3=A3o, os dados do dump s=
=C3=A3o removidos ap=C3=B3s
> +cinco minutos. Esses dados s=C3=A3o analisados com ferramentas espec=C3=
=ADficas do driver
> +ou com o GDB.
> +
> +Um coredump do dispositivo pode ser criado a partir de uma =C3=A1rea vma=
lloc, com
> +m=C3=A9todos de leitura e libera=C3=A7=C3=A3o ou como uma lista scatter/=
gather.
> +
> +Voc=C3=AA pode encontrar um exemplo de implementa=C3=A7=C3=A3o em:
> +`drivers/media/platform/qcom/venus/core.c
> +<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/=
qcom/venus/core.c#L30>`__,
> +na camada HCI do Bluetooth, em v=C3=A1rios drivers sem fio e em v=C3=A1r=
ios
> +drivers DRM.
> +
> +Interfaces do devcoredump
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/linux/devcoredump.h
> +
> +.. kernel-doc:: drivers/base/devcoredump.c
> +
> +**Copyright** =C2=A92024 : Collabora
> diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst=
 b/Documentation/translations/pt_BR/process/debugging/index.rst
> index b223fae34..5c2c73493 100644
> --- a/Documentation/translations/pt_BR/process/debugging/index.rst
> +++ b/Documentation/translations/pt_BR/process/debugging/index.rst
> @@ -7,9 +7,13 @@ Dicas de depura=C3=A7=C3=A3o para desenvolvedores do Ker=
nel Linux
>  Guias gerais
>  ------------
>
> +.. toctree::
> +   :maxdepth: 1
> +
> +   Orienta=C3=A7=C3=B5es de depura=C3=A7=C3=A3o para o desenvolvimento d=
e drivers <driver_development_debugging_guide>
> +
>  Todolist:
>
> -*   driver_development_debugging_guide
>  *   gdb-kernel-debugging
>  *   kgdb
>  *   userspace_debugging_guide
> --
> 2.55.0
>
