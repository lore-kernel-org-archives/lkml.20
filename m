Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669211;
	b=BZB4Sbo+4lbuxIy5YHaiDaVpg31V1DQtRDfVkE2CKlOoJnlnYiYPcaSmTajdZjTAND8v
	 Coav6qLlagLwj7uMG3Gk4waj3IBqa4+TtyXtkeLhBYerFZE0ybYo6I9YcYEwrMwzqZJu9
	 Bc5T2vN+Qwv5zTTJNFrMMKVzjDKaxBhzFdDAYj+BHFs3CjlG518+0ALl7HcznVZj4ylZG
	 zNT04+7oAbvMV2qKEW7BvYWvMbimTETtXmBFREXJpnwCw0p2VwswjuNeVXDHNhuw+E6w/
	 zLtRcfvMvnHIr6lU6Qk4LfNXACSJqYRxhPaQfb3QtMuSl26+oDDbpMvbgjCDuP0FEjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ovrFY2nryAzBfdCJ/BnHMNVEIRqm/CHlabepiDy+ej0=;
	b=vfoo5dBLqz7NTz+lV06LkLlDpHRr0BhghC09PXwASSG+Yhg2Gu2Q35zdDaqqd0rD1AQz
	 SY2hUq4UNemXFz+/PGTOkM6cPid34SR2MU67RYXbxzklg6TS1MPp9X/iaOn+Zc0cunjU1
	 b7y/gTe2YartOh/CPUZLeFm8+KU73r5leUKUFhvHzy/LOUXVXnn2BvbUNzWGES/+PkjML
	 2MTt2pM1MD4GlQqtJoBYCJJx6LTqlUZ0aKUteSInB/sQDEMZI1PKxQAWwWFiWzUOnVoqc
	 HLixzqw8IwWEZ22GFiJaVDjX1CxcWz8ZIfbNVPSkRSWdsZpPncB7mXPQFtWwqEvw1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="YK+Rz3/0";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCF606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DCF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bingjiao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YK+Rz3/0
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1ab289bb41eso167869c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793669210; x=1794274010; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovrFY2nryAzBfdCJ/BnHMNVEIRqm/CHlabepiDy+ej0=;
        b=YK+Rz3/0ZprYDGorA77rFYuX7QyzdoiM3jfbinDq0kN16cD4Pjpy7DeHQLEODsWkdW
         Vxa3eJmroOBjhGMIByNEuVXy7QWE+oM2uOJYgJ1mpZW+tVmYTxJ36U52a+z3ryml0KZw
         WCAPu1H0fccOBU8oSKiyXaPNmYeNSd/TP/946h2eVuqa3vaMfnPPxb+PCYVQm9poZEoj
         kduF/2VeBQXdi+2GIl8oKiH7MShtIC4UpVCYRVoVVdInIrkrVsJL+YVR/QYpA6NP83lX
         YQk03D50jCz5kabJgItVSTKqjtqpFvettCAKolEU29CK05qhMZA5KjvZIsdOMC5cOSWm
         Hc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669210; x=1794274010;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovrFY2nryAzBfdCJ/BnHMNVEIRqm/CHlabepiDy+ej0=;
        b=YufW5MwMLxl4C+WA/aMryAVmx/UCuGGTjuw3SFYRxvEOBwi58TifMnb/+9Tkx91Kh7
         gJNrNvPquUZdxQ5UsnOC0mkH4JBDrL0M1ce2cV9XfhPzp+m/huAtzc22fNVjRFRNFtln
         wzBuX76ARdUEPaGCtYxJg/uJJknmN0UZcMzUhoVDyB9nqBazZtpDAVUIQxUfImMNe/pj
         6JYyV0DaLK5oViaFQufQA7HodszKlY+0H2ZIuwzTaMoAX/rnhQyY5S+LxYl9amedIaHR
         xbJvR3DYg2Nm1rvj4Q1Bv8/q6P37l23I3znsLx0mBRwZRsOyQw/JWtSn8RCXQ4hbccDi
         i0+A==
X-Forwarded-Encrypted: i=1; AKwUvBxRgVXCnMBHPM49/hngGz3m0AdHjFlo9nDYfG3b3pfrl7SWuj49cPr4ifPBKmGPvbeCZzJnjHHFRfgrpUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBMownVJgYse56+0+AK3fok3xQroShDKqGfUtN3iUSApeLKrzd
	1sbR4v3YP/hDPRo19vsBqdZJCvqA/nFy7CDoesQHxB73TpCDeJOTVmUjb3aOsXz140kxztuakNG
	q9MyKsgKbgD0Smg==
