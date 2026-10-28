Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793215592;
	b=actIGL1XI5/yXq6Jzk2I5pS/aNweozlb3BtaFSKYfOl88nmFCK6N/oIacxfLbN5hzoe/
	 38ngFHy/ulN/zI5afU1hA1DEBQ6iMspHIFsAnki/pAS2Y0+zvliGbgP0rWaYmAOyq1Jja
	 WBabQg9xT31JDbvVLEjQPoQ6RG8bxhZPa7l4UKHlvTj+M0o/L3Z5NVMPCI28u/uuGAb5a
	 6ECqz+H/XoPAEwAGLHsflf4v/010wJpLWmk0QRkQFNyv9AlMDbwjjPESrzropjrKpEg0S
	 +2odLXfvFR3G01wyTCrHhbTt2iTgkLN/cn0PR6xLOqiak9agAmgRAa1bWEPf8dcHnBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
	b=mvsc0tkauq06Wn4ghs8A95PNgdgXgiYBnw3Pq9dfctssPPFRJLXIBjgxz2VgRPe15pr9
	 +GrwhGTzJyJA8uurXkt0yuiuxYVhead/k7GwGydwG+Pmdwp4CTkQjrMG1DiTZC1QjAozS
	 UfsF/jOWN4JFtuc0h5Tn+SdZWljsnUHHSH96LfERofAxh7V6IOD3id31n6FhmoFOHGfaU
	 GTKbHhKzTqVvhCeTiDGbyHlLRqneugI1KKD3RAX3uUY2OsrfN88mqYq0jSxJK6YqjanLU
	 heqiRtisD0ASSGtyQ8Lpyoe9HJawXrg+cVMzmziGeoxp/LGB+4y6A7iSaVsv2HJu/+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORU73yaL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB6A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB6A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORU73yaL
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1463532e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793215590; cv=none;
        d=google.com; s=arc-20260327;
        b=NyKykt6yuHkul/yX7+vZcqaM2zkPb0WxxYYOXQjzotSKfduJ+XAwiDMZ37xowSDAy1
         oH9olcvXWsWi1MJaphEthq7/BKBBlLM5XE0laBnDe2tfu5RJ6i9uhVzlUWuTuhkCzGcE
         EnuczwA8k0zUm2a+ursfqGKflTxWWTmZ2d00RNeD0ijI9QL+uTzHpIp9hYl6p/IJ7jCA
         QUlT0EJFSC1Zp6FdQDg2FmeldSCQovLgsLeXx9PEYphaeo98DN0BwNvDYLwlmqJHRP9v
         ZKdl/mzAv1BVHYc7jDqtAlgfPmWWCtLPf/DWrgtTy0ipJ8WVVuVq0I45ZvKJPLDPn/sc
         Z6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        fh=05bhx6T2652ITJTut4/aTH+vggPFVwCkUWGQNliBS3g=;
        b=QIwfLyblBiocn5qLvZ/vYQYPlyWQei+9iNXzhvF3v69zd9LaLOPndAB+aQHG6FNvCS
         UtwRxNA8ibpPKtXmjtz0Q/rO2LfrMIwyTwnPCo1UEVWckYZK4gdfNKkF8AnHRZbLSFOV
         dOyLC7NlWRZlfPpN9X7R9mK0aOJk165OLiHZbbmp8R7v9b9rhHDhs3nA83xZiAtkk0NP
         kquwMV6X0DOqRKB3TUKY8Rz/7jWeTGbOtKywai53U3V/FP7dKaCie+tU/vv92sOwk13S
         PnR3dXrARy8jvYJid912uN98kPfyASJET5O6nMw+BhrJzVuToY+X+pk8cBt6yYplQPuo
         1QBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215590; x=1793820390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        b=ORU73yaLtW5wRVH5cpaMw0E38ib3Jw2vDW0ZmCirAgqx3Tgpr3CvejRnYiVql79xlq
         43v46nR+Jxmm4easMaolaT9XTNZu+5M5HwcIyXOogeb28n1gaE18EH6stokH3i0NqQRw
         RRnc16kf0OebFj09rDU3H4qY3O55i70vdDifjoP9Mb0Jh1Zock5qQC8UfcKprVa6RGDk
         IKElMRLctZ6RLBegeIhIL+1FpA0w7eurjp0NKYgW9xCnQmgq1jKtvHSQEAwClDaY0tl1
         EGZBWspjS2CtHjnPeUhSPGGSM0txo7a63fvQZ8LPGntpS4SgT25BfWwJicb2tOgL+EL3
         XAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215590; x=1793820390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2qFxTYTj+6lAt2CEy+ze/jmH9GS4iy0PMP9lTAM1QA=;
        b=aq6FWHHbv1qfJi+VY3ybRwBrC7P5G5M81MpG2bMxyqseD9ib4Vj01MDYuZqOIdd7am
         Q6fWH2ZBYgrqr43bYJTtfSA+5GEiAw2Sn7pN+HACIMrZVFUMmL1hh1mzOHWcfmyo4eUh
         SLZWL0VUWbyHBiAYZWS0JbWeIpqSUCBV5MqRrN8iaIKDnTfcxAcL9c6MtR87cOgRQnuy
         i1CSSi3NG2hgljCplBYkoz6YCOgaNS+5d/ZF5Erw3gzNYGaRQ3Pxz5IHb6gl0Pv7WtvG
         Od6hGSEbk6jtBXZamNvE/siXbussIAyraCOBbMlNj4MF6bfI0svKsgObGDTF4rdZhw3E
         /mJg==
