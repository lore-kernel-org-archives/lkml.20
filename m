Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77E3DE431
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160944; cv=none; b=YqEFvYurRp8wOVu57o9+iZSTpUuJGX5Kv8L62zkpfMNgIpuRA44TzOiJw5Ht7DK+8BOoYzGHiNcPuFyukD4tD0einMujWXGxGw3aJySK8Vx1DruYsZmrWXMq9ZTNATUzjDkacISixN2dHdptxn60gg13N6KGWl23tbIKTgJR2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160944; c=relaxed/simple;
	bh=ZLcyXWB1NKkUiq6C7FRIWUiXIl+MloAWDBd2nl+GkEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0NTeUxHLej6isck+lQv+kGW2TBz5Z+PBzEx5jHAz7KUCyprBjxRuAAdsOe2Neg8tB3OsyaYITa0z3lG3srMqHtM89MX8KRmBjipx48WNXoe5q9+HZwbeqfGde3XACJNpwDzsGC+lioLU3IRYrCWEj1DPp0afd3CV826fQpajP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d470EPC/; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d470EPC/"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd77e2so20928fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160941; x=1789765741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBG7NOe4Sh6Qo2OfXnbQ8kr2wauyToElAZG6HGEhqgo=;
        b=d470EPC/v22FeQIVZ1zwPWYGLRtxsrizygvMRNKWXa+qee1MsCbnuZCZoimC35ypg0
         1ERmXSUl9ApOKE/THOkiEGqeuFjZU8bIG28BY59HCPQHWbsrGlJ/ohFEXz7A/RqLrYCX
         6LG3plJecQ2O3uB7YNbc4OWGJJyUwsOKooU5Rom9CMqsBuWiuOy0bLjMbbHCBgRJYP/9
         Am7yKHjBsbJpMPe1Rr5wsOy/lR7vDEySf/0l1MCvPDsFETxDukr/SyGuqAH4G+HvEPUX
         +97tGbHfSUY+PEv4Tb0kFw462kDFzLPfaYpv4QTHUzhhufbLVPS1v7Tjb64s78zi6XPw
         Ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160941; x=1789765741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBG7NOe4Sh6Qo2OfXnbQ8kr2wauyToElAZG6HGEhqgo=;
        b=JPa5Yjh/3xCkhrTRchF6tMWEnb0wvUAXDl71rB6+7oQMj91E3It7Y+Z+DWdERCZxja
         7uYEd24GNak+MHLGlmS75njyt2IRQpTsaC81/8Ao2IoKUStdfx/9hCzsLfGURYENhIhd
         lD3ydNplMJZ6c8vnCe992ieKSPlcvu6X1rV45WMfBZAPigdKO6cxZRxvVIiOhPNCf63h
         sS6D1jmWh6xxujchE2iy/CiJQgPPw/SdEpJGHn++7DdwufkDsodlChlhukV71zFxxJAn
         BW03ppoCqcfkdXU2GyVWn8fkeBFiZmjO4GGtNpu2a3BENiNrwe5kY35Pth1BragNYjsb
         lytQ==
X-Gm-Message-State: AFuF++lAPHHrl0TQ5Gta38uBXx3HToaMdcLaI+QbT1i4hqcwip0bem1p
	EpkUwvSTq/AT8RhkUZCSobr5v1r1plo+rE+KpougTqsX05mjylPlGOy0
X-Gm-Gg: AYBFou2Xjlmi6pHvy7ttdR1jy/3gdag1llZJt7fIkVTJjyY8kSWLsXXZX15uaE3a2cg
	H0xGfH/FcaPNAGPIVSxrsrtSq8TtA7VsUIqEBRXdDY3UsFcL2WYqvCyicyI3cxhjInUFwS8YRNm
	G5jd4POiv0LrYk1O67fdBqbMTIuAZCj8G7KenYvr9r0cjKbsJrjlfe+bljqMNbF1S3mcLkBBgNo
	eHIaJ0d/kfN7n7a9Xfna/E1ynVZF/FlLXmB+HPHECfiP0M7cQN+qraMhQj2QZHpTcC4AzwwMbjI
	OkXfLdnxf/+NQ5niKGJNbaEdbMreV4ziWq3+GByZRgwKKknTvOzS4CMs5CN0dZvn/v2As+od5cY
	NlTgukAJs4DeIweh6bljqcdRJw4+Qbpn6NfXCz698XHchrjFqedopqPgcF26NAW2uRFIDFgaQFe
	FAYXh7R4i3YBkKhlESK7Jel9yW0UB88IeTmczd2UZZiVZqXOliD8PCXSHhcx6VEETlBBgy6eSe1
	O3DBYYEvLE6sb8nGQ8LSSPc4x7mdQ==
