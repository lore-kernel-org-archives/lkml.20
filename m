Received: from out-2z4y-a152.jellyfish.systems (out-2z4y-a152.jellyfish.systems [198.54.127.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6452845A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220744; cv=none; b=KPcqDJv3/Mdt7OOnGugtMniEwzIjZgnu09VMhBLMw+t3Yqi4PzNmV4x94LIAUnilSH0Zws7DW/tWrEKkQF/fpZtxWn+PlMNoF59xV/Z4Ox4WdXLEcR56LDZuUXshdoylsuo41UDF/gRAunagEN/ETtZr9cCBsAksKEnDxOP+gQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220744; c=relaxed/simple;
	bh=PxafvjuAGaMFJLVz1cGlCF6CkKIE/2m03c3rWTuaOyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dw94IEmrtkerTi9G/04LxTNaqtvVBDGmuX44eBK2yj5GpOl4zp3qnQ4ibfp3cjiBNOMgtxyQyF3bi6XUDsaarjRxL/NMOVRdvnuqM3AKQEgoZ7W3oID42HR7unfNYuvpF/1OhpahrV1bkvzVgOi/QiqtF6U+b+NE68nSu/qEWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech; spf=pass smtp.mailfrom=ciallo.tech; dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b=m4W7NsaI; arc=none smtp.client-ip=198.54.127.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b="m4W7NsaI"
Received: from desktop.ciallo.tech (unknown [104.28.208.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hz5hK1xfSz8sWQ;
	Mon, 05 Oct 2026 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciallo.tech;
	s=spacemail; t=1791220729;
	bh=cMXDj7Q/DxDEjYDVyZviVrrsZdrgEjY6DcBXtFOm/8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4W7NsaI8WqLIDNEb6H6T5wzSOeEJtP1SmrBIRtOMYdHD6PrJi/wWnimgNG5BoO8M
	 IJQTJV3JlxJN4bZabRqAokCTVYhfIEyAwGf26kWJVm8yyURV5Vs4msTnEWwo/A27Ew
	 TwWZ7S2yPh5d0V8c8pQGoviP4MCgRW0dDZm0/kDqtPgSvVISN+eQ87Q+O+fZiOEnmB
	 Fw0C6bkWgeNv/2hWYgmNKYvR1O1GPGkCZeN1LDTjW1yOc8SXI1Tf8bvpL7adhOenPf
	 Xht/dBXaZnvdyjVkutnpNN0VSW3O9FTgVV2N7Z/d/hqBFkRDN15ToRu72+Ugfk6PE4
	 mHJt63Z0Kn10Q==
From: sayo <rg32@ciallo.tech>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	m.younesbadr@gmail.com,
	nir@lichtman.org
Subject: [PATCH v3 2/2] x86: claim the parameters consumed by the boot stub and decompressor
Date: Mon,  5 Oct 2026 13:13:46 -0400
Message-ID: <20261005171815.49494-3-rg32@ciallo.tech>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005171815.49494-1-rg32@ciallo.tech>
References: <20261005171815.49494-1-rg32@ciallo.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: rg32@ciallo.tech

List the parameters that arch/x86/boot/ and the decompressor consume before
the main kernel is running, so that unknown_bootoption() no longer forwards
them to init:

  nokaslr	arch/x86/boot/compressed/kaslr.c
  no5lvl	arch/x86/boot/compressed/pgtable_64.c
  mem_encrypt=	arch/x86/boot/compressed/misc.c
  edd=		arch/x86/boot/edd.c
  forcepae	32-bit only: its __setup() is compiled out on x86-64

Booted with "nokaslr no5lvl edd=off forcepae mem_encrypt=off foo=bar --
extra1" (plus the usual console=), before:

  Unknown kernel command line parameters "nokaslr no5lvl forcepae edd=off
  mem_encrypt=off foo=bar", will be passed to user space.
  argv: {"/init", "nokaslr", "no5lvl", "forcepae", "extra1"}
  envp: {"HOME=/", "TERM=linux", "edd=off", "mem_encrypt=off", "foo=bar"}

and after:

  Unknown kernel command line parameters "foo=bar", will be passed to
  user space.
  argv: {"/init", "extra1"}
  envp: {"HOME=/", "TERM=linux", "foo=bar"}

which is also what makes the notice useful again: it now only names
parameters that really are unknown.

Signed-off-by: sayo <rg32@ciallo.tech>
---
 arch/x86/kernel/setup.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c..34f7add84243 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1325,3 +1325,43 @@ bool arch_cpu_is_hotpluggable(int cpu)
 	return cpu > 0;
 }
 #endif /* CONFIG_HOTPLUG_CPU */
+
+/*
+ * Parameters that the boot code consumes before the main kernel is running.
+ * They are deliberately not registered with early_param()/__setup() here:
+ * what they configure has already been decided by the time this code runs,
+ * and the decompressor (a separate program, arch/x86/boot/compressed/) does
+ * not contribute to any section in this image.
+ *
+ * Without being claimed, they are treated as unknown parameters and handed
+ * to init - valueless ones as arguments, "key=value" ones as environment
+ * variables. openrc-init, for instance, reads the runlevel from argv[1] and
+ * then complains that "nokaslr is an invalid runlevel"; a shell used as init
+ * treats the argument as a script name and exits, which panics the kernel.
+ *
+ * Keep this in sync with the cmdline_find_option*() calls in
+ * arch/x86/boot/ and drivers/firmware/efi/libstub/.
+ */
+static const char * const boot_consumed_params[] __initconst = {
+	"nokaslr",		/* arch/x86/boot/compressed/kaslr.c */
+	"no5lvl",		/* arch/x86/boot/compressed/pgtable_64.c */
+	"mem_encrypt",		/* arch/x86/boot/compressed/misc.c */
+	"edd",			/* arch/x86/boot/edd.c */
+	"forcepae",		/* 32-bit only: __setup() is compiled out on x86-64 */
+};
+
+bool __init boot_param_consumed(const char *param)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(boot_consumed_params); i++) {
+		const char *name = boot_consumed_params[i];
+		size_t len = strlen(name);
+
+		if (!strncmp(param, name, len) &&
+		    (param[len] == '\0' || param[len] == '='))
+			return true;
+	}
+
+	return false;
+}
