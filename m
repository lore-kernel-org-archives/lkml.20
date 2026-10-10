Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28F3DB339
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613007; cv=none; b=MtNlHiUTlP15jditbR1/4E7KVwEZIX0Z1cKbAArsbrATkggsY1p4j6R9KAq2S5gRtDyBwuZkuYIJfJQjeLbDagZeMUU5+zKui9YvY+PM+bxGLKHoQzzDFPsZIO1VO1Pz2t3P9QqzXQgyu/KKbgsFH2Ob+vBX7O+XXWXxNUgrVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613007; c=relaxed/simple;
	bh=dOkmOWCQC4aPN0KUbemmATQcntoU2zO6OAL23Qon6MQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WlKLo9W3Iuv52Q1eKxa2Bd2kPS2ojrbJx0qzkg+5JgFMbpgnlhSz1b6VzoBfia/9KQxe8eA1nS54P8yJNxfE2FfpW5U4lIUxeoei2r2IQP7ZxAvki5PBh8PfEUO8+p2YtFj93DuOjG+2zFVdJrNAwd1My1px6DFd0s2HqNJM38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-827bc69f686so5867078a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791613004; x=1792217804;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sbdTuGvDNSVK1VLcjYu9IQ0bQfysbq3FrmSsxT8FH94=;
        b=ufQX01eGLTLH07TRQOBbLau9eDzrch3jx0k7nUP1MDXBrLoOYQ7ZVbeq0Vt8oZKG07
         yJgp21Jd8ZeLEXhpBL217jpGlX5xXdHwk0wg444ZM+tCPA/u4xeFs7lmeMkyPbmGswwW
         cXh0GFDN7X68lf/BxO/Kd2dE9dUk00rvf4bWErhTcGCPwWU9Oj2y27hxP96iBKjohelq
         Ch6V8jR48MvJLzTZkeA85+C7HwQj2FnXu7WU/FWrrMfQfbwlbTVZRViwcl3rF7BpOLTQ
         Sgqyem1SSF7I958XWn3ttAKhzeYNUuyMEhDHnST0g9dQZFl6vxm9bcSq8SlYNcHnIlgW
         kGMw==
X-Gm-Message-State: AFq9FYKov2NzWvxrC9N46osz+cx2goBMtrPoGaNazRbfxuwDCEuZQlyQ
	E8+6JdvIaiUfXQajsAfDTvl77A775kBXX/oUewm+y1+HaPInwNJ6gRnKCUPYTWJFJSljbPJfabA
	u1W1rTd2pzzgXwu1DE2Z3QQJvSxrKA9miznBQzcsXVnfA3xN+LeDuilN3xKc/GA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250a:b0:4b8:4703:db91 with SMTP id
 5614622812f47-50b621adba4mr3054184b6e.26.1791613004435; Fri, 09 Oct 2026
 23:16:44 -0700 (PDT)
Date: Fri, 09 Oct 2026 23:16:44 -0700
In-Reply-To: <6a85402f.ae6ddae5.3da009.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac9d84c.bbc4c7f9.15faa7.0055.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_bg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_bg
Author: seedandsyntax@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


From 77bcfa549c94b68a2d3c78ac175b03650efbe31a Mon Sep 17 00:00:00 2001
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
Date: Fri, 9 Oct 2026 19:16:10 +0530
Subject: [PATCH] media: dvb-core: fix OOB read in dtv_property_process_get()

dtv_property_process_get() switches on 'tvp->cmd' and, in each case,
writes a different member of the union 'u' in struct dtv_property.
'u.data' carries the scalar commands, while u.st carries the
'DTV_STAT_*' commands, and u.buffer only DTV_ENUM_DELSYS.

After the switch, a single shared dev_dbg() reads 'u.buffer.len'
and 'u.buffer.data' via %*ph, regardless of which member the case
wrote.

struct 'dtv_property' is 76 bytes and union 'u' begins at offset 16:

    u.data      : 4 bytes at 16
    u.st        : 37 bytes at 16
    u.buffer    : 56 bytes at 16 ('data[32]' at 16-47, 'len' at 48-51)

