Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD43812DA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817341; cv=none; b=bJvDomEF2aZAWw3uWXxG6xaExNM9vYJ8IwLsuWeajwE6LUeU3cwOMQEJgSZROcBDDUNbzCCHwxKASvCDzXR8VJSazkf9TRXH+80+24qV4+RWb1C7niyCeGZt3v+vh/o5EqgmjNo6tlGQ8j0UtN0rWN6CJePdMuxbPs7x7ckfs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817341; c=relaxed/simple;
	bh=UqKY/MzcnFpIEo0VStzm2PWHkdbFOV+TJY/ZqslFeQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZI4FBiF2n5fltLficMpSgG99DaSUbLi3xSbcr9O8yM4CdnV0LYZpawjYfdddzoMVavdZOa0FTHEc/XX5vjK+dEuY9qTmENnRs/dehaU95p97oxbufgmklyt4a3NfVtxPklTkv4ayESfzSwbodn265Ze2G8q44mtWslITGB/Ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoFxmOA8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoFxmOA8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484399babcaso301879f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817337; x=1789422137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+tmRRf0zWlKgTs1hoSvPxKFPwPUfj4JYA5rqqyQA7Y=;
        b=EoFxmOA8IjlcjIDPBxDIe6muXdL4KdQu0RGmDpY5aOouKTW70Y/g6gaWzO15erzcae
         j6xW6VAxPP0l/fPRMYliZAIZZZyjgLWS7KYQgrdkk7LFfdrrnun/cvmDyHexkStByEG/
         Er55DGPbZflaXIh2SepyazU22lIS+0CeZH67ZrRXpPtcFrm0th8b0IrZ6nX/toDq6/XD
         FVnDVcay5qnbnzVYNl8YEcc97gIRVJe3GB3iFDTQQ1QU8DDFBP6tVI35uw7vxItFtWc2
         wExlqyHl/7+NAniOoPXaXLLS6xBHXKVV0EStO1L38A8ymYd7L4aK805DIvvhkYLCKcwT
         2JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817337; x=1789422137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+tmRRf0zWlKgTs1hoSvPxKFPwPUfj4JYA5rqqyQA7Y=;
        b=a2KyJHHA3b0/FqrRZz9itky2Oh4DucJqNhsSeDmrLsxKK2eoTEcc8SDWop06Vry5t0
         TG99BzCIP9dN0MWWV12DwAFzjgzSfFki7QBLbzNeIZ1RN0PvHOs4QXt3YA2nKop7/w3Z
         UWxHU6C8uttxWdAyVJq3q4btKIbMzsjA2KcwWufBHP9JJtrWjx6tazKv77p1ciGbPGH7
         aJpi65x7R11P3SRGdBib4yZmHzHiaZzNp5EfbPy3RVfpXdGHH7yI6JT3IZszFucAN7xn
         nSowEyNmhFpVUzEDJ8uu7QFqMRo767QYeINcMmczdZQMB5AW38WTF3JJh4q5YuMpMcwE
         mh8A==
X-Forwarded-Encrypted: i=1; AKwUvBxzNmh5GMw1FCk/0qhSDp15ut2ejYxWOv8MQblIbZMzmmUtsnyAk+9tV97VLS+Jo/S3tksVikmZFkTUOsE=@vger.kernel.org
X-Gm-Message-State: AFuF++nYk6CQtRgUJNKOPrCCFYZMhT2MscF3Lgjp0zxfW39AAt78nY1i
	2+bXrieQljbTI0Cb32y8s70tIkgntuXKleuunFg47Hq8D8GBMLx0myik
X-Gm-Gg: AYBFou1Jhom3dYlYl3nDf0xV3Vu4RmZLU0ePRCmz3XAzXjtmudSB4GRgcm2EIFwwj6w
	VTkEdLMnQxgyRPzJBYG/ZBybqzWGu4wCwOHLxMtpbph8Mt9Jz/Svthrfa5NePYmILNj0g8qAOAx
	YOsX6Z2rg6CpehOL4l/PG4VyBLf6tuE4fm5b0yY8xuwU9pWi3DhOoNQkXIffTt7+BzGtCWE/tJF
	pqxRNBVtf0P8kWUeRoyikMtdgx1qGrWyHKljDJPwCDc5kuVb7WjqjkLbzyewZebjRgq3A7HphvZ
	RxSfs0emt6GIkywgevQJ6842Md3AgtdIwhX8qT7LenycbFMeipS9TpQcKxPNYYrmIq+oLYXc3FO
	JTFrvaD7t0KFoSFWmDjUK/11mL9VU7Q0EZfmwJQHbZCJ20+1rgYQxhZ2cIeLZw1ohojiLxsIUBD
	yPSxEFXQMV1aF6xfD2IlBKvTSzQ/A5Wckkqo4rJSIpeUivQRmeT/JvmOPQzEJ0YdwRPb/bRDpcF
	bAY0CH8bEhEb9f7tbK2AC8gG5rW100XK/v7ZSuwkJHCqgodXUQJD6jc41gWG9n/6El1JiXKdMj2
	oPM5zj3uh4PJhg==
