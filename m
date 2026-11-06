Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976002;
	b=rQ/g27tmx8ygpv2IlsT8Wexzc6PudW60vIZJ7uVwxA6v6YzsSU48TzIe//nsKkHcPn08
	 pZSjyysL4I6jFsNE69z6rulfJwW3xUoaWHmSuU4Z594idk/MOZJuf+jKJSj737D53o0I7
	 rFCwZirc/FQkb6RgQIEmxYoIDIyCHwUmCLSJWfJgR39i4/wxGeawigYgGYzCv94ZJUM/r
	 Ff6chPqa/0jtFrWnGy9CZFS7FZp2Yb06nI52kbi+OlPRJuPwJu6KRgrg0RDHEhjdXkTwR
	 hH2wme8gA/fWKH+l5TmDx4pwltzfyh3VxAL4P5aBdKNvSJS9yVQkbgwNoaR+e/Vzx2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JToukDNMNPYjncVinCRQVqH4lNSXma38Neh0EQ6yzFk=;
	b=S4f0Ou/kZTdSeB8HTmEFiMrV5XkVZIg1P/w4Pnz4VQsyLt0JXzi3ZEDukpP5SX25JYn1
	 TeORqPH2/r/C3yidxui2djhZmbwL+P5IpdrAixHaXGvFMJsDK2Jm20woRax3QcHsK7oYa
	 c+ySgudfm3UBeKDH6ijgxYNHul4BkwoANArNuGWO4phl2Qbd/3/ClRMrjse6rPlfvzV1y
	 R8A6Rdn/spDmdcE+K927jhUEKsPr80zGpugNLYujNEMw8/SBODFl+vYuj7zuNSsDxGKiW
	 tYLxHps/GGzn9GrMlC5MLDTNh2MhQxwdwWB/ZG0v5FjGrwsQllTh/SaBfxWM5KfYMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiWP5Rp6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A0606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385A0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiWP5Rp6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1468237eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976001; x=1794580801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JToukDNMNPYjncVinCRQVqH4lNSXma38Neh0EQ6yzFk=;
        b=SiWP5Rp6kd3p6MMbZBzvLpzPMo+fAyp1/SPx/oyv8p5muNVS98HYdpTM5HVYNFJ1Jh
         5wxRL+iFKXsDyxkQa8SP4ITL6xuSb1hHga0qOuIABwwuaCCLKZ1h/OHNoqPNvCUwIyyD
         suxhxanohfNlOIFVHYwndFNpekv9Sos1VacqB/bBk8lPILelwFi2l5N3fS5nzR4K11ys
         YzQELGZ3YDrE4fZQnIjAigv23jNxRGsUolcTsQ/WC9G8+buPa7sgBBS1lu/4uE8BvCwl
         fSidnoobNdypRBq6i2mNTUe9tMJVnR1IK1jzqAMij18IexUeVoZNgr6Jse3rkSmgXLlS
         B3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976001; x=1794580801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JToukDNMNPYjncVinCRQVqH4lNSXma38Neh0EQ6yzFk=;
        b=nGOGbOkRavgm0exsAoYSQQS20hlc0JBhl5hyTjSyzZLmMOq5sv50J8D4hEKR25IRTG
         aU+agjI8yt5e73GHPwS4GqEGStx8ygJHjH84zqdqvgltxMEcyidfQ3PxaRhAxwVU0FgP
         UZKSSIJrK5THGioUUjAgBUsIATfJa7F10uZ48wm9CJzHBSBbfT6CjETSQ/xLrXcyAkd1
         FiCE6Ihe2wJL6uUo8yxTJ0RztxKO0JqncqrucvHUfZluWxyFc9I59/oB6ClF8BLfcCbK
         jJtyLFQXrpfWB50eOgldXlVJi67u0V+7kpCNrh1xJ8d+eSZEg3DFd1tyUgwwXBXIRkkI
         HwNA==
X-Forwarded-Encrypted: i=1; AL+hErGHV007H859lS3oqywe9ZPBmSPmKrcRvD9LAfHLLYtD6cy5LACGSLwHo8Qk5uRtjgnhBSRPiul/p25LgZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NOE1bLF5U6dqW15XucPLzjhsBbfqPBgYby7ISqOy3PcCXp3SI
	vzn+7smIM0USTs77KfxmmwaJW4WqQ27bbSi71lu5iKXPFlMSAvmQzL3W
