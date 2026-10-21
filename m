Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624702;
	b=dATnlEgsMSgtotaWyKTmhSueHMLpGg3jZNQN9MgaSO7xIMCda2hKrtz0+TaaOcrji0Ed
	 +rqjn/95srpVvX3sVp7ScY6zS/pKC7I36J5T2+1PwSWROxqMWB9mT3jiFaJU3xdBIS99G
	 1BcSpKIKYBhkqWVatvrmu8xN0S8lP0F41+uok6U1Bfn4siAVhERgwa2PM97PZNniR0IjX
	 uTnTSUiaQwcGMhK8Y5UEj3XwHOTQytBdnXl4mqJuiUlCjt+WG/y+cuAfFIjgs3GRsbB00
	 prHSATq9ur3GH1w4gIzxDF7gFaXNW7qd7QyAQ0PK7NNafvlFw6QsrFbagrQ03Lj/9Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KQTuv/5XJONn8TkLWcnOOb2F13vXXCmiwabibIXUvTs=;
	b=1vUmUwhH+ivgS9BPX7E1vK9d3x9RE/MCmPPq9UGBuVqL7T9Hi+earQ21vZlt3Mrw7w5H
	 gMw3oJMX6fMLm9ZCQWUIS3mXxe7hDoNwd6RzRrgCISVbXsqh5KMunKA6gzVhdBzuA4tDu
	 Ne+izF2uusIQ8VwILtQ7SGI47BFHV1knGNW6iASELAquNFngsDwRm2vHv+EGTVrwmEi9E
	 8ZtnDijaC0nrA/FciMCG3YvrXiYIXnsbEyHTvpRSEc6WKFyf+g3HQU3j3LzLFWA/vz/va
	 v4bGrwo80Y/dvgQBO3bhw9JygYnSQ2XRVstukW0CQdyTKrHmKTnds7Hj9ocfJpoywTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VNbAKDzw;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E988A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VNbAKDzw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2428159eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792624701; x=1793229501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQTuv/5XJONn8TkLWcnOOb2F13vXXCmiwabibIXUvTs=;
        b=VNbAKDzwrDjhYV2hl2mJ93sO+asKk2iIs7ImBaSyzQBgw/YKCJihoyXnaJxtGphzJu
         Eajby4XDFjm1aYpldUxxR6cA4N0M5wkTF9VIZ8XUkJ6Qa+fx0161oXqD20okAtc+PyPq
         1plBMu/vELulBpnhadePg1LOwWhF6xchwknimXOZPSKkUSeUuqFvGZPnNLcjqKZo3ftm
         H1NVBafiu7IX1F6vte/I+fE9YfGPhyWbK6pCeAiW40KkNGx+PmMyEaYr1Ed95mqQlpOw
         pK7gTKb0ESN+i0qFQZxeBMwRYCxu3tf+U6iAPsi+kQ3sVQHW95tXbkGN+X+fAO1Bb1WF
         lVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624701; x=1793229501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQTuv/5XJONn8TkLWcnOOb2F13vXXCmiwabibIXUvTs=;
        b=RrAp+bCFmvwEJfscAW9kygMAtIR+a/eZulQkNsEwWDhNcwvkwwbCkRMFDC/NO783cW
         Jga3axXA3jJ/dDJLa6sEHKWCZCLjXFppf/Rho87bxXESi/3EKksOkBa1i8Chonl/H4Wd
         T3IS7oqaJslqrXs7q+g0wibOHKtFBR/kOtBG+2bapQbu8cwi01aibld/m6ega9kTZLAX
         P4q5qZgjqY3KaNsjlLnZVmNmmrh0oEL0p4AcG81NgO774Ms/MwVEc8O4k5wDzv7aiACG
         YfexD5+BnF4akIZAq5GYjRvPCghiIKynq0Snt/g+OXROUyq7NMDG43WV5DJ6SxLBE7dO
         5lOg==
X-Forwarded-Encrypted: i=1; AKwUvByPgYe1snPG1t3knZFM8wV6o9AfP5N/zympzi/0y/Ap02/vYNEXQ7dQraHwewujNdqyrKqn1hWMkvw21v4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM4AYQWBLheKp4dfhLNnTpn+f90kKkTI4U5Obe3zg0X9s6Ju80
	mnj3a3K729d8Kr7pmIGEp0+gfZf8zSBmUYXFzK6DVFapgpAE6I5xK5Ks
X-Gm-Gg: AYBFou3F8tIgFXsCPWAakcqExkQ6rHKGdDPkkS0EOrU4Quygto44c9PFYX4DNSaFJq8
	+JYlGKx1+mPKTN/fh7NazP9PKrqKo9mUwAg4tFoumYrGwZILrXQMycpCO5ymRTl+3720LF08SZp
	fzlanlOoiRB3OiW5qO5DUfs2a2cnwvcuRsuLFv0X2sE8MMXAKB6pXGaj5rKHbtBSviLEiEEKPuO
	1fP2X0DabrsAsuYzsKuxANEEObnyuJV3jIu2Qsy6OYl0EomUmkCIZnV+4vlajqgsEPZjwNK3kxR
	X1K+Iu1YBf51/f3PT9lMbPNJEphl+Qc2jfOYW4658IyQwLvHfmAnTfRYuweO96v9S9NMRlWBEcF
	a4pYmy8KXWocYbU5nu5Tsy+I8P71sgkNzkTV/Wi+E4C9obsV6PDodD926oA4ms5Cx7U70DgRCCB
	Ex+09Xakgd0FW3C5luBIrICxc47u/TRregYD/uweWRJerq7NeZ4GaqgV+OpdntYlBxNqXh4Xhp+
	A3/8v8ifm6p6vXMdCbj3/UwrA/17WrlFYlIc9N/LdOL8DCbERahkx88OidI0MExLmCoJReTJZbz
	e4tEhWVEfbj9I4Jj7JJPw2uQQA==