X-Received: by 2002:a05:6000:144e:b0:485:8ad5:dbbb with SMTP id ffacd0b85a97d-485907f1861mr16244420f8f.4.1788817336896;
        Mon, 07 Sep 2026 14:42:16 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm30507425f8f.31.2026.09.07.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:42:15 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: stable@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] Input: aiptek - switch to using dev_groups for driver-specific attributes
Date: Mon,  7 Sep 2026 23:42:13 +0200
Message-ID: <20260907214213.1817320-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit f4e7a254299bcdfe7bced700a7d96690b1b9a6f2 upstream.

On 5.15.y, the attributes are removed manually from disconnect after
intfdata has been cleared and the input device unregistered. A concurrent
sysfs callback can therefore observe cleared driver data or use the input
device after unregistration. Letting the driver core manage the group
removes and drains it before the disconnect callback.

The driver core now has the ability to handle the creation and removal
of device-specific sysfs files, let's use it instead of registering and
unregistering attributes by hand.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/r/20220903051119.1332808-3-dmitry.torokhov@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/input/tablet/aiptek.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 1581f6ef09279..a2c999631b25e 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1618,7 +1618,7 @@ static ssize_t show_firmwareCode(struct device *dev, struct device_attribute *at
 
 static DEVICE_ATTR(firmware_code, S_IRUGO, show_firmwareCode, NULL);
 
-static struct attribute *aiptek_attributes[] = {
+static struct attribute *aiptek_dev_attrs[] = {
 	&dev_attr_size.attr,
 	&dev_attr_pointer_mode.attr,
 	&dev_attr_coordinate_mode.attr,
@@ -1642,9 +1642,7 @@ static struct attribute *aiptek_attributes[] = {
 	NULL
 };
 
-static const struct attribute_group aiptek_attribute_group = {
-	.attrs	= aiptek_attributes,
-};
+ATTRIBUTE_GROUPS(aiptek_dev);
 
 /***********************************************************************
  * This routine is called when a tablet has been identified. It basically
@@ -1843,26 +1841,16 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	 */
 	usb_set_intfdata(intf, aiptek);
 
-	/* Set up the sysfs files
-	 */
-	err = sysfs_create_group(&intf->dev.kobj, &aiptek_attribute_group);
-	if (err) {
-		dev_warn(&intf->dev, "cannot create sysfs group err: %d\n",
-			 err);
-		goto fail3;
-        }
-
 	/* Register the tablet as an Input Device
 	 */
 	err = input_register_device(aiptek->inputdev);
 	if (err) {
 		dev_warn(&intf->dev,
 			 "input_register_device returned err: %d\n", err);
-		goto fail4;
+		goto fail3;
         }
 	return 0;
 
- fail4:	sysfs_remove_group(&intf->dev.kobj, &aiptek_attribute_group);
  fail3: usb_free_urb(aiptek->urb);
  fail2:	usb_free_coherent(usbdev, AIPTEK_PACKET_LENGTH, aiptek->data,
 			  aiptek->data_dma);
@@ -1887,7 +1875,6 @@ static void aiptek_disconnect(struct usb_interface *intf)
 		 */
 		usb_kill_urb(aiptek->urb);
 		input_unregister_device(aiptek->inputdev);
-		sysfs_remove_group(&intf->dev.kobj, &aiptek_attribute_group);
 		usb_free_urb(aiptek->urb);
 		usb_free_coherent(interface_to_usbdev(intf),
 				  AIPTEK_PACKET_LENGTH,
@@ -1901,6 +1888,7 @@ static struct usb_driver aiptek_driver = {
 	.probe = aiptek_probe,
 	.disconnect = aiptek_disconnect,
 	.id_table = aiptek_ids,
+	.dev_groups = aiptek_dev_groups,
 };
 
 module_usb_driver(aiptek_driver);
-- 
2.43.0