X-Gm-Gg: AYBFou2ndiPCvb8crEBTNcEPKprbZZnX2UW/7Oo/XkdZn/zvlVF48SrqJTgq+L+ezpb
	EhrBaMRtNWru95mbaneSWsgvP9EcQOTmScPCHaq01eENIjdo7loHm23QdQi4GKZpk6NJJ+anSTU
	YBAz33uYhsM16Msyc+PXYrpseIio3JGtnjzGjU85cyBGjbyIbQ1GR/56PD7YJbCURZdpOtFBEsn
	kKLdjIiKsV6ABwcuwNhOOCscl9Py8sXXfeBSypl/huZfkPBjbXAPeB9YGeF+Epq3uwsd2EuXLA3
	5Twdu5Us9e7ip4XCHtNPq1rPEXbni4otc3lwpsUBjwl7WogSsnlYwH5LYr6U+LGt+bupCiYa5MT
	X3QpsTsU7TITKHvZkcKag1SIwnZkgasuTwVZK2L6qLuiBE0dNOvQY7vDnuYhq5aPqUgWuohek0y
	tVRSb5VvTAvemOQjcmx1n+eBIgNdEb+tYwolDy4DPN/5+BfCFeECe/e8ZDM0Xaz545CdouO+Fz3
	KfO+w1YeUSOtyo+qAjHnun2yvels6C+VC4VVLIYAhAXSRpCBuk2ucr1+YPpzIEY2diBmtL5owQk
	PwZ2BM9HGcUur6mHOW0aU/AliVfsFuOHeWtQmn0=
X-Received: by 2002:a05:7300:f68b:b0:368:c6b9:d3c0 with SMTP id 5a478bee46e88-36f76719fd4mr3580740eec.28.1793976000977;
        Fri, 06 Nov 2026 06:40:00 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:59 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 4/5] rcu: Add KASAN aux-stack verification test
Date: Fri,  6 Nov 2026 22:39:12 +0800
Message-ID: <20261106143913.3627722-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106143913.3627722-1-kunwu.chan@gmail.com>
References: <20261106143913.3627722-1-kunwu.chan@gmail.com>
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

Add a test module that verifies kasan_record_aux_stack()
recording for RCU callbacks.  The flavor to test is selected at
build time by a Kconfig choice.  The test enqueues a callback from
a noinline helper, drains it while the rcu_head is still allocated,
then frees the rcu_head and triggers a use-after-free report.  The
report should list the enqueue helper under "Last potentially
related work creation:".

Draining before the free keeps the callback from ever running on
freed memory, and the post-call statement in the helper prevents
GCC from tail-calling the enqueue API, which would drop the
helper's frame from the recorded stack.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/Kconfig.debug        |  38 ++++++++++++
 kernel/rcu/Makefile             |   1 +
 kernel/rcu/rcu_kasan_aux_test.c | 107 ++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 kernel/rcu/rcu_kasan_aux_test.c

diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 7c3c6017b266..5c6c07d36157 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -53,6 +53,44 @@ config RCU_TORTURE_TEST
 	  Say M if you want the RCU torture tests to build as a module.
 	  Say N if you are unsure.
 
+config RCU_KASAN_AUX_TEST
+	tristate "KASAN aux-stack verification test for RCU callbacks"
+	depends on DEBUG_KERNEL && KASAN_GENERIC
+	help
+	  This option builds a test that verifies that the selected
+	  RCU flavor's callback-enqueueing path records the
+	  enqueueing call path via kasan_record_aux_stack().
+	  The test intentionally triggers a single KASAN
+	  use-after-free report at init time.  The report should
+	  list the enqueue helper under "Last potentially related
+	  work creation:".  Check the kernel log for the report.
+	  Select the RCU flavor to test below.
+
+choice
+	prompt "RCU flavor"
+	depends on RCU_KASAN_AUX_TEST
+
+config RCU_KASAN_AUX_TEST_FLAVOR_TREE
+	bool "Tree RCU (call_rcu)"
+	depends on TREE_RCU
+
+config RCU_KASAN_AUX_TEST_FLAVOR_TINY
+	bool "Tiny RCU (call_rcu)"
+	depends on TINY_RCU
+
+config RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TREE
+	bool "Tree SRCU (call_srcu)"
+	depends on TREE_SRCU
+
+config RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TINY
+	bool "Tiny SRCU (call_srcu)"
+	depends on TINY_SRCU
+
+config RCU_KASAN_AUX_TEST_FLAVOR_TASKS
+	bool "RCU Tasks (call_rcu_tasks)"
+	depends on TASKS_RCU
+endchoice
+
 config RCU_TORTURE_TEST_CHK_RDR_STATE
 	bool "Check rcutorture reader state"
 	depends on RCU_TORTURE_TEST
