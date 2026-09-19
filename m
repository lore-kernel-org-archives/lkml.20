Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A431C567
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804955; cv=none; b=q1CrFfECvwndwlhb87tEgqEVM2l9d4+xXqnM7VzCjbTOTaBKA39mrsUoky931aA9p5anCe22Su9rpvPNwGrlPNPpHbcRcyudvh0dUCBKTcWY1Cb3cmtwBKIazKb3JVcj2CUib7RNKQlBVzEq8/WcmkKElnctZMK2zKPU0SWTYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804955; c=relaxed/simple;
	bh=Yib8G77xlRVZxJGpZS+n541kAH7p4QlKzFE/NeamAHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qv8nYkuCP1DXulDr2PJf7pGUU0fMd9v68XmmnZ7J03aB9P8Y9cq6GCx2JWZI4kSlsb0UVX0P3P0hMOftT63yHRNiC63DZ/OlWhg4iZNt5iumwesDUk/qdJAAMxf6gBFpa4Iy/x1qTWHaFHUotrIj3vltAwLflhBUm/GmLuLP948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag5pnM/n; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag5pnM/n"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1127341f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804951; x=1790409751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJZwBT5SI73XJlDUHeSl4LEEYv+37m+yimLI9WEA3mI=;
        b=ag5pnM/n6Vv0IOQk1DnLR3h3D1KLzvjYYQJRlOOdtSBL2nY8LWHZzBCtEde/iYCTP1
         Xtk8IYd5HB1J4uHCegHSO/g4Ij6kAC12hNL0IVKhoclVloRdKSED5HlSdQ7ZUr5GQOyn
         9E1h7I4/NOcJNjzwaNZe6YXEMb8hjmimKumGowx4upc4ysnvy8/hlFLOSTpOqaSZfo9v
         eTM6B6r68tZuExgpbJJ4Ut5Q/4a1jskrdst37/wt8Jn6LHrqeFlOLpchxHSWIiGGQXh0
         QwtQ8hWsMy+Wf0bJr6suxpv09LAjBFFmqQQlCku0DuKnkmVZvMkqxXK5V9K5CIdyvny4
         EsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804951; x=1790409751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJZwBT5SI73XJlDUHeSl4LEEYv+37m+yimLI9WEA3mI=;
        b=BThyAS1RX2NIC9euej3iAN9EOgH/m3YG/1jEpLdHsyedF0batuAP8vzqFRHavDTZy7
         GfBhWwwCFMj1hIl/C/6qvECxbWmHMPTP1KZEC48+0q9UVJF0DEF8aF7gyfaEy4S8wAYq
         34NE1ELSw0velsVe5+AqOvRMF6CKkhguVjrMX0Ic1m4132MEqjdImdTlKvY6p/N+Gs1s
         Ww7SIHbUpHKVlJWoGUQ/bDXDK/UbkhmejOY1YCGaH2WqoPTcALgGXxo/AYAthxz7d/hh
         AjP2glFCFQLDj8JkuyzALbV7MGToLpI88NXMu8nsxpgN8glJ/MwGEQu7W/CdW1jdFUzc
         x/hw==
X-Forwarded-Encrypted: i=1; AKwUvBz0HFMggL/Ym5ZDYYo+5Sfq/fHKvb38tO+V04f66T5Nkt89xJYr5+RkdqgqTD9Cej8oTO6NqazdaxNKfjc=@vger.kernel.org
X-Gm-Message-State: AFuF++nxifBk11Ja0BG5FfD7NUX9gCWMNURmLNQKt+NIKA3viiHkzYp8
	9skNkvFBPnvjCutPjl2c3pQwUDvCGb3G34iOef511tfyfN74pS6OFwXg
X-Gm-Gg: AYBFou3tAXS5b4wdlCyP9x0D5H6gdjw1mDkwoR9NG4MG1xxX13IH5gK2IbdDGZS964h
	ZMPPrp9+0W8ixKj3HKFJYL93XiwXjkuWmvTe2eC0kbIsQYgjzJCtYAYZ0m+Jtbb2ANKTIVMKhan
	DuFJ1cbJ8FOf0jF5Ti93TnxIq33Se4wyxxXFuYe0nemzMBOvuhs44q9UvKcrRLbAAwB+SVKENS6
	jyCLhYMXl7t4YgRY4wk8aT7sfmF+alTQ1DFryMgxfzDNeZQ7Uyn67oghsFECjLEY1QBA0l8gRvr
	i7MkyHKn1XzFTn0nHY2gMnZ+NwHgQHV1hpGshbBvRJghhnUg3p/7Zux5Ibf6YDI1q8iJDELX85b
	Xo1NkN5k6iZpStQP+MN/4YttbH5a+/ZDpnjgS8ltO0NUKxbpk3CN9npZjPiJxus3PGMKW6kqSuv
	w8HZyeC8JQzoa/ywRnM3Xt6I0RdhpVB2bgI9bb/+lrpvHDePTH6cP/uuFWPkqH+nTyngOX8+BmV
	TgPQWhq8KAtJxEjzg1gFlRv8XEcO0CcBJ1vzrWgBUqzJ/iDg+3mlnpBu9etKd+wrFxsspV2STLI
	4aw1bpxCiazbGWxz6NUF1e7ZpJuxRpmkJX1b7JJudpIEOBviQwNHeAF/CGeU68Kmzvol5ZcZUeO
	g
X-Received: by 2002:a05:6000:4548:b0:487:221f:a2e1 with SMTP id ffacd0b85a97d-487221fa2f6mr3847856f8f.55.1789804951191;
        Sat, 19 Sep 2026 01:02:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872458f7e3sm4966624f8f.25.2026.09.19.01.02.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 01:02:30 -0700 (PDT)
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
Subject: [PATCH v3] kcov: report spurious PCs in the interrupt selftest
Date: Sat, 19 Sep 2026 10:02:20 +0200
Message-Id: <20260919080220.37633-1-kmehltretter@gmail.com>
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

Use a 16-word buffer to record up to 15 spurious PCs, with the first
word holding the count. Keep KCOV enabled for the original 300 ms
window, then disable it, print all recorded PCs and panic if any were
recorded. Once the buffer fills, further PCs are discarded by the
existing coverage callback. This preserves the selftest's hard failure
while avoiding the recursive fault path.

Add decanonicalize_ip() as the inverse of canonicalize_ip(), which
subtracts kaslr_offset() from recorded PCs. Restore that offset before
printing the PCs with %pB, since KCOV records return addresses.

Fixes: 6cd0dd934b03 ("kcov: Add interrupt handling self test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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
index 35420f0ac524d..d96371c2f08ec 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -198,6 +198,16 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
+#ifdef CONFIG_KCOV_SELFTEST
+static unsigned long decanonicalize_ip(unsigned long ip)
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
+	unsigned long start, i, ip;
 
 	pr_err("running self test\n");
 	/*
@@ -1111,15 +1123,26 @@ static void __init selftest(void)
 	 * leaks out of that section and leads to spurious coverage.
 	 * It's hard to call the actual interrupt handler directly,
 	 * so we just loop here for a bit waiting for a timer interrupt.
-	 * We set kcov_mode to enable tracing, but don't setup the area,
-	 * so any attempt to trace will crash. Note: we must not call any
+	 * Set up a small coverage area so that leaks record their PCs
+	 * instead of crashing on a NULL dereference. The first word holds
+	 * the count, leaving room for 15 PCs. Note: we must not call any
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
+	if (selftest_area[0]) {
+		pr_err("spurious coverage detected during interrupt selftest:\n");
+		for (i = 1; i <= selftest_area[0]; i++) {
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

