Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EA3939A2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450024; cv=none; b=UOvKT6UE29Ish1o0cNT8mgsWJbtCtHWgDA4htJvPZM4PXK9SeOQuUV8+G9zqqdWHItCgI3LxXkG3PdompFLGVaVd9AEkxRSaxII8BrO+4EEm/azk9T0otYNnusE2zfQmVG+92uju35tGXFRv5XOXDeSwAVkZjT82Z+ON4lioeto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450024; c=relaxed/simple;
	bh=tWMxBN2lYUc7aqJm4iBI5+UJNsiL4A6qXdAIdyU4cPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PESBF249T2tHiAVBwFXiw3U9boTWSyfX9eaeQC2XYvGpNVnD/lIbaKPrkMmGMKlBPyb9FJaxsNuYpkHGiFfbkVXezUeIp2SkHipqAejfqJebUzfWfX8jNkEFHlj6j9oDIwkVvVnhbtxkwiGxa6kSxTI61b+cLsZmeMQQZ5sD5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXxA3j85; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXxA3j85"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so613907f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450021; x=1791054821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFiz624ouLEyAAyXLCnZKvLJThEjNkHlXSnv7jS5fHY=;
        b=AXxA3j85VdPdPccBYIot6oYjZVUZ4HxaWpj4oX/jxXs6+uXV6WeNSyWsPUOMrXjKvm
         4zwmUKb/TAsgbHN87/xG78UlGvkhvNV2js6JkSuAF+eGVHHLft4klBTYhdNHSHZ6hMzh
         aN2Jjz9g5p+23SDK0/qT6aeV7lqWMJgpRAfK7+YfPpbVhWaox1wAgdJCHj4gI6EMbHL8
         eYed13Z4RihBzmNz7Qu3NGnI/g5LRXwT9VbYyNQEfeR4zMq1YG0AiQIP31XY46FT8ztj
         62WnDnPuBz5ZFW3fTVOZKPy+5BejzkoUHjQdBSojPjjkdSu3Zkw539gC+N3HsfLbzFnA
         //0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450021; x=1791054821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFiz624ouLEyAAyXLCnZKvLJThEjNkHlXSnv7jS5fHY=;
        b=ILCVNIffEZJia2JCcZUcRvttxFkTCyq05tl5o2zHhB5+IAB3kMVqjckaDdcBsktWxa
         LyyKHvTSK31iNeOgjJkreM6hacdrOa6MmiEA54T1zmatsCUtfIB9JWClURY9J4AAoRSy
         /aiAbUcCAjUzGB4U4+GxalrYuRAy0eduPBClP7zWaBD2FqqVh11ygV9txHZLar294bcb
         fMGDiQeXCqQ0jWw1id+QSV07b4mAX5y5lxfe02HD8rDUIh59a1rroitnM67FNwYYWUm1
         arFyl+sWMUYuG+iqWVGMus7PzFQZOWb0dplmdPkOjUVdZ320eqMQzO0RfXMw7Gh4Sbty
         E7FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwX2w551coxnUJF+kOnbTjgO/WoDzTfA8CgAehbZtMiq+F7gmToYVOh6eEBlhdZQvBhWF0WTSp4T6Yfzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRwYOkFQajh2sEYR7lSRoXAGB+JdZ0NRuYgRlXAq/SzXr7n5mZ
	6UmjxqglrddNVzFMySOt3t+/IEAIuXOEYO8KYy/5FVIRXphDi+f75QKG
X-Gm-Gg: AYBFou3r7uy/2YPs7NZvMPY6xkANCH84bQsxPDBch+poonMqMjN0at+bDEMlxkIYYqV
	J8ZP6c/uQ+PUvavmrmw44evFqEIXafTk3gYEtMtPhIz9iaJzYksZfGhDEhr6D2oHQzUW2u4RTeZ
	e2MSpIXf/qUEHw/LuXF/Nh2DiMgucXUNE1EoWRFtQwZCK8yeokjKMB5Wv+z23NnU7KURLG7Hqwa
	QG+7+872iBuRE6V9GqCzr4y6AbXPF+ZW0sEXB2wH2Jb3CKBSpGKA/YNm4rOyteaf5D6H1r97xEz
	UllECRGA9BeCFj0BL+e3RV5UanOQXNdoaRhzjjStCHtgFv3L4GqQOBdDQMluDkQxTkvpAnZTZ3I
	m6gJ/ptYxxloqSPmWRW04m8uGLe3trw5nlYxkRDotRtIyM3ec1cf8iFcqpkMi8/hyjja39CzLdj
	Rmq/aMql+ckYse5tXzlmR8+Z5kBaPMVXFoRzf+hK5qoBMagGBwvQx1P0rQQKDcBbLI94ON5tsLD
	5BWXW9kT0lyW4FaFgA6bV7jIQY8fvC1YQk0d/fBGPvqMzqUFVAihmZ+f24qyTxpFPI5s+DM8Unc
	hgYyiOWIaYTa8KAzfRKI3OzvLARLPLS44aTK0UxdsZd1wwWVfxMyRREPTiNY9QpdaUZQYAoJ2XX
	Uyg==
