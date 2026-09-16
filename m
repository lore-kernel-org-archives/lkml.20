Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C442125F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591948; cv=none; b=WRVYKEF6jx4AkqqZ9G+HYxK3OKzRKzI40WxTg9ljFNniF0Rm54uwMMtLg5L2vc/ZP8BLW9PuAZPIFe1Zla1l8vR1VMAeKKvhLPSC5j5RKl7Ltcey7KiKJEItoXuCxMy8zDoscXHUWuK9jouXnuPuoJdKsL5OIMgGc7POehfzZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591948; c=relaxed/simple;
	bh=DIZYAHm521GzghFLBIBNK3JZKSLQj+G6WL0Ti9pGAyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofXRMoKWXQ5SlFLPGQFrKMi+E6GiXPJDa4R+w8Ia3eNyqzYkRse0fdSWvmr7qx/zyhMqa8Jwq3X+bIUErO32fZcgImV9862qE71X7WxsE9voKk3Uswfr0Q41Z33mpPnrXBTsp8zO3Z9iftvs64Wdb01w0+RDs/WHUuejoI6+rDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLwoh2Xc; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLwoh2Xc"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c24d19ebcfso39309eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789591934; x=1790196734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFxqhaToXcLhZx57rZOKyfb/5RQhEkCVEVgt0s8vR2I=;
        b=cLwoh2XckOCTPG0nsuqd+Ct0L2EaQhDlUar6doyOnhprb5z9Byt+k2f34jofpDgQIl
         oiuJdZvYi2KvNPxaLjQ2iqBhnjhMdaqhDqHhow9MRH/u3V/Wfyz7SvlFbQSFvRtmhZQd
         TBWdb/CT2DzRUOlqrZ9Fau5yz70+v2b0XFWFSZBDPVHoDDj7HhLIy8Wl7vAdScmXHnjj
         jrYsf7YXHamBfzIWK6MzVtiSNteskb8m44mde9xNwAVnT28zkLLD+/NXRWv78ap19dSa
         rMrqZ9hfuozX34aJlv5TX6XwGSLiZNMxh2Ig7bUMtMcBTw8T4kMsitc6wDuYqSQUN/O/
         8LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591934; x=1790196734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFxqhaToXcLhZx57rZOKyfb/5RQhEkCVEVgt0s8vR2I=;
        b=UopHZx1Et9rWL+q3X4Pxr6OwNWbXaK4foPmWgbTjr+y5euSJUv75QgLWa9R60B4lYr
         wzoKbRBMyD8BW6nHxCt2TQzcl29YDwJe00UNzz5VwbWubyIZqWrNJ8ab4786zEWYRFtO
         IxTmm11ex/hQqaHywSg6F2ghu/f+U3ayyEy2P12RWdFr14JPUZYfdZqTo4H0bbQZEqex
         NyzbXCJIHTPzi70janqtrN+/pFTFHN0Nzuzr5eGOAzdvhCadVq5EFNq7uxAWeTZzZyhp
         k3ggNTEX1LTflicjaYqElR8YQ8pcLUY8yRORvPhVePg4PFsV2lY713K+UgyPrl994BEs
         EcIA==
X-Gm-Message-State: AFuF++nbD4I9ndiqGfHCYDtPFrvqMk02I4d1tV3wTjNMUbkh5x9LNurp
	6djnWME3EvU+VdL7li11PeB/gT1AG4yRi60cwCU7KDv8qY8Zo05TbdZS
X-Gm-Gg: AYBFou1uTqs3ldHGyHUQpdMSpMD2bAmruZhCRcuUpHfJyQZ8QPuo9Kwuju2bQND94aQ
	gzE5szwf4Crooq+4jxgsp8KPcpwzRLrihOLeKggiYWpTZztGKLitpX038c1Q2cuvoE+aIh8VuPA
	i76jeGbuP/aglZ+t2isxLEDqJ9qTE6ANB+cfEJZNOyv82bvZpMwVpG7UqbB2SmdOoOjT6j6Hyzb
	WqbMK8CgV7q9FO+wco0a20W9XH4NXjNVkjey10URgLQ4NdHyL3EYukwvhvq8LtA9a/R3yjj5NWQ
	+zECr5Lg8dQZB2X3SNobSijkXRcd+cj0upyB6I3khJrKzNb9tO9Oy3L2SGEi7K66peHM+4ER4GN
	drO4MUz/2hrnfOH6UyCs00LU72mDNRSeCoAnWTm4d1gv6ehPtetZQ1A2ssd22FdPxrvx5xHD0NN
	h0tG97OR47n6iDljoxRQqxPi+jWBEZ6+2GrkrgerdP+5j54bQGycpeGdAS3YuQQku1UXiaSFQiE
	Q8SC0npNZ85qMxRou2mZRZDmFFy0w==
