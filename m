Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896545;
	b=O0VfbVGDdraSXjpEY2FZ7W6BxhVVBt3IxJIQOmOsyJnyMeP1ynE403qdR5UZDdeq/+1R
	 SWhE0KwZr7nn1g6MHLmxc2T+VLoS4b2KQ/7MKvpqq9qYBmCBsAAHDL2Tn+dF6wrPbeBVn
	 D3cG57zDjpkeX4URy297v+IK1iL3+IFuli7j+e3GoX3Gdzz7k2GHKIeLg+NO92LWB3Uvy
	 d9nM5hspL6v84J8G015s3pojcUZu+0yA6igxhFwzagjUnsQojQOOCpMQFLc76WAMLYhjI
	 YsfeisWmHArbhnpLBTDRNHOfxQXA+LNTNMErZ4ven06we8dF+3FfqwMvV7B7aZPvrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
	b=5ajwFQQNMvMyoXc8HBOahdJFuJcvl0gjn19XEA7xGaSmZXB5o1/CAFPkso6pC+2e/Jrf
	 gBcilpYvUmfu4hKZ5vKqISaKLpU6A+JPrSM3qvxkczdTQ0tuirGdG8XZLMRL/Y6Qwylf9
	 FSCZVool3fiz+4IhDaKxxE41fZUkb9tLQ9IFxMvAli+jykAOvGasAoD9n+3zxuoRLuGZG
	 z+ky/PoDPoYc+i9HxMKXFwlcI5h7l1W+xU9Vx4ERDNr30DlPzUHnF4yunYNGAPHFaQeIO
	 833OYhwh5emduvnT+Q4FVJRmsyRoUUEz0WLKnpM2QVIeXrfc2mAE0BAxOpHbBYIX9uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRUtJt7G;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CF60A2607
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520CF60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRUtJt7G
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so4101434c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896539; x=1793501339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
        b=MRUtJt7Gkp4vafFe0rMwqOvDHoXxAMNyVJYKgIxP6STY7JiEtaQfRGX4Bfxa00RzZd
         LL9z7cyZsOY/4U6jo0Y82ZKnYeZ1xnNi4d2t5k2uSo3AfAtxKMndyfDNAgGYy05aj8O3
         +NOHRUj7mM7v7fo+STYhhLtoX7v3SUKlWkXZeFFQzfGnr+1EFv7yXE1lbrNRa/fILIlL
         PH4YGconi0OlzRG16TfoWqLahojfLcD9IiRsXiKBSsaWXiKATHLwZ+qecfhZ4HPZyt5D
         pN3gc5vWiZm5akOtpG9Dj9qY7/RqqfmML7d/xeFrZiipH2FEafl+aiMOHS0bvZbGQNJD
         kWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896539; x=1793501339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
        b=K1N7+iHbi7W8ansZKfJsbBclqq+e4d5BCk6mLWq0HHLBwgJCVV5n+aytr2uB2D7mpZ
         uu83+9BBymJgiFFuSPoBllmur9+nVYHejPbYP3w9xydgTjXnYryBr0snc8jKl26ParWS
         YuQNZBM9hx1nQ8bA4KdHaAtBNgg7tDZm4MKJGboSDU6PRj8H9Ka4vBSSvyeAJIqRpi5I
         LqFM9JF+eOOUiL4FpLY5b8CTInIlM6nQtpwMCwDLVbxOJATKsKg0OysS90Xbgn+o9pLj
         P59ee8LdzpCZJlAIU88gnLt0sNg0zP4GyKDDf0FMp9FupibaI0A/PwHlUUB/hDmtOIKI
         Vphg==
X-Forwarded-Encrypted: i=1; AKwUvBwW5vGsF4g+syhTZvzBd2QlvxhBPLr44rD27+oxJTsu+R1QdvQwf4I3/e8OHfWQ+Ux9ggqCQdw+EWcCoOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC7xwqyxcMcC+Rb+s61OAXkXaeah+PzFPtyVl0+Ea1ebv3Jhl0
	FW5awJNR7SxGEAhRA4W4u0ycGC9IE//8Rlrb6LnUE5jgrbkntliycjvp
