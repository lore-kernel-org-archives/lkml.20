Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009013;
	b=E0aQ+ThqunVSzbosfQTmxvhMdveiegQ9HIbKbNOcYgEp/+n/48Ff1WrLxlrDRLncGYTi
	 svxQXNa+y1MtKduelHPCTu4R3EMdf2CNXe7Zfk8UFp6hyWSQ15VVuUeyRMJaGx2rMMrvZ
	 Vz0CAntpfe2WNAK1YDf2a666ESqUbtxi7kYIzVtiGC8WvIRVoaimXqoGp2DAW6RCc+lNR
	 D4kaV3kQkiRyp3+ooVhe5UYwUtddaXzXEJ3ZVO6sKJdZ3q1qybsTb7vYo+DNWcHCfwI5W
	 NQFmmmCQ5GpHDSZd5iz6lV+1Iev1WO2H9vOhzD8dKoOqYYhN0WOzGgHCVRqXvmclEFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aA0N+9+a6HUkw1aZkKh2dECF/PPE91C41K1z8VasS3w=;
	b=dJ0X58xL1M2agPGBYIllM4AmJs0F6iQld1TAGQOR+mYp147rsUikObYS5IjgrQmt0kik
	 bEOUDFxsKWanV0ydjRve2XR8zBylc2j88iOUrApDUKyVOiJv66XFPNCrMCyIx1EK+foyW
	 sRPHHg8oRXpXn7UfSCOzGiA1abYezyMPouymF0XPJaD3TCwapjVPLbzgHcqhAUxT4VuR6
	 hdaTnqIflwCB+a+qQGSbbXUvix86E1dIKqaeo+DA4KpZjOY4TU5uZS61KhdRxmvaO4Vta
	 s4vE7WS187tNL2FA8K8c8E/XqurVS5DAlq54g9Pps2UgMEN0+GCc0LHv08eq+uqd1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rjIqSDZa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C68606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rjIqSDZa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35d0be18c71so4676731eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009011; x=1793613811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aA0N+9+a6HUkw1aZkKh2dECF/PPE91C41K1z8VasS3w=;
        b=rjIqSDZauTMVYB7mGCg/n2DjJFfKtE2tu6mHEnRzFoPkIxaMDmBEY3CXNtvT5DCY0N
         rWZ4R9Lnfy78ku7xSC/ljoss4nMVoz4UyKNmQmePJKHraMo51hPTTxOJHwOotm4W/MZa
         kZIX+OPt87nhv9OmiBCTtc0RkXqZvJ9BmgOBJOh7eJMBsi8ECs/LgRB6evjBuUAY3iIh
         KG4yC7DUtXrru3/11nfVKJs1mBdmJqfyUpD4+CxXPQcWr5jxASz6cNyAtIzX/RyclBPq
         sllWyNrVSYdgHd5YsLe3/3PQaBs4nq9rOZ6dQTw2sYp6UVLM6D/DmTrbnYBK9uBGKVyQ
         KeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009011; x=1793613811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aA0N+9+a6HUkw1aZkKh2dECF/PPE91C41K1z8VasS3w=;
        b=jQhqJLa/H1ncsvh1pcndTuhyd+OQJUX8uSb4fsxo01mp9zfg+m9VgdU9svb0Y07Efi
         0XZm/z7ZbRFx9RYkzbqfk3odx/GnX+tgsxuUfGF5WyEIveunlfgYDw9G24JQir6lhwrZ
         e7q5tJwU/4Ja7fPmWIss73Hl5jxy0uJ+a4jsWX1DdGNbFM6hzfc+s5SU0AEOLzrgTxCk
         B8Pthoy2h2VnifAzpppwh3wRPx1nzT1MfUhzvS/gegXB8cuX0VrMsLMvy4de9Di4SmHl
         qj+Gi24mBt1BHsfZHe3fr7NfxKj4YyORkGer5R8nDNeNPA6qoW2gE3djRFEukOHrGgq9
         eQ3A==
X-Forwarded-Encrypted: i=1; AKwUvBx0sxjFMw+VVsPwjv6hT6DBX/x5ubAizSlZcN3oCrkrj3F83g59iX/fx2UflewZEXSBwrMTWG8JGJBoGrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqcs5x6ZD4F4DP/ig68eNEIzynPlh5Fg5jxB/2szSb2TobJR72
	edwqIJKD1+CWC30WE1BxeJl7SmTUzg9sPknmd/PpJlzlmW73vO8/7SMR
X-Gm-Gg: AYBFou34TtcLrulqB9JBDxUz+pon9fqBa0yemPZ+XRbf+HdN/V1RVXH7f/6hqo7aWiW
	9jH2OJ6VKZ/ykrJDVoe9VROLkzNDFOF/ujBcIyvZu0BEYHyyiagJoYAna2pUuarSp1Fo4Ki3Tkn
	hQlmllSyZIWc8Lzs+yp9EYu4Mq3aDNBLzJ019ZfGpjEQRD8fMj6n4w+MxU6o1Jr/7pYgxqRbxSf
	Bvw7pS/CNHc49q2jmoYfm6cW7dmrSNdw45c1aesWgcaDUTDh5pWEHEl19FMFAZLyVQgfiDg5LjS
	LyCJQ6LUJ6S+1A8GkwEQ7tJNWt4oZC0K8SPlygId/Zg0s1Z7JJ0xVRA7EEP962iJObalQ47lRA+
	x8a4zObI47f4VLAj+22s+CHr1UulWs9GIAcBKhCJg163ludL/p9DX3N4libmjeJ9PVce7MhsMFd
	ed1Kz8aqPKovnVbxs9LYGwzC0G9Nr5lBw+905aca9+R6/NqfGBpsjNPc2eOX/gfgEhCkhRE3XnU
	cWJ7RyzoIdjfd61XDmFHJr/HPu9+eQ9uH0dRR6Ws7mncVCNRxyE/odFVJhbxg3yv0nvhQzyBsiC
	R2b4SNhYmStTuPS/lNYRo95WR//PI0SQtWVp5FAMQQGQ/noSvuEAgxNV6VzLr6kATWagahsAlN3
	jLQ1O2liXeE94WyBIz3OiUFPvO8cejHhA
X-Received: by 2002:a05:701b:4181:20b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-199295d370amr8732708c88.3.1793009011259;
        Mon, 26 Oct 2026 03:03:31 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm21246575c88.19.2026.10.26.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:03:30 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9310: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 15:33:19 +0530
Message-ID: <20261026100322.16720-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9310_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9310_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
I'm sending the same fix for sx9310, sx9324 and sx9360 as separate
patches, as the Fixes tags differ.

Compile-tested only (W=1); I don't have SX9310 hardware and haven't
reproduced a failing suspend.

 drivers/iio/proximity/sx9310.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..f462e8f9765f 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -943,8 +943,6 @@ static int sx9310_suspend(struct device *dev)
 	u8 ctrl0;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9310_REG_PROX_CTRL0,
 			  &data->suspend_ctrl);
@@ -956,7 +954,15 @@ static int sx9310_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9310_resume(struct device *dev)
@@ -966,17 +972,16 @@ static int sx9310_resume(struct device *dev)
 
 	scoped_guard(mutex, &data->mutex) {
 		ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
-		if (ret)
-			return ret;
-
-		ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
-				   data->suspend_ctrl);
-		if (ret)
-			return ret;
+		if (!ret)
+			ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
+					   data->suspend_ctrl);
 	}
 
-	enable_irq(data->client->irq);
-	return 0;
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9310_pm_ops, sx9310_suspend, sx9310_resume);

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

