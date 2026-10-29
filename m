Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259579;
	b=QP5rSITJ0Yv279GIzapvLoT4iywUB2/1oIoDlZ4aW6M7Q1xGkqEDdKf0+JWu3oWO5geq
	 KZ1SwyIkyGhIg02H913OpQ7SjpbzvxAwAseDOHUXi2RiRjv0yem9QooTFMqtANWGh1kQN
	 RzFTiJ5/XKxHMKUxP+mGwh2kgdUyfK1ki9NFU+3v4Er/jFNMzwnj0TTbwX6bCgXW0rGe/
	 TTjHFgYETzfdBGSO9xvdVgvP8En6gqfWQ8WbE05oMsEiCtLfCegwc380N8duX+YDPSs3w
	 CN95qWpwMtOe6LUtxyh2dCUufXJjhG5+qiaAs3aXLEQxVLoqaFWcL9HoYJprXnN5oqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259579;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n5pumEpaqseV4pK2VYvnulDZLIA/EeVMeq9GeDpz+8=;
	b=c8SkoTe0JB9kJFykVfIEyYS6KFfI4Z444tDAaaDDBbGw6iYcuZil7ukU+V+DTozegnkT
	 svRdGaIsXWaHTNdyC0uur8qmlqzMGgbhYdU6KOUTNzFoDIjg2VmzciIzUcBhAWRzutZbW
	 uUfJLvgr/+yk19x7/N31Iiamx3tHdSFaaFcl9FPOixpyetzHOYD12DybAiyJKMznlwYLu
	 tFySUpqilVgx3U2ft5S6RQd9Qld4/uMJ0q+MhU+C58ilGP0Iqxn9joVrRLMZxU7mZsHDE
	 T1JdmSfg4GUi0OXlyIVYPk7Z3J5wWGaYIzbI28wNcZqZRyjCybzi7GVLPQx/FWCVCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="AbvI1V/c";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF463606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF463606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AbvI1V/c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AbvI1V/cRf9hq4osX/4Q1RmojXayJ2L9UXTPAePheAa7w+xGE2AMTdVGIxKoxour+PGvCaqml8wx7
	 UWnCfR/rRXriScggbEmrc1pvrBIrGjvk16MfALIeez/CIFnri2BiME+OTbd+DDZES+gseBrpdUmd+V
	 W4jT2rzsgAeHFIlQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76ae2f830f11-68f50;
	Thu, 29 Oct 2026 15:39:30 +0800 (CST)
X-RM-TRANSID:2ee76ae2f830f11-68f50
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16ae2f82bd87-27dd5;
	Thu, 29 Oct 2026 15:39:30 +0800 (CST)
X-RM-TRANSID:2ee16ae2f82bd87-27dd5
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: akpm@linux-foundation.org
Cc: shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	muchun.song@linux.dev,
	harry@kernel.org,
	qi.zheng@linux.dev,
	tz2294@columbia.edu,
	bingfangguo@tencent.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] memcg: fix integer overflow in calculate_high_delay() bypassing memory.high throttle
Date: Thu, 29 Oct 2026 15:38:56 +0800
Message-ID: <20261029073857.974-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

calculate_high_delay() computes the throttling penalty as:

  penalty_jiffies = max_overage * max_overage * HZ;

where max_overage is a u64 derived from the usage/high ratio shifted
left by MEMCG_DELAY_PRECISION_SHIFT (20).  When a cgroup exceeds its
memory.high by a large factor (>= ~4096x), max_overage reaches 2^32
and the squared multiplication overflows u64, wrapping to a small or
zero value.  A zero penalty passes the 'penalty_jiffies <= HZ / 100'
early-exit in __mem_cgroup_handle_over_high(), so the cgroup is never
throttled despite being massively over limit.

This is exploitable for denial of service: set memory.high to a small
value (e.g. 1 MB) and allocate several gigabytes; the overflow causes
the throttling sleep to be skipped entirely.

Additionally, on 32-bit kernels the 'unsigned long penalty_jiffies'
intermediate truncates the u64 product before the right-shifts, which
can also zero the result.

Fix both issues by:

  1. Capping max_overage at (1 << 20) before squaring.  Any overage
     this large already produces a penalty far above
     MEMCG_MAX_HIGH_DELAY_JIFFIES, which the caller clamps anyway, so
     the cap is lossless.

  2. Using a u64 intermediate for penalty_jiffies so the right-shifts
     operate on the full 64-bit value on all architectures.

The post-fix worst-case intermediate is (1<<20)^2 * HZ = 2^40 * HZ,
which is ~2^50 for HZ=1000 and well within u64 range.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 mm/memcontrol.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..c0ab3940025c 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2576,7 +2576,7 @@ static u64 swap_find_max_overage(struct mem_cgroup *memcg)
 static unsigned long calculate_high_delay(unsigned int nr_pages,
 					  u64 max_overage)
 {
-	unsigned long penalty_jiffies;
+	u64 penalty_jiffies;
 
 	if (!max_overage)
 		return 0;
@@ -2588,7 +2588,16 @@ static unsigned long calculate_high_delay(unsigned int nr_pages,
 	 * memcg in question makes it clear that it has no intention of stopping
 	 * its crazy behaviour, so we exponentially increase the delay based on
 	 * overage amount.
+	 *
+	 * Cap max_overage before squaring to prevent integer overflow that
+	 * could otherwise wrap the penalty to zero and bypass throttling.
+	 * Use a u64 intermediate so the right-shifts are not truncated on
+	 * 32-bit kernels.  Any overage large enough to hit the cap already
+	 * produces a penalty well above MEMCG_MAX_HIGH_DELAY_JIFFIES, which
+	 * the caller enforces regardless, so capping is lossless.
 	 */
+	max_overage = min_t(u64, max_overage, 1ULL << 20);
+
 	penalty_jiffies = max_overage * max_overage * HZ;
 	penalty_jiffies >>= MEMCG_DELAY_PRECISION_SHIFT;
 	penalty_jiffies >>= MEMCG_DELAY_SCALING_SHIFT;
-- 
2.50.1.windows.1