X-Received: by 2002:a05:6000:2383:b0:488:81d4:8bfc with SMTP id ffacd0b85a97d-48881d48c0bmr10171258f8f.11.1790450020913;
        Sat, 26 Sep 2026 12:13:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm15364391f8f.21.2026.09.26.12.13.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 12:13:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: irq: exclude the softirq stack switch from KCOV
Date: Sat, 26 Sep 2026 21:13:25 +0200
Message-Id: <20260926191325.79047-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IRQ exit, __irq_exit_rcu() drops HARDIRQ_OFFSET before calling
invoke_softirq(). The arm64 do_softirq_own_stack() wrapper and its
____do_softirq() trampoline run before __do_softirq() establishes
softirq context, so KCOV records their PCs in the interrupted task's
coverage buffer. They also run outside softirq accounting when
local_bh_enable() reaches do_softirq().

The IRQ-exit coverage makes the KCOV boot selftest fail even after
the scheduler and timer coverage leaks are suppressed. The generic
softirq.o is already excluded from KCOV, but that exclusion does not
cover the separately compiled arm64 wrappers.

Exclude irq.o from KCOV instrumentation, as is already done for the
arm64 entry code. This covers both wrappers even with compilers that
lack the no_sanitize_coverage attribute. The softirq action functions
remain instrumented for explicit remote coverage.

Fixes: 8eb858c44b98 ("arm64: run softirqs on the per-CPU IRQ stack")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This patch applies without my other pending KCOV or softirq patches.
For testing, the pause series [1] suppresses the other known
timer/scheduler leaks, and the selftest diagnostic [2] reports the
remaining PCs.

Tested on mainline 40288c9206c17 with both prerequisites applied:
- GCC 15.2 arm64 builds, KCOV_INSTRUMENT_ALL and KCOV_SELFTEST enabled.
- QEMU virt/cortex-a76: baseline reports 15 PCs alternating between
  the two wrappers and panics. The fix passes three boots with KASLR
  and three with nokaslr. All KASLR boots have nonzero relocation.
- Raspberry Pi 500, BCM2712 D0: baseline records seven PCs from each
  wrapper. The fixed kernel completes the strict selftest with zero
  PCs. The baseline alone replaces the final panic with a diagnostic
  and return so SSH can retrieve its log. Recording is unchanged.
- Clang 21 W=1 object builds: irq.o has no KCOV callbacks after the
  change, while syscall.o retains its instrumentation.
- Fixed QEMU image: positive PC and comparison coverage remains live
  for getpid() and close(-1), with neither buffer saturated.

My softirq IRQ-exit v3 patch [3] makes the boot selftest pass in QEMU
and on the Pi without this patch. It does not cover the task-context
path through local_bh_enable(). A five-send loopback UDP test shows:

                                    v3    v3 + this patch
  Wrapper PC entries (five sends)  10    0
  Sends covering udp_sendmsg()     5/5   5/5

A bounded syzkaller replay compared my softirq v4 patch [4] alone
against v4 plus this patch. It used 18 reviewed programs with 40
executions per program and variant across four fresh boots in A-B-B-A
order. A is v4 alone; B adds this patch:

                                    v4          v4 + this patch
  Program executions               720         720
  Wrapper PC entries (40 sends)    80          0
  Stable non-wrapper locations     7,172       7,172
  Executions to reach 99%          17          17
  Greedy fixed corpus              16/4,068 B  16/4,068 B
  Executor time                    3.932 s     3.956 s

This fixed replay measures coverage cleanup, not syz-manager discovery
or corpus growth.

A longer replay used the same A-B-B-A order and ran the workload for
30 minutes per variant. Excluding a 30-second warmup from each 15-minute
session left 29 measured minutes per variant:

                                    v4          v4 + this patch
  Program executions               119,883     119,868
  Programs/s                       68.898      68.890
  Mean executor time/program       5.256 ms    5.285 ms
  90%-stable non-wrapper locations 6,959       6,953
  Wrapper PC entries (40 sends)    80          0
  KCOV overflows                   0           0

The 80 entries are 40 instances of each wrapper PC. The variants shared
6,952 stable non-wrapper locations; the six unmatched locations were
route-lookup PCs. The timing differences were not material.

Apply checks pass on v6.1, v6.6, v6.12 and v6.18; those older kernels
have not been built or boot-tested here.

[1] https://lore.kernel.org/all/20260914054632.12877-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/all/20260919080220.37633-1-kmehltretter@gmail.com/
[3] https://lore.kernel.org/all/20260924041538.52574-1-kmehltretter@gmail.com/
[4] https://lore.kernel.org/r/20260926143505.66024-1-kmehltretter@gmail.com/

 arch/arm64/kernel/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec5288..ea66339435bf0 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -25,6 +25,9 @@ KASAN_SANITIZE_stacktrace.o := n
 KCOV_INSTRUMENT_entry-common.o := n
 KCOV_INSTRUMENT_idle.o := n
 
+# Softirq stack switching can run outside interrupt context.
+KCOV_INSTRUMENT_irq.o := n
+
 # Object file lists.
 obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   entry-common.o process.o ptrace.o			\
-- 
2.53.0
