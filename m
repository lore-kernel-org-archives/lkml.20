Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009059;
	b=rb+T4Sdy+1mOHiSQchMetybcaH4RMgXSHWh52OhLDGzx7jspd0u0XK+EAbQFn3qNOtJm
	 FyLSsmNYrKYBKKBL/t1C9LBSJC6PQOQRihG6LiEeN/SUC9PViJhdKKN/+RbzdGGhEPUzr
	 UHK8cbUF4QUAzp2FVtrbZiei9U07ChgV3flVwDkzftU2muXP1eoRNK5ZfvYKpUSvgEyBx
	 jKvrZHVSXQ+rGNiie2Qj6+hnl8JxLpKa+r1pM5y3cHayj81s8c1mlAFJWXKa5bbXV4476
	 t2P1bv0xluaCZGyDPl7VwZk+HJTEer7MqlxsNlVo0mctstq1Kv8WLEP508cD/ihHHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SUhKacUPcEfGkuCQUHnRDcpQnpQhPiml5zAmvcajhUw=;
	b=KOswsCznTxouDe4RPvz6WB4Uy4fs2hOpqmeFTTFMGUXTRguCLymImwabzuF5pv+MLz/1
	 LJc3EGUO6K9GBLhMIXPI3r8Wf7FaHtYimfVf6aRBXk94Cbih7UcczC/PcA0Hw7YT5eKv3
	 fB/cUSx7UQ9QIDCbskkQxVcViq5TKZQoHIvDLUqc48QLnvtWNX6rBybJkQAeV4+OBtNW3
	 6torDQQgo2cheWIb9+AI9aNiDjM0PQvnSIvsXFYccI/9AxCSn7/wFklo2X2slJ3guOQP6
	 IydVOv6fa/DDt3xb+ZWHl6lfqrdcz9Lp/2jWHf5jQsQLJZF0YT3BoY3grsn3s8lY6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWNVRc4q;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30811606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30811606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWNVRc4q
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-156cbe59622so2008006c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009058; x=1793613858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SUhKacUPcEfGkuCQUHnRDcpQnpQhPiml5zAmvcajhUw=;
        b=cWNVRc4qTggKC791E3iAer+uNn1BzzT7ShEeMYdtR0VdilgdzheLhP+XJr4GpyLVIc
         RQM53UFWaeEcNnT0sSW7Ane7LAkTegW6ghX0gS0zc05CRGWjUBfIfIoclrJLt9Yl28rX
         VX9ZooqhGVzVt1ASgB9bmo3W7yYkZqkCcDhuIT2vcx9kg2Wd7hUFMsWRJM5ewKv4C0rK
         MNip5c4uIr6kvkl9Sc/4aTJpNrKge/bSzZZEwBaBy6CFfhbJ70zLAJdY1RDy3K+Jc7LW
         WTQNY50Th4bJoyIvYyAfxsXalxFYvNM1fjsRCmaIOjBvhQFadpRPv2Ptozd4QiX2PVLo
         A1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009058; x=1793613858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUhKacUPcEfGkuCQUHnRDcpQnpQhPiml5zAmvcajhUw=;
        b=UpJLK1oA4UafgNlBcXiu+qu/N030TtY+gs3E1WomA9Ed1Qrmt3z2GvsXncMIeihj05
         WrjJ+KDetR6/KJ2sIUIO7+LGiKD/KN+iD2AMJzXyGV2IY3DujzKF3v59V74sn/E7e6em
         yK4rQidkn/sQkjKnhE74RDRmI5Eo1D9FnNb9nMzr9wdwvllHkwt8RCt3ZNleDoB2QItc
         8MK2uD+5uLbdePHdtQ4vhNFfeXJisoLeaCkXgtYe1MVtmHKKyNaRl72/1KFYMLSrIYMf
         0VvQkr5WvXxldG/pthEJxLT0AHs/r84vlFM5OW3eH4KksDizwoV5+2O9hDpJf3g+F0kQ
         9X5g==
