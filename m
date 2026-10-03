Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0267F31B101
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007287; cv=none; b=uWGgfkNvVW4J4rlajeHXFO9/K3rK5xcQCFiVlwns7AaoKnYcm4LZuXnu9nCQ8r0KzqtralxD4DNVFa8YTOt51tF3avJ1ltP+A29JjPtg2yllZlN5UKaR4lHXTylC1M+HipHd21J568dvd9b/nSN6Amr9UcOD0Vr2j3ytmLsNnKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007287; c=relaxed/simple;
	bh=mxWlbqgMDU04YodlrSTnO8R+E4o9yHMS3rv8xBQXHLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWDwRYNfQeXOfyL2htwhWm/G3QNxiSqcGmEGnkTQAHXHpfV3K4VXUu3xsEuby01EuFQhhAmA6SreZBihKzZYYkgTEt0fjgTzko8igLll9JueDtu+kInszXiia0CGANCh4bCfqGeAM+UlULKokvEX3TjEfnJdoCQLyVaAf9UPHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d518d70cbeef11f19a56ed5b684f684d-20261003
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c2f9a782-b875-44b8-8b2f-1d460e9e9de3,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.19,REQID:c2f9a782-b875-44b8-8b2f-1d460e9e9de3,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:7db8b62,CLOUDID:ee5ce49d2d2fb665b8389a4051ad5556,BulkI
	D:261003140113NOZ9QDVA,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|136|
	850|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:0,File:nil,RT:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d518d70cbeef11f19a56ed5b684f684d-20261003
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(175.169.70.242)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 302574845; Sat, 03 Oct 2026 14:01:10 +0800
From: Enze Li <lienze@kylinos.cn>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	sj@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	enze.li@gmx.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH v2 2/2] mm/hugetlb_cgroup: add trailing #endif comment for include guard
Date: Sat,  3 Oct 2026 14:00:29 +0800
Message-Id: <20261003060029.2152489-2-lienze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261003060029.2152489-1-lienze@kylinos.cn>
References: <20261003060029.2152489-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The final #endif that closes the _LINUX_HUGETLB_CGROUP_H include guard
is left without a comment.  Add the macro name to the comment for
consistency and easier navigation.

Signed-off-by: Enze Li <lienze@kylinos.cn>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: SJ Park <sj@kernel.org>
---
Changes in v2:
- No code changes.  Carried tags from David Hildenbrand, Muchun Song and
  SJ Park forward.

 include/linux/hugetlb_cgroup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hugetlb_cgroup.h b/include/linux/hugetlb_cgroup.h
index 16d72c8c71f6..b4e0958eabf3 100644
--- a/include/linux/hugetlb_cgroup.h
+++ b/include/linux/hugetlb_cgroup.h
@@ -268,4 +268,4 @@ static inline void hugetlb_cgroup_migrate(struct folio *old_folio,
 }
 
 #endif  /* CONFIG_CGROUP_HUGETLB */
-#endif
+#endif /* _LINUX_HUGETLB_CGROUP_H */
-- 
2.25.1

