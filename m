Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606613;
	b=DhFo+NyxUbOA1UdZcBwU9Z9H1dvAxUdRh1SoE7IaWXDZQMm7Im9BPzqXPJharSNIjlew
	 8OT9gbcjrhG6XtlvqfhmsiNuW3tqjGuvjfCXim+kZV0ijVmILQ3RUjlCuNtLWZYUCVZ5L
	 V+zb3iTeWf3dh9zJFskerKF5Y1ex0QueA0w0tp6XkqMPtiboattOhVHlBQA6vXalT8tgm
	 bPX6dRjafDi0DoqxE89J7O04D4NI47TcntpoK3lnpik6qer9EY2JxcytVOCQ/m+KI+ds+
	 +AaI2mqCpR4G2+5N7lWIxFbr2rUTD7OxWmIjlcqOwZGDASzX9++7QRUq3h9AA5afHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QnTjaKjV/Eb5lwtCkCJI2zpKofDOjZaAyQUoBY2T2Qk=;
	b=Igs2P+nLo/vTiICFxsRXnbo9hnTPSk/14GaoNDCecu/OTuIlDxs7+0HkP7e8RCuNmJQc
	 Buh2fSMoLDNou+MIGkevt4qTS3NRYbLUuvbWJZL52dJL+o6m9s2en6bitiQ2jwtbuihSm
	 WJVR7FLIYdCmudt3kjAJGd3RXH8qba/mhdgSau9+HxDr/wNYEsbG6H6c5t+Qu00NbZLul
	 q11+VZ7PANtfwDAUs3RmD0+BZ6hktVmO+6SpYW3sfT6p9zVgoJK1m6lO36TaZ7ZNR7Yxd
	 yq3mHsJuEYPBwux1W8LpcbgG4gsf3Oea21CxC3MlPs4WxJU+O8BBlrLJgmyquJulOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWkwfKfA;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DAF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWkwfKfA
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso826482b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606612; x=1794211412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QnTjaKjV/Eb5lwtCkCJI2zpKofDOjZaAyQUoBY2T2Qk=;
        b=OWkwfKfAsXbbKJz7QLwcb3/OvbnhOZV+OWnHFr38rZMHRX+U2tUJixFagpNooNi8af
         JHlhPFxZpAxbzU7WntTbHVvsDhNB1wsBqXuaiP6mQVJ/c4w5mjKWNMAoG9iiuu9Lh35Q
         qj511tfZLYKlZFmC0TWA4JYVtZ4yydCtlk/X+O4tHECac+/SIGQ77W6KGxE4PcGNLPqo
         7JfGUTjFD+yCKqxvsWaKOW/muvzvmLf00SMDtTfNZt9UO0n6HiUL+gXJS5XAjiTsTmOj
         SwU7D92XSXts20RO4D6jb6kIu/Pr+O8A7G6Qsh85bgdeElGcFkzE2tJRBmT2u2RkkYlo
         GMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606612; x=1794211412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QnTjaKjV/Eb5lwtCkCJI2zpKofDOjZaAyQUoBY2T2Qk=;
        b=ukXjWtlcmXbDMUeg9dLe/cAc5ZXGYj+ilbFAYPo8tj81/H2mwo0KVByWXU4qQ0vAtt
         jMeSE457b4dUpk4/LoRC04Yz9UNlGpqRpsYjRJPzl6eBcYDukvYwThHMqRsRkPTaht76
         wqWQyNJqL493ckm8/xT3/yvdXbEhzR1Z6XYOj73tprMy2jdtFayfzALidEHQ8ctsTxb2
         qwLgnbybRzFwwKjKF3NVmuycYHE/XHsAQZu3dPlQYVdS7yYIOS1ubvOg5Erag9yE35Yh
         zcZuNAaYi85L0SpVtovwEiUrj1Cqj+jFODaMQtZ+Tol29iHgg6R4wJJKnrwKWwxU5Yi1
         fcvg==
X-Forwarded-Encrypted: i=1; AKwUvBygmLG/tAkHyV2uUqzK0vXHLrdjT1QiMDvQMkxiepiwD04DDb/3q753h/xfMD5eTDZ4lGtCY3b32l2tFYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb2tv2kinJ2w2d16h1GgTWEr5zPi7vUOFyBiG99izi5tecnr8b
	PN72TZysmGchzEm+6Az8bDA8jlrn14Ti9X88fMqvt3i/8SWEMvLlqJYJFo5jX+Ec
