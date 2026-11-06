Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945586;
	b=vDRenT2ZEpSG4ozlryIgM960gCXiLhdp1e1lvpVSqetrU1x+rs/65+GGoEdZkCLY/SwU
	 AmMFTSNmvmxsDFSCmZgLbwM40QWFgnMUyhWFx92IiBvJnsvIUWEGff3b5jg0GmZaEOTDk
	 WZDVfIlYapNzg5RdUs/Mbdkowe5fJ4fsgn7jzkuEuChvqFx8YsnX8dQJrlzjD8oSFRJPX
	 /t/GxhYiFWHHFA5pk0RYtVu/ZC4DjLJ66IGgzAR5a2MYK3YQ6JBZbVznnwMq81IXjEFEQ
	 sCp64FXUGYijRICrKb6c8bCg5vYCMKBZY+ZkIn+gYsA+RBC++/xN2ufHFH86Sa4UHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
	b=dQsPClh70iG4eoPPlTBoei0KDjgkf1U660RRiilzv2gl378UXddwkwRY9vH4PIjNxEuX
	 t03lPEgaJ9ipW5DjHPIlA2jHeVY9+9y8t3Ns2T2Rstj/0N0K0HTs0HBZeZteQYQE2sLZI
	 33dtf/kU+43C//BqXJ6Q0rTwNQd3/+5Xf1aAbAh5bx6jWyE4lGoOCwK1Cmzij484azXV4
	 /PYmU/kvGIU6iALhFb6z9/hdNcHxYk9SqOm/59GBq7vkQzKHqF0Fgqjcw6WdMuwsDhMmv
	 8vXvgVBdH/RUOPWHXYsoKh7iNfdtwb8T2pHQ7ZMRi3RwewKC1oDOu0c5ISQdatpz0Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787CB606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QCLPKEfN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso424153eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945586; x=1794550386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=QCLPKEfNFBTyIMCl1dj2v+zqSSbSLitFj4Xi7Nv0VJYbPr59+g6B5LTulPqi0lF+La
         Tj4swyU3Cti/Jt+xOGFYd52pn1ZiUBI2ooWFEu8x42hqm26flSJQczxH8972SA+lXgHA
         +Xgvw6ywBlIJNpNNGftYSzaKamiFQ0YlM7IkawmKRcPCy0HPFFQ+p37NLZEXA8rp7DXk
         YLmmDkS2S98RZE2y58OlrVemb6l+VXAfHHQlQpELuR2EeCdMxmfHINL24ahOk/lfqPeN
         KLixePl2FM42xXWyItpU+ltPQLk/MTX9/GFk0kkF5KJ5zKtyIl1AP2EVjj0m8QK7hd6C
         WEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945586; x=1794550386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydVqyV0aRoJDaWfDPtWBdic6N/4Yozo7V/PmjjVO7QY=;
        b=OBHIEssuoj4cb0LqMgCu4HFYb6gpNfIKMyuvv4PLE9DKqc63de4QshX19yR/nEkTuO
         3v7WFnA7o+A6Z/kbK0VTkoARxFUDxrW+uDkxNJzgIp/uGT+Is22Kp3Ih8Zf6nZidFUDx
         g2xLVK5kCNzjjvc1YlywHEGt8CVqJ/6P/VXf67mJSv0S0H3GjztyjIU0OV9N0qxDf9JH
         RF0Izj7C1mB8n9bHCWh5N6vTIzGJSr6x32rcpnxk4DNgpcPlse+hYwnolJaE4VD5SFCm
         ZGhXA4KWa2xsgj24y0WBN1JHmu+eaLdmIEes0trz7wL2ihDlMuqcdXnQq3RLrnZWkv5T
         ElMQ==
X-Forwarded-Encrypted: i=1; AKwUvByG3uqWbr9oXodX2edBEMn8tj/hPJ3F1I4IFMosyMsea6rPDC+iX4zHHOFOwkbewsvgyOC60jLDvwHnv70=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/t0XkucykbOIES7jUj9/slmaIU54mWR5d6xqkIppveUmwpcjU
	t1XKpqsJsqA+ZHvTXR9P18N5d2aHEZq+bI3SOGfAh53Snsgw6DVEQwdLiKJLpwoBLvqQRop5QHe
	JnhziQ+pn
