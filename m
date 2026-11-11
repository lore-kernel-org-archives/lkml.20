Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399798;
	b=w8cn6F21SE129NQ8arDbH5/vFAFwfADR9YSNPyma/l8DmyY9UPADR5eEDUxOLF2nffHZ
	 t1kwY2iDeQ2MOlk3H01nzLailt1XLr668yxpLos8zaMfH8NKZqtTQ26ssU7CFEToTuMj8
	 dEAe/n/Nc7be6S5/QhsQzjL7PpCHVDJn43BxgbwNoHKBchM7VMr/IdUPx4LpaLxyqMvj1
	 Hw81dGA7Mkljmng7GB+PPlK4uwdsFHuwsa/Q1Tw7crawnJ/YgjL5YbkJ0N8Un3PvCvpr+
	 hDEebDDF6sLTDbHCx2saazN4B7yiExzQyiheO19qd0pLeB/UJUB++1i5lgN1QUTwE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399798;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=Pcsg21/z16a9PyRylDK6hOxXDdF3iHDp63YP8jpsiko=;
	b=Z8h3slDQxwkj3PLNthNfTo6nhJemPe5TQaPSwpQLsHO7hqC7sppAbxkdfAmy5opUXjlg
	 pJm/wjC5Tm15ug3s2F0QF6DgvXFH5rFTBUtiJ1U23GbIKY/hrLzFXPofeKBcMmIpzfYlx
	 SNq0246u4LPhSV4nS6FWItqv6ZJN4EfAFRikgZT5RA7A3bTPZ3/uB6iRUI6r6PEzxIDvr
	 s/hf4I45xPlhsFNpkCD/8CPTDV62kUnOBI0nGaSEUQZka1goEAXrlWsJYBqM0hCDgFyhx
	 p+xa12PdWroGB41UqKpDsohtjabTO98/TyhUns5o+X9SXSpjVPKxsHSfbIrv0Tm4jaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=RV65refd;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CB606A8A2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576CB606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=RV65refd
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54502a173;
	Wed, 11 Nov 2026 20:23:13 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: inftl: Fix potential table leaks on mount failure
Date: Wed, 11 Nov 2026 20:23:12 +0800
Message-ID: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ca8ff1d503a1kunm6946a0161b3668
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkMeVkIYT0MZHUhIHxhLGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=RV65refdndSdhSEzTv7hYXy4L0j59TCf18ZI7dDtW+KvpIySD0peJU9EVNfemYBjUcQGALnm45PQ9yrpZbj3ygrR/q+IHLZgqxJnJhJCwj1BeXLizhDTmV1fZqMZnCcvsg88FvJAOFpGPZz87cpOqNIIY5VhwrqRDZ8rUJCmdxQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Pcsg21/z16a9PyRylDK6hOxXDdF3iHDp63YP8jpsiko=;
	h=date:mime-version:subject:message-id:from;

If the temporary ANAC table allocation fails, the unit tables allocated
by find_boot_record() are left behind when the caller frees the INFTL
record. Free both tables before returning the error.

This issue was found by our static analysis tool under development.

Fixes: 8766af935f3f ("[PATCH] check for failed kmalloc in inftlmount.c")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/mtd/inftlmount.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 87e246a6f488..841ae05bca7b 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -551,8 +551,11 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Temporary buffer to store ANAC numbers. */
 	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
-	if (!ANACtable)
+	if (!ANACtable) {
+		kfree(s->PUtable);
+		kfree(s->VUtable);
 		return -ENOMEM;
+	}
 
 	/*
 	 * First pass is to explore each physical unit, and construct the

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
