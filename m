Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074A3403EA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873988; cv=none; b=f3Tunz+cBQW67+wvz9+P8Oi5xAplM1fHPL+9L/XK7BJkwXU2OrcppjdBkRXvV6v3qYL67xtwq8QnWL/QzCnIjd7E4tp0gXlT+fs9tFZKZl8NQyR1dqc/nItKfP4ISZGgZ5q0Zmi1lZMqE9bR9nL9MN0LgUNrY4Sdcb6o4/Uzyuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873988; c=relaxed/simple;
	bh=6fPFMYyTN3nTje5fG5HROv2QN6YclNlm1iEMeTFnYhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hb4spuBY1vUMUsG2C2BY9xUsPwmY8RyWxiDusURJ7w/RBF4UNgzED7ekczbybKmE6esBUnF8WCJ/j/oLWS4RRakUJIQiqDIQy3+YB19eVijJeXcCmNM9nYej2rSW5qqZT/y4O96kpXWD07bIM0SJ8ASWufqPv2RMZP+5JYV9KfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AhQtYMOF; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AhQtYMOF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789873984; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=LHI1NO5JOiIuDGqpEcnCt7eW+JpawOKMKxw6jmu4FBU=;
	b=AhQtYMOFkjDvbUg9dmr3r/BsoOeqxYWy2rTtKYfhXoj+OlbTgv5oybb1ouxlzfeMJHd2hlt3NySN5MzH44sbpoZhfuBczjgLmG74Mt0sHIXOHyo4v2ZwWlrn6Wh90b7pE1rR5YJJjMS4GFRUHTmwrRVQSCe+1QTuJrAlOOTtFu0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XBErlvu_1789873979;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XBErlvu_1789873979 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 11:13:01 +0800
From: fangyu.yu@linux.alibaba.com
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for second-stage domains 
Date: Sun, 20 Sep 2026 11:12:59 +0800
Message-Id: <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
References: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>Hi Fangyu,
>
>On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
>> attaching a second-stage domain, if the IOMMU supports AMO_HWAD.
>>
>> Software pre-populates second-stage page tables with D set, so
>> enabling GADE by default does not change normal behavior. When
>> dirty tracking is enabled, iommufd clears the pre-set D bits and
>> GADE becomes necessary for hardware to update the dirty bit on
>> write access.
>>
>> This avoids toggling GADE dynamically and keeps device context
>> setup consistent with second-stage domain attachment.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>   drivers/iommu/riscv/iommu.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index 16779877351b..f01fd4e2f840 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
>>   			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
>> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
>> +			dc.tc |= RISCV_IOMMU_DC_TC_GADE;

Hi Shuai:

>
>I might be missing something, but I don't see how the GADE bit set
>here reaches the hardware IOMMU DC. In riscv_iommu_iodir_update()
>(in patch 04/10), it looks like only the V bit is taken:
>
>	tc = READ_ONCE(dc->tc);
>	tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
>	...
>	WRITE_ONCE(dc->tc, tc);
>

You’re right — this is a real issue.

GADE was being set in the software-side dc, but it was not
propagated into the hardware DC in riscv_iommu_iodir_update().

I have already fixed this in my local tree, and I’ll include the
change in the next version of the patchset:
    tc &= ~RISCV_IOMMU_DC_TC_GADE;
    tc |= new_dc->tc & RISCV_IOMMU_DC_TC_GADE;
    tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;

>I saw that you mentioned you tested it on QEMU. As far as I know,
>mainline QEMU has not yet declared the AMO_HWAD capability. Could
>you clarify whether you used a modified QEMU for this test?
>

I used mainline QEMU, not a modified one.

In QEMU, I only tested the second-stage path with a
VM using device passthrough.

I did not test the dirty-log related part there,
so that path cannot be covered there.

That is why I noted in the TODO that I will build a
dedicated test case for dirty log handling later.

Thanks,
Fangyu

>Thanks,
>Shuai
>
>>   	} else {
>>   		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
>>   			return -ENODEV;
