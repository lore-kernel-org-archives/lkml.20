Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6122798EA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469410; cv=none; b=Fx/bsXFUVRFf/bAjrvosfaMewozUpbRTwSc3vcFzLootv1HEqzxpM9XO3/Ab68nP6ax8wScGEl6NaB1L/AL3DwtBHy8L7k5+IfZ05yiRGQjfdvMLDoXaGxYnVYyDDj68U6T/cY1H2Q9E/oTI13bs16aAyHkQjJQUimtMJI1RU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469410; c=relaxed/simple;
	bh=DF1JltxWemQO6W5RSbFHuJMNzBrDNinPsefvTNUYTac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRWwD96eQ/Alf3/3hBODddzWPRNWAlmylcY7TAv5bqV8wGY034XXOgKlUPAw2xPPPsjbGDYxc9TrYuAvpCNPbCvqh7wLJXpyPOxZbnA97a4B/CufaheKTRTduoWQfLeAZzGFhOgXilce/Z+yst+4jzte7ZI/Y6Z8zrWoSAooHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMJ5UsU6; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMJ5UsU6"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e428so592037e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469407; x=1791074207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPQ8NWfqFD997DX33g+mb1w61H+DLreJs4A279gKvZM=;
        b=pMJ5UsU66pHqA20P+MgxFHFvGBOymvXM0GtJ6/h9TishewDyAkp61qY/v2QW8AcYZr
         UkqJZ61bN55RRarIjNBVg79wdAGhdceIFDWafDN+F7toX3LO9lGlMhavORloDxthxLn2
         kuoTBEemuCp4ebs9UxttuTnwnmYttWHuAZXvqiPxgyJdcE+YAzHSHShSP37ylJLcZMfn
         VJmjh6eO4gBXni0Hgj99u8NIvfAeSIeJYhkViECmik4zJxrOQ0XHauAyQiRR8E/UqOUk
         ZQQ3QZMj+87WIVD1s/fgnSAgokwmRArU9YFAaHtO3eznUln6Ap3+CbRvV8S4SNRLYjQl
         BgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469407; x=1791074207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPQ8NWfqFD997DX33g+mb1w61H+DLreJs4A279gKvZM=;
        b=TiR1Odu919t7XBUWL948+1mcSLvNnG/kig3MYbZLWEuVodCF7mxkvlBlIY7xgsq3BS
         yVZTGdF5ejCADkBo4pV9bH111RCdLjiXHb7xWJ2rZofKieLYMieHvfzsdnvpya2RkviS
         p1cs3qeP0HBxhuLCkDeWQxmj/WcmzjSv87kePsOFh51PiMIP94AHDE/BiEoOn5FpQmQX
         2h6hcXC9zlbOLV1Am0As20NibDZbrsXIjwnbAm/WsNcsqjho18EoCh3X/g0r7UAVYuyv
         DUpq2QyyasfHWMHFsccyCkiMG9qeUQx7YIfy7yuFaf5Q06WxBCfyFeJhKWnk85Hs/TAV
         tZnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrlwtIxPP6hq1UeTg5ruzSeV0GB/M8d7QbDjfQi6eKvqkRrhul2utyZG4Ep1fDw5Q48AGQ2CXzqb1HEGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYYq14izhau8fKXqKrgkSbVUtJ52yFuTTQTHGL+gbQWpmf7dd8
	uzuIoqtIq5Va4gC0CNHGzJfS1dAfycs4LHcUFmsPs2QuJe1/YqfVHI7z
X-Gm-Gg: AYBFou11nRv4+MRxrYWH6pdSRhJr2U+YqKL8+6uk7sV1bSNGphgBg8nRJVM04CsvtDo
	qccHcm/9JZ3eUUsRfCpg3zU80EH7Br0HXCcGxtNgriMDDecqsp/bL1+DO+CRWhk2VriFyWsoKjk
	CODV/kbL7mOgarXjerMq0lbGyhSLGMLSnp2SkCZ9XANI0oS/BfmKamj5Lzor/rVKY4vOjTG6cIN
	JATqOvGmqtFZA05e9Y5sFM/XMH6ykx+aYfQYuXzAgOhDsaEYUjOG8BNRP942ESMRw0JVeLk4NqH
	DIOz0MQL6JFRXjBrbklzXTCV0R9wF9dwlhjPiS1AbXWVvDdAgzum841ujS9DgveEqRXPOUSMjiq
	ShY8pjMxyeW8FTjbX6hL2tMqxoI1kB2sgfUgY+SG1v6e0VUDtvLGnfdFOZHFiAGoM6PbHOJ5C/y
	AuC6BZV0Dv2CldFPvBblS9Z1Xlef7PWm4GxZjHvK6YHb7bSdbcH+st1hWdsZSsZ3EFKBCGJZ8WW
	8kR3GTadv9ysD7lSGFcF4xdTxZ0ackW
