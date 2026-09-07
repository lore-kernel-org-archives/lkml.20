Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA324EC658
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789881; cv=none; b=UsOM3JxNxrrBgAfUkJoX+crAmKodCfI86gmFyOLMSgCOmPg3ClF/oa+6BeCKChrQkiOV+yKSSD7f4m0ePfWLafLS18srVJv68MZqx00eygppGY82v4zFPC2l9fATCjA4avzf8KYqN+l2YiGSIky9rNSOZlfpl7rrOCImn7DCu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789881; c=relaxed/simple;
	bh=tv90FxIuu1q/RN5rQlujkxiJkS5GM+/YzsbdJTurHZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVPQBDo4VSBT1mcOsQnV8hsYME912nTj1x9DcBl1SQ+6oJX87gakzrN5VDrJacCAjSsnTB3ANNz38NWjxtitqMSPHTTswRYzyhI97yRT69ma4rUIyY4DMR/pKxS7W/8W6KEde9h4oSSiM0wjVaxdxhJJYWZwVB5udktiifPa9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT7PvTwP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT7PvTwP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d58efc7356so44144095ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788789878; x=1789394678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XJYYp8KA0Dcif0TkjnN/lgzIrNI6xxT61WeAOHZ3K0A=;
        b=jT7PvTwPNt/lKP8IiWqdgZ0nt2MnMEUGf7WhwX658EMYM2zsGXsIAT+bpgmq2McLsp
         wiS33GB8KsdGtE2kxUrXsafzeFBkYnqOCYyf23q/5doKuhDNcZHmognI1f2hh/Ym1r2d
         uGu9wP+WdqtTe+s7ET5fCFXby4EWq7G9bDjVGKPkhc+OqWAlSiodocPsED+BKfdAYEfo
         WGeBLx5zlj2p+/02K96FvTyyLdcKGF+y4bubSoEQsqagUita8gBKwUb3rZUSqYHPnV5A
         7H3/hYzhWC0goORheaswVIyvIKAlBFVj5mtziwZcvFWRa5Rp9bRWFumNzkeiteggEa1P
         JrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789878; x=1789394678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJYYp8KA0Dcif0TkjnN/lgzIrNI6xxT61WeAOHZ3K0A=;
        b=VrtWy236k1iyt+7sXbOHjfz5oKn8J217KhOQecIw2ACOhfvCOw2mBTRsJQjD5aLjky
         wxLEFtY4yQX5gcvmCCWT8kG1eAQgyk0thTMV/f9BedygL96tAdu+G1qRZ9rbwwtgWwRz
         0Mi9Ac+Hinr1To91ihdgkoCXhh13fKSlqXulBDEFIMWDuN99qjFCcwKtBX3w1QlFBvKX
         qdFAXRFM2WVRleFD/xtzJGvPAYFugD7hkInGUW2ZDBtqqm9YgcvmlIalNdwgpUxU9YHu
         0SGmoP9yhQRrmHhHUXF0GWkB/XvKHDjFTQLaj5/7ZcrlRHQyF1BLuLhc/mKsekyczYfV
         vBCw==
X-Forwarded-Encrypted: i=1; AKwUvBz++FJaMul0D9LnZu4pb7ctgQKT76fxEKH2v5o4ZdBr0s2mF+b8+zfFRfIit1AZRkXMfu7xYMSnK2DVwf4=@vger.kernel.org
X-Gm-Message-State: AFuF++kf2ECUZ6ZFUCEXN8TRxPkhkmlitBRAY57Xk3n1ZZ8C331c+DYb
	rYY9/bH8xxziZYRem8fDVB4BZz07CZsvPd5HUSwP0Qlrq+JOeBKT9l/y
