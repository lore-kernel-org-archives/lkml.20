Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171335C6BD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970439; cv=none; b=KmAxxz6jT8GFu3iurMh+21xMrsbsiIpGF2xf53pBwx8OTE6FmVjCpdaYpzXQHMFkhKRpH/dkWKpXj9/wSZ5omwtpPubBH+8wdLoefRXekAMj8Kxvbo2kQWGNEuxWah0tzd3uXgeG6v2QW1rdOK/jys5Xmib1q7TlCcv/2RZ3KRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970439; c=relaxed/simple;
	bh=8fGm4QsbqboQ4X+kQYJy2qxs1YmyCSH63xzjYCEY+NY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SIXMRVKusn6IsJxjsLxnkJVhTTwxS3IaUNr9S4UUPAGAiJI5m7wY3shKVzyb0f8NWtY+4nXNrATBpTsvUjyf8EuDkxeawFMHnS58N2+XA+/jpujrHCdUA282yZ+HW19W3DQd2uBYxujR6XdweVbXNia+2KHPrT77cDfqKfy0vtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXxLJL+L; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXxLJL+L"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so12263935e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970432; x=1790575232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSUm2BvGMfGtlmppCZN9JChh915ltc85tdW86S+ilyw=;
        b=UXxLJL+LJLLJzqH+pE+9tYH0gVaJfrrVVoVim2IOCAR0XnGWBjXKGU7Nn+UsRf/PcG
         zHkcNBWWWpCb3AufARbbtOwiQ1cDME6bayGZa3S9ndrn9QzuuDJ5inrhWJQgBYynK0q6
         SqeTI6ghEXD6TAiehE1Hd7DXxlI0cY4p7vhR0rM9zGZpak8L1DXJHyNXadpYVn3XBcG8
         VKo4Pt4WbL0yD5bGsfX1sD4ZkP1gcBcELIAupPYA28x030Hm9/NqzvhG6VeKlELBmGj6
         67WGZZnl5buNgqXg38Tkk+U1BdXuaSiUdvD5GIQEJdKSCZ8qAWLE1WRaeUrQkwpJG43i
         e6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970432; x=1790575232;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSUm2BvGMfGtlmppCZN9JChh915ltc85tdW86S+ilyw=;
        b=rASgmWjZ1UaBBRmISjR+MbZDxlcdIYM0yeGXX9/nPPAke5yk1Cd0npMxpNfuZb0gn6
         TDItZDNMtFfw+X0j6NswkR2Xn66xUKISEeXymarW8eNrocBVsPwe8yKJnQFquSE/wNbQ
         Ixa5BIbwM60I2j7G9O43V8hektxy4zbIZOH2ehsG/yMoGeGypP1J9b/Bdaaa2hwkeB/9
         G5kjaHrx4Go9CblIKnr1p+8QzCOs4BsA8kpqfNnUYpOWWtuqTgY9moVGxXQDr8YeAU6R
         dqLh6hJV78bnAV6wNTwoJbNnFiufSPoRoI5D//UhCYkI3Ner7GdIcA2zb/THsbai/vcN
         qxYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZJEtdx3GnEb/3lSZ+CcwWJNCSlPP1EmwZot9d0xjcDYr3eW1AEKCZi1egzIehMvbuM2eR3M33u0bnk3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k12yLCBi1SaYIr6QB2PyZvJi3KIpyPKq7fZcTIkbCjey8Zg/3B
	qChjgyQ5aKx07sBgrz/ENZ5G1mQtRU/QsSJK8s/iggk0hc2SRBiJM160
