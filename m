Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908881;
	b=m/spOwEmk9d28pKqEnbVN2Lh309HYmENAhxcn+dGIoRiFJxtVCgBP6mOetHrWO/AnKJP
	 dvvgUPcVU4PlDNPfwueFqb/anNYSK5xZ5pppjg6TnLKYtCWt385Ar+IXKqPkZlsyzhCFC
	 jdprMrh5VfWuq6YUHRqw7UQP+YuFF9jONTQfpLmpHFN05H6Ev87NHImNc1vZhakl31DA4
	 XgkaS7xTtHSMGJZ5DMOeZxucfiieFGG9zu1RLgibF7DyySxAtyCW8exJfqUHT1KigUWEr
	 HHNWPgfMPQE4fmKJYEZTTtvOW0OG/5ok/DgJ7yUzKh5yMrJH512asWRqseW3hOxKAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908881;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=5flDgE/4XLh9EPv76UP4rvnHkSdlVjpcV1+E4jgKraX7UCAVWfKlqBN5P/zy+BDFESNO
	 9saQzOVgFJxGYjcwHeNccrPqDhaKCUMuAXUONBHa8wtTiVPTVPHAi4oRCZqDLFgDvHMKf
	 hUsItRtgZp7smiS5QYPxrRsJNkW4Rifa8r0CeGKuVjCj/rK5cVzdJEeTEUEOnNdrLU9Dx
	 20b36JmeZxN4o6lhRcsroGNYVxhHP3JPLxCBHuL4Hzx7Vx2OPCha76/y0zUTELH7TNS6y
	 XabhzLzIjeo7Ofw4IIUq07+RPFbwII/O3LLXGl3BIB+4jsdyI3znwBE++x7brk7b7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ptIgS0jc;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5536B60A262B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5536B60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ptIgS0jc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3266C4E41561;
	Tue, 17 Nov 2026 09:48:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F36D85FC81;
	Tue, 17 Nov 2026 09:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ECB211BC0C04;
	Tue, 17 Nov 2026 10:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=ptIgS0jcmqIyGSMWrcy5rS3wdqOa40UL7QImnlMt41o5yVXtB+OmcmM6f+VvJbnX6nf7H2
	UB74E1aV+tmZaw8niSi/pyOUYBpXqpNS/jjSH/fr5jh5S7xsDyWfwMc8XPpy0IqbHNFuey
	RY1SvvZCvdByzCa+gzSq4iGhQTA/SKo50dIW7D/k2isc4TkzTtfuOA3HNx5t2+Wu4X1zNM
	8d4EzSiPwimg1t2i4fo82zTkxx3JtWSyDJX3uhdrk3qYVPATcOHzglJlCWgbeUuBw8Y1Ua
	Yg7xneWITZ1R17SWj2XVXuRP17k6ZrGafh0V+936w6DdXYavZAXNyDB2DQmuLg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:46 +0100
Subject: [PATCH v6 06/10] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
 device registration
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
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-6-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Since parameters are now passed to the i2c-cgbc driver via platform
data, the I2C driver no longer depends on the platform device ID to probe
the correct I2C buses. Drop the hardcoded cell ID in favor of
PLATFORM_DEVID_AUTO.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 6c1fbff323e6..dbd6a7539d8e 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -71,13 +71,11 @@ static const struct mfd_cell cgbc_devs[] = {
 	MFD_CELL_NAME("cgbc-hwmon"),
 	{
 		.name = "cgbc-i2c",
-		.id = 1,
 		.platform_data = &cgbc_i2c_i2c0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_i2c0_pdata),
 	},
 	{
 		.name = "cgbc-i2c",
-		.id = 2,
 		.platform_data = &cgbc_i2c_ddc0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
@@ -350,8 +348,8 @@ static int cgbc_init_device(struct cgbc_device_data *cgbc)
 	if (ret)
 		goto release_session;
 
-	ret = mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
-			      NULL, 0, NULL);
+	ret = mfd_add_devices(cgbc->dev, PLATFORM_DEVID_AUTO, cgbc_devs,
+			      ARRAY_SIZE(cgbc_devs), NULL, 0, NULL);
 	if (ret)
 		goto release_session;
 

-- 
2.53.0

