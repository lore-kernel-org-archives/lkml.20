Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268721;
	b=AcZM5bBiv6mDd4z6qKI1qDeZU5MDqoUG7BJdDEQ2DKO3RK39ooTea3tISCokPk5Qo4RQ
	 i4qgEM3zUslIyb79TdJe6Is7OoXH+s425fDESBaa2yMQKZX18XJeAE/BiuufGgKLa6PWI
	 FjiKnIxHRrPyQfW+u0xovxVsrENOwY2AXushDvK5hRvhji83v21PdH0gOp2o8PTYAO+5p
	 yNEU+4xcNhDNW8n+Jhe0LZRfemEUSQ+DDqd0lHCWTJwCRtdhORrmdFkp/LDndzv6Q9gZ5
	 KX8qNoFIvObDLOsAIWIGgBblI/7/2d3gU1DpRnAmZ3vIG9q78W2Mg6JBxt2bMPahaNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
	b=dS57wMnw4F9/wCjJYLDtIS6tJNemhBhwTfvqAM+TbQpxzWNorbGgnwEsXaGOuLE+6UsJ
	 5AJKsipJyj8NzVP1ffIPCxPHj52CXPrQ1iLlQ2SqUh9rMm/tvpz+ebb+D/4FazCPV1Y6w
	 cbkHDdKZidAhTzoj7S9OEmiusslAHKYBpVZnrDM50LdBuj1U4C6vTmdPxgqQDIb5YUqeD
	 ibfylPiyADNJrLxjpQ5/y6ljvb7Q3sB4ICHjuPBo+PB32sT6G79QpWu/0GWvRiSoy5L4U
	 McdpTNN1H9Deg1iPGQnTF/IjMuZxJZ3lUTePb9GaKZeqsIePuiCa3HoWRofVhLmFNng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE12606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3919879eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268720; cv=none;
        d=google.com; s=arc-20260327;
        b=oxidPQ4AwzqU8MlFPXpVLBFgVyPaitcI16gORwDrmMwAbArGMe/Fw2irPfBK5baOSL
         9Cqwj5SIs5sOu7aktQd0hMyRUiEFeVz9eBFKY7ZKzraYaDohpJAEDeRoHISRPEyv830L
         MgXVvr4sqMl9WXIKPphKoyTzWQ5gYhzEsQthBvV3oXce/4Jo3ZrSG/Lh/q0Em+B8j/iv
         QIx47NJDwhMlyh2Pho9NHz4oC9vMHlk9geZqu8sd9pkE7HYLARYskdmd2eaM4QePsWCh
         IiblMfBsoly6Rxq5t7aA8LAxXqQmGoetxugBbKCiUB0yC179xluNpg2BHgXzyFmgvJoK
         UWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        fh=n67kF+WUcycZVJ9I/q/9zblLl35j16DUXH8gWQbTkUc=;
        b=D2BJsT/2xgYlyq11LEy2C12J5ep6y7SMkDlV5SXBA75n7v1er5r943zK6bM43ECKRT
         tMIqBWtMC3kc4f/48Qhm2AZGUJj1NgRdihFJ8aJfyEYK+MHt+rSHIwf+40V2nBUOWOMh
         pFsp835w0a7X1NhmIx8h4lrhPIt+d+UXcc5rneFYLoyLvyl1SU3X78TIjQ2KJsNNzoqB
         yMOILY2ZHQObNrTKGjxyyEvdKZhJDOFlltTvgKplmbSC9C5LPhp+1RKsLdBbVY8yAoSt
         eWR+AoHSiw+SdybIaZSbTKTRkPieiQWdw5jEULKdQeBA47Wetvv/Gc1o2r5qVC3WwVVL
         ynjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268720; x=1793873520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=u2sBbzu2hkGqyQz96k0avHJnOd0ePQgrM+7rXIY5CaAiiyZJB7fbos+LVo4+Z+VJie
         mfAk52msiWbRDYHSp6K9F0r3vBVAu42VWJJcIswYAYEyddym4KipIWcJYlkp0v7JFUHa
         k3ysl41ONGLKIb+TkwkfXEuupnVYF5//5j061LJHXetcAlOvsUOPH6qQWPgEteyujjbk
         j5jaHwJArz0QdE8bFA4OOAr9Ey0Qm8lid05av05lDTQ9eH0RF0QJbM7I7Q/+KzxUNVQ7
         KpVI1eN/Yc8p8K+7W2df991+0sj/x6HGrbPlXbQCBSgjIoZCtd4sLnyYEm3nyAEBrykc
         JUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268720; x=1793873520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=keKsY4YsgbuBUlzEU8psY8mlAjnjg6Lp79hZ5z3f1xJUXMS8Agq16GC2kNqasGceVd
         sPmZEXXTWI2MmOyjaUYNMSDP52KF7bqVyJ2/9fysgMj0sYG7S+hWuvpcbsAwKNpDsuo5
         xWFV1kP080GA9gVfbLSpzOVxGcv9Wpbq6zKUeNNA2SFibosXsQE6mVtVUN7LC3Kc7pm2
         HeEDKEdudf+UBa1eciRWMG1Jo8VtYzoiEPwSGl/xmNmcSovsTC0MMlLb0QhMzVXzE8MG
         MHS/f2V0x4Ur+j9aFY3PxVs4BnQR6Z/SrWLr1O4icm1MtbZxrFcLbiEZNCyfVdZMRvvs
         g2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo58N/z2wPrQlqy75mEctXcpfC6hXV4a4L0z2R3pAwXIaTR0gaQEFxdfEEoctN+X1IBFYmdIGqTYh40ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5YFMcttuY6sKr9Mp0rfHqc+S61bDh3dluplKdU96EC5uv1iKP
	DWvv9Vo7fO5ZtgoCMH/uw+Er0HybuE/xKdfIkVXBjCLXr5bvQ6Ui1JTLZ5dXZ/msOTlqf2zQIeJ
	6xiTQj0i659agtM3Kx/zSXRhLzYs+c9k=