X-Received: from dlbpt2.prod.google.com ([2002:a05:7022:e802:b0:1a3:1342:a32d])
 (user=bingjiao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ec4:b0:181:8948:f022 with SMTP id a92af1059eb24-1ac5c36b5f4mr18821989c88.21.1793669209872;
 Mon, 02 Nov 2026 17:26:49 -0800 (PST)
Date: Tue,  3 Nov 2026 01:26:24 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103012626.2699661-1-bingjiao@google.com>
Subject: [RFC PATCH 0/2] x86/mm/tlb: Skip stale and lazy CPUs in batched TLB flushes
From: Bing Jiao <bingjiao@google.com>
To: x86@kernel.org, linux-mm@kvack.org, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Bing Jiao <bingjiao@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Huang Ying <ying.huang@linux.alibaba.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Juergen Gross <jgross@suse.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Chuyi Zhou <zhouchuyi@bytedance.com>, 
	Xie Yuanbin <qq570070308@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since commit 209954cbc7d0 ("x86/mm/tlb: Update mm_cpumask lazily") and
commit 6db2526c1d69 ("x86/mm/tlb: Only trim the mm_cpumask once a second"),
context switches leave outgoing CPUs set in mm_cpumask(mm). Per-mm flushes
(flush_tlb_mm_range()) filter and periodically trim those stale CPUs using
info->mm, but batched TLB flushes (arch_tlbbatch_add_pending() and
arch_tlbbatch_flush()) pass info.mm = NULL and end up sending IPIs to
every non-lazy stale CPU in mm_cpumask(mm) on every reclaim, migration, or
page demotion batch without ever trimming them.

Patch 1 skips updating batch->cpumask in arch_tlbbatch_add_pending() when
X86_FEATURE_INVLPGB is enabled, where arch_tlbbatch_flush() uses broadcast
invalidation instead of batch->cpumask.

Patch 2 tracks up to ARCH_TLBBATCH_MAX_MMS (8) unique mm_struct pointers
per batch and filters stale and lazy CPUs out of batch->cpumask in
arch_tlbbatch_flush() before issuing remote IPIs.

Tested on 112-CPU Intel Skylake, 384-CPU AMD EPYC Genoa, and 512-CPU AMD
EPYC Turin with CXL memory, all using IPI-based TLB shootdowns (5-run
mean). Following the setup in commit ed15468787dd ("x86/mm: Move
flush_tlb_info back to the stack") and commit 7e12beb8ca2a
("migrate_pages: batch flushing TLB"), a task with all CPUs set in its
mm_cpumask runs on 1 CPU (2 CPUs in test 4) while the other CPUs run
unrelated userspace tasks:

1. Pageout reclaim (81,920 4K pages reclaimed to zram):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs   9,092,156          191       -99.99%
                     Time (ms)       2,974.6        763.0  -74.3% (3.9x)
   384-CPU Genoa     Remote IPIs  31,377,184          157       -99.99%
                     Time (ms)       1,652.6        483.1  -70.8% (3.4x)
   512-CPU Turin     Remote IPIs  41,859,670          119       -99.99%
                     Time (ms)       1,695.7        476.3  -71.9% (3.6x)

2. Page demotion (81,876 4K pages demoted from top-tier to CXL):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   512-CPU Turin     Remote IPIs     958,699          526        -99.9%
                     Time (ms)         213.0        168.2        -21.0%

3. Single-threaded move_pages() (331,600 4K pages migrated):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs      73,370        4,964        -93.2%
                     Time (ms)         702.4        699.7         -0.4%
   384-CPU Genoa     Remote IPIs     252,899       13,899        -94.5%
                     Time (ms)         392.4        347.1        -11.6%
   512-CPU Turin     Remote IPIs     337,426       18,193        -94.6%
                     Time (ms)         370.1        368.1         -0.5%

4. Multi-threaded migrate_pages() + active memory access (656,940 4K
   pages migrated, 2 active threads):

   Platform          Metric        Baseline       Patched        Change
   --------------------------------------------------------------------
   112-CPU Skylake   Remote IPIs     144,610        3,362        -97.7%
                     Pages/sec       386,385      391,050         +1.2%
   384-CPU Genoa     Remote IPIs     493,035        7,730        -98.4%
                     Pages/sec       673,166      725,680         +7.8%
   512-CPU Turin     Remote IPIs     658,193        9,685        -98.5%
                     Pages/sec       670,288      733,020         +9.4%

Bing Jiao (2):
  x86/mm/tlb: Skip batch->cpumask updates when X86_FEATURE_INVLPGB is
    enabled
  x86/mm/tlb: Skip stale and lazy CPUs in arch_tlbbatch_flush()

 arch/x86/include/asm/tlbbatch.h | 14 +++++++++++++
 arch/x86/include/asm/tlbflush.h | 17 +++++++++++++++-
 arch/x86/mm/tlb.c               | 36 +++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)

-- 
2.56.0.385.gac671c819a-goog