X-Received: by 2002:a05:693c:810f:b0:341:5da1:7851 with SMTP id 5a478bee46e88-3674c63d98bmr5191870eec.12.1792624700806;
        Wed, 21 Oct 2026 16:18:20 -0700 (PDT)
Received: from overlord.home.arpa (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm12128886eec.15.2026.10.21.16.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:18:20 -0700 (PDT)
From: jasmeet.bhatia.us@gmail.com
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D . Bennett" <g@b4.vu>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Reset Blue Yeti firmware 0.20 after resume
Date: Wed, 21 Oct 2026 16:17:54 -0700
Message-ID: <20261021231754.16928-1-jasmeet.bhatia.us@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>

Blue Yeti Classic microphones with firmware 0.20 remain enumerated
after a system suspend/resume cycle but stop delivering capture
samples. This results in an attempt to capture audio failing with
-EIO.

Instead, the device should be recovered by sending its volatile ROM
reset command after a system resume. The command restarts the device's
MCU and USB logic, causing it to disconnect and re-enumerate with
working capture.

Defering the reset to system_freezable_wq provided best results when
testing, ensuring device resumes only after callbacks have completed.

Limits the quirk to USB ID 046d:0ab7 with bcdDevice 0x0020.

Signed-off-by: Jasmeet (Jazz) Bhatia <jasmeet.bhatia.us@gmail.com>
---
 sound/usb/card.c   |  3 ++
 sound/usb/quirks.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.h |  1 +
 3 files changed, 81 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9307da95efbe..ebacb98fc34e 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1280,6 +1280,9 @@ static int usb_audio_resume(struct usb_interface *intf)
 	if (chip->num_suspended_intf > 1)
 		goto out;
 
+	if (chip->system_suspend)
+		snd_usb_apply_resume_quirk(chip);
+
 	list_for_each_entry(as, &chip->pcm_list, list) {
 		err = snd_usb_pcm_resume(as);
 		if (err < 0) {
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabce7920..42d955c7b7a4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -10,6 +10,8 @@
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
+#include <linux/module.h>
+#include <linux/workqueue.h>
 #include <linux/bits.h>
 
 #include <sound/control.h>
@@ -1626,6 +1628,81 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 	return 0;
 }
 
+/*
+ * Blue Yeti Classic firmware 0.20 may stop delivering capture samples
+ * after a system suspend/resume while otherwise remaining enumerated.
+ *
+ * Sending the device's volatile ROM reset command restarts its MCU and
+ * USB logic, causing it to re-enumerate and restoring capture.
+ *
+ * Do not send the command directly from the USB resume callback because
+ * it deliberately disconnects the device.  Queue it on the freezable
+ * workqueue so it runs after device resume callbacks have completed.
+ */
+struct snd_usb_yeti_reset {
+	struct work_struct work;
+	struct usb_device *dev;
+};
+
+static void snd_usb_yeti_reset_work(struct work_struct *work)
+{
+	struct snd_usb_yeti_reset *yeti =
+		container_of(work, struct snd_usb_yeti_reset, work);
+	struct usb_device *dev = yeti->dev;
+	static const u8 reset_cmd[8] = {
+		0x00, 0x09, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00
+	};
+	int err;
+
+	err = usb_control_msg_send(dev, 0, UAC_SET_CUR,
+				   USB_DIR_OUT | USB_TYPE_CLASS |
+				   USB_RECIP_INTERFACE,
+				   0x0a00, 0x1900,
+				   reset_cmd, sizeof(reset_cmd),
+				   USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
+
+	if (err && err != -ENODEV)
+		dev_warn(&dev->dev,
+			 "Blue Yeti resume reset failed: %d\n", err);
+
+	usb_put_dev(dev);
+	kfree(yeti);
+	module_put(THIS_MODULE);
+}
+
+static void snd_usb_yeti_resume_quirk(struct snd_usb_audio *chip)
+{
+	struct usb_device *dev = chip->dev;
+	struct snd_usb_yeti_reset *yeti;
+
+	if (chip->usb_id != USB_ID(0x046d, 0x0ab7) ||
+	    le16_to_cpu(dev->descriptor.bcdDevice) != 0x0020)
+		return;
+
+	yeti = kmalloc_obj(*yeti);
+	if (!yeti) {
+		dev_warn(&dev->dev,
+			 "Blue Yeti resume reset allocation failed\n");
+		return;
+	}
+
+	INIT_WORK(&yeti->work, snd_usb_yeti_reset_work);
+	yeti->dev = usb_get_dev(dev);
+	__module_get(THIS_MODULE);
+
+	if (!queue_work(system_freezable_wq, &yeti->work)) {
+		module_put(THIS_MODULE);
+		usb_put_dev(yeti->dev);
+		kfree(yeti);
+	}
+}
+
+void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip)
+{
+	snd_usb_yeti_resume_quirk(chip);
+}
+
 int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     struct usb_interface *intf,
 			     const struct snd_usb_audio_quirk *quirk,
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 0a723c266bb4..9988e185538f 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -15,6 +15,7 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 				  int iface,
 				  int altno);
 
+void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip);
 int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     struct usb_interface *intf,
 			     const struct snd_usb_audio_quirk *quirk,

base-commit: 4df4d2a577db2d3d57b888bcfb1206fc74661d16
-- 
2.56.0