X-Forwarded-Encrypted: i=1; AKwUvBxvEZ4byCFESfAYp9cuWoUoF64fnf1WcP5ugGGVcSvFNtp1gCgCk3rE5Y//IbDcfAHXMz4gUZxFV90v6ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGBuWlOgrqXmaaje5XyERcKwQrgfFzm7gi3OfwCK6ocY00+N6O
	I7AoMAZtUOVoup+idDc7eFaJOVwkKeoeDGbRCrWRJzGjcBC+kVG+QAZBLk5gxgvhmZfmNLgWqaB
	dCRLowR98adu5F0f3AdZki8K3FZHElWDZTLi69fBaUMEt
X-Gm-Gg: AYBFou1ycxC4Yi5ZYtd9/9wpqa8yXRqQqlo6pJzW87Dh7P5KzPyTK5qt1d668NHci5K
	cDMFWQzuULYW5uJybGGKGYTKFa1xDu9ZiEGD9D8lSiBdyYIPyFh/i3IKe/3vBYFQEai0Kpahiq8
	/LmWt8B/jRyz25qce9NwtCzlpOrr76qHIDxes5EqPH891AWRCRvZjkAugCkItcKXMYM4N6zW/8b
	vdoai/wWd7YQKduYmfU7c/vBNVjuJKpOm7UO2Lx7CFtiQ9iz9oZE5+lpJtuD0KzPS5SoKY5hiOZ
	wpO/dVPvoCn/Sgm6a+64LcFhCC7oHw03N2iZH2exMYIsPZ6OTsvDCraY5+9eMSUz7WbXcCseDRx
	VJAXucxWGo77/nhp5EEGDeGxKet5QoDTERZhZvAiqGweBTgAKWxoM99ftEjNDIdA67fiTfR2D62
	RtCdw11efdyqkPfNUrMLAGHnMtFWv07PRRP+Gkw1vjrWBoCSM2+1sTgWC/fRBt3mZ8E39Th3bJq
	89z76uq83KvU+2SZVg+
X-Received: by 2002:a05:6512:39d4:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5bfcad7e51bmr1381844e87.15.1793215589567; Wed, 28 Oct 2026
 12:26:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028122739.5874-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261028122739.5874-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 16:26:13 -0300
X-Gm-Features: AclHuK8NspXUp5sa4f9DrpougHgahx4CAWqm7lcpujQjdYinJ2Zou8w4OpupYjk
Message-ID: <CAMAsx6e9Br5iqUGDPVrJ4forg3AV_-HXZ_32cn1rXzjE7Tb+1g@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add maintainer PGP guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026, Gabriel Ribeiro <ic.gabrielribeiro@gmail.com> wrote:

> docs: translations: pt_BR: add maintainer PGP guide
>
> Translate the maintainer PGP guide into Brazilian Portuguese and add it
> to the pt_BR process index.

Hi Gabriel,

