Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858202;
	b=khfyxMbmOTykfjb9QUXzMVcN8hzef+48ty4ge2XatF8OkEHim929XTpM0Ywiw6CPzoj8
	 ryrMGdoHJgx7FroJBwxzOB1/TNXGEkkbKD2cJx2dxEvBEQkc2EKs1qV5hcmIs3cwjjD75
	 sML/CBZsSxthadVE5c/ZcxWUvW4CvjFgPOgIUrqOtt9899jCRaglaQaqAQVleWb+ozeZr
	 rT3E/Y//ePhjkwTn26pSbOuJi7OY5OPF078CONWf+oaBkRFWmL2blcz3wJ2qO7SvxBzut
	 w3YkFq2jLcHRB7Q7Ar3Dz9no6VFLLh+7t3HBi5QqkaKaVoW6+UcY72zguW4GPdCeMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dOC5LHS2AgqTFCevtv/eDNStKtT/WCl/fk0wy/PN8GY=;
	b=VYwqO3iq5rpAwrKFDLgVDCYonLnVCtioTH23GdhoFjOyUEeIM60WwTp6lyWJEk/cdtGc
	 W41kXUgIiylnuf5q0W3F+MQhqDZ+euIlvAKJZf9HZsZWXBncbvGvxcPzO1udwfAJc35PI
	 Un90mjqLJgNmgKfWuXPfU3P1+6sB+h9tb8Z/PFdI5M4NDm78M/oXSyoSgnIoBX6Uyx+pX
	 0CIWkFqTgohtMnhddhO5aFxe18JJvyNotOIt2JIttDfDXPaVZ+zUROoFFMnsyzqVgMvQ7
	 4wH20x5gY+AOmo2u2s2uA8wEFjiM1nA2/UlFHp6XM/+AONZ7krnpSNKHoR3SYZXgsXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jB5awBw+;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4BD606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D4BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jB5awBw+
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so679972eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793858201; x=1794463001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOC5LHS2AgqTFCevtv/eDNStKtT/WCl/fk0wy/PN8GY=;
        b=jB5awBw+C9xm6EEBZHy4oY+Dh7gHGrUFsB/o6uY82kIVlhMLfTBW4BfArKNsTlNJGi
         kfphK/0LnVUTjLFEdDkMNiaXxiU6xY6W/iKnP55j4sLRfkMcf2vv9S+pvsk35u1DM20I
         wClDnMaOJHYOpyCI8JSUUbJixIbTfcdpSub94s/imOl9T/y6PDvCpjXuWrLLF1FZLiBO
         I/3w+Gl3ffSHV9QYdvdYlo0WOV35FHx8Ali+qCIdME0d+1ayOCTPSmzhTMJkrdP64Msb
         3b5Yd+dj8masfaZlzz0n3ggkSQW/8klkcQcGElVoG53REwJeKJr/W7UF2gV9XhK5FD9D
         pdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858201; x=1794463001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOC5LHS2AgqTFCevtv/eDNStKtT/WCl/fk0wy/PN8GY=;
        b=gY2Jvg9ZzW460X5Y8wJlt0sJ3BlGW4aatCAMFq2QmCeybQYLyjGNjeDlEzFi/thShk
         eafsBVe63fZWPOFcSY54oq9wR42wu+fF8KZsI/uNBOQeE3dsGCTFH+9hZcMh4DoWnaJ7
         +Wg038WTZViG5EuniGofAaGiuVu5mKy9OGdm8u038RRz8gfsMN4KYQi3vaDSnnm8pkFP
         MJjo1bRr05KaZE70uho4vZCvC/wXn8ogd6+BBSWV6LUkbl9zk5nT/Hz4W85/fmcLaOcq
         Ql7lCAGH2Pr74cFvFG4ZzJEGE+Dd5K2RMsQRYuiGhxwfR23G/ugQDrHc3w3v1qdg03Oo
         qZAw==
X-Forwarded-Encrypted: i=1; AKwUvBxGFL1vo4HvuG4yhyLTtJ/2FUMgBgxkGFTYdxSSoOsgcUqKja9BWDifXlqCYNNulaF/AkNRc6LsdSWeaCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HQocSJPi7sqjkyMAq3PFFvxgiElJ8nycorNrfdIpOobqE6p6k
	QEJTQs6ay0HLW4h350b2EtOmn6HkJm1cOLjXjNU0HKgmT7jbyv7qZ0U4
