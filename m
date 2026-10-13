Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DD4EFFB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895371; cv=none; b=XoiC/WNFs1x5bi32YJDCMbOoLIK0/tMN8JaxhBuVc+i2gXc+MP+LC64Zv/RWULjOPhxeZOH4Nui9Tb7bezXAoJPwuLhZ82B0Vi5nWtGxhSaV6fyhkeOPSvUTlMDOy/uB9f7QBdsgA2zxXdz9z5BC/D4BdjIaaVaYh4n/3UymKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895371; c=relaxed/simple;
	bh=hdFB8LFPXWyIZSylDf/W0o1jW5biARsiuLvHlALkbCI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qn5YnZ8miQb3ON8RRYC2JIKB7sSl2cKj49WAaJtcBwu8O6zB3c2fNlWdWa0wQ49c+ZcNRlFLScklyOZfcZC5ZQrXPiTLIagxo++CGIBtjmk6zQ9g9PCx5h5dwcAEIoQhqHa+nXSAdPKGA/5Dy7tCx9e6r3f2z4nli9C5feMyKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Bh5G8P+e; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Bh5G8P+e"
X-KPN-MessageId: 96430166-c703-11f1-9e93-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.191])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 96430166-c703-11f1-9e93-005056999439;
	Tue, 13 Oct 2026 14:42:44 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 964188c7-c703-11f1-924d-00505699891e;
	Tue, 13 Oct 2026 14:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=b2uAf8M994Vozldw3JvSqfWMACLwwyKIXxLdvkGLQjE=;
	b=Bh5G8P+eKMo7pwbfsC2jFrf50De7j1lzln2YLtrUeKpm5KqQm2kzaaBEb5L7uKB+yGBVW8l4UVEcz
	 c6SRDYQKKMzs4O5D+9G2VTNNbosKn00ycZAZvgqet7f57ieGpiWDqosxn3HUgQU41WAdfwcMckezF/
	 NAmbFdkPjQVAmBP29v+xoP4jzJrht/CgU1wGbBNCroMzIZqW+dz4OO4uN5ZmRkD67QnL1OZRfRToj+
	 KfUr09EzOXwrRKVx2BIpDE9mixqDNXL9wGI4egidpNW8+Xs4FYgpiM0OPNI2V+fGetMIeLUxif27HM
	 7RTZhT/4WT7tW/HE2qMirr3/olpAjQg==
X-KPN-MID: 33|Cl48us//v/e7WSVffM5AC5Fzzg5fhmUI8AjQ4mwEuwCsDNQk7E3vnMWseApbcUK
 H/EPOWv0zSF48q81m/5WXM0lHFOdTnj83Hh0P6p4lm/M=
X-CMASSUN: 33|Tyyc/izeq0Hs6cnz6ZDQ25YT0ho//ULGI69K9RnKyPFpXb2Crv9BfZX1DHmxMLI
 ZsyfvLY3dGT5C3UsgECtvPw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 963234af-c703-11f1-8edd-00505699eff2;
	Tue, 13 Oct 2026 14:42:44 +0200 (CEST)
Date: Tue, 13 Oct 2026 14:42:44 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <1364640638.783917.1791895364386@kpc.webmail.kpnmail.nl>
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal


> Op 13-10-2026 14:15 CEST schreef Sasha Levin <sashal@kernel.org>:
>=20
> =20
> Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") aske=
d
> contributors to add an Assisted-by tag to patches developed with help fro=
m an
> LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") =
later
> reduced the tag to "Assisted-by: LLM".
>=20
> A proposal to drop the tag was turned down in July [1]. The main argument=
 for
