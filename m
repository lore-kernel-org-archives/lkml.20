Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838239;
	b=cKXQDW0aBXB+tJoHIvD86NzobXhbmc04if024IYOb249jSqZJP+YdjeFnCw16PgQNk4i
	 WxkFUV8mwtqpAnVpUVG6GQscP9n6btGuCtpb3zsWSXmLbScDIMSvdcAT96oLO56HveFcv
	 oJNSMkoVdIbtlxH6KRWdk8qcDbyvwPRvwjBbB3GaxLBvq1guX9+BLA9wbBaOF34+PwaAD
	 zy1WhMLMo33I4Uv8Ws9sgIZWnxBd/0hPxpXbDwr5IKk6emuOc/MOtpwgHFZpT3/SmeLjr
	 QrODwwyBv53XlWPhMLhvPXU3H4wBUQrRQQo7qszWqzCZ2FppWLNeuF42j2rMufADQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838239;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=tgwZ5Yrc130Ccqwm5o71doEf2ZsSVQOfCHH5+9FikU0=;
	b=i/6qiD3Mv4AX+UwyYm72malte7eWcgqu/ifWU0NT39yAIcxU5XqgkYt3aGOArftwEdRS
	 oYVN0B4yB5xWid2XZJUAmHxr86vUzWDEovfp6ko3UqV22uNhH9SYy9JSLe+va+gkccunI
	 ePAz3czRJpIa1IyzlJhikM7vKzbL3QaI4bUVLzipXhnxh0AnxHRJd7wR4yDYyHRBoownk
	 YoC/WXiAT7GvY86aXKGgSzYJRDCWZ4ni1qg38YYHZOlghxoXpAUmfOx1F9IlIshiJAW9H
	 yYnuVUpiyqBOZgIRY7ntSI8JxDk7m9GbgrlbZjG2A+w6QSp1pz0sfGnptI1dFJ6vIGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="PZhIjc/2";
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D354606A31C;
	Mon, 16 Nov 2026 14:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D354606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PZhIjc/2
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54db446aa;
	Mon, 16 Nov 2026 22:10:25 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: Fix potential frontend leak on registration failure
Date: Mon, 16 Nov 2026 22:10:23 +0800
Message-ID: <20261116-c29ba55625-media-em28xx@mail.sdu.edu.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4b1e24503a1kunmf9fce36810daaf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB1DVhgeTExDSUofTB1NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=PZhIjc/264mr0e8t4hH7PHAPxcV/saK9o0aJFIqo0pkRaqswliXwhzsgkp0glMNR2xPbsgppOI9nTC/DLrqB2Y5xLhuJevag5pjWFt/4Di/+H1CDOb07bFD24H4/Fhl+Y3/EIch6Ge5sCKtKdggTPri7/9k4jVFJMpVIInpuDYo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=tgwZ5Yrc130Ccqwm5o71doEf2ZsSVQOfCHH5+9FikU0=;
	h=date:mime-version:subject:message-id:from;

If registering the second frontend fails, fail_frontend1 detaches both
frontends without unregistering the already registered first frontend.

Move the label before its unregister call so the registration is
unwound before the frontend is detached.

This issue was found by our static analysis tool under development.

Fixes: f71095be6645 ("[media] em28xx: Multi Frontend (MFE) support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 8482fc4045ea..88cf4705026d 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1115,8 +1115,8 @@ static int em28xx_register_dvb(struct em28xx_dvb *dvb, struct module *module,
 fail_dmx:
 	if (dvb->fe[1])
 		dvb_unregister_frontend(dvb->fe[1]);
-	dvb_unregister_frontend(dvb->fe[0]);
 fail_frontend1:
+	dvb_unregister_frontend(dvb->fe[0]);
 	if (dvb->fe[1])
 		dvb_frontend_detach(dvb->fe[1]);
 fail_frontend0:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
