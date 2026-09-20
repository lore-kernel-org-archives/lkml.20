Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C9438024
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907235; cv=none; b=LMY+pzdshF6rZjON/DPQ/KFcthfnhRkr0m5TNIx5H0KtWxvytEU+0gwMmuPbyhvjiQ86OU7P85KDYxNEADbHBmHXXWU+Sz3XwxIcgvVyTg9Ca80DDSnlBHS8sYL6XZ6x8zajG53rZAsP+oPNLEIYaiWo/Xm7c64dfEMiNhtfUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907235; c=relaxed/simple;
	bh=x0Td9IYTKICH7n7tSTZQ9CEcZmy7GnUj8l+oc+qoRTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=edgRc/jfz1xitzOR0OuO3xO8aX5QyGEE3c0vFaDN+zAdoOvoYnieGK6fOLBC2TIyCz7Ptugo4Fa6zzqbxR/BpTiH3MjCC9KuWmx9bjiexVh3KyPeiZxvaB9OIEWFS62UK3nItnzUir6MtGZO2KTkUaHH80nWh8ozOSoKAgKfy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI9C9MFm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI9C9MFm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1620194a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907218; x=1790512018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vjWBQwN3dE/GJAyD7dmJglKHoaPsNUHMSjnNpDOIVk=;
        b=OI9C9MFm3A82XvbVeEvWQ23VKk7y434ahM3Uyd3RIbKWJx0NgkRpK6NXrNaPh8Wt0G
         f+wo+ltlOxpYFeZYYTCZarQ05j0+b1CEBcEpunrDTie2fGWMJls0IbdVG0OJeKTy1SVE
         9/UOL9OfKS74sOcA0VTnjGNI6oz2Au7zvpF6QKrNkBo4506JQU2L07EqhHUchI5PWigf
         wOgwRfGOdzv2Sug49dZ8nL6GAFPLOqy8MkqZ0iJK7Dt9RkY3TxJcA7AM+oM2ocjuzjwA
         b1bMg9Ys0pUyDXCCONmJl356taa8bixVPOzk8IUKF1rChDokvpe9Tdohetx45EfM40XB
         krxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907218; x=1790512018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vjWBQwN3dE/GJAyD7dmJglKHoaPsNUHMSjnNpDOIVk=;
        b=idP1WWb5oPO9UexGy02jV8SZ2EyfY1DxpNhQhJRHg1Q7/XWWGY4j5QwzjF5nZA+ul2
         mnBYmgNsgXV7XhReD/I3o2K2qgOblm8OcUT2dykMV6guXyW7jow3VneHpIypYECVr2UQ
         zOsBBTUpOZtl+HfHBpfdQxTRUqP1UY7vLK3RtWkOE1KrVEyy3cHQ7QKDK8wBoRVyLEbV
         JEP7uQ6+zNQkDz9oWmbspFceKCeExIj9bZvyL+gnBoD9cJCqgweOX73Z/7Enw4I0BzNE
         tqMybr5gqD5fHRflxdLX6U5igv0nbsvOGR0o5+2meSSy4uWQUbfr+gICbQjjq5o+QEsh
         mRQg==
X-Forwarded-Encrypted: i=1; AKwUvBxTSVUcFsaNSf/Abgy7KwUQszJGJnab/FvEybhdarpv2jx+y5zC85lL/pZLLLOis1U2lGyISM9hv93SMKY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Y/mOLLEPUopUxUI/RCOoXzWTsegF9bws2N8B7EskGbsRkaih
	1P0dWtn/dZrWRSAWflDXrCOhbaabkq8GPh0pZmGU3QPbXxKQtFamJk+0
X-Gm-Gg: AYBFou2hMPeSBhwEOMeGyLFrF85OhErZAC3RBgTXQZJCKa4ANKoWHp7Szs6SVH2Bq/6
	v1jXmOIz6/4dVcIiNXI9qNJG9m972e/+xIJ0FSkRomV6kZgk3DkwH8OYI7uB7RzDj4M0Ewv3CYR
	YL0RO0ff1xq8joDXMgCRIGcW7UUdkPPMDpYSjzGyWyyss0INOxERKIyN22YMG0qflkLU0q5BQQK
	6qtP2UsrB4mSo8ivDeD3WyKTCGNM6k+8AXCwPcByaOF3ICOCg59J5CIwTu0jITsi1s+Y9I1RGE3
	oDZDw6npNuSC39BVgtTeVz/DgexCiqdkP7QY9WtCUI/8XhucpmQremPicaKQS71QJq0FRfR4J6B
	qnE4PyB+k2nydRtArwZk3syhybdvt8thCVrb2QWuhMneCi10HRuzi9RJ6G+LEQ77qT255DKu8Gh
	8HIutb7hE8VA4ZKENcnQkjdw36Zv41v5Ne3WAmY7LFdzL8JzhBjEzKR53CDBz2A+uggQUkUvPFa
	N9igBx0kuRCA7R6kEBZQWtd
X-Received: by 2002:a17:90a:c089:b0:39e:6c68:155a with SMTP id 98e67ed59e1d1-39e6c683333mr5944433a91.34.1789907218266;
        Sun, 20 Sep 2026 05:26:58 -0700 (PDT)