> keeping it was that maintainers wanted a signal that a patch was LLM-assi=
sted,
> so that they could review it accordingly.
>=20
> The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of =
the
> 18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, wh=
ile
> actual LLM use is far more widespread. Some contributors do not know abou=
t the
> rule, others leave the tag off on purpose, and few maintainers ask about =
it. As
> a result, the tag does not provide the signal it was kept for: its absenc=
e says
> nothing about how a patch was made, and for developers who use these tool=
s for
> almost everything, its presence says little more. The choice was between
> finding a way to enforce the requirement and dropping it, and there was a
> strong, though not unanimous, consensus in the room to drop it. Greg
> Kroah-Hartman, who argued for keeping the tag in July, supports removing =
it now
> [3].
>=20
> Maintainers do still want to know how a patch was created, but the view a=
t the
> Summit was that this belongs in the cover letter, where it can describe h=
ow the
> tools were used, rather than in the changelog.
> Documentation/process/generated-content.rst already asks contributors to =
be
> transparent about tool use and is not changed here. The rules on the DCO =
and on
> the submitter's responsibility for the patch stay as they are.
>=20
> Remove the Assisted-by sections from coding-assistants.rst,
> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditi=
onal
> Chinese translations, and drop the handling of the tag from checkpatch.
>=20
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@greg=
kh/
> [2] https://lwn.net/Articles/1099594/
> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
>=20
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes in v2:
> - Expand the changelog with the background and the Maintainers Summit
>   discussion (Laurent, Krzysztof, Greg, Lorenzo).
> - Rebase on docs-next and also remove the Assisted-by sections from the
>   pt_BR and zh_TW translations there.
> - Collect tags.
>=20
> v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
>=20
>  Documentation/process/coding-assistants.rst   | 21 +------------------
>  Documentation/process/submitting-patches.rst  | 10 ---------
>  .../it_IT/process/submitting-patches.rst      | 10 ---------
>  .../pt_BR/process/coding-assistants.rst       | 20 ------------------
>  .../pt_BR/process/submitting-patches.rst      | 10 ---------
>  .../zh_TW/process/submitting-patches.rst      |  7 -------
>  scripts/checkpatch.pl                         | 11 ----------
>  7 files changed, 1 insertion(+), 88 deletions(-)
>=20
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/=
process/coding-assistants.rst
> index 051f0d819f68e..509dbf23a099b 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -40,24 +40,6 @@ is responsible for:
>  * Adding their own Signed-off-by tag to certify the DCO
>  * Taking full responsibility for the contribution
> =20
> -Attribution
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -When AI tools contribute to kernel development, proper attribution
> -helps track the evolving role of AI in the development process.
> -Contributions should include an Assisted-by tag in the following format:=
:
> -
> -  Assisted-by: LLM [TOOL1] [TOOL2]
> -
> -* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
> -  (e.g., coccinelle, sparse, smatch, clang-tidy)
> -
> -Basic development tools (git, gcc, make, editors) should not be listed.
> -
> -Example::
> -
> -  Assisted-by: LLM coccinelle sparse
> -
>  Procedure for finding and fixing bugs
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -82,8 +64,7 @@ these steps:
>     another one. The fix must not add build warnings and must pass the
>     checkpatch.pl checks (see submitting-patches.rst).
>  6. Commit the working fix with a detailed message describing the problem=
, the
> -   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
> -   Assisted-by tag, as described above.
> +   solution and a Fixes tag. Do not add a Signed-off-by tag.
>  7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>     Documentation/process/security-bugs.rst shows how to do that.
>  8. Indicate what could not be done. If the fix could not be built or tes=
ted, or
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 4c28a239e8cb5..f271d7413f72c 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -632,16 +632,6 @@ bugzilla.kernel.org is a public place in this sense,=
 but email addresses
