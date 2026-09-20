Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CB35AC0C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880784; cv=none; b=FmRpiHhvnhNJ0cRllKpgUa5vQAtHbIkZlhsVrIPJaBKyvtNnvvdAQmsr5S27+IM+vAlhfEiqRP5Ox1av3Wr+Qqnuxf1s2rZ0mBlBmF59EE8skmby5EUdnzXqwaaDtS1mZsbUwriMRWjKwr8fUsL2WL0IfE1S3L7iLU8IBPRuQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880784; c=relaxed/simple;
	bh=H8h65/c7zaftwh3/OIrA0+6Kpnt/HU9wP6V2ImpalYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1b97zFAbgcu+mgzJOdt1FBaHb/RsITuDqfHADRSeAD7xp0KcxACqSERPGaW69GtAxWCtU2GaY0WNWPta2Cdxg8a6GvaEr6vXIjdhDpUmxG9CrmZ2Ae2UpB+YtAvXT9jMifFj8HbOxJB0zoK1NdrzyNYE4RsykJaEvF67Xxg868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpmkOR2A; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpmkOR2A"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso1475907a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880773; x=1790485573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=rpmkOR2AIXuPqIkjno5pyxOZ+KcyeRauM1cDKA82RrPR9Rh4AwdQs4jDww6kWL6XgC
         iaeKZN5CFEMqPlDflWRsXvn/sTNgRwZXVorsF5zUwSJ+DRemFz9glGaDwl1t0XKPWa9Z
         pANXUvRrisAJhHvSUAhHREcI35q8y+f3P2A3yTFMyuvBoVMjJWUUyEzkcQllRCdQzTeF
         t4cLRieT2fYSImAyB2vnlJxQnMZiZtkD1MHWskXmV1MNmoSNgdEGUc288jkBhmBH8MdR
         zijePzbhL5auTiDE6Ot34ggbAWDTlqLAB1G7HPyrIQ1VPppnzWaSVn81nccETnNB6Muz
         fopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880773; x=1790485573;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=PoRaGL2cxwJL15TOBsa0c2yOC/urEbhUACp5rXh7g88bus7ioduGh+4XfbD1UCCiML
         4GjlC0hqdnbSuRuTgVY4qZh/XZ3QY3NAhG9VRw+hkeP50JgRw4xKxoA1LKb/i5HRHzW5
         13olvuEHYby9f3SMlJiu7De2op+AVCP2ZtyW7/03319K1XlfpTzkfPUty8PPiuZ61gi1
         EncevSx1dJZfx0Wo9vLLb3IWj1GL5gwq2qY67ZQ1c3oBNrPUXhIHJg0YHmevYH75EJWY
         p1qQsGrZeBg91AwFC+HNdaOhHsgCqIO0+wNpntw+Gde3FWq99Sh0MNeKeLVjakbn667I
         oTUw==
X-Forwarded-Encrypted: i=1; AKwUvBwvQhanqfJ3iLFlH30ZKgWyJr01qf+aFOpenv04IBejgNcNdfMIwYDp89CzADb+KJTj5UCNFMrBEK7GI6w=@vger.kernel.org
X-Gm-Message-State: AFuF++lkfz07LPhsqdV4znljGJkjezxnY5h03lKzluGKbO8u0Zeshpcs
	FB7Q/faTtnuvg4uJLAUodGWrakP0Xtoz3F1BZH83vBlVzvdYUCnOjyRd
X-Gm-Gg: AYBFou2qmXgZSRyuXjYrEvZsZaMU9Hs1oHLLyZQ8qb7imoeqdmRtioo9rod8tBmqhm0
	8iZzDK+LhdiFegkvdAYRxNTtOsOkZnURdaNF1zcvNOFVNUAJpjxLd17HiAuIqrPscLhTk0QKMkv
	xuL5CTtUIFOhuR7B3kd/HwMN8i3x3RZvdks0+xEta/hJ0F52pMvfBE96WZ58kjyGhGg0dcFsqU1
	kizqbmejMqAxvSOICPbZZnF1cAQfXmv1fnrUPW0HfL7MQZhTRgyT+R5kdFNvshHPjeKEy2tCwkq
	0OLQTeMn4SLjK0QF7aXcjWMuv9i/NYa0yqxgkvqvFppzrVwfCvbHW38N1ZEYNYsBHK8UOa7TFjE
	cU6wXFHg0ajofoLDFKsJx8i+y1FOUx6CkEn29slaYk5tb0nDTNmh+5MBTbWxNstjOyH1kEbqAed
	nHS29YOK3RuUJLtOdVhCyxe4BOIDrIZRW2omk0QTBDeQT4s+ILiD+l7CnvoCS7hQB8X0hkCLXcK
	seXr0WlvcUsgJiZ