X-Gm-Gg: AYBFou0TnLSJfTb/RcHJw9nDBUuM8pxaUVVTEcEWe/rQvgXpZupaNmzrt1oMSh8J7KL
	hn4OrOSISPCS5jiE2G0q/GsduM5g9lqtEavPTv2/QZAapvnR9Qhf44OZztUNknyMQwrHk7DV19V
	WPCwZn6P5YmbT9/GwxJDEEyJOCuFBrTLsyRP4TZZf7iFQBv7COLbQO8QHY0lfYKVMPOK1+Xh+Hv
	qoOcqOewnkcgUulVLaoielZ/fqG3V0ofy5YlJVS+koqYvm5KqtAiAFGynI9hciDTHZ9zzx3u8xP
	DRcygkQmDm1LKZP1SxuneDHo2EtGnymxtKXAJ2SD9MGdLP6CCVnmy6H4Ow8CHDBG0ySwwihpfk5
	4cfKybCWFIlEs1zi0IswKM4p5pQXnBIHj7gfHZNHbRd2Uh/ffefmlfkU1eXW4PmnLQXUUfA==
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id
 5a478bee46e88-36a20459a30mr7592769eec.22.1793268719830; Thu, 29 Oct 2026
 03:11:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:47 +0200
X-Gm-Features: AclHuK8mutFrWjpw6_PPdHUAyItvpAhM72OsxTaC6ggH-p4KNaOHRql6Fdiss_A
Message-ID: <CAPVz0n3TSeed-SgBbvsXtPJtx5CGzuYcruqOiKVaijBu2w+HVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc/tegra: fuse: Store Tegra114 CPU and SoC speedo values
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The Tegra114 CPU DFLL computes its OPP voltages from the CVB tables
> added in commit 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for
> Tegra114"), using tegra_sku_info.cpu_speedo_value. The Tegra114 speedo
> code computes this value but never stores it, so the DFLL uses speedo
> 0 and only the c0 coefficient remains. For CPU speedo IDs 1 to 3 c0 is
> 2190643 to 3395401, so "mv * 1000" in round_cvb_voltage() overflows and
> the OPP voltages are wrong.
>
> This is currently hidden by a zero voltage step with Palmas regulators,
> fixed in the next patch. With both fixes the CPU OPPs range from 1000 mV
> to 1270 mV on a device with CPU speedo 1742, which matches the vendor
> kernel.
>
> Store the SoC speedo value as well, as Tegra124 and Tegra210 do.
>
> Fixes: 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for Tegra114")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 1e6c2b5be759..8bf1a1b1287a 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -92,6 +92,9 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>         cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
>         soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
> +       sku_info->cpu_speedo_value =3D cpu_speedo_val;
> +       sku_info->soc_speedo_value =3D soc_speedo_val;
> +
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>                         break;
>
> --
> 2.56.0
>

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