>  used there are private; so do not expose them in tags, unless the person
>  used them in earlier contributions.
> =20
> -Using Assisted-by:
> -------------------
> -
> -If you used any sort of advanced coding tool in the creation of your pat=
ch,
> -you need to acknowledge that use by adding an Assisted-by tag.  Failure =
to
> -do so may impede the acceptance of your work.  Please see
> -Documentation/process/coding-assistants.rst for details regarding the
> -acknowledgment of coding assistants.
> -
> -
>  .. _the_canonical_patch_format:
> =20
>  The canonical patch format
> diff --git a/Documentation/translations/it_IT/process/submitting-patches.=
rst b/Documentation/translations/it_IT/process/submitting-patches.rst
> index a742610cb0709..d0e0d6c9ecc2e 100644
> --- a/Documentation/translations/it_IT/process/submitting-patches.rst
> +++ b/Documentation/translations/it_IT/process/submitting-patches.rst
> @@ -691,16 +691,6 @@ un luogo pubblico, ma gli indirizzi email usati l=C3=
=AC sono privati; quindi non
>  esponeteli nelle etichette, a meno che la persona non li abbia gi=C3=A0 =
usati in
>  contributi precedenti.
> =20
> -Usare Assisted-by:
> --------------------
> -
> -Se avete usato un qualsiasi tipo di strumento di assistenza avanzata all=
a
> -scrittura del codice per la creazione della vostra patch, dovete darne a=
tto
> -aggiungendo un'etichetta Assisted-by.  Non farlo pu=C3=B2 ostacolare
> -l'accettazione del vostro lavoro.  Fate riferimento a
> -Documentation/process/coding-assistants.rst per i dettagli su come dare
> -atto dell'uso di assistenti alla scrittura del codice.
> -
>  .. _it_the_canonical_patch_format:
> =20
>  Il formato canonico delle patch
> diff --git a/Documentation/translations/pt_BR/process/coding-assistants.r=
st b/Documentation/translations/pt_BR/process/coding-assistants.rst
> index 2055af34a9081..f6062b22a8fd8 100644
> --- a/Documentation/translations/pt_BR/process/coding-assistants.rst
> +++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
> @@ -38,23 +38,3 @@ A pessoa que envia =C3=A9 respons=C3=A1vel por:
>  * Garantir conformidade com os requisitos de licen=C3=A7a
>  * Acrescentar sua pr=C3=B3pria tag Signed-off-by para certificar o DCO
>  * Assumir toda responsabilidade pela contribui=C3=A7=C3=A3o
> -
> -Atribui=C3=A7=C3=B5es
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Quando ferramentas de IA contribu=C3=ADrem para o desenvolvimento do ker=
nel,
> -a atribui=C3=A7=C3=A3o adequada ajuda a rastrear a fun=C3=A7=C3=A3o da I=
A no processo de
> -desenvolvimento. Contribui=C3=A7=C3=B5es devem incluir a tag de assist=
=C3=AAncia seguindo este
> -formato::
> -
> -    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]
> -
> -* ``[FERRAMENTA1] [FERRAMENTA2]`` s=C3=A3o ferramentas de an=C3=A1lise e=
specializada
> -    opcionais (Exemplo: coccinelle, sparse, smatch, clang-tidy)
> -
> -Ferramentas b=C3=A1sicas de desenvolvimento (git, gcc, make, editors) n=
=C3=A3o s=C3=A3o
> -listadas.
> -
> -Exemplo::
> -
> -  Assisted-by: LLM coccinelle sparse
> \ No newline at end of file
> diff --git a/Documentation/translations/pt_BR/process/submitting-patches.=
rst b/Documentation/translations/pt_BR/process/submitting-patches.rst
> index aad926c17fb45..4d1e75935745b 100644
> --- a/Documentation/translations/pt_BR/process/submitting-patches.rst
> +++ b/Documentation/translations/pt_BR/process/submitting-patches.rst
> @@ -650,16 +650,6 @@ bugzilla.kernel.org =C3=A9 um local p=C3=BAblico nes=
se sentido, mas os endere=C3=A7os de e-m
>  usados l=C3=A1 s=C3=A3o privados; portanto, n=C3=A3o os exponha em tags,=
 a menos que a pessoa
>  os tenha usado em contribui=C3=A7=C3=B5es anteriores.
> =20
> -Usando Assisted-by:
> --------------------
> -
> -Se voc=C3=AA usou qualquer tipo de ferramenta avan=C3=A7ada de codifica=
=C3=A7=C3=A3o na cria=C3=A7=C3=A3o do seu patch,
> -voc=C3=AA precisa reconhecer esse uso adicionando uma tag Assisted-by. A=
 falha em
