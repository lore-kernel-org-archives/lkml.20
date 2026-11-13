Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556245;
	b=43f1AZxIQ+lZ4FcgjKB47eQirOI3pammbpIlrZaUO2W4vasj40TKxN3JCg1GupxUzDUU
	 ufx0vM1DWivryxrAGzHDcu67ZoO2IOCWxu3rhvqdhhfEOtsiSMA3XBdW7xsrUeW5oLFKW
	 gU21rSFdt3psuDjYFYadVs3zjgHrcw5o06pUaZFbpPMtoGQb4YpZmznJeg33H/7RGGnoW
	 xfD/haF5793V/4QXqd9hkEUo1TCQq4fVztugVMHOC30HVpowgrlPK9AnQ80JlSIO/pvLE
	 7y7LmfMfZ2QbjrQ2mlTD1yCBsg7npNhz0+b5DNBZi89Nu55rYbneYGyHXGe+VRqV72A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556245;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KwPhUcOErJIrsiBQ1/zpDZ2+QQBH7o/+ZMZ3ZAjgmc4=;
	b=C4m6jlVrOMIaQ8jqU5RPvcu6PWPnqLSv0auwB0odHEXnSeeZZeOTsk5yTF5PSymYWZ5i
	 r6qLASf1jdSQy4BvuN1xabCtRG1SUdo6ZTZD0NltfLqzGb2lmSY3v0hktWbAx7XJzEaXE
	 iT81ckDeE1utLjTYaUBZMfrFxJvyza5Q05APDQt8z+p+v5ZV/M7j6wprTnfvfsESt+0Ti
	 p2YYsiAcMyPRyd5bbPKr7/OmVqcgUGa/k25sSOUa5rMX7XZjsuumA/FfvGo7XkBt4Ft1F
	 TkS8Sx+PNOduGMDiszLWvXW8+MxGWpFU4qdQRxrEodvSOwJLNsL1gXaGhjX/j1tU2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YqT0VwHI;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B682A606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B682A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YqT0VwHI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YqT0VwHIB0giCTUvvUm27XFGpXsSbp0F7DQ7gE0JQYFIukXnGgIG0M/SGeDmVwnAMBW+LijmYDSaB
	 GrJry5smEGmHYzcGiXcYWEGPvZ+t0NNVsmbm7V8yKEi+38w66XLpvJgGwHClDTNurCdYiUFZ6Ij2NC
	 r0/q+kS/sL//aHNM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af6c14fa2d-e7193;
	Fri, 13 Nov 2026 15:50:41 +0800 (CST)
X-RM-TRANSID:2ee56af6c14fa2d-e7193
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af6c14f819-1d082;
	Fri, 13 Nov 2026 15:50:40 +0800 (CST)
X-RM-TRANSID:2ee76af6c14f819-1d082
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pmladek@suse.com
Cc: john.ogness@linutronix.de,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	paulmck@kernel.org,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
Date: Fri, 13 Nov 2026 15:50:38 +0800
Message-ID: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
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
data_race(). The descriptor validation continues to determine whether
the copied record can be used.

Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
Changes in v3:
- Preserve the original comments for line counting and metadata copying.
- Use data_race() alone for text_len, as requested by John Ogness.

Changes in v2:
- Mark the speculative text_len snapshot with data_race(), retaining
  READ_ONCE() and documenting the reader-side validation.

 kernel/printk/printk_ringbuffer.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 46a79ec0940a..e1828eda0e0c 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1895,8 +1895,10 @@ static bool copy_data(struct prb_data_ring *data_ring,
 		return false;
 
 	/* Caller interested in the line count? */
-	if (line_count)
-		*line_count = count_lines(data, len);
+	if (line_count) {
+		/* Racing text is rejected by the caller's descriptor recheck. */
+		*line_count = data_race(count_lines(data, len));
+	}
 
 	/* Caller interested in the data content? */
 	if (!buf || !buf_size)
@@ -1904,7 +1906,7 @@ static bool copy_data(struct prb_data_ring *data_ring,
 
 	data_size = min_t(unsigned int, buf_size, len);
 
-	memcpy(&buf[0], data, data_size); /* LMM(copy_data:A) */
+	data_race(memcpy(&buf[0], data, data_size)); /* LMM(copy_data:A) */
 	return true;
 }
 
@@ -1969,6 +1971,7 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	atomic_long_t *state_var = &rdesc->state_var;
 	struct prb_desc desc;
 	unsigned long id;
+	u16 text_len;
 	int err;
 
 	/* Extract the ID, used to specify the descriptor to read. */
@@ -1985,11 +1988,16 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 		return err;
 
 	/* If requested, copy meta data. */
-	if (r->info)
-		memcpy(r->info, info, sizeof(*(r->info)));
+	if (r->info) {
+		/* The record may be recycled; the descriptor is rechecked below. */
+		data_race(memcpy(r->info, info, sizeof(*r->info)));
+	}
+
+	/* The descriptor recheck below also rejects a raced length. */
+	text_len = data_race(info->text_len);
 
 	/* Copy text data. If it fails, this is a data-less record. */
-	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
+	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, text_len,
 		       r->text_buf, r->text_buf_size, line_count)) {
 		return -ENOENT;
 	}
-- 
2.51.0



