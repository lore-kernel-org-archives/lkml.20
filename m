Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446947;
	b=EyvM2fPpP0SEOQxg4L5U4tBn3U8MmHhkdSZFyw+YOzQw/DTSYfKd6mC7rGy70O0hy2uD
	 /y/HmlxF3CKl10WEZKxcT1IH5vmRPEUE4hzs5xgIXkFkSKROA2XKt/sqgcXAyArY2Ynli
	 cMXr4wd4R46agfmSIy/Nh7ixHbjzUhsUOhytvLrUv8ggHEzVtpY02y1GFvQntzscgqMG6
	 vEgV6dA26/2q86996haPd02xG2uIcpOKkdlw8P3lCzqsocqVXe3NkNAALAKnhqEWbuITv
	 7bHDqq6grA4iEfA+2pea4T/7DtJc65ZtvalQZ48UEcVlgLQ3nTJbFswMvhukWTw5h+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
	b=USanNM6/S3jtvKtbH3hYlxnLS+WGHnlX5mNU/V1eFKZ2m3dEpX78LpxLnARqyX7bSfe8
	 P8Qu0hPodkA+r5Iw6FkWU/+8DaI8uYs/5J8OGLxqGDCYzazUJ8LibOie6TeYVpzF2q/az
	 canDnhVbg0RJ0r/++yRvvkPZ4ZNdedcYPdAycWoIXuFzd3yyesiTw2qyycsJjf+/4YQ+R
	 RgPVIESZeEUOhj6RQ0WoLuibtklGr+TFcGCDUAXsQAGGv3G4DFDr/EGHD5qvDrFMcaojC
	 6nr4WVL0jZAhwDC3RSPiz2Kc4gL0W859xE3qtAX6+oKuI71Tvb4/3YgmbSHcKqAf4Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJ8YMbfK;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8232606D17C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8232606D17C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJ8YMbfK
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4d7034a99a9so2225890b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446946; x=1795051746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=sJ8YMbfKCQHvMgcEHlWnZG82hdjV2QeAzXajEQnt0hxc5bEUEye3uvl5kfnJJeegE+
         rNbfkKwYxpsxi10JB2m0ODLzo9T2vV5AirqARfmaLgr+JbIqCoR54DK9KG1oYyVpw0XQ
         b7VN+YJ3nMFUcMaBi/OiFU/zP2ZwiZeXeUhvpNKyrdLx7dariZbwMlGDWRv2N/mxMBkF
         0a6RNkwLswOv5UT4PkkcpZ/T+VwueGRdWtZ5sTOskeNakAWbWj47zLbtqQaL0EWkgYiS
         +SE1tJ6NpH9uPuIVIaawOntaJpRJgh4W+PRjmlaXQfhdLd3VrYGv27aE5jlSqvICSfAc
         fY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446946; x=1795051746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=XCCeIeG0JVfdiM1P+7bu982icDtNoql7kqwFEXfYxOqPYDtt7cTI3zKBeB8G3KlLXm
         I8pvdZrs2s+IwA1zkBxQhLxtkFBVQI8Z9FZaCn32Qm6DGOi8UqEsY2LvgegALdIq10cX
         nmVr0c+YTMOMYapPEfdGWjM685myFGqXvLCQBJRoFuuRPqOkip+kA/39XCGJ7CXs6j0N
         pG9Ym1et7Amrm13JN8U/C4O63fQuI+RE9LwjznayUlg1v7CXraaEf1RNd0Vohq//yrzU
         amMN/WSljII3o1ylSdRiG92k1JybfZ3D8uIzd68vr7E3dow9ijBXHM8ID/wg9XpHzxOJ
         2scg==
X-Forwarded-Encrypted: i=1; AL+hErFTJm4+Ru3NpbpfCycJHBKSicUwp4Uh/9P8K4zjZLBDPiWOgENtkP7PaPjvSqx45E1O296xC3Cz7PEZcDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YKPcPQgF0MNppiKdhG8zV+ukvdlJPJtVSEnWa0Y9HS8KBFldE
	zU1JpTaD85zOu0L4yvifH06zaIqp/TF9LKBhyxWb/83NqCdufKFWTbpa
X-Gm-Gg: AYBFou2LQRrZDSuCl4L/CZKniOFsR+Q1PmBxckQ9zP5Q00b1i2+6sJgerypEDl+ypOu
	X3McedJTmutb0f3cwFYQ6k29HFxahXourSqUwVcbE6ooo72ONj4y3hyaVe8Ph1mxQQWitPzktm1
	w+/KlD2HIqYMx59VI2jGfKW/vxsUZfoWzcMQDd22+XPIv0WosFygjvwpbr8MrAlLVBT3T+mVQOY
	tevfb4I8yvkqePP98mbL6/V6Dqhm6yI3UbCTVuvq20u56ONAniD7EiOWfPcfgNNz+xzKzpwoBcH
	E9fvWeCIQcuhbNV3rNu6xReRcqG9xTi0wDh8KAD3Y5MC6UBQQKi48NqaUfrcRIZ6uwpY9vII+5c
	sXdTr3R7j+4S4s9u194IVpdwm/eYxNtf99pe7yyCArqgDyAsqq27iBM1r1WqG3FFX0h6bbqHiJd
	gHmT6F7bFDXQ9cEBIRVKX8j6g/AdAswkuBk5AUM/Zl3vzPMnJPBddN8tmMdUZ5z4lcWxlFQe7Y+
	9yy7kL3VAAZd7U8V4n3KSmHWgsnSWs66xTYG7FNMvIW04ygSKcdhG0B1R5pVahB8CUZ3fKgR7Q7
	wG3THgzujUPw9+8k0h71ebUSefu8BhkfzR6QKmz8rszIsIct6oGBpxZEhzI+wrVaNwmI1AVH4Ds
	BoVAf3n718hsCgXR7dgI5N2HNWJLZ7h9ZClJFj8Q0BnmjjrifLJVFYX4deoLHzNMi5QCsH68g7F
	4q9GHt2nKWsYj4hLa57HbP2BaISXlDxkM+8OMCYCtWu/UfGr8HHUOf
X-Received: by 2002:a05:6808:6401:b0:4d6:90d3:e185 with SMTP id 5614622812f47-56b97d0d831mr3893218b6e.46.1794446945179;
        Wed, 11 Nov 2026 17:29:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:12 -0700
Subject: [PATCH v3 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-33-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

