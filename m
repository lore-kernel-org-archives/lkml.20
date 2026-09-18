Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB5418A55
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724828; cv=none; b=rmPeKdqzpc13/qWZdf6Iuc0G/kLbo8gf8z9v1W4VYzV0c00P6mrzsX8JEn+q9YOHMg7P293xhx4AQSYOnEcF2yuA8aE6sqD2oM3Sg/BuSO9BnKtFqgHuiYhKmN26O5Yu71ncYG8iRnSTlqBY5MZK61154rLCTDCebh8JGV4S9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724828; c=relaxed/simple;
	bh=dBMuu4lv9KGOmKH9lQZeyokcLqGMiBSJjCoamWxFGqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CgrESCTUcfuPd/ZnpaDC/h27dTLZP3wwoXeiF0pEvK8TseAM8AQTe01k+JIzSEM/muUQk2NLXLVk3M/cfete1xHUoAf1X1eeondy8LZqo/SnsfVohVsx1oJ2p/oLUH7X7NHSOtBi5CachX47jfYt2YAxoihhQLBvuQ3X3YKHvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILPTnDDZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILPTnDDZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3906325e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789724825; x=1790329625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVl7uqBilEpabcfZZkc7pg1MsdjTOvZRzrklboh2FZc=;
        b=ILPTnDDZKaXk4FCeQm7BWl02eb/b1DYg8Xe3TZK7uMh+FEsulu2rBhwQ3LNtdcrIvR
         XiJfd+zV3HqC8GfJQEtkVObVew8G9VZEH5WG7qTLYmr5EhHpP9KJVEh0sKbFZrK0RnKd
         4PPf6OsWqDHDs7bp+CRk51wD2b6SXsH5qp0F5rF2zDWug2RMxcc996+FAQ8Uzc51sfxL
         wcH363uqQ8QR8/zgEpeb6SYU5GYI+8zobzBoY72x7sb2D0KbZMSii4V6BMwt0mq9ox9Y
         w5bubbjhvPSw/lbYBjo+kzAxoOTbKRUHzO/Zra1+BjNJ+fn19Z/JbVqr5A8mT3H6Dt5U
         tAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724825; x=1790329625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVl7uqBilEpabcfZZkc7pg1MsdjTOvZRzrklboh2FZc=;
        b=QRqPfCrnVQkVeCg1rOT/LAP6ux3uyewyD6RFHJ+hi/miSk9u4z8xbLqRlEhyUJppYJ
         0u9gUInjXxqPVIoEL7kdJwzIWjAGJkDhSfSd9kDqWE1Aw6E/aS1DoXeY6TiDCwDvZJ5I
         na0BhY3nwOy4RbRMFBj5vpESFCJinci/dYLs1rd8IhODbgRL5JkukXkdeIsPA7SS0zsI
         oRmvtakrJC5vrIGYlbwmWRFkM0sshaVaG19S6qYES27+TMgsvUYPw2oEegbppDQJ98Ku
         rq2J4hYf4trB5O749xAMjRaJwkweYc6rwbbGPrfuM3BBB+b9J9bmANkyF4QVA1x9HRPF
         K//w==
X-Forwarded-Encrypted: i=1; AKwUvBxMddIKaryhgIa0gH7KczdnhPs+GMc9YqeY7KtGbpH6Q4fSBRZgvbJ6OBfXnmF1wEnB6T+6lT3EsFLfS5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kwtoTCX42vDWZnp58izRzCY46t1e7ASf8gCvWNq7mJ6LRRd/x6
	fRpRIpvnZhpyD93//NjQOx12Fhs2zrRBVUG9bJkF963GjEBnNBLkmVw=
