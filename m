Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A69345EBE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710282; cv=none; b=kFn2Zefgve9T+Phzq7HbIDslUci2MOr6zVwkySBYdGHdlEfukb/4LYnfyNu8LuBTZLa/Vo0npKElUW9qEncPfKlC2093ke5eHXAYDHtcGW8j3TFP14Od6q3OS/zJijuY9KLpuLofGV6I0ZryVgeGy0tEWvhVowcEdZXLHWN5Jsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710282; c=relaxed/simple;
	bh=YN5hIQRi4fFDX3Z8t+BlV5hafORfa5oeUTFd291dM1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOHpIfpTU+mh7V+ckxSRfkxx4DblGxIFOZ0DzjZyaTUV/WNYyOO1hCjXNApXRMiOSN+Ki8VcmU4J67Z16Tf8jg71blIo4iFj6TBL7RJbhexrKg2TUp6CfY/RYBNstp/RyZv8YatFJW6dp3TcUoYz6QwxACql3i0pV/w73zSSt/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ5xD66X; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ5xD66X"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc502d509c0so183338a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710280; x=1792315080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpCR3yBNcNg9QGBO4xhOrhwr8waCzYwolbbUmJ4Af+M=;
        b=mQ5xD66XkdMV1Tl/AgBeaW1sldCgoVBOFHXhDg1wlhnPHOrkqecqrstexUffUw1vVA
         rkc6ZA2hCpWw1Wsj35qcWtgOAa7sD8rzvZ2ByDIW8vDF+dNBbMd23NfkapKJEKyo4zBT
         gxk118VbU5wp/ZiGDjy7ZDBpvzwDtMEH9eoOKZ+5RIxeVEZBgH2nCgPa3+/R3bzcZIPW
         7D2D2g/OGjlQh4inCWAA7NSGzk+PXHfOT5ijzXsv9YDHkQeVJxIfXLDThioFsiSkGIWz
         muM0Fxixn2+MtDMQMQu3KTrpSG6cUH8CrZdj7y5GV58y9S7R7W97ZKBejik3jHOa0SvK
         ImsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710280; x=1792315080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpCR3yBNcNg9QGBO4xhOrhwr8waCzYwolbbUmJ4Af+M=;
        b=XdliWIuRXpAhA3DLIPzsRy/+ssUDfW0p228/+GLWI2Bin1GZiprATiaq6/QCUuhjqe
         7iQcvfj0GABQDHjwOFXeSRS4nOq+MKmAA3+r07CCcHAhbVgTbxt2IVsPT+Jj+Xo3tHnU
         d3p+pshwztj5xWdXCEUfF9ZKJK/c7iYonFTPI66ta1Hn5cv0QZXacuVAbzEARoBcyQne
         uAY7K1NQY9rK7XAwPdb1xmBfxEHfD3GuT8NowAAIzQpgUF9UU5I1yCLn+Kq+UjH4Wxwx
         v2LlcrEohkwwpXDqUtVxczZrAiX94yPtfPkmG+2IzFNh+407FRR8pk/C8/Bh4WRsQodu
         mrWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjE+n6o0CFhpI4I+eVrRpOjOptWNk6BWu78SePllalwkCT2p+0QicYvUxE01IXL1MOI0uoymRwhNp+1hs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzG9rDM1+I7HbFIycr2uOs+R20Y1MA8103+bVKlJO6+PePWVlL
	lDygaaeQYA2rjpADWt38L0T1H7Id4C384cuxypL56oDHSx8evFW/xJY/
X-Gm-Gg: AYBFou0ViwrPmiQuZqpSA2iRu+Hnt/jDRsRX08wu7v74bXjBvd5IQ/wFnutLfePwWGA
	Y3bNPp23h2rJYeIlr8N5ByEGpe9MJj61fAmc/TZuY1oLxmHF8/fd7rO/VZ6rOa7y6O5OLhiREte
	0PRzZTYkGgl/f+CwxKWgsLU3GJc3kAYwGGRya++iPMep+ppT3kjQntI6pT2WP8MaHnmLmm8umUB
	ka4NxTkhAEeLK754cg8vZ1DUF/rlpiV6TesZ40HZOP5icDFuINxoMPa9t1QmHotS8t48uzNZDG9
	24R6OekeOOGldtFmpliDSKi34eAqcSsYw/R1HT5FR8m3XLvQx4vMtY0LsN/Sn9lp0HhqCdxqdua
	5WC+eMwWWxhrxq1L94rx48GoqVKn95eq52iF8bcdmDbicnihtomy4/CnRm6WOD9OsjiPCFQJDO7
	U1vdzU4tc3V55dPxzLKCBcHRTB9JgFKdwECJ1Y71kraw0IgLuFw6qefUOnXvQV9y43eHP+U7Tif
	QKQvG4/C0U=
X-Received: by 2002:a17:90a:d444:b0:3a7:250:3342 with SMTP id 98e67ed59e1d1-3ab3a8e9be0mr5374880a91.43.1791710280415;
        Sun, 11 Oct 2026 02:18:00 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm9628592a91.9.2026.10.11.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:17:59 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: [PATCH] printk: mark racy data block id accesses in the ringbuffer
Date: Sun, 11 Oct 2026 16:17:55 +0700
Message-ID: <20261011091755.303723-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

data_alloc() stores the descriptor ID into a newly reserved data block
while data_make_reusable(), running from data_push_tail() on another CPU,
may still be loading the ID from the same area. The code relies on this
race being harmless: a stale or garbage ID simply fails the descriptor
lookup or the blk_lpos check. But the accesses are plain, so KCSAN
reports them, and the compiler is free to tear or refetch the ID.

Use READ_ONCE()/WRITE_ONCE() for every access to the block ID that can
overlap with the lockless reader. No functional change intended.

Reported-by: syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8324b8fd984b86905a66
Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 kernel/printk/printk_ringbuffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 85c0c854b3ce..86fe71211de9 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -605,7 +605,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
 		 * sure it points back to this data block. If the check fails,
 		 * the data area has been recycled by another writer.
 		 */
-		id = blk->id; /* LMM(data_make_reusable:A) */
+		id = READ_ONCE(blk->id); /* LMM(data_make_reusable:A) */
 
 		d_state = desc_read(desc_ring, id, &desc,
 				    NULL, NULL); /* LMM(data_make_reusable:B) */
@@ -1113,7 +1113,7 @@ static char *data_alloc(struct printk_ringbuffer *rb, unsigned int size,
 					  next_lpos)); /* LMM(data_alloc:A) */
 
 	blk = to_block(data_ring, begin_lpos);
-	blk->id = id; /* LMM(data_alloc:B) */
+	WRITE_ONCE(blk->id, id); /* LMM(data_alloc:B) */
 
 	if (is_blk_wrapped(data_ring, begin_lpos, next_lpos)) {
 		/* Wrapping data blocks store their data at the beginning. */
@@ -1123,7 +1123,7 @@ static char *data_alloc(struct printk_ringbuffer *rb, unsigned int size,
 		 * Store the ID on the wrapped block for consistency.
 		 * The printk_ringbuffer does not actually use it.
 		 */
-		blk->id = id;
+		WRITE_ONCE(blk->id, id);
 	}
 
 	blk_lpos->begin = begin_lpos;
@@ -1212,7 +1212,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
 		 * Store the ID on the wrapped block for consistency.
 		 * The printk_ringbuffer does not actually use it.
 		 */
-		blk->id = id;
+		WRITE_ONCE(blk->id, id);
 
 		if (!wrapped) {
 			/*
-- 
2.43.0

