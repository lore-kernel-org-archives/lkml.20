Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792847672;
	b=ibgsPwCkOZqEg4z3wbih5ObNxU73p2PplVLEEy5S763u6/tPpB/taVIsEjf9WLAxL5gc
	 f454h82QcbROEJa33kUCbSHa0u8qyakMdohlNmFT0SjGi76BF5f94zdAT0tn8SFIhScr/
	 iK9hXhPpTrpEI7B+Ktxluqqoj5SgPhR87gmqp/hguJNsEzOfVwMmhaLhL8bJmVwydNcs8
	 1cETPMDcq4W5RfINRYU/u/IsQfjaryVETDXV6X9+pJH30Gx2ltH85oQUfzSOY+XfG/k+9
	 GVT7USWQKFYV+ZFPHZh4hAX9fGZrjOoGztBg/v2Vm/IJ5xpp8LRTxND7cPRlC2TuFnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CMqMc3sz71Og6LxWQWCEwXYQNGi1cYjnt3qdjDLrC/k=;
	b=OKUyt86QOVamr6bNarjwTzVkibTc8As1ZunnUnjVcLrWuJOpCAiZDrAuVrdCihKVhKKf
	 Ta8rD9Y+rmPUWeDnGgSUNyLppDZgYy0iP92oRkVi/gNXk+mUt4s1tWYY1wjItLXH2AdUz
	 Sy3ZybxFJ/oJ3TFyoVYGmRSy5YdwHUOlUyMuy5ssRrBGyT6A+tK7gc+Qgg1XNtNtbBmNY
	 aK+CNI+9jOwJxEYINgXB48voD5gUUF9+OdlyPcT+aFxPI4VOfLq7QgOegbLD8BCXhr4q2
	 JsLeIuHQ7D5FPyU40pN8VD0WcfmT7VFckruIKGWakJQbRlRd2v678MneErMJM4dsRwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVgx4w0D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE387606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE387606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVgx4w0D
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b83459526so20841826d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792847670; cv=none;
        d=google.com; s=arc-20260327;
        b=PQistdkP9pGUFFa6zAjKcbEmmwplOzmN+MHF3D68djIw3COEgZN/XuL9zvqZaKonV+
         fA/Xw/2Kl/aaY8d7E3/9JOnfYxfxw4FTkpBQQOsX/RKq9uLCbPY9VNARWhKRzjOn7wIx
         wh/7De6hcq+0fOT5dt952Ysto8uU0EGqmO1OyxbA3pAuVTc1DouX4McqdkGaV4ClKNQK
         BohbFOFZnqUvMZ5ruhfVX6ThBWP3qqBBs+hY8vr+NLUfDnLO0aDtou3RwwcC22rfNWK1
         a+SFFZoZBa4nLiu/9AqEfOtvpU1S4MxgGdU2F9V95yiQ/y5iz5Kd2lsfpPOmxCn6lIDg
         tg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CMqMc3sz71Og6LxWQWCEwXYQNGi1cYjnt3qdjDLrC/k=;
        fh=tla31m/mG2RP6YVwWz6crYpjFchjb/ZWzTX4pe1SlbQ=;
        b=K/hemPGBXYbzAE4F1vHZNZc9iGNpgHikI/OiNwWPJnsKb7GVoZSvrdMWYV1CFPjkiW
         qT7e2ZkLIB1uXKkTP+895R/Dwe9vzOgk9SJCBvKRHI1MQKUj+J1lKRGEiMfzpXIpWURt
         QS7a4PSeCQB2rUveflXtGH7wQKEBjs/BnradoC7MkED24Ss+9+9hYh08We0wdZkMXpEM
         yCyhe6byq/dU7LUf+x0eNUucZkMWZMrlLlvhO8UihGzY6gwrtyY3UGkOTdXQrNBiXL3v
         sS654j8D07YF2tPB0u2ArJJ1Llc+Ya6I+Ko+S5ioEUNK+fEDxWTM1GTRLKbi2nEb29Qr
         GkXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792847670; x=1793452470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMqMc3sz71Og6LxWQWCEwXYQNGi1cYjnt3qdjDLrC/k=;
        b=aVgx4w0Dj968h5veWnRWkqClr120VgdjGw4ApqRW/rHX3gtUgqx+mczuyLZxOMB6ek
         PHWZdaQwWRKSQOCvCGFQDcKmA5TCT4TqCQxhIVnldowJN/LxaLP0EoyyXv3FjHtCnNcV
         DULIecl/rGFsem0HnH9H1yRm6VhaG2ldNyG4PWewN9hjcsWMfFNlDPPew1srQjDDqBMZ
         qnn3L2gvPWLCaQ50jO9vBU5R3jZKuwUoI9iP5iCLi1Wa7T5ymqUdtWX5zroEgDPjDDBC
         zltk+/h6pHOLEKfrChCop1Yz+zzjBBE7NkRC4e5T652YlYoWIK86mWh9T/CDJgt1XQmo
         rNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847670; x=1793452470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMqMc3sz71Og6LxWQWCEwXYQNGi1cYjnt3qdjDLrC/k=;
        b=jgnc8EJMHJQ48Nt7mzrCJuWfdXWUlgRSoonMm+09xOVfdZEqyyVSBtl+23sCvfmm4+
         rzSoNEKvbvJcIDknEvnHO50NKcXYA3j4fwkBVwfoFq2veRB/X2KKeMEzxmGgTBSIMssm
         EcPaCcelTPRItEVLheC0U7DUMuFG6u8lM57847ISRiDc9Huj4B50EKYBsMvi6nGCLQ2t
         nJtfcFUzPDadyqTpF3J70uDggCng05XJ1LkLV3e6zW6+fmnMTpBypkgvvcQiJdbmYg8l
         NaKGCRZDii1XqB15i9jifzzUASaHuhpiHau0BJ3hukSnHsmh1g5ZFMI6sQyCyR2rzoxl
         vjcA==
