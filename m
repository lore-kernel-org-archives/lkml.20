Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81F4734D6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247878; cv=none; b=iahrHBHuj51+Vep2C1n8kw7XsYufMlQRGu6J3Jt8PxT9l+BlCfWhxLUkTIIW140FjK6b+nZCGyZnf0I0z+aA/GQlIyiqGuhQIeQNRVfz2jrE81ovD8WIUxxxPTiJf8ZJu9XZf+KNpiH+tK/MTIr1onYjKCZrwh5It4Zbqisk8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247878; c=relaxed/simple;
	bh=gjl55k3HwxMMJ0LOIwdvjtRAZ8r4q+pBj3WpSnBkx80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LeV+kr4j/UY7gMRSya9LJLu9KK2TcnEBK8sKGsfbOLQMAqorfkJgifPFKsuYI03RRWDi2qfqSgyLtihyBhyK/dkojp5cjHO1haCye2Zp4hp7MqRsQPiwfjWPkx4nJ4N/zY0y1Rnu35pY6KmFeBshYIx8Sk4PlFGRh37hNnAgwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=st69cXnp; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="st69cXnp"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so878255a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247876; x=1790852676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=st69cXnpj/NYP1BLU8JOAPerkBV7sjsxkRvYaG1zTX+8mcUXQMddkELaYC4kbax0MY
         dG6eWHw2nSC+D0ux+Eakj7C//1APViDBvKmVCUFaYDSVIGn1KCH+1+JmrOzwEH1mMOAY
         N83AP4GPJlODIi0wXuqMGeYyMvUgvLQhXOYpuGpIFgzRvhfqs2NP6lGQJKN1OLThbEy5
         BudZFLqgwWc2vDmSC7y7nBaBOPnZD36PsSKaijXJyllWYSMWDgzclblyXGqdSBQLbA+D
         ttJA6UePPwdeMMUxBs3uQp8VJN703oPCufI3UsMIrToelNvo1FseyBxSaIVQRA+rhtxK
         toaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247876; x=1790852676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=2SjhU1SC1LiY/Bel1ZpJG0q5oh3LmBsCtqniClQjd2qlln+zLmguOsexzSIOB1OvF6
         MI+VceE80ja3hnIFiHOXKc/DT7VnnQEu1l9fJOv6zbXNMDYbl+OYYboJfTYZ14oj9DbY
         j4A45WXKaZouEs8YuG/qhPuDyBWeTZykzd/nmihBe510BIG4kOYtengaMO0gM4j09pFG
         Ww/DqhLcWZd+zq0hGqO2aW1vL5Bp5sJrwehnEj08YV7dGuWduDdb3mTuFfz+ur3VH9a7
         FY/gEBxvcsf9kJbVhqfSkODAdtFw39tQ/t1L5Z8UCAU78cchqZNrjVeUiSPGnoYlFt7W
         Qiiw==
X-Forwarded-Encrypted: i=1; AKwUvBwe3xAiPAVAePzKTiHZnGHzxtdwzlFYVFcjjTeZC5R4ZTLLgVsHZx6WxvCfPJXEr80IWpwOu0iskX1TVMo=@vger.kernel.org
X-Gm-Message-State: AFuF++kgecectp+M4n/VHDd/F5NIEuxrR4g/dqR9/p7VS1YxEX/Dc8Hu
	lacr7wawBc5rdpq1f0OT11qVzXWVzs7FltbpWlE0CbHefNPb/RsershQ
X-Gm-Gg: AYBFou0Ynbf5RjxSUeI2+nnnHmfK8NPO0vCIC0LwwKsEeifrszpLYy1LTq5mkY1jy6u
	wFnN/6tg/ak3/g8cINa0mSJvalGQ3GFLFb64Uq6VYYUdE0lL0x2JFhIm9PvSP/Yv8jyY9so7ZUN
	xGj6/e3mFodlDirmFUMLfMdOzy/LnpZVLACDsDneHP5LZBAoApmXbzhhpvGezHIbTJJnAFUfnfV
	JxAZlnfRgOgaapT9sOop6LkJTZARSdrw9RkFbrPrWjscEqWlB9XKbPRQ90AIDrtbWmrJeEDTT4Y
	7lUJaprWy3wqKaKY9qk3OXxnVxxvxzphit9m9ish/SAH0bR+FMqbASQP77zeAP7z0gNZGnDzW7l
	aiPmhEXWzge5rRZxUO+QsThy9mZ48k6Izl4Kl2lYpZqm9F1p2lFkASDZikTcVsStLnWeKm+x7+f
	MTvtaA81eksCg7F9g9xblm3sJFn/Ra8IQ5l/JunrY9O0L0oX60JJYkfD4=
X-Received: by 2002:a17:90a:cf84:b0:3a0:9eb1:7300 with SMTP id 98e67ed59e1d1-3a09eb175a7mr737462a91.49.1790247876472;
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4356860a91.3.2026.09.24.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	felipe.balbi@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Date: Thu, 24 Sep 2026 19:04:29 +0800
Message-ID: <20260924110429.1557653-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
present, but dwc3_meson_g12a_remove() does not perform the matching
regulator_disable(). The probe error path already disables the regulator
before rearming the reset control.

Disable priv->vbus in the remove path before reset_control_rearm() to
match the cleanup performed by the probe error path.

Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 4d611c08e8a4..7ca6fb89027f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -851,6 +851,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	reset_control_rearm(priv->reset);
 
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

