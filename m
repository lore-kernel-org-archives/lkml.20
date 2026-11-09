Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203810;
	b=2bpN3bQ/+kQM/PmWiIY9J1CcfPqbhf5abhZnCo6nxY5DBGOmyYbFysATcFOiuwn5Uhtm
	 HDFrlasNmMUxTgFQp2ge8RFaVlAN/S7HwRjKr4y3IJ+UW/NIdmBFFGd2NaXbenhHQz+s4
	 nfXuyBhg0raYq/HoEXT9DDUhR/GpgEIcfUZTjWpHISIq1dFaWwWfFDTMaEg2GVtkBHo/G
	 fw7lCGy8rSzpKecnu+pBK1zPDpSxX/VVzZYoh30gtw3vOyfzCnQZtONjb2FKUfacKZhEf
	 XZLYow3V79QXJBwGPpJwQApBKA2UgziBDxRdN816qr25nZQjIiGzl1V1ammSdgY2fwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203810;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=sVucbjapRHkFi5A8kcECistOx5jjdhJJRy/CQV2ING8=;
	b=e9ZUm02t4PvBNWoSEn79d59zAPPE4m+7cRk26bteREoZy8h/Dg0j35EFnRMquFyA8lO7
	 S/yy9o1ScszsCJnTxekQXa7xau0KrmAHGRy+8NDC4/qyhMU0+eqZ1IhY8NFJCRj4r2n0G
	 SLtd0zFRXd2AZk9hfoPWEdkCHk/vefyMd4vgmvjl3bxHxw3//CfQ8L90q60ME/YIC8qFU
	 JJj0z0DsHdqdkPJw17rR1fM9LfX1wHlVYWYX4ZNWt0GzXKEYcQcK2lznAi985v5XNpHuN
	 lahBTsfELygFa3jtICLfFphS00ZZUYva6GJrLDmFKonYEjMN3TBzCjfKAGcHI6Ny0hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DRk1+mWD;
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33B606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B33B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DRk1+mWD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mckKJp3udcFJk+QeqOHBO929R9nkM1Xgjw5azrxlv4s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203807; v=1; x=1794808607;
 b=DRk1+mWDKqcMEqA57afkqyV/D9xb3QTSzAnOKJs1SnlfmHOFV5jGxiJQTq7cP8OOXflchd23
 18h/ynND8K9Ke9e2cTq1hz8UW2bc84zYDEJaAtnzVw2ysn7JyIR5xSSd8Mzj+t2qO74W++R9TfN
 rZQ+9KpIh10Jn8p78bS6pxNs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3812f45ae6465a56;
	Mon, 09 Nov 2026 05:56:47 +0000
X-Mizu-Trace-ID: 3812f45ae6465a56
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 10/19] mm, swap: let the command line set the xswap device size
Date: Mon,  9 Nov 2026 13:54:46 +0800
Message-ID: <20261109055455.536925-11-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

By default, a new xswap device is 200% of RAM, which is twice RAM.
Add xswap.max= to set the size of devices created after it:

  xswap.max=300%      three times RAM
  xswap.max=8G        eight GiB
  xswap.max=max       the largest size the device can address

The default is fine for most users. But a machine with a lot of RAM
and a small working set can get a SwapTotal much larger than it needs.

The size is resolved at device creation, not at parameter parsing
because a percentage depends on RAM, and totalram_pages() is not ready
when parameters are parsed.

An explicit size that is too large or overflows is refused. The default
size is clamped to the limit instead. A size below one cluster is also
refused. "max" means the largest addressable size, still bounded by the
unsigned int cluster index.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 .../admin-guide/kernel-parameters.txt         |   7 +
 mm/swapfile.c                                 | 130 ++++++++++++++++--
 2 files changed, 127 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..e92a1b9062a6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8738,3 +8738,10 @@ Kernel parameters
 				memory, and other data can't be written using
 				xmon commands.
 			off	xmon is disabled.
+
+	xswap.max=	[KNL,SWAP]
+			Maximum size of a new xswap device. The value is a
+			size in bytes with an optional KMGTPE suffix, a
+			percentage of RAM, or "max" for the largest size
+			the device can address.
+			Format: <size>[KMGTPE] | <percent>% | max
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 44b54118d10a..498fbf6df1cd 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -14,6 +14,7 @@
 #include <linux/mman.h>
 #include <linux/slab.h>
 #include <linux/kernel_stat.h>