X-Gm-Gg: AYBFou2yDls3k18ymiKxf8TRCvnlgwn994EtQizDMO0lo/xnpGVWhCD5s3F/kMPMRAD
	BSvcNRkLo/RU7RIJ+Myl0qf22lN4ePLqqJc07Sn7Va2aCsLnbB0k49wm4OeMAGSlqkcCZO+TqNF
	4It9HRzZE38sAsu0Ar6R2Z5UA2L3J9FIU0ZerM8Mx8hOYu5XEIHiNQz07mIagyvM8QzT7AjMthy
	HFwlcmaYeAZB3chybpZLLV27J+kJOxkMJFj2zzGDaD1ETYh1Wv7HT7huge7I3AK2jaT50r8ElpG
	LmvkfbrzDrLar12sso1qAEFTUiCuruOMG9wlHs7Rq0ga2+FbkcIdXlWS+T6Cnd/WdYIwtSK25SU
	kyz9H9fTdergfR2GYDJYEtSYJc2s9iY0fsKq0tbKIdgvNT+Ld4kBdkxHZJO4Pi7am2PFIbDnt2N
	jOvrE3FgEShF2dJ1Gm8GhF/GwNISPjtoGbfPiks04Y+WKJK3bsYnVURpT0YZF59e0IOifz2KcJO
	bzbyUHL/P2t9NqVangtBsPel1D2i61K26sQNynPjbpXN1UwCqluPKDE6gKYhmmuIK48GqtQdz0Y
	fYYo1GT1xmK8+lToiYoryawGYcNUdlsiznI8ymmc7Dt1l0k2VQm5O3C3HJAyVjKLXVXmRgPn/sE
	Zsw==
X-Received: by 2002:a05:600c:19cb:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49fc57410f2mr132387185e9.22.1789970428604;
        Sun, 20 Sep 2026 23:00:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: topology: allocate the cacheinfo early on the boot CPU
Date: Mon, 21 Sep 2026 08:00:13 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-4@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM secondary CPUs allocate cacheinfo in detect_cache_attributes(),
called from secondary_start_kernel() with interrupts disabled. With
PREEMPT_RT, the allocation takes a sleeping lock and triggers
"BUG: sleeping function called from invalid context".

Call fetch_cache_info() for each possible CPU from init_cpu_topology()
on the boot CPU, following commit 5944ce092b97 ("arch_topology: Build
cacheinfo from primary CPU"). This supplies the arrays before secondary
CPUs populate them. Suppress -ENOENT and -EOPNOTSUPP, which leave cache
detection to the existing late path.

The CLIDR fallback uses the boot CPU's cache geometry. A secondary CPU
with more cache leaves can still require late reallocation and trigger
the warning.

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-5-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

Full warning on QEMU virt, cortex-a15, 7.3-rc2, PREEMPT_RT:

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/1
  Call trace:
   rt_spin_lock from ___slab_alloc+0x68/0x728
   ...
   __kmalloc_noprof from detect_cache_attributes+0xe4/0x734
   detect_cache_attributes from update_siblings_masks+0x10/0x174
   update_siblings_masks from secondary_start_kernel+0xec/0x120

PREEMPT_RT became selectable on ARM in 7.1 with commit c6e61c06d606
("ARM: 9463/1: Allow to enable RT"). The PREEMPT_RT patch queues carry
that change for 6.18 and later, so 6.18.y is affected as well.

QEMU virt, cortex-a15, PREEMPT_RT, 2 and 4 CPUs: the warning is gone,
the cacheinfo sysfs tree is identical before and after, CPU 1 survives
an offline/online cycle. Same on a non-RT build.

QEMU realview-eb-mpcore, ARM11 MPCore, 4 CPUs, ARMv6 plus ARMv7 SMP
kernel with PREEMPT_RT: fetch_cache_info() returns -EOPNOTSUPP through
the CTR format check, no message, no cacheinfo before or after, CPU
hotplug works, kernel messages otherwise identical.

Raspberry Pi 400, four Cortex-A72 CPUs, 32-bit PREEMPT_RT 7.2.6-rc1,
full series: the boot warning is absent and all 12 cache sysfs entries
match the unpatched baseline and earlier topology-only run. The live
DT describes the shared L2, exercising DT-based early allocation.
CPU hotplug is unavailable on this platform.

 arch/arm/kernel/topology.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 2336ee2aa44a..e6b50cd43ce5 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/arch_topology.h>
+#include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
@@ -238,8 +239,20 @@ void store_cpu_topology(unsigned int cpuid)
  */
 void __init init_cpu_topology(void)
 {
+	int cpu, ret;
+
 	reset_cpu_topology();
 	smp_wmb();
 
 	parse_dt_topology();
+
+	for_each_possible_cpu(cpu) {
+		ret = fetch_cache_info(cpu);
+		if (!ret)
+			continue;
+		/* CPUs without a usable CLIDR return -EOPNOTSUPP. */
+		if (ret != -ENOENT && ret != -EOPNOTSUPP)
+			pr_err("Early cacheinfo failed, ret = %d\n", ret);
+		return;
+	}
 }
