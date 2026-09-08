Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5794313546
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831748; cv=none; b=tC/tsgI0ERIM6+fl2ragvYxWonms8dB4gsPXKcFKfTXPZ6dd4DA40lOetFtLqo1mBG1Quu5ge8Xhrwn8X09LbNbqMP0PwpEttfd3KK21pSw70X50FH5uiwm6cyAHyxagK7A+1hIaVni65zKlEN7PMJGyQXfXUH2M5W8Mda3367M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831748; c=relaxed/simple;
	bh=x+Apm4K5w/zxjDiEnd4u8/cQUJ81R5nziYXXGku/nf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqjLDhVmuVTjP24cS8b0NSa4GmvT5BcZ29eIKRyCCehPXoxYqB9796CufHBixougrWKWLXiIpc9R5GJzKeT5PqaBb6/2P3dC3h5hcJbMduQixItEOm+t8NatdnKaPekpXlzrEq9uyBsXOlV4S4srfd+rvOa7JiYvQk79bzbpadQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AUnNf7HB; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AUnNf7HB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788831742; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vuvYXO2zojXIeNrpcLKcQQ7TtoojYysUTPVrrXSxdEA=;
	b=AUnNf7HBwr3WGfZMyF2QzwSodkpW8sLItlkMNH+WD9j+J4f9lA1ZGGXPx0jbljot0ZVvWcvcLix47pMG47K6USyw7sk8uL4R0kBboIhgbYL8pGlSQEiYti/Eh48iTP5T81xm9wylFAWzrge1oNIUgdN17nQboBhSgiziLDosQAQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XAZnZlP_1788831741;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAZnZlP_1788831741 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 09:42:21 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add Baoquan and me as MGLRU reviewers
Date: Tue,  8 Sep 2026 09:42:12 +0800
Message-ID: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baoquan and I have been contributing MGLRU patches and helping review MGLRU
related patches for some time. We will continue to follow MGLRU changes, so
we'd like to be CC'd on MGLRU related patches.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d1ff4c76496..c558d5370dd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17242,6 +17242,8 @@ R:	Barry Song <baohua@kernel.org>
 R:	Axel Rasmussen <axelrasmussen@google.com>
 R:	Yuanchu Xie <yuanchu@google.com>
 R:	Wei Xu <weixugc@google.com>
+R:	Baoquan He <baoquan.he@linux.dev>
+R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.47.3

