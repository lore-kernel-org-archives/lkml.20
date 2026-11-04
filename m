Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773018;
	b=lFG5LpslVJ3O7QkNkQ/X1hO6YRxhtTUkyKvCMGY30QAzYM3yEH0aH4KG9Hbya96er8EZ
	 RFhz34YDC2caxvbjl+/n1Afi957pv6D3f6K5zOEItuOuwswyXGkBP2PvjjLA+dy86BXpZ
	 jkVbAs9XcfJ2AXzipLK46BVQ6OAb+hYToF64RTwM/otq02IZQNHU2BmCMQHI9VX4QpYCx
	 pI3TsH1AqTAfHNuPc8mvP8shuon36Dk/3vZrUjVB4wiMxr0hlgl1oOlvSIuJiCZfCCTQc
	 GMYKQ37mAcFFB4ee3Q/Sg8JqlgGFT4CffI6YYED8HnPCWIktEvgaVGrsMqByuo6A6Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773018;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ic+f8fAiF3rnn/6l8bF3oaVZtUIPePP4Mud6dITzj/k=;
	b=3UeB5YUWZ55lPlhlEM+m7oGjezbiQVo6dlwZTd9EJ0ePdDlDYTJIOCS2/x7sVPbKzM0b
	 zbiIbJJXFj9N3s/BFdxtqSo7mlUHMYuxJ2aRQ9diyvwJ6MYA/rnNzWNuhZ2OiXAA3gKwh
	 TuZaxJrVbgJmZBCZk/M/cY7PrVGzTg1DeU2IPhwSCHpcjkGWjl9u9jGKM1/gz6JZ1w0mO
	 xQJDLDlQ4aDIixeXUX68979QX+LohpZ/4dOV8Dxi/l7h1KGJm5kBmWoD1EkUqnV8wGG1W
	 QG+JHXxjY5hiY+YJp/xVoo4Gt95Ojbx89QJ0zFML4P0H99uOAPEiWa35vAZWxmhfj8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="TF8/FEuy";
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TF8/FEuy
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793773013; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ic+f8fAiF3rnn/6l8bF3oaVZtUIPePP4Mud6dITzj/k=;
	b=TF8/FEuyUSEjyjFrAPHdh7Z00uJZJV3g3Ii1S7XAAJ+6B4wbzjes5gPYSoL3RJAw9v9J9kr3e0UK2oVd+BPb2T+kKwxV1AKcUMOPyGzVthuS2Xo8TnWN3OCrpTVro/GXPmY1qkpAbjY9q4e6M4Z4WcYjkNk6moO6cTikqQbdapI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R701e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XE4qK9Q_1793773004;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XE4qK9Q_1793773004 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 14:16:53 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/mm/thpmaps: handle carriage returns and non-UTF-8 filenames
Date: Wed,  4 Nov 2026 14:16:41 +0800
Message-ID: <20261104061641.1115805-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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
bytes. Escape filename characters that stdout cannot encode to avoid
UnicodeEncodeError when printing mapping names.

Fixes: 2444172cfde4 ("tools/mm: add thpmaps script to dump THP usage info")
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/linux-mm/20261101211644.c63a2028bbede0f763f41f80@linux-foundation.org/
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
Changes in v2:
- Escape unencodable mapping names in vma_print() (Sashiko).
- Rebase onto mm-new.

Link to v1: https://lore.kernel.org/linux-mm/20261102085419.696232-1-tongweilin@linux.alibaba.com/

 tools/mm/thpmaps | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/mm/thpmaps b/tools/mm/thpmaps
index a1a9bc30514f..0e17723515cd 100644
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
@@ -363,12 +364,14 @@ def cont_parse(vma, order, ranges, anons, heads):
 def vma_print(vma, pid):
     # Prints a VMA instance in a format similar to smaps. The main difference is
     # that the pid is included as the first value.
+    name = vma.name.encode(sys.stdout.encoding, errors='backslashreplace')
+    name = name.decode(sys.stdout.encoding)
     print("{:010d}: {:016x}-{:016x} {}{}{}{} {:08x} {:02x}:{:02x} {:08x} {}"
         .format(
             pid, vma.start, vma.end,
             'r' if vma.read else '-', 'w' if vma.write else '-',
             'x' if vma.execute else '-', 'p' if vma.private else 's',
-            vma.pgoff, vma.major, vma.minor, vma.inode, vma.name
+            vma.pgoff, vma.major, vma.minor, vma.inode, name
         ))
 
 

base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