> -fazer isso pode impedir a aceita=C3=A7=C3=A3o do seu trabalho. Por favor=
, veja
> -Documentation/process/coding-assistants.rst para detalhes sobre o
> -reconhecimento de assistentes de codifica=C3=A7=C3=A3o.
> -
> -
>  .. _pt_BR_the_canonical_patch_format:
> =20
>  O formato can=C3=B4nico do patch
> diff --git a/Documentation/translations/zh_TW/process/submitting-patches.=
rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
> index b780f1539b46b..4a7c046b23894 100644
> --- a/Documentation/translations/zh_TW/process/submitting-patches.rst
> +++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
> @@ -503,13 +503,6 @@ Fixes: =E6=8C=87=E7=A4=BA=E8=A3=9C=E4=B8=81=E4=BF=AE=
=E5=BE=A9=E4=BA=86=E4=B9=8B=E5=89=8D=E6=8F=90=E4=BA=A4=E4=B8=AD=E7=9A=84=E4=
=B8=80=E5=80=8B=E7=BC=BA=E9=99=B7=E3=80=82=E5=AE=83=E5=8F=AF=E4=BB=A5=E4=BE=
=BF=E6=96=BC=E7=A2=BA
>  =E7=9A=84=E3=80=82=E6=B3=A8=E6=84=8F=EF=BC=8C=E5=B0=B1=E6=AD=A4=E8=80=8C=
=E8=A8=80bugzilla.kernel.org=E6=98=AF=E5=85=AC=E9=96=8B=E5=A0=B4=E6=89=80=
=EF=BC=8C=E4=BD=86=E5=85=B6=E4=B8=AD=E4=BD=BF=E7=94=A8=E7=9A=84=E9=9B=BB=E5=
=AD=90=E9=83=B5=E4=BB=B6=E5=9C=B0=E5=9D=80
>  =E6=98=AF=E7=A7=81=E5=AF=86=E7=9A=84=EF=BC=9B=E5=9B=A0=E6=AD=A4=E4=B8=8D=
=E8=A6=81=E5=9C=A8=E6=A8=99=E7=B1=A4=E4=B8=AD=E6=9A=B4=E9=9C=B2=E5=AE=83=E5=
=80=91=EF=BC=8C=E9=99=A4=E9=9D=9E=E8=A9=B2=E4=BA=BA=E5=9C=A8=E5=85=88=E5=89=
=8D=E7=9A=84=E8=B2=A2=E7=8D=BB=E4=B8=AD=E4=BD=BF=E7=94=A8=E9=81=8E=E3=80=82
> =20
> -=E4=BD=BF=E7=94=A8Assisted-by:
> -----------------
> -
> -=E5=A6=82=E6=9E=9C=E6=82=A8=E5=9C=A8=E5=BB=BA=E7=AB=8B=E8=A3=9C=E4=B8=81=
=E7=9A=84=E9=81=8E=E7=A8=8B=E4=B8=AD=E4=BD=BF=E7=94=A8=E4=BA=86=E4=BB=BB=E4=
=BD=95=E9=80=B2=E9=9A=8E=E7=B7=A8=E7=A2=BC=E5=B7=A5=E5=85=B7=EF=BC=8C=E6=82=
=A8=E9=9C=80=E8=A6=81=E9=80=8F=E9=81=8E=E6=B7=BB=E5=8A=A0Assisted-by
> -=E6=A8=99=E7=B1=A4=E4=BE=86=E8=81=B2=E6=98=8E=E9=80=99=E4=B8=80=E4=BD=BF=
=E7=94=A8=E3=80=82=E4=B8=8D=E9=80=99=E6=A8=A3=E5=81=9A=E5=8F=AF=E8=83=BD=E6=
=9C=83=E5=A6=A8=E7=A4=99=E6=82=A8=E7=9A=84=E5=B7=A5=E4=BD=9C=E8=A2=AB=E6=8E=
=A5=E5=8F=97=E3=80=82=E9=97=9C=E6=96=BC=E8=81=B2=E6=98=8E=E7=B7=A8=E7=A2=BC=
=E5=8A=A9=E6=89=8B=E7=9A=84
> -=E7=B4=B0=E7=AF=80=EF=BC=8C=E8=AB=8B=E5=8F=83=E8=A6=8B Documentation/pro=
cess/coding-assistants.rst =E3=80=82
> -
>  .. _tw_the_canonical_patch_format:
> =20
>  =E6=A8=99=E6=BA=96=E8=A3=9C=E4=B8=81=E6=A0=BC=E5=BC=8F
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8a7787d228a63..c9840f5219c2a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -655,7 +655,6 @@ our $signature_tags =3D qr{(?xi:
>  =09Reviewed-by:|
>  =09Reported-by:|
>  =09Suggested-by:|
> -=09Assisted-by:|
>  =09To:|
>  =09Cc:
>  )};
> @@ -3124,16 +3123,6 @@ sub process {
>  =09=09=09=09}
>  =09=09=09}
> =20
> -=09=09=09# Assisted-by uses a free-form value (e.g. "LLM"), not an
> -=09=09=09# email address, so skip the email format checks below.
> -=09=09=09if ($sign_off =3D~ /^Assisted-by:/i) {
> -=09=09=09=09if ($email =3D~ /^\s*$/) {
> -=09=09=09=09=09WARN("BAD_SIGN_OFF",
> -=09=09=09=09=09     "Assisted-by requires a value\n" . $herecurr);
> -=09=09=09=09}
> -=09=09=09=09next;
> -=09=09=09}
> -
>  =09=09=09my ($email_name, $name_comment, $email_address, $comment) =3D p=
arse_email($email);
>  =09=09=09my $suggested_email =3D format_email(($email_name, $name_commen=
t, $email_address, $comment));
>  =09=09=09if ($suggested_email eq "") {
>=20
> base-commit: 8fdbd353e6928492fdc46c359aabd2bfb7630fba
> --=20
> 2.53.0

Reviewed-by: Jori Koolstra <jkoolstra@xs4all.nl>

I only now see we have this document already:
https://docs.kernel.org/process/generated-content.html . I must
have missed it. It does address a lot of my concerns, maybe it would
be good to have a one or two line summary on the "AI Coding Assistants"
as well, but that is a different matter.