X-Forwarded-Encrypted: i=1; AKwUvBz55Fg/9AaVxLrp+6BpSAdLXyUqvLvUcRLnFUW+EZxSPmPlHp+RHJiyLcNZv1xme5HMtJ6tv/zBo1fx5hY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC8+32JLaLMA0TnpWMAkYgENnYVz6R6RliUyVvQTuorqlaR5Bv
	QRvX6Gr4KBnoKdV4pLooAoJ6DiFCNYE4YN4ugy7x7dfLS5k3EmrMgMI3
X-Gm-Gg: AYBFou3M1eFyAdTbaLqDhcY86kBlBMRkQ+40rn8t1sUYKTx9XJ+1gMpq277bbaGSIuU
	vaPS+74EjbtID8rPa0PtJgkw1w8RvMZhGTa7jTn/DjgfvD2+P8MI2Cm93hyJRlOLc1DdzmjJmAe
	AdC1NVyJxCWAqlCjfOR7hZWAx0yUFSMVnJT1LQSfMONDdm+2Gbek1jvJ8X1u8pZLsrVtzxmfRtK
	4eeQGjnQ+6hx7zyifkmDFtiuipf0BBX22ZyPUa1Y+yRYx9oOBoxfjicvdBEKwengiF0hxg0YKTl
	fdhYUe3PAGocPOF7/lNamp6lDid5WrKGqAKH5/R7CBh9cpMzIU3mGUNUZEsLsAX4x0FwLfgkYNh
	x2mWUZl7PlruIEo1f4jXGTzMuS271gzMg83KzM5g4kTllzf+kE1OO7cSPAT6oYyqkVclE7bcPkT
	Jc9AZ7LCPQeGWcTekzjnBYiZhyEsURZqxQtWOIXPdFVouOAzFyBLiyt1aLsRrD8pGvubjp94cYQ
	uRXiZM6ytqwmwGGdYSNMezpG75j2mmDgxoK53GwRE7sUPFIQEQdwcYaDkea8OppyRg06Bu7Xajt
	LHXA+I+bMpUI5gH/+lncbCxdOwCe+H0o1ShjRUQq/v1nfbLpZ75CPAlT7QOAQNhUmADGK2CkqMW
	mwrqslUYkOO4l
X-Received: by 2002:a05:7022:1102:b0:168:6ad8:e88c with SMTP id a92af1059eb24-19936d407e9mr9640122c88.39.1793009058020;
        Mon, 26 Oct 2026 03:04:18 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm23800633c88.14.2026.10.26.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:04:15 -0700 (PDT)
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
Subject: [PATCH] iio: proximity: sx9324: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 15:34:05 +0530
Message-ID: <20261026100408.16874-1-kapoorarnav43@gmail.com>
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

sx9324_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9324_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
I'm sending the same fix for sx9310, sx9324 and sx9360 as separate
patches, as the Fixes tags differ.

Compile-tested only (W=1); I don't have SX9324 hardware and haven't
reproduced a failing suspend.

 drivers/iio/proximity/sx9324.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 255a36976ac4..ced415747a98 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1088,8 +1088,6 @@ static int sx9324_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9324_REG_GNRL_CTRL1, &regval);
 	if (ret < 0)
@@ -1100,23 +1098,32 @@ static int sx9324_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9324_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
-				       data->suspend_ctrl |
-				       SX9324_REG_GNRL_CTRL1_PAUSECTRL);
-		if (ret)
-			return ret;
-	}
+	scoped_guard(mutex, &data->mutex)
+		ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
+				   data->suspend_ctrl |
+				   SX9324_REG_GNRL_CTRL1_PAUSECTRL);
 
-	enable_irq(data->client->irq);
-	return 0;
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9324_pm_ops, sx9324_suspend, sx9324_resume);

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

