Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087363;
	b=Wk5lfCFw5VXPCceP0LH2VfbHsjcSjoRohQX1S48wOMwBNmwTHmmnubqEhbLcrjr9Xgxd
	 ZOEQXCs3BhuOkm15KJu2RjKKj8/PTjNQq7C96dx5mmQnQ9Eyt+XaptECLlE7p9AdQdPAx
	 U0YfObPWaKULODYQA3YIryT8MZrao7hm5LCDx099HOM/kR6hSe0R7M8YtBQimzfjZHZb0
	 V5yVmkctFb4bCFB0Q+iYTodempIX/HnIwUPJq2SJobYZQuh3hXSsP47EFiGkRdaycEU8k
	 eL9GD8Z2eZzNRTEXmfzP2Y1DXWABDMxZvswdyjZlrPDITaBLJaO1wU6NRbz3oArzZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087363;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BXvgM0ct2zh3WME+RiKVmHD2v16ccD4fuepbOGcZJl8=;
	b=ebvrbMWLklasGsQE1Wwkre8bE08O3zEOlNaHmgQtTccWp0Jaktb88a4S8IhJ15xUV0le
	 ZRbh0fYiT6WewSVx+zajzY+MDTvhNG8RDbPnS5nYcpkbppZ1I5T8IArmTtf477+RLfB32
	 v7ATW4yIGtSKOrn80YIFLx2l6CZzDrIRum2c8AL2VL55JW8LeLsd/7sf3KWnqfPt3SmCL
	 SEyGVHohDNCggMrTUIe1S8PMMRnwDHDnolShzxdPLwbiJCDYedlQm+a+Ww90Wm4XuSx0g
	 s9Jnml4UncfBKOsuf3c4dGLYk3QMHGfqPsDjxeGRLXCyDR+CgjL3d4pXuiTpwXQJ2hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=feoAmarh;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD704606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD704606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=feoAmarh
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793087359; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BXvgM0ct2zh3WME+RiKVmHD2v16ccD4fuepbOGcZJl8=;
	b=feoAmarhOPv1XFa4+GR0GcXISwsTFdInNaACgajSG8stEUfbfu7ftXX57yOnOgl/viPGu+RqkDTCW2KPp6s7P3Pp3pFgawTmArQSgRRr10PP0NfSOqmyhyhNvQeHQyXjp2rl9xdnsJEFy2SSV5GSKPfRgjN67OuqD5b6jwCz7oQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDd8d4h_1793087358;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XDd8d4h_1793087358 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 15:49:19 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] tools/mm/thpmaps: fix partial THP anon/file accounting
Date: Tue, 27 Oct 2026 15:49:02 +0800
Message-ID: <20261027074904.3328878-2-tongweilin@linux.alibaba.com>
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

thp_parse() reduces index_end before looking up the type of the
trailing partially mapped THP. The lookup then uses the preceding
page, or anons[-1] if the THP starts at index zero, so its pages can
be charged to the wrong anon/file counter.

Account the partial THP before reducing index_end.

Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
Assisted-by: LLM
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 tools/mm/thpmaps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
index 803e0318f2fe..d92aace005c1 100644
--- a/tools/mm/thpmaps
+++ b/tools/mm/thpmaps
@@ -263,8 +263,8 @@ def thp_parse(vma, kpageflags, ranges, indexes, vfns, pfns, anons, heads):
             if flags & KPF_COMPOUND_TAIL:
                 nr = index_end - int(folios[-1])
                 folios = folios[:-1]
-                index_end -= nr
                 stats['anon' if anons[index_end - 1] else 'file']['partial'] += nr
+                index_end -= nr
 
         # Account fully mapped THPs in the middle of the range.
         if len(folios):
-- 
2.43.7

