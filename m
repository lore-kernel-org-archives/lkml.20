Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE43876C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769042; cv=pass; b=qhj7qZVGk3Kwo6WCiDGFK59XIhscGCuJhJouSY92Hz88WGCTZb24cx+6PrJ233nDIXDWD8jPK3tqvJBasOQ46samTRoWfNeVw5Y/0Cj2MzngmNcwRcPxb/S+UH/dzeLOsjPMPG0soIV+g6b/LRZHYDQuSts44xYkzlTpXzGKG5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769042; c=relaxed/simple;
	bh=27zRREs/iQU8BuW+sKyAEHMiA0sOD1XRpDayIfbbcFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDviInEFU+PgHRPBnORhTAWhB2ZZ8FAx8vXXNwb4IReMemE60zhElC+QWrEs1G2RqAsNllqT7x3D7IhS2FyW3nOAUa67K9e6TYfOlicPaDn8wWNij+CENs6aQorxDHlgLpXUsW74qJI02UU+anoI4EPMYFX8GnunX/OmZhubfng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K536Q5Oa; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K536Q5Oa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so1080162a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769039; cv=none;
        d=google.com; s=arc-20260327;
        b=GqtlG/FutPMsW3MOUJxufKeZoYzPT+pCdCm5RxIHg1i/Leay66P8diAM6P/milH9Aw
         CDorrA3oD5BKZVVssAPjg6y68fX0V/A4jmUqE0iyZJXvJQ4ydwo3tM3l/dFgpRDc++Pv
         yA85hXUFdm3nd6XZQnLIchk9c1LyUwsBp+YZuUkGuXnDz406IL4FKz2CYPwzeLMqMVmG
         reXSMX6i6y4yY3ZdhQtdJYe/o37K0nIm/OD9TyrDKlrQFzEFB1CfTL99cLwi8D/4uOb0
         CohRwL7SPkS+Nldc6ggrNPNZwa0xHobM2dN7elMPCaDtR0ZHePOAY+u45/Ly4Lp/pPUR
         vZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        fh=8Qik9YpPP5UX8ALuyitj1tF5PRzlgh8kW7pUp1k+8UY=;
        b=SSeRxmTdfCPhk7tQ/qzp4VFhlpe69eZXjBI12mgXWyNRg/MSGu6mKxD3Fuc8q2l8Vb
         URKuakhh72qa17CO58V9j+F+WxjSDGev+tYspDtx7pcBu01weJcMirNqLzzASEip/0/B
         2lGVPJEfFeVGOkaFf00dNupxtgaABpg2ECWxu9iOfHrm8wmUyZjEaThnWcjnqVBphABK
         2MtNrntJYxvi6ZYCNKRUPJDCrmgYU7+Bq49aE+m1qtvnYw6ZIx0Qm1gjt1Oef7Vbfw4g
         hQJDORtr5Sih+7abnd83uAkuBh01XAV3E3Xv9Oi1ciSKnrE+nIqgSbEFs6kHU5IA2RNo
         E8yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769039; x=1792373839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        b=K536Q5OaPYNT/ru+X5ksSqrv6vJm8hab06FjoeWQRlQ2xehrCMEaWIsqJP9mMx+/Rz
         DQCtSNtnZMQy2ofLuTDo9YYdxRYeFzmFAXxNBx41cGeQlNpQIGr4zZzUYQ1VmzlxztMq
         QJ0byBu1wSfJU3l4ZwTwAdctbSphk+rfH+QQHSg6Geo1fJCfSOFzI7M+rOuOo4qKbv0o
         2fk/kEZcjQi/yUKdvQUmbJxr2nfPs666363mVn+Xfq+Nig5uZn17inz3XgBh+6DMzanR
         UrH9zTmpHeXJqtPDDlUkwO3jqxQMKZcF8t6DLEOKc/nZa25KtSh9u/jsOzFdbo7G2blp
         vNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769039; x=1792373839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        b=vT2POrW6PNNAbWJ+t03/M9bdLzNe6fsnD7R7Pd9sMUkF4FECQfxE/9A1iK7FrDwPTC
         z3vjaGth2VkjkD3ARj1UVtzW707UeSMmZT1NgNy3OjjBMOxSVSCu20lA9+LIZFsmQXbe
         L+PV9PnZFGJDlnKdeRmOZ3VLmU6eluwB119AIaQKp6pw/bjzCBRHoskroFqDr1amKgap
         7p4eiTX83lKSbE/HGrziqNATrd6ia5b9od3G+cneRoZIEncrNT4pMCUhSO/4Cvvtzibc
         2HI01HxBa8g4brswKThNalrikZhawWn9c9cMNsdEEQ++y8ENu2DyEM/v0sk31/vQy63g
         ALiw==
