Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526952;
	b=SyUgQrYbVhHM1ZODEk07IWA8EXH88zL2aJ5nMDaXQY6XJtclhGr38QCvHVPG/mNo38b4
	 uE8484e9E2i3bWJL4OnyPru5ZL0My34t9tsbmp3J3/KRqpdY9OI2M5FPq+0XxuxX2xeVj
	 9375tsZ+vXsHinu8Wdh/gixP+QzVDzDx+TxjE+7IWg5390p5ey2InGoNMq3rwnMsk0hKn
	 MMVIU3cNsJL50rrxxnz6+TCClDocLI06F6hIm17zTy6KUq5pu4RA2PWLkfdaPIlP1wT7Z
	 MWVCavh/IaFxAI9+TuFftI9b0Y8HRVXB/hFu/Lt7ehxsHVk1u6KNMKK84g/axmTVAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526952;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
	b=rFStCGPAh+s8WkXYL4+4jp0h8Iz7Abim32UOgYzkk3iwLYQFJI52NM5a79X4MgbnrhXb
	 VRtqZr8dpyuYE713oo1nmqL2lNAkX8QSHffM6v6q8/W8j8uzff78m0rpbKEWJZdt9Grz4
	 U+6eDokJ9bYGsUB1MWAsOZh+kTDPMAL17Zx1NrRCS5JcreXxTmefNV7u8SUirsl36eR94
	 gKCt/VIcCg3pUhw6msJzp/5xs/WUk/QBSVE65AJmR6dedkHHZlFBxzec1K/DU8bstBonw
	 NupRY/ufSKtYlK6j/SXWLsDOqIRKBN4jkgO5VxsQRDaXeWdigX/iY9VbB8ZEkzqm2+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKwuKFEG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="ffuE/ZCW";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290FA606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKwuKFEG;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ffuE/ZCW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794526951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
	b=CKwuKFEGpemc9k2K2TgdvQqIJnuUnJd9EwXCQQnfo2zvXwg6ULxCH3H8vo+xawfn99ISZy
	w8T6Oh7JnNHX9D/bGm1tDsmDkbPkbk0o0WE/NFXkpLIxU+rzgSwObUZMtSKbbbIIerpDzR
	VM6qyvNQTk148SkwfiQgDB0a0BnTsuY=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-VKSCG6MeOBy4iiltDYwx1A-1; Thu, 12 Nov 2026 18:42:29 -0500
X-MC-Unique: VKSCG6MeOBy4iiltDYwx1A-1
X-Mimecast-MFC-AGG-ID: VKSCG6MeOBy4iiltDYwx1A_1794526948
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so267687c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794526948; x=1795131748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
        b=ffuE/ZCWGah5vwmNi4jFUjSVkvfc0eiSmkQqLnqtUoHRmueOrE3zYX4VPMwqx/eeG7
         AGWGTESlxQQ+YMMYQnacv25kuq4BJqyorrGMiOEn+qCxwYurzDPFX2qR89xy1wFHOoqG
         UjMRAxIH+VbXgC6qI28h2Sv4xaM3fRSL6P8tJzRHN/MMAON/4XpqAY4dKqiJ3tZlL7aV
         p0wp6A/NzY1caaozTjimEsHrLgqBhRxitPuxwWcRw3XwS+m4styd2IjZ+DGyw6gTK3X+
         oId/DFUnjXn5d9UCtG55goVa4+KhaFbxJoVJz3CNrqUJcg9JBis1boc56sVTyDDfQ4TE
         VfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526948; x=1795131748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
        b=ksC9GErAvei11axepTr7Q6oZugME3/3sWEraUAnWt+qlDLjcPFvQQEbMANgAHF5Lni
         uXLByZd7J5B7slB/25g0ZVpipSdgjrG0PZVNRfQ2qsYLlatqBhhBlqiYnqO7T7Z3cFn9
         /kEmBOpOJQW42/LqFVMJH/Sp4aat2ue7dffZ6cIgWrz3/YAhCUyUQVqCwx3a4723kqPa
         jIWopEy0E9T/v1SeL7CZaVrLa0nFG0Ffr/0JTv5KTX0HylLTGkw4WYWp7HZ4i9ex8q8g
         N5hJ9vyCDINJG0G6Wz6N1z5o7vHF4P8F+kQcjLIZlB7WRs3Mb/JseIxKZ9uxl5wg2mVo
         ty9Q==
