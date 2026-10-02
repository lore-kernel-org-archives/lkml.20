Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8543AC0C6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964862; cv=none; b=V9BsfMOBBVu74tWX5QDzn/o/oi1tEZq9uQYsuZ9LDJipymyqt2KSoG0EMXJ54Cae8svG9kaYEhTzXPUEfdvaU39yFSe1vIGgr19ZNyzmVcmbG7VJZFmUBrnb3ee6XUb8Dm3UEwpDEvqEpbYlRYHvSUEQYRuatKSqe/rTL7AGO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964862; c=relaxed/simple;
	bh=sjd4nfxT473wyNgPHp5qINd0UHNuk5OzKbbGqhwDgFw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MbHEeVF+4RBV1qBVqwUMngSZmC9IWXVRZ+kTj6sA+53E6UstVHgRwR3xKQUE7YB1UvKTas+6Tt+Xw8rWg1vE08qR5Jrq9dnculriVBSqIK3NBx8VATtKuP0TbwAARn5EjA3SOwhQl3LscX2Pe0zMh870QsxOr+nDIzncchEZ+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBipxItr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBipxItr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so1967165e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790964859; x=1791569659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dn3R2YEnoimRZOXDlB+byNPCiaeHQ1ct/TXjep3PgUE=;
        b=YBipxItrlBYpSYI7mjX+n6S7lzJcLPqNgmbUEsVDTJSc0dH5CH/QWPKozkhTG7rW6A
         oJc/x69GUzcBsWWh0wgAajN+pq90F0fBMJD0EBoEb9pty4vlGHHnfwTPqCb4Hm/19T5h
         l9TqFV/hnqkpzDqfE0bOsOH4i0EZO7jYj6jy48Jfk5w74bbktPzoX9KckAehChCuA9BP
         jy5VBx6j8Goshyv4QQ2GE7lyYvjc4Pqb1Sb7XT3fHUDV8eROAmYEEegqBcrau6hzA8dL
         llVza98t8QvuG4m/b2NCRBNUH/SNd9p7Aoz8jArMaMJqiP1DQSOhebDE2Klz0Fobkkdb
         Mdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790964859; x=1791569659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn3R2YEnoimRZOXDlB+byNPCiaeHQ1ct/TXjep3PgUE=;
        b=V/Hh4y2/iSlScnDCqh0EqpbKGxpjw114OEKlroDIlKUbZp4BxVh8nEQD5mNUSEylAi
         iRl+74gVcKpxDVvl8DNFyXa0xOUb07R0LS8Gfs/gKYySwIb4gRJityHCK1/uJzWxAedp
         HMKmUFMSfL9GMhZPlWVmCQ9v9RGgNmxNfqbbV+G0NKcq87PrLAG5hEQjosHEcO0hYG1I
         4vnTRPgY1y9xmdLvm3d6+8G1M4BvilZrwS6X4K6QSwzNGrlll82lNTdCZC2bVND01rLX
         h0D7JspPZM+5l8vDiYfAtlocj8mhfg/GImhf24kAP8WVIDOV5aUWqlna8uqOVFJnhkY3
         uo5w==
X-Forwarded-Encrypted: i=1; AKwUvBwoCypvAK1eABWRprm0M3oVqDP5VQlJHRJiYiVOJiG5wHufvwF0OH0SAAH3ZtTET1pftxTFyBCRLONmJ9c=@vger.kernel.org
X-Gm-Message-State: AFuF++m3VUUx3J2HQB5Kiojvy5PpfCDdHh7QzVGm2Sat34yLsR62py/O
	RBVK7AvYmh0pKhGeWXv3yf8UXooc8s7m3MiZ8c663PRD8ytAM5xtT7Am