X-Forwarded-Encrypted: i=1; AKwUvByTrAlE4JiwCThkFnFruK0yhlSMV0W5lrvE0pP5JCl5fIvSXAjDPoiq7W1NZn9H4LDOMWOrPX9GOiMxz1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqDgJtWoQlMqV1RYom4SSohySrqHUUJVQBXPv/4+Hcw3XUAkGH
	plHtv5d3lNuSfoQiA/b4ckbyz2jC8EIIHHrESolinKBnClR/lF2LKmcZ5sFFoB7ng6m3m2EmQU2
	7H5tlQzqik3h6oQ91w502XuxFhxoo7xg=
X-Gm-Gg: AYBFou2T26qgPJQwpQ/uHSI2/8D4s8uWCADkZPuQjojS3GqXybxerj68thrhXYbcotD
	g9finGCeuKLNljcTARHhgyDsheHHR6+XwCv3XoOZLxbeGGK4uPcANYd4GlwNCvqqDNPPXC1QD94
	c8A7zHKgNQVLABPclj7cI0wGN8e13kvX2e+c6IVcpJYtRSabXwgVkjhTGfD6q+7As9S+r1Az+gH
	tOJuCxnOQYliLx+aYs0IEAUaP+Rmc4SLaDekDdcnpB0DMy3EfTSQp8e7KfEYWUdu2GP7iPg5Hmx
	uoijemHfMYXXWjj5lWobJfIfZ5YMhBprBuhAUAbhX7mQ9lfHB7wHr6IiMbikVn8mwhdiP010H2J
	1aBm6eakHzx8R5TJgH2yrOClCl8IAhCeWYVgthtAE9tkpHYBjO16jLWETmDl1M8BuPT8O11XeAc
	X+/2xdBu9k48r2pknOvcGBSR3QMGhGGXe0fZvBTmgAq2pKLg687w==
X-Received: by 2002:a05:6214:5001:b0:912:61e2:8817 with SMTP id
 6a1803df08f44-91c48e5ad6emr28352346d6.28.1792847670316; Sat, 24 Oct 2026
 06:14:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 24 Oct 2026 10:14:18 -0300
X-Gm-Features: AclHuK92MH7B0UMxhmSiWAciED7CjQbrPDzGUWd708h6k_j-i4lp2CNODivijc0
Message-ID: <CAMAsx6f7qita5jZDdT7EXR8UOGxbUB8z8w-q7dNuZc2QN7vAvQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate programming-language.rst
To: ic.gabrielribeiro@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 12:48 -0300, Gabriel Ribeiro wrote:
> Translate the programming language guide and link it from the pt_BR
> process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Use translation-specific labels for the page and all citations.
> - Drop the obsolete Assisted-by trailer.

Thanks for the v2, Gabriel. Both comments from v1 are addressed, and
it builds without new warnings.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>


