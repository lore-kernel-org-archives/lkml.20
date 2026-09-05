Received: from host.sedf.de (host.sedf.de [94.16.114.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120B48D864;
	Sat,  5 Sep 2026 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.16.114.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788610271; cv=none; b=rDeLz1Ibw20Vv+IJIQO+rJJBY/7oIdtkcmp/yaRZfi6MYKLYuGDxzyzXcSQdfvog2ltLuiShnIH7DXNGSZV7yYRbctzWJix8jWYZK8pn4wNl1MYoG1hC1Krs3/NcGxK3+IvdIy5X/cvof/kHHk/stv6pCylIFBHSAfDTkZf84ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788610271; c=relaxed/simple;
	bh=CHw6mAcxOpO3wL84JxmYPrcHDkbsAMlAbCP0sNIQIHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWV3eRr5PJI1uJzDVityjGtWG2nXHA8UwFuLYP8wBYRDYwnJq1ynvXvuLeQp2eFNcE/tIp/vAglq8njLWOI33oWQOimwnmc7m1S1zaddTcqpzW+gKK776C7rMBHiBzth5YVzDE74tlE6iz1xctAMBMalZIWZi5zjyjP8SOowdtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedf.de; spf=pass smtp.mailfrom=sedf.de; dkim=pass (1024-bit key) header.d=sedf.de header.i=@sedf.de header.b=AR4Yj70H; arc=none smtp.client-ip=94.16.114.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedf.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sedf.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sedf.de header.i=@sedf.de header.b="AR4Yj70H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sedf.de;
	s=20180621; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2cu6GLPUUzLAWq1fdl8FgOxDdPJnf8oNVQ+KdzVMG+c=; b=AR4Yj70HA+UZNeSP1QtwOl5D7X
	yK2Kv/SUrDA1RT+p1hRashm8fx6OX4GXf9nNh+H5d97OHyAtNGlJPZpbdc72LXVJoUf9dd9z4Qz2+
	iCgSOS7zVhkEEls64jgP37zF+VqAaDWOVAiV+bhSISm1M/flX54l3mLjfFeFgh3GG5q0=;
Received: from dynamic-077-003-072-010.77.3.pool.telefonica.de ([77.3.72.10] helo=tf.fritz.box)
	by host.sedf.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <sd@sedf.de>)
	id 1x2p8c-000000007ll-2yg5;
	Sat, 05 Sep 2026 14:10:47 +0200
Date: Sat, 5 Sep 2026 14:11:12 +0200
From: Sebastian =?utf-8?Q?Dalfu=C3=9F?= <sd@sedf.de>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add boot quirk for Behringer CM1A
Message-ID: <apwG4DRfNyvmRzyb@sedf.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

After a power cycle and reenumeration, the Behringer CM1A* leaves its
MIDI endpoint inoperative. USB enumeration and driver binding
complete successfully, but MIDI outputs remain pending.

A GET_DESCRIPTOR request for the device descriptor, issued after USB
configuration, makes the endpoint operational. Add a one time boot quirk
to perform that request before ALSA initializes the device.

*
ID 1397:1234 BEHRINGER International GmbH CM1A

Signed-off-by: Sebastian Dalfuß <sd@sedf.de>
---
 sound/usb/quirks.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4936d66..f82d7a6 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -850,6 +850,27 @@ static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
+/*
+ * A post configuration device descriptor read is needed to make the CM1A
+ * operational after reenumeration.
+ */
+static int snd_usb_cm1a_boot_quirk(struct usb_device *dev)
+{
+	struct usb_device_descriptor *desc __free(kfree) = kmalloc_obj(*desc);
+	int err;
+
+	if (!desc)
+		return -ENOMEM;
+
+	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0, desc, sizeof(*desc));
+	if (err < 0) {
+		dev_err(&dev->dev, "failed to read device descriptor: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
 /*
  * Some sound cards from Native Instruments are in fact compliant to the USB
  * audio standard of version 2 and other approved USB standards, even though
@@ -1682,6 +1703,8 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 	switch (id) {
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
 		return snd_usb_motu_m_series_boot_quirk(dev);
+	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
+		return snd_usb_cm1a_boot_quirk(dev);
 	}
 
 	return 0;

base-commit: 4c4e4be4edd5dbf5f7f6a3ef4fc0c243f2d01b3c
-- 
2.53.0
