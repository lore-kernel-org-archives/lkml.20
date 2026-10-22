Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697951;
	b=36JWUqA5JmIHLMFsMOXAQQUZoVMh8Se9LSbbAqygeuiP7qRcco2YixHliX3MDC6qn4Nv
	 hwumqU3nVnVuVpa+X3fH/ZuBtykbL+Cm1em9fD6Q7t8q32kBZ99GNkV5S4vDccJJ++5PV
	 yAHOVWWi9eZX3ZHPq1Zj6cMoLwOFH4rb+j3EA8QQKVsfCJadCz3Uepro4rrIL01sE320H
	 0NrMIpcgFnfzdvH125ElYJg9zkVIGJyIefcLc+XH/5TPbs2TWUA5bN3FKnb/42bKe+jam
	 EtXrufvbYtoQuZ381V0ng3gW/5gI8IDAU4QoRPsk8ed38M9Lg9v9z5w4/fVr9udbNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=;
	b=Oj9Ns+oJIidqdL/b0MWPGflBzJMeZy/KLUNS9uudbE1A8mo94I/rFuePwqgw2/3EGGud
	 qDxyobuL2eNROCP9UoLz6eAp3bP6TQr5ExYY+C+Ar+cWzJjR+oF0Ku5yznuQGl6MJ9InY
	 jQt7alBx8WgIBtwgmaEUsWkBGHpcbsSFCF9/a4Wqen1C4E+DaZJVshwX3Bk66za4Wvr+h
	 XbBI/pgidWfXbHoZuopCxfDKZKJjAmXgWkm4EnxXNW5rrA15VEmjgvNpbgIFDChl1BI9+
	 KLWnvCI/+NQQKlo8Hsfv+yHwqiN7iYgpYH2jrq0PWaSZtsRtFwEzAsbSwdk2JnzB+dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="T2Sn3/UE";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E99606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E99606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T2Sn3/UE
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso110142f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697949; x=1793302749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=;
        b=T2Sn3/UEFIQ1gguvi01Rzg/SOPhtehuu7dboerUrQmiNO46RHQNB2EhECSbVnGsKQn
         0Jp9c1ai2rMR21RCZjCHOm0uGTam9CvOm9oHHbd9TbWetuY2R+h9GDqlxiBHrOXZELmx
         12jv2oDL1jo272xUoP8GUf9/h1PY5KmFMBqtvd7MsGuaJSPYApXVqT18ySivJR/gStyp
         5LW+1+kWLs6RiIJ+SDl5MAw/oNFs9LAVgY1IhxS2z+YrVXmUqqJqGd95bxpOKIJyxJxA
         b0ENTpfmQpfQKQyuha5XV9uuJJ0foKhVQ/MY013ia3gB943uAFVAgljj0rX9U+YT2BYZ
         LNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697949; x=1793302749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6uibeAd1xqDy+X+4zICpkfe89xnFGYtmkkgNj7URCQ=;
        b=adcfl1jn5u6Kas4mtRlSJ+jtKrnAHWZnXodNeX3AFva6849VejLrFkvL713SmlM16h
         MSmXe09q3y88Yk1E4sCelN35v98CNZcCSIMuJZFK0paNrxt/y9JmFC2X1XUAcgpZhtBZ
         flYs8+RN6GDYb4xQ5LtL+6RF4MEuT/9J+dvY9eyicVKgJPkXfyt9AwWUImaAvVVdqGZY
         AxvSsJ3qOgsmsF6imXwfJFMsw7mPu08On5IelZ0ij0U9xh/n2QP6YTtgrJdHuTXghktg
         l6Rw6EdH8Oiq/i8NwG4li7uLg0aU0EyL1D+YWsGkh+0RXugdDcmDv2Wro3/yu4zN7f+V
         htOw==
X-Forwarded-Encrypted: i=1; AKwUvBy/NkaENTWNu6wqko9C9qwH4v3/OW5JhWaWYxKoH/nK9eBDCeUZMfqv9CoO3C64xCir87tgguAazmaCAUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgS0ETmKRVUsP5SdBqM2pqLp74WzNR2MXjvJvrGcTtUcJw0gdy
	Tq3yeLQjqcM2rC/WNQeQXFC1Au/9jP8/QgoxWXMSt9+jwetyEHYVe5Ny
X-Gm-Gg: AYBFou1r36O+P7VbF9nSRzs6Bl6IKljMEEhXDnqF7HYp3pPV+QBjDuVXIW/S2sBntW8
	fZRJyoi3IA3htk+bU8I+v0eD0I3Dno5yQYXGp0PvL4+pZL2E2nmOjp1YdnB/wJZR69w+oXKJeSd
	MKmi7903dVqebjtAW5Gl6JWOaifE4gHKsmc2DXXPDQ+8lw9N1Ap0/bVcmw3f7x4ENIwxck5R4ni
	5lPCbJ//7fXIOdquxnDnsRZeDfwkGgOaiZsWm7oEVFdzszg7zxnPnzaRjmXwJeYFIdHBGG3U1iK
	FkEeUTNPHnfjJxMcPwTgt4V33qQMsaNP+hWiMIoifPLzbl/9Ab1fURwDRflizOxaZcKs85uZdfy
	Tw6NsEgCukUqfGjlyaVciBzISqGiAsMVuWk5t3ydD9SVJ9W9jUlH8u6XVNOBnW1UT5Zi8YlWK2I
	qF80AxHjY5lBiGJDroXmSmk7TEhGzNiiujlIvcGYQP+0MWkv1HCe1nUIzzYxAX2fdSaknRFBZq9
	xrnEtzfhaZ1RzhFoxCsqkYFpS7hUFdwPeIodiJxuyazt6drl1CM3Bpa7IANI11q6kp2DqYBLewj
	6qzcwaX2uHoyASdQqfcx9pPePHNnT5IybnFiNA5Dfck1DQ//ibFNqUxLSfle
X-Received: by 2002:a05:6000:46c8:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e264af00emr8712598f8f.21.1792697948972;
        Thu, 22 Oct 2026 12:39:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38026a7fsm69730f8f.15.2026.10.22.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:39:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
Date: Thu, 22 Oct 2026 21:38:51 +0200
Message-ID: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
stack data is copied and written to REG_SM0D1_REG. Equally on the read
part, an unnecessary read is done.

Guard these extra copy/write and read for the page_len to fix leaking
uninitialized stack memory.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..9ea5e3f9a763 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -144,7 +144,6 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u16 addr;
 	int i, j, ret, len, page_len;
 	u32 cmd;
-	u32 data[2];
 
 	i2c = i2c_get_adapdata(adap);
 
@@ -186,6 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 		/* transfer data */
 		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
+			u32 data[2] = { };
+
 			page_len = (len >= 8) ? 8 : len;
 
 			if (pmsg->flags & I2C_M_RD) {
@@ -194,7 +195,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			} else {
 				memcpy(data, &pmsg->buf[j], page_len);
 				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
-				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
+				if (page_len > 4)
+					iowrite32(data[1], i2c->base + REG_SM0D1_REG);
 				cmd = SM0CTL1_WRITE;
 			}
 
@@ -204,7 +206,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 			if (pmsg->flags & I2C_M_RD) {
 				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
-				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
+				if (page_len > 4)
+					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
 				memcpy(&pmsg->buf[j], data, page_len);
 			} else {
 				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
-- 
2.55.0

