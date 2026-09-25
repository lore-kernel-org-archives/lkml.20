Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9B50C28C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379651; cv=none; b=u11Yt9gA+a44yp1zi6I7da5JleMk2Hmaar2kpJJR2lN+i1xylXZYdmACSjDipJceaoXeW6d2esUbRNV4MIYazxq42DGPDjsEGGVaAV59yW+TS/G1b1CJegt3Py5o9/6KssRg+c1M5D2PfcdFlDLu2t+169Syk1yb5MCud367yPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379651; c=relaxed/simple;
	bh=1TKVsLcsA/nB5psPpaUR4f+Fq9xErmLlGg6vQRkojoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apn9XEaX/bK7RegS2ObAahlWXhe2h0MTcB6E2VRD4p0oZ0BN/QPN7uEOq5OsJLk7KlYLfkQ0Oij2flQrXAX9821fZC4rx46xpvDLJYt+1r/1r2xIog/8Dk+2rXY1+7lKuaf4AnXqjQjkVLKi+hHX8VTu62n0AK0h4K/w8bexrWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohuipKUh; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohuipKUh"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso4457165ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790379649; x=1790984449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+LGcXOuUDCudNBOVhXbuTe9tAr0TSwIZMFABdm4BCE=;
        b=ohuipKUhVNPxQKj36w492hKX5XXOXSpkLF7cFICvfb/LAczSyl4Tr69ALyROHBMcKd
         yj421mjwVrP69P/kdHqThiCHwDcjA4wW1LY3ING4fRORphWrNiblzThCPaj2EQNYUCBE
         YPczJNJYaJrE1n6HXWo2NYYIGshlqhd+OqWgXVpmEtq46kj9H2Yn2I10qIFFZWjWdSUA
         GRBIf9kaJLb1o4GMd8lSyB+A1TuF1mf5oLWw3Fw5ZdKaq17q4QWw+ts+JpTDpDSEPDry
         wElPlUK/ZVA3ltld/BL3oyR9tLmEPnfekQEnPVA4GcBj3HwcEYaoEftK1dtCbuyEMj2H
         y7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790379649; x=1790984449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+LGcXOuUDCudNBOVhXbuTe9tAr0TSwIZMFABdm4BCE=;
        b=u6IJMO3hH8JFTD+Xq55oUz9z+1wRyAoHzzzQ4oirv0U77GYlAnGLjFXnOzCV2bgfZ1
         uiL4X2rPfkXr0dolhNH+h4Uy9PLkLbQbHMWtDBcXjgu8QypS9BuH+JHwnDJJqxwTBmDf
         fQjXcOIiZB55zPC7zzE/qfMzQuUhaZyltjHSzVeVS55da1TvstpFeCYY31jFICX6+a4v
         MPyihlcjXx43hbchY5U0qsi+SX6LMrjI1Jukb6H75rB9a1zCn8hw3ssPySEV0Aqt/3qD
         dVxJ6Woj22SctwTzLvpV+7q/6DeYNc0tmHx0FQeh5gEyTBDihx6gH45N8Go3zvkOL0ct
         X5fw==
X-Forwarded-Encrypted: i=1; AKwUvBzTyzVvoUWTU+ZNFKBN4h8O42xd+spN4dVUy3bOTpGMy3ZDRL6OI1teQtQcK+GV7lV+mo1ntZUtljKwyNM=@vger.kernel.org
X-Gm-Message-State: AFuF++kj2ieueS1EbXrtjEFlvELczX9L9HlQZCqrUtJLJYR7d3WRfqHl
	A2CWPvhda+b2of0f3f/kx5/IFNAqY82e3k7QcTSLLQAEyBBCK7Kt5XG+
X-Gm-Gg: AYBFou3ys1CWz5fMyMMT8DYUsrFVjtG4gPzq3rFnMbJYU9U65iEv7cYb2VTjaBXd2XF
	yI7sJePkItXPHZvwyFVfbkP3jNWjpcCh7a8Smc22BokJcBIWci4PxOFbsisfLjBOqAD9iAPtvhM
	gUMHem/z1r3rLJRJ/XA5ZolfRLMjOgj6UZeWl7awVg2utciyZLgKRdqCItjTjayD/aQYTOTAT9m
	sMwBgpFJKH8FL5Lb0QwYBnqekdQUUOsQLmQRBDqRpxyLX0GHWbpyplw4q/Xx3L8Sjr4ZUWyWx3H
	oX3X9KPMQYVZ4nKcVxDWWrZhxAfu5gju0eWQ/WXhEUlIBrEloHdkdOLI9TVsauukA0xkyPR2Sve
	QVC1yIxkTSNrGY4JfB6GHV28vmqkqhxc2adiv+cXgnzMi8FCbYJJ2B+TFwRGhe6MmWZ4vdUTnob
	TPM4f9y6DthO/4AYKk0ZglxQj1/8vND904nK8T9SpLGx5pJeHpw5AKECO3d+In1nQN8+G3FuYPZ
	x2/gxjqQZIJ9wK2WIsjGw==
