Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013850;
	b=ktBPJGwnQ86iJjrqn9gpPvncW0bjmNU7Yn2oSMyym/XaRkIVIrFxWsq3INZPDJy665i9
	 MmgqZTgTVi9XAfg2zwxdOOJsCxrOzVFDgnWX4+Axx2gU2e/uEixDuyKthD058RMuLs7aC
	 3eZV9Xry/tQM2hzfxlMtWtsNIIVbwWLhdy74fYSVntB/mnbXI6gh5YQ3+vBTTeZyh2c3I
	 TpGCN9dQWBvgdYCQLfDEfMLDqlt/c10qYbCuzv0TeLwyCn+mbskkjd/SOnZD+OAiGWSe4
	 XDEnxnBXYEd7bmS6AOq/rEvq3T3QTHWYmfBdlTofqtWiU5JiRJlUfEKPhp+w3r7DNXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ZCcLPkE02vSHMXBIPmyiMf940q2ub6k3rkDQkOeqZ8=;
	b=rxcxBkqPkWm6aC8P1H5xw72wpKxBgqrH9JY5JAGBL9pAB445owx5ip+JN1QavtHw7wXu
	 leNzXDuG4MuCj2/XNnStEDEmywvTuH+eDNIdSHr1eL0EWlRcx5iBmcjDFrYZdfCDp/GHz
	 pn1BzCq1Ikp3Ogl3A6z/4AN4yCB2kMkkbJTO74Cyh89H/1OvkzXq9sWdW1h1NrtWawSZ6
	 c2y/cEuf2YsSUJ0TNoC8VfBbnJAZp1Er1gJVMDXNRpy7i0aPjogAdCv9LJy7bnFLoNATk
	 XV72hXzRhdP8Q4+4CpSOEe9A/E6vjNVxgm7/BwwATTNV/IbWS29hb6qb8YVLI/IGh3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F72iXN0y;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C350606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C350606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F72iXN0y
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5438794eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013848; x=1793618648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZCcLPkE02vSHMXBIPmyiMf940q2ub6k3rkDQkOeqZ8=;
        b=F72iXN0yFRLfPRlWjDxgJAnIr+m4n4vU9Ami7ER6qVccNBMPnt0tI1KoumsYSUNtFz
         UVnSiZSpDeHiQVyIftRIcnmHvseXQp4b+Tal5CGYSdte/q6zA6HU0r7P1h4C6LJ5D4Je
         lOYuUW+9bukg9iiZSdo0jmUgsuV0cRgVTvdG/pE19g7ayogYl6/BD9n8+4NJFbh3rl5C
         /aApeAWwu6s7I0hQhu/gtXLKyx/Jk9rySop6l2LubCNK/Ma5AQxuxymS1FRYj12HU6w7
         DN91M52Rg4CekbYmz0VoHzOF6g7+8k6guGZ3ySKB+K60c0NRfjcznFjrCLW4zO0YuAaH
         hTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013848; x=1793618648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZCcLPkE02vSHMXBIPmyiMf940q2ub6k3rkDQkOeqZ8=;
        b=es9v1NhSjtweYhuiMcs6K44pFhaDxyX/G6DPgVw+sfFbz/DGn16vnhBxmURuTS/5Se
         XKLHQoYfKLkv8otZpYUlKfvKBzk1+9laUW7WkpfteXCMMsYbP1dxUnNRBUYH3NxpoqXF
         Bmyr5EQV+0QFB4Zy6wXbKrsFU493RU1g/31KtLgESSIXUFcVmSuiO5Cg++oXIeSgXWfu
         iO0aZvhOOs0maCIkzaGR9/VOQvYIG8WjVl1xanS7WuPZez89kVF4VGAfktHbxPutyRWW
         nQtBpwmP1HHsDGNnB4z/SbotSIx5v8JWdVJwW8V6Ze7ju9ikaf2XY/LNwTPmkygUIyGy
         7oIA==
X-Forwarded-Encrypted: i=1; AKwUvByW4z5H9bp0GI2Ig8AvilPRtuolaMCH/nZKvaXGOIZlrwouGa1g9LVg49ONg0eylJz/5a+qkl3VGLPGyh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCBwVbZaHTp1HUcxHj78/NEHUaXiRxOLVOk6az7/1u5M3Ceo1W
	1yPzyeT+GZMZxtcMvqNPiPgGu2JKMHz+dWhoGtI+2bDxax4Uan8gdriR
X-Gm-Gg: AYBFou0vaV2BO5G7CnCTz5ey0zu8ULzb8aVMpkrehXZV4U/ZJDhJJdIc2yeqFP1Ye9W
	iNI1BGu8wi46tNv5pdqf+st2jWBA40AXnd4eyp3CFjPXg2JKSu8jX8+zgxiasR5SsoFZ9zsouqY
	4neg4QbPlwBe2l7QSNb30qj66aLH7eVjOhymsNB0lNykwYEA3Ho9HYvzcYs1rYfMq8llbGqB7cx
	pMALszy/ISLgfQYmMrhoA5avZmtgnPFBmwdb5skgfx0sOXltWvRP9kMD1feGIIdyKHmS61bgUUs
	OZAs6oxeC/tVniXBrWTyTPsm4Zg7lCgtkCqeAy0lnKK/lvhW0OZ5WVIX9Sp71ZRFSxsG3/sstX6
	1qwG2HUrpPDfrQPs7mgcoyykIAsCK80r3HkrGrX4s+qOCS+fs7URCw+kAHf88ZnfkXZjYpp34+h
	lnJcujMYxPAoo1hMK70LRHMqVypMW0MUufNmfahkzSXETJeDe9DMwQLfQK8YjSx2CetEAdo0jhi
	RNw/MIBrAgDtJYxlJ6pcIbW6TMsLb4+WZqG2F+HKJUXoxjouQ1ddo8vaX6ZXmuAVYMFN9J1O6wz
	I8Vt0Gp/mpZCfAkcgWQKjhTOvTUT/LJtOxcwj+hAlw/ImPtejXZ1FxBIfUk3Qx1XFHR46K+eoZI
	3MqfjqABkgAw=
X-Received: by 2002:a05:693c:6016:b0:369:f5f6:36a7 with SMTP id 5a478bee46e88-369f5f63c1emr5941419eec.16.1793013847987;
        Mon, 26 Oct 2026 04:24:07 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm6599989eec.2.2026.10.26.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:24:07 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 2/3] iio: proximity: sx9324: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 16:53:05 +0530
Message-ID: <20261026112342.65917-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026112342.65917-1-kapoorarnav43@gmail.com>
References: <20261026112342.65917-1-kapoorarnav43@gmail.com>
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
-- 
2.53.0

