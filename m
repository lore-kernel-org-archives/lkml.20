Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49B8137750
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959874; cv=none; b=VOZGRvJcTORabmCpavrM90o1fgsB8Q5ygT4oHrYFIEKEkCO2CJjzGVfCaGWLFfVKRgjRlDBN7+noElcstSG4ULCyEHUc21vW4Aqj4u2n0DTp+X/AL3SCT+h2sj5eHweo3QNYXkCsJWHFncnKsMbNZH+08CrIUmjKVSKsPJRdrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959874; c=relaxed/simple;
	bh=aNrTDvCHUmEN2j4wnpiQKbnO89mJo5Y6kXgJ0WbTM/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TLndjlWs4YXLH1oyuoSvA45W3iwATasDhIozyjoEXrmpQFWEycVEnMKYEYhL4rmuQoVjoCymfZVIq/SMZB8cdQqLX3WnBhHlMwCTVAkk2gGtxmcqjBwAmdelZOiUx0fjR4vNk1BoaK1a8Z04UbtAqFCpNQfSyySDRNutzK3TbPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lIvowBit; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lIvowBit"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789959864; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+z7vJSmIDRGlrTXW1s9PrMcTHptumEg3JUs/vpMf91k=;
	b=lIvowBitpwakNTayibQLuGsyzObHAXlAn/3UKFPT8wJaHGebS1SQLlHHa0PHkLcxrjzQVLMmKm8jDU+uDJSx5XBtvIMbLsNONcI/xWTubt2hEe8YbRyGf2jYJtBSjxnSBVYZ1TUXljX4+M6Ac3ugAwpYRzMo3+q5s+CQck13ihw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0XBHM.sF_1789959863;
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0XBHM.sF_1789959863 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 11:04:24 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: linux-kernel@vger.kernel.org,
	xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: erofs: update my email address
Date: Mon, 21 Sep 2026 11:04:17 +0800
Message-Id: <20260921030417.87932-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbo Xu <jefflexu@163.com>

This email address will not be available in a few days.
Update my own email address to jefflexu@163.com.

Signed-off-by: Jingbo Xu <jefflexu@163.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..1008e14254c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9681,7 +9681,7 @@ EROFS FILE SYSTEM
 M:	Gao Xiang <xiang@kernel.org>
 M:	Chao Yu <chao@kernel.org>
 R:	Yue Hu <zbestahu@gmail.com>
-R:	Jeffle Xu <jefflexu@linux.alibaba.com>
+R:	Jingbo Xu <jefflexu@163.com>
 R:	Sandeep Dhavale <dhavale@google.com>
 R:	Hongbo Li <hongbohbli@tencent.com>
 R:	Chunhai Guo <guochunhai@vivo.com>
-- 
2.55.0

