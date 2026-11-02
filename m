Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625731;
	b=xZZJ54AtzxxHauAvf2QB8ewfWyQPAb/ANcwoI7uJAQGJu0oRX6TyXYwduG9LcA/jP+ga
	 CaPTzX7gNFJKoXbl2b6kSKHxsnxr7zjjRmwaU2A56HDuYbgN+yTLn5BcYpHkRR6SjpH1c
	 /iZD0tKDhIelE/j3kqF2fgUMAnoc4gO6Y6ilXdJY9Se5AcoX6kfOqWUeruWq51iNaTvRP
	 8xRo6bjUizkxeA6pTT7f9pmVfKk474pWA/zME9EZbzAW3Zj9x27Zx3IUHg6YnRBTauCPN
	 4cjw8T3Ig4OpQN4Z/eslJwbM6pkC37N9g4xSb37GKIX2Lp5is/+0PtX6DFlNyWuTThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625731;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=djgnkC1S9SsBayDDJz8CWP9esVizW3/CZWCKQKY14tA=;
	b=ZODbxH/8takGUgDBBtrPWjOZGDF1ZaQ7VDPbYHV8sjFY5OuLfADKSQip8YvBjMjWntca
	 JhOny6jwsYT7PEGYuoj39XlQCcOxMI1MDL1zIEfuGDbT4dq1/sKBv079SAWEG2ra2L7lG
	 vqjSoXu1ZjkFPBEnraWAnzUPDWcey5l57YA7E/83yUQo5R7+l7EyEPDycJxOYft3f07TM
	 uGViR0gTIkmEdbGMDdRXOEcj7pXr5DPGFIXjhB5EFWsF7hYXeaVtZcm7CLtcOhPmIsBpZ
	 jM5BwDkDW/LiJU4zJykO0+Kv9z7s79UAqenVjTK3eUIoXq5AnaKI/nZwCSnVIbhUyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XFNR+zz9;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1B606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE1B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XFNR+zz9
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793625721; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=djgnkC1S9SsBayDDJz8CWP9esVizW3/CZWCKQKY14tA=;
	b=XFNR+zz9BrfnfBLzA807AL3EeNNyF+ibEm+1ps9g5EDXzBebLJuSb8qxbrOe2u0d5hxY6oKmD3CZGH2iwXZeT4hfT+yeJUD6zczOXIId6TIpvZ8mPlPDx1KlP1dBhAuzUOfz5qswykelN7dWC8hodneAkm1CogVvM4pq3En0ATA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XE-KG9J_1793625716;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE-KG9J_1793625716 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 21:21:58 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
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
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for second-stage domains 
Date: Mon,  2 Nov 2026 21:21:51 +0800
Message-Id: <20261102132151.52507-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261102131356.GA274202@nvidia.com>
References: <20261102131356.GA274202@nvidia.com>
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

>> >@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
>> > 	if (domain->gscid < 0)
>> > 		return -ENOMEM;
>> >
>> >+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
>> >+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
>>
>> This sets dirty_ops based on whether the allocating device's IOMMU
>> supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
>> to that IOMMU instance. A later attach may target a device behind
>> another instance without AMO_HWAD, and the attach can still succeed
>> with GADE disabled, potentially causing guest page faults.
>>
>> Shouldn't we therefore revalidate AMO_HWAD cap for domains with
>> dirty_ops and reject this combination?
>>
>> FYI, both AMD and Intel have attach-time dirty-tracking checks. See
>> drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.
>
>Right, need to check on every domain attach that the domain is
>compatible with the iommu instance.
>

Hi Shuai, Jason:

Thanks for pointing that out.

The domain is not tied to the allocating IOMMU instance, and
riscv_iommu_attach_paging_domain() only sets GADE when the target
instance advertises AMO_HWAD. As a result, attaching a dirty-tracking
domain to a device behind an instance without AMO_HWAD would silently
succeed. 
I'll fix this in the next version.

Thanks,
Fangyu

>Jason
