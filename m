Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019364A8C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113160; cv=none; b=gE99kzTJje8QV2OkvgelWZn7mqjuqNgsOWdhcXDtq/pFo+66nFSXJFbCaQ78wMVN3/ANJ4ODbTWq6J1bVFuk8OlvDuJ8qGw9md+GrOyDVMmnZs+qI/HaIJRZp3MLiFiYWeXdLjAPYpNQdX4TcrVDh0yA/CUjjLhrwOVo7CKgfYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113160; c=relaxed/simple;
	bh=FIBzgIluuF9FQql5vaCuvpL50kS37NaB7g99/+abadY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmtGuhUfeXs/z4wmwd/bmKqKRt2Ztg6MuxxTCTx5zrbTBIqeOiXM6Y32QN4gpRM3kdM5PaLYwNbzKVeU8BxIuvZmc6isxg6vF8rvExA3YV4GWd+38Vn+4pui6ojoY1qIVelZMRgsZxLaUz6VvDWaubVnBrn5nCb9fQKKfzmwCHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=W08WUwN0; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="W08WUwN0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792113152; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=C4iTDEp3uiTLwh1LhanDKYb/kFAYLkNbzAIlwdhmAns=;
	b=W08WUwN0oRfN2P/axwfkXLZ/wy0XwR4e+Gm/Dw8ziVAgFEjRn4PGzUIcKneG8NuOBwZ1owc1RdffpkH0mL5BBk4BeaysV654A+RoClb3ONzoYGlAaBz4TQcYlV/U6YX4ePmDh04owbN+sd3NnE9yL1R+73tZShV2/L6DcVy9gDc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XCsu9Ui_1792113150;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCsu9Ui_1792113150 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 Oct 2026 09:12:32 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: Ankit.Soni@amd.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	robin.murphy@arm.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: [PATCH] iommupt/kunit: Read an exact NR_SECONDARY_PAGETABLE snapshot for the leak check
Date: Fri, 16 Oct 2026 09:12:29 +0800
Message-Id: <20261016011229.71498-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261015134048.GB13920@nvidia.com>
References: <20261015134048.GB13920@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +/*
>> + * The global NR_SECONDARY_PAGETABLE counter is batched per-CPU and folded
>> + * into the global value asynchronously, sum the global value and the per-CPU
>> + * deltas to get an exact snapshot.
>> + *
>> + * The global value must be read without the clamp of global_node_page_state():
>> + * the raw counter is transiently negative whenever a folded free batch
>> + * outweighs allocation deltas still pending on other CPUs, and clamping
>> + * before adding the deltas back would overestimate and report phantom leaks.
>> + * global_node_page_state_monotonic() is normally reserved for monotonic
>> + * counters because a raw negative read is garbage as a page count, but the
>> + * sum with the pending deltas always restores the exact non-negative value.
>> + */
>> +static unsigned long pt_kunit_nr_secondary_pagetable(void)
>> +{
>> +	unsigned long nr = global_node_page_state_monotonic(NR_SECONDARY_PAGETABLE);
>> +
>> +#ifdef CONFIG_SMP
>> +	int nid, cpu;
>> +
>> +	cpus_read_lock();
>> +	for_each_online_cpu(cpu)
>> +		for_each_online_node(nid)
>> +			nr += per_cpu_ptr(NODE_DATA(nid)->per_cpu_nodestats,
>> +					  cpu)->vm_node_stat_diff[NR_SECONDARY_PAGETABLE];
>> +	cpus_read_unlock();
>> +#endif
>
>This should not be outside the mm code that manages this data
>structure.
>

You're right. However, I couldn't find a way to solve this by
modifying only the iommupt KUnit code.

>I think the kunit runner executes this in some environment that
>doesn't trigger this delay? At least I've never seen this assert?
>

I can reproduce the assert stably on an x86 machine by booting a
4-core riscv64 QEMU.

>Maybe the test should just be ifdef'd off if that isn't the case?
>
>Jason