diff --git a/kernel/rcu/Makefile b/kernel/rcu/Makefile
index 478ef2237fee..bca05ac9c4cc 100644
--- a/kernel/rcu/Makefile
+++ b/kernel/rcu/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TREE_SRCU) += srcutree.o
 obj-$(CONFIG_TINY_SRCU) += srcutiny.o
 obj-$(CONFIG_HAZPTR_TORTURE_TEST) += hazptrtorture.o
 obj-$(CONFIG_RCU_TORTURE_TEST) += rcutorture.o
+obj-$(CONFIG_RCU_KASAN_AUX_TEST) += rcu_kasan_aux_test.o
 obj-$(CONFIG_RCU_SCALE_TEST) += rcuscale.o
 obj-$(CONFIG_RCU_REF_SCALE_TEST) += refscale.o
 obj-$(CONFIG_TREE_RCU) += tree.o
diff --git a/kernel/rcu/rcu_kasan_aux_test.c b/kernel/rcu/rcu_kasan_aux_test.c
new file mode 100644
index 000000000000..df3169ac39b0
--- /dev/null
+++ b/kernel/rcu/rcu_kasan_aux_test.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * KASAN auxiliary-stack verification test for RCU callbacks.
+ *
+ * Copyright (C) 2026 Kunwu Chan <kunwu.chan@gmail.com>
+ *
+ * For each supported RCU flavor, this module enqueues a callback
+ * from a noinline helper, drains it while the rcu_head is still
+ * allocated, then frees the rcu_head and immediately reads the
+ * freed memory.  The resulting KASAN use-after-free report should
+ * list the enqueue helper under "Last potentially related work
+ * creation:", which verifies that the flavor's enqueue path called
+ * kasan_record_aux_stack().  Check the kernel log for the report.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/rcupdate.h>
+#include <linux/slab.h>
+#include <linux/srcu.h>
+
+static void aux_test_cb(struct rcu_head *rhp)
+{
+	/* Empty: runs while the rcu_head is still live. */
+}
+
+#ifdef CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TREE
+static noinline void aux_test_call_rcu_tree(struct rcu_head *rhp,
+					    rcu_callback_t func)
+{
+	call_rcu(rhp, func);
+
+	/*
+	 * Prevent tail-call optimization so that this function remains
+	 * in the stack recorded by kasan_record_aux_stack().
+	 */
+	pr_info("Tree RCU: callback enqueued\n");
+}
+#endif
+
+#ifdef CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TINY
+static noinline void aux_test_call_rcu_tiny(struct rcu_head *rhp,
+					    rcu_callback_t func)
+{
+	call_rcu(rhp, func);
+	pr_info("Tiny RCU: callback enqueued\n");
+}
+#endif
+
+#if defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TREE) || \
+	defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TINY)
+DEFINE_STATIC_SRCU(test_srcu);
+static noinline void aux_test_call_srcu(struct rcu_head *rhp,
+					rcu_callback_t func)
+{
+	call_srcu(&test_srcu, rhp, func);
+	pr_info("SRCU: callback enqueued\n");
+}
+#endif
+
+#ifdef CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TASKS
+static noinline void aux_test_call_rcu_tasks(struct rcu_head *rhp,
+					     rcu_callback_t func)
+{
+	call_rcu_tasks(rhp, func);
+	pr_info("RCU Tasks: callback enqueued\n");
+}
+#endif
+
+static int __init aux_test_init(void)
+{
+	struct rcu_head *rhp = kmalloc(sizeof(*rhp), GFP_KERNEL);
+
+	if (!rhp)
+		return -ENOMEM;
+
+#if defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TREE)
+	aux_test_call_rcu_tree(rhp, aux_test_cb);
+	rcu_barrier();
+#elif defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TINY)
+	aux_test_call_rcu_tiny(rhp, aux_test_cb);
+	rcu_barrier();
+#elif defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TREE) || \
+	defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_SRCU_TINY)
+	aux_test_call_srcu(rhp, aux_test_cb);
+	srcu_barrier(&test_srcu);
+#elif defined(CONFIG_RCU_KASAN_AUX_TEST_FLAVOR_TASKS)
+	aux_test_call_rcu_tasks(rhp, aux_test_cb);
+	rcu_barrier_tasks();
+#else
+#error "No RCU flavor selected for KASAN aux-stack test"
+#endif
+
+	kfree(rhp);
+
+	/* Immediate read of the freed memory to trigger the report. */
+	(void)READ_ONCE(*(u8 *)rhp);
+
+	pr_info("done, see kernel log for the KASAN report\n");
+	return 0;
+}
+
+module_init(aux_test_init);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kunwu Chan <kunwu.chan@gmail.com>");
+MODULE_DESCRIPTION("KASAN aux-stack verification for RCU callbacks");
-- 
2.43.0

