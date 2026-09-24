Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E94B7176
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269509; cv=pass; b=SQRtY79DCoZaB4tXfeqqJjRUs8MhosL5M7SY0aEtcxZpBQPHM14rn9KHqpcU9P70uNd1u52k74NikkEr0iTbqBsCeRlA2yeBcadr5QWBO3s8SwDKyvTm/gs6DSd9RTh+B7x+wLBDU8HEwQUzq1T6E5ryjIKgLZMc2DPOTmhbzJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269509; c=relaxed/simple;
	bh=1F8/rz3ypcsoCgDUnUPkG7WkBCl4kCGuN1jCJU9T35k=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfdxAd7NdHAKTvimgFU3WASYBPl9JmtYPditECzJ+Clf5JTHclTdfk6jD423iEBElQMqpxc+UTmEJA4xDfHMIrlwCT1vXcYM7wDIflaYcTJXD0+xLanwzkAJFR/zjNKg8NHmrhjUECt9Moh8xqOuS2sCBDRVnWaHmPGGkeiK2VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s5wdWVwc; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s5wdWVwc"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso733756d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269506; cv=none;
        d=google.com; s=arc-20260327;
        b=L5NhlhxjLz1h3Of/XcrShSl6NNyPhQC1cKfxELUCoYVdNGAcP7GII3KPG3saSWIniO
         y+J4Ixy6brWc9w4CZIX7p9+phH6Up1MbLAgKA2NLmSpDoRoLWH5YR9JlXmSHDrQ2ldmo
         EGZzdLkc4vNHeLQJJd9PddhXFKjsN5bJhldLipobx77AygudfN/ebeCrR7BOp+IqTWOk
         kXfifNdN4klcO09mIIdnp8gqDQVcwPhPRfo1GcR1ODq704DSivPGyTelreTT2wlTD4dp
         F8vy0IOrRnWAybgDiQ96vyCpcaVD+e5JCnCzvvCENQnWGU+bPIAWNH/RN022EqiFOpuY
         MtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        fh=Sm/GjYVCtlBa49q1ZiZUcejTD3qidlSsD/2pQhq1T1E=;
        b=ea6JhpLciZnwReBmyIsPDDz9tCM3832ou798Q7JNfP8z4XFeYWNqVsJkSxZc77A8al
         7ASVq7JwKiDDxmYKeXHt5Q1S4WLjLD+awO/Tn95L2HnyH3AH1Xo/T1yWRu6rs9p7E/ha
         2h+yjsI0qDJyzgjrO5q3/o5pkSzw64ugFfREfg6nXeVE1LD1N5nPDsSNCDHA1W33lVlD
         nTA/m+/oDm/8bUlOUNvvxY2vehWNx6Oaxh4a3SBO8dufxX1gOkcFNyctaRNA2Fey8L1A
         TDbW5Sa4po9bby898zd/FMv8kgnoj6BX4por73Q8qUQh4C/KBJQFlz/8e/GKtzgZVgME
         V7JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269506; x=1790874306; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=s5wdWVwc5chjFqw2cWCygu2xSMRvyyJf5NFwiFfSSQvFMOVGSbt8gkny9PTMMJTc52
         yHZMs9R/JVxLJjKgptEPtXI/kYOyeWwcmUKY6tSsDiTGO43LilqoZHkloUcvLGPWTFoI
         PaGqpr8l0jlYeQww8GvXDfpx2MPg/SIJ5geyxpZcSV2+AJ7SIU5OSe6bz3gzBHOtoObF
         FMAZj4AsT8QvtstcM+JzkKTY1ujPqPrtR19K0jI5ZqzJ60Mz86/jpPYQ1CEQZ88AH/8c
         HxImTm1F8JH+l730uPkU74cgWmu5QWVe/hlhLpuwqjQIwoiOtxWmSKNe99myPbBrL0qO
         UXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269506; x=1790874306;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=dFq8CqmkPHoozyd2La5mp5Ea/ca3mIZkTUe+hyT5KWGaz3fujaT1+IwvI+vKAbU3ul
         zzcrSkVXKADd+54xJrTs/zhqZ06XtEBUmxEUYuUhtZOECivZsewUq6RsnXfBPORIfqdS
         3gHSf59BzS9s0SgUo2GgN62hlNiwnUJ7vnQAow1bjXV68WjUOhbxXjM+4eA1wvBWOi+y
         bkyJJ8vtC8W6m4XBjSvKY1tDA3Z6mQuzUopElHwiJ2sTbGjmGrGHy+3ijxuw8uKqQCWe
         5e4cFE3xUGR18Dd8NElbYY9LhO6cWGQ2D+BYAXLvrxiZWQcd2AvAbiSYdxy90pER3Rew
         Kxxw==
