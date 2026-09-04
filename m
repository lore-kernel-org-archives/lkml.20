Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BF3AA182
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511391; cv=none; b=eb59nIWsxWrrlne38uKQ85GSkD0X+tfhG+Fjmx+sBJxP4kH5RBlFGSdgBE3V+jX8ROpkiVOGvMyzzBU7Xsx4SvQi1EaBGMUlMciOOSaGeY4hwMuKN9pZokxHt5hMrio6Z1XTc0DNnStmi8U/FPZvTFT2LeFw913204pwc03EwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511391; c=relaxed/simple;
	bh=k4P8O6O1bZN0BviRcm5rHj8gLkm4KLla0pyDEJs44j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tanEUXFH7Yy94cPhjhQrB17DXorf4V37Z7kUpVYWBbnJ3Z/Hcc9RNksxX2ng0km+a/jyU07Fj/Lluq7c6aikVIYC2OnTJD0XgI8Z1KsXPpKgRWARHLWmEIftbwV/X/MNidA22Tj56GZ/Ek4n9TzrvapylGrBAEGUITtYs1nwYm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b9I83p3G; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b9I83p3G"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db18e5cb56so4078405ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511387; x=1789116187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=b9I83p3GB2Np56mdhqhsSbTAz+2Z1AvsREg4rzk71ni1TKMmew2j+w4krqcYmavOpW
         W4B72lpYkAqvp8a72htsbsfGYPqVeWsr8/7WWY6RuN+XD7PXQAPnZE5vCmY9HXs2dYzu
         LdHIezwu3hboKSvIrwnTyAuCMj1jaoKZN1C4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511387; x=1789116187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=QTYW4zBZEbmKiiSbQ+34HTJjq6yLGY+d5uN/iQMpRXjK5/0VghX2vpVvKfRkLGZ6Ir
         iEqbp+dfixY9svwEt3IWdj97SKj9ke4CYkwlYrJhyWU784UAx8FJgsWHbBXztL7zrpDI
         OYQ2qDHm30PnrMsPbshNH3yDooU1+UN89Pd+btFEVYNI5aeiaeVlWeHMFdACjeIAgtkQ
         8sgFANWaWf1gZJeiwJBTNuIWJfllb+hzbGYJYrRhkKotSjpgeph2q5dw28SyZFE1f0bO
         YPKGO13H9lS/D1FU3BvfE9EFbTxAjcCn44afbnFATgYeade3g/+5HKEsMW2oAU1Se/Av
         rEcA==
X-Forwarded-Encrypted: i=1; AKwUvByoNd/JO7w9BY33ELzK5C5AADJ/iyxJq4/xXKA7R9KZLrS9gi2AFNlPL+cV0mXHrHOjiDt9AXf2thRLgZs=@vger.kernel.org
X-Gm-Message-State: AFuF++ndNbnspSc8NhTxLf7FISe8RRt5djeyqUMYdI2fvVG8ZIf+MXPV
	NrxfZ6D3A3y6Vgf/UmywFWxSkv7F+OBt9FYLH3vTQB6+0sC8b8a+zn0IZmfd/j6ZJQ==
X-Gm-Gg: AYBFou2XN1jO2Bh8kc9FWMdf6pt/kBjGTVYkWmsrHtBHN0hu9SmtR/j6oZHaXctCUQK
	LyQhvpY3EMW0ahtFvAE6gKkCxHuuWWfKQygmqbzJn3DcLHG2zOn9wSQYe3/G7YS8JdGz0Yx8aXj
	w6ZLiElTXfo+Yq/XWR63cd/7tvEP1rR8pLbNOA+LrOV0snB2spH6KkZoTaGx3o9cYFu4gVo6UEl
	838sj2Y4/5ORECxCQuJDsSzXQ5XPIdo/FP8I5RBkyKZyxJvq1dCmIaXfsVefajzXC+HXnCKUk5s
	+/Dm3OlntUJ7Zhc8ghyhCTQXS7L6gCMvM52C2aKuBLC/Lgzd1mmLp2C6HyDLtKTtf2yqwtprkkp
	2x9fLLiXRxUi9vkZ72bJm679P/MZ9ojv1/Gd4+GfWBmfxWTdXk1n/Tmu+RyG1ScF2M37/0Hliwc
	SkMLFcG/Ysk2+lDOKTsdpBORr6h9QOdRwIyJKRlOtI1hViSNizFeE/IidqDumexdq1LdwJmBgzw
	Qw3J60T5mlDFevcwpWQ3pAXibWa9HHWstvoa27my6uZ
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr6986016a91.5.1788511386742;
        Fri, 04 Sep 2026 01:43:06 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  4 Sep 2026 16:41:44 +0800
Message-ID: <20260904084158.1341550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 16e03ec8d1ab..c19c9912c740 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1870,6 +1870,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2001,14 +2002,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.979.g7e5102b832-goog

