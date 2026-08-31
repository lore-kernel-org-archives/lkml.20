Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31581A3160
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181401; cv=none; b=lA7G6soUdghQO/T5M8tkwJ2LlzrTHtDZLytdW06On7PVZEnJHjCxRazJtV6CCVk6ddvetBueawv3S5jUtqRPbtejFfYkNXi+wPeYcFsOZzhUYoP6PXIyMdLnd3Tx/regUpkNn1g/K3oFAVCrkGS9J1mLudfzvyFw3tCQ3DOalCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181401; c=relaxed/simple;
	bh=M2zd/PE4n8W3jz9SbJdGinJ3KZitAPOD3X0myiFjXEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fA+3Z9MzUwudUmLMr+6GwMGk07FhDIFAJnmogMuPL5UCVTuDHRoditEmenTyJEiRcMn6/inCsPhF4uzh5RvVATvYoH2QztE3X8X40kJXrMlKYgYNu31ks/k94w9XyGNWwzqT7rcFR0me5dabYMM14AzZNuR/HbSYdjhCx+NfsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9v49FFm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9v49FFm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27905465e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181398; x=1788786198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxE1bcDNUrY2o7v6e0PV/peTaEiNN2c2sEFM7UzGp/E=;
        b=f9v49FFm5I8aUOc5ue1MN6ZzrJVbEYGgkrMsEJYOAJ9xtvb5Yg/vbIPLEsuILE2VIg
         +Pb1HDmiu1Lv1QqXglmBUo19e+4idfsUXyZWzQUUj93mZ7Q8LswpqKvGyswVWlVuLkZd
         PFoc7oGhiRKwPQJSupRUlAeBzFviD9BggePwjM6MW/FPVYeOwgcrRa8cB9kYODQAWz0K
         VmB8ypaGdAMDGy0P+4HuHVY03xb5o2ItqQrBR3M/YmXqCxse1eS6bhWglqyGwYP7X5fm
         4C1XwXyfL5pdEyipTrA/RtfA6KZssOa9lqK3/dGn+9rwT1kwlY5YwsS1dH2hZuvSrqTo
         9Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181398; x=1788786198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxE1bcDNUrY2o7v6e0PV/peTaEiNN2c2sEFM7UzGp/E=;
        b=diN3nDHQXVls/iXkqGiKeeV7IAyHcp4Ciu5lNij9GSD0IZvtyeiGB1GNLTfWiv0oo+
         4NpspvWC/MRz7LCgKS1PNn0dvO+CX0pQ1oG1dX6TG6+8q9zBTVo/2SWQN8b9ASyv6Ju+
         d2tDWnKoHEnqs73gd180NX28v1G31rDjuLzZz4m4NMestGNn6SM/f7wvb+CRvN5mFi5V
         f1UShpQnMz+hT4nattR/9/o1HJaH/4PXLFdagoYtcCfdYjBaxkOxXMBAGEnT34lwTtW5
         5lMKPF5T702Jb8okU8G0JOmXyT2eBv77WGqhOFRA8PKF+PvAwfTD1g31HaiEUbJAQ0WQ
         lZcg==
X-Forwarded-Encrypted: i=1; AHgh+RpjbUsnIel1hRb+WeOlRkqxHWBBSWammsmFU7wyLjfmz9drRr9JCsE4aOE56K4YKnjIU0sTBDZZiiToyJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kb4I/+wPou9bbAXUXhrdd+0h1XIlrkcd2TzPr4dASix9zwi1hB
	6svnXi5OgFfne1vYCaYe9jDFdbuBdZICP4qKAscAw8WL4MYoYFYD4bEP
X-Gm-Gg: AR+sD13FoYjkPcLSHO661UnAsGuDkuJ2itKAn1tRCW3qtz3RWqkxZS4Wpe4z5ntnLcd
	uUyzcqLrsu+lc1UHMWrrOrkKHJ/TKkm2tPatUz4Tv78rbKU43v2WT4SM/DjKl+KOY3k0V3U3px0
	BQyJpbxXYLDD69yX0mxgUZWOw6bxOVzJKTY+Mb1ei2o3GYrlxTYr26VfXMocSgV3MVoNhRN0N78
	4os4qAaSIjdyTQqnhw1w9EOaQXXp73wrnzf4X9OgGkVmpsBbH43o4jUOyjzZFs+XLcaoei5e+rc
	PLAUYovhHPNfVDKbpwUlNZuKv4lrgSS9h8OwZD2RuGKi6AXlMK+Gt929+FaoqEa8DyyySJWAeOL
	9yXMUy7qxthMZL4quXebZS3XSXhqCM8PjMMpdl6CPgDNlY1Gne5H/6nWZaOpTdOkwX14WswdqlS
	wCWscIAhfnVHMwnFvamR5BMNlbH1tzmAwyx3x1fmSsXcUA3syTlbepSH/WPoDIMEl9pm8jk6nqC
	bvDEZzPJxHR5xJI
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr129895425e9.8.1788181398028;
        Mon, 31 Aug 2026 06:03:18 -0700 (PDT)
