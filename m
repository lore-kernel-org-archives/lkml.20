Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426691;
	b=Ro2T2RvV4q4hqHQ2XM064+4VolrWkmmCXqbyzWDRpSfWRnagx5VFjxKG9oNxIMTlng80
	 oNf10hQfeKhSb3kO9jCj3CnP485bKeDUaER8yh5OPdIgfUzqdy4AttmRCI90xxT78Zvqm
	 OFgc+1t7tpkOKiWZFZwHtgCz4AfVHwAfn1hJXbIYYBUdgm8bdWdJpvYvVokiAdoF3saty
	 n0mvVD+WLgFP2+5vDatrEvfkGAXEGk4UxM3A6WzEM342MYPk4D1hmtRkRAlncZl6453Lt
	 1uhXqZ9TGLD1QqGaT0OdGcODVb43pJ3Z9v2lv5WTrRY5A4tBHQ3IvFPmA3m6UwiZuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426691;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NnDnWT8nfy0oU8oxY5YNCzl+YDj5L9kNPFLlGZgp4nU=;
	b=2RKVok2CwELTABgBzDKu6QVh30Py41zpOSjutA8YigThVyVBCzJSeLWf8ug3QHpW4REY
	 2wqHJIvkcq+Vy96tA199je1OyhlLi2EdwKBqApsh3vKWKDJBeH7xXQu7KvoM7aeD3Gcfc
	 n3H3vPr6ix4p9PiaPQc5U36vT8DZmrEwdInUoYUWwFRSlJIeCKRgfe74wLZtFlyWmWupY
	 UXEaj2z1yOh36f9j5My5/kjEYt2fvF+wkr8TZ0HaQMY7wA5LW/0y/2ZCgPHGM0D2YMfxc
	 qCkhZMbIQ3c7SjvN89WISTd+AQ0GnVyKTiRbbbC8tjDd2XQe3VgmktbjiDRgqqAtVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dIm66M1A;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DE7606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DE7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dIm66M1A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570D91682;
	Mon, 19 Oct 2026 09:18:06 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C509B3F673;
	Mon, 19 Oct 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792426689; bh=PbsjFNsm7VGpra2Vi/6m7D2lXbbkOy07UDe6RsBa9ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIm66M1AAK2DTm44/RC4CeugGbPKALRrtpOthiN3TkCk8HDpMEc4iEOa+cmjqwb5R
	 ulegfB5hJ66aJK/3G88pPELm6ERKzjk9ZsN9+Oo4RKow07arEuVNIOr+WMewv0rCQl
	 C6Wjj3gFBsBR2vQMIhwp5atOH3S9mjtqsScSHjD8=
Message-ID: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
Date: Mon, 19 Oct 2026 17:18:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not
 have it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261019124612.134035-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261019124612.134035-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ping,

On 19/10/2026 13:46, Ping Li wrote:
> mpam_msc_clear_esr() and mpam_msc_read_esr() read MPAMF_ESR
> unconditionally, but the MPAM architecture only provides this
> register when MPAMF_IDR.HAS_ESR is set. 

This isn't always true. With MSC v1.0 then there may be MPAMF_ESR but there is no MPAMF_IDR.HAS_ESR bit.

On an implementation without
> ESR these accesses reach unimplemented register space.

Rather, they are either fully implemented or RAZ/WI.

In version B.d of the MPAM spec section 7.3,
RLNXX:
If FEAT_MPAMv1p0 is implemented and it is not possible to detect error conditions, then MPAMF_ESR
and MPAMF_ECR must be RAZ/WI.

PNPQQ:
If all of the following apply to an error condition, then an MPAM MSC implementation is required to
detect and report that error:
• At least one feature that can cause the error condition is supported.
• The MSC is designed such that the error condition can occur.
• Detection of the error condition is required. See Required error condition detection.


These two rules together indicate that for MSC v1.0 that MPAMF_ESR should either be RAZ/WI or
implemented.

SJFMB:
If all of the following apply, MPAMF_IDR.HAS_ESR is permitted to be 0:
 • FEAT_MPAMv0p1, or from FEAT_MPAMv1p1, is implemented.
 • No error conditions meet the criteria in PNPQQ.

Together with the comment in 9.5.5 for HAS_ESR (quoted below), this indicates that for MSC v1.1 that
MPAMF_ESR should be RAZ/WI or implemented.

"
If an MSC cannot encounter any of the error conditions listed in MPAM MSC Errors of Arm® Memory
System Resource Partitioning and Monitoring (MPAM) System Component Specification (ARM IHI 0099),
both the MPAMF_ESR and MPAMF_ECR must be RAZ/WI.
"

As such, reading and writing MPAMF_ESR should either behave as per the register definition or be
benign but ineffectual. Have you got a platform that behaves differently?

Thanks,

Ben

> 
> Read HAS_ESR from the IDR during probe, make clear_esr() a no-op on
> such MSCs, and have read_esr() return -ENODEV as the register
> cannot be read.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 7 +++++++
>  drivers/resctrl/mpam_internal.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..a473b2872183 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -388,6 +388,9 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
>  	u32 esr_low;
>  	int ret;
>  
> +	if (!msc->has_esr)
> +		return 0;
> +
>  	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>  	if (ret)
>  		return ret;
> @@ -415,6 +418,9 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
>  	u32 esr_high, esr_low;
>  	int ret;
>  
> +	if (!msc->has_esr)
> +		return -ENODEV;
> +
>  	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>  	if (ret)
>  		return ret;
> @@ -1205,6 +1211,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>  		msc->partid_max = min(msc->partid_max, partid_max);
>  		msc->pmg_max = min(msc->pmg_max, pmg_max);
> +		msc->has_esr = FIELD_GET(MPAMF_IDR_HAS_ESR, idr);
>  		msc->has_extd_esr = FIELD_GET(MPAMF_IDR_HAS_EXTD_ESR, idr);
>  
>  		scoped_guard(mutex, &mpam_list_lock) {
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..b648c006e102 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -80,6 +80,7 @@ struct mpam_msc {
>  	int			fb_id;
>  	u32			nrdy_usec;
>  	cpumask_t		accessibility;
> +	bool			has_esr;
>  	bool			has_extd_esr;
>  
>  	int				reenable_error_ppi;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad

