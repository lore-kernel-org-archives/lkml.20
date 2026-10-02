Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5583AEF35
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964935; cv=none; b=XNHzm/t6k9c+R5D5urizPjX3kx/vN6Fz91OTTOIwc1PCZbm1JoNbiQylLj1B5VKSVpIDkeuf6i7+tL0ZMFxM/OfhsRAgfXeAnCdKyuynPISjldvSkG470Mj/iXleJaUML3WOfBtvFs1HMrn3wyCsDI11o311kHFEWA4lYOuu69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964935; c=relaxed/simple;
	bh=4e8p6/y1TTGncDVopacaibE1Ba/KGCJokuerbgXBRTE=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=U4Ei7oSYlp00GfPrXPv8NoBnMrzFiAe0gWBaKMKoO+z8oS+gySMS+VnORhZa/VKxDIArn4oXZvbpk3mlT5Lt1qeytU8fKW6XlSpra/5G8Rtl3iq0UGfhZkX/69YDNiBAwCGbdulzDaYph2qYRuGnyjW5jkaWIqwhlkGlq7Gi18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=q13WlW2y; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nM6zka2q; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="q13WlW2y";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nM6zka2q"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790964929; bh=5P20/FDAh6BT7S0cVgZ/eyI
	21pW7hTsp8mFOwk4qRnw=; b=q13WlW2yeSUvaHekBELzSeBqEy/IrAQtamrDHLYzPPQYytNMV5
	jjtGIwXljAhy9StsQZH5ds7cckWnigQj/tDG5Ab+ZdcdT1P3449wllAHcMb43DRWcZD3s2NZvQn
	OzSk2JSdv63wizyoiBoeVjd3mfywSvBQKXztIYVIWQ5w7h4Pp7jER/bm8xzB70hL59nOB70UL6D
	PgcHe/BeyjVop25hnGBvsK5XvoaxE/A80bT/awQPT6yy670q9TRclYz+OV63JbB+RVczKaZd12V
	4DGsvLUD7HRl2hCU2mQz2W0aHHNY8rCmcIAQWX5AkJESrZelTIcbUSWoG2mgDLseMnQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790964929; bh=5P20/FDAh6BT7S0cVgZ/eyI
	21pW7hTsp8mFOwk4qRnw=; b=nM6zka2qDzhJU1nGbHnfMGBOwYPuBza4QIDNY2pe57Uqmnbjvv
	chI5YvXK3RahnPyw5XcEGA9V1nS4UuGjasDg==;
Date: Fri, 02 Oct 2026 19:15:29 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kmehltretter@gmail.com
CC: akpm@linux-foundation.org, andreyknvl@gmail.com, dvyukov@google.com,
 elver@google.com, glider@google.com, include@grrlz.net,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, tglx@kernel.org
