Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897609;
	b=0M08o22cgiN6Z3vVzxpMcw+TbSf8WAXiPZHGUmhcC15jAgTUnTuhZNbGGewMPJFReSs2
	 UDGJOJPto9KiUCy0HOj3a3llSLOO1Nuzgg4ajsDManZQ7PUCcIolQrdnviDWpqTu+uyLn
	 HPk11PdRTs2zdt3oeaZxNTW6HJqMS2RWw8Qd1X6QIi4k0b0NxfuG8bDdwUYvIOczxY4nQ
	 pCIbx4Rs09221v8APFVtg8f+shoHYQvGigkHSwbF9gfs42RrZ2/17wMzforgMB7cNL/fy
	 MKp2+mbc+UrL2dcNTZdkO4iRfaFEQgk8jrbhqO2TUEkgYF8yJ9qAfrfqYBXyukwYwSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
	b=v3hVLIRkAiSguX63PI7lFsWi0QctXUBX2YfXSI99q/Rpadr1KYABfB2vNq0TyBo/gQp7
	 6C/JbPHEQZodpfrtY0c4RjfythtPOTQlbiflpe9VprGJHlUStXVY7VyKOeTrxffTaypXf
	 V6zfPu2T4GGDWhBTqFNyzBJ5obapahasDSDiVRqb+8wtYnTJ3U9lnAxZr2cAsOfmzbQwd
	 0Ct1Ot3Qv11r91kzVyZ6J5hPBwOGg+wio1KyZp/vBRDViC2EK4oDssw7wbNsvxPPGBb69
	 V7fqlzvXgFMDiI9aIckt5l1yIVwH4SQCM8IhMzeNg83A/A4K4DZ0jDRFPw8HG0Mm6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E8aklddD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47FD606AA79
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D47FD606AA79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E8aklddD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3879368eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897608; x=1793502408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
        b=E8aklddD27UCh36Jr8rrd0zz890LZrmX/m+fXIitVLaCRl83GkN2nhv+4hthaas2yP
         R2KmxGF+BvbEhK82imFzFOkyeNZef5R/NuMSisMs4LJkTBeNAa2YKJL3lau4rg+UTacI
         vQcwg6HV9+sHO/wyYroYaVwnU6YgVBwAe+QbBeTB9aGeEbcdEw0CxMMjZN+w/NaL9O8p
         AILOL2U06rzAxw0V69+GYCLsxZqzO5wWeeqK2o9o6aAk++RFI+4UJlDTW9oPNcKvUEnB
         DUfr7FIHShUgy+LgTfbZFU1L1tnCzVUR3BdiR00uKEoqmc0mMmWDokCbjNiHSMNekwUn
         vZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897608; x=1793502408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
        b=K3VrcouzvMqLLCAuiM81F9hI4Gsyv+kRoF/ZPW0PJbCelAMLzzu4nBzPRQE1J0CgAx
         +Gm/YfvnmETo1Q0ilnFgTVJCFI0iQf9xXV7FLIYNMMUamFlCScAsrh6d/zxqOocvIQFJ
         v33MLmrL2rCyhYBShFQC1nDiFw4x6d5sZo36x6WOXXRRrA3oRHptZgioY0yxW4FlrKO0
         /2hgcG6nFerAbIIwNcA0Eq8T+8tkmMLI7xMYtkLuGuJJh5x7Rc/fHPopV9LVWiILb88V
         HX5r6R5o9KdnCbvrNTT5daZ+paehcbZo/HETPsoNgdbQIvxw8DHDuxQOawdpa0Ga3+Id
         4ffQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIxChGI21LEyqWvWDwoEIt2O3R5QP5qmDtqctU5Tru1GUdsnmIcRWk/jHb8Zz7Xt28sCAj5aMbgJPT2cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUAoBiSPIrxVP9Q4+AeYsrXaoW558HgJlp3Atk9VmAi2rJreJI
	yZYExfVtvjH14D5VaNLzSDR0xRWOh8rfHhMWm41XTNzwlxbXymXrFZWN82slUg==
X-Gm-Gg: AYBFou0ZWILSgnnqp1tfxEYJO+f1Diu79AzH2aaCR7Pbp/3Jp8+ju8i+vHE7C1UdVRD
	IUIGvIxQUhURi522rTRKwT1vCkwKOoK6xtaUcmHp3zWIA/nOxk2g4kcj1r79S2nJmRWDw+M53IV
	2ckF3gzYWzHXxdLpfAXkBhl6rI/2897lxX2S+fCnpISHJxI3kUJTW7bkxvhP3EzThAKhbeK/WtX
	fHSq+S/9vHLY9YQwC7N6o+7cTpEwShlbM/9gnHNMl2rdBFgzdUnlUkAcaVZE/uUI/v4ZEtqeVeP
	itlC4gmE373BRS0Ud/SnmyaNqQd5+cIjtTyKsz4KnRxEmHN5P671wSZHXbu+72/2hPLP4u+/WLv
	5czc3y0OI8tD/lz55DtPMWoNQV4wxTOBKrkJckwAdoFQV8xOQMzCIalMF9dt50AqhKKNVVjYBeW
	YDnPha4fILJf8nVujU8yqPX4K/VTtQPwsZc5mB6M/7WYXCzLAclGH2Y4O8Sj9iu828fHnjEL3F2
	y/JWu8xpNvTKzV2QRxzP6C3K4UZ86QqQlAKi6y9Y/KyEHMKgXuKuoLmWIhXU0GlB7nTc61ozMBB
	tfOyDvpZs9BfGAxLztWugzM3QaKm1/s9IkA/GzQeKZ1V
X-Received: by 2002:a05:693c:69cf:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-369e8362b3fmr5037652eec.1.1792897607949;
        Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:31 -0700
Subject: [PATCH 28/31] hwmon: (pmbus/tps53679) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-28-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data() in
tps53679_identify_chip() and tps536xx_read_block().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/tps53679.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index a04a632a5091..e6c5fd630f86 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -110,7 +110,8 @@ static int tps53679_identify_chip(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					sizeof(buf), buf);
 	if (ret <= 0)
 		return ret < 0 ? ret : -EIO;
 
@@ -176,7 +177,8 @@ static int tps53681_identify(struct i2c_client *client,
 static int tps536xx_read_block(struct i2c_client *client, u8 reg, u8 *buf,
 			       bool retry_without_pec)
 {
-	int ret = i2c_smbus_read_block_data(client, reg, buf);
+	int ret = i2c_smbus_read_block_data(client, reg,
+					    I2C_SMBUS_BLOCK_MAX, buf);
 
 	/*
 	 * Some TPS536C7 samples return an invalid PEC on the device-ID and
@@ -186,7 +188,8 @@ static int tps536xx_read_block(struct i2c_client *client, u8 reg, u8 *buf,
 	if (ret == -EBADMSG && retry_without_pec &&
 	    (client->flags & I2C_CLIENT_PEC)) {
 		client->flags &= ~I2C_CLIENT_PEC;
-		ret = i2c_smbus_read_block_data(client, reg, buf);
+		ret = i2c_smbus_read_block_data(client, reg,
+						I2C_SMBUS_BLOCK_MAX, buf);
 		client->flags |= I2C_CLIENT_PEC;
 	}
 	return ret;

-- 
2.56.0.257.gf7497c7d27-goog