X-Gm-Gg: AYBFou2UgISWS2GIofGlhKyqgyh6SFxCqvIXwAuiCElfvuXoMLxWBIT5RoIrQyfGJVJ
	py9+08uC3+SIl+4Bu4H8IKNdkeH1VuBmEE97f9poH/RX+SzJXQLoKYrXACrobPY7Osefq2fy1MG
	igLjOAIGeWFHG/doXJkwROIMZ1eqbi8gLvPW57NnK2wVeb+mdZ81zG/jHwi5p+TJ8CsegZw2GkP
	JjAo44eYFG32A6LeU/5tfsSzB8FnrcWGVofJeTuKnh0+5SSlHOcTZIUQaHUo+j/xTEMkEhChOLT
	3rEcZW5xUgaooVKgNndp8WQXmB+RidotZH+C87pbIEZvCLKGcSy7mLzhwfmQeEbGTNDzMcL3ztS
	KqeqksQWRJPGbEzUua7XrFDOBz2qdR8v5t9ylBOZlkD3wUpHiDu99nF0WALEzPAF0C/i/cU/EoM
	QCvwexzmF6Y5yU4aCvYlbCWjV/5zz5l5ofuKNY1lvY9sCUbDpj/2ZsNOzanyzPDJaKe61TbYzA/
	O8=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr34088143a91.23.1788789878162;
        Mon, 07 Sep 2026 07:04:38 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm9825574a91.3.2026.09.07.07.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:04:37 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Sehee Jeong <sehee1.jeong@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFT][DONOTMERGE][PATCH 0/6] timers/migration: Prioritize lower capacity CPUs as migrators
Date: Mon,  7 Sep 2026 22:04:16 +0800
Message-ID: <20260907140434.31904-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260625164114.51454-1-frederic@kernel.org>
References: <20260625164114.51454-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi,

I've been following the recent timer migration discussion and wanted to
share numbers from a classic 4+4 big.LITTLE board I have on hand.
cpuidle residency only; no power meter. Hope this is useful.

On 4+4 (all CPUs online): split raised LITTLE cpu-sleep under little-pin;
idle and Christian-style load were flat across unaware / split / prefer-low.


1) Hardware

  Radxa ROCK 4D, RK3576
  CPU0-3  Cortex-A53  cluster0  cpu_capacity=442   max 2016 MHz
  CPU4-7  Cortex-A72  cluster1  cpu_capacity=1024  max 2208 MHz

  Two capacity classes, 4 CPUs each. This is not Christian's Orion O6
  (five classes, many with only 2 CPUs). This report is 4+4 with all
  CPUs online; 4+1 / 2+2 topologies are planned after a gated-split
  patch (section 7).

  Idle states (same names on all 8 CPUs):
    state0  WFI         latency=1     residency=1
    state1  cpu-sleep   latency=370   residency=900
  No LPI-0/1/2. Tables below are cpu-sleep. WFI was only taken on
  idle-600 (unaware): ~0.2s A53 / ~1s A72 per cluster. The rest of
  the matrix was not collected once that looked negligible.


2) Kernels

  Rootfs: Armbian_26.2.5_Radxa-rock-4d_resolute_edge_7.0.1_minimal.
  The stock 7.0.1 edge kernel was replaced. All three Images are
  next-20260902 built from that image's .config (same dtb / userspace).

  unaware     unmodified next-20260902
              7.3.0-rc1-next-20260902-next-rockpi4d
              dmesg: Timer migration: 1 hierarchy levels;
                     8 children per group; 1 crossnode level
              -> one LVL0 group, all 8 CPUs mixed

  split       7.3.0-rc1-next-20260902-tmigr-split+
              same tree; tmigr_get_capacity() returns real capacity
              (vanilla next keeps everyone at SCHED_CAPACITY_SCALE)
              boot dmesg line is unchanged (it is group-width, not
              topology). little-pin CPU1 residency moving from ~32s
              to ~120s is consistent with a 4-CPU LITTLE-only group.
              No timer_migration_tree.py dump: board had no
              network, so pip3/ete3 could not be installed.
              Sorry — no ASCII tree this time; can follow up
              if useful.

  prefer-low  7.3.0-rc1-next-20260902-tmigr-prefer-low+
              Frederic RFT 0/6 rebased onto the same base
              git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
              timers/migration-capacity, HEAD: 28f02a6747ac4343f3596aaa3b749dea95577478
              dmesg: Timer migration: 2 hierarchy levels;
                     8 children per group; 1 crossfamily level
              -> two capacity families + a connecting level

  Common: NO_HZ_IDLE, HZ=250, schedutil, kernel.timer_migration=1,
  ARM_PSCI_CPUIDLE + menu. No NO_HZ_FULL.


