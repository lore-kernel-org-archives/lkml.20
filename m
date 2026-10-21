Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562654;
	b=Vc+uRlZHuM8KgGu1Eib9ZhCaVb+P7w9QhdAU+B9FMlLvNT9FugzvKbW+XRIkfXFOAzKS
	 MfM1u7OsABKTYg13/iuhuB8K/L77HqZq19AxrInezTCyL7saIgkg7dkq9u97R7XzRRzsS
	 vWFouijEO3FaBMB7jEB8FdUn4HElSx46wEXRHhqG8x6Yfv4MOQj/4qeje9EC4K1XJ2JD9
	 2yR/1yHieRcUlTXEbg5abC7/Efu+KI0DoUYqq7Ft+HXZFD519SvUwByEBSZbDB0/JNM0N
	 JJRV5RsaY9XWnXODAwutubcWZNQZ/ll+hpCz+S43oVn61oaxyU5bHgqt295vJLyiWqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562654;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=oGKqEv0ixXkyOO6lajmPfxhtIrLM+4aywa7ZFjLqxMo=;
	b=PtJGURK2CbDb1U5O9csYfKkIXCRlIxnmRKHLJlrCj+UzDWgy/ZHzdb7cQzQUNfkJCmLr
	 d697EyvT5T20NjNizMuB7FWv1iFKL2apmBGfltN9F7Lj814sgSt1y1SRx8K/ni5DiLDna
	 QQh3iio9/7G5D5V7PrXiEACWh2ltCr4Zp29tXGNdTradaKdkdvM0ahoelfgGRj1gJXSsD
	 JwRHs9OnATVzdmBPmaWUHWBDOPMYf6gCkt4TUoh5WEB6Ru7HlG8I9nxp34RBbRPQKnGfT
	 fC84We+FijF4g4fqbaZinM8yh/CVpoTO/jlrQIbFfNJNZz4esvOyjoL8LUu1xzoNAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GHLZfPTA;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA0606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBA0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GHLZfPTA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oG
	KqEv0ixXkyOO6lajmPfxhtIrLM+4aywa7ZFjLqxMo=; b=GHLZfPTAqKyiBuXaP6
	sNhEmaWNi5xzkYbiKIWXiOMyFsgiW0STOgiqnlPyHqXvqpkc6IyxN0xt4Fvxq0d9
	J0dasEg5X5pnQs80qbqShQcGsH/f3VCPYYZfWfnIXAwyR/yY1WTdjVEWwUAWt2NK
	E5iiLFQOpt+3DVxPOF1rWeuUo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P1HIVdhqX_gZBw--.38977S2;
	Wed, 21 Oct 2026 14:03:53 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Yury Norov <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] cpumask: Fall back to online CPUs when NUMA lookup fails
Date: Wed, 21 Oct 2026 15:03:52 +0900
Message-ID: <20261021060352.1351469-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:_____wD3P1HIVdhqX_gZBw--.38977S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWUWF4UCFWkKryDWw43trb_yoW8GFW8pF
	W2g3yUKrWkK3Zayw1kJayfGryrua97Grs7Z34DCrs8JFsrGw48GFWqyr17Xr93Jrs7u340
	yFZ8Jw4jgw10vFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pinXo5UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QlYt2rYVckUJwAA3S

cpumask_local_spread() wraps the requested index by the number of
online CPUs, but sched_numa_find_nth_cpu() can return nr_cpu_ids
when NUMA ordering masks are unavailable.

This can happen after a sched_init_numa() allocation failure or
while the NUMA topology is being rebuilt.

Since b1beed72b8b75, cpumask_local_spread() warns about the
invalid result but still returns it to callers expecting a
valid CPU number.

When the NUMA lookup fails, warn once and fall back to the
corresponding entry in cpu_online_mask. This preserves a valid
CPU result when the online mask is stable, at the expense of
NUMA ordering while the topology information is unavailable.

Fixes: b1beed72b8b75 ("lib/cpumask: reorganize cpumask_local_spread() logic")
Signed-off-by: Hui Su <sh_def@163.com>
---
 lib/cpumask.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/cpumask.c b/lib/cpumask.c
index 5adb9874fbd0f..f09632219b267 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -114,7 +114,9 @@ unsigned int cpumask_local_spread(unsigned int i, int node)
 
 	cpu = sched_numa_find_nth_cpu(cpu_online_mask, i, node);
 
-	WARN_ON(cpu >= nr_cpu_ids);
+	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+		cpu = cpumask_nth(i, cpu_online_mask);
+
 	return cpu;
 }
 EXPORT_SYMBOL(cpumask_local_spread);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.55.0

