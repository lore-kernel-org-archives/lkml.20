Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC8232395
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987605; cv=none; b=SfxFQhSwyJWjlaDH6an/s1VCXyPGhqUNLUbXsoau/FXrDZLmaDosG+x5SROCzWtgDsXPr2WCKRtoLJYBR2X1j6H5dFskmjffghxK0zwOoihxOijFWaormkdm27+uZHY0qJewpnPB4r9cKjW3ZMQpm9HaDIzYAL1F4mydA3GcaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987605; c=relaxed/simple;
	bh=kAKFyD1HsoCuIvwuby5GTin+f0qwzBgVhxZrgCa/feI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=WYOPsawG+iwwE7Mwyx6wQ0n/Xrb12qfVL4ApnyUIVODQiLL4yddf7B+VldMLYhh1b5+H8mFrmqlyjy8Gbq03HnX45qMggQ5J2zgCIXYKY+8Ev1SnlDgJNWC9c9oQQZS7SxeZ82bLOxN7zFL3S7l2tTkpl39rVOR8w33PNDZpuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3df834e02bca565c;
	Sat, 03 Oct 2026 00:33:20 +0000
X-Mizu-Trace-ID: 3df834e02bca565c
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 14/14] mm, swap: let the command line set the xswap device size
Date: Sat,  3 Oct 2026 08:31:36 +0800
Message-ID: <20261003003136.750633-15-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

A new xswap device is always sized at twice RAM. Add xswap.max= to pick
the size of devices created after it:

  xswap.max=300%      three times RAM
  xswap.max=8G        eight GiB

Twice RAM is right for most users, but a machine with a lot of memory and
a small workingset gets a SwapTotal much larger than needed.

The size is resolved at device creation, not at parameter parsing: a
percentage is relative to RAM, and totalram_pages() is not ready that
early. A size that does not fit, or is too small to hold anything, is
refused, not clamped.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 86 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index ab040d24bd2f..bf95663c2593 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -164,6 +164,63 @@ static struct attribute *xswap_attrs[] = {
 	NULL,
 };
 
+/* Size of a new device, from xswap.max=.  A percentage unless bytes is set. */
+static unsigned int xswap_size_pct = 200;
+static unsigned long xswap_size_bytes;
+
+static int __init xswap_max_setup(char *str)
+{
+	unsigned int pct;
+	char *end;
+
+	end = strchr(str, '%');
+	if (end) {
+		if (end[1]) {
+			pr_err("xswap: bad xswap.max=%s\n", str);
+			return 1;
+		}
+		*end = '\0';	/* writable copy, see parse_args() */
+		if (kstrtouint(str, 0, &pct) || !pct) {
+			pr_err("xswap: bad xswap.max=%s%%\n", str);
+			return 1;
+		}
+		xswap_size_pct = pct;
+		xswap_size_bytes = 0;
+		return 1;
+	}
+
+	xswap_size_bytes = memparse(str, &end);
+	if (*end || xswap_size_bytes < PAGE_SIZE) {
+		pr_err("xswap: bad xswap.max=%s\n", str);
+		xswap_size_bytes = 0;
+		return 1;
+	}
+	xswap_size_pct = 0;
+	return 1;
+}
+__setup("xswap.max=", xswap_max_setup);
+
+/* The most a device can address, whatever xswap.max= asked for. */
+static unsigned long xswap_size_limit(void)
+{
+	unsigned long limit = swapfile_maximum_size;
+
+	/* A cluster index is an unsigned int. */
+	if (limit / SWAPFILE_CLUSTER > UINT_MAX)
+		limit = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
+
+	return limit;
+}
+
+static unsigned long xswap_size_pages(void)
+{
+	if (xswap_size_bytes)
+		return xswap_size_bytes >> PAGE_SHIFT;
+
+	return div_u64((unsigned long long)totalram_pages() * xswap_size_pct,
+		       100);
+}
+
 static const struct attribute_group xswap_attr_group = {
 	.attrs = xswap_attrs,
 };
@@ -4601,7 +4658,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 static int xswap_create(int prio)
 {
 	struct swap_info_struct *si;
-	unsigned long ram, maxpages;
+	unsigned long maxpages;
 	int error;
 
 	if (prio != DEF_XSWAP_PRIO &&
@@ -4612,6 +4669,23 @@ static int xswap_create(int prio)
 	if (!zswap_is_enabled())
 		return -EOPNOTSUPP;
 
+	/* Refuse rather than clamp: xswap.max= should give what was asked. */
+	maxpages = xswap_size_pages();
+	if (maxpages > xswap_size_limit()) {
+		pr_err("xswap: xswap.max is larger than the device can address\n");
+		return -EINVAL;
+	}
+	/*
+	 * Below one cluster the device is not cluster-aligned, so its only
+	 * cluster would hold slots past si->max.  Nothing masks those, and a
+	 * slot allocated there is past the end of the device: it can never be
+	 * read back or given up again.
+	 */
+	if (maxpages < SWAPFILE_CLUSTER) {
+		pr_err("xswap: xswap.max is smaller than one cluster\n");
+		return -EINVAL;
+	}
+
 	si = alloc_swap_info();
 	if (IS_ERR(si))
 		return PTR_ERR(si);
@@ -4619,16 +4693,8 @@ static int xswap_create(int prio)
 	INIT_WORK(&si->discard_work, swap_discard_work);
 	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
 
-	ram = totalram_pages();
-	maxpages = min_t(unsigned long, ram * 2, swapfile_maximum_size);
-	/* A cluster index is an unsigned int, so cap the cluster count. */
-	if (maxpages / SWAPFILE_CLUSTER > UINT_MAX)
-		maxpages = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
 	/* Cluster-aligned, so no cluster holds a slot past si->max. */
-	if (maxpages > SWAPFILE_CLUSTER)
-		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
-	if (maxpages < 2)
-		maxpages = 2;
+	maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
 
 	si->bdev = NULL;
 	si->flags |= SWP_XSWAP | SWP_SOLIDSTATE;
-- 
2.54.0

