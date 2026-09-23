Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2031A6817
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123972; cv=none; b=QAQBW9WTrg4/h6PpePkOKsgVmpEviVWYMGPLXqLYiq2OSSPfmZKVh1de93l4ak6zILlJA6Z8rM4jPDLrR+F4O8eehJoyDxdeK5R5vr5yPEKd/n7ZZQ3KQ2PmjxAqOaq2SRRsz6ja7e7t0hZz3Nf/mL5LKaqovA7DIBX3UDgsRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123972; c=relaxed/simple;
	bh=J8IGJOTPNLo5funj/k5m2l+HeG+UE8ItYZ+QlSXAmoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQEeSwJzub08quBE2d+MfRQa8PLOu1WsVZqNR+gj3IPR6ngRjcAKgvjjuinGYCjsag4lz/REpXrocUvZbnADLe/8p//jfi3BHcwBhmx1LIvBHP/aSoSpQeioldndWndA0vWkjVfXb9KhW0rWGd0Ara45g918OWKu5JPwUxWyKCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DC3hmLix; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DC3hmLix"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790123961; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wb1T1pRgBdjSKoXGUtRKQo+JqN2Jv3JC84D1tTDRpuo=;
	b=DC3hmLixTqjmKR4cPrlumKV89s9OmDBl4A5T3RXnBuLcoaKNUAmJCAR5r9ded1nqHlaB6IGH/nhWHX4BdkWO3oC+YgpGoi3GCj/gKKd7nAcQZoNJ39YX3NWC3FkwIaJfQYhtFbGDT7XcP4JS/UYCY1xpheVDnkUZp5cNvxbNFeQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XBVF1hm_1790123960;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XBVF1hm_1790123960 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 08:39:21 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add Heming Zhao as ocfs2 reviewer
Date: Wed, 23 Sep 2026 08:39:20 +0800
Message-Id: <20260923003920.2382398-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Heming Zhao has contributed ocfs2 a lot recent years, both as a author
and reviewer. So add him as ocfs2 reviewer.

Cc: Heming Zhao <heming.zhao@suse.com>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05215fcc18a5..56c9523559df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20774,6 +20774,7 @@ ORACLE CLUSTER FILESYSTEM 2 (OCFS2)
 M:	Mark Fasheh <mark@fasheh.com>
 M:	Joel Becker <jlbec@evilplan.org>
 M:	Joseph Qi <joseph.qi@linux.alibaba.com>
+R:	Heming Zhao <heming.zhao@suse.com>
 L:	ocfs2-devel@lists.linux.dev
 S:	Supported
 W:	http://ocfs2.wiki.kernel.org
-- 
2.39.3