For commands that only write 'u.data', 'u.buffer.len' is never set by
the kernel and keeps whatever userspace supplied to FE_GET_PROPERTY,
because dvb_get_property() copies the array in with
memdup_array_user() and does not clear the union. A large value (the
reproducer uses 1163001896) makes vsprintf() emit "field width ...
out of range" and hex_string() clamp the length to 64 bytes. The
read starts at 'u.buffer.data', offset 16, so 64 bytes reach offset 80
and KASAN reports a slab-out-of-bounds read past the 76-byte object.

The DTV_STAT_* cases hit the same shared print. 'u.buffer.len' overlaps
'u.st.stat[3].uvalue', so the debug output is meaningless even when the
read stays in bounds. The same applies to the clamp added by
60f0618d157b, which writes to 'u.buffer.len' and therefore into the
just-written stats payload.

Fix by storing the point of writing which union member each case
populated, and by branching the final dev_dbg() on that stored point.
Add a local enum 'dtv_get_shape' with values 'SHAPE_DATA', 'SHAPE_ST'
and 'SHAPE_BUFFER', initialised to 'SHAPE_DATA' and set in the
'DTV_ENUM_DELSYS' and 'DTV_STAT_*' cases. The final print then reads only
the member the case actually wrote, and every branch stays inside the
76-byte object. The clamp and the now-unused 'len' variable are removed.

Fixes: 60f0618d157b ("media: dvb-core: frontend: make GET/SET safer")
Suggested-by: Slawomir Stepien <sst@poczta.fm>
Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
Link: https://lore.kernel.org/all/2a5ea27d-445e-4ffe-9447-9d7bfccd4a36@mail.kernel.org/
Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 73 ++++++++++++++-------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 0286da57f..f4b599a1a 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -1342,13 +1342,19 @@ static int dtv_get_frontend(struct dvb_frontend *fe,
 static int dvb_frontend_handle_ioctl(struct file *file,
 				     unsigned int cmd, void *parg);
 
+enum dtv_get_shape {
+	SHAPE_DATA,
+	SHAPE_ST,
+	SHAPE_BUFFER,
+};
+
 static int dtv_property_process_get(struct dvb_frontend *fe,
 				    const struct dtv_frontend_properties *c,
 				    struct dtv_property *tvp,
 				    struct file *file)
 {
+	enum dtv_get_shape shape = SHAPE_DATA;
 	int ncaps;
-	unsigned int len = 1;
 
 	switch (tvp->cmd) {
 	case DTV_ENUM_DELSYS:
@@ -1358,7 +1364,7 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 			ncaps++;
 		}
 		tvp->u.buffer.len = ncaps;
-		len = ncaps;
+		shape = SHAPE_BUFFER;
 		break;
 	case DTV_FREQUENCY:
 		tvp->u.data = c->frequency;
@@ -1536,51 +1542,35 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 	/* Fill quality measures */
 	case DTV_STAT_SIGNAL_STRENGTH:
 		tvp->u.st = c->strength;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_CNR:
 		tvp->u.st = c->cnr;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_PRE_ERROR_BIT_COUNT:
 		tvp->u.st = c->pre_bit_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_PRE_TOTAL_BIT_COUNT:
 		tvp->u.st = c->pre_bit_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_POST_ERROR_BIT_COUNT:
 		tvp->u.st = c->post_bit_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_POST_TOTAL_BIT_COUNT:
 		tvp->u.st = c->post_bit_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_ERROR_BLOCK_COUNT:
 		tvp->u.st = c->block_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_TOTAL_BLOCK_COUNT:
 		tvp->u.st = c->block_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	default:
 		dev_dbg(fe->dvb->device,
@@ -1588,15 +1578,28 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 			__func__, tvp->cmd);
 		return -EINVAL;
 	}
-
-	if (len < 1)
-		len = 1;
-
-	dev_dbg(fe->dvb->device,
-		"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
-		__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
-		tvp->u.buffer.len, tvp->u.buffer.len, tvp->u.buffer.data);
-
+	switch (shape) {
+	case SHAPE_BUFFER:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.buffer.len, tvp->u.buffer.len,
+			tvp->u.buffer.data);
+		break;
+	case SHAPE_ST:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.st.len, (int)sizeof(tvp->u.st),
+			&tvp->u.st);
+		break;
+	case SHAPE_DATA:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) = 0x%08x\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.data);
+		break;
+	}
 	return 0;
 }
 
-- 
2.56.0