X-Forwarded-Encrypted: i=1; AKwUvBwe1o+JG4a/ep77Hzp3NrDX9TWK6593k7hU+bQFESMSq5gDRCnHfI3NXwdnsTdjh27Ek8sdUvWMaBagGaU=@vger.kernel.org
X-Gm-Message-State: AFuF++kIiSvMk8gPZZr89EhU1lri4e2M7ABfmfU2eH0V9V0U2maMDP5y
	BBPnoInrYVQUQjiQC5lXq6eaPMxKjGdV12Q5ZB0mMTah4oXQ6HPPFKHftrfjB5acS58C2+5NlEw
	0AqVa11qc8L/wBmjMcMmhv89XwepkZaW+N8XWL7oj
X-Gm-Gg: AYBFou3+n9EGz7AlQLikSy0PwOAEdBzwl9LLltOuXdnVXd2Ms1l94Dv31iGa0WKj7ak
	WOzHwin5KGlR4B3tcxOsbfEgMvBifA0Bu68cBqOAjHRNnuIuqjinZ+LfThw3K5EU3DrOdjepgvM
	Tv0ij0LPQtyYKf36Ok/1rCBvEcNTGuTdaXlopY4equPAUz9ML6LZYudvjjpFMvZXBknKGGhB9Tu
	RENeup7whFtddghi+6X6JuGKlj/6Q5xneI4zExadz070x14nXWY3JzDsizFffH6XC6PT0cHkVSO
	/lKL3PchhFJW8CkUuD2VT6Od241TT8hjHjm4g5Wu+Z6U1TmfnAGlR2l5jRXpporDjFS+NWLuaYN
	u7lkL+7H/amVDOz+zCogTdKmLybH6e1F6RUyClNiUzA==
X-Received: by 2002:a05:6214:4a83:b0:912:cec:7450 with SMTP id
 6a1803df08f44-91421b1851amr31284116d6.0.1790269505101; Thu, 24 Sep 2026
 10:05:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260924135201.850038-2-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com> <20260924135201.850038-2-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 10:05:04 -0700
X-Gm-Features: AclHuK_DlezgNpJkyQ6-N0Dq0ZFyu15Ut5n5SPUx6_YH9nitYJ5xMl_wRWW9wVM
Message-ID: <CAEvNRgH8Hwt6_VaFxJVvytZ4La1R7bUN2emc37_fWecF9j2-YA@mail.gmail.com>
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
> +
> +/*
> + * Note many of these fields are smaller than u64 but all fields have u64
> + * alignment, so use u64 to ensure correct alignment.
> + */
> +struct rmm_config {
> +	union { /* 0x0 */
> +		struct {
> +			u64 tracking_region_size;
> +			u64 rmi_granule_size;
> +		};
> +		u8 sizer[SZ_4K];
> +	};
> +};
> +
> +static_assert(sizeof(struct rmm_config) == SZ_4K);
> +
> +#define RMI_REALM_PARAM_FLAG_MEC_POLICY_MASK	GENMASK(8, 7)
> +#define RMI_REALM_PARAM_FLAG_LFA_POLICY_MASK	GENMASK(6, 5)
> +#define RMI_REALM_PARAM_FLAG_DA			BIT(3)
> +#define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
> +#define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
> +
> +#define RMI_HASH_SHA_256			0
> +#define RMI_HASH_SHA_512			1
> +#define RMI_HASH_SHA_384			2
> +
> +struct realm_params {
> +	union { /* 0x0 */
> +		struct {
> +			u64 flags0;
> +			u64 s2sz;
> +			u64 sve_vl;
> +			u64 num_bps;
> +			u64 num_wps;
> +			u64 pmu_num_ctrs;
> +			u64 hash_algo;
> +			u64 num_aux_planes;
> +		};
> +		u8 padding0[0x400];

The union + sizer concept is cool. Technically this one isn't a padding,
it's also a sizer? (same for the other structs below.

> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u8 rpv[64];
> +			u64 ats_plane;
> +		};
> +		u8 padding1[0x400];
> +	};
> +	union { /* 0x800 */
> +		struct {
> +			u64 padding2;
> +			u64 rtt_base;
> +			s64 rtt_level_start;
> +			u64 rtt_num_start;
> +			u64 flags1;
> +			u64 max_num_vdevs;
> +		};
> +		u8 padding3[0x700];
> +	};
> +	union { /* 0xf00 */
> +		struct {
> +			u8 padding4[0x80];
> +			u64 aux_rtt_base[3];
> +		};
> +		u8 padding5[0x100];
> +	};
> +};
> +
> +static_assert(sizeof(struct realm_params) == SZ_4K);
> +

Does declaring this struct as packed matter? I guess the static_assert()
has the same effect.

>
> [...snip...]
>
