Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4573ED5B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339838; cv=none; b=HnmfZhZkZROZEJF9i/7eTQCdX8d1eDdMN10h890HkJhCf8/LfcwqV0DHcQwHHPRkScrYCRZZMpmX3eEUXIpWnN0tj6B1nqZZeB5glnjDlR7v9XO+vwZ6C448Xo+HeF3VERtHXvRERiQ1TzWjzAVWAni5h34Qae8MNG/WhJpbDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339838; c=relaxed/simple;
	bh=/Oq4d7QODMyv7iv92M76YD2dho51vNswzHNE/O6IomU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kE1kUtpyDIX1tS4mraVC+h/Kz5lxTx0GWfz1oAAyMrs39Whwoap/agfY+jPJRgnr/JGBWEgyY3mbH/+i4l+KAl1UkC+m9FKLXbRb5qoBa/6989CB3rYU6Mi5jliXSQv/dXvlHf3ix/wtcspQXx+RF45iLenCRljj7zLySp+qyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=WhPOLhK5; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="WhPOLhK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WhPOLhK5DAQNmqO9nekRIADjVRCHupfLTZxbBItPEVHNCGnyVb4amAad0gmWxcqBe3VDt45QsoBtv
	 FdN+nEwqGQYwAM452jqpM3iF54tfn3fdMtS6KMUSXcQArLkg1bJq/Qt6vRiNaicOz7k17SmbZFftbM
	 Mx2r/pq1LGUUbhl4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26a97e674996-dd8af;
	Wed, 02 Sep 2026 17:03:49 +0800 (CST)
X-RM-TRANSID:2ee26a97e674996-dd8af
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56a97e674d14-f3f41;
	Wed, 02 Sep 2026 17:03:48 +0800 (CST)
X-RM-TRANSID:2ee56a97e674d14-f3f41
From: Liu Jing <liujing@cmss.chinamobile.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] mempolicy: fix mod-by-zero in weighted_interleave_nid
Date: Wed,  2 Sep 2026 17:03:46 +0800
Message-ID: <20260902090346.16429-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In weighted_interleave_nid(), if the iw_table contains all-zero
weights for every node in the policy nodemask, weight_total sums to
zero. The subsequent "ilx % weight_total" triggers a divide-by-zero
panic.

Add a zero check returning the current NUMA node id when the total
weight is zero, consistent with the existing !nr_nodes guard.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 mm/mempolicy.c | 4 ++++
 1 file changed, 4 insertion(+), 0 deletion(-)

--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2218,6 +2218,10 @@
 	/* calculate the total weight */
 	for_each_node_mask(nid, nodemask)
 		weight_total += table ? table[nid] : 1;
+
+
+	if (!weight_total)
+		return numa_node_id();
 
 	/* Calculate the node offset based on totals */
 	target = ilx % weight_total;

--
2.43.0


