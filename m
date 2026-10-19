Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CBD48424E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398488; cv=none; b=RXvWYLulS+Lt0Cr71z6wuXQ5J8Tuktoqk0B8h0O/SwnNI/VmP0WRqIDL5cjK0P1wJ0XJ+iXJgCDpS5nHZIvG7To6N/JqIkiNO4em/TCWo+upGW3zCTQlWsJD3nfDrqBqSTq6UmkRWUoNTtF2Q2O9niu6PwDCl8s5GTVZ2r5yctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398488; c=relaxed/simple;
	bh=pQsA1/9L48+1FbhAD7/nQMhlBzVxWlKupGDQogtkPi8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=D0O0NgSi5djZANJ3bI9WP7UmoQuBYhN846qXZbtnSSvoPHLb2WgnfutO5GJalkupRPkN873Z7ab3LhhJP61S76sgZxmLgzFwnsiozAHGKuKFKjDCe5pIy9mAiVI0EF7eMHMJw2IkAkAtJaBaFT1udq/34iqnDhQ3ca1Qh4sFCxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zQFp4s08; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zQFp4s08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792398481; bh=1ZQjCdwdc+3/EMR+bhODb5ndwiVY4jLzLjjJKET5YTQ=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=zQFp4s08N1ICbbe0GPHdoh5j27ix9fgQPK8WSFDf9anwrqo09vJdl7A5hHF4Oeys0
	 zdYU9SFRUJ+gEFtCiN+f/a8te77HoJ3o6aKEA8a+R6Sz8qOxOGTJHTXnMT0+4H5k1b
	 5WIgzubL655TwTmH/AAsZiIUlhtQpWDhOK18nfVI=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 6F9294AA; Mon, 19 Oct 2026 16:27:57 +0800
X-QQ-mid: xmsmtpt1792398477tumax43vh
Message-ID: <tencent_B0F56D8514DC8CE331DC0A41DAC2842B6206@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+sqk+jSzPYymou3QMGEv+IqGLiG9HGwBZCtv3tug9lDoH9oLqIJ
	 mtjPKOPL++h6BO/aFHiKVEdLQ/BMeKEDEq58MS2L+L4ETa71IgwBtVWzUNlJkfmJUUL/WjrlvLFh
	 zQZDYXq0yVPopoPxvhvs3lAnO4cq5QKvolmC5tHtK4+E2ZV4yZeSjvOPnuRNxV/n3MOGFh/MiKRB
	 9BZuyRl12l/LBFMVcTBd5IaZFr3DQrGjs1I0i4RjV604WgbhfghmRgonERvCgSOhwm0YByXuHFDV
	 +efGy5qUKn+sM19yC+ASYdTPmgD31VmvFYSXm+OlopUT+UwGHnXna3T50Irq8OKebCWu9nZIQNJx
	 eB8BoCS4inQRQc+/4upjQM65doFnEGmfh4RDoqhoAXo3W3hOrJtjbltSTadl0JBEa8ZKPDEXrjcW
	 8Tf/sQ6tUEuS7TwTvm/2DHEV1BBRhgklo5JeaoBhpn1gBOZJLaAKG6pp322OBaxt88GNgmlct/Bv
	 Ze0Sks16hs9GZCyqJJu9uMB9f+nRtfWYJ4I6fUmfAJjTo8y99nJCQ30nr8xTeyP/o0W7xMH5yHlp
	 vNG6qdXMKGPNzWozw72AdaSSM6aeOanW4a9clKeCnaeBLdPZ1byuZyMGyBCpy1vs/ccU2daHQWVp
	 /aFN4RIhlajHQ7XEPZjVyTPJS8msxa2FJZEeVfCH56Vo/FQDuBa04S1haX3bxio0MpKB/0BOstZG
	 2e7/QbmuYjoAdxsph+FD6faD7YmgTTvQ4PI4aPFfNTzAB4THS5bNRWMB/FrSyc7FLQqiCKXjddYa
	 9CVpvjSViV3Be5cQipMBo0bcVm0+jDwpCuMJhs+gRYFDJjiOZmUzdMDhxu7LhlES/DovfwXrudoU
	 YfzT/4HhPKllUty0lKy9aH0FkV0+WkiAdvoamUMRQJRwA+Zi5DIjEfEf5P21f4wPTlezwCy3eF7o
	 Lg5Cij8+vuUBwKka92ofT4PdTGQTNCUdFxUaqTiCbZXSWJnCf6lYscPZnRS+8anCSfikFgd8OHZH
	 eVan7KCFzBJASdTLav8VO0nCP0RCfPl6HXB3cyoykcm61i4DgzpovJE078FRt1pKhak9h53SXa4W
	 bNM/EBdsBed/8nuX426POCIcGRsIideab+VQGSq1haFyjkJWU=
