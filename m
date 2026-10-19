Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444833;
	b=LSa9/a2j3U1lrMopZLy+CEIMnN06pqmuKQsMF6bdLbbZpPraYYgQisQPHu3GjJjDoc/M
	 5Ok2Y/VnrYyy4u1EPNJy9PYu7QQPgBw+fNAuKQgNVkMPRuzwpuANX4SJv7tKUpvBYgEKr
	 NkUCJYWxd+8ha5v8a8n6eZsSQpeENe2DoykW+6vzrstBvfQA3VoYu637mG7hFx9gYbraA
	 nbrW2E8CtMBe1kBSmcmVYHO2a0LOOTQJ4k7Gcslf4KBLefkiKsnzoLnoiN9GcyVicMtJm
	 uXBMlAJXmrSqYTJJt+P7AhWGYyIWlOKCxZwgwMBLKpQqJSOH7pcNWiMtb2tRoIS6phg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a9nGiHEGE/ethkm4nwdGSIfsDZebiNvAoo/1PpN/d2Y=;
	b=0anv2zc0i1p3Lk0skZyL4N+ntvEohIpgFn0NqlRMaBvnwBU83LsaDqn/GfSFWF7h1jyT
	 oYxYCHwVnDVr8HxVitoHLIOm3B/n7mgLl/GGMUfLCSnVHWzrDcV/mrgEUmJmU9KB5/N5j
	 LUv+W1bsMdNtHssqmggJE14HsQLGdAgbK+yIVieXnKqhyV/qFZXSA8h1MolO6WArIGxkq
	 e841HhXHcWQsW0Mg3LWKWaVCb8jOJ4N65CBUejcYZx71GIYyuGlk3GjfOjzRgNfFOZMve
	 tTBWII1D0MqEg7q+HXoEb1m+HdQxYuWw3afk64erUoxBx+1hoTNJzx8yl+MNvuZLh4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9BcSTR;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9BcSTR
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1790480a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792444832; x=1793049632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9nGiHEGE/ethkm4nwdGSIfsDZebiNvAoo/1PpN/d2Y=;
        b=Ot9BcSTRPFSCycD31/akOPwFiA7j3uWcueEHQZw2ejy/vS+7LzzlJ0gk0TL39C0RGY
         hBQLkQIiSW3S7KhsSn2bp3nUrRvQIUeUmStxjQP48JBOB6rTtlWq34NiWfpWmOv65r+B
         ZIQTLOlw9xjFwlFrIpzF4whV36UFViF+DrEmpvl8PqMLe596150DGxKN62isuHz6TJiv
         zoWMV4UFJEmWeFRBCl02XY5L2WhIrsVqwFHnFmIU47qsDDG0M10qz170rYRqDl9cgeMy
         ooq0WwHB9rH1k9yOw0Vxy5TdHhtojIYw8fomnu+JcXQHmxsGJ2EfcJW4IATDM0O3NIfA
         TKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444832; x=1793049632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9nGiHEGE/ethkm4nwdGSIfsDZebiNvAoo/1PpN/d2Y=;
        b=elyqHZnbj52QH70qJ8LY2OtToLknZyf5ptPhvb2bweAfT8Ww9wjf2NReaNMX/Nsm4d
         AUNC/qzIbPPFNQIs8efMbaf2c9zmWFFw759Tk1UDXW5lQwNmAkeb+Id+9IpE23N4a+Jz
         tkE+MfbyrhkQS/WosvCcc22JQw06boQE8EYYIJasm8R8H7NjGWeSbIHrBFYCG6je6t43
         hYqiAix+rDAtm0Cy7miF41ZOnQ0qab5wGv+AhLRXyv7XW9n3vJqJ7hs/saCb1yTTSLcH
         9XbH3jcB+sM26NH/hVh1tgmrCr0P966N016o52eiJel8AnPgR4sptKfIrXV3HX+axi0F
         IDfA==
