Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268694;
	b=UDPZHI0MIfRefzgC7bBXZD12kxnbdF6VwQj76/gY1+QxC6QRX/7HwFz54QGjM6Y4uOXM
	 fna5T/WTaaY2Aw4Jy/iXj6v0+BTedmKXomygGY/dG6kvwu8KPkTvJYH+fF8eY7jPPO237
	 X4KPhnxFTCCMnuQ/ErArDZVdIzTIuG3uppw7hgpFPZQxtWfiYYJBSX2/yEXnT4O2F7UkQ
	 PJF6tEpV2QcFVjpIIu0bJbsvtdvZgRx61FRLklhuvXVWa3f5eRxxm/RaxwG6lPRmPN/Ca
	 0HRUh18RyQw+zzD6rdBEAwzpCVEEeOzFe6SjUK3lUpnggG75M0M+rvM2JwS3RtOe+NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
	b=yP9mdsqeqNrzCsngD46QOr912ABfSJg/p9S/6rDoHuO2g6xk9X2OHa3jPIzhnmKU5DRH
	 Hc56cgnAim51OwH2yuyaSXPvHH0ZLqne3oRJMyLS/CsEwNyKsBkfWomWr/Q+fJ0gCY18g
	 Mu65kelsvEDnF1OeY3AlwQZ6qw2MH42NHuB2TUkCcqiXmNYtt0IdriD2/Z2Kry7oEFsNG
	 5+InCrvoz4fw9oP1MGwjeTp5p4XHpPkyGLkL7OK9L1kdNyiI68ZP+KWXKIGCRkJDLXksu
	 BTU4FaK3e3Eqo7kOjsgbgXOMF7vKGdHTIhcFDILxzl2Zod2bSeasvtYk9Yqzsq0iGYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FA5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so4204080eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268693; cv=none;
        d=google.com; s=arc-20260327;
        b=pvbyzGaKMoOrEIsh7yG0vL9vy1cy7yma10eCjD/POaIfio2heKSx576maI0uis/gfE
         Tpk/EFG0C4+U7z3oZxJUbuc4lzyFva2jQQLJGPqtOaeyCYbmOM6S8EVJ3wO0wuZkKaYf
         5CsTQWppM/v2N5jw4lu6LqYXVfNIcr2jZ+aGhs1BKYlu7rBsEdSZo8EBjSjn2YCOwRtw
         Bu/o737g8wHaJdmfEIpispbMDIzJL9i/e5k/CmMcS7PnINamMFYobCrLgGbuirnJVWDj
         AXWpH7c3d2ggc4WmcEic5FezY637hK+G33mwpwn36zkX5NtXpgRbiU03gK9HPmVHQyRi
         b2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        fh=xS4r8KvENrhBxn7NvOgfoxtSN8nyE2WpqJnWr2fe1eo=;
        b=aysJffLuf3h2jWrV9JOcLwLABu5JDg+unBNYYkxmEMEW4WiCXq/7dtEDuJ3DhGsGW8
         XndGYEBMQVbjD1E7UZ3boRPXtqZssrCaNgzpBkGoJw7DwdT9hl68JefnlxwBB3SFsbsz
         Tku4mtZBCrOeRwEG7OWzwt614eUOoGzSFUjuaWEBDTErREiIiMJHAr+KHQDL2lZx8pmB
         uEW6oX9XMnhMIjopSd9S8bPYcVWzxuPb4sK7eQ5aoHq+VuUjnoG2bl5JHVyLhG90H4bR
         l2t/TI+AfGCZKKw4XXgbMF5IJt5f85KW4qWjOXe/U892RZWtaWiDrd3ecMiUprPSza03
         ggxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268693; x=1793873493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=m+uDtHfYNrebraUeNO71Kwkxzuqpdu3zCHQC48XO/a+1chRZiH7mHXPDqLP8HQ2yiH
         Tr0GNTkJJBfuOJDO/AX4VaktcSnRFMWJDv5mItb9Db77+hvYsFIxDorsRWc563PDbMSC
         WFf/XcMi0JTg23ul4cIHTqnY3lIIPwrFyN6/bltmGyVtwoQ6kqzgzklFux4nuOjGKS+i
         tPeerm8onxx4BYHYLafWUxDHX2QG6ZEOT640AX6ke/L3iW4tOH5g27ApyIfQllKU9Y6G
         y8HuQZBr1vP3B3fbPuvMufo+5KSREll/cupagNW82ra5HvG1N466DCf/4msA6IkJseEM
         2HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268693; x=1793873493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=TnfpDi1IrPtDHHJ0jXfnu5hhDsPkhV0uGdnKtEVHKNZOQpXdFRDRzoajTVOLK3Ctu7
         oYWkNwhyVDOmJjva0dS8fnMD47wN5p1NK7IF9nrjchs0fbbxN2yWyJHxq4+Q3VkHm5eF
         9pVyi9HYfaJ7SrQwPXzb0f6U8s6RVI0qKaj/4NnuX+uEl8h6C5ewzGeuFKUmuvj2aDOq
         O0lRuCtURU3fkMgGxKBaR9m1f4PWQwbnXfbpaudue1IYX8GgHNxFcvaeyyneE1MYPw5k
         4WSv8RmRM13t7LZ6W2+lbmGoGfk4S5o8cCw5ACNKMMucANHOzXnnFiI4pqxLwaP10B7j
         6HNA==
