Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1164CA790
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602879; cv=none; b=RQ8ZBYIfVYKGEy9E0cBVjHr9UgeRVYHEamWnwTYXQGml3bFiHtBbYm07/IG1QHnApCLy0u6NLUUo/elVw0MHl1JVPJcWNoRuivX+5YPUO338gYLNfBaEL3RHWngr0/SdelseTmkpFWgrtFbjKMgUhQB9J5A5Qi6N5CRHEbrpBPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602879; c=relaxed/simple;
	bh=JUc7kuES2hezSdKXk/c82t1oSL1pRQ63BUnpcVzaWhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnDviyzflqP8rsAdLTeg9UyjY7kVB7bWsLaLjGqKsZhVdMmJIq+rR+4O+etSVVTWW6RwMUkPQyyUBqyMFwvYbaBEApGU0KLPHe7cf+4Nd1aRvenxgNTTttm2sSHjRt4Gy/KvDh52T/64cCf38n24DZrEEJMBphj3eng0cPzH8uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=YBwLcvpF; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="YBwLcvpF"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.109])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5d6f428;
	Mon, 28 Sep 2026 21:41:11 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: mahesh@linux.ibm.com,
	andrew+kernel@donnellan.id.au
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] misc: ocxl: cancel XSL fault work before freeing SPA
Date: Mon, 28 Sep 2026 21:41:10 +0800
Message-ID: <20260928134110.227-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e83f820903a1kunmbc7156bd20018c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkJMVkpKT05IGRpPSxlPTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VSktCWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0
	hMVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=YBwLcvpFi+6rs7TsdwYgfLKEl05w0FfvgiSvnPQYBvBWX92NOGzxbiY59aeIniMW6STTjTaYc2gWMLRrz2yCvdfrKRd9u+fXMl4d7LZjC7OdQ4zCJ/j+YKY0imljHsGwQBSCWUYKDQM6gCnvBJFAQ/yr09bCYf1Mx8sbyuBmNU8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=XOJXYA9rQ4lFRHo1EDsql4tJzWZKNZ9h7Ec4LEePgas=;
	h=date:mime-version:subject:message-id:from;

The XSL fault interrupt takes an mm reference and queues fault_work
embedded in the SPA. free_irq() stops new interrupt handlers but does
not drain an already queued worker, allowing free_spa() to release its
container first.

Cancel the work after freeing the interrupt. When cancellation removes a
pending instance, also drop the mm reference that the worker would have
released.

Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/misc/ocxl/link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 7749dcd16117..8146e98e77e7 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -335,6 +335,8 @@ static void release_xsl_irq(struct ocxl_link *link)
 
 	if (spa->virq) {
 		free_irq(spa->virq, link);
+		if (cancel_work_sync(&spa->xsl_fault.fault_work))
+			mmput(spa->xsl_fault.pe_data.mm);
 		irq_dispose_mapping(spa->virq);
 	}
 	kfree(spa->irq_name);
-- 
2.50.1.windows.1