X-Received: by 2002:a17:90a:d64c:b0:3a0:c13d:8b2b with SMTP id 98e67ed59e1d1-3a0c13d8f3bmr2052540a91.33.1790379649122;
        Fri, 25 Sep 2026 16:40:49 -0700 (PDT)
Received: from pandar.dancher.net ([2409:8a28:881:a300:decd:fb28:f50d:71a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm6706966a91.7.2026.09.25.16.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:40:48 -0700 (PDT)
From: Cai Yu <caiyu7372@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] Bluetooth: hci_intel: fix tty-only assumptions in the LPM paths
Date: Sat, 26 Sep 2026 07:40:40 +0800
Message-ID: <20260925234043.707679-2-caiyu7372@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925234043.707679-1-caiyu7372@gmail.com>
References: <20260925234043.707679-1-caiyu7372@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LPM support of this driver looks up the platform device that provides
the reset GPIO by comparing the parent of hu->tty->dev.  That tty device
does not exist for controllers attached through serdev: hu->tty is NULL
and four code paths dereference it unconditionally, so binding such a
controller would crash.

Add the missing NULL checks and use serdev_device_set_baudrate() in
intel_set_baudrate() when the controller is a serdev device.  The LPM
transactions are skipped for those controllers: they own their reset GPIO
and have no host-wake IRQ.

This is a preparation for adding serdev support to this driver, selected
with CONFIG_SERIAL_DEV_BUS; no tty-based setup changes behaviour.

Signed-off-by: Cai Yu <caiyu7372@gmail.com>
---
 drivers/bluetooth/hci_intel.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index d10ce7a..28c11dd 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -14,6 +14,7 @@
 #include <linux/wait.h>
 #include <linux/tty.h>
 #include <linux/platform_device.h>
+#include <linux/serdev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
@@ -288,7 +289,11 @@ static int intel_set_power(struct hci_uart *hu, bool powered)
 	struct intel_device *idev;
 	int err = -ENODEV;
 
-	if (!hu->tty->dev)
+	/* Controllers attached through serdev have no tty device; the platform
+	 * device providing the reset GPIO and LPM support is matched through
+	 * the tty device, so there is nothing to do for them.
+	 */
+	if (!hu->tty || !hu->tty->dev)
 		return err;
 
 	mutex_lock(&intel_device_list_lock);
@@ -361,7 +366,7 @@ static void intel_busy_work(struct work_struct *work)
 						busy_work);
 	struct intel_device *idev;
 
-	if (!intel->hu->tty->dev)
+	if (!intel->hu->tty || !intel->hu->tty->dev)
 		return;
 
 	/* Link is busy, delay the suspend */
@@ -511,7 +516,10 @@ static int intel_set_baudrate(struct hci_uart *hu, unsigned int speed)
 	/* wait 100ms to change baudrate on controller side */
 	msleep(100);
 
-	hci_uart_set_baudrate(hu, speed);
+	if (hu->serdev)
+		serdev_device_set_baudrate(hu->serdev, speed);
+	else
+		hci_uart_set_baudrate(hu, speed);
 	hci_uart_set_flow_control(hu, false);
 
 	return 0;
@@ -828,7 +836,7 @@ done:
 	 */
 	mutex_lock(&intel_device_list_lock);
 	list_for_each_entry(idev, &intel_device_list, list) {
-		if (!hu->tty->dev)
+		if (!hu->tty || !hu->tty->dev)
 			break;
 		if (hu->tty->dev->parent == idev->pdev->dev.parent) {
 			if (device_may_wakeup(&idev->pdev->dev)) {
@@ -990,7 +998,7 @@ static int intel_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 
 	BT_DBG("hu %p skb %p", hu, skb);
 
-	if (!hu->tty->dev)
+	if (!hu->tty || !hu->tty->dev)
 		goto out_enqueue;
 
 	/* Be sure our controller is resumed and potential LPM transaction