X-Received: by 2002:a05:6870:910d:b0:45e:caa2:4ea with SMTP id 586e51a60fabf-47f5805e0femr190151fac.6.1789160941379;
        Fri, 11 Sep 2026 14:09:01 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm3191832fac.1.2026.09.11.14.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:09:00 -0700 (PDT)
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
	joshua.hahnjy@gmail.com,
	yuanchu@google.com,
	balbirs@nvidia.com,
	alok.rathore@samsung.com,
	shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Date: Fri, 11 Sep 2026 14:08:58 -0700
Message-ID: <20260911210859.1359875-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728054356.291998-1-bharata@amd.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 28 Jul 2026 11:13:48 +0530 Bharata B Rao <bharata@amd.com> wrote:

> Hi,
> 
> This patchset introduces pghot, a subsystem for hot page tracking and
> promotion. It collects memory access information from multiple sources,
> classifies hot pages resident in lower-tier memory, and promotes them to
> faster tiers via a per-lower-tier-node kernel thread (kmigrated).
> 
> The main changes in v8 are a rework of the per-section hotness map to be
> RCU-protected, a move of the pghot tunables from debugfs to sysctl, and a
> rework of the AMD IBS Memory Profiler driver that now uses a dedicated system
> interrupt vector instead of an NMI handler. The IBS driver is also split
> into core infrastructure and a separate patch that adds the runtime
> controls and arms the profiler. Also there are a few fixes to the hint
> faults source.
> 
> Goals of this patchset:
> 
> - Unify hot page detection from multiple sources like hint faults,
>   page table scans, hardware hints (AMD IBS).
> - Decouple detection from migration.
> - Centralize promotion logic via per-lower-tier-node kmigrated kernel
>   thread.
> - Move promotion rate-limiting and related logic used by numa_balancing=2
>   (NUMAB2, the current NUMA balancing-based promotion) from the scheduler
>   to pghot for broader reuse.
> 
> Currently, multiple kernel subsystems detect page accesses independently.
> This patchset consolidates accesses from these mechanisms by providing:
> 
> - A common API for reporting page accesses.
> - Shared infrastructure for tracking hotness at PFN granularity.
> - Per-lower-tier-node kernel threads for promoting pages.

Hi Bharata,

We've been testing pghot in a Meta kernel with worklaods to try and see
what the performance characteristics look like. I wanted to report
some of the findings that we've found in our testing. Note that these
results are from a modified kernel that has my tiered memcg series [1]
backported, as well as Gregory's numa balancing scanning fixes [2]
as well. 

- Without tuning and using the default tunables that pghot comes with,
  we've found around a slight performance regression against raw NUMAB2.
  This was being run on a host with 750G DRAM and 250G CXL.
- However, we've found lower pgscan_direct, pgpromote, and pgdemote
  rates as well.
- We've seen PSI dramatically drop on the host as well as the promotion
  happens asynchronously. 
- I also found a bug where the kmigrated thread isn't created for nodes
  that are onlined later after boot, like CXL nodes that get onlined
  with memory later on. I've been using a small hack commit in
  pghot_memhp_callback that just checks for the MEM_ONLINE case and
  spawns a kmigrated thread.

Finally, we've seen some issues with pghot causing userspace crashes,
which leads us to believe that there might be some bugs that manifest
in userspace as well (we have not been able to find out where in pghot
these bugs are introduced).

Thanks for working on pghot!
Joshua

[1] https://lore.kernel.org/all/20260807202059.2620949-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/all/20260911001826.2109390-1-gourry@gourry.net/
