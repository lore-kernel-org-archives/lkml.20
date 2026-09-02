Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72958408026
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339860; cv=none; b=a2yBOBUWJQ/TncQINA7Wp6nQl11oEKATNcj+HlgOB2SbqxdPCRT49InWPzRetJV3NNxE21lIMZjAss5DWTDvZQdayVPOwD634ztllvNaVq+ibD3bomLL/iYV+AfKHl1z6cSNo08aAbtMsS6X9dSo5nkRd1BY9uCu64yvGonPW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339860; c=relaxed/simple;
	bh=SjoyYBoTIMzyOC9li5dG+qJsjCHxkEQ0TNqEcqc7xrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Na8k+jj1yBnq6+LOwSNzzxatvoWgKBxCujJIgHrSVsHsf4cfkTUing1SsOdq6xTV/NMMSQeRyNVmucSwwU3OAHDRMfN+3EzLEnIUDEzzRdKUbB9ZnUKPol4o2KD9P+JdBorj80wlb+pnEwe/E47Dica1n6xsHneMrwksLM/9DmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=g2SNlN/J; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="g2SNlN/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=g2SNlN/JczMkJs7a7TXc4W0QX7yYSpNlnPrZuE7kaFJmbzQMgOoLrW1s2M41CddLw+3z+NRPogH0W
	 4XglbrZawWjkSUgRiHSVydSuoKJSCmyOYSfybPyHbH2qYWGlKN3KDT9md/VWFREdzMc+TXOD0C+X57
	 kOMxPL1yu6kLig58=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66a97e68ece6-6e885;
	Wed, 02 Sep 2026 17:04:14 +0800 (CST)
X-RM-TRANSID:2ee66a97e68ece6-6e885
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36a97e68d044-f20fa;
	Wed, 02 Sep 2026 17:04:14 +0800 (CST)
X-RM-TRANSID:2ee36a97e68d044-f20fa
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
Subject: [PATCH] mempolicy: fix div-by-zero in alloc_pages_bulk_weighted_interleave
Date: Wed,  2 Sep 2026 17:04:12 +0800
Message-ID: <20260902090412.16445-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In alloc_pages_bulk_weighted_interleave(), if the iw_table contains
all-zero weights for every node in the policy nodemask, weight_total
sums to zero. The subsequent "rem_pages / weight_total" and
"rem_pages % weight_total" trigger a divide-by-zero panic.

The function already guards against !nnodes but not against a zero
weight_total. Add the missing check, freeing the locally allocated
weights buffer before returning.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 mm/mempolicy.c | 5 +++++
 1 file changed, 5 insertion(+), 0 deletion(-)

--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2697,6 +2697,11 @@
 	/* calculate total, detect system default usage */
 	for_each_node_mask(node, nodes)
 		weight_total += weights[node];
+
+	if (!weight_total) {
+		kfree(weights);
+		return total_allocated;
+	}
 
 	/*
 	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.

--
2.43.0