X-Gm-Gg: AYBFou1EcICq9+4a0AEpaM17LeZVqB/KERtoP7uJE2zh7HpHAw0vjtqD3sftYrdOie6
	bkhghyPnWDC0mq1Xyl5oR/ypbsTdvoZkHGxuZIs0vciqhpjbM7BWkVFZXiBTX52yc+u3cSYd2p1
	z4q7fF6QusvW4mofa+qgyPZPX287Yk2lSLRI8EYdZdDz6lwhG3BmCDgDxjLGpQIrXo/WAU25eoZ
	eFn20Uo7MB5FD86e0J6+MeUx4ocg4UzC8VijfCC1l9vbRhOwZmg0aPF3bwrYLf9Eiv/tOqU43ja
	kfnctNmGME5WDQOdfuhB33p1WgBjAaTuliRwDD0CWBl2epvmN8+D+8XUIhmUGg9Wlg/s4/7tYeT
	1GoMmwGtzFhJI2D+rvflKG7D4n3sK4tLWipMc42v5qX7SO+XrUImAMeVEpbIQ1SkvP/09QFslqD
	pzcPCYDbPd4g9N51N2vQE/63bq1Rt7SgdtS8fLMaMjujZwlg2WMqHyTKwri/UgAzR+JYVyN6HFL
	MB+oae//Ui+dxo4pv91PYPQ9r7ePhaY40r9ISNbZNCsVqYS5DI80sHxO4ccX1AbhFRlff9K/fEK
	1owFRO8=
X-Received: by 2002:a05:600c:4e14:b0:49f:bd3c:bc19 with SMTP id 5b1f17b1804b1-49fc572eff5mr23057365e9.20.1789724824379;
        Fri, 18 Sep 2026 02:47:04 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm3054971f8f.34.2026.09.18.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:47:03 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
Subject: [PATCH 1/1] mm/page_alloc: enforce upper bound on min_free_kbytes sysctl write
Date: Fri, 18 Sep 2026 11:45:51 +0200
Message-ID: <3c1598eaff225a155cdec5e92d5c97fbfc6c00fd.1789724312.git.med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a kernel panic ("System is deadlocked on memory")
after writing a large value (e.g. 3145728, 3GB) to
/proc/sys/vm/min_free_kbytes.

calculate_min_free_kbytes() already caps the auto-tuned default at
256MB, with a comment noting larger values don't make sense even on
big machines. But that cap only applies to the computed default --
min_free_kbytes_sysctl_handler() lets a user write any value, since
it only sets extra1 = SYSCTL_ZERO, with no extra2.

An unbounded min_free_kbytes drives watermarks past what the system
can provide, so every allocation triggers reclaim/OOM with no way to
make progress, and out_of_memory() eventually panics.

Fix this by applying the same 256MB cap to the sysctl write path.

Tested on top of upstream master (5dd1818b15d9):
  - Before: syzbot's reproducer reliably panics the kernel.
  - After: writing 3145728 fails with -EINVAL, normal values
    (e.g. 200000) still work, and the reproducer no longer panics
    the kernel across repeated runs.

Note: this covers the reported case (a value far above any real
machine's RAM). It doesn't prevent a smaller value that's still a
large fraction of a very small system's memory from causing the
same problem via lowmem_pages in __setup_per_zone_wmarks(). Open to
a follow-up there if maintainers think it's worth it.

Reported-by: syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c61d6962d0b7e698439e
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 mm/page_alloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..8cb62879bf41 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6933,6 +6933,9 @@ static int percpu_pagelist_high_fraction_sysctl_handler(const struct ctl_table *
 	return ret;
 }
 
+/* Cap sysctl writes to the same bound calculate_min_free_kbytes() uses. */
+static const int max_user_min_free_kbytes = 262144;
+
 static const struct ctl_table page_alloc_sysctl_table[] = {
 	{
 		.procname	= "min_free_kbytes",
@@ -6941,6 +6944,7 @@ static const struct ctl_table page_alloc_sysctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= min_free_kbytes_sysctl_handler,
 		.extra1		= SYSCTL_ZERO,
+		.extra2		= (void *)&max_user_min_free_kbytes,
 	},
 	{
 		.procname	= "watermark_boost_factor",
-- 
2.53.0

