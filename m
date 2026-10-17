Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0ED30F927
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792270361; cv=none; b=WunGIhmvFlfWG4+uYx9yYLW/keiwSACGr0Rw39j9iVkDifB3UxchLSFjjw7u1xZGlnHg4FMrTYh+lBnh7cGNAeksFx5/JOCuM8/reiPpYKXSGrNZK6YUxwvzB4Zs/8TkKXCDaQJYM2rpHAt9exwcmFakpyCknTFGsoh1BUv6ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792270361; c=relaxed/simple;
	bh=7bdSjD4gwsCJoWA6QPSigC009vO7jVqQkp3Tp2a7H1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJBZ7tEnm108LpQKCTIfS26CjA/PhaJMB+AwySr/j/xEKRI2ND8wuK9xsbWh6X+E4RbjTYlPGBchWSPikzvL1nYfuv3/SzZdQyCc7Tq/VWbKCjQN0p4SOSGsUxt+8jwJoAs+LeJ0SucSYaHXdNwKb3PyrAEEL4jFo0J+moZ9164=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFMkRKPK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFMkRKPK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso497128a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792270359; x=1792875159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CcMWlmXFcivfr2U5My+Uh1aVT0DIK+Y+H5HexutNao=;
        b=KFMkRKPKDXJ9syjceIjBf16YcFraILfhVtyYTjrFSo9aBRUDaU82znIrmK4+kT3Msl
         D4YNeogjBEvowUHOBljnEwCMVMzPuHwBgIBg18g+WWFI7fvsTAn+a5AI7ebvka0lH9DF
         DQ1TjW9Pnu24PoIqbZWGLw2lMUJTHmaCvtu0k783I/axrrHpehMWDr1wyNxEnzVSPZaI
         cx2W9JA1mop1eY9x6IDl1YuDcRvbjGsDdN0XC5MwTS97T50jxvmUyHQIUm3mgJKXWJt+
         Cs4T6SECsaKp2D6u9xMIJlddtA1IJwcMb8EIGGvXgaDFHtq/Ll9Kwu9F9Ej8ZTerrwJu
         /G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792270359; x=1792875159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CcMWlmXFcivfr2U5My+Uh1aVT0DIK+Y+H5HexutNao=;
        b=LWcqdOTPGlM07dl54B47CClMLKX1nbw8CjEtwo7LqYJD2QB+ujZLphoUAFP+PLMvjd
         6xD0cn69VjtO2jOJ7IPPX8pkVRwW3N85IdsjfOnuKoLsxZ28jjU65NaLK3zBbOdrm1e/
         hpMLcdxm5bacepZVn1v12VOBR608xONB1OHIKPbj/HH08Ld72cD7CZjp1geu2jPddxBH
         0wlrCjTkEGWJ4u+XDgHrBqU7LKRYRJ2hK8fS5lA6NWN8w7CkzzXS2fjQdqX+mJhBnaCn
         lW+qHqUXIaqS9nfzBwpPw8RRJAZvqMkMtLo1h6kOo62vdvGMFu+/gMD9lyr04W+w0tEH
         PG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2tZf7XzpllXjYnbVY+5B6aseuEEcNguWWqT+iS0qG2ShcRfBSxMHPY/d0LGVvE5OzZGeEiDluoZlp6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMD/+L1JUQrUFdmHUW68y+QnNZPrdmO1OoRvsDonq0lPwzI/4O
	H0LFSN7/mmrAQLA4KxExfXBzDhApNoZNb5g3rEECz3/h6VmQSInc6F+J
X-Gm-Gg: AYBFou3ySsoUxTua6OiBBkA1kfRXcYDfWiMRTJoDGLqJCqNzyp2FL/0A4mIas4gpoLe
	UzcU3LLIUsb2wAhkoaA5QtoqP+Miv4uM88c7bp/RlX7cdDH9av6JHz5KnoKKj5cq334fr5HWKB9
	B7ogo97zm3uammoIjvzyCSfDL1CAmYjCdD4DujTpo0SIcKVuVYdHBBlQI+mz3oafIdOrOEQPkER
	fOoP+3UteCH4ozfOuc3OcrgrjFpBVtC4GmWUacHF8QvMz3nnm1uZxgL+Rem67egUHbzSu+XjhQF
	TFjMmW26DEvxhxdTjEefw6XU4npOkWLDxp+Sc4Wq1j/mlm+W9iptG5cp0rR9zfOZgHZZ6N3Y/yb
	0iQiZd2zEQ87G8BiUm0E9KQe8Hwwx6e/XlgHwtT0I0UjUX2QCfn+fo1hwsokVZsxMvv0UmMIbWm
	cb1fygb58iZQPET/F4hgs3T7R01sLMt6uTKxln8YH1G6h7Qx6yP4IFBop9Benz3DcAF8BEzapfz
	kzF85nR387ogblbNvYXvXtkPQ==
X-Received: by 2002:a17:90b:2c90:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3acef0fe32cmr2898931a91.45.1792270359012;
        Sat, 17 Oct 2026 13:52:39 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm14288430a91.15.2026.10.17.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:52:38 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] hwmon: (sht4x) Reject incomplete heater command transfers
Date: Sun, 18 Oct 2026 05:52:34 +0900
Message-ID: <20261017205234.1084949-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heater_enable_store() treats a zero return from i2c_master_send() as
success. It updates the heater state and returns count, so another
attempt to enable the heater fails with -EBUSY.

i2c-virtio can return zero when the first message fails. Require
SHT4X_CMD_LEN before updating the heater state, as sht4x_probe()
already does for the reset command.

Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with an emulated I2C adapter under ARM64 QEMU. A zero return
reproduces the false success and -EBUSY on retry; both are fixed by
this change. No physical sensor was tested.

 drivers/hwmon/sht4x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index a97dda9e92dc..c4b3db55de8b 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -287,2 +287,4 @@ static ssize_t heater_enable_store(struct device *dev,
 		return ret;
+	if (ret != SHT4X_CMD_LEN)
+		return -EIO;
 

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