X-QQ-XMRINFO: OD9hHCdaPRBw7uNppDvbTw5pCwkkOOzw4A==
X-OQ-MSGID: <97451c53-1943-4e65-b247-b0ebbbe59e9c@qq.com>
Date: Mon, 19 Oct 2026 16:27:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/15] arm_mpam: Identify the non-aliasing controls
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com, ben.horgan@arm.com, bp@alien8.de,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 fenghuay@nvidia.com, gshan@redhat.com, hpa@zytor.com, james.morse@arm.com,
 jic23@kernel.org, mingo@redhat.com, reinette.chatre@intel.com,
 ruanjinjie@huawei.com, tan.shaopeng@fujitsu.com, tglx@kernel.org,
 tony.luck@intel.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_57E8587BC53D6D65E212D1EAD6440A6AA605@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_57E8587BC53D6D65E212D1EAD6440A6AA605@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patch is part of the v10 series. For the main thread, see:

https://lore.kernel.org/all/tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com/#t

在 2026/10/19 15:46, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> A non-aliasing control can't be presented by writing the same value to
> several PARTIDs, because its value is additive. This is used later to
> decide whether a class's non-aliasing controls must be dropped before
> its PARTIDs can be used as separate monitoring groups.
>
> A control that aliases shares the resource, so writing the same value to
> each PARTID keeps its meaning. Several PARTIDs that map onto one
> internal PARTID are configured as one, so a class that implements
> narrowing does not have this problem.
>
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v9->v10:
>   - Include mpam_feat_cmax_cassoc in the non-aliasing controls
> ---
>   drivers/resctrl/mpam_internal.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 5a7590568a05..a4f2fdf7ac95 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -221,6 +221,25 @@ struct mpam_props {
>   #define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
>   #define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
>   
> +/*
> + * A non-aliasing control (e.g. a cache capacity) can't be presented by
> + * writing the same value to several PARTIDs: its value is additive, two 50%
> + * values add up to 100%. An aliasing control (e.g. a cache portion bitmap)
> + * shares the resource, so the same value written to each PARTID keeps its
> + * meaning.
> + */
> +static inline bool
> +mpam_props_has_non_aliasing_controls(const struct mpam_props *props)
> +{
> +	return mpam_has_feature(mpam_feat_mbw_max, props) ||
> +	       mpam_has_feature(mpam_feat_mbw_min, props) ||
> +	       mpam_has_feature(mpam_feat_mbw_prop, props) ||
> +	       mpam_has_feature(mpam_feat_cmax_cmax, props) ||
> +	       mpam_has_feature(mpam_feat_cmax_cmin, props) ||
> +	       mpam_has_feature(mpam_feat_cmax_cassoc, props) ||
> +	       mpam_has_feature(mpam_feat_cmax_softlim, props);
> +}
> +
>   /* Workaround bits for msc->quirks */
>   enum mpam_device_quirks {
>   	T241_SCRUB_SHADOW_REGS,