X-Forwarded-Encrypted: i=1; AL+hErFIukhgbaaUtS0kXWVmLlA9TKvVpikIOGfchSqR+x23GUoFQtjuFtaZaw+NhA22F3ZBo4lqN5IrJAKloVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0nunBD7uk7gFJV1opscTcISHgRxGV7YVjilUYmA+wFWAfeNkN
	WM9UU7NTxVuXdHGyL2KUUy8yFlN8NWBFR9OXS4ZOvTn3SXzY7NCyFimu0RdMvg+lDTbPGdRelIp
	n5JAXhkWRp8FttMbkRTV1E8heBCGvnRUI/qTcAE/47dhJA7BkgbQXNMJhusMqIze79g==
X-Gm-Gg: AYBFou1PynYYL1xuE6YtDEJ98sUQAFihV1JGZJ2U7bYx1c7fzFBW7FyZ3rL/vZ6GEaO
	7MxcSFBUbym28NW9g1Vp7jloyIB3C5/j9IQf6ekqkDrA3dvtYnWvA7KroH0nK3bbG2kJYSmn/hv
	AeMmIT6dpJR+NXjut8dgQLZARzT+rXkFScDCjrx+6hVgqdXlj7YuAB0pKBBoaMJuE88/EBfvQFd
	mBvokbYHMDblooFrTVFW3enjtXBciRsyHTxwuZPIQXUPM5LUB7y1F4zF/Jm4r6KxG0DhVpr7B04
	wMAqxr3Ga/XhYKlCLsDgWUT3Lo2byHumaWKhQ9nxv7QegClrE7JVImRrkl7GGE5Co9bNaenryWS
	vYuZCrEc1Ob8p+hrEipdG3fOzNph2gojVqQd4kFAlAz+okH9C0MMzb5RDhJbhhcCfQWq1XOWSxi
	5nJ40rZ7RJ1yJBKC4=
X-Received: by 2002:a05:701b:2616:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b5030e74dcmr678968c88.8.1794526948221;
        Thu, 12 Nov 2026 15:42:28 -0800 (PST)
X-Received: by 2002:a05:701b:2616:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b5030e74dcmr678949c88.8.1794526947710;
        Thu, 12 Nov 2026 15:42:27 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2689566c88.5.2026.11.12.15.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:42:27 -0800 (PST)
Message-ID: <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
Date: Fri, 13 Nov 2026 09:42:21 +1000
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
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 6:13 PM, Jinjie Ruan wrote:
> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
> requested, even one that has no MPAM cache controls. Mounting resctrl
> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
> its CLOSID count at the number of PARTIDs. Control groups in the upper
> half then map to PARTIDs beyond mpam_partid_max, which index past the
> configuration and monitor arrays and program out of range PARTIDs into
> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
> disabled.
> 
> Do not enable CDP when a resource cannot allocate or is not CDP capable,
> as x86 does, so the mount fails instead. Only the enable path is checked,
> since unmount disables CDP on both cache levels to restore the MBA control.
> 
> A system where only MBA can allocate, or that only has monitors, now
> fails a mount with CDP as well: CDP hides the MBA control because
> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> ---
>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 573617ba09df..afa3c084c475 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   	if (enable && mpam_partid_max < 1)
>   		return -EINVAL;
>   
> +	if (enable && (!mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
> +		       !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
> +		return -EINVAL;
> +

x86 only checks 'cdp_capable', so this check isn't exactly same as to what's
done on x86, as claimed in the commit log?

int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
{
         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];

         if (!hw_res->r_resctrl.cdp_capable)
                 return -EINVAL;

         :
}


>   	/*
>   	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>   	 * false on error and unmount.

Thanks,
Gavin

