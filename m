Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383E3DC878
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872921; cv=none; b=uyvtc5Uj0y+c8zS0ge80xZF07ZXmirw0ORGpNgevutrQE5qDcbKzbaVdCdc1tmkbOenbMK22UHRAEy0/Hkq8oaFlCwpPW57pieVGPvSVAbw0u7bc/LRWZd/REWXn5HezblGUzIKyjR512N2gTyYPBc9p8GlRUm5TehUsKfWi6fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872921; c=relaxed/simple;
	bh=e/Bu9tGinqn0oPwIBbllDvzdk9Z/chxdVrt6JyTUUiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3gmkCpQD6tnkGeBF0Dg91HtTLKL5ijzRwVojvDvx+uGgfnZA9C6CdKTokWiDQNzh6dEP2FMpr1pgbbjCJli7LBbRXieRXUwElsgy7sZsQPwmsAyUVGO6eEuTdi1lhpvMOxyLtE9ykQMSJ2rCQ3VUZzSIw/WfINW4ePGD7ubW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1zMICxa; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1zMICxa"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b383347fa6so1112283b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872919; x=1788477719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ial078NkMLwCx72YKPqRkqjVXPsF6XZg2wkYCbXAeYw=;
        b=H1zMICxaBzDZzrz7Mj0KUbN/lJBQ+iM4OPy5yhT1x6Fp0kuXJEqgjJ2xjIiYKc0UiL
         osHpH6KVUab/jfE3ehnUvCkl6jzI2TOVvVOqfmuNUFFpFEQPuMzvFbCGPPsBa0VExmDg
         OXqBk5HuRzPk1c2T8uz93JevBuzLOWwc3JjcFUEWw+OzYRn5pmxfk3CbWS4A89EOYRNo
         x8dL1wU9uLjrAIBlnu47XEQwvSyEYYuiPrWRIoKTDIHNx8RFgBlPShhvCaG7G5jRkTDb
         ZeinUiD83jzImXpX3W8Wqg2rIvx20phlxU0BP45+rTrRQswY6QuEgvXNdMaCx5jEsWdY
         C0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872919; x=1788477719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ial078NkMLwCx72YKPqRkqjVXPsF6XZg2wkYCbXAeYw=;
        b=ULCwLvH9ztlhktMxQlSsq2clwgV+zWK49q3JUnwQ+x2vEs5bOHA5J9KRt7fpMF/ONu
         KYjM33kA/h9ydBFHrt1ZHgzd0y61Pcx16vAvmIQYa7wSDX02VayF/zae9VCYL6JOxWeG
         gk8ICyrDLANg3bZedu2tIExsyORf+BqaYqAwfKzDKbySoYfs14i43ej3h1EHx6aSaBW2
         aC2lTKNFZrkA1ogjMzZRMc+m8iU51O2CAePXueTsfeJlS7LJ/1TgNkqbQRO4TjfrF2T6
         OpFaBE+K7169WhbySvzZGwLbxeaVniGeyNYnVgTItNJX1fvv15vB4U3ZomFd2UEmsGmK
         CyrQ==
X-Forwarded-Encrypted: i=1; AHgh+RogNqsxWodR+uwJCfrwGTrYv7qFYfE749gVwi6UgS/Vftgz3ycWuZfZoZ5nB86+B55Ttoyc+jMYeZYs5EI=@vger.kernel.org
X-Gm-Message-State: AFuF++lIDlo37TQ3uHvWgTbzcW9yELa8zV3Nq3nBz+ZZB4x3k7rMnyhw
	hCdLc/84E/Slw5wwYpMozOxDuwAzJsCwLIGgTxWnLBOfU3F9Zxzrt5Mq