X-Forwarded-Encrypted: i=1; AKwUvBwLBygUc8DE91nbF1irxH5oxCn5wQkyxsxk/6LLFZxKDR+OVLvA1qZcTj5uriKeIvttYiHvFdyrZhjWtVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl7u7pj4LCqYV53C1PkWytpCrv4zztVCqpxsFW1KsAabl50ZBl
	GEqGssB0rnzBZM8BYd/RnSwrAMIod2ThJaAjEziX2p/fPidG+eiQpw4X/yFpwEzYlRCU70Iz5G4
	5joypMA+qnZO8aT/+Hpaaa0J6a9LmHDY=
X-Gm-Gg: AYBFou2y8Ar9nqQMOSW4SDhk2U258mSv9fQmIpJHtIquKcE+awLQYd3zu90mFGhhm75
	al48BVHlMB3+CUQdKkA3hb7Wb+C6pYP1cH6AHz2lK1LUqYYOHhTFcziUhGWgF0SiVgg+fzu0MYg
	ZajQTIw3NNHUrX4R0oHpLvvwNrEPFFVwNBqttIaZtIm6at1EIXNluBsj7Lxb5obr62SHfJ/8E2j
	jPiiEMiuvPts9WD25VLlNZsFZRT8KDW1Ls62mk5uubw90agMo/Qy9vRFzivPzEzbyCXuMtCq2f1
	1zg0YWSF7kHW5JG+qDzNquhVSBROVq0Ys/Kt+ejIADpurpFJxL/1wOZx+tpGZWy77FbEEX0BxLg
	4PDawRJ7s8k0EGHVCndpVWY6yPimnZmRNCmvBFiQicWPOURA75pmQruK7XlrnVPFUY7PeHw==
X-Received: by 2002:a05:7301:618b:20b0:366:83dd:46f3 with SMTP id
 5a478bee46e88-36a20434490mr7778201eec.14.1793268693130; Thu, 29 Oct 2026
 03:11:33 -0700 (PDT)
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
 <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:20 +0200
X-Gm-Features: AclHuK8_mii-vqm8jDLm-mNdMkH2Er6-ZHBho7KaLFga9WcAe3FyT06Xlc5Ki2w
Message-ID: <CAPVz0n3tFvEycAAhjA5ZqoBrx8MsJwDuBssAzLMrFnicSQ+eMg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc/tegra: fuse: Fix Tegra114 speedo fuse offsets
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
> tegra_fuse_read_early() takes offsets relative to the start of the fuse
> words at FUSE_BEGIN (0x100). When the fuse driver moved out of
> mach-tegra, the Tegra30 speedo code was converted to such offsets
> (FUSE_SPEEDO_CALIB_0 0x114 became 0x14), and the Tegra124 code uses
> them as well. The Tegra114 code kept the absolute offsets from the
> vendor kernel, so since then it reads the CPU and SoC speedo values and
> the A01 CPU2/3 fuses 0x100 bytes too far.
>
> On a Tegra Note 7 (Tegra114 A02, SKU 5) the fuses at the correct
> offsets 0x2c and 0x34 read 718 and 1156. That gives CPU speedo 1742 and
> SoC speedo 1156, which is exactly what the vendor kernel prints for this
> device. The current code reads 172094 and 0, and so reports SoC process
> 0 instead of 1.
>
> Today only the reported process IDs depend on these values, since the
> Tegra114 core OPPs are selected by the SoC speedo ID and the CPU DVFS
> tables apply to all process IDs. The CPU speedo value is needed,
> however, to compute correct CPU DFLL voltages, which the next patch
> fixes.
>
> Fixes: 783c8f4c8445 ("soc/tegra: Add efuse driver for Tegra")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 6695702bdb4c..1e6c2b5be759 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -14,6 +14,11 @@
>  #define SOC_PROCESS_CORNERS    2
>  #define CPU_PROCESS_CORNERS    2
>
> +#define FUSE_CPU_SPEEDO_1      0x2c
> +#define FUSE_SOC_SPEEDO_0      0x34
> +#define FUSE_OPT_CPU23_DISABLE 0x16c
> +#define FUSE_OPT_CPU23_REENABLE        0x170
> +
>  enum {
>         THRESHOLD_INDEX_0,
>         THRESHOLD_INDEX_1,
> @@ -63,8 +68,8 @@ static void __init rev_sku_to_speedo_ids(struct tegra_s=
ku_info *sku_info,
>         }
>
>         if (rev =3D=3D TEGRA_REVISION_A01) {
> -               tmp =3D tegra_fuse_read_early(0x270) << 1;
> -               tmp |=3D tegra_fuse_read_early(0x26c);
> +               tmp =3D tegra_fuse_read_early(FUSE_OPT_CPU23_REENABLE) <<=
 1;
> +               tmp |=3D tegra_fuse_read_early(FUSE_OPT_CPU23_DISABLE);
>                 if (!tmp)
>                         sku_info->cpu_speedo_id =3D 0;
>         }
> @@ -84,8 +89,8 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>
>         rev_sku_to_speedo_ids(sku_info, &threshold);
>
> -       cpu_speedo_val =3D tegra_fuse_read_early(0x12c) + 1024;
> -       soc_speedo_val =3D tegra_fuse_read_early(0x134);
> +       cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
> +       soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>
> --
> 2.56.0

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