X-Forwarded-Encrypted: i=1; AKwUvBzqeWpDhKlb0uuBVwjJNCDD7NkoP84efm8eE91zwj6eYom1Y08IcBxRqlp4lizRVDPmVF8L7b+cr8AKKBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaKjr93xGlgnNMEskVUhoSGUBDJDRbvzvUjiO7rIRecVKqcMGw
	v65T3A3wRapLTAyTZA/TeeLzj+lgMFDRq5MZcrk1wDe4a8aZffm3LZQq
X-Gm-Gg: AYBFou0Xho/erbRoLbtkUj74hm1bYUsP+3pYN9Z4dhKn2QP9It+O2yXzU1ukokp5iEf
	Gp9LMwaUNdDmG2D3R1saAiG9rCRzOsJBoSFpZbOiBo1Qo12GbeDZfwRSMockhJJfOJIp2Qdb8L2
	72tdnF/F0yc19PryX8NH3aYsCFQjqVC34UzcUgfudcwifzCxvQ80LU7X1xydHqt0RcOsHx+r8AE
	h/y+3fA+Yh7+2+94/HsppZ2sOpjhlMQeL7XV4zoX5ZgDHxzA5mnfIcVZkp+mQQVXOERQ1ojAGcg
	H8cLG/SnqbAKyQVXeYj7jF3Ur1Ibi+KnSV+qkp5MmHcJ3qKb9QFNzHblzKVMqMPMq0LKGJ7Jc0K
	4fmJI4Vr84F9tijd51BRSli+xt7BDs+nWwkMcoR53lJ1bFJgUiewQmS+mLKAteJumEEAkYbx/95
	na+fx8ELuxsoi853zRREvnSvLAevSkIeEytboonvAJ0ANFTvcHQwt0ma7jD3DHD0Z9EMkNBGKz1
	blCuEdWXEETwOguKnymA557zkqThlmrBrXT38z0K5D9QmEnpONvXcEN58k=
X-Received: by 2002:a17:90b:39ad:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3acef56d59emr7934717a91.46.1792444832023;
        Mon, 19 Oct 2026 14:20:32 -0700 (PDT)