Received: from Minno ([193.192.121.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdb13f094sm31831445e9.3.2026.08.31.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:03:17 -0700 (PDT)
From: Taha Sezer <tahasezer.is@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Taha Sezer <tahasezer.is@gmail.com>
Subject: [PATCH] mm: vmpressure: scale window size based on machine memory
Date: Mon, 31 Aug 2026 16:03:16 +0300
Message-ID: <20260831130316.448-1-tahasezer.is@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vmpressure window size is currently a compile-time constant of
512 pages (2 MB with 4 KB pages), regardless of the machine size.
On large machines with hundreds of gigabytes of RAM, this small window
leads to excessive false-positive pressure notifications due to the
higher absolute reclaim activity.  Conversely, the fixed size is
already appropriate for small machines.

Scale the window size logarithmically with total memory at boot time,
following the same approach used by calculate_normal_threshold() in
mm/vmstat.c.  Total memory is converted to 128 MB units and fls() is
used for cheap logarithmic scaling.  The multiplier is clamped between
4 and 64, yielding a window range of 128 pages (512 KB) to 2048 pages
(8 MB).

This resolves the TODO that has been in the code since the original
vmpressure implementation.

Signed-off-by: Taha Sezer <tahasezer.is@gmail.com>
---
 include/linux/vmpressure.h |  2 +-
 mm/vmpressure.c            | 60 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/include/linux/vmpressure.h b/include/linux/vmpressure.h
index b4d13457b..09111f5bd 100644
--- a/include/linux/vmpressure.h
+++ b/include/linux/vmpressure.h
@@ -51,7 +51,7 @@ extern struct vmpressure *memcg_to_vmpressure(struct mem_cgroup *memcg);
 extern struct mem_cgroup *vmpressure_to_memcg(struct vmpressure *vmpr);
 
 /* Shared with the v1 vmpressure block in mm/memcontrol-v1.c. */
-extern const unsigned long vmpressure_win;
+extern unsigned long vmpressure_win;
 extern enum vmpressure_levels vmpressure_calc_level(unsigned long scanned,
 						    unsigned long reclaimed);
 
diff --git a/mm/vmpressure.c b/mm/vmpressure.c
index 9629240d7..f88bafb71 100644
--- a/mm/vmpressure.c
+++ b/mm/vmpressure.c
@@ -13,6 +13,7 @@
  * (tree=false) socket-pressure path that runs on cgroup v2.
  */
 
+#include <linux/bitops.h>
 #include <linux/cgroup.h>
 #include <linux/log2.h>
 #include <linux/mm.h>
@@ -31,10 +32,63 @@
  * As the vmscan reclaimer logic works with chunks which are multiple of
  * SWAP_CLUSTER_MAX, it makes sense to use it for the window size as well.
  *
- * TODO: Make the window size depend on machine size, as we do for vmstat
- * thresholds. Currently we set it to 512 pages (2MB for 4KB pages).
+ * The window size scales logarithmically with total memory, following the
+ * same approach as calculate_normal_threshold() in mm/vmstat.c.  On small
+ * machines the window stays small for responsiveness; on large machines it
+ * grows to reduce false positives from the higher absolute reclaim activity.
+ *
+ * Sample window sizes (SWAP_CLUSTER_MAX = 32, PAGE_SIZE = 4K):
+ *
+ *   RAM          fls(mem)   multiplier   window (pages)   window (bytes)
+ *   -----------------------------------------------------------------
+ *   <= 4 GB      0-4        4            128              512 KB
+ *   8 GB         6          6            192              768 KB
+ *   16 GB        7          7            224              896 KB
+ *   32 GB        8          8            256              1 MB
+ *   64 GB        9          9            288              1.1 MB
+ *   128 GB       10         10           320              1.3 MB
+ *   256 GB       11         11           352              1.4 MB
+ *   512 GB       12         12           384              1.5 MB
+ *   1 TB         13         13           416              1.6 MB
  */
-const unsigned long vmpressure_win = SWAP_CLUSTER_MAX * 16;
+unsigned long __read_mostly vmpressure_win = SWAP_CLUSTER_MAX * 16;
+
+/*
+ * Initialize vmpressure window size based on machine memory.
+ *
+ * Use fls() for cheap logarithmic scaling, following the same approach
+ * as calculate_normal_threshold() in mm/vmstat.c.  Memory is measured
+ * in 128 MB units so that the window starts growing once total RAM
+ * exceeds a few GB.
+ */
+static int __init vmpressure_win_init(void)
+{
+	unsigned long mem;
+	int multiplier;
+
+	/*
+	 * Convert total pages to 128 MB units, matching the vmstat
+	 * convention: mem = totalram >> (27 - PAGE_SHIFT).
+	 */
+	mem = totalram_pages() >> (27 - PAGE_SHIFT);
+
+	/*
+	 * fls(0) == 0, so for machines with < 128 MB the multiplier
+	 * is clamped to 4, preserving the original 128-page minimum
+	 * (SWAP_CLUSTER_MAX * 4).  The maximum multiplier is clamped
+	 * to 64, yielding a 2048-page (8 MB) ceiling which prevents
+	 * excessively delayed notifications on very large machines.
+	 */
+	multiplier = clamp(fls(mem), 4, 64);
+
+	vmpressure_win = SWAP_CLUSTER_MAX * (unsigned long)multiplier;
+
+	pr_info("vmpressure: window size set to %lu pages (%lu KB)\n",
+		vmpressure_win, vmpressure_win << (PAGE_SHIFT - 10));
+
+	return 0;
+}
+core_initcall(vmpressure_win_init);
 
 /*
  * These thresholds are used when we account memory pressure through
-- 
2.53.0