X-Gm-Gg: AYBFou24sO8JVfpjrTJx/QSFqAuHCjtiTArCAXcYPfExHLv1P+vC0mDrrHIDXOMagb5
	mkfyRmfvl+icFU/5IR6la86rLkIHClbegucXqzgx6wfXpuBfyxskWLWyPOVPIXG+/agJVbSg1Hz
	zunnYwZjkdGa/1byGzFNUEnkIPVA1aa/1yi7fABwXzrboAsB7o1nAN5d39bUQLKXkvLloh0W87T
	ejVoOv4qYIYTc83IbY4gitxBhCAYHHzAkuK0ELszEyozktqgM5mSn6iP/6kHhez3IdC17djE473
	s4kCUxtzeito9PYUC5IBcx/ggy7dO0Vf/wz6Q3EIkcrrQMVqqxWf1UV6pEgu/z+Ub5AQ/8/5UwY
	u+3Y12zrnzoGvvqsBvaL6nL0IgBlMWerlOUT48wyQtBc6/UVWnJW5/ocPuEdlTApEnsTTTq1xmv
	kHzLpiJAke9QIG5gxnXLt4UxSAwPvHJU9yRQz3PmsQPi5v0s65cuPMXFja0CldNtwh3LktPTNI2
	1zPn3YSv00SpTvu+mJqosgAz+e418V32O2fJX68arpvklCst8ltPnNT0dW/txneY1TWVjLJaqvB
	jcmGv1cbFwh9rY0jYE7Xe/Xx4KFsP6Mk36z/PCGfBSI=
X-Received: by 2002:a05:701b:21c5:b0:194:b2e5:473d with SMTP id a92af1059eb24-199298b3af6mr4872191c88.5.1792896539394;
        Sat, 24 Oct 2026 19:48:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:48 -0700
Subject: [PATCH 8/8] power: supply: sbs-battery: use 4-argument
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-8-19bb97467982@gmail.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
In-Reply-To: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the destination buffer size to sbs_read_string_data(), and pass
the buffer capacity reserving space for a trailing NUL terminator to
i2c_smbus_read_block_data().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/power/supply/sbs-battery.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sbs-battery.c
index 6714313bb3a3..f8b194c58a62 100644
--- a/drivers/power/supply/sbs-battery.c
+++ b/drivers/power/supply/sbs-battery.c
@@ -424,7 +424,8 @@ static int sbs_read_string_data_fallback(struct i2c_client *client, u8 address,
 	return ret;
 }
 
-static int sbs_read_string_data(struct i2c_client *client, u8 address, char *values)
+static int sbs_read_string_data(struct i2c_client *client, u8 address,
+				char *values, size_t size)
 {
 	struct sbs_info *chip = i2c_get_clientdata(client);
 	int retries = chip->i2c_retry_count;
@@ -440,7 +441,7 @@ static int sbs_read_string_data(struct i2c_client *client, u8 address, char *val
 	}
 
 	while (retries > 0) {
-		ret = i2c_smbus_read_block_data(client, address, values);
+		ret = i2c_smbus_read_block_data(client, address, size - 1, values);
 		if (ret >= 0)
 			break;
 		retries--;
@@ -709,7 +710,8 @@ static const char *sbs_get_constant_string(struct sbs_info *chip,
 
 		addr = sbs_data[ret].addr;
 
-		ret = sbs_read_string_data(chip->client, addr, buf);
+		ret = sbs_read_string_data(chip->client, addr, buf,
+					   sizeof(chip->strings[0]));
 		if (ret < 0)
 			return ERR_PTR(ret);
 	}

-- 
2.56.0.257.gf7497c7d27-goog