3) Workloads (N=3, 600s each unless noted)

  idle-600     sleep 600
  tbench       tbench_srv; tbench -R 20 -t 600 4 127.0.0.1
               (Christian's -R 20; dbench 4.00 ~120s warmup; wall ~720s)
  schbench     schbench -m 2 -t 4 -r 600
  little-pin   four 4ms sleep loops (sleep 0.004) pinned to CPU0-3 for 600s
               (Sehee-class load, tmigr on; not Sehee's tmigr=off case)

  Residency is sum of /cpuidle/state1/time over the cluster, seconds.
  A53 max = 4 * wall; A72 max = 4 * wall.
  idle/schbench/pinned wall=600s => cluster max 2400s
  tbench wall~720s           => cluster max ~2880s


4) Main table -- per-run raw; mean is arithmetic mean of the three rows

  cpu-sleep seconds = (after-before)/1e6 summed over the cluster.

  idle-600  A53 / A72
  unaware
    N=1  2395.7 / 2399.2
    N=2  2386.2 / 2400.2
    N=3  2367.6 / 2396.2
    mean 2383.2 / 2398.5

  split
    N=1  2396.4 / 2398.4
    N=2  2398.1 / 2397.4
    N=3  2399.4 / 2372.5
    mean 2398.0 / 2389.4

  prefer-low
    N=1  2394.8 / 2399.5
    N=2  2395.2 / 2380.0
    N=3  2377.9 / 2399.2
    mean 2389.3 / 2392.9

  tbench  A53 / A72 | throughput | max latency
  unaware
    N=1  978.8 / 1985.2   14.4431 MB/s   4.444 ms
    N=2  982.6 / 1985.1   14.4405 MB/s   4.131 ms
    N=3  982.7 / 1983.9   14.4237 MB/s   3.817 ms
    mean 981.4 / 1984.7   14.4358 MB/s   4.131 ms

  split
    N=1  976.7 / 1979.5   14.5214 MB/s   4.136 ms
    N=2  982.1 / 1981.2   14.5000 MB/s   4.017 ms
    N=3  982.2 / 1979.1   14.5176 MB/s   4.128 ms
    mean 980.3 / 1979.9   14.5130 MB/s   4.094 ms

  prefer-low
    N=1  978.9 / 1984.1   14.4451 MB/s   4.268 ms
    N=2  978.7 / 1983.1   14.4437 MB/s   3.719 ms
    N=3  983.2 / 1985.0   14.3993 MB/s   3.876 ms
    mean 980.3 / 1984.1   14.4294 MB/s   3.954 ms

  schbench  A53 / A72 | wake p99 | req p99 | rps
  unaware
    N=1  401.9 / 3.2   3996 us   56000 us   447.54
    N=2  396.3 / 3.2   4004 us   58176 us   433.53
    N=3  370.7 / 2.9   3996 us   62272 us   411.69
    mean 389.6 / 3.1   3999 us   58816 us   430.92

  split
    N=1  420.5 / 4.0   3980 us   52544 us   469.75
    N=2  391.7 / 3.1   3996 us   56896 us   435.84
    N=3  367.7 / 3.1   3996 us   58176 us   417.24
    mean 393.3 / 3.4   3991 us   55872 us   440.94

  prefer-low
    N=1  428.9 / 3.8   3980 us   51136 us   481.38
    N=2  425.1 / 3.3   3996 us   54208 us   463.08
    N=3  412.7 / 3.1   3996 us   56000 us   449.39
    mean 422.2 / 3.4   3991 us   53781 us   464.62

  little-pin  A53 / A72
  unaware
    N=1  291.2 / 2377.0
    N=2  283.4 / 2376.4
    N=3  292.8 / 2376.8
    mean 289.1 / 2376.7

  split
    N=1  346.3 / 2372.1
    N=2  408.2 / 2371.6
    N=3  381.8 / 2372.0
    mean 378.8 / 2371.9

  prefer-low
    N=1  279.6 / 2379.6
    N=2  286.8 / 2377.7
    N=3  291.4 / 2377.5
    mean 285.9 / 2378.3


5) little-pin per-CPU cpu-sleep (s)

  unaware
         cpu0   cpu1   cpu2   cpu3   cpu4   cpu5   cpu6   cpu7
    N=1  12.7   32.4   122.7  123.4  589.3  598.7  591.5  597.5
    N=2  11.7   31.7   120.8  119.1  588.3  596.1  595.4  596.6
    N=3  12.9   32.4   122.6  124.8  590.3  596.4  598.0  592.0

  split
         cpu0   cpu1   cpu2   cpu3   cpu4   cpu5   cpu6   cpu7
    N=1  15.6   109.2  108.2  113.3  586.5  592.3  596.0  597.3
    N=2  16.1   132.4  129.2  130.5  585.2  589.5  598.2  598.7
    N=3  16.5   122.9  119.2  123.1  586.6  591.1  596.2  598.1

  prefer-low
         cpu0   cpu1   cpu2   cpu3   cpu4   cpu5   cpu6   cpu7
    N=1  12.8   116.9  31.9   118.0  593.2  591.5  598.0  596.9
    N=2  12.4   121.5  31.5   121.3  592.5  595.4  590.7  599.1
    N=3  12.9   122.1  32.5   124.0  589.6  595.7  595.5  596.8

  split: cpu1 109/132/123 vs unaware 32/32/32. prefer-low keeps two
  busy LITTLE CPUs (~13s / ~32s on cpu0+cpu2); split spreads sleep
  across cpu1-3 (~110-130s).


