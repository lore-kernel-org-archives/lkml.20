Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.247.232.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160400;
	b=1WHYP1LeUGs2JPobPrHVxfjjFBkbDIGGkSN3cexH7Eeond65MSLix4h7hLRfLiOTBzcS
	 oREAN/uVrUMzX+LVGIrThmcK57wsuPsNPEcW/7MYvhFBPKZhEl7Z/O2Taq5oo4NKzzaCV
	 tRExurqmZ03fXfgyJRaFDVTIslav7Jq1CkUDVwfgzrRPqX1tbcDMuPiatHJW7tCDC26/o
	 XhL8GJz/r0n8uWUfK/9zTE3LlMigB/T/9qSOGzcioMtb0wfvVgGFwdm8cMhQyQZtBQs4+
	 JQt5uYusMPh+rM7Z0mdDjjXniZEkWKexa1ZQqKOUcrQRwvCbkwlw/j8USLnc+h2QbLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160400;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JElZBt1ytYu+zjbdpKGM9sCMTT13/34lYpGkm8cooOk=;
	b=axTgCFljkNJ/lugyMV/Aw88fYJ97yRiP8HZe5P/519gSA991Sj+i2FTVzSFJsx7STUYJ
	 AUhorxaR+Dy0rWqmJE2D+DdrYbkryNEPMud1FVsjUvqR4EfWFIQhv4Wdtd7WCkpkLD0OP
	 chDpwhszRihkMc0CEi8ku6F7qPwswv72u8L67PisAuY5JWA1GbD+QM3rHzxmlXz8mhbCP
	 HyLJe+L+2okP21tman7IQa//I5jb6xO1GjNpBk88dP6pdZzhNGGeaXKSM8gCtEOLEDYsC
	 UeVvEg8NkL0prMiN1y1cdb9ol31Z9nWowP1hH/wU8ZD8b1Fcg3zCbz6d0Zg8phLofSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linx-info.com;
	spf=pass smtp.mailfrom=linx-info.com;
	arc=none smtp.remote-ip=114.247.232.78
Received: from mail.linx-info.com (mail.linx-info.com [114.247.232.78])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94248606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94248606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linx-info.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linx-info.com
Received: from localhost (localhost [127.0.0.1])
	by mail.linx-info.com (Postfix) with ESMTP id DCE18321211;
	Wed, 28 Oct 2026 12:06:30 +0800 (CST)
Received: from mail.linx-info.com ([127.0.0.1])
	by localhost (mail.linx-info.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tob-XWZYIJ-x; Wed, 28 Oct 2026 12:06:30 +0800 (CST)
Received: from LAPTOP-A9UKIAU1 (unknown [172.22.21.81])
	by mail.linx-info.com (Postfix) with ESMTPSA id A640632119B;
	Wed, 28 Oct 2026 12:06:30 +0800 (CST)
From: Wang Guangke <gkwang@linx-info.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wang Guangke <gkwang@linx-info.com>
Subject: [PATCH] mm: fix typo in comment
Date: Wed, 28 Oct 2026 12:06:25 +0800
Message-ID: <20261028040625.204-1-gkwang@linx-info.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "pages frames" to "page frames".
Only touches comments,no code changes.

Signed-off-by: Wang Guangke <gkwang@linx-info.com>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1533aebafb68..9d233b6af7ab 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1179,7 +1179,7 @@ static unsigned long __init __absent_pages_in_range(int nid,
  * @start_pfn: The start PFN to start searching for holes
  * @end_pfn: The end PFN to stop searching for holes
  *
- * Return: the number of pages frames in memory holes within a range.
+ * Return: the number of page frames in memory holes within a range.
  */
 unsigned long __init absent_pages_in_range(unsigned long start_pfn,
 							unsigned long end_pfn)
-- 
2.47.2

