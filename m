Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C572AD2C;
	Sat, 29 Aug 2026 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964682; cv=pass; b=JzVBpYdlq4TRWlgDH/rvaV/ppC7IJZchHUSjX5wZ/kkbGZzgeHqzOSqIFVQkZ0KSTczljK3LPO66JoOHz2Wzompu2/qdyh6KEGqkS0a892t1Rv+Ym6DmuLusRyfN75y2SiL9zBTLjDbWh5i2s0/odW01y7vulznjmoc9RFjK19k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964682; c=relaxed/simple;
	bh=tVXdyNOKYq3qisWP/jPBYLDndSKOYshz7xCR09Z+TcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSaMi5tRBEMe7JW/uLZp/Hl4l6KMApWWJ18y6c6RYSY/ZrccujDInTFeDIZVJkB5Cb7QiSLOnt0QRYB1wCzxsgOamfb2YAe1sCbkmCRJGGKO9UD2YsAauVtFX+dsztfibe+MjsSrX2wj6f8qvALG1nKBABPjl6r6r2EE9dm9er0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re; spf=pass smtp.mailfrom=soh.re; dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b=OwHr1HNc; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soh.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b="OwHr1HNc"
ARC-Seal: i=1; a=rsa-sha256; t=1787964624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PT8VBHVoZ6m7y17X1GbbBxsJ4u5KlGp+gyWyb5H8EzmG+ewYDutgvlWDb8snACf8Gfk9IrvkH3+BDkuNa4UGEVaAltwwVrmyMg8PhiOLgkEAJn2aa+qCXkx2m+FJX8rzwkyMohCPFmwMUudlM6nMxa6DyyK0iRADyKttUNVzqoI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787964624; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B2dQm398SYqYVR2Fx56qj0yNqkR/SFsRTmj7xa8dWK8=; 
	b=RSmGiHLV47hgaEiiqeHjM/9vxUh2SICxJnXl9lYmk8LJS+SVai4euldJDSb2JCe8voA9RaKS5NenZzO6LDvIzD9b2WgPrySjKE6ziUR7mxebFnrAEbEkLrHdfdsw2jq11Ir/vWFTy+A+sa0/2oNsbg1Wjf/ppvQf8aihCAZWkks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soh.re;
	spf=pass  smtp.mailfrom=jon@soh.re;
	dmarc=pass header.from=<jon@soh.re>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787964624;
	s=zmail; d=soh.re; i=jon@soh.re;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=B2dQm398SYqYVR2Fx56qj0yNqkR/SFsRTmj7xa8dWK8=;
	b=OwHr1HNcknp0MaWnQl15EbmNknI19ziAywj6JdHfXWfoVSPszpbxgGpxtKIAATnT
	4Rs/XRO38YP+4hxBYncznpwX4c243AWRrzLfXP6UBgr9Qc8pun3NVfg8diBze4PtMlW
	SxXbzbjl4PGPzHInUbIhZ/FMAE0JVvJ2B4bF/nfg=
Received: by mx.zohomail.com with SMTPS id 1787964621972180.44364146302325;
	Fri, 28 Aug 2026 17:50:21 -0700 (PDT)
From: Jonathan Seth Mainguy <jon@soh.re>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org,
	Jonathan Seth Mainguy <jon@soh.re>
Subject: [PATCH 4/4] ALSA: usb-audio: set Roland Capture rate during stream preparation
Date: Fri, 28 Aug 2026 20:50:01 -0400
Message-ID: <20260829005001.534571-5-jon@soh.re>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829005001.534571-1-jon@soh.re>
References: <20260829005001.534571-1-jon@soh.re>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Roland OCTA-CAPTURE and QUAD-CAPTURE select their hardware clock with
a vendor control request. Streaming fails when the hardware clock differs
from the rate selected for the USB endpoint.

During stream preparation, read the hardware rate and send the rate
request only when it differs from the selected endpoint rate. The control
transfer can complete before the device reports the new clock rate, so
poll readback every 25 ms and continue as soon as it matches. Forty
attempts avoid hammering the control endpoint while bounding an
unresponsive transition to one second.

