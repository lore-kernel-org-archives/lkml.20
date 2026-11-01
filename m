Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562615;
	b=PAUvLJ8iJ240HkurN0DB2gQKlj1TldymsrKH8nAO7xe8ZO/tkn9c5HaiRbtrXkOXkQpJ
	 4Lo2+EYGvps49TaYzaUUQjNrmsA7UkIbaCL9Rko+WrFfdmhY9xc9kEizo3eV+fsNua6uf
	 XqC8KV2j/JGdpa5sDyEe2Z0arTgGW3oP0mGsY8hY6jXzH8vy9CPe3vOrmQGOshfOHQPhH
	 u4TWL5WCWn+KGEogU75Bi+qImCZNZ4ISxTgjRH2vfeISQmaBuy/Ky62LBOXuIbsR4u2Bu
	 tijzBsAW3chy8Qr9pktxUd1uFQ16vmDTDSRgwEGTAYnmdxqceTxqbNAL79LOwvqPXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
	b=bBmrtTJLWRzMrGdlzI1Cnro5hoTRypyW+YnRDVVsSYj/GAxtfRDRcRffqIx7xe9tTIVt
	 t8+QOpACidsNLzg5+TUfnYtmGaSiR7OyKjyi8B/qrS+WiXpCmG1GxT7abBCftG8ve631d
	 FQSgeij1RLyc9wv9/yaEVhsF2YwOhCDMM0s0W3Pn/L49Pb+xqyceXxTI58duFtGSHBMZm
	 2pYjFi13IJZqd+MhV53vYO/cuH2bYnQJWZktrmmRmjrj7Y5R2376CCsONdH8piXEYFqji
	 27zx0xh+oXl7RSCxxvVc0lgufVpPmRFJJDrXQ88suDQA7GH9mvw8kYooukSttLPaMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE1O5shx;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084C606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9084C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE1O5shx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14778095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562614; x=1794167414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=yE1O5shx7Y/VVSTKvIdgClnWdBdbLObRZ5Z/pmxyDuboLVxK9pUHztxUvwUGRwHCGU
         HZwb50k/0U67/F1ByyDfNGW4BxM1AUwH0jEGFHcViCJetjJLf7jz5Vx1+8NR8A+c5zZK
         2xlqNKcmzLTRwwvmQb/L9aDIIbJaCw6A1ntDVpSX9Oolqb8V8ne+i0yJ06DoHPVkFUlt
         c0E0u57HQ+EFHuf3EXpGax6Ahi5xdMYM15urZ9x5uK+wF5qI1Pif3Pa11v0ZuLH460kk
         24nxyqjjyL+fkkjD+FsKZuweWxiUiA7ItzFgLSVWYzbKUHDTmXP+RodJtfvhRPHnJt/O
         v/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562614; x=1794167414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=G/Kt6hJyQczpQcuZQMMuwbWUwrDVpb6gfy9tt9AWYbH1moKp6ngIXIDkxGR3sbGyph
         64v0QoOyfsYdND2dAKnw1pi0J0ME69rNeb6+GaZM3UlnErZXHp3YiRU8UEXcViXXUqzA
         3VvBLQkU9/vdH0BxbWtuKp6/dKEytoQiUITComCSARMvsh0/hDmDCHyceV4X9b7yyLbh
         Z+kF1tJR17fRQMOD5K1tM+2UC9ClAShyDWll6gftZc9SSuT9PK+K5Sa9y8EeGtt9uLDY
         zLHfC8zTcmJ01/Fp2htK3k/eNcthIzuKyz4K7fuxRudVzCByvmAmk1i7iL8NWlLuF+BG
         NVZA==
X-Forwarded-Encrypted: i=1; AKwUvBzPcCpKNWpve05mQiWvGt51CLSubYMB9pQWzgVE8031rfr8U8u4teitGeQUN7ZW43XdNsOL/XTd3pjQ0wM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt/QrysPnDl0V8RR97wACgq3XYHL9mo4ZLPzWnPA5IzO6RPklR
	1SfQsylDMxHDp+v8+4YLKW0uerCQehbBXPmy9tRGq5rJal1v/Ir0aFIf
X-Gm-Gg: AYBFou3xt7imWcwHEmX72pftAWK1ytorAjXqI+5qa3NdXa/u4mrJvTXldl74cjBrigt
	4mMpTu/qwgLYpfom0agx8BsCuufZSuGb7fBUxQ9xTkJ3dD/vPa5OFzefyCN+GNUUg3vNd9uLFHd
	t3S6OIxXdFzRnCYHwEyKYZeOY70OnMAvDnyKw045hqOrv5yjjtL985e208z5dfw2l2gKWLcHu7Q
	q74PAFUgh2vXvwCgC1P1x74/fz/pFGa8nwyEYAcPMFQI4z9emEZMEy8a/qSILWnSAPSi1enamvg
	vJHOOvTQU8ogjq4YYOp2wrpS0KxxKVAMV7OxBgvt2Q8TTj2VDvhizC74URn3YmuYl95n9NyFC2k
	1o3b9yobRBVWE23hDE9IzN9HXVcdLKcy5gWvqt/SbY2LS89EiCq7i8zYfPNrLA/RSBYd7Mu/mKx
	5WefkErMYE8KqyZRkMO0a7EjR29XohsPPN7CQuAD78sv4MS+Pia+sIzrDjlGAn8zYtaVI71R4Ga
	38XhW0XKMA2sXQFJ0PQwtUAOkKaCDL5PnWRxn2/1Qpga2go6XAdwDANZoT1BeR6BRdMFpnBFvtk
	VJHjRtskvZkrmGJ0E6m87CUscje01EkN11WYm4V4m26zj/iZHIEddNKCf9moqIU=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr187976345e9.27.1793562613875;
        Sun, 01 Nov 2026 11:50:13 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:13 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: vd55g1: Support control events
Date: Sun,  1 Nov 2026 19:50:05 +0000
Message-ID: <20261101195006.220657-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101195006.220657-1-fernandorimoli11@gmail.com>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
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

The sensor subdev exposes controls but does not implement the control
event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
reports:

  fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Add the standard control event subdev operations and set
V4L2_SUBDEV_FL_HAS_EVENTS.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 69ffb3a..162c2d5 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1447,7 +1447,13 @@ static const struct v4l2_subdev_video_ops vd55g1_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static const struct v4l2_subdev_core_ops vd55g1_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops vd55g1_subdev_ops = {
+	.core = &vd55g1_core_ops,
 	.video = &vd55g1_video_ops,
 	.pad = &vd55g1_pad_ops,
 };
@@ -1918,7 +1924,8 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 	int ret;
 
 	/* Init sub device */
-	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	sensor->sd.internal_ops = &vd55g1_internal_ops;
 
 	/* Init source pad */
-- 
2.43.0

