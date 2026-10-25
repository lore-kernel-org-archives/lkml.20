Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897593;
	b=BjJ5Txzq1DNMIMC/OETCIm84OJ9dENVn+JLLBQ1T/x9yY1swnwQKXRd3GNELkGsRogDh
	 XToC3KeHYkhosGExJnedcTCILrMd4SMehLY+u3XZpHvU0qz51MVp+zr4dWd3HOWCZckUM
	 X4WIbdMEJbn80b2niN133t8rrVg0fCJX8Q9NnbQBtzA3SxEQR+/qGStAe2bBr0oH4rPY5
	 vXvP9aieK9Fn3YDXDjOjww3e+MiH6Rb20LaUc/ZSb5Dn8Y/UYGeThosp542ww18kVgt97
	 yMVIkV+72QjM0QWNNiYQ7zugVxjKFrMpptAEMSMJaz8PsmW9hrwoKTn8mNHgyigl7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
	b=WbZ2wVoKtJoEqcL+hhNUV1h5DgXc/0bGWBMvhPV0Odi/QRImdTE1XPDRu5qC1IwC/0Qd
	 2EXmHEcUAjm0+ulZo2bnX3IZgroyxsrX9cgtFwsZIuadLhPcGvoO6J0GFKIe2rx4umQzk
	 CuvN5qaMwZcXZbd7Z+WqGaFmMhi6bGJNqoQhtPTZDVCMPZnUv1ehiciQAFhfQw53LLU1S
	 rFefSMwRVl3pLRPZrGp7M2mkqkvIGVvmDjs5wP5OZcz5GsqwyfqA6i2v6c/fcN15vDon1
	 VUu+VSzpR25ut5My/HwRBuV2LIf8XpIpVAqwlknGk6Has0KI+DHUkJ4VGnUYyBADDIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="s/0fLdBt";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016260A6F56
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5016260A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s/0fLdBt
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36681e85e87so1519961eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897592; x=1793502392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
        b=s/0fLdBtM+o1/t/QTvZDL+0QnBCTbu18PSvh+EBSgpSoEW1Nl+H+qywlmcKoCmSKBB
         6bqItptYtAAIDElFpn7edI1iDrS9hJ4VnYVoJqTt//8ylcuXTrrVrfWoA60zZ+RwajZR
         e21IZgBlLc4P8xtezVUxOFEiPn+zuKTHlNeRZbSF4Id3nMo3wHBtPhFfixVKffbVliFX
         WcEOcBkHQr1Bt+FzajKIpF/+EMFRXxEFerOvFHo/0Qv36kSP4vwP1x0imhSQD4kCG8L6
         HFzJvlob1zmLhnrqkXiuZdM1RQUzzYn5mvDPUNMABtECkBXag1FN4LxJ998e7nHUs+vz
         QCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897592; x=1793502392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
        b=tWUIOzLIa2/ujivvjhI0jt0vs1oBP+MG6Al8OYBlw4vTxpUr6+CqjMstz1aqv8JSH4
         qOhAG8RrWk51Ih5apKAs0+u+0Lxat/8ifnorwyj5W9ml+gnFG6l+NJ0L4l9E0ActW5ga
         dLw/Qq8zbhe/Dw2JlF2Wi8yNZ0MQ7U+eqMUTa+ayR1vAeQYELymQVQ7bh7JwFO4SowNn
         CsyKT2NRic7SSlPxcge8Lfw3V/gjE3lqNVJadUtUaXa0T1aNm/BmJwrpL3oR6oOruDDU
         B9tZvSLTXqjaEypsJqlVALux3eB4IxY15JhRLcOa9Ao+p8qQiur8Tv7sZlzAgluhkXD5
         j7DA==
X-Forwarded-Encrypted: i=1; AKwUvBwbjJuXLu8ctCEAwZIMka9/cygCJU5gxMCBfDMVT9789G5i6Bqgkx0TiZT0W4ll2AE3PQgLwsdR4TNzb9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBkBq5lbS3ud10rYQyav6riJQyRxRV60V4fRYT2Wede1n7CGzZ
	24s8PLFdYAS7kV2uaATdI2wxkWLKrVPoePq3WBf7VOmw08p53UxM9DFr
X-Gm-Gg: AYBFou2Vd8yIY0cybANqy9NZ5ne5DTS17NGyrAEOEl1IdxxuISMAunsL2tsIx4zv1C0
	p1uRX+bVNLz55ZYB6JZXXK5GoFW703A5MIH0CTcjL3C0+tRwU36AO5iAtMXKL0X00fS1nd1RcRZ
	6LP0ZDAyY5Bso2iIWkcLhtq45G5Njyqfon6qVb4zsUWheBkSWvRFzl0SCNknLVZMp4ZdwChmjAm
	DJMt3R6A6TkQS+mseSbpnYkOV1qvhilbqyxnfY3IlXOfJw21SX55CzRu89IUf/Y9gIBQKdaatNZ
	MqrLbHLJK5W7X7A6zS1060oZQjGmZxMMonyNdRMsrAyZywcTWN4K/hzN9BO1nQy1Ct787v+sAZ0
	lxriIf71bznU0KoTD5iNDge1/2fusToqwFF8mtnddfRHpKscKJ0po1N0Fvwo31xaPjuMDVA7bKQ
	mSazEcabKuiyQplm0wOLJmn7GFXjxriNxxBm/gVcEUuIxy5zHN5CwkNUw0AJUTeU6RYL8iDDJ1Z
	VBIw7H1wtfEeCCUNFvb1af6SUMUOjhxCxtTfgio9ClqVEi/Yqb2S9QFXUqyCWmarJkwe5VFtgrL
	D+I+HlNBvfF+XChK4mx5aTo85QAjoNJ04+Wdw1dXqos=
X-Received: by 2002:a05:693c:6010:b0:369:f3e3:4277 with SMTP id 5a478bee46e88-369f3e3453cmr2562582eec.38.1792897592392;
        Sat, 24 Oct 2026 20:06:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:20 -0700
Subject: [PATCH 17/31] hwmon: (pmbus/ltc4286) use 4-argument
 i2c_smbus_read_block_data()
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-17-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
ltc4286_probe() to leave room for the NUL terminator, and explicitly
terminate the buffer before comparing model strings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ltc4286.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 8190706d1beb..530eace926ae 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -155,7 +155,8 @@ static int ltc4286_probe(struct i2c_client *client)
 	u32 rsense;
 	int vrange_nval, vrange_oval;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer id\n");
@@ -171,12 +172,15 @@ static int ltc4286_probe(struct i2c_client *client)
 				     "Manufacturer id mismatch\n");
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer model\n");
 	}
 
+	block_buffer[ret] = '\0';
+
 	for (mid = ltc4286_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

