Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791476;
	b=XBvbJkvGoNk9mvI/Cp8L4m5U17tcDpd8a4SxSWtJE5Ot/U2T8ZAdTMRJd9BB1qd99Kvd
	 3plVUmd+TyjLP4faGGEsfce8szZ4CEmxlGXmMFAGmK//xvTEtWPh2EKEf9xNWeG3LlfnX
	 HnQ878agkpeLgdLmm+uWZpWMNkMAskZg9JBChSmkswf5v6Qx03/xWErAFCZSkDTEhBMXA
	 C2Nqhg4uXv7rqovNfKGdv2KtX08LC46W5P4QaLbFRMUyade3TUdaYqqlYlt4TzIFCXSW6
	 E6AF32+4OUWp7Jo/nQJDLtHYNVfmu2ne2qbGNv6FCcwuvTEhuLjzUr+W3+xpcQXIUCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791476;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kDk67lzWfFsCYZhs+URfHejnsQjHQKAdi21nEjEfkGQ=;
	b=AHy7D20ukgCXzqt5BxaespHhYQT/65tM7mpwmiQTLraOz5tMssYrbPruZzi91Rg4ATBb
	 FC48wtqlpzCI9dXk+NhjgCjw79qUSuNt7pSf2EHsgqBiaUeJRQeCoS6ahxD6G/P+QGiod
	 El/6KcS0dAXnuJN8j+8oTQyJZjfUGBWIE2On30PIsaAyROJBBehVbQ1qEezbeuuXPTz55
	 jfuCQ8h90eoTpAV1bflnh3Hfop4canInPj9HClm+x8RBpz3tiFQH7MhhVpgpdmi04Z0l0
	 2UhD+Ss41QyAXMzqNZeZcWcUm8x5cGlR+j+kxi9sz1133fOGpafoppN5GVKUg6iBs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="OAlhM/b1";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B552606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B552606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OAlhM/b1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E405F1576;
	Wed,  4 Nov 2026 03:24:31 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4133F632;
	Wed,  4 Nov 2026 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793791475; bh=cNxLHKyKxNfmJ7kK8jwQOdBxq1jdZRXYKMxUjflNzHs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OAlhM/b1UTDCKzHxVKcWTVHHEiWyoE3sOAS4WGx61rTB5VMFvG8P8T5fTW41sJMuS
	 ZAbEa1L5Umt4WXeDaT02Am9/gtSjfRoHgWFuf0W85ST6HEfe8d0YD008dplkLjN45U
	 Xh/1LHcOvctYNx/2RYy6/tFKeFJn6SAJd72YDDjo=
Message-ID: <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
Date: Wed, 4 Nov 2026 12:24:23 +0100
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
Subject: Re: [PATCH] arm_mpam: Restore the cached configuration when a write
 to an MSC fails
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 gshan@redhat.com, jonathan.cameron@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104101541.563113-1-ruanjinjie@huawei.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261104101541.563113-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/4/26 11:15, Jinjie Ruan wrote:
> mpam_apply_config() caches the new configuration before writing it to
> the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
> so a retry with the same schemata is skipped as a no-op and never
> reaches the hardware.

Do we really need this? Has this been observed to solve a problem?
If any of the MSC accesses fail (for MPAM-Fb only), we already tear down 
the whole MPAM driver immediately, so any subsequent accesses wouldn't 
work. So I think there is little point in trying to fix or restore any 
configuration?

Propagating errors up the call chain is another issue, but I don't think 
we need to care about any hardware settings in case of a failure.

Cheers,
Andre

> 
> Restore the cached configuration on failure so the retry writes it to
> the RISes again.
> 
> Only arm64 MPAM systems are affected; x86 does not support MPAM.
> 
> Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.4.x
> ---
>   drivers/resctrl/mpam_devices.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..bb667a416660 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   		      struct mpam_config *cfg)
>   {
> +	struct mpam_config old_cfg = comp->cfg[partid];
>   	struct mpam_write_config_arg arg;
>   	struct mpam_msc_ris *ris;
>   	struct mpam_vmsc *vmsc;
> @@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   					 srcu_read_lock_held(&mpam_srcu)) {
>   			arg.ris = ris;
>   			ret = mpam_touch_msc(msc, __write_config, &arg);
> -			if (ret)
> +			if (ret) {
> +				comp->cfg[partid] = old_cfg;
>   				return ret;
> +			}
>   			ris->in_reset_state = false;
>   		}
>   	}

