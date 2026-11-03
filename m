Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676865;
	b=ccuhOSAyIcghOSg3m2OhFvLcMOcesNeYUZ1X07s5CSC51qBuSXHrKY1buAU1FvRKLiUH
	 TdlYYdiXX2x8EaxbZbIIpRxE0vTpeeEFgdacHzlkUXRtbiA7dhpK6WzOVhWlBfJOnKnMB
	 JbzmoKPI6r0TU0FsDSvtkqm61WNBMjdwVL6lF6Pm8d6dvLlXHnVCwdnmL7Ee3WJJwnLhH
	 BVSbCb/4uLVj12rSQMM0KRU+yLUSL9exMNskPYkTjSrNncRbuVdRyZ4lkcp7ad0PSC4LD
	 XOtt4lwoyk35BVfoTV313b8RdCDXsn6yZZ6fwY2DAo5fBTlMGhz7wqjQVZTe5Wi5Ikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
	b=zvC9P9T/Olm44mBTTfEMu9sNeImFfTGifXgMST6jm28cyGgpQd/PKCk1UGO0sS8JlJla
	 CHqB4dzaywcxvwFDt5Ic+3AsIW7Wk5hXJRfRhXkbmJmeXChq5UwKV+tEBlMQ6y57RLpuQ
	 NyOjRXYKu5v4DUvxNTAIN9ZisCqKtnxH9rZzcTvhD3JpA2CpBoZk/H+cePCLr4fiUX8xr
	 W2GrshIQ30JRd4A3CtnNFNfryQ7AjRjC9iIuMF1kfCrkYz8r4zNs95FCfJhdd4n0eYxN/
	 F1a89aBOj+kP8kLSOiXoh+I2SwrrQaS9IaOC5ICOnN9wdkyXxdsIgXgn9b7EW4HHUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00179606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00179606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1517132a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676863; x=1794281663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=kFs3+pAcB2asJWia3nXl4sSrY/b/Ui7HgpSzZneznbPnWtV6Mq9e5Nv6abO3BjNH80
         A0w5Ur4yLCOq9nLaDLNxez3qjItS5VkTubjlUfhhA2mxe8LUvFkIYJZH9Q+FHvedA0a8
         ZTEQx9yRXePLVOJ8X1rO1e7nCQUI3QqPJfgwI2sjD1JmiKeTB7YyVweGL2QUM+Qj+LBu
         oqmBTywQZo6ayf1POIANGkd6CslqT5/YZVc1LZE3NMPnsUdt57j5pf2Dlg30PUFZyA8G
         PTu/nNLm8iYQHzF38Qc9xo4mMWSwtMfQ+gYTikU2HQrx2wieSsI2NkdOPUJSLtokYy90
         PX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676863; x=1794281663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=p5JUKYkkIhf4HwtkaBlU+pIrFtiaBHXuXXI3wnVwjWA/JgCe2qkKce8823f5Mnpv3i
         +EE2KOmGEpjCEtVKFRzhTsG8nPDdJDNKFSoE3RJZzc8gWzYVK6Z+EpGVR7Pj4e5YNyxn
         c8hkhKEs7iYY4w0IMdmUIeKczhmOlHz3z4+ghGNzhQfveXlH9AAWHHXdh0UAQB/kVNAm
         G1Z9kxu0QbOsPz4IESo+LreiY+q1Ryydt2nj3gsVRRM4hikCpCCYc0PAWAt+sklMHz7U
         lW4SyilXjs/U8I2DX9ajIZGgy9LglnX9vBO9zkUzpom/EIJNbMTo+eGfEiGG+nvEHEp3
         2k0g==
X-Forwarded-Encrypted: i=1; AKwUvBwtYUWkjCndkn7D6gpF8Pr/aeVGQ07shqomq7qQNAFfSb9QiqmgXl5kzO5/X0UgxKRsUFFjGCspuLkm1jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xj+Xofo3+S5ScnyNr8lqCSojt0lcZuAbsiU0rMCwU3N4Y1G3X
	PLIckXONIyptOlsoL4K8VZS4v2Nwm3ksLsyaSaxkjZrUtxa2VbsjnBvw1rP1Xpafow==
