Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606CC3783BB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995014; cv=pass; b=DGT53eyEBygAcN+hG9VBKRvKoSdJ63ToSLOj5moRcG6y9H0wf+LIQ4x1lM8UOdqWjGZ2S+s5hZuYBSNqhHfw1ICOTS0iRjjof/Sa09b9GaaKqZ1DdcuNAkcVBAlnYun5gWFcksUIuePrTICx41PpaJB7QNS8bvCq8waLfCc45Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995014; c=relaxed/simple;
	bh=2N8QKLLtQS5TYVMYQfFhZKQgKREc/PWVfysWmf8PWBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3He8WO94T1U1+zDZc8VU4wl5Kb6nSE1YFOnK32e1OOMmZYwh7w7K/zz5om80YBg8aQuMPL8Mh5G26MMHqcz/tCAlsozgjf7MpjAz+jF9Mu7lUy0n7ceeP3c3yxCnTHqn02SS3qlXnbKlEWpez+SVfHxLDz24M0KzqtS4KQK2l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXwiT1SE; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXwiT1SE"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso300337066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995001; cv=none;
        d=google.com; s=arc-20260327;
        b=iuVGdTyndxq4+HLWL684WYacmf3uULXVYzJbjxNlah97N+Odb9g1TojSCRai1Ik029
         D0Qg8a8+TyUVhLQK8jkEe+GVWslQqVTLp/C7K8TiWXKV6lktYRJJ6TU7JpYgzxR39jfz
         iLYx533tnkfRao9aVWm74Ti1zZSdC/cEMvv8M55kDvk2vKybn1HS/FDL/COwBkBVRHEa
         Y0/rG7YuCMiJxO4hkMiTgSkLM/nx+ljSoEagw+zDUcEpps9kEAHsOoukFgHgjyX+GQmF
         yRcgFRwGsnBWzMlQ8iBCqXWHJ7CvQlPEDPx30qB+WPrW345KJPVcHWIpEFHR8We8ZDkW
         HYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        fh=BtZSvLyicJ2InqbmEj7w3Fa1Mczzat0EDH5XlNZmb4I=;
        b=A7UgyylQICRUnWC6J0xFbn8tRRf6671JAjr5cMk0OG0qrt4FBdeEWVms6s7fCR00sI
         XX/zvgn6cFxJHV/mkwyV5Hgq653ue6gT0k5HCHujfIf2kH6tntWI/fB7/bfB2n/OAjeC
         5rDyWQC9cdZh3p+A5N5JFSIFrjdjdSmfHDI3CppZQD8gGNfMzVU98hXKIlrPMfamYKjf
         C97HEXheiWq3kCc/jISIUl6v6/ZdRIKpfEEtpQ5HsWVJFLu2QxMi5VaxGBYiMc7f3znh
         LFkoLIv0JzGfDwa2eVDCB2dq/H6cH7A9tgqXc6XqgTKPZVS78MO6Vvoqo8fQoHNpGZ5R
         mieQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788995001; x=1789599801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        b=lXwiT1SEe21pKjCz2nIWsjZm2rGckPTrKswLdsrm44ZMh6Pd0yK14je71UwoEGCLMh
         QrHx9hGT4X3ywbSqh8gIV1JvJJ3huLXLS8DUr+xx4KS8n2iFJcYLm9/VMrtWGnt4hlhW
         Zn69JVcxFARre93jgvN5cHJt4imiQCU1rjKBs3wTjoVmtrCUrtgpHrftpfbMdJtqEMam
         gvQW5ZeOtW/x8X6anuHEbMniSzg1Oy2aztpHVes/S5+s4PWsqPIjtfCjN3KKNyruaJrL
         y46FiFG0WOWBTW2kM4G2AORxSbo3h6GHyFqjTo4IB2AUHtfQXzL55ZUTn2vWoQeEibIo
         1jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995001; x=1789599801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGK+efAYby4F6StwbAB8hZlQQzWTB2dIMgTR2yypkU=;
        b=U/zd8EKIAzXqPsXUbUhGZeXIDR04t0GXmrsTFVXfReWZW64FlWTVIlOxVZs0/Lqk6i
         W3W9Tv1jFlbBV3Zoa+/MYhlVvYNBZ3EZhyEHeidm9mwWkaKvjVScym5xT/jXRzsh5VAl
         n1hNiwSJ4WymxgvLq5vy8UQfcopaZhunetPjegv8jb1j/3hj3+6kqzJuexcdxLrTplhq
         km6xxaZJUvgInhlZQ31OemkD+fzpf44e3XL+9zu3abgnvSFnRq9Czwy4oGTSMX51hgZp
         ZHmIyMOg13Fu9EiGCRpwpTTpJUwxhbqYKkEZOpFZNuUdm2iZgvhdDGhbUOL1fe/JB9OB
         PEpg==
