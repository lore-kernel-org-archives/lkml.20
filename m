Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087369;
	b=tNWkKfSWZywwpzmfJmyjsukkOoTlzFnNrZaM6uPqad19Dn+BHKB2s/TcWYO/msXlptvl
	 GF8aa9J759CjheZk97F/oA69ngbbLQ9YqydwF7rYnCPRoMcr4dMlwyqPhc1sgqBRAeKPp
	 rUwMduqf4Ne+KhChUPRlGBe0PddEnt2uHEMAaEbelG5VlYrgwZbeAkI09OoHiIsk5Er3x
	 QRgEHmhrSoFMtF/lMKryJc5gSEXl0BzGS2dvi7ZRwwo2d0t0pUT6IKukz62xdYWLuKZhu
	 fyKU2DAZ7Ce04uMW6JD4hd6XkR/1ZctZIb1+eAKjgGOiVDz8fxFap8vW4Lb8byZAi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087369;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BqtrTiVGwsNpn71i6YH5euzAwJ7WMZ7rm1kLCewwZ1A=;
	b=WAKw1JSk3wRz5HgKh3di9ohvoSzw7hFdUkHBJqB+D2JvSmmTrYf85ps0U6LiNmqXPp5E
	 gYa/NYYy804d6NJnOLuE7pDUiQHFx0CQz4DTUNX0aREU+znm4GUSa6WCCPx1OV2KqnkRm
	 xf0aKCZsuBP1G5HyDiWBw/CadwGWJPVTsLIIx0m5FEKDojB+DznjWSfMmy4tExgBFiaOC
	 v35HS5mRuZLHjo2t5wT71iTAhDKJIaW1JzNOVZwkUhZB6JoqlX9BQ5eQ/KnHfKEvIvXFQ
	 ongwnIpbDmb+GpbXWy9BLypHN5bAp7XEtWEEXCSWO3LG5qKO9RLfnQxidX0fJyTkOEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ct5Z8p2p;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76CF606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A76CF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ct5Z8p2p
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793087360; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BqtrTiVGwsNpn71i6YH5euzAwJ7WMZ7rm1kLCewwZ1A=;
	b=ct5Z8p2pDciG2PBBWHXkXNFMapHV5c3tWKsNHRi1LN+2ruO34tch2C0cb6CF8ler6+8dkoPiCtxGDkWCVi8CNzK0SUVgZnDqQwG5D8NVhyJFHZLnrpHFmEGxtI9gezJIUhziJR8oi2+b+WhPmchV/5tYBSkeWsSAMrfsNbbXqgo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDd8d51_1793087359;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XDd8d51_1793087359 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 15:49:20 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] tools/mm/thpmaps: fix missing mapping names
Date: Tue, 27 Oct 2026 15:49:04 +0800
Message-ID: <20261027074904.3328878-4-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
References: <20261027074904.3328878-1-tongweilin@linux.alibaba.com>
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

VMAList splits smaps lines on whitespace and only keeps the mapping
name when there are exactly six fields. Names containing whitespace,
including paths with a (deleted) suffix, are therefore lost.

Limit splitting to the five fixed fields and preserve the remaining
name.

Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
Assisted-by: LLM
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 tools/mm/thpmaps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
index 30a8e915d677..a1a9bc30514f 100644
--- a/tools/mm/thpmaps
+++ b/tools/mm/thpmaps
@@ -198,7 +198,7 @@ class VMAList:
         self.vmas = []
         with open(f'/proc/{pid}/smaps', 'r') as file:
             for line in file:
-                elements = line.split()
+                elements = line.rstrip('\n').split(maxsplit=5)
                 if '-' in elements[0]:
                     start, end = map(lambda x: int(x, 16), elements[0].split('-'))
                     major, minor = map(lambda x: int(x, 16), elements[3].split(':'))
-- 
2.43.7

