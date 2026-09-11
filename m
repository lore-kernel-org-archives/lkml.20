Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F90310645
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170326; cv=pass; b=NrqTi2MSu/l729OLQukjjJXtdpKnHdtvFyYtGiRq6aH8ahFfX7FQr7gSbyizaChDwk0lKapixPRWrtXSllcJ5tiNRqugPzJMWmTveuwKC8bYCfFIJT7K4JPNqx4bEDCt1hd4Zd0CsNm5HB/tmE16+2am1msLUCz0FmxFPKjspv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170326; c=relaxed/simple;
	bh=QzWOpk3ZI4hDffDwLESVN0j+Y5ln8yDmgEomajzBKRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxITBtUPQLNveytyWNiOr/v/5sxdEZfB7ukxuIKvZYs9WI11j5cL4NGQ2Xk9OAwAbwd5CA/eRikqna/hKbC/RgGe9kVEtYjATY9rHmEeVT4ZbTRzTwNESeuesG/YUcVAcVr6KF/0lSQ0h8zPY9za3m8UP3RIcKR1owBL5Q+Wt78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Hr/zkX0m; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Hr/zkX0m"
ARC-Seal: i=1; a=rsa-sha256; t=1789170305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nik8REkWSoNwS1AEVNuun9myulksQB+lVCOiMkFCouPjcGuTAMDSuJMn5+wHtija83FyFjqUO1U4yMrn7kWE3s6j793bg9stpfi+qsr02zz5z7TpzqdBYRVgCoSNXgusnC42yKSDW3VhEa30s3lexdz6Mf7jiJk/YDDCAys8w2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789170305; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eNDdbCbHpg/fxFRYGzGBoVT9mhaLaK9XsQQ36czY1j8=; 
	b=ewRETs+nlzX/uwXuHjz2j4e+7xhdLtvFguXDVGeTqSK8ECIshNID+PLrmgK5z4eAdqKP3gY530wrWVDyA01TjHkEiBkDYLIBbmjaxSOVcvFUXyUMV6BiTBH3PG8x9KRlhK5iw/QHVA2EP3VEi9lANwYcf+5a/ntHYbrwSPuzx/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789170305;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=eNDdbCbHpg/fxFRYGzGBoVT9mhaLaK9XsQQ36czY1j8=;
	b=Hr/zkX0mRbUuJOWQTt93YRSCAeQr+C1t8Gra5hNpIcZchu/KnrTl1vv6+6QVoD5c
	x4ncLCNMXVKd1I7pLHBJlJHPgcaPVxlnZtnH36grHay/6DCjHo5HZiNi8Rdg98iyPjn
	M5wvMF//9PkJaDCdx4iPGzNpzayr6f8GhnAovjkE=
Received: by mx.zohomail.com with SMTPS id 1789170303779434.8804821205903;
	Fri, 11 Sep 2026 16:45:03 -0700 (PDT)
Date: Sat, 12 Sep 2026 00:45:00 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: markuss.broks@gmail.com
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: add Mali-G68 support
Message-ID: <aqSSGQiftEcT3wSd@sobremesa>
References: <20260803-staging-mainline-v1-1-5071dc782149@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803-staging-mainline-v1-1-5071dc782149@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.168.11

Hi Markuss,

I've no means to test this on real hardware, but other than that:

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 03.08.2026 12:35, Markuss Broks via B4 Relay wrote:
> From: Markuss Broks <markuss.broks@gmail.com>
> 
> Add the features, issues, and ID for Mali-G68, a first-generation
> (v9) Valhall GPU.
> Tested on Exynos8835: the GPU reports GPU_ID 0x9204 (G68 r1p1).
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 2 ++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c      | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_issues.h   | 8 ++++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 52f9d69f6db9..34c65847192f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -121,6 +121,8 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
>  	BIT_ULL(HW_FEATURE_CLEAN_ONLY_SAFE))
>  
> +#define hw_features_g68 hw_features_g57
> +
>  static inline bool panfrost_has_hw_feature(struct panfrost_device *pfdev,
>  					   enum panfrost_hw_feature feat)
>  {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 7d555e63e21a..83223192a544 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -242,6 +242,9 @@ static const struct panfrost_model gpu_models[] = {
>  	/* MediaTek MT8188 Mali-G57 MC3 */
>  	GPU_MODEL(g57, 0x9093,
>  		GPU_REV(g57, 0, 0)),
> +
> +	GPU_MODEL(g68, 0x9004,
> +		GPU_REV(g68, 1, 0), GPU_REV(g68, 1, 1)),
>  	{0},
>  };
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index eb60cb83667a..dd39946bb572 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -265,6 +265,14 @@ enum panfrost_hw_issue {
>  #define hw_issues_g57_r0p0 (\
>  	BIT_ULL(HW_ISSUE_TTRX_3485))
>  
> +#define hw_issues_g68 (\
> +	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162))
> +
> +#define hw_issues_g68_r1p0 (\
> +	BIT_ULL(HW_ISSUE_TTRX_3485))
> +
> +#define hw_issues_g68_r1p1 0
> +
>  static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
>  					 enum panfrost_hw_issue issue)
>  {
> 
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260803-staging-mainline-ebe89543b632
> 
> Best regards,
> --  
> Markuss Broks <markuss.broks@gmail.com>

Adrian Larumbe