X-Forwarded-Encrypted: i=1; AKwUvBy/g2+fVEczQ6eFc/XCrowB+nNA55pkYC/lR4lUQUR2Xt34sgzU6nc2iM6LTvdnTv/rvRBiOCWYyvtz2wY=@vger.kernel.org
X-Gm-Message-State: AFuF++mjj0GQPc7kpWznRIPHafVvSBu/EAb5wn/E7ZOiotctdU2a4YLX
	dqfRIQmRnp4o2YyE7WJuVjifgO4NuQj/n1phT1x4x4jodRNQC8LvPNEZoUwpJNpOYRfEjQPqn6r
	xxgL95j1QoAWMdoYfHwVcmlF2UN8aW6JUpw==
X-Gm-Gg: AYBFou37uba3scO66RU179glF++7NCS9XHSBAeb2VsaMh54HMTZpoKOA52SI+d2/tyv
	jPPEtCW289cq1ELt6SIkNBvEA1Z4uUG5iJJK/t7EJgAgvAlgfMfGcwcV7yOEE8HwgO0me4zQJ7H
	XdEFx1BvgJdR0ZGTJK8lds9lt1yAFpFk77R2UEs2P5hD6JQLQfFLYZU6kCRRcvr6/2QNZK3tUK/
	E/YxwrwCGKa/nFU/RXxQdR/V3fzXgAyAa/lOFcpt1UPvVIoqQ3t5np3W9Nm/vXdtftquPMKatcs
	8fLgzCXXHExlsRXtyHAGHnRVxJEGMSR24gR6EfNbzMv9q5rzg3gzX20a+aqbSwC4yYJ7/8Zu3T3
	AoUFijL5NA9ijH7uTlMhE+nkKtI9s8gqon9e9YNEbdBJ8iObINwOulu+1ZdHZp3zoCbR525/l+z
	Eo29zlW4xdwo7Fw2SgeikGko2pSskfxR19EWukSCEADmpot+pnixsWgl1NC8RT1Uh4xA==
X-Received: by 2002:a17:907:c653:20b0:c29:4147:f4e2 with SMTP id
 a640c23a62f3a-c29414802c6mr263639966b.15.1788995001495; Wed, 09 Sep 2026
 16:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909223813.69028-1-rosenp@gmail.com>
In-Reply-To: <20260909223813.69028-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 9 Sep 2026 16:03:09 -0700
X-Gm-Features: AcwNN1VC-6hHLvbxTegsPts35TfNWRTPgWH-LDOxn9y7jxLY48LzNU3w4xiIwTo
Message-ID: <CAKxU2N8fTU6at2tobF3Ny2aaYq+KOSz0JduWfh+jn-gNTRrDQw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:38=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> Replace the manual kasprintf() in probe with devm_kasprintf() so the
> name is freed automatically on driver removal, and drop the now
> unnecessary kfree() in fsl_ifc_chip_remove() and its leftover mtd
> local.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/f=
sl_ifc_nand.c
> index 469b233db73e..cc75b6a67e07 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -963,10 +963,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *pri=
v)
>
>  static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
>  {
> -       struct mtd_info *mtd =3D nand_to_mtd(&priv->chip);
> -
> -       kfree(mtd->name);
> -
>         ifc_nand_ctrl->chips[priv->bank] =3D NULL;
>
>         return 0;
> @@ -1061,7 +1057,7 @@ static int fsl_ifc_nand_probe(struct platform_devic=
e *dev)
>                   &ifc->ifc_nand.nand_evter_intr_en);
>
>         mtd =3D nand_to_mtd(&priv->chip);
> -       mtd->name =3D kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start=
);
> +       mtd->name =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%llx.flash",=
 (u64)res->start);
Having &mtd->dev as the first argument would be interesting but nobody
does this.
>         if (!mtd->name) {
>                 ret =3D -ENOMEM;
>                 goto err;
> --
> 2.55.0
>
