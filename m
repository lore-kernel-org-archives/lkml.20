Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF36B42885A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858297; cv=none; b=KO4lJWf+1krVrjFvy68LUPDafIBMEpGc/gjobA3uBxSsG1H29meIpzdydCEMaOki0hG1W7NmghZp/j39awiF4JOYMqXcE64j7VgeVybC13Fn6jwZjqYnovdE+0dpJRDHvF0jGfHJ86NB715URSc42JsBLzg6hqb5gmbYQM4YiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858297; c=relaxed/simple;
	bh=aU1EC8E02THaxwqqRqgByIJFMGJx+BWc7yvkGLwEGcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ciMCqckZJIVe3xyHUGoxOeOIGeMJhQy0IxeZyz1OVFaqjGxIYy5X1+KyqSiFpbgcW9qC3kCSi5FheI4zmNQIuj02D1xrMQ9WQQ42khgHHvL3W8EJXsPAYG+8i3wDVPQuAl+Tn8QJ4oa51Dsi7p2iODauUq1Q02DgK514enGthgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f29d2640bd9411f19a56ed5b684f684d-20261001
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d8a3bf9b-ccfe-42d3-af19-97c94c30332e,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:d8a3bf9b-ccfe-42d3-af19-97c94c30332e,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:fa5811b16cf6a5b9055d2c7f2be89049,BulkI
	D:261001203357HTPRU24Z,BulkQuantity:1,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f29d2640bd9411f19a56ed5b684f684d-20261001
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(175.169.70.242)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 378255551; Thu, 01 Oct 2026 20:38:04 +0800
From: Enze Li <lienze@kylinos.cn>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH 1/2] MAINTAINERS: add include/linux/hugetlb_cgroup.h to HUGETLB SUBSYSTEM
Date: Thu,  1 Oct 2026 20:37:46 +0800
Message-Id: <20261001123747.634845-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

include/linux/hugetlb_cgroup.h is the header file paired with
mm/hugetlb_cgroup.c, but it is not listed among the HUGETLB SUBSYSTEM
F: entries.  As a result get_maintainer.pl does not attribute the header
to the hugetlb maintainers explicitly.  Add the F: entry so the file is
covered.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 596efa354ea2..6c210e90722f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12097,6 +12097,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
 F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
+F:	include/linux/hugetlb_cgroup.h
 F:	include/linux/vmemmap-optimization.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
-- 
2.25.1

