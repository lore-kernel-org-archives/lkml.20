Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829913D9DDB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555817; cv=none; b=q2uMte3/8MIRv6WoB92+IJjiHGy+oCL39o86bUyoZjOSznzxvwh0L/6Duy1tvtoWLIJDliIg2OCG3NYREtlnbZeJb++7eadZ6NGOPLnT2tnwepn0rYrVSWute/5T0Q5WcXJvJJgQNy4qAXqxogeKx325NGAubS0e/n85/waE+qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555817; c=relaxed/simple;
	bh=/6LUW+j3zISrC3zDmKTf2zpa7V849gZv42gCk7LOMFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4djvmH6E5fffCurREPmdfOdNJYmJCNrEpGuge7fAzvbK6yPFXo0pTeO2oCCgBy8ZqTYTu8I/HmjqIzQKG8XtUda8zn1A+hGEQs3X9kSrCJvIUB/YScz5/uvVOxfeKqV8XYXMTFJk6Mu+bwiz+HrIvpfDyFtvx15NHDSAa4zKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjCGqSyF; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjCGqSyF"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1649611eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791555814; x=1792160614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj5ZGPYDc8+BnuBTFqzv+vqOHduFDbEPmpj8Sqnl360=;
        b=hjCGqSyFNHYM0cVzrncPkI+H7hZLfcNe0/gNtA/H58I00uiMzg7qzmSkxLj9b+4jAF
         F2Kray2RN4UgdB31bkxac+nKT5JL+TJNc1zyM4tpyplyZcvyY+ReKipYSMOBWf0BBrl2
         NEsvuuU32XS6nv1cUcWn/bHWUfCmx0LOZJ30ewPYtYKu42Z3zvCVI4mdpn4HfJkdzwqA
         YBN4n/iimsNLIBw7EooLDTULTU28g/pdUAxxVxr+d3HuqRuvwt2BOlu0DfDv12HjS10n
         elkFLLilk1nj+DtTsXfz12R8XQG0dPohSNSEh0BJ63szg3Cr0WWDUWjqVE2UrFa0xGdC
         9gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555814; x=1792160614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj5ZGPYDc8+BnuBTFqzv+vqOHduFDbEPmpj8Sqnl360=;
        b=o/uZIsnSgx4GnwvO0szl47Rutjse/p6eIqPRL+n6T2Nrbd9iRQcWD225d0MQ3ezg/z
         lPjMJDLKgZ1xZIjt5SjroAyUU9iRNwyxf3nk5bCFBlT06OAGdBnMfCbtXOTOyc+E6FdP
         MUfbwyuOhpOrjoUk8r5AgbMh1+CmutrHj/8OWkINqjR7kQWHITh0X14eoaSExkmFdNzk
         2EH9U0/Zmyv7qq93YNgalt3T4Ms7NCLncvEpWjSuJ6YPoNumwXxmNnRjJpAK5WGPUQkJ
         mNV59/mdhiinyx2hyewEg6QJL3sTME6VHZrTCL37LmawziyhKKkCLlZfEoyCGsHGhVcO
         GI5Q==
X-Gm-Message-State: AFq9FYKI4/DppshbePu+kOL3t4O/N2cjrnqU6dimPSJ/NAhPMtemBnkl
	1WwRwyh/e7wm5pMSvDljkxSLMwtJNHkTKuSyBEiitX48ABRQ30htEh1M
X-Gm-Gg: AYBFou27iirOJF6BPjhUlpOVJiR9+W+jc8CxK5BpRR7Cq6fW7aOGyvkt7A8JtyR2GaM
	BMZ/eKckbFdC2xKYdVd2YfmbllYNX7kFc+E7S89WsvfX8GX/yBTt4plFalsMWGy27IrrFEn86Ga
	t+xUkTqWdUG3lTtl2hCyL9R6hYakslkVk+GUCGAcSyzA9Xda2UO845hVBZOhgTyZWTDNJMgEd0W
	ALArAiL7gL/TAvY8xV+uqxbjYG3rIgjBck1hqn3K2T4zYu8EVJA6oUoGgnXvINt1f4DmpJvhYno
	U/SUVqhZxmH0QxhsXgm9YWCQZN57wKJeUtpHyXawqfHD7lYlK0d6P2+UCN5YHXOg4Rk3PeX2eoE
	KiN9Jwil4RhHLqIM5RBDJD+OdQflo7MCyey+lH1K8oG3HMSFEsdarnODwsRFdP3J3zYn7fRtuvZ
	pQVb8zQicHQPAbuTnIUYrc11NFILqBtZw+CTYCXGwwPF4o4JOylDqje+NijaIacbvtXifxsbPKC
	GRXM9OXEyHinSIKUUjxtxQ=
X-Received: by 2002:a05:7301:797:b0:353:7e28:9c58 with SMTP id 5a478bee46e88-3537e289d93mr2932453eec.41.1791555805307;
        Fri, 09 Oct 2026 07:23:25 -0700 (PDT)
Received: from fedora.tail44843d.ts.net ([2406:b400:66:1bba:a266:257f:3c5c:90be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm6534357eec.29.2026.10.09.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:23:24 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Slawomir Stepien <sst@poczta.fm>,
	Mirza Ishan Beg <seedandsyntax@gmail.com>,
	syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix OOB read in dtv_property_process_get()
Date: Fri,  9 Oct 2026 19:53:03 +0530
Message-ID: <20261009142303.166373-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

