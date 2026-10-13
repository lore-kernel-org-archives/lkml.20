Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04134F68CD;
	Tue, 13 Oct 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893950; cv=none; b=EVSQH7gi1Rq6EBIrrX6AXDR+8W+9jzwf/UELjstlLO/ONC41bPy1zM5tKAq5E0Vcrf0/1SvmQZwYDIG8DsC3FIJXKRrYR2huEEuHAzsB+SWX9pOpfAwgaHvZ7Ru8JYvK1pGIT4MrmWKM+m6u/wlD4g/J2k5qQ+RfWx+KDklb3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893950; c=relaxed/simple;
	bh=RE71m9BJ3z1oXB8Dh+MHhFepLvhXvbIgqGNN3nQMjw0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7Hmp4A82/2EGZCJGTFXHNmNCGwvXRBjmPDCu9OfLhcJSbvG/tta+efHdJU1P8t2kSuPfGSnElpgussmb+rdZhdcBtYqc7GFos8fiwa/OMPyGO9PZ74L08Kyjp8y+gbRXN7TkDUnxYJx6fNwOQuOXhq/SY6ONi8S1BQxd94stVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S84x0rJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S84x0rJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A721F000FF;
	Tue, 13 Oct 2026 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791893948;
	bh=DKGBLHvmNquVCJpQQtV77cuVj8yX7o32xCprwv1RKOI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=S84x0rJqEi/sFKxfF5Fut578AkS6Pt5xVrmgu5f+SZ5g3hh76yfSNZIFb/N0F30QI
	 uzL7k9tyJO4vRIQjXaQfs2kkwErcnOhV1TmTyPZmYjjWwxHqE543NCt7sNbvC2QYBP
	 leInB8ho0lKL6dqU+lzmuYPIMZ8oBp0Mi6bRIIwJsVpGl3JYBRDP21GGYWMBHIbIHR
	 LYPENe3vrZNbAkCGcHWHuU5702v9rW60BCzojK5wEtRS6ZFZQlt5U63BTVLvgqfokr
	 w++r1I6taEVzNY0EP9qWT2Tt2eGHCP2i06zPQxzXZ0IBNKS8xHzUB/Hjkvxq0iLu4o
	 Qwy/qb+U54klw==
Message-ID: <cb8d2d385d958537c97a3eebf705deb19f145d77.camel@kernel.org>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
From: Jeff Layton <jlayton@kernel.org>
To: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>,  Federico Vaga <federico.vaga@vaga.pv.it>, Daniel
 Pereira <danielmaraboo@gmail.com>, Chen-Yu Yeh	 <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>, Dongliang Mu	 <dzm91@hust.edu.cn>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches	 <joe@perches.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Krzysztof Kozlowski	
 <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes	
 <ljs@kernel.org>, Kees Cook <kees@kernel.org>, Jori Koolstra
 <jkoolstra@xs4all.nl>,  Christian Brauner	 <brauner@kernel.org>, David
 Hildenbrand <david@kernel.org>, Vlastimil Babka	 <vbabka@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Christoph Hellwig	 <hch@infradead.org>, Mark
 Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,  Brian Foster
 <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>, David Disseldorp
 <ddiss@suse.de>,  Jani Nikula <jani.nikula@intel.com>, Justin Stitt
 <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 08:19:04 -0400
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-10-13 at 08:15 -0400, Sasha Levin wrote:
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
>  	Reviewed-by:|
>  	Reported-by:|
>  	Suggested-by:|
> -	Assisted-by:|
>  	To:|
>  	Cc:
>  )};
> @@ -3124,16 +3123,6 @@ sub process {
>  				}
>  			}
> =20
> -			# Assisted-by uses a free-form value (e.g. "LLM"), not an
> -			# email address, so skip the email format checks below.
> -			if ($sign_off =3D~ /^Assisted-by:/i) {
> -				if ($email =3D~ /^\s*$/) {
> -					WARN("BAD_SIGN_OFF",
> -					     "Assisted-by requires a value\n" . $herecurr);
> -				}
> -				next;
> -			}
> -
>  			my ($email_name, $name_comment, $email_address, $comment) =3D parse_e=
mail($email);
>  			my $suggested_email =3D format_email(($email_name, $name_comment, $em=
ail_address, $comment));
>  			if ($suggested_email eq "") {
>=20
> base-commit: 8fdbd353e6928492fdc46c359aabd2bfb7630fba

<Chef's kiss>

Reviewed-by: Jeff Layton <jlayton@kernel.org>
