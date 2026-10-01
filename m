Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697C3BE15E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854889; cv=none; b=uVHBosRuLFKv1vIMqBClfhGT31H02onahcHFgJDV4xnUFuTh7xmzgKaD1xWTmGV6QfKq52AkBr9SZ4IzLoGiE8OiS7vMvFmFd0iQWgBGw4YKsfivKaaCmRgzVhu7TE1v6yN3m7QXOaT1QC/9RxiZ+iCjT8dkYYBaX+ePnrf3VuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854889; c=relaxed/simple;
	bh=rJVpR42s22EMse/WNllmwFzMaJfou1erkc0O2YIgazM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=K6aimmDXwImb5FqJ8a9OKR4FgYwXuTeMQO3VhaQaxbDKg3CKMHhZyaGPL41QwBizLkEcdgieLvl7/XZFv+bZi3+9Kh6l58CCLB62PJbilVFztyeY6FCtjM+NSzFb1e9CvUExGditm0SceKSihRl0aKZlivy2sIorF4Q5SHXp9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 000d8fd4bd8d11f19a56ed5b684f684d-20261001
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:27e657c9-4e4c-4a28-8e61-6928a2357c7a,IP:10,
	URL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.19,REQID:27e657c9-4e4c-4a28-8e61-6928a2357c7a,IP:10,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:NOTI_GNA5D1EA,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:7db8b62,CLOUDID:4e2e73a42f6320d81cb37e347305c8ab,BulkI
	D:261001193759EC06SWIF,BulkQuantity:1,SF:17|19|38|66|78|102|127|136|850|86
	5|898,TC:nil,Content:0|15|50|99,EDM:2|-100,IP:-2,URL:0,File:nil,RT:nil,Bul
	k:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,
	BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 000d8fd4bd8d11f19a56ed5b684f684d-20261001
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(175.169.70.242)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 893147695; Thu, 01 Oct 2026 19:41:11 +0800
From: Enze Li <lienze@kylinos.cn>
To: ljs@kernel.org,
	akpm@linux-foundation.org,
	enelsonmoore@gmail.com,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	enze.li@gmx.com
Subject: [PATCH] mm/hugetlb_cgroup: add trailing #endif comment for include guard
Date: Thu,  1 Oct 2026 19:39:57 +0800
Message-Id: <20261001113957.561304-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
---
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

base-commit: 21c3620df8ad362e9f2069ac35577c2a2f782f33
-- 
2.25.1