Received: from celestia ([2402:1980:8cc:45bf:2ff5:22f4:3884:844f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60fee653sm839652a91.15.2026.10.19.14.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:20:31 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Manali Shukla <manali.shukla@amd.com>,
	Jim Mattson <jmattson@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Liew Rui Yan <aethernet65535@gmail.com>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: perf/amd/ibs: [BUG?] ibs_op sampling silently stops on Zen3: MSR_AMD64_IBSOPCTL latched, no NMI delivered
Date: Tue, 20 Oct 2026 05:20:19 +0800
Message-ID: <20261019212028.119312-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi Perf Community,


I found an issue with ibs_op sampling that I can reproduce on my AMD
Zen3 laptop.  Under full CPU load, sampling PMIs stop arriving on each
CPU, one after another.  Reading MSR_AMD64_IBSOPCTL (0xc0011033) while
perf is still running shows the hardware has latched a completed sample
(IBS_OP_ENABLE=1, IBS_OP_VAL=1, IBS_OP_CUR_CNT frozen) and is waiting
for an NMI that never arrives.  The CPU never recovers on its own.

I am really not very familiar with CPU, so I would appreciate any
guidance on whether this is known and what to test next.


Environment
===========

- CPU:    AMD Ryzen 5 5600H with Radeon Graphics (family 25 model 80,
          Zen3/Cezanne), 12 cores, microcode 0xa500012
- Kernel: 7.3.0-rc5-mm-new-damon-1 (self-built from the mm tree)
- perf:   perf version 7.2.11-1
- Also running: stress-ng 0.21.01


How to reproduce
================

Reproducer is here:

    https://github.com/aethernet65535/amd-zen3-nmi-lost-reproducer.git

The essence is a system-wide ibs_op record on top of a full CPU load:

    perf record -a -e ibs_op// -c 100000 -- stress-ng --cpu 0 &

and then watch the per-CPU PMI counters in /proc/interrupts once a
second.  To rule perf's dynamic throttling out as a factor, I set
kernel.perf_event_max_sample_rate=100000 and
kernel.perf_cpu_time_max_percent=0 before starting.

Reproduction is fast and consistent: the first CPU goes silent ~20 s
after perf starts, and all 12 CPUs are silent within ~5 minutes.


Observed behaviour
==================

Found that per-CPU PMI counters (/proc/interrupts) stop incrementing.
From the most recent run, time from perf start until each CPU was
detected silent (zero PMI delta for 3 consecutive 1 s windows):

    CPU 1,5:        +23.7 s
    CPU 2,3:        +31.6 s
    CPU 8:          +62.2 s
    CPU 9:          +68.3 s
    CPU 10:         +96.9 s
    CPU 6:          +166.9 s
    CPU 4:          +192.5 s
    CPU 0:          +198.5 s
    CPU 11:         +220.0 s
    CPU 7:          +271.3 s

The run then continued for another 120 s to confirm if CPU comes back;
none did.

For each CPU at the moment it went silent, I read MSR_AMD64_IBSOPCTL
three times, via rdmsr while perf was still running.  Decoding
IBS_OP_ENABLE (bit 17), IBS_OP_VAL (bit 18) and IBS_OP_CUR_CNT (bits
32-58):

Live control CPU 0 -- IBS_OP_VAL=0, IBS_OP_CUR_CNT keeps moving between
reads:

  read 1: raw=0x231f0002186a  IBS_OP_ENABLE=1 IBS_OP_VAL=0 IBS_OP_CUR_CNT=8991
  read 2: raw=0x10ca50002186a  IBS_OP_ENABLE=1 IBS_OP_VAL=0 IBS_OP_CUR_CNT=68773
  read 3: raw=0x15fa10002186a  IBS_OP_ENABLE=1 IBS_OP_VAL=0 IBS_OP_CUR_CNT=90017

Silent CPU 0 -- three reads are bit-for-bit identical:

  read 1: raw=0xc80006186a  IBS_OP_ENABLE=1 IBS_OP_VAL=1 IBS_OP_CUR_CNT=200
  read 2: raw=0xc80006186a  IBS_OP_ENABLE=1 IBS_OP_VAL=1 IBS_OP_CUR_CNT=200
  read 3: raw=0xc80006186a  IBS_OP_ENABLE=1 IBS_OP_VAL=1 IBS_OP_CUR_CNT=200

perf report --header-only excerpt (trimmed):

    # os release : 7.3.0-rc5-mm-new-damon-1
    # perf version : 7.2.11-1
    # arch : x86_64
    # nrcpus online : 12
    # cpudesc : AMD Ryzen 5 5600H with Radeon Graphics
    # cpuid : AuthenticAMD,25,80,0
    # event : name = ibs_op//, , type = 11 (ibs_op), config = 0,
      { sample_period, sample_freq } = 100000,
      sample_type = IP|TID|TIME|ID|CPU, read_format = ID|LOST
    # pmu mappings: ... ibs_fetch = 10, ibs_op = 11 ...
    # cpu pmu capabilities: max_precise=0


What I think I have ruled out
=============================

- Not perf's dynamic throttling: it is disabled (percent=0) for every
  run.
- Not the kernel stopping the event: IBS_OP_ENABLE stays 1; the event is
  still armed.
- Sampling does work normally for a while before it stops, so the setup
  itself is fine.


One more observation
====================

In earlier testing I noticed there is a workaround -- enable NMI
watchdog.  PMI counters start incrementing again after it is enabled.


Questions
=========

1. Is this known on Zen3/Cezanne?
2. Any recommended next step?

Thank you for your time, and for all your work on perf.

Best regards,
Rui Yan