+#include <linux/overflow.h>
 #include <linux/swap.h>
 #include <linux/vmalloc.h>
 #include <linux/kobject.h>
@@ -150,6 +151,100 @@ static struct attribute *xswap_attrs[] = {
 	NULL,
 };
 
+/*
+ * Size of a new device, from xswap.max=.  A percentage unless bytes is
+ * set; "max" asks for the largest size the device can address.
+ */
+static unsigned int xswap_size_pct = 200;
+static unsigned long xswap_size_bytes;
+static bool xswap_size_max;
+static bool xswap_size_set;	/* xswap.max= was given */
+
+/*
+ * Parse "200%", "2T" or "max".  @str is not modified.
+ */
+static int __init xswap_parse_size(const char *str, const char *what)
+{
+	const char *pct;
+	char buf[16];
+	unsigned int pct_val;
+	unsigned long bytes;
+	char *end;
+
+	pct = strchr(str, '%');
+	if (!strcmp(str, "max")) {
+		xswap_size_max = true;
+		xswap_size_pct = 0;
+		xswap_size_bytes = 0;
+	} else if (pct) {
+		size_t len = pct - str;
+
+		if (pct[1] || !len || len >= sizeof(buf))
+			goto bad;
+		memcpy(buf, str, len);
+		buf[len] = '\0';
+		if (kstrtouint(buf, 0, &pct_val) || !pct_val)
+			goto bad;
+		xswap_size_pct = pct_val;
+		xswap_size_bytes = 0;
+		xswap_size_max = false;
+	} else {
+		bytes = memparse(str, &end);
+		if (*end || bytes < PAGE_SIZE)
+			goto bad;
+		xswap_size_bytes = bytes;
+		xswap_size_pct = 0;
+		xswap_size_max = false;
+	}
+
+	xswap_size_set = true;
+	return 0;
+bad:
+	pr_err("xswap: bad %s=%s\n", what, str);
+	return -EINVAL;
+}
+
+static int __init xswap_max_setup(char *str)
+{
+	xswap_parse_size(str, "xswap.max");
+	return 1;
+}
+__setup("xswap.max=", xswap_max_setup);
+
+/*
+ * The most a device can address, whatever xswap.max= asked for.  An xswap
+ * slot is still a swap entry, so the swap offset limit applies even though
+ * the data never goes through a physical address.
+ */
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
+	unsigned long long pages;
+
+	if (xswap_size_max)
+		return xswap_size_limit();
+
+	if (xswap_size_bytes)
+		return xswap_size_bytes >> PAGE_SHIFT;
+
+	/* Let xswap_create() refuse a size that does not fit in the type. */
+	if (check_mul_overflow((unsigned long long)totalram_pages(),
+			       (unsigned long long)xswap_size_pct, &pages))
+		return ULONG_MAX;
+
+	return div_u64(pages, 100);
+}
+
 static const struct attribute_group xswap_attr_group = {
 	.attrs = xswap_attrs,
 };
@@ -4268,7 +4363,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 static int xswap_create(int prio)
 {
 	struct swap_info_struct *si;
-	unsigned long ram, maxpages;
+	unsigned long maxpages;
+	unsigned long limit;
 	int error;
 
 	if (prio != DEF_XSWAP_PRIO &&
@@ -4279,6 +4375,28 @@ static int xswap_create(int prio)
 	if (!zswap_is_enabled())
 		return -EOPNOTSUPP;
 
+	/*
+	 * Refuse an explicitly requested size the device cannot address;
+	 * clamp the default size, which nobody asked for.
+	 */
+	limit = xswap_size_limit();
+	maxpages = xswap_size_pages();
+	if (xswap_size_set && maxpages > limit) {
+		pr_err("xswap: xswap.max is larger than the device can address\n");
+		return -EINVAL;
+	}
+	maxpages = min(maxpages, limit);
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
@@ -4286,16 +4404,8 @@ static int xswap_create(int prio)
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
 	si->swap_file = NULL;
-- 
2.54.0