X-Received: by 2002:a05:6512:3e27:b0:5b8:f370:25de with SMTP id 2adb3069b0e04-5b8f3702cdamr367394e87.8.1790469406892;
        Sat, 26 Sep 2026 17:36:46 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:46 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 2/4] ALSA: caiaq: Fix the Kore controller key map
Date: Sun, 27 Sep 2026 03:35:30 +0300
Message-ID: <20260927003532.289468-3-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

keycode_kore does not match the hardware in two places:

- Softkeys 5 to 8 are listed in reverse order, so pressing the fifth
  softkey reports BTN_8, the sixth BTN_7 and so on. Softkeys 1 to 4 are
  correct. The OpenKoreBridge project, which drives a Kore 2 through
  this driver, works around the same reversal in userspace.

- On the first Kore controller the touch sensors of the eight knobs are
  scrambled: touching knob 1 reports KEY_BRL_DOT6, knob 2 KEY_BRL_DOT8,
  knob 3 KEY_BRL_DOT2, knob 6 KEY_BRL_DOT7, knob 7 KEY_BRL_DOT1 and
  knob 8 KEY_BRL_DOT3. Only knobs 4 and 5 are right.

Put the softkeys in order for both controllers, and give the first Kore
controller its own touch sensor order, so that BTN_n and KEY_BRL_DOTn
belong to the n-th knob. The touch sensor order of the Kore 2 is left
alone, as it could not be checked.

Userspace that compensates for the old order needs to follow. It can
read the key map with EVIOCGKEYCODE, which also makes it possible to
support kernels with and without this change.

Tested on a Kore controller (USB ID 17cc:4711).

Link: https://github.com/OpenKoreBridge/OpenKoreBridge
Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")
Assisted-by: LLM
Signed-off-by: Niko Huuskonen <niko.huuskonen.00@gmail.com>
---
 sound/usb/caiaq/input.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 8d924330c54c..856235c3398e 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -41,11 +41,11 @@ static const unsigned short keycode_kore[] = {
 	BTN_3,
 	BTN_2,
 	BTN_1,
-	BTN_8,
-	BTN_7,
-	BTN_6,
 	BTN_5,
-	KEY_BRL_DOT4,   /* touch sensitive knobs */
+	BTN_6,
+	BTN_7,
+	BTN_8,
+	KEY_BRL_DOT4,   /* touch sensitive knobs (Kore 2 order) */
 	KEY_BRL_DOT3,
 	KEY_BRL_DOT2,
 	KEY_BRL_DOT1,
@@ -55,6 +55,21 @@ static const unsigned short keycode_kore[] = {
 	KEY_BRL_DOT5
 };
 
+/* index of the first touch sensor in keycode_kore */
+#define KORE_TOUCH_KEYS	24
+
+/* the first Kore controller reports its touch sensors in this order */
+static const unsigned short keycode_kore1_touch[] = {
+	KEY_BRL_DOT4,
+	KEY_BRL_DOT8,
+	KEY_BRL_DOT3,
+	KEY_BRL_DOT7,
+	KEY_BRL_DOT2,
+	KEY_BRL_DOT6,
+	KEY_BRL_DOT1,
+	KEY_BRL_DOT5
+};
+
 #define MASCHINE_BUTTONS   (42)
 #define MASCHINE_BUTTON(X) ((X) + BTN_MISC)
 #define MASCHINE_PADS      (16)
@@ -666,6 +681,12 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 		input->absbit[BIT_WORD(ABS_MISC)] |= BIT_MASK(ABS_MISC);
 		BUILD_BUG_ON(sizeof(cdev->keycode) < sizeof(keycode_kore));
 		memcpy(cdev->keycode, keycode_kore, sizeof(keycode_kore));
+		BUILD_BUG_ON(KORE_TOUCH_KEYS + ARRAY_SIZE(keycode_kore1_touch) >
+			     ARRAY_SIZE(keycode_kore));
+		if (cdev->chip.usb_id ==
+		    USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER))
+			memcpy(cdev->keycode + KORE_TOUCH_KEYS, keycode_kore1_touch,
+			       sizeof(keycode_kore1_touch));
 		input->keycodemax = ARRAY_SIZE(keycode_kore);
 		input_set_abs_params(input, ABS_HAT0X, 0, 999, 0, 10);
 		input_set_abs_params(input, ABS_HAT0Y, 0, 999, 0, 10);
-- 
2.55.0