X-Gm-Gg: AYBFou0Hr9fghzRIBjaU+Y+GJJuPmsc8/MsUZOCUd2/4v8PJc7BqRMIFESLLgFU/IVw
	Lao2+gvBdsNuG7cabtDg9yDmxLBBpKQwKl0D1FlRv3YgyR8leeY2ZqZFD6Zwgjo8ottloGu6iBI
	2Xb+g8KjQsoSU9MXKyqIApnh27/mFKltwwbq7W414AV2OeI5ysBizpBJ9MwUWZXs9Ys+GV3UaNt
	rOep3oN4oFoPkzGtMfl99v1aspbLdPFooM6mNrVZZeMkmb7QLK3ctMNKvFgYDTSn4GwZ5i2vB8r
	hEs01ZAI3EOjAnliza5AvgydDmSvJ0u+AYfGYDGXI6mw3mkQ3iNvC9umJs8Vt5oF5RXj0TfEx0Y
	WgOKeIpZCtycvluAqelBjEMfCOnSYn24Cih2DzK1ZwRySyLjWkb6aq9zFOF7B3cVbP4D47V9SmW
	oauOZY3KPGwraCbYy+REFQF3F5F/7ogEUaYDogGZ17nwGInIBIOpsZOZQDvjUwGokKXUUFsB4n9
	X92ITT2jkBXP3ZA32l0lSnzqf488C4EIeB4mxiEWmGOtfxkgYrYTWG8h3ypkPlFK1EpbIS39Y+6
	ZxjFG42dAQaAwXlE1owZrQdkyogpPN97tSCgbHVI+5AVYcexXfzp4GBDmL3yKB1bNHZoA0OSu5+
	yV8edOm5ceC+S
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr62957775e9.4.1790964858549;
        Fri, 02 Oct 2026 11:14:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm82376175e9.0.2026.10.02.11.14.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 11:14:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
	Thomas Gleixner <tglx@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] kcov: report spurious PCs in the interrupt selftest
Date: Fri,  2 Oct 2026 20:13:57 +0200
Message-Id: <20261002181357.14293-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KCOV interrupt selftest enables KCOV_MODE_TRACE_PC without a
coverage area so that spurious coverage causes a fault. If the fault
path is instrumented, the coverage callback faults recursively.
Observed failure modes include a stack overflow on x86_64 and arm32
getting stuck in abort handling, neither of which identifies the
original coverage event.

