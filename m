Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724577;
	b=3m/WRlxMwYeVFRQxbHgpELXSnmWW5100C/DiGGyadIOB3p+FXpfH54C7M821SB3FLP7r
	 aFndF80Kcu+ndih1+XUDVTd5Px92kp5SkOQD4uFqG4zZytb62BXDhOeLImi5GH6MAuoHr
	 VI6SRC4VW9a1Ct/HGMnLyYEGR9p9ikpczCGh4pw1yh6hfgf3Bq8Q45W5qn07ELDDQhGZa
	 yOwRxzWVKGf9LAjDd65YzYZfBX2QsPYE4VmPh1KY4djWZfyDlfHx5MMoC8fMvwYqsmngV
	 4H8J/F1luZ95b/CqbWrPuZ78+KekISOg+6YZH9xIFtqd17kEHp5s0v92vwrFr3rEY8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724577;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RnwW8JdB5UARoPhC4AEKlAEss5f849c5oZKwccCMzBk=;
	b=RUCkkCedeJPS33q7BOXkNP49+e8E4tcLn1vvzPx18KK4QnxrTzlw+CYy7Hs3nByeWU+9
	 RlNpdpLCZzMnI08v6OU8Ir40agCZz2lRHNV8RaAsKEShHjUum3kEZA/yw+8/HFbjYgaxV
	 6bf3f5x8CWXyC773ZRA8sjiUl+CEc74zHhk/MSzaB8Hyq2Lm0SqKW3NVUa7smpRhsZgqz
	 5JOa5XGH9LKQbf66u7e82GuYA/k4Dak+0inROr91aJTyks7VP+iCNOamUAcK8V2/U8oQL
	 tIj3s/RXgIaowJ9JTioh7JGXLB6PKq99Hk49oqAbFjjqFEZSelEVnoUlphv86C9ho5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JN+hHvHV;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A1A606EEA9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A1A606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JN+hHvHV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E802C4E413E8;
	Tue,  3 Nov 2026 16:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B710B6046C;
	Tue,  3 Nov 2026 16:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A341103291A7;
	Tue,  3 Nov 2026 17:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793724574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RnwW8JdB5UARoPhC4AEKlAEss5f849c5oZKwccCMzBk=;
	b=JN+hHvHV6NeIkR3aHisLPynZGqzNnHCsTUAotoMWobbtn4WsPQMM2j9K/07Ri19Pp/KdcU
	3cFQNNBy+T6GwnX78eBIazG+MGHFVAUzgLQxIH2VjfEFNqxDp+SHDHRcq4ScalSfLKiGTo
	EFnX7IG6i0M5LSWrQHRaSByngx0i+GGjpKRqbu3+2jSdhkrSkkwOUsdp0xOhsE85/a8Woc
	zBZ4iTh0g0nV/L3AyMVNo9XWnSIK1m47KbpWapSz5K7800mgBhR9BEe11ZXmYrTc/sJiN3
	ydShOXZw2eUigtZQmB0CKIYdAItJ4qpBqecGUIIJbhUTIAwtj5eNBuViyEFqlg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 03 Nov 2026 17:49:15 +0100
Subject: [PATCH v5 7/9] mfd: cgbc: Add virtual I2C bus support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-cgbc-i2c-storage-devices-support-v5-7-ac11f23fae51@bootlin.com>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
In-Reply-To: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Internally the Board Controller has a virtual I2C bus with some virtual
storage devices (EEPROM and RAM). So add a new I2C cell for this I2C
virtual bus.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 7f512b4f07f7..e0d9939d8c0d 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -65,6 +65,12 @@ static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
 	.cgbc_bus_id = 4,
 };
 
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2cv_pdata = {
+	.name  = "cgbc-i2cv",
+	.cgbc_bus_id = 3,
+	.fixed_freq = true,
+};
+
 static const struct mfd_cell cgbc_devs[] = {
 	MFD_CELL_NAME("cgbc-backlight"),
 	MFD_CELL_NAME("cgbc-gpio"),
@@ -79,6 +85,11 @@ static const struct mfd_cell cgbc_devs[] = {
 		.platform_data = &cgbc_i2c_ddc0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
+	{
+		.name = "cgbc-i2c",
+		.platform_data = &cgbc_i2c_i2cv_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2cv_pdata),
+	},
 	MFD_CELL_NAME("cgbc-wdt"),
 };
 

-- 
2.53.0