X-Gm-Gg: AYBFou0GU+A0JX/4Up7Pq/H8/977Qhb0CyJOOpoFnkHa/aFOuuSnd/bNnLsupY6rHG5
	gJ4+eMT5SVxjS1MT1DvNF4hWNJS9qPvJSd9n0UmELjLRXF99n5VTg4+NPoT1Upn9sSdaLXbSIGp
	eKyQmQufwYlJtJsxHhcOAVFiYh6RA8yp1LPiaQdLN368u4ZHkigOxAs6m6mDRTuqAxCSE/FMuoK
	7y9ZOoB3yIDVDMEv98iFW0C+7NA8KTfGyaKvnLYKHgR7DJgKSPyBqjK6Vggc0mEt93bqJi5V0Jm
	SP3JX+gReU8eAGm30mZhYXNjoOd60SnXWE/tY3z9T48s91iLjj1yycsYhntJDfyVYbtI0zL+zK9
	aRR/f9cHFMRNjYyPsSZTO760HHEpi6CXbRvpoxmPvZAKSotm8b8d09Nt/EPSZfWCCXyuswTsagp
	2Y1Y8A4n35Q7C8mhy75kJkcwt/Ri23UOFy3u0VE58TLwhXBKkpfSOhdmvMSoIFrtiGyXfyA7+T2
	42PT4R0jmd7eviBrEQ4Dn6ZuzIKxftiyXfBBDY43uQ7/T0DeIURKViOlzO76bEagOGVvosXtGiu
	Ougo7dwnv/k9auWNxXDs4hnhGU1FhO1e25ODD0FTlwqbWel3+dBwbeio8/+dL/ygraRq8Vgtrfw
	ijZt5InKRQIneywIvN0h70uTiOINOV02+jkZh8o/xPNmiqVUGbqM2bsxEFunvNBzMq9F8RV1j0B
	1MbmmMYUnKzJBHhQ==
X-Received: by 2002:a05:6a20:7343:b0:3e5:6c93:2500 with SMTP id adf61e73a8af0-3e9290799a3mr8561614637.57.1793606611852;
        Mon, 02 Nov 2026 00:03:31 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b8323sm2937039a12.6.2026.11.02.00.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:30 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: ocores: delete adapter before disabling controller
Date: Mon,  2 Nov 2026 16:03:27 +0800
Message-ID: <20261102080327.1466598-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ocores_i2c_remove() clears the core's enable bits before it calls
i2c_del_adapter().  Deleting the adapter removes its client devices,
and some client drivers talk to their device while being removed:
lm75_remove(), for example, tries to write the sensor's original
configuration back.  With the core disabled, such a transfer cannot
work; in interrupt mode it times out after a second and the write is
lost.

Delete the adapter first, then disable the core.

Sashiko, the AI review bot, pointed this out while reviewing an
unrelated ocores patch.

Link: https://lore.kernel.org/all/20260813153155.3953577-1-ruoyuw560@gmail.com/
Link: https://sashiko.dev/#/patchset/20260813153155.3953577-1-ruoyuw560@gmail.com
Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C controller")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: v1 went out before it was ready, without my Signed-off-by or a
Fixes tag; sorry about that.  This version adds them and says what goes
wrong.  The code is unchanged.

The other ocores patch from v1, "i2c: ocores: synchronize startup with
interrupt handling", only narrows its race: a STOP that is still in
progress when the next START is written can still raise its interrupt
afterwards.  I am reworking it and will post it separately.

v1: https://lore.kernel.org/all/20261031033240.2491016-1-matthias.goergens@gmail.com/

 drivers/i2c/busses/i2c-ocores.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 2d18c1035837..ff024cf5f92d 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -720,14 +720,15 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 static void ocores_i2c_remove(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c = platform_get_drvdata(pdev);
-	u8 ctrl = oc_getreg(i2c, OCI2C_CONTROL);
+	u8 ctrl;
+
+	/* remove adapter & data */
+	i2c_del_adapter(&i2c->adap);
 
 	/* disable i2c logic */
+	ctrl = oc_getreg(i2c, OCI2C_CONTROL);
 	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
-
-	/* remove adapter & data */
-	i2c_del_adapter(&i2c->adap);
 }
 
 static int ocores_i2c_suspend(struct device *dev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

