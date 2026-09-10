Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6913AAF57;
	Thu, 10 Sep 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023811; cv=none; b=dtPF9syYmVJ/lo7TvmF6/P01ar1ORPk69p/s0ax4vEayoSWN2Oj2ByzZIKidHalEIXogz4Hz2o0dMRSCkGUncUXQnumCEqv9iX1yj5+a7b7VIHqBY2uRkJjVEHQ3HDTi7vUBh1S5rNfnkUfLPfhNMP7VBPGSAV1qfMmdLHPQI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023811; c=relaxed/simple;
	bh=NMuB+VaofqHfoe6kmK5xWNMKnVtJfloO3J+b1Ch3CVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGAZgU7gBarLDHrvxj4qh8uhcVEJcygDvYVRr92EQ/gMtws7bMW+HlSLm7mpoCRbG5D513EOemxtpoG9SRbq4H9L5GVAsIWjqBL9ka9ztrxDJtQki1sGqAnFTboCykeWY6jqufxvc9xl1nXEOD6GIvcm1h0PZNMHCH3AoPc+rw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ixeOAjSM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ixeOAjSM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 311E74E415BE;
	Thu, 10 Sep 2026 07:03:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06241602B8;
	Thu, 10 Sep 2026 07:03:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C704811C7AF9B;
	Thu, 10 Sep 2026 09:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789023801; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QMVPjWVxoxXUCreQUwC+/mioLnDGc64lMOUrq7iP8Bk=;
	b=ixeOAjSMYPmiHlOhCU2/T6L9+eRYbAUdXu/3m55A6gtxjf4NqR9h5OJITJ4lUCu11YH+fk
	tWftDa1q0MGqna6m9gzgTZSxVYUTne7D7s0vW6v93dShQWzwH9sqwi9nnm6JvY0cHQF89/
	AYKu+86IAlG+I9fETH1FJT5dfvutHfaJsAKxn+1uI9DJTbGb60t9MLPwNfjU2HOyXFt172
	ExOvEjD+I6+FhBI8ngmso/wCRhpSsDn2dp2G1Upv6fmd+cKUY78jm9J/pfUQJCSSoRN7bc
	TzywbLDmx4B0Iq2dhTiHrKriikGyriTslIV5rBaUusWlk9amE6E0ag7hxMcS7Q==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 10 Sep 2026 09:02:40 +0200
Subject: [PATCH v2 3/3] hwmon: (nct6775) Add support for NCT6122D
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-bootlin-hwmon-nct6126-v2-3-ee629ab35e49@bootlin.com>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789023793; l=1535;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=NMuB+VaofqHfoe6kmK5xWNMKnVtJfloO3J+b1Ch3CVI=;
 b=tGPNx4nETNVyUEccYSi+j4ICvvvsX6pnklFG+GOqiH6KiwE/hMRXNBs09cwhXWf63IGrLoSmU
 +MuJJ5MjqlTCBk3grKov/FzP4WzrNK7n2igcIpFuttLmAxWuryRBU6i
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The NCT6122D hardware monitor is the same as the NCT6126D, the only
difference if the number of UARTs: two instead of six.
Add it to the driver using the nct6126 chip kind to avoid code
duplication.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/hwmon/nct6775-platform.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index a8ef58d3a883..d359c28f3e0f 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -25,7 +25,7 @@ enum sensor_access { access_direct, access_asuswmi };
 static const char * const nct6775_sio_names[] __initconst = {
 	[nct6106] = "NCT6106D",
 	[nct6116] = "NCT6116D",
-	[nct6126] = "NCT6126D",
+	[nct6126] = "NCT6122D/NCT6126D",
 	[nct6775] = "NCT6775F",
 	[nct6776] = "NCT6776D/F",
 	[nct6779] = "NCT6779D",
@@ -77,6 +77,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 
 #define SIO_NCT6106_ID		0xc450
 #define SIO_NCT6116_ID		0xd280
+#define SIO_NCT6122_ID		0xd2a0
 #define SIO_NCT6126_A_ID	0xd283
 #define SIO_NCT6126_B_ID	0xd284
 #define SIO_NCT6775_ID		0xb470
@@ -1035,6 +1036,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 		else
 			sio_data->kind = nct6116;
 		break;
+	case SIO_NCT6122_ID:
+		sio_data->kind = nct6126;
+		break;
 	case SIO_NCT6775_ID:
 		sio_data->kind = nct6775;
 		break;

-- 
2.55.0

