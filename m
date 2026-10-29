Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238738;
	b=2TKSAaMhbDgUQ161CmlkTrH4RIpLMKA9NZp5DSJ32dXxD3CQiIvDX3SkpEh88GiW0ENU
	 CtilNd0pu5movml1qe8G9JP9xhEEOXjmoRlHWkK7521Tqd/ppXrMYZkFfjNdeteMZiO9s
	 pePHOWifws/evvSko0avfAchA9jobuLCK/WM0hBrdE5PUMxMOjPOy7YhcPXSVAt8gawm+
	 RetXbJDT6YQMOl+xA3p5o9ym+lQa012WSwZVY6w0N94w6GIHPixR5n4yxHjhIO3QGMQvK
	 XQtI9nwvVjSf+wKB75Kg1SR+jaiXIFVbevx0SG+DIOs64NACXZqfhlZxZ2DeV54ODbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238738;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a+kTNEMlGRHVqhyrD9wjKCx3s2EeROQLPFxQ8ka5f9I=;
	b=kxuBMaSiExVRYl7v9wOrVtcgL7hSde6AnXRR9pBxVXTNbGI+zmCP9DAXzgtv060a0FFQ
	 exIrqEO+cq09WWPIGlAhqpTq7A80rtcgP98VyumplGEdY2gpwxzInS55Kb/cuKcoWNqms
	 +QumH3SHmvBHnsZE8cw25zCuyNy8dL13WxnyPwskQ6IKEcPmHKBcthuaYv7Ja/42tklH7
	 NNmNK7K6bnoZAGhMbqZJMn6nCojSQfjbMF/cyGKTnVWNkpKB1jMfmLd2t9ZRK4ToV//WO
	 6AajQTcL6av5KVaWW0LLNa25ZtkVTmuuam91tVlmrW1iZX85NzwI87gGm0mnAMQ3HYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dXotS6ND;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCAC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dXotS6ND
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793238733; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=a+kTNEMlGRHVqhyrD9wjKCx3s2EeROQLPFxQ8ka5f9I=;
	b=dXotS6NDy47yy486s8WGssXOguwlwvulm1T6NQvNm6SqNrrdAdFcXfXw5nHFh1qnQvtwcaJmUOIDWuPbjgbzZwVBEBbtSMbGYanAgux+svuEtTBhrz4xmZki4Gdfty2xEkZw9vU0XJ/boE7OTiNyx3KxzSU0Uo3TUhFXYkpPHQc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDhqoRO_1793238728;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDhqoRO_1793238728 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 09:52:10 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
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
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v5 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains  
Date: Thu, 29 Oct 2026 09:52:07 +0800
Message-Id: <20261029015207.82522-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <179320128818.2412245.14186677086155168748.b4-review@b4>
References: <179320128818.2412245.14186677086155168748.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> The RISC-V IOMMU architecture defines an AMO_HWAD capability (Hardware
>> Access/Dirty update) that allows the IOMMU to atomically set the A/D bits
>> in second-stage PTEs on DMA access.  When DC.tc.GADE is asserted, the IOMMU
>> autonomously sets D on the first write to a page mapped by an iohgatp
>> domain.  This series wires that capability up to the iommufd dirty-tracking
>> interface (IOMMU_HWPT_SET_DIRTY_TRACKING / IOMMU_HWPT_GET_DIRTY_BITMAP) and
>> reports IOMMU_CAP_DIRTY_TRACKING.
>
>These patches don't apply, so sashiko couldn't run:
>
>https://sashiko.dev/#/patchset/20261020094106.92722-1-fangyu.yu%40linux.alibaba.com
>
>> [ ... 86 lines skipped ... ]
>> [1] https://lore.kernel.org/linux-iommu/1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/
>> [2] https://lore.kernel.org/linux-iommu/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/
>
>Because of these extra patches I suppose.
>
>Please figure out how to fix this before you send it again..
>
>Also no base-commit trailer which helps sashiko apply them.
>

Sure, I'll fix the apply issues and add a base-commit trailer in the
next version.

Thanks,
Fangyu

>--
>Jason