X-Gm-Gg: AYBFou03FZ0cGcCktheaItBsB8Ooiyz0e8L49UdDBvjuVHxnwf39CG536BKl0qLgOE0
	cbG4UwWDu3QQRusCILtoaJaLCWrbfi6G4pENJBVSOhTlVuQQIhBwgtILi80CMsUuQnHVff2a2al
	GozpbSSGKVFDHarIiQigoakSClIUWW0pjXppoHWtLjX6t1XuP/Nbcy75yoToKWAvOf7i7pu94yi
	Ni4VwVM4E4sCHCiy4kHzZ55Mol4/+a/n25aLbHgQ+jaOjY3UENjX7vLZhnxushIGh8nKVbubHKS
	jzoGE0OPoRYMBW+QYNRufyCWvZ+Uhkh7ZhrS8/STNMJVhWd6BxDMsrxVNXEN+7ho/3db0wWPqaa
	yJ8bAmpEPR8/i1Dql0oWlSuu4a9znx5vTmLC7cvOyJTf9KUIlnVt4SJV5iP6yCGnNB3GhUwmxmY
	+Ol9DE41cbwmhfYGS4LrI8t/Sk2Ytak09rxwu8j/zwpG0ZFzSXOY+npkItu91jdIQZv+yLHrSxp
	EOwhdjOyvob5G7Cb01xaZHVKWlIbRWkbXVsWvBJiT7i9Kkxtg61z9lM3mC04hGx1Raf40EbV4Qp
	hCWP6wPpYkJTf8uDnGCrUnJLWFDClpss37/Or3Mo22M8omSCmaPAbgR5IjO/5pA1z64B1bjiKft
	gm0P0PPvLwMqTkrJds+ostAsra/AVYJwgbS62iw==
X-Received: by 2002:a05:7300:5626:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-36d3c0fd4ddmr3962427eec.5.1793858201254;
        Wed, 04 Nov 2026 21:56:41 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm15780167eec.2.2026.11.04.21.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:56:40 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hughd@google.com
Cc: david@kernel.org,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] shmem: skip empty unmap ranges when punching holes
Date: Thu,  5 Nov 2026 05:56:19 +0000
Message-ID: <20261105055619.58289-1-dennylin0707@gmail.com>
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
Content-Transfer-Encoding: 8bit

When a hole ends before the first page boundary, shmem_fallocate()
calculates unmap_end as -1. Casting it to u64 makes the range check
succeed even though the hole contains no complete pages.

For example, punching one byte at offset zero calls unmap_mapping_range()
with a zero length, which means unmap to the end of the file. The file
contents are preserved outside the hole, but unrelated mappings are
removed and must fault back in. This can be reproduced with fallocate -p
-o 0 -l 1 on a mapped tmpfs file.

Keep unmap_end as the exclusive rounded end instead of subtracting one,
and adjust shmem_falloc.next and the unmap length accordingly. A hole
ending before the first page boundary then has an end of zero, so the
unsigned range check skips the empty range. Retain the unsigned
comparison so rounding the start near the maximum file offset continues
to be handled correctly.

Fixes: 83e4fa9c16e4 ("tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE")
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Use an exclusive unmap_end throughout, following David's suggestion.
- Add Baolin's Reviewed-by.

v1: https://lore.kernel.org/linux-mm/20261027171753.1485-1-dennylin0707@gmail.com/

 mm/shmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index af21a89abb0f..ce92e74baeb7 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3845,7 +3845,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 	if (mode & FALLOC_FL_PUNCH_HOLE) {
 		struct address_space *mapping = file->f_mapping;
 		loff_t unmap_start = round_up(offset, PAGE_SIZE);
-		loff_t unmap_end = round_down(offset + len, PAGE_SIZE) - 1;
+		loff_t unmap_end = round_down(offset + len, PAGE_SIZE);
 		DECLARE_WAIT_QUEUE_HEAD_ONSTACK(shmem_falloc_waitq);
 
 		/* protected by i_rwsem */
@@ -3856,14 +3856,14 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 
 		shmem_falloc.waitq = &shmem_falloc_waitq;
 		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
-		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;
+		shmem_falloc.next = unmap_end >> PAGE_SHIFT;
 		spin_lock(&inode->i_lock);
 		WRITE_ONCE(inode->i_private, &shmem_falloc);
 		spin_unlock(&inode->i_lock);
 
 		if ((u64)unmap_end > (u64)unmap_start)
 			unmap_mapping_range(mapping, unmap_start,
-					    1 + unmap_end - unmap_start, 0);
+					    unmap_end - unmap_start, 0);
 		shmem_truncate_range(inode, offset, offset + len - 1);
 		/* No need to unmap again: hole-punching leaves COWed pages */
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

