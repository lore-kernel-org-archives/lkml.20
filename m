Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F693F3285;
	Thu,  3 Sep 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429387; cv=none; b=QiJnce8b2zUgwwuaNrp07g0FosVDR7UzE0uv7CD12KCQYf7EA5SN1qgRQGdd3UG0hy4me9+9ltSAryRmaOU8LMoYWHo8NsW3YboAxevbo5/9xWUt1/WUT8dJNWePMs9XJKnb6YdybV97x0n4E6vvuGkrS0aENLRrb0dM7C+Fm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429387; c=relaxed/simple;
	bh=Uht9XxfG395aCnOQoxfXrCtmwg0SKPqoW/aycFlFH64=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EJsJZ3dcYB6WhzLSyahaXqZZX7KY0mF64GvFCZlM/t0PxUndXJOg6VdY7hOzifHNR0yzNP9AtpSm0nIA1Udp5UDZDCk4GP/AIXa8V+3B6o5NZY91ioIP9BJmfuu/txfI1QTk6IE3LpgFkKlJNlKuXF28A+sNA+z6/PE7tNkoIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=J11gRP8D; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="J11gRP8D"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JUdkjCJVGPeXYULrHHVmfZBOStTpTVs4AyrGYzcTvs4=;
	b=J11gRP8DBJ4v4k/Gakp4eEUFxoH6cxOLr83ZmN96sJU+OAZFYGoi6Z8BEfFu9eqMAxJxr4N0W
	y0RvQdwfc0dKhqc2wAoOIFLT79fLx4xfaINTjGHD47gBeRqLzRezVD4b0xZivxqd46qn1oP3LGl
	wRei+fif4H9aRD4R/0Nb12s=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hbF7Y1ClLzpT1C;
	Thu,  3 Sep 2026 17:44:57 +0800 (CST)
Received: from whupemk200014.china.huawei.com (unknown [7.152.185.79])
	by mail.maildlp.com (Postfix) with ESMTPS id AE0E040575;
	Thu,  3 Sep 2026 17:56:19 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 whupemk200014.china.huawei.com (7.152.185.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 3 Sep 2026 17:56:17 +0800
Subject: Re: [PATCH v2 2/2] RAS: Fix out-of-bounds read when tracing arm_event
To: Abbott Liu <liuwenliang@huawei.com>, <tony.luck@intel.com>,
	<bp@alien8.de>, <jic23@kernel.org>, <ardb@kernel.org>,
	<rafael.j.wysocki@intel.com>, <mchehab+huawei@kernel.org>,
	<luoshengwei@huawei.com>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
References: <20260825134323.4181892-1-liuwenliang@huawei.com>
 <20260825134323.4181892-3-liuwenliang@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <1316fa8a-5611-6728-3517-bf4bf0ccbc3a@huawei.com>
Date: Thu, 3 Sep 2026 17:56:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260825134323.4181892-3-liuwenliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemk200014.china.huawei.com (7.152.185.79)

On 2026/8/25 21:43, Abbott Liu wrote:
> The vsei_len < 0 error path did not verify the pei_len and ctx_len.
> When vsei_len is negative, section_length is too small to hold the
> full record, yet pei_len and ctx_len were derived from
> err_info_num/context_info_num and may describe regions beyond the
> (long)err .. err + section_length buffer. To prevent trace_arm_event
> from reading past the allocated record, sanitize the parameters:
> move the cpu lookup above this path so it is available for tracing,
> recalculate ctx_len and pei_len based on section_length, limit them,
> set the corresponding pointers to NULL and lengths to 0  when there
> is no remaining space.
> 
> pei_len and ctx_len become s32 so that the recalculated lengths can
> be checked for negative values, and the cpu lookup is moved above the
> section length checks so that both paths can share the final
> trace_arm_event() call.
> 
> Fixes: 05954511b73e ("RAS: Report all ARM processor CPER information to userspace")
> 

Same here, no empty line between Fixes and Signed-off-by.

> Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
> ---
>   drivers/ras/ras.c | 31 +++++++++++++++++++++----------
>   1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
> index 2540538a16a8..4a48a897f616 100644
> --- a/drivers/ras/ras.c
> +++ b/drivers/ras/ras.c
> @@ -58,10 +58,10 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
>   	struct cper_arm_err_info *err_info;
>   	struct cper_arm_ctx_info *ctx_info;
>   	u8 *ven_err_data;
> -	u32 ctx_len = 0;
> +	s32 ctx_len = 0;
>   	int n, sz, cpu;
>   	s32 vsei_len;
> -	u32 pei_len;
> +	s32 pei_len;
>   	u8 *pei_err, *ctx_err;
>   
>   	pei_len = sizeof(struct cper_arm_err_info) * err->err_info_num;
> @@ -81,20 +81,31 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
>   		ctx_len += sz;
>   	}
>   
> +	cpu = GET_LOGICAL_INDEX(err->mpidr);
> +	if (cpu < 0)
> +		cpu = -1;
> +
>   	vsei_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len + ctx_len);
>   	if (vsei_len < 0) {
>   		pr_warn(FW_BUG "section length: %d\n", err->section_length);
>   		pr_warn(FW_BUG "section length is too small\n");
>   		pr_warn(FW_BUG "firmware-generated error record is incorrect\n");
>   		vsei_len = 0;
> -	}
> -	ven_err_data = (u8 *)ctx_info;
> -
> -	cpu = GET_LOGICAL_INDEX(err->mpidr);
> -	if (cpu < 0)
> -		cpu = -1;
> -
> -	trace_arm_event(err, pei_err, pei_len, ctx_err, ctx_len,
> +		ven_err_data = NULL;
> +		ctx_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len);
> +		if (ctx_len < 0) {
> +			ctx_len = 0;
> +			ctx_err = NULL;
> +			pei_len = err->section_length - sizeof(struct cper_sec_proc_arm);
> +			if (pei_len < 0) {
> +				pei_len = 0;
> +				pei_err = NULL;
> +			}
> +		}
> +	} else
> +		ven_err_data = (u8 *)ctx_info;

else {
	ven_err_data = (u8 *)ctx_info;
}

Thanks
Hanjun