Received: from archlinux (061093018190.ctinets.com. [61.93.18.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a038ff8c39sm3188791a91.7.2026.09.20.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:26:57 -0700 (PDT)
From: Darren Chang <darrenchangjr01@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add quirk for inverted sample rates on NUX NAI-24
Date: Sun, 20 Sep 2026 20:26:53 +0800
Message-ID: <20260920122653.41993-1-darrenchangjr01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NUX NAI-24 (USB 3703:2000) has a UAC2 clock source that reports
bmAttributes = 0x01 (internal fixed clock) and bmControls = 0x07, so the
driver treats its sample rate as programmable.  When the driver sends
SET_CUR(SAMPLING_FREQ_CONTROL), the firmware acknowledges the request and
then runs the clock on the opposite base-rate family: asking for 44100 Hz
makes the device run at 48000 Hz, and asking for 48000 Hz makes it run at
44100 Hz.

The result is playback that is about 8.8% fast, or 8.4% slow with heavy
static on the 48000 Hz family.  macOS and Windows ignore bmControls, treat
the clock as fixed and resample, so they are unaffected.

Work around it by sending the partner rate in SET_CUR for this device, so
the device runs at the requested rate.  A new QUIRK_FLAG_SWAP_RATES flag
controls this, applied through the quirk flags table.

Only the 44.1/48 kHz pair has been verified on hardware; the 88.2/96 kHz
and 176.4/192 kHz pairs are untested but follow the same pattern.

Testing: the equivalent change ran on the device as a locally built
module (44100 Hz PCM, device clock 44100 Hz, no xruns, correct tempo, no
static).  This upstream form compiles for sound/usb without warnings and
passes checkpatch, but has not been built in a full kernel tree or
load-tested.

Assisted-by: LLM
Signed-off-by: Darren Chang <darrenchangjr01@gmail.com>
---
 Documentation/sound/alsa-configuration.rst |  6 +++++
 sound/usb/clock.c                          | 27 ++++++++++++++++++++++
 sound/usb/quirks.c                         |  3 +++
 sound/usb/usbaudio.h                       |  6 +++++
 4 files changed, 42 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index e500ec84e..689eccf6a 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2407,6 +2407,12 @@ quirk_flags
           the requested rate.  A device advertising a single rate is otherwise
           never sent the request at all, and some require it before streaming
           will start.
+        * bit 33: ``swap_rates``
+          The clock source applies a requested rate to the other base-rate
+          family, i.e. asking for 44100 makes the device run at 48000 and vice
+          versa (same for 88200 <-> 96000 and 176400 <-> 192000).  The driver
+          sends the partner rate in SET_CUR so the device ends up running at the
+          requested one.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 34832183a..cc77eace7 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -549,6 +549,30 @@ static int get_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	return le32_to_cpu(data);
 }
 
+/*
+ * Return the partner rate in the other base-rate family.
+ * See QUIRK_FLAG_SWAP_RATES.
+ */
+static unsigned int swap_base_rate(unsigned int rate)
+{
+	switch (rate) {
+	case 44100:
+		return 48000;
+	case 48000:
+		return 44100;
+	case 88200:
+		return 96000;
+	case 96000:
+		return 88200;
+	case 176400:
+		return 192000;
+	case 192000:
+		return 176400;
+	default:
+		return rate;
+	}
+}
+
 /*
  * Try to set the given sample rate:
  *
@@ -585,6 +609,9 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	if (!writeable)
 		return 0;
 
+	if (chip->quirk_flags & QUIRK_FLAG_SWAP_RATES)
+		rate = swap_base_rate(rate);
+
 	data = cpu_to_le32(rate);
 	err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0), UAC2_CS_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_OUT,
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5870901a..03e3e5ae4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2550,6 +2550,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x36f9, 0xc009, /* XIBERIA K03S */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x3703, 0x2000, /* NUX NAI-24 */
+		   QUIRK_FLAG_SWAP_RATES),
 	DEVICE_FLG(0x3c20, 0x3d21, /* AB13X USB Audio */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
@@ -2675,6 +2677,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_GET_CUR_OK),
 	QUIRK_STRING_ENTRY(PLAYBACK_URB_FIXUP),
 	QUIRK_STRING_ENTRY(ALWAYS_SET_RATE),
+	QUIRK_STRING_ENTRY(SWAP_RATES),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 244364739..c6d59218d 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -258,6 +258,10 @@ extern bool snd_usb_skip_validation;
  *  Issue SET_CUR for the sample rate even when the clock already reports the
  *  requested rate.  A device advertising a single rate is otherwise never sent
  *  the request at all, and some require it before streaming will start.
+ * QUIRK_FLAG_SWAP_RATES
+ *  The device applies a requested sample rate to the other base-rate family
+ *  (44100 <-> 48000, 88200 <-> 96000, 176400 <-> 192000).  Send the partner
+ *  rate in SET_CUR so that the device runs at the requested rate.
  */
 
 enum {
@@ -294,6 +298,7 @@ enum {
 	QUIRK_TYPE_MIXER_GET_CUR_OK		= 30,
 	QUIRK_TYPE_PLAYBACK_URB_FIXUP		= 31,
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
+	QUIRK_TYPE_SWAP_RATES			= 33,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
@@ -332,5 +337,6 @@ enum {
 #define QUIRK_FLAG_MIXER_GET_CUR_OK		QUIRK_FLAG(MIXER_GET_CUR_OK)
 #define QUIRK_FLAG_PLAYBACK_URB_FIXUP		QUIRK_FLAG(PLAYBACK_URB_FIXUP)
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
+#define QUIRK_FLAG_SWAP_RATES			QUIRK_FLAG(SWAP_RATES)
 
 #endif /* __USBAUDIO_H */
-- 
2.55.0