X-Received: by 2002:a17:90b:3eca:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-39e6a7f2209mr6292197a91.34.1789880772639;
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Received: from [192.168.50.174] ([124.64.19.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm7433814a91.4.2026.09.19.22.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Message-ID: <8572d404-8a33-4cd3-a14f-ebff7c2ac487@gmail.com>
Date: Sun, 20 Sep 2026 13:05:58 +0800
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
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
 jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
 jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 skhawaja@google.com, tomasz.jeznach@linux.dev, vasant.hegde@amd.com,
 will@kernel.org, zong.li@sifive.com
References: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
 <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Fangyu,

On 9/20/2026 11:12 AM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>>
>>> Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
>>> attaching a second-stage domain, if the IOMMU supports AMO_HWAD.
>>>
>>> Software pre-populates second-stage page tables with D set, so
>>> enabling GADE by default does not change normal behavior. When
>>> dirty tracking is enabled, iommufd clears the pre-set D bits and
>>> GADE becomes necessary for hardware to update the dirty bit on
>>> write access.
>>>
>>> This avoids toggling GADE dynamically and keeps device context
>>> setup consistent with second-stage domain attachment.
>>>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> ---
>>>   drivers/iommu/riscv/iommu.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index 16779877351b..f01fd4e2f840 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
>>> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
>>> +			dc.tc |= RISCV_IOMMU_DC_TC_GADE;
> 
> Hi Shuai:
> 
>>
>>I might be missing something, but I don't see how the GADE bit set
>>here reaches the hardware IOMMU DC. In riscv_iommu_iodir_update()
>>(in patch 04/10), it looks like only the V bit is taken:
>>
>>	tc = READ_ONCE(dc->tc);
>>	tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
>>	...
>>	WRITE_ONCE(dc->tc, tc);
>>
> 
> You’re right — this is a real issue.
> 
> GADE was being set in the software-side dc, but it was not
> propagated into the hardware DC in riscv_iommu_iodir_update().
> 
> I have already fixed this in my local tree, and I’ll include the
> change in the next version of the patchset:
>      tc &= ~RISCV_IOMMU_DC_TC_GADE;
>      tc |= new_dc->tc & RISCV_IOMMU_DC_TC_GADE;
>      tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
> 

One thought here, instead of updating individual TC bits one by one
in riscv_iommu_iodir_update(), could we transfer all software-configurable
bits from the incoming DC to the hardware DC in one go?

Something like:
	...
	tc = (READ_ONCE(dc->tc) & ~GENMASK_ULL(11, 0)) |
		 (new_dc->tc & GENMASK_ULL(11, 0));
	...
	WRITE_ONCE(dc->tc, tc);

I’m not sure whether this could have negative side effects.

>>I saw that you mentioned you tested it on QEMU. As far as I know,
>>mainline QEMU has not yet declared the AMO_HWAD capability. Could
>>you clarify whether you used a modified QEMU for this test?
>>
> 
> I used mainline QEMU, not a modified one.
> 
> In QEMU, I only tested the second-stage path with a
> VM using device passthrough.
> 
> I did not test the dirty-log related part there,
> so that path cannot be covered there.
> 
> That is why I noted in the TODO that I will build a
> dedicated test case for dirty log handling later.

Sorry, I missed that TODO.


Thanks,
Shuai

> 
> Thanks,
> Fangyu
> 
>>Thanks,
>>Shuai
>>
>>>   	} else {
>>>   		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>>>   			return -ENODEV;