X-Forwarded-Encrypted: i=1; AKwUvByLPTON5SfB1JJYf8IAp8idwf8zZKRLFPInst5VbKuvg175BPvuImaT1u8sjhYHZHn3qisDTdZjChO0s6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPUeTm4enAsHr0TfsbJ3RrId/3YufbmtTjhkTJtETeOduSb62X
	Nr2GDYd2U+fK0kZv8vqYHfg9q0TBzOVmwtsVz9e6sAREO73vZaKZ1vfKnFvr4nBVo2j+7RKOAOa
	PaOsEeDKKLpThZvofX3kS/Qd5wcOk0UM=
X-Gm-Gg: AYBFou3O2dCiH38lWSl2rwE8+XvVDojFuNQSkrLu/1xZWKpjHamr1wV+8vddP68yMlt
	jSzVOjIvABMI93OHc1o2TWPUR1aJPSGW3U69lpAhPNzV9POix/b/CkOZYDsoxFlGkd8mnOa8PaI
	OC4TzHS0AdsaUc7bOebLhq90SfSTStG8mTSWc03EYVtFPXBSBWoODDWnslLyyDLhSJHxBN1Xrs7
	hnlq6hmOoAYidJeqDyQw7DohNHNyjxe9w9B1RbOko4Hh0Rl2lrcjzNc8Xs8ak0ecSjetmJFyO/Y
	+8MMT+7xPEm4EeRnzqM48ijrbhdwWtCjydXrgXndRLvS3pI4DbRdAsU=
X-Received: by 2002:a05:6402:4007:b0:6b1:bc9f:8ff9 with SMTP id
 4fb4d7f45d1cf-6b1bc9fbad6mr1546187a12.19.1791769038583; Sun, 11 Oct 2026
 18:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
In-Reply-To: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:37:04 -0500
X-Gm-Features: AclHuK_hRJ6H5b2TtORUrGn3dEPyJXEf2zEiJvpFEwPt2qNkCCdhcmrNuTADBT0
Message-ID: <CABb+yY1LFocx82GVjWeUjzcS8hkYMFySLXOwNTs3ABN36dn8hA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of
 a static counter
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 9:21=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> qcom_ipcc_probe() uses a function-static int id incremented with
> plain id++ to generate unique IRQ names. Under async or deferred
> probe, two instances can probe concurrently and read the same value
> before either increments, producing duplicate IRQ names.
>
> The device already has a unique name assigned by the platform bus. Use
> dev_name(&pdev->dev) directly as the IRQ name. This eliminates the racy
> counter, the name buffer, and the devm_kasprintf() allocation entirely,
> while providing a more informative IRQ name in /proc/interrupts.
>
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..456596569bb5 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -282,8 +282,6 @@ static int qcom_ipcc_probe(struct platform_device *pd=
ev)
>  {
>         struct qcom_ipcc *ipcc;
>         u32 config_value;
> -       static int id;
> -       char *name;
>         int ret;
>
>         ipcc =3D devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
> @@ -313,10 +311,6 @@ static int qcom_ipcc_probe(struct platform_device *p=
dev)
>         if (ipcc->irq < 0)
>                 return ipcc->irq;
>
> -       name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
> -       if (!name)
> -               return -ENOMEM;
> -
>         ipcc->irq_domain =3D irq_domain_create_tree(dev_fwnode(&pdev->dev=
), &qcom_ipcc_irq_ops, ipcc);
>         if (!ipcc->irq_domain)
>                 return -ENOMEM;
> @@ -327,7 +321,7 @@ static int qcom_ipcc_probe(struct platform_device *pd=
ev)
>
>         ret =3D devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
>                                IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
> -                              IRQF_NO_THREAD, name, ipcc);
> +                              IRQF_NO_THREAD, dev_name(&pdev->dev), ipcc=
);
>         if (ret < 0)
>                 goto err_req_irq;
>
>
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
