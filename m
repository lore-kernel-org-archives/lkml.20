Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA9F3EE1D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339773; cv=none; b=T/Un4wkYKbesIYXNOdp29vKSga1xXbJlJlcnk6JU2hp/llm/0wMb2CCsn8XOn+YiFqDoNATI9SiwzIhlE1mJSsdSjCP2byYLmwjbBNBGk4ujk9WGrZNtOtOolvs/6OFgJ2cJMoSKynhFepF80tkeb6CW8lxQmB0ghyvsST94vHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339773; c=relaxed/simple;
	bh=MuOMayaYfb7OqtoNJzdQbgnwZoKTanwlphdmSitec38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKG8akFl9XaXYR6jhiibXd5SFRlYaon+RMIlbSvhsBQ/HJ6UuxtC2pZu/0z5g0PIu5Lm/eBr0n5ej/VMdsxR8Xigtr9QebIuJpd0q+4rX615Txx2hJUcu4GFbsH433JSQvkXol1FTr4pWjFAkPNTsvsOwLRK12dRNu5p5Hv/1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=d0XcqTIp; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="d0XcqTIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=d0XcqTIp+Lio6XNTvjGEJI9ZRA8Md9BeH5IjRgMahXvmLfqVmoU+CCjVGMXJ9VWdQ7HyCnNR/bDf7
	 9MRe+RO+nWknzQfkR2orhYCGasUtjZMBU6j/rBboaKeTnd73yUrRI8/YaNdXiVyjD+DDA/EVTkiBpZ
	 AdzmQvGq/IxyVSDo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56a97e63866c-a114b;
	Wed, 02 Sep 2026 17:02:48 +0800 (CST)
X-RM-TRANSID:2ee56a97e63866c-a114b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36a97e636eb9-f1f6f;
	Wed, 02 Sep 2026 17:02:47 +0800 (CST)
X-RM-TRANSID:2ee36a97e636eb9-f1f6f
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
Subject: [PATCH] mempolicy: fix div-by-zero in alloc_pages_bulk_interleave
Date: Wed,  2 Sep 2026 17:02:45 +0800
Message-ID: <20260902090245.16411-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In alloc_pages_bulk_interleave(), nodes_weight(pol->nodes) may return
0 if all nodes in the policy mask have been offlined at runtime. The
subsequent division "nr_pages / nodes" triggers a divide-by-zero
panic.

Add a zero check returning 0 (no pages allocated) when the nodemask
is empty, consistent with the guard in
alloc_pages_bulk_weighted_interleave().

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 mm/mempolicy.c | 3 +++
 1 file changed, 3 insertion(+), 0 deletion(-)

--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2600,6 +2600,9 @@
 	unsigned long total_allocated = 0;
 
 	nodes = nodes_weight(pol->nodes);
+	if (!nodes)
+		return 0;
+
 	nr_pages_per_node = nr_pages / nodes;
 	delta = nr_pages - nodes * nr_pages_per_node;
 

--
2.43.0