Thanks for the patch. I applied it on top of your programming-language.rst
patch (index.rst depends on it), compared the translation against the
original, and ran a full make htmldocs. No warnings were emitted for this
file, but I found a few things, commented inline below.

Also, checkpatch warns about a commit message body line over 75 columns
(the "Translate the maintainer PGP guide ..." line quoted above). Please
wrap it. The MAINTAINERS warning can be ignored, since
Documentation/translations/pt_BR/ is already covered.

> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst

> +- Snapshots peri=C3=B3dicas de vers=C3=B5es (tarballs)

I believe it should be "peri=C3=B3dicos", since "snapshot" is masculine.

> +- Os tarballs v=C3=AAm acompanhados de assinaturas PGP destacadas.

"Separadas" sounds more natural to me for "detached signatures", but this
is a preference.

> +Desde o comprometimento de sistemas centrais do kernel.org em 2011, o
> +princ=C3=ADpio operacional do projeto Kernel Archives =C3=A9 presumir qu=
e qualquer

The original says "the main operating principle", so "principal" got
dropped here.

> +.. _pt_BR_devs_not_infra:

Same for pt_BR_pgp_tools, pt_BR_protect_your_key, pt_BR_smartcards,
pt_BR_pgp_with_git, pt_BR_kernel_identities and
pt_BR_kernel_org_trust_repository: none of these labels is referenced
anywhere in the tree. The ones that matter are pt_BR_pgpguide (document
anchor) and pt_BR_verify_identities (used by :ref:). The original has the
same unused labels, so keeping or dropping them is a matter of taste.

> +- Chaves **[S]** podem ser usadas para assinar.

(Also for the [E]/[A]/[C] items.) These end with a period and the original
ones do not. Not a problem, just a difference.

> +Use uma frase secreta forte
> +--------------------------------

The underline is longer than the title (27 vs 32 characters). RST accepts
it, but the original keeps them the same length. The same happens at
"Entenda as subchaves PGP", "Use o gpg-agent via SSH", "Crie commits
assinados" and "Instale e configure o patatt".

> +- `Nitrokey Start <pt_BR_nitrokey_start_>`_: hardware aberto e software

Instead of the embedded alias with a separate prefixed target, you can
keep the original form:

  `Nitrokey Start`_
  .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys

The pt_BR_ prefix only matters for labels used with :ref:, which are
global; hyperlink targets are local to the file. The embedded-alias form
also makes docutils report a duplicate-name INFO for "Prote=C3=A7=C3=A3o da
integridade do c=C3=B3digo", which appears twice.

> +  resistente a adultera=C3=A7=C3=B5es e com mais recursos de seguran=C3=
=A7a e formatos
> +  USB.
> +  Oferece suporte =C3=A0 criptografia de curva el=C3=ADptica (ED25519 e =
NISTP).

"USB." is left alone on a line and "Oferece suporte..." starts on the
next one; the wrapping could be adjusted.

> +``key 1`` (=C3=A9 a primeira da lista, a subchave **[E]**):
> +
> +    gpg> key 1

This one is a real bug: the paragraph is missing the "::" at the end. The
original ends with ")::". Without it, the "gpg> key 1" line is not a
literal block; in the generated HTML it comes out as a blockquote. Sphinx
does not warn about this, so a clean build does not catch it.

> +qual chave est=C3=A1 =E2=80=9Cselecionada=E2=80=9D. Ele funciona como um=
 *alternador*: Se voc=C3=AA

"Se" should be lowercase after the colon.

> +Use o reposit=C3=B3rio de chaves confi=C3=A1veis do kernel.org

The original heading is "Using the kernel.org web of trust repository",
so "web of trust" got lost here.

> +`adicione o UID =C3=A0 sua chave <pt_BR_add_kernel_uid_>`_ para tornar o=
 WKD

The link text in the original is "add the kernel.org UID to your key", so
"do kernel.org" got lost.

Everything else matches the original: the remaining 40 literal blocks are
byte-identical, URLs, e-mail addresses and numbers match, and the heading
structure and notes/warnings are the same.

With the "::", the lowercase "Se", "peri=C3=B3dicos" and the commit message
wrapping fixed, this looks good to me.

Thanks,
Daniel