Run the transaction from the existing format-setup quirk, after ALSA has
selected the endpoint rate and before data URBs are submitted. Hold the
USB-audio device mutex so playback and capture preparation cannot issue
overlapping clock changes.

Apply the quirk to:

  0582:0120  Roland OCTA-CAPTURE
  0582:012f  Roland QUAD-CAPTURE

Tested on physical OCTA-CAPTURE and QUAD-CAPTURE units. Rate changes
followed by full-duplex streaming succeeded at 44.1, 48, 96 and 192 kHz
on both. External digital clocking on the OCTA-CAPTURE was tested at all
supported rates: 44.1, 48 and 96 kHz. The OCTA-CAPTURE disables its
digital input and output at 192 kHz, so external clocking is unavailable
at that rate.

Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>
---
 sound/usb/quirks.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 91938172912a..4936d66f9591 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -1855,6 +1856,75 @@ static int rme_digiface_set_format_quirk(struct snd_usb_substream *subs)
 	return 0;
 }
 
+#define ROLAND_CAPTURE_RATE_REQUEST		3
+#define ROLAND_CAPTURE_RATE_READ_VALUE		0x0001
+#define ROLAND_CAPTURE_RATE_WRITE_VALUE		0x0008
+#define ROLAND_CAPTURE_RATE_WRITE_PREFIX	0x40
+#define ROLAND_CAPTURE_RATE_RETRIES		40
+#define ROLAND_CAPTURE_RATE_POLL_MS		25
+
+/*
+ * OCTA-CAPTURE and QUAD-CAPTURE use the same vendor request for their
+ * hardware clock.  A read returns the 24-bit little-endian rate followed by
+ * a transition-status byte.  A write carries 0x40 followed by the rate.
+ */
+static int roland_capture_read_rate(struct usb_device *dev, u32 *rate)
+{
+	u8 data[4];
+	int err;
+
+	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			      ROLAND_CAPTURE_RATE_REQUEST,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      ROLAND_CAPTURE_RATE_READ_VALUE, 0,
+			      data, sizeof(data));
+	if (err != sizeof(data))
+		return err < 0 ? err : -EIO;
+
+	*rate = combine_triple(data);
+	return 0;
+}
+
+static void roland_capture_set_rate(struct snd_usb_substream *subs)
+{
+	struct snd_usb_audio *chip = subs->stream->chip;
+	struct usb_device *dev = chip->dev;
+	u32 rate = subs->data_endpoint->cur_rate;
+	u32 current_rate;
+	u8 data[4];
+	int err;
+	int i;
+
+	/* Serialize playback and capture endpoint starts during a clock change. */
+	guard(mutex)(&chip->mutex);
+	err = roland_capture_read_rate(dev, &current_rate);
+	if (!err && current_rate == rate)
+		return;
+
+	data[0] = ROLAND_CAPTURE_RATE_WRITE_PREFIX;
+	data[1] = rate;
+	data[2] = rate >> 8;
+	data[3] = rate >> 16;
+	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			      ROLAND_CAPTURE_RATE_REQUEST,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      ROLAND_CAPTURE_RATE_WRITE_VALUE, 0,
+			      data, sizeof(data));
+	if (err != sizeof(data)) {
+		usb_audio_warn(chip, "cannot set Roland sample rate to %u Hz: %d\n",
+			       rate, err < 0 ? err : -EIO);
+		return;
+	}
+
+	for (i = 0; i < ROLAND_CAPTURE_RATE_RETRIES; i++) {
+		err = roland_capture_read_rate(dev, &current_rate);
+		if (!err && current_rate == rate)
+			return;
+		msleep(ROLAND_CAPTURE_RATE_POLL_MS);
+	}
+	usb_audio_warn(chip, "Roland sample rate did not reach %u Hz\n", rate);
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      const struct audioformat *fmt)
 {
@@ -1885,6 +1955,10 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x2a39, 0x3fa0): /* RME Digiface USB (alternate) */
 		rme_digiface_set_format_quirk(subs);
 		break;
+	case USB_ID(0x0582, 0x0120): /* Roland OCTA-CAPTURE */
+	case USB_ID(0x0582, 0x012f): /* Roland QUAD-CAPTURE */
+		roland_capture_set_rate(subs);
+		break;
 	}
 }
 
-- 
2.55.0