Em qui., 22 de out. de 2026 =C3=A0s 12:49, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the programming language guide and link it from the pt_BR
> process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Use translation-specific labels for the page and all citations.
> - Drop the obsolete Assisted-by trailer.
>
>  .../translations/pt_BR/process/index.rst      |  1 +
>  .../pt_BR/process/programming-language.rst    | 64 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/programming-=
language.rst
>
> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documen=
tation/translations/pt_BR/process/index.rst
> index d072f7e46..ccfe86de2 100644
> --- a/Documentation/translations/pt_BR/process/index.rst
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -39,6 +39,7 @@ devem estar familiarizados.
>     :maxdepth: 1
>
>     Requisitos m=C3=ADnimos <changes>
> +   Linguagem de programa=C3=A7=C3=A3o <programming-language>
>     Estilo de codifica=C3=A7=C3=A3o do kernel Linux <coding-style>
>     Informa=C3=A7=C3=B5es sobre clientes de email para Linux <email-clien=
ts>
>     Como aplicar patches <applying-patches>
> diff --git a/Documentation/translations/pt_BR/process/programming-languag=
e.rst b/Documentation/translations/pt_BR/process/programming-language.rst
> new file mode 100644
> index 000000000..91fc1a553
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/programming-language.rst
> @@ -0,0 +1,64 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_BR_programming_language:
> +
> +Linguagem de programa=C3=A7=C3=A3o
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O kernel Linux =C3=A9 escrito na linguagem de programa=C3=A7=C3=A3o C [p=
t-c-language]_.
> +Mais precisamente, o kernel costuma ser compilado com ``gcc`` [pt-gcc]_
> +usando ``-std=3Dgnu11`` [pt-gcc-c-dialect-options]_, que seleciona o dia=
leto
> +GNU do padr=C3=A3o ISO C11. ``clang`` [pt-clang]_ tamb=C3=A9m =C3=A9 sup=
ortado; consulte
> +a documenta=C3=A7=C3=A3o sobre
> +:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.
> +
> +Esse dialeto cont=C3=A9m muitas extens=C3=B5es =C3=A0 linguagem [pt-gnu-=
extensions]_,
> +muitas das quais s=C3=A3o usadas rotineiramente no kernel.
> +
> +Atributos
> +----------
> +
> +Os atributos [pt-gcc-attribute-syntax]_ est=C3=A3o entre as extens=C3=B5=
es mais
> +comuns usadas em todo o kernel. Eles permitem introduzir sem=C3=A2ntica
> +definida pela implementa=C3=A7=C3=A3o em entidades da linguagem (como va=
ri=C3=A1veis,
> +fun=C3=A7=C3=B5es ou tipos), sem exigir mudan=C3=A7as sint=C3=A1ticas si=
gnificativas
> +na linguagem (por exemplo, a adi=C3=A7=C3=A3o de uma nova palavra-chave)=
 [pt-n2049]_.
> +
> +Em alguns casos, os atributos s=C3=A3o opcionais (isto =C3=A9, um compil=
ador que
> +n=C3=A3o os suporte ainda deve gerar c=C3=B3digo correto, mesmo que o pr=
ograma
> +resultante seja mais lento ou o compilador realize menos verifica=C3=A7=
=C3=B5es e
> +diagn=C3=B3sticos em tempo de compila=C3=A7=C3=A3o).
> +
> +O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de
> +usar diretamente a sintaxe de atributos do GNU (por exemplo,
> +``__attribute__((__pure__))``), para detectar quais atributos s=C3=A3o
> +suportados e/ou encurtar o c=C3=B3digo.
> +
> +Consulte ``include/linux/compiler_attributes.h`` para mais informa=C3=A7=
=C3=B5es.
> +
> +Rust
> +----
> +
> +O kernel oferece suporte =C3=A0 linguagem de programa=C3=A7=C3=A3o Rust =
[pt-rust-language]_
> +quando a op=C3=A7=C3=A3o ``CONFIG_RUST`` est=C3=A1 habilitada. O c=C3=B3=
digo Rust =C3=A9 compilado
> +com ``rustc`` [pt-rustc]_ usando ``--edition=3D2021`` [pt-rust-editions]=
_. As
> +edi=C3=A7=C3=B5es permitem introduzir pequenas mudan=C3=A7as na linguage=
m que n=C3=A3o s=C3=A3o
> +compat=C3=ADveis com vers=C3=B5es anteriores.
> +
> +Al=C3=A9m disso, alguns recursos inst=C3=A1veis [pt-rust-unstable-featur=
es]_ s=C3=A3o usados
> +no kernel. Esses recursos podem mudar no futuro; portanto, =C3=A9 import=
ante
> +chegar a um ponto em que apenas recursos est=C3=A1veis sejam usados.
> +
> +Consulte Documentation/rust/index.rst para mais informa=C3=A7=C3=B5es.
> +
> +.. [pt-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [pt-gcc] https://gcc.gnu.org
> +.. [pt-clang] https://clang.llvm.org
> +.. [pt-gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Diale=
ct-Options.html
> +.. [pt-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.h=
tml
> +.. [pt-gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribut=
e-Syntax.html
> +.. [pt-n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [pt-rust-language] https://www.rust-lang.org
> +.. [pt-rustc] https://doc.rust-lang.org/rustc/
> +.. [pt-rust-editions] https://doc.rust-lang.org/edition-guide/editions/
> +.. [pt-rust-unstable-features] https://github.com/Rust-for-Linux/linux/i=
ssues/2
> --
> 2.56.0
>
