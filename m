Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453287;
	b=f8SvJG18Cx1X0FI9na4GTTbvRAQSt+ruImIdJIKbN6mZMUCHkYwexcP0HlyzQhJjzzuL
	 W9qqI7EW9VA9SbKhmJF12geNMO1Ti281eEKXoLdOEMgF94bR0kPu/a+axkHmQQOGF+HN0
	 5xdbJZvtOt5g6OTY7XPyvsQvZr1k+DzaAk0Y5WkdeRld9dpjCF3jbjPLic3ShzURzfRSH
	 uZnBj//r31VJm64kaMpW+3mH0fZ3WrnGBvpRNTDX81zz5z1aXdbJZAxmOUayP3kbj1dnK
	 4sxtj1kD3+GQ50Vn4bcuodcUnbIyMnOaNwggX+tigsjzLYGN/YwNHrmcheCsEUkPavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453287;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/30VWyBplrHuByc3jnpm/ewinby2W6T19rzhjR/lb94=;
	b=kgkc5DxnsGhMBPdrHwKj50CBYng1Y+wuB04t9+q6VO8LcoiUT1vVN0QP5lMsFxDYqKcE
	 NjQN+m9rVLgsFKkZ9TkECpuz0HllwVEqCpjkhhTOTfAFLJU2ef7pN3ShK7CBhNdRQYxck
	 O1YAfK5DUxpgkV+CU7In/nXemOxtpi+LD0DmuXpBo5Mxw6jWyVDY8IwyETC/W3P7GpPum
	 rJGPzSiNFgiNpUBYyLN1gMMvnYcJBLTv+1cjV6P4qwzckfE2lsSqqE+aZb9ZynunV3+Xp
	 GCNT6beHoLLS1Ct5Qtlg9VNttQVl+lCxcGr8O1eohutARGiVYI3cAimEOFF/n7LBvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ey1jhzMo;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95856606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95856606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ey1jhzMo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ey1jhzMoUiJ3GqO4Zw52/9rP5yP77vtL+oskHizqy+0Tsqp4q6nbD1HTIFU0pcqy3L3kBDOWaBW3s
	 eOaGCqKjmv7KZ9LqtVWUvwuOTpi+zr12xiiuq+/XyXkotKm9yK9pYkDL6uzwRx6/51LISbrRa72jY3
	 17evi/txqUCMBZq8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af52f21224-e2673;
	Thu, 12 Nov 2026 11:14:44 +0800 (CST)
X-RM-TRANSID:2ee96af52f21224-e2673
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af52f225ed-f0845;
	Thu, 12 Nov 2026 11:14:44 +0800 (CST)
X-RM-TRANSID:2ee66af52f225ed-f0845
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pmladek@suse.com
Cc: john.ogness@linutronix.de,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	paulmck@kernel.org,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH v2] printk: ringbuffer: Annotate speculative record reads
Date: Thu, 12 Nov 2026 11:14:41 +0800
Message-ID: <20261112031441.120773-1-zhujun2@cmss.chinamobile.com>
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

Annotate the speculative copies, line counting and length read with
data_race(). Retain READ_ONCE() for text_len so that the size check and
copy use one snapshot. The descriptor validation continues to determine
whether the copied record can be used.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
Changes in v2:
- Mark the speculative text_len snapshot with data_race(), retaining
  READ_ONCE() and documenting the reader-side validation.

 kernel/printk/printk_ringbuffer.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 46a79ec0940a..8a1075d00d0a 100644
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
 
@@ -1969,6 +1970,7 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	atomic_long_t *state_var = &rdesc->state_var;
 	struct prb_desc desc;
 	unsigned long id;
+	u16 text_len;
 	int err;
 
 	/* Extract the ID, used to specify the descriptor to read. */
@@ -1984,12 +1986,16 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	if (err || !r)
 		return err;
 
-	/* If requested, copy meta data. */
-	if (r->info)
-		memcpy(r->info, info, sizeof(*(r->info)));
+	if (r->info) {
+		/* The record may be recycled; the descriptor is rechecked below. */
+		data_race(memcpy(r->info, info, sizeof(*r->info)));
+	}
+
+	/* The descriptor recheck below also rejects a raced length. */
+	text_len = data_race(READ_ONCE(info->text_len));
 
 	/* Copy text data. If it fails, this is a data-less record. */
-	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
+	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, text_len,
 		       r->text_buf, r->text_buf_size, line_count)) {
 		return -ENOENT;
 	}
-- 
2.51.0