X-Gm-Gg: AYBFou1pNXJyxel9vmhyIX3A6hnzWszTqJMGaomEj+RDSG4hFYP3eQyo98TocrK/Lzo
	F9+aFtHlGzrtdbhCuspScTz5T3qrEnKa+2GY+yAIbV5/R7LfyEr9wBQBgoUfoPGgCmfRoIjAhBm
	Vwy2+CuBoXfvLuXvRVe+oe9UXcQTA7ozrsdgSJCmweU6K4hKUrNBwte3Hpvzocuu5YM6ddxMKiG
	GMaoY0OxK2LYUMe0Cwh3XFBMZsWDmhbE5E81oNBOaJ9TwNUl2vNfL4YspNChjOTI9N2IcDE/6CI
	lk7gkiPvJPAlsYrrPpFgGA6QbcI3w1svD5TLphu0c3oT6+GEdvtExkaQjs1KLf+lCoRYALDZgqg
	2F5u0FBOT2PE4BuYmZcTw+fz3g1J0V1ZZfJH7zoi+CXsTJUzYaU2CYyABhlT81ta8qRSXJuQuy9
	DQ1EVMHBPvKH2C5rF/P7nDnA5RnhGCUsbWb1fsVaFNJRlBnmwj/i97Rz7Kq9QCxUQ4O5Qcc7+AE
	nT/2oK6/n9zIBojc/JgON2itQuhsKJsS6ddHoaK5OLmNuxozWC/h4R0oP6C5tSQITJLzrY/C2LT
	VgB6a5F5ZbaDnLIvGouxdkz9MJJNzMNYU8Jqq9mxBPW87mLyPZpAp+7aTeB1it4aGlCUCpaPK0A
	FLn03uzp8wxSG0GkSkw==
X-Received: by 2002:a05:693c:8843:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-36f75443270mr2213138eec.6.1793945585471;
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:05 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 2/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:51 +0700
Message-ID: <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
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

onboard_usb_dev breaks the rule that a driver must not return
-EPROBE_DEFER from its probe after it has registered child devices,
because that causes a probe loop (see commit fbc35b45f9f6 ("Add
documentation on meaning of -EPROBE_DEFER")). Its USB device driver
sets generic_subclass, so the generic probe runs first and registers
the device's interfaces. onboard_dev_usbdev_probe() then returns
-EPROBE_DEFER until the platform device for the onboard device has
probed. On a BeagleY-AI, the resulting loop has broken booting since
commit f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
platforms").

Call the generic driver's operations from the driver itself instead of
relying on generic_subclass.

When the device's node has neither a platform device nor a peer hub,
return -ENODEV instead of -EINVAL, so that the device is still
configured. The device now stays unconfigured while the probe is
deferred.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..51985e3473ad 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -591,7 +591,7 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
 		if (!np) {
 			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
+			return ERR_PTR(-ENODEV);
 		}
 
 		pdev = of_find_device_by_node(np);
@@ -639,7 +639,11 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 	if (err)
 		return err;
 
-	return 0;
+	err = usb_generic_driver_probe(udev);
+	if (err)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
+
+	return err;
 }
 
 static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
@@ -647,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
 	onboard_dev_remove_usbdev(onboard_dev, udev);
+	usb_generic_driver_disconnect(udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
@@ -697,7 +702,10 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.match = onboard_dev_usbdev_match,
 	.probe = onboard_dev_usbdev_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
-	.generic_subclass = 1,
+#ifdef CONFIG_PM
+	.suspend = usb_generic_driver_suspend,
+	.resume = usb_generic_driver_resume,
+#endif
 	.supports_autosuspend =	1,
 	.id_table = onboard_dev_id_table,
 };
-- 
2.56.0

