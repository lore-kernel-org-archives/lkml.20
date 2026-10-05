Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07715293E2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220744; cv=none; b=PFoObrDaewfRLFH6PqJcG0uD3me6VkVCPmXZwqny8qXKrtNg3cdcIgdzwY7y5jmxj/MyKRs+ibupuNd2MHEhg8jidmIwrnp674JdPGJbZONkXgH6n3AiwO4GQ3HWhUEMxGq+8n6l3i7ASXQmp3IT+b7ZIFVS25BjvGigTtRGcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220744; c=relaxed/simple;
	bh=avZ78P4FB57l7iNNKFprWhVAtp3OFF9RdgN73M6kcEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2dCVa2vSSC1rJvr1SKVgj1Xn48abHjBhC/GtYXR/4zdpqiRKPgEFYO8oftPc4eMDfkMCKLhMuqpyrRPCdsX8Wfp/tX+yP8CorPG4wJkYhQ9/aq+uA5Six+2tv0HbpSVDUf0wwZ0e8W8TDUWFwCWfiNuJ/vtFgvVshAoDWgEPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech; spf=pass smtp.mailfrom=ciallo.tech; dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b=ygv59x5q; arc=none smtp.client-ip=198.54.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b="ygv59x5q"
Received: from desktop.ciallo.tech (unknown [104.28.208.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hz5h86Tzvz8sWQ;
	Mon, 05 Oct 2026 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciallo.tech;
	s=spacemail; t=1791220720;
	bh=RonTUenisfHZ/7zoo/cnv68kCTLPY1E0OZUZUWcDvGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ygv59x5qxS+mbbWCVFH5k+qRIjG4BkNEVYQl1QVwmEPcXWQkJperssl97wnRlMsjC
	 ddVz1K31tubF5lfeFJVe/Gk9TygyP7BfTO0Zt+X0PjyB04OYJ+DEmtvV94F7fLRLaR
	 JnXhtVbdUz5ZCJC2VW+A7fTrJN1pN2K76VIQx47upl1xLa/1bh7dEu9Lg5jwl9C7F3
	 47C1uTrnyR6GSpfkhU7KMDwKvZMfuw5aGfK2ClEmZaWZs7KTSO2qGUFb2PePxxDWl4
	 xQf2qGnELvym1kmH522ACoaeG9BdJviLKF3JRM7m6ZJSmg537lnl/9BolJjzm+H0Ov
	 kkVca7Nf4jJBA==
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
Subject: [PATCH v3 1/2] init: claim parameters consumed before the main kernel
Date: Mon,  5 Oct 2026 13:13:45 -0400
Message-ID: <20261005171815.49494-2-rg32@ciallo.tech>
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

Some kernel parameters are consumed before the main kernel is running: the
boot stub, the decompressor and the EFI stub all read the command line
directly (cmdline_find_option*()) and act on options that the main kernel
never registers, because they describe things that are already decided by
then - the kernel's load address, 5-level paging setup, the memory
encryption mode, and so on.

Such parameters are not in any __setup()/early_param() table in the main
kernel, so parse_args() cannot know that they were eaten and
unknown_bootoption() classifies them as unknown: valueless ones end up in
init's argv, "key=value" ones end up in init's environment. On x86 that
list currently contains nokaslr, no5lvl, mem_encrypt= and edd=, all of them
documented parameter names in
Documentation/admin-guide/kernel-parameters.txt.

Inits that look at their arguments are affected: openrc-init takes the
runlevel from argv[1] and therefore reports "nokaslr is an invalid
runlevel", while a shell used as init treats the argument as a script name
and exits, which panics the kernel.

Adding a stub handler for each such parameter on each architecture does not
scale: arm64, loongarch and s390 each carry one for "nokaslr" alone. Let
architectures list the parameters their boot code consumed instead, and
have unknown_bootoption() drop those before they are classified: they are
then neither reported as unknown nor handed to init, while genuinely
unknown parameters keep reaching init exactly as before.

Signed-off-by: sayo <rg32@ciallo.tech>
---
 include/linux/init.h | 12 ++++++++++++
 init/main.c          | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/init.h b/include/linux/init.h
index 6326c61e2332..90c77d6d8cb7 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -375,6 +375,18 @@ extern const struct obs_kernel_param __setup_start[], __setup_end[];
 /* Relies on boot_command_line being set */
 void __init parse_early_param(void);
 void __init parse_early_options(char *cmdline);
+
+/*
+ * Parameters consumed before the main kernel started - by the boot stub, the
+ * decompressor or the EFI stub. They cannot be matched against the
+ * __setup()/early_param() tables in the main kernel, so architectures list
+ * them in an override of boot_param_consumed() to keep them from being
+ * reported as unknown and handed to init.
+ *
+ * @param is the parameter as it appeared on the command line, including
+ * "=value" for parameters that had one.
+ */
+bool boot_param_consumed(const char *param);
 #endif /* __ASSEMBLY__ */
 
 #else /* MODULE */
diff --git a/init/main.c b/init/main.c
index 31f2bf54976a..1230ac77029d 100644
--- a/init/main.c
+++ b/init/main.c
@@ -506,6 +506,18 @@ static int __init set_init_arg(char *param, char *val,
 	return 0;
 }
 
+/*
+ * Did the boot stub, the decompressor or the EFI stub consume this parameter
+ * before the main kernel started? Such parameters are not in any parameter
+ * table here, so nothing else can tell that they were eaten - without this
+ * they are reported as unknown and handed to init. Architectures override
+ * this to list them; see also boot_param_consumed().
+ */
+bool __init __weak boot_param_consumed(const char *param)
+{
+	return false;
+}
+
 /*
  * Unknown boot options get handed to init, unless they look like
  * unused parameters (modprobe will find them in /proc/cmdline).
@@ -527,6 +539,10 @@ static int __init unknown_bootoption(char *param, char *val,
 
 	repair_env_string(param, val);
 
+	/* Eaten by the boot stub/decompressor before the main kernel ran? */
+	if (boot_param_consumed(param))
+		return 0;
+
 	/* Handle bootloader identifier */
 	for (int i = 0; bootloader[i]; i++) {
 		if (strstarts(param, bootloader[i]))