X-Gm-Gg: AR+sD1200pTSgdFT268bwK18LTTxqwZeXBl2kFxyewen35Blcz3Wvo/e3aaK3Vk0qa8
	XepwZq5InekyiV0A9ivxyVXBSq1WtGxnqBB5+vZT/IqUPAtG+SDFuI9uzUUnDDKgzU30M1ktkOG
	3w6EweESrD/VBg/KIfvyXzt609tVWJMfMSiNy8ccbQCNGhSRWeZwO2rI0/RPRY0ZasTqjeLxFMu
	Z7XFvabeG0Qq/YHXRSnVrKaYccnv/Ph0xBF0Pa/sAEh+ZalnkI05H05Xa77YYfGNUWPqPZ+rTy3
	D5lFSmNgW4TflA7bUpMjssQ6gufSs7Q+HBovaLLOdM0NVvmDhEA65XTJBHThp70PzZhq6y5WN5A
	zApudnA9pQVKeCDUluNNQgngpWfUCUb/S7cCPnToSI8MOQXgtwJNt7/BlQZ5YQ3RbPx/c1rW6DY
	GXKF4qobM95bjEBinhrvnwpwNY5Hj5s/l20nNJOyNIJRjsR7I7oljeY8ejjZbdneVDXAZCo4D0N
	REJkw==
X-Received: by 2002:a05:6808:198a:b0:4af:aaca:7be3 with SMTP id 5614622812f47-4b37ca62369mr8499737b6e.12.1787872919055;
        Thu, 27 Aug 2026 16:21:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:21:57 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 4/6] ALSA: usb-audio: Guard Scarlett2 protocol transfers
Date: Thu, 27 Aug 2026 18:21:41 -0500
Message-ID: <20260827232143.149197-5-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Scarlett2 controls and hwdep operations reach the proprietary USB
transport without preventing runtime suspend or disconnect. Protect the
central request-and-response helper. One reference then covers the
command, acknowledgment wait, and response.

The runtime and system resume hook submits only the notification URB. It
takes no protocol mutex. Thus, the transport guard does not invert the
existing data_mutex or usb_mutex order. Keep the suspend-time config save
on the unguarded helper because it runs inside the USB suspend callback.

This change protects each USB transaction. It does not hold a runtime-PM
reference across the asynchronous flash-erase interval.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_scarlett2.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 502854cc9f9f..ed5fe746d438 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2603,9 +2603,9 @@ static int scarlett2_usb_rx(struct usb_device *dev, int interface,
 }
 
 /* Send a proprietary format request to the Scarlett interface */
-static int scarlett2_usb(
-	struct usb_mixer_interface *mixer, u32 cmd,
-	void *req_data, u16 req_size, void *resp_data, u16 resp_size)
+static int scarlett2_usb_nopm(struct usb_mixer_interface *mixer, u32 cmd,
+			      void *req_data, u16 req_size,
+			      void *resp_data, u16 resp_size)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	struct usb_device *dev = mixer->chip->dev;
@@ -2713,6 +2713,18 @@ static int scarlett2_usb(
 	return err;
 }
 
+static int scarlett2_usb(struct usb_mixer_interface *mixer, u32 cmd,
+			 void *req_data, u16 req_size,
+			 void *resp_data, u16 resp_size)
+{
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
+	return scarlett2_usb_nopm(mixer, cmd, req_data, req_size,
+				  resp_data, resp_size);
+}
+
 /* Send a USB message to get data; result placed in *buf */
 static int scarlett2_usb_get(
 	struct usb_mixer_interface *mixer,
@@ -3020,9 +3032,21 @@ static int scarlett2_usb_set_config_buf(
 /* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
 static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 {
-	int err;
+	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
+	int err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
+				&req, sizeof(req), NULL, 0);
+
+	if (err < 0)
+		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
+}
+
+/* The USB suspend callback must not acquire another PM reference. */
+static void scarlett2_config_save_nopm(struct usb_mixer_interface *mixer)
+{
+	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
+	int err = scarlett2_usb_nopm(mixer, SCARLETT2_USB_DATA_CMD,
+				     &req, sizeof(req), NULL, 0);
 
-	err = scarlett2_usb_activate_config(mixer, SCARLETT2_USB_CONFIG_SAVE);
 	if (err < 0)
 		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
 }
@@ -8639,7 +8663,7 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	if (cancel_delayed_work_sync(&private->work))
-		scarlett2_config_save(private->mixer);
+		scarlett2_config_save_nopm(private->mixer);
 
 	scarlett2_cleanup_urb(mixer);
 }
-- 
2.47.3

