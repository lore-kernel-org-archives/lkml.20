Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B337392814
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242971; cv=none; b=m9qw8RQz7BnPwfs8xmMsomDK3WDCIOIA1KxP+2RcTISpIqjv6HGzzWXTG/US2Fkxe3XCj+XfFGZcSfNHJiMjZE7k7mjXNAQo0YlGRDR/BSawrYYVVzJ4z7xkGUpUVoFZHdOlx/ipO9bSdbOf2Y71yf0tznaotW1uUe7j7ZG8AbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242971; c=relaxed/simple;
	bh=rN3M/EIKOAXQYOqvo5H5srYi0ltpPT+F1jN5KbTizKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p+C66EmozTns8f1r3PP3fczJ5kMUL79zG/ZP5NyXeF8hB3UhCwVnFciepsSTzwOMxOa5co7/B+NM6M/1A1h2HdgohaoktzUYgJwDDSy1WozCXrG4z5ZehQOAdRXXahr9NrgQrnXIvh1HuVaLlW4TG/C11AlyE0Cxz/xFLiFIq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4uTv9Sp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4uTv9Sp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso25223735e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242964; x=1789847764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SudqM4dinshG/ga4dKzazwfwaSNRtgAeUisYk5patHw=;
        b=d4uTv9Sp2tahE1qfecaY3kM4f9nFZ4PrLqJzaE8mcfB+JzeiSTzvdAQLCN13FlMveZ
         6v9RAP6etEWzjbawTU8m9/B6K62h16+UMAX0yru1ElZtQGfkJLOhgV5RgpNWxi3HilZD
         dq/tcZGRrcMT0SMw2piauini08RSexDolEP6JEWztAZw7adsYhjQ+plohSl1uminPd5H
         FKwAHljBEz65apY5n+Oaj8iFmDxosrYjeRUYbg1wgu3LvGUTcqBT9Pf8RrLMXKZb53y2
         HvnO+wadvhdXMruHEWrrVuxPVvGrEHv4OZeQ9ncfpzyjtJOzl7Wb1jdah8eJ2AtVZMHw
         JovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242964; x=1789847764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SudqM4dinshG/ga4dKzazwfwaSNRtgAeUisYk5patHw=;
        b=IBescRBOntCermHFPlf6As1vgLEzuPNP9JtzW17Sivm/ALPiiuOCvWmUNykSCGf4mg
         WeWy0mx0O7qAcJpFVEXLXHPb4gTKPsmzJ0Ba6DbNIbOvef7GqtdMWf7HPGfRt+ebYAfs
         u+98HN/GXdWqbRXBwMzo/muBQW9wyE71BnMCItLI0kdqrNLavWWvyjRLjOXP46NOxwRg
         2c7U7+yewMWyTeYt2w62yP5yyWnJDLyAxDSjmNZG1zHpsUIiccCE5CJWzGWrK1Gcc+wI
         NHNTGD4JuH6io55xFsTxgCk9ngMnXKkyTSoAonrM7Tf1GS+yuXgvnNPmfraIOELfOzaz
         0SIg==
X-Forwarded-Encrypted: i=1; AKwUvBxlJGN3EvjgjNIrodAfFklw2RSRsLE+YdB2NwxnvZv4ah9ssbzKTd5Go8bKALyAH0ou4zfKQ+oqY3hjeGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l99zrndguYtPaSRkhVG/5AIlfH2lR/gAmvOS/gLbvwN7RcKV+f
	xw2Cg/i8aiME9hTuaanrQ5zx7IEsHGp3eC9nFEP+7RT/iTDTtbmDppGW
X-Gm-Gg: AYBFou273V0dtUfQOCEDuhKObHlEzqEMlFmqMccwEzBI2SttIc1vq7gJkPjyA6QStW/
	Z4BMNKOi8KFgtkC1HINYl2XguFA3Jxajfb7wEuzovjl105NtCWtjVuHGrjWimBTC2ee4o3RVqCQ
	yiMenUeDuU3dpg5xHR8s7VsNOI7hdJOC42WSapAmHYXjLIJ9X7aaqlUhp4x8ZBKv4cyuULy/OJ7
	rwyzvNji8No02UcdZzzrW//ySwk3r87tYVEI4juih689jdy8YlOvUfnZn7fTEDLp4OIWU83BYkA
	ALTQhGuc/FxWZdF/1NnKYsDSr5dWgzuFrhiKbF7yEK60suHKTfQByjXv+wRaPAJOB+h1P/HKQ0u
	ZBsQRn9w90OQCTrLSdr7oTSDJUjsjo6RnfMd5+wiZWkWPQ2tPZktURPZfN/95/b3G3T6p8bqVve
	a+yQJbOjyMBLjfBXZLQZ9jRtckRDIa9/crx9pABCLHyQpaaEbvUUIM1b7bnulURrFvnqSoQoGzW
	olTLq5LlyJmt5InTTv2hp49h+Vly5YSkDMXDPnINNcov4bpQQRwC8i0BvHOydWgyZDIAT8pMj8d
	T+mu/XOmc7HZYrbfC5ui0WI39anS59X7yBZF28FHTWwgVEJ/s6u4IhnL/a4c1x3DP32kxUzIqsU
	1p+0Fjev1
X-Received: by 2002:a05:600c:3115:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49e61989e79mr109783245e9.10.1789242963500;
        Sat, 12 Sep 2026 12:56:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.56.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:56:02 -0700 (PDT)
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
Subject: [PATCH 4/4] ARM: topology: allocate the cacheinfo early on the boot CPU
Date: Sat, 12 Sep 2026 21:55:52 +0200
Message-Id: <20260912195552.76673-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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
-- 
2.53.0