6) Reading the three columns on 4+4

  little-pin, big (Sehee-class; tmigr on)
    A72 2377 / 2372 / 2378 on all three variants (~594 s/CPU, ~5s below
    idle). Big deep idle not broken here; not Sehee's tmigr=off case.
    No A72 gap for split or prefer-low to recover.

  little-pin, LITTLE: split vs O6
    Christian's O6 failure mode (split hurts LITTLE) is opposite here:
    A53 289 -> 379 on split (cpu1 recovered). prefer-low A53 286,
    unaware-like (cpu2 takes the ~32s slot).

  last-idle big / migrator
    No sign big held the global migrator under little-pin: A72 ~full
    cpu-sleep (~594 s/CPU). No migrator traces.

  idle and load (prefer-low vs unaware)
    Idle already ~100% cpu-sleep on unaware; prefer-low cannot win.
    Load: tbench 14.44 / 14.51 / 14.43 MB/s; schbench wake p99 4.0 ms
    on all three (schbench keeps A72 busy, so low A72 residency there
    is expected). Not worse, not better. Same Christian O6 reading
    under load; here no idle prize either.

  prefer-low: does it really? (Frederic, July 2026 thread)
    Tree is up (2 levels, crossfamily). want_low_migrator not traced.
    little-pin shape (cpu0+cpu2 busy) matches a connected tree, not
    isolated split.


7) Next steps

  Section 6 on this board: split raised LITTLE cpu-sleep on little-pin;
  prefer-low matched unaware; big stayed in cpu-sleep. Christian's O6
  numbers went the other way on LITTLE when capacity classes are small.

  I plan to patch tmigr_get_capacity() for a gated per-capacity split:
  - online count in every capacity class >= 4 -> arch_scale_cpu_capacity()
  - otherwise -> SCHED_CAPACITY_SCALE (same as unaware today)
  - nohz_full still forces unaware

  Re-test with the same Images base plus a gated-split build:
  idle + little-pin + tbench on 4+4 here, then static 4+1 / 2+2
  topologies (CPUs offlined before each run, held for the full 600s).

  First try only: cutoff 4 is a starting guess (this board 4+4, O6 often
  2). The first patch would count online CPUs at boot/setup only; no
  runtime hotplug tree rebuild, no split-big-only policy.
  prefer-low did not beat unaware; next step is gated split, not
  another prefer-low round.

  I would appreciate feedback on cutoff choice, hotplug handling, and
  on section 8 gaps worth closing before a patch.


8) Not in this mail

  - tmigr=off
  - nohz_full
  - tmigr_connect / handle_remote traces
  - timer_migration_tree.py (no network on board for pip3/ete3;
    can follow up)
  - 4+1 / 2+2 hotplug (after gated-split patch; not in this report)
  - power (mW)


Thanks,
Liang Hao