Subject: Re: [PATCH v4] kcov: report spurious PCs in the interrupt selftest
In-Reply-To: <20261002181357.14293-1-kmehltretter@gmail.com>
Message-ID: <59822245-435E-45F0-9C5F-462DB56DD325@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 October 2026 19:13:57 BST, Karl Mehltretter <kmehltretter@gmail.com>
wrote:
>The KCOV interrupt selftest enables KCOV_MODE_TRACE_PC without a
>coverage area so that spurious coverage causes a fault. If the fault
>path is instrumented, the coverage callback faults recursively.
>Observed failure modes include a stack overflow on x86_64 and arm32
>getting stuck in abort handling, neither of which identifies the
>original coverage event.
>
>The recursive failure is not new, but commit 9a79524d1420 ("kcov: use
>WRITE_ONCE() for selftest mode stores") made the selftest effective on
>configurations where the compiler had previously removed the mode
>store, exposing it more broadly.
>
>Replace the open-coded kcov_mode stores with kcov_start() and
>kcov_stop(), passing a 16-word buffer that records up to 15 spurious
>PCs, with the first word holding the count. Keep KCOV enabled for the
>original 300 ms window, then disable it, print all recorded PCs and
>panic if any were recorded. Once the buffer fills, further PCs are
>discarded by the existing coverage callback. This preserves the
>selftest's hard failure while avoiding the recursive fault path.
>
>Add decanonicalize_ip() as the inverse of canonicalize_ip(), which
>subtracts kaslr_offset() from recorded PCs. Restore that offset before
>printing the PCs with %pB, since KCOV records return addresses.
>
>Fixes: 6cd0dd934b03 ("kcov: Add interrupt handling self test")
>Assisted-by: LLM
>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>Tested-by: Alexander Potapenko <glider@google.com>
>Reviewed-by: Alexander Potapenko <glider@google.com>

Tested-by: Bradley Morgan <brads@mainlining.org> # Power10

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>---
>Changes in v4:
>- Explain in the commit message that kcov_start() and kcov_stop()
>  replace the open-coded kcov_mode stores.
>- Mark decanonicalize_ip() as __init.
>- Describe the coverage area in terms of the current selftest behavior.
>- Read the recorded PC count once with READ_ONCE() before reporting it.
>- Add Alexander's Tested-by and Reviewed-by tags.
>
>v3: https://lore.kernel.org/all/20260919080220.37633-1-kmehltretter@gmail.com/
>
>Changes in v3:
>- Increase the coverage area to 16 words: one count and up to 15 PCs.
>- Keep KCOV enabled for the original 300 ms window, then print all
>  recorded PCs, including repeats, after disabling KCOV.
>- Use %pB for the recorded return addresses.
>- Change the attribution to Assisted-by: LLM.
>- Drop the Reviewed-by tags from Alexander and Bradley because the
>  recording and reporting logic changed.
>- Rebase onto mainline commit 40288c9206c17.
>
>v2: https://lore.kernel.org/all/20260724192122.73080-1-kmehltretter@gmail.com/
>
>Changes in v2:
>- Use kcov_start() and kcov_stop() instead of open-coding their logic.
>- Add decanonicalize_ip() next to canonicalize_ip() and use it when
>  reporting the recorded PC.
>- Retest under QEMU on arm64, mips64le, and x86_64.
>
>Alexander also pointed out that adjust_ip()/decode_ip() in
>fs/pstore/ftrace.c perform similar KASLR conversion. Sharing the common
>logic could be a follow-up cleanup, accounting for pstore's additional
>handling of non-core addresses.
>
>Testing v4:
>- GCC 15.2.0: x86-64 bzImage builds for a tinyconfig-based runtime
>  configuration with KCOV_INSTRUMENT_ALL enabled and disabled; W=1
>  kernel/kcov.o builds without warnings for x86-64, arm64, and arm, with
>  KCOV_SELFTEST enabled.
>- QEMU 10.2.1 with TCG, q35, two virtual CPUs, and 512 MiB RAM: the
>  KASLR and nokaslr boots with KCOV_INSTRUMENT_ALL enabled each run for
>  the full 300 ms, print two symbolic PCs, and reach the intended selftest
>  panic. The control with KCOV_INSTRUMENT_ALL disabled completes the
>  selftest without recording coverage; it later stops because the test
>  image has no userspace init.
>
>Testing v3:
>- GCC 15.2.0: x86-64 bzImage builds and W=1 kernel/kcov.o builds for
>  arm64 defconfig and arm multi_v7_defconfig, with KCOV_SELFTEST enabled.
>- x86-64 QEMU: defconfig plus KCOV_SELFTEST prints 15 symbolic PCs and
>  reaches the intended panic after the full test window, both with
>  KASLR enabled and with nokaslr. A control with KCOV_INSTRUMENT_ALL
>  disabled completes the selftest without recording coverage.
>
> kernel/kcov.c | 35 +++++++++++++++++++++++++++++------
> 1 file changed, 29 insertions(+), 6 deletions(-)
>
>diff --git a/kernel/kcov.c b/kernel/kcov.c
>index 35420f0ac524..30e55b7fafb0 100644
>--- a/kernel/kcov.c
>+++ b/kernel/kcov.c
>@@ -198,6 +198,16 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
> 	return ip;
> }
> 
>+#ifdef CONFIG_KCOV_SELFTEST
>+static unsigned long __init decanonicalize_ip(unsigned long ip)
>+{
>+#ifdef CONFIG_RANDOMIZE_BASE
>+	ip += kaslr_offset();
>+#endif
>+	return ip;
>+}
>+#endif
>+
> /*
>  * Entry point from instrumented code.
>  * This is called once per basic-block/edge.
>@@ -1099,9 +1109,11 @@ struct kcov_common_handle_id kcov_common_handle(void)
> EXPORT_SYMBOL(kcov_common_handle);
> 
> #ifdef CONFIG_KCOV_SELFTEST
>+static unsigned long selftest_area[16] __initdata;
>+
> static void __init selftest(void)
> {
>-	unsigned long start;
>+	unsigned long start, i, ip, count;
> 
> 	pr_err("running self test\n");
> 	/*
>@@ -1111,15 +1123,26 @@ static void __init selftest(void)
> 	 * leaks out of that section and leads to spurious coverage.
> 	 * It's hard to call the actual interrupt handler directly,
> 	 * so we just loop here for a bit waiting for a timer interrupt.
>-	 * We set kcov_mode to enable tracing, but don't setup the area,
>-	 * so any attempt to trace will crash. Note: we must not call any
>+	 * A small coverage area records the PCs of any leaks. The first word
>+	 * holds the count, leaving room for 15 PCs. Note: we must not call any
> 	 * potentially traced functions in this region.
> 	 */
>+	kcov_start(current, NULL, ARRAY_SIZE(selftest_area),
>+		   selftest_area, KCOV_MODE_TRACE_PC, 0);
> 	start = jiffies;
>-	WRITE_ONCE(current->kcov_mode, KCOV_MODE_TRACE_PC);
> 	while ((jiffies - start) * MSEC_PER_SEC / HZ < 300)
>-		;
>-	WRITE_ONCE(current->kcov_mode, 0);
>+		cpu_relax();
>+	kcov_stop(current);
>+
>+	count = READ_ONCE(selftest_area[0]);
>+	if (count) {
>+		pr_err("spurious coverage detected during interrupt selftest:\n");
>+		for (i = 1; i <= count; i++) {
>+			ip = decanonicalize_ip(selftest_area[i]);
>+			pr_err("  %pB\n", (void *)ip);
>+		}
>+		panic("kcov: interrupt selftest detected spurious coverage");
>+	}
> 	pr_err("done running self test\n");
> }
> #endif
>
>base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
>


--- Thanks!
"I'm not a very positive person" - Linus torvalds