X-Received: by 2002:a05:6820:2226:b0:6c2:1018:3f7 with SMTP id 006d021491bc7-6c7d41e1e4emr7017724eaf.23.1789591933607;
        Wed, 16 Sep 2026 13:52:13 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a23e310sm3312526fac.12.2026.09.16.13.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:52:12 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
	gourry@gourry.net,
	mgorman@techsingularity.net,
	mingo@redhat.com,
	peterz@infradead.org,
	raghavendra.kt@amd.com,
	riel@surriel.com,
	rientjes@google.com,
	sj@kernel.org,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	dave@stgolabs.net,
	nifan.cxl@gmail.com,
	xuezhengchu@huawei.com,
	yiannis@zptcorp.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	byungchul@sk.com,
	kinseyho@google.com,
	yuanchu@google.com,
	balbirs@nvidia.com,
	alok.rathore@samsung.com,
	shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Date: Wed, 16 Sep 2026 13:52:10 -0700
Message-ID: <20260916205211.267720-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f871efd2-06b4-493f-87cc-919b6e0945c0@amd.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 08:38:17 +0530 Bharata B Rao <bharata@amd.com> wrote:

> On 12-Sep-26 2:38 AM, Joshua Hahn wrote:
> > Hi Bharata,
> > 
> > We've been testing pghot in a Meta kernel with worklaods to try and see
> > what the performance characteristics look like. I wanted to report
> > some of the findings that we've found in our testing. Note that these
> > results are from a modified kernel that has my tiered memcg series [1]
> > backported, as well as Gregory's numa balancing scanning fixes [2]
> > as well. 
> 
> Hi Joshua,
> 
> Thanks for testing pghot with your workload!
> 
> > 
> > - Without tuning and using the default tunables that pghot comes with,
> >   we've found around a slight performance regression against raw NUMAB2.
> >   This was being run on a host with 750G DRAM and 250G CXL.
> 
> pghot promotes on 2nd access by default since pghot_freq_threshold is 2
> by default. This will result in slower promotions compared to NUMAB2
> which promotes on 1st access. Could you please try with setting
> pghot_freq_threshold to 1? I think I should make the default as 1 going
> forward.

Gotcha. Out of curiosity, I'm wondering why you decided to make this a
tunable. Specifically, I'm wondering if there are any workloads that
benefit from making it require a second access. To me keeping it at
first access makes a lot of sense. Obviously you could say that
scanning workloads would want to use 2 accesses, but there should be
other ways to prevent that from happening rather than counting the
number of accesses before promotion. Just my 2c.

> In any case, will it be possible to provide more information on what your
> workloads are, and the exact performance metrics? Any representative workload
> that can be substituted to reproduce this behaviour can also help.
> 
> And when you say slight perf regression, how much is it exactly?

I'm seeing that average latency is about 20% higher and p99 latency
is about 5% higher.

> > - However, we've found lower pgscan_direct, pgpromote, and pgdemote
> >   rates as well.
> > - We've seen PSI dramatically drop on the host as well as the promotion
> >   happens asynchronously. 
> 
> That's good to see.
> 
> > - I also found a bug where the kmigrated thread isn't created for nodes
> >   that are onlined later after boot, like CXL nodes that get onlined
> >   with memory later on. I've been using a small hack commit in
> >   pghot_memhp_callback that just checks for the MEM_ONLINE case and
> >   spawns a kmigrated thread.
> 
> I will take care of this scenario (CXL node online after boot) in my next posting.

Thanks, it will make it easier for us to use on our end as well.

> > Finally, we've seen some issues with pghot causing userspace crashes,
> > which leads us to believe that there might be some bugs that manifest
> > in userspace as well (we have not been able to find out where in pghot
> > these bugs are introduced).
> 
> That's something I have never seen till now with any of the benchmarks that I
> have run. Any kernel messages attributing the failure to pghot? Anything
> attributable to access reporting or  kmigrated threads?

We're doing A/B testing with NUMAB2 only and pghot, and we are seeing
the userspace crashes in the pghot host only. It seems like there
are some segfaults trying to reference ip 000... and a warning that
references "Too many tries to read user space".

I don't have anything in particular that would direct us right to pghot,
but this crash has repeatedly come up, only on pghot (across reboots)
and not on our NUMAB2 worklods. 

> Any clues from coredump or gdb debug of userspace crash?
> 
> Were you running your workloads as part of a non-root memcg?

They were part of a non-root memcg.

> Do you see these failures without [1] and/or [2] ?

Yup, I think these are unrelated to those changes.

Thanks again Bharata!
Joshua