The recursive failure is not new, but commit 9a79524d1420 ("kcov: use
WRITE_ONCE() for selftest mode stores") made the selftest effective on
configurations where the compiler had previously removed the mode
store, exposing it more broadly.

Replace the open-coded kcov_mode stores with kcov_start() and
kcov_stop(), passing a 16-word buffer that records up to 15 spurious
PCs, with the first word holding the count. Keep KCOV enabled for the
original 300 ms window, then disable it, print all recorded PCs and
panic if any were recorded. Once the buffer fills, further PCs are
discarded by the existing coverage callback. This preserves the
selftest's hard failure while avoiding the recursive fault path.

Add decanonicalize_ip() as the inverse of canonicalize_ip(), which
subtracts kaslr_offset() from recorded PCs. Restore that offset before
printing the PCs with %pB, since KCOV records return addresses.

Fixes: 6cd0dd934b03 ("kcov: Add interrupt handling self test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Tested-by: Alexander Potapenko <glider@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
Changes in v4:
- Explain in the commit message that kcov_start() and kcov_stop()
  replace the open-coded kcov_mode stores.
- Mark decanonicalize_ip() as __init.
- Describe the coverage area in terms of the current selftest behavior.
- Read the recorded PC count once with READ_ONCE() before reporting it.
- Add Alexander's Tested-by and Reviewed-by tags.

v3: https://lore.kernel.org/all/20260919080220.37633-1-kmehltretter@gmail.com/

Changes in v3:
- Increase the coverage area to 16 words: one count and up to 15 PCs.
- Keep KCOV enabled for the original 300 ms window, then print all
  recorded PCs, including repeats, after disabling KCOV.
- Use %pB for the recorded return addresses.
- Change the attribution to Assisted-by: LLM.
- Drop the Reviewed-by tags from Alexander and Bradley because the
  recording and reporting logic changed.
- Rebase onto mainline commit 40288c9206c17.

v2: https://lore.kernel.org/all/20260724192122.73080-1-kmehltretter@gmail.com/

Changes in v2:
- Use kcov_start() and kcov_stop() instead of open-coding their logic.
- Add decanonicalize_ip() next to canonicalize_ip() and use it when
  reporting the recorded PC.
- Retest under QEMU on arm64, mips64le, and x86_64.

Alexander also pointed out that adjust_ip()/decode_ip() in
fs/pstore/ftrace.c perform similar KASLR conversion. Sharing the common
logic could be a follow-up cleanup, accounting for pstore's additional
handling of non-core addresses.

Testing v4:
- GCC 15.2.0: x86-64 bzImage builds for a tinyconfig-based runtime
  configuration with KCOV_INSTRUMENT_ALL enabled and disabled; W=1
  kernel/kcov.o builds without warnings for x86-64, arm64, and arm, with
  KCOV_SELFTEST enabled.
- QEMU 10.2.1 with TCG, q35, two virtual CPUs, and 512 MiB RAM: the
  KASLR and nokaslr boots with KCOV_INSTRUMENT_ALL enabled each run for
  the full 300 ms, print two symbolic PCs, and reach the intended selftest
  panic. The control with KCOV_INSTRUMENT_ALL disabled completes the
  selftest without recording coverage; it later stops because the test
  image has no userspace init.

Testing v3:
- GCC 15.2.0: x86-64 bzImage builds and W=1 kernel/kcov.o builds for
  arm64 defconfig and arm multi_v7_defconfig, with KCOV_SELFTEST enabled.
- x86-64 QEMU: defconfig plus KCOV_SELFTEST prints 15 symbolic PCs and
  reaches the intended panic after the full test window, both with
  KASLR enabled and with nokaslr. A control with KCOV_INSTRUMENT_ALL
  disabled completes the selftest without recording coverage.

 kernel/kcov.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..30e55b7fafb0 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -198,6 +198,16 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
+#ifdef CONFIG_KCOV_SELFTEST
+static unsigned long __init decanonicalize_ip(unsigned long ip)
+{
+#ifdef CONFIG_RANDOMIZE_BASE
+	ip += kaslr_offset();
+#endif
+	return ip;
+}
+#endif
+
 /*
  * Entry point from instrumented code.
  * This is called once per basic-block/edge.
@@ -1099,9 +1109,11 @@ struct kcov_common_handle_id kcov_common_handle(void)
 EXPORT_SYMBOL(kcov_common_handle);
 
 #ifdef CONFIG_KCOV_SELFTEST
+static unsigned long selftest_area[16] __initdata;
+
 static void __init selftest(void)
 {
-	unsigned long start;
+	unsigned long start, i, ip, count;
 
 	pr_err("running self test\n");
 	/*
@@ -1111,15 +1123,26 @@ static void __init selftest(void)
 	 * leaks out of that section and leads to spurious coverage.
 	 * It's hard to call the actual interrupt handler directly,
 	 * so we just loop here for a bit waiting for a timer interrupt.
-	 * We set kcov_mode to enable tracing, but don't setup the area,
-	 * so any attempt to trace will crash. Note: we must not call any
+	 * A small coverage area records the PCs of any leaks. The first word
+	 * holds the count, leaving room for 15 PCs. Note: we must not call any
 	 * potentially traced functions in this region.
 	 */
+	kcov_start(current, NULL, ARRAY_SIZE(selftest_area),
+		   selftest_area, KCOV_MODE_TRACE_PC, 0);
 	start = jiffies;
-	WRITE_ONCE(current->kcov_mode, KCOV_MODE_TRACE_PC);
 	while ((jiffies - start) * MSEC_PER_SEC / HZ < 300)
-		;
-	WRITE_ONCE(current->kcov_mode, 0);
+		cpu_relax();
+	kcov_stop(current);
+
+	count = READ_ONCE(selftest_area[0]);
+	if (count) {
+		pr_err("spurious coverage detected during interrupt selftest:\n");
+		for (i = 1; i <= count; i++) {
+			ip = decanonicalize_ip(selftest_area[i]);
+			pr_err("  %pB\n", (void *)ip);
+		}
+		panic("kcov: interrupt selftest detected spurious coverage");
+	}
 	pr_err("done running self test\n");
 }
 #endif

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.53.0
