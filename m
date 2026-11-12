Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450584;
	b=t54FtLBipW9zS6+ENc0ghPeYNykyzM3MuKggr2OF+xEYKVu0vGOiceXWMm1DmB0SsK4x
	 NOTl9CpcX2rCKZy88QzUQEhPmHHl7mu9eX9a+ymq73ERyTIkne+z3+TGxnnGvYIfL/MY+
	 RTKuSYVqSBatKC6FtCU+yGmAWqGCd4uvddHY61ED/cGwHas0ATVfa272dND5AN5r0g7/Z
	 sjvJW5oYNv4NLv8W9ELYIU4ol4NomAyCfjRZH0XZB9LR4WQak6Lm3NVdzv8H6Gsa6RQlV
	 LNsRjweQyz3Q3AiotnpC5uSNvw1Muv5YvVPig2gW7ZtcRJ4Xq2KdH5XckA7gDsvgwDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450584;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3iloLVp+MdOfHSiAG7FWE9RZU0xMne9BbzFysEHDF+4=;
	b=E14MnBdn/iOkrp35bEfo3pzGcbV6R8YnM57/DWJKaue3PByypA9O5pLqlhvLUJqTqUBT
	 XXDn9WDJAVw04JUS994RbiF3M9aBFA70JiItT6Zn3Byq0EUNSimXSQf7p9eEen1Co8Zhy
	 8Oxsi994H1jAt7e1Gx72xJ0xKk2SarBpjzxdlDiKhEKGPeXepeWpoSZaL28q4eIea8uje
	 wGQVxdno/l/yeDtaHe8V86ILYV8OC+mij6hit5BHBerYVVhx+zwr9QmaFFYKwdppe+/sy
	 41pQ9SW+pODJGjBgQgAwvoubUbJyNXc/B3cq8DVEv8kaSzSlYzjP7hftyf8bNW5nUWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=X+EvqbIE;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4479F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=X+EvqbIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=X+EvqbIEcbQ2M4ftPqcIwRjuDnGa/LYANqq9oNal+OR4EMTFQXAycmbivOhBy6prQoNECYKIzdR5K
	 iIp5l6V4VTaRNwdvZO31xtwP3PISeYQ+V53VompU2OYVEw0AdHIKhe7RWciiJ8JdcZBDmYU54b3TO3
	 9QrAUTNv2hloesSE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af5249106f-b85ee;
	Thu, 12 Nov 2026 10:29:41 +0800 (CST)
X-RM-TRANSID:2ee16af5249106f-b85ee
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af5249318b-ef5a3;
	Thu, 12 Nov 2026 10:29:41 +0800 (CST)
X-RM-TRANSID:2ee26af5249318b-ef5a3
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pmladek@suse.com
Cc: john.ogness@linutronix.de,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] printk: ringbuffer: Annotate speculative record reads
Date: Thu, 12 Nov 2026 10:29:40 +0800
Message-ID: <20261112022940.118080-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

Readers may copy a finalized record while a writer recycles its storage.
prb_read() checks the descriptor again after copying and rejects records
that have changed, but the plain metadata and text accesses still trigger
KCSAN reports.

Annotate the speculative copies and line counting with data_race(), and
sample text_len with READ_ONCE(). The descriptor validation continues to
determine whether the copied record can be used.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 kernel/printk/printk_ringbuffer.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 46a79ec0940a..077721608099 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1894,9 +1894,10 @@ static bool copy_data(struct prb_data_ring *data_ring,
 	if (data_size < (unsigned int)len)
 		return false;
 
-	/* Caller interested in the line count? */
-	if (line_count)
-		*line_count = count_lines(data, len);
+	if (line_count) {
+		/* Racing text is rejected by the caller's descriptor recheck. */
+		*line_count = data_race(count_lines(data, len));
+	}
 
 	/* Caller interested in the data content? */
 	if (!buf || !buf_size)
@@ -1904,7 +1905,7 @@ static bool copy_data(struct prb_data_ring *data_ring,
 
 	data_size = min_t(unsigned int, buf_size, len);
 
-	memcpy(&buf[0], data, data_size); /* LMM(copy_data:A) */
+	data_race(memcpy(&buf[0], data, data_size)); /* LMM(copy_data:A) */
 	return true;
 }
 
@@ -1984,12 +1985,13 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	if (err || !r)
 		return err;
 
-	/* If requested, copy meta data. */
-	if (r->info)
-		memcpy(r->info, info, sizeof(*(r->info)));
+	if (r->info) {
+		/* The record may be recycled; the descriptor is rechecked below. */
+		data_race(memcpy(r->info, info, sizeof(*r->info)));
+	}
 
 	/* Copy text data. If it fails, this is a data-less record. */
-	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
+	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, READ_ONCE(info->text_len),
 		       r->text_buf, r->text_buf_size, line_count)) {
 		return -ENOENT;
 	}
-- 
2.51.0



