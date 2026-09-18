Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F14B4864
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748326; cv=none; b=BgrrBg/tN7V+yjUqCnUyE/oIqgdKWv8UD3m54aAyt1di99+8h909Pv99WaWri4cGCYUuzGEzvicZAH7wY6nKeycJb15+sczH0A1HXZMhuR1TSuX3gjxQp5cm1Efu5uVMDbsydqMOOYL2URrzvHrwdhmfP6wUHBJ2dKRVuXUrZ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748326; c=relaxed/simple;
	bh=58wNSoF3SLPEsw/UfT8kALXhRyGhLdeLuPi/koBCjj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5sfX1kzVSk927AqeOYH5gakdPu9wbHMMF3ts9DucP33LjYxfk/XNQZcUrIBn29+QZEf05y9o/JUBmV8sAyzmBN2ibNo8xGVH77kEz56j47fmAScrtKDUIWIHcNUAf11YIljI5CRmu0RGV8NDXBpczVA0xnwStePb5APbiEotVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mArLETTa; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mArLETTa"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so4456755ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748324; x=1790353124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=mArLETTasDr5ORG8A4ln/RdIn6h4vCYYrTYwMzgGsM7lyi60Y+HmZaOj6TAnzXq/IK
         ittenCGbCUA49PlKbnQrqs3z2U15gWNdgrbkZtiM2iacf4T9tj7Y5tAkqJZMFXcJrXFK
         /2WHMtp+g2muc94KsuZMCKuM5bIqKzPLWpEF0MZMUoYdCuJzW+mHeQVrHxF7r4H/7/TD
         4W8LzHgbEoI0h1nXI4H+k8GySGQfcR0xvYa/qd04/6Trtc7/dbtYnro+1WzofUUW1W5y
         6tsg3hWgpAnMDA9fcPIf0pysEq/jCJlNrS3PdiY7b0/Silo+wS8CADBmzLpF2zB2XZUR
         +8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748324; x=1790353124;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joaMZtZ2JkCfx/7wOkt6uB/JF0GtO4C1SVtTGC6XgyQ=;
        b=nmu9paNsWcjWGhCmUSy3kqXxCVfvTXAcMYKH3xlCSRxUOi+g9mB+kZoWx18yTxh0o9
         1uEQvEDgq/Nvccio0AtAMaSfkVv7qm2nRPPldDOCHWmVZxFfjy6At+QLpn1EbHmrRYp7
         SNx7wJ/upGyGUxBCTczBrW3GKcy+zGvxudfIaOj5ueMBKgVNsW34rbiJ3IhQJU/i64wt
         NcQznqMV8YozHdbVMhrQ+AhXyuemeiDOrFCmws0a0D0xQa5UqfrkSWdcSBQDQ3wLTtvY
         MQe5vFxWpn1FrzTervdETMu5BrQZqtFyFvYDoqwq/BJaXZqrLfNZ1DDZ1vdrgvcPxNfm
         JeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+w+SwtXpv2pSxtoWE5IJUOXuAlLF8gCUwlRP3jXiZQ6auZM887U/cpbwMwPAc1btwQoYYpB0LoqW3Vzc=@vger.kernel.org
X-Gm-Message-State: AFuF++lbEfNe+aCbUUGv6DJgf/i5jWHy3Xk0fLYmL1LzYOsENkpMu85M
	tyPDvPJjK0A8EdktE2EScOTrPsz7FExG9rTMOl6olu5xDjtFeclNLeEJ
X-Gm-Gg: AYBFou1WhpLwM2HO2SCYFlMHASYynvaDMxIoMvSqt1YICf3A2F4s5t6gvl7uYM5Ci7O
	S45d3C7F5phBBvRR4tQAj91tfOx67Ta5KRWFys1CD+sqvjhJI8P5h4FILHpCFlq1HqHP4VDAgOj
	MBIVFKn3pt1Y9JptDQaxApMlpotraViuy7vm+eaW9Ii+82HJEBbSGXS/vnJ2w1cFoTkIDIpOQQ5
	MK3lGu19/DzYXZkmCM0ptXjxzZ6EGDvV+tXSklB5Wz0VS+8moXeoFpIFrNL9gvaqlGzkg5DyuDA
	/hGExKddVJKjWhGLCmi7pKdblGD0t43lSXTXbJDDc+G7Gq6sPYKj4VP+PFtm0zH1covVid4q9SP
	S3nERY3sARDQWkDg6UwCD+kR7O3xzJ8y0Iq7wBpL8hl0aUrMUGAW7LSSS2qWB1QtYQ4d0F5t8qm
	PP/kpUmsOMBl2teYpwY1FOYjdEY55S0yLD7zMjaG8Ph6Wmo4eestTzGKiaCIi7bipUaH8eS8SYk
	/RMqkseDj+qN8xJSw==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:2097 with SMTP id 98e67ed59e1d1-39e6c6a2359mr184187a91.56.1789748323892;
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm1814952a91.3.2026.09.18.09.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:18:43 -0700 (PDT)
Message-ID: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
Date: Sat, 19 Sep 2026 00:18:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
 <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-9-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fangyu,

On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
> attaching a second-stage domain, if the IOMMU supports AMO_HWAD.
> 
> Software pre-populates second-stage page tables with D set, so
> enabling GADE by default does not change normal behavior. When
> dirty tracking is enabled, iommufd clears the pre-set D bits and
> GADE becomes necessary for hardware to update the dirty bit on
> write access.
> 
> This avoids toggling GADE dynamically and keeps device context
> setup consistent with second-stage domain attachment.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/riscv/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 16779877351b..f01fd4e2f840 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> +			dc.tc |= RISCV_IOMMU_DC_TC_GADE;

I might be missing something, but I don't see how the GADE bit set
here reaches the hardware IOMMU DC. In riscv_iommu_iodir_update()
(in patch 04/10), it looks like only the V bit is taken:

	tc = READ_ONCE(dc->tc);
	tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
	...
	WRITE_ONCE(dc->tc, tc);

I saw that you mentioned you tested it on QEMU. As far as I know,
mainline QEMU has not yet declared the AMO_HWAD capability. Could
you clarify whether you used a modified QEMU for this test?

Thanks,
Shuai

>   	} else {
>   		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>   			return -ENODEV;

