Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D4347C6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380308; cv=none; b=L9a7SY9T/BZJBsibVCDMrxZ35SGaqL7SuTtmKMIo5TI5jBnydPR8Nn0ZzI8r9//0ghyYDIwr+zDOpRGtHHF7rigsotciu2aWoNAIZo8Hbv1vPvmHcZ85T7B/xzhktyaaS0C0HNSZMkAdbjIKcVvQeNqw4qqgBAHvWHiE1OlUxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380308; c=relaxed/simple;
	bh=pHz7bBiMvgjVfQBo5baHnlnPFWb6vMs4JgxMC1w2pOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nKJQidhCv/L9veggzQjajfAi2fwJltjF6Fr0vAmDXdL8p2fJEmZJo3gAaJdY+gxj5EeX2Wv6MvizFE7BwC2uboGpft+JPDjbgHugWK5tZhn5/r0U6wismjssdH0F2ZqHKW9vJxukoF2S33aFAQNBQ5WkDuJmaSlOryyw8bf6L4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=puMxXBBz; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="puMxXBBz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792380298; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=29GF85zmWOT6R4wUdm9iWEGkKC6rqMmG98g3ZEC4smI=;
	b=puMxXBBzgTp7QfXL+yO1Ed0gSRWdoZQfaM3rWcTmMrHjbsDqf84fgG4jo6sYHzk7kzDX9Rn4zQmPQo9U79dxgwb3Pj5J6Pb+sQrXPeTR5fK2LVJlYQih7VJIxBGW+k2hzdQylssO5Sk0+E4U0M4JLjFKtTyRk5842lyemWBugmw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XD-YOHi_1792380296;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XD-YOHi_1792380296 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 11:24:57 +0800
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
Date: Mon, 19 Oct 2026 11:24:55 +0800
Message-Id: <20261019032455.36913-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261016152343.GH13920@nvidia.com>
References: <20261016152343.GH13920@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> >> +/*
>> >> + * The global NR_SECONDARY_PAGETABLE counter is batched per-CPU and folded
>> >> + * into the global value asynchronously, sum the global value and the per-CPU
>> >> + * deltas to get an exact snapshot.
>> >> + *
>> >> + * The global value must be read without the clamp of global_node_page_state():
>> >> + * the raw counter is transiently negative whenever a folded free batch
>> >> + * outweighs allocation deltas still pending on other CPUs, and clamping
>> >> + * before adding the deltas back would overestimate and report phantom leaks.
>> >> + * global_node_page_state_monotonic() is normally reserved for monotonic
>> >> + * counters because a raw negative read is garbage as a page count, but the
>> >> + * sum with the pending deltas always restores the exact non-negative value.
>> >> + */
>> >> +static unsigned long pt_kunit_nr_secondary_pagetable(void)
>> >> +{
>> >> +	unsigned long nr = global_node_page_state_monotonic(NR_SECONDARY_PAGETABLE);
>> >> +
>> >> +#ifdef CONFIG_SMP
>> >> +	int nid, cpu;
>> >> +
>> >> +	cpus_read_lock();
>> >> +	for_each_online_cpu(cpu)
>> >> +		for_each_online_node(nid)
>> >> +			nr += per_cpu_ptr(NODE_DATA(nid)->per_cpu_nodestats,
>> >> +					  cpu)->vm_node_stat_diff[NR_SECONDARY_PAGETABLE];
>> >> +	cpus_read_unlock();
>> >> +#endif
>> >
>> >This should not be outside the mm code that manages this data
>> >structure.
>> >
>>
>> You're right. However, I couldn't find a way to solve this by
>> modifying only the iommupt KUnit code.
>>
>> >I think the kunit runner executes this in some environment that
>> >doesn't trigger this delay? At least I've never seen this assert?
>> >
>>
>> I can reproduce the assert stably on an x86 machine by booting a
>> 4-core riscv64 QEMU.
>
>Possibly kunit runner doesn't enable smp. Can you investigate? Maybe
>we can solve this by disabling the check on !SMP
>

Hi Jason,

I looked into this, and you're right: the default KUnit config does
not enable SMP. All runs below were done on the current tree without
the proposed fix.

1) Default KUnit command, without SMP - the tests pass:

  $ ./tools/testing/kunit/kunit.py run 'riscv_64_iommu*' \
        --arch x86_64 --kunitconfig drivers/iommu/generic_pt

The generated .config contains "# CONFIG_SMP is not set", and the
run completes with:

  Testing complete. Ran 21 tests: passed: 18, skipped: 3

2) The same command with SMP enabled - the tests fail:

  $ ./tools/testing/kunit/kunit.py run 'riscv_64_iommu*' \
        --arch x86_64 --kunitconfig drivers/iommu/generic_pt \
        --kconfig_add CONFIG_SMP=y --qemu_args="-smp 4"

The run fails consistently. In the example above, 14 of 21 tests
failed. With the proposed fix, the same command passes with 18
passed and 3 skipped.

3) Could you clarify what you meant by "disabling the check on !SMP"?

Thanks,
Fangyu

>Jason
