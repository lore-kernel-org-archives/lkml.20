Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064310;
	b=0bkAZqcvr7TdoFPOHXaBJwWtlfmu5o34BbtvzC5LARD2idA11mnnvdPgaC0MYVIuXb6D
	 LVikIOEyXT5Tr6G+M5QiKbrTrGHkT/KUv2V84G/a0VTLCQvCgDVlLnyQyI+FT9uNtItng
	 xxgX0GfIB5YRxi6H6oG0r7UhjamtOthRW2bCSX/3Tga3I1TnOTU1dJY68NMevPVuP56fq
	 3og3jrrUaUheIimCCU94jYahyPsoKKIh2Yeu8/ghQtZLs51u+oQ2aqsOQiLODFT17BZMz
	 hgN2YlYfQtl0B6twwZlk6ccCNetwcfWRHSQKgmpQYltMJSwVZPsXBw4IyQf6DIvGdTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064310;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0+ZCYq8yPT7UgiJd/2I4i00Zcn8Pa1oTi/H1bjd+Tt8=;
	b=ECnAXD4po+JDC1IJ1V4l/UZhoHSO2PHYuumW2X4cIscNgBRQJ7CWpuJxueX7nAXpSbAW
	 WBKrDG69azL+TcjS07Lrm5t72GAKXnTNJ18MCZc9My+gQZHIDMvE/zd6TBbp8AyA793qV
	 dAfaD64VY/I9W8DCI/w9LjztA7ZOLLJ6FvpsUXCScVgz8yvcZ/51SIyFm8xzm54AOuZR6
	 CDr2H19MSoqG2FDALdrrJBtwlqYQjTRmwNv1fPGL+FmvorqtKoVw3BJWBVA6OcxrZrLF0
	 9G91SKdG7YZzgPzJkYdkYf8q6Paud9H+jM+qhaDpXOO4OhtEm3IpxWoQaqq5DlH7CYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bGci1mOO;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1844606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1844606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bGci1mOO
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0+ZCYq8yPT7UgiJd/2I4i00Zcn8Pa1oTi/H1bjd+Tt8=;
	b=bGci1mOOa5uGBFMgwZR6kWqJrGm1gk2E6Bgf5zQyREHOqCHIlnENKU+mXV4DBktKNeA6Fl33A
	UA6XNR1Qx76J/d2vDab8qtk+0GpfrGP6FSlSV4h0nt9fWBgdKfhPyjDe1uAxOagS5rttG3TazFM
	U98VBZEKq4mxD/KsFV30fUw=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jDCTh54Xnz1K9Bq;
	Tue, 27 Oct 2026 09:24:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 34C804057C;
	Tue, 27 Oct 2026 09:25:04 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 09:25:03 +0800
Message-ID: <cbbae8ef-b612-4a5a-a404-6e3c49d2d45d@huawei.com>
Date: Tue, 27 Oct 2026 09:25:01 +0800
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
Subject: Re: [PATCH v10 RESEND 03/15] arm_mpam: Fix error return in
 resctrl_arch_mon_ctx_alloc()
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-4-ruanjinjie@huawei.com>
 <19a84290-d0a8-4900-bb2a-ecd525eeff57@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <19a84290-d0a8-4900-bb2a-ecd525eeff57@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 22:40, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 20/10/2026 14:42, Jinjie Ruan wrote:
>> resctrl_arch_mon_ctx_alloc() stores the allocation result in a
>> heap-allocated int and returns the pointer unconditionally. When
>> allocation fails with anything other than a retryable -ENOSPC (e.g.
>> -EINVAL, -EOPNOTSUPP, or -ENOSPC with a pending signal), the caller
>> receives a valid heap pointer that IS_ERR() does not detect.
>>
>> The caller then treats the error code as a monitor index: hardware
>> reads use an out-of-range index, and resctrl_arch_mon_ctx_free() hands
>> it to ida_free(), corrupting the allocator state.
>>
>> Return ERR_PTR() when the allocation failed.
> 
> Is this just theoretical? What state do we have to be in for resctrl_arch_mon_ctx_alloc_no_wait() to
> fail? I see that the same fix has already been posted by Sang-Hoon.

Hi Ben,

Yes, this is one of sashiko reported issues. And after walking through
the relevant code, I found it to be reasonable.

Sorry, I didn't notice Sang-Hoon's fix; I will drop this fix.
> 
> https://lore.kernel.org/lkml/179075213853.3.16001626385793291460.idr-bug-33@gmail.com/
> 
> Thanks,
> 
> Ben
> 
>>
>> Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
>> Cc: James Morse <james.morse@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index edd8da460fd7..23a8771ef148 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -413,6 +413,13 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
>>  	} while (*ret == -ENOSPC && !signal_pending(current));
>>  	finish_wait(&resctrl_mon_ctx_waiters, &wait);
>>  
>> +	if (*ret < 0) {
>> +		int err = *ret;
>> +
>> +		kfree(ret);
>> +		return ERR_PTR(err);
>> +	}
>> +
>>  	return ret;
> 
> 
>>  }
>>  
> 

-- 
Best regards,
Jinjie

