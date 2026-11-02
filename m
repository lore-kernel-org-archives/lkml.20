Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609677;
	b=EE9BEOHCFXSm2954faYnIYPP4DOU4RGB4uJKRCQEOqh2nP3Nah5eACEC89jCgOWpmlyi
	 lDxvP6MxcZ4aGR/mUpM+grx4KpYOt785uDHA50WZHnnP0RpxZveLNR3iVIrcU3ImEyVKx
	 B7hBmPVD8IHYR5ckYsRyNm3uaUrtiC91rTZzNhYnNCBV/MSGfg4lP/so6Xqhj40nvCN/u
	 YrJbgE7xn8GTB1exnu+K3rvgPzHkp812E6gp6zPptbAkqKxRoFlHBrvJLd1VPZKYeqrL1
	 PF0vePw7/kIC5QBSOxJkfKGL4cKIrVCVTf6zG7k+rbr+qWwhtg7Uvy++T15N2NQxF7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609677;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VYmgVHZ+U4UM0cUUGa/+06lU+eYMGdR+rPvQ4FM59TY=;
	b=HXQU9a47BF65l3dLbrX+Z/j2baezRYqtkcCdjWEFbwPJ4dGGhwik5zT9R8Cr48evoklC
	 Fno0tyblCIIsvlofMHlC7Kn0xlHJkJ3kcC0ouKKR31hviScLOeCpfzoFtB44wRS70AoXy
	 cw0QSbIYIZvyuL5QnU4aoxuWMiDrPIouGCSerY4bIAk6KvQ383iwWely3fKtiW8CDyiOn
	 DLpPhdk87beH0ETrcm2XMV/P0EFJ0j4IPXA1dPLnY0p4A/AZ26+tYsqfpmLKSuvjT5VBe
	 95sW9T59wTKiarngMUf0OopKBgD62LB5tg0z60PHdBijdbIe+j5KBi308g4tZSUqJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yj4YR9oH;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E0606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8E0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yj4YR9oH
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793609671; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=VYmgVHZ+U4UM0cUUGa/+06lU+eYMGdR+rPvQ4FM59TY=;
	b=yj4YR9oH16T5F0LJttOnUnn//qEucbM7Y95uPVIf+vWmVzrq3o4rZj/ztBIZTKwxDMsPeeum0AkNQo3iPbDd+2+f2MuPX8SraeW271RSyQddyEE8+3ygjkf0CIoZW31B8hsOq4vTrdL66hpswfOklMYkEFs5e/LNltC8XiuKaGI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDwJN9y_1793609661;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XDwJN9y_1793609661 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 16:54:30 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/mm/thpmaps: handle carriage returns and non-UTF-8 filenames
Date: Mon,  2 Nov 2026 16:54:19 +0800
Message-ID: <20261102085419.696232-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org>
References: <20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org>
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

VMAList opens smaps with universal newline handling and strict decoding.
A carriage return in a mapped filename can split a header into multiple
records, while non-UTF-8 bytes cause UnicodeDecodeError.

Read LF-terminated records and use surrogateescape to preserve filename
bytes.

Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/linux-mm/20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org/
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
This is a follow-up to "tools/mm/thpmaps: fix missing mapping names":
https://lore.kernel.org/linux-mm/20261027074904.3328878-4-tongweilin@linux.alibaba.com/

 tools/mm/thpmaps | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
index a1a9bc30514f..f89568bd499e 100644
--- a/tools/mm/thpmaps
+++ b/tools/mm/thpmaps
@@ -196,7 +196,8 @@ class VMAList:
     # instance to receive VMAs.
     def __init__(self, pid='self', stats=[]):
         self.vmas = []
-        with open(f'/proc/{pid}/smaps', 'r') as file:
+        with open(f'/proc/{pid}/smaps', 'r', newline='\n',
+                  errors='surrogateescape') as file:
             for line in file:
                 elements = line.rstrip('\n').split(maxsplit=5)
                 if '-' in elements[0]:
-- 
2.43.7