X-Gm-Gg: AYBFou2HwZgOUj71yroSZCViDdudj7iW513OMIBmND69Eyy2iFCWBoQtBwd45ESuHhR
	itx25MVIwwPKumUXZqss5BdRmpvWf7fLMpvImDWdk/LuJKwRBW9VKRyk16BehOvzMjIeJgJQ8vp
	oZsigOb83k6ipp5PD8MHMr2BX2Tc+dzs38V2XYbND+eTeXC4a6QSK8HJ+0/PaXdcOLd91Px6NE3
	tW3a5feVW5M/oJNqcGd8odgwPqBqw5wrT4hkz3pm68Bfx7OpIxX7Wz9NGFrO3q7kx250bi+V/rJ
	GfQpdV2Hk6ei/AXc284TiTz3+kG57yYLIzgalSFMZcKYKJu/h9XOQ6KLX7Eu154HmZa1Dz4IAyv
	kebs+FP0JC8TCw04t9e+wcB9XX6rbuTo+w04RR1dwbK8PiuEtxF70251+RsHk+K/IV5OuMW/6AQ
	nQPbiQwDZRn2svnCGUfUJyOf4JPzTCymWLJy3uy9D3fsxdNcJ9nUuOBfREuROEkivPsTtI5klRm
	rgh20QV7AYycmb3U8FyLjLS6o6FAOKvaeqjxXgcUrlSrCqvxSKWwB6fNG864hE1kRvYeTm2BtjL
	kPkdgAZJn45wam/VSPCmcTxIOhlzyonLSOfF3IJnweFWSa/PMJxHRp2qtAnlLMmSJS/Ek0I9ziv
	xRz9tdb7kKTHtUgN+zQ==
X-Received: by 2002:a17:90b:518c:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae8979807emr9012242a91.42.1793676863114;
        Mon, 02 Nov 2026 19:34:23 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:22 -0800 (PST)
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
Subject: [PATCH v3 1/2] usb: core: clean up before handing a device to the generic driver
Date: Tue,  3 Nov 2026 10:34:12 +0700
Message-ID: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
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

When a USB device driver's probe returns -ENODEV, usb_probe_device()
hands the device to the generic driver. It does not first undo what it
did before calling the probe. This causes two problems.

First, if the driver sets generic_subclass, the generic probe has
already run. It configured the device and sent a USB_DEVICE_ADD
notification. The generic driver then does both again. Notifier users
such as the usbport LED trigger see two USB_DEVICE_ADDs with no
USB_DEVICE_REMOVE in between.

Second, if the driver does not set supports_autosuspend, a runtime PM
reference was taken before the probe. Nothing drops it, so the device
can never be runtime suspended.

Clean up before handing the device over, in the same way as
usb_unbind_device() does when a driver is unbound: first, for a driver
that sets generic_subclass, call usb_generic_driver_disconnect();
second, for a driver that does not set supports_autosuspend, drop the
runtime PM reference with usb_autosuspend_device().

This leaves one limitation. Until the generic driver binds, the device
has no driver. If it is runtime suspended in that time, it can't be
resumed. This is transient: the generic driver resumes the device when
it binds.

This change does not alter what happens when the probe fails with any
other error. The device stays configured, so its interfaces keep
working. It keeps the runtime PM reference, because a device without a
driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
sending USB_DEVICE_REMOVE would mean unconfiguring the device.

Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..9b8cd0e4219e 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
 		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
+		if (udriver->generic_subclass)
+			usb_generic_driver_disconnect(udev);
+		if (!udriver->supports_autosuspend)
+			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
 		return -EPROBE_DEFER;
 	}
-- 
2.56.0

