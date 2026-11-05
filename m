Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868325;
	b=dMe1DvM8Kw21u54OEg4xiizHOJrZkOA5Y4ucd25UlTdOR5c24AXoFLoa/CduN3AGRqrK
	 +BswP6pbXwyXWeUJRtBiJOjKwN1khRZddBHFlOT2Y3LRJPub4c8xnxx9rWtc5MBrkkd0s
	 1IsCBpa6aJxM0wTtpFKYYyaZgpXucNWFbtdCJE5BCWNBu7L4UdsbaZ7B90B/HrRzlYvWe
	 Y7WtAB2nYQ98IBU5d1IXyWLmYbkF3K1U4JnaiUnwkU3Jpg0dxNHYRta73phwsJTCiwqwc
	 vTzzohxbhCdjeOivZNKhKz7PWTpl3BsKVXZnYJ/JoRdJFmmvmCEX/lRVray16o5AdSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
	b=Yk84PU1Ju7JUL7JIEzMGqHl5nN8+talb2016Q8tfau+IdrRx1RRxAVnMZzUgqEETSQ+A
	 lOR8jfZYY1HSop63NsEDKwzqntIDFQM0ejyNZJ6wBOXJ2Mo7uNhA/Y1sT8jNj89qaV5i4
	 0AWaww+IlAuy7lQMkZlNJHTQ3jOyhwsLrktQM7eOTQjm0ijYJLdECw4A/BnAHpvL/u1pu
	 KZ0xJ+6/iNONStPEd3Unuw0Sw3JXzq0AN8KOzDlzpQ2JawjUeJyGk3kAgY/7X/htLWg8B
	 Cl1T+xoT9CzA5Q2lRl4dQAzaqbUUod33M4DccHeJoszMEKTKiLSXQdL9CKUlcMWMzOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1RJiphd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83908606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83908606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1RJiphd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso4543169eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868325; x=1794473125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
        b=M1RJiphdP5y2FZbyx2CNnpLv/K9/cAK8GR5d8bYeBrKMIDmoTfDJJeGZnzw+tVC5xQ
         1ZZGNtTPK/XFASEbop+aorrpFgFX4Q2qDaQ7t1Gyen02THreJFYumzcDDPlxx+nkkj89
         E30GXCGyLYhsf6xNp45WsQMe/7xUXKb2OMTfnjutGIRwrOtkKjF6st4haBTOrqENBXAx
         Ef6wqpr+NOjcfUXB+zVEtW/WRdOIe9uIiU0K7HfCrw26xxLMyzj3M/hSWYfzQmTsloyU
         gOw3WENlqj9wqK1JFswlbk+T8P9l1+ifdGWYSj9XQfIOAsnaXJIldEWmJ6cCT4lstkFV
         zbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868325; x=1794473125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
        b=F5/eRgl0GxmsoKh8QPoESQSw/TRhVCLMyIzCGhplaFI29C5moJrjB3kCuGfc3ajBy1
         Rhmc3/8rYjyfnJQURnU4F6d7z13Humf4sOtJWtkwxbISd/IPN+YsBXADzKYNGveflwyS
         s9p4xShbANU7qE8RDwgRAcENwBftDPnl5gW2q2Q/J0vD4fkqrkX8acZca0h2Nhgkubgx
         C6nsuhTFiIsTax13Z3K/FtIwUUpAL7NKuUuTh/dNuEzGbDtINxkvGGSGb3lITg95WnkE
         sLjvjSvhWwnlMqac7ivkgioQcXAX83UWZUuODA6TbB2Z7Fao2k3y0lXcuNcvzx1uTDcL
         Pfeg==
X-Forwarded-Encrypted: i=1; AKwUvByw2sTCf4iwzPMyiV7VI4BL1jb9+YtjmpMYcvgk8IYC2f0wW7znkRwI4VFeeN3Iki3iAbcfs6LV8OwYjFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m5Z1+prA5k1TfsA+7AecIsb/JtvxEay8dZtKsTXOpu0OeiaUp
	t9bp3W/yVf0hJI8JYZfWopBRlIreLExgKnJfvTJ2BnFL5jAHClElyViCc6FquX4Z
X-Gm-Gg: AYBFou28vRIurVkVeEuT0BODdoB+TzYQjcfAB9YElQmSY70RCLikpmj+c5jgK/qx1ju
	ZCCdYgPgLAlaHo8DTb0EJUvwFBVjP9v9qYjWCNuwLcPBgCSYUa50uaE/AdwZdpiDk1jlYsTxwOR
	TDmn+Dgl7R/oeTS2jVJSUtLwEB06yDxy3O6smx0nrSDdZgC1R6gbN7lCNUzi9kU4HGY4smjmcGQ
	G2NxLFBd0TaRKH8uNhpbDFp5pkzd4rAZAz55Rpg6BVXHWpQGdRehk6jSbfZhJjz+PDn/Al8/cEW
	R807IOPZ6oUd3Q+Ux7jLitftJUfJCQT4QdNKfXjdzoby5E4M3CzhaNE3L3LvfKrQkb7/VSAqNdG
	MvShSQVuUhPTEbwkiw+Y3udjLGlV5um+DLpAGBmsbcQbGklWxEf1I1CeO3bEm4A+nXrVAnBrP6m
	//pGZ5l4MxcAFYjTSubu5NJeuQN85cNyP3vtPlKiBYadht3f+42YYditwOsMK8gDryoEdyti+09
	/vDt1fZ7nGQ47ulVTAhOFoB/uFegpkc60M5qFylXhxnuW9PpWFp3XuoTTPwuHGAIl0R61FNNTPj
	BM1ttYsOe+Obbq4w5ZR9c1h83OApNioStvRDWsRGDVABWTBnOgnBeyaccw==
X-Received: by 2002:a05:693c:6393:20b0:369:f291:49da with SMTP id 5a478bee46e88-36a4243f71emr27802086eec.40.1793868324397;
        Thu, 05 Nov 2026 00:45:24 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:ea48:d21a:2ee:9ca2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm14468573eec.1.2026.11.05.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:45:23 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
Date: Thu,  5 Nov 2026 00:45:18 -0800
Message-ID: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1], replace
the strscpy() and strlcat() calls with seq_buf operations when
constructing Hantro video device names.

This preserves the resulting strings, including truncation
when the compatible string and suffix exceed the destination
buffer's capacity.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..2bfcd45cc55e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	const struct of_device_id *match;
 	struct hantro_func *func;
 	struct video_device *vfd;
+	struct seq_buf s;
 	int ret;
 
 	match = of_match_node(of_hantro_match, vpu->dev->of_node);
@@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &hantro_ioctl_ops;
-	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
-	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
-		"-enc" : "-dec", sizeof(vfd->name));
+
+	seq_buf_init(&s, vfd->name, sizeof(vfd->name));
+	seq_buf_puts(&s, match->compatible);
+	seq_buf_puts(&s, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
+			"-enc" : "-dec");
+	seq_buf_terminate(&s);
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		vpu->encoder = func;
-- 
2.43.0

