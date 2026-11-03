Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668208;
	b=FM2sfbHew/V3mvxguGAD0C4MV56JLIS8ODmmiO/135ztoxjQPy3xja17PY7r4+nWv/HQ
	 EVm0MbLNGIA0cl4aVRGNbm9m3A6R+gZeKHIjRNsmagkDAWYxatFRngmGFL5DtBjM3cbRU
	 q2DHPpPVny0mxtjj/+jK3blvVwqzX73os9X6eOI1qQB3kW9HCor9S9oY2UsVSxZWaSIXQ
	 GYvQ3dv52Je+8BUX+kjzlJIRus64nTAlzfdKMCRLV0hAyeTWY3LzrJiJn9grQzn0crgsb
	 BgCvoHP7fgui21DJX9zzjia/Fn8GmG6FJKyXWr0c5bbgfEbqzpR+spZtrBWcaMcBY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0r1rQjnCQlSLUxmQ918v9gA2ZTTS3lYQPwvgwim7CSI=;
	b=JL0Iwrj5KyqOFxuLUR04G2DQzAQvKImIP/UsyPRXMIi9U+YRJQQI5fOCanJm/7G0Hg0O
	 WkLZa0FXBs6w/naR5a9+qsQiy8MwV6NU9bGJYFc2bt+io6NY+CAzHXppAwHG4S71pjmty
	 CXGheqs48ZADrxg53QzLBKcsxHiRWfIvmk8k9K74i2xkmrLExN9q8uE4m8JQXQR41+xms
	 ksNWb24LEOrLpSm/0IWJw5uHAvZUa1TkI+pfPtaZtMHUln7WpPElw4xBSfVyeInx05jjU
	 /NlfH8eoyvkMWFXgyvk9r6d0ZMhRWfgPZlvB/MJSUnA0OouPh5tSf94l9qgbtlyxRxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5dem5Ed;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FBE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5dem5Ed
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so4714091c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668207; x=1794273007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r1rQjnCQlSLUxmQ918v9gA2ZTTS3lYQPwvgwim7CSI=;
        b=n5dem5EdpOv+Vxxo9StIKdJndxvJ5LTA56yiD5N8h7a6hgEZxCAJchneqmEkFNxR5x
         XvDBVnE0EpLudf8Z0xleCK5/8tW8x/ED/B1OED/E/1Y/Ns9U4YiEI7605N4I5iVOIpiO
         XcAypvDtBtlQgohWsTewYZB3+cFv9N/2FGbkTEl25gafyMf3YlrxzF3iZjrmMU2ktqUT
         zYWX0cd6Z1Cd/Uf8StWgh2TVV8VYpd32qbPmjOpEMKVqCIt4dG0CNGzMnyUtLoEDpnJj
         ovvNeDKdNaGjQs7UdbviMpD1cBLW1AecG1tFWuZ4qoOKQs4Rj4OPK5sUIjRMlUVWHp8R
         D8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668207; x=1794273007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r1rQjnCQlSLUxmQ918v9gA2ZTTS3lYQPwvgwim7CSI=;
        b=WOYttKUvEW9RJYXVEWWSY+2a+GnndWP7vBZkcfInsiZs799X5PnAyMEFh1F1wD4GKz
         vwO5enGiKLmtl56k+Wf6NUG82zMOmloPOglrGzD36ujM6R2l1bQt2SzfjhmWWH92GHcC
         FhSs9c3qBYIHy103z9SxJ7KqmGyc5nr3lT3NeEqz9CdBZYTCV6xxJBXOLVKp2Ms/8WAU
         r0WkKBgCX7yQA4gbQa+UF4w1O5k5Xp5GQG7mPm0NyJ1J3gy7+wc5481LTrM9S8hICgWp
         y/i4XD5RJLZRO9jOUI8RwmXcSw4pPXN7gZC5IZQVP3+2aSz/x8C4zigZH1iaGD7g+hMs
         WvWA==
X-Forwarded-Encrypted: i=1; AKwUvBxLqgFzQUAp+UsX2OD1PhPATfJpMIMmEtSDoyb/KGyMdKncz4Ax60BN9QhFaX/1U4mLr2kFEMHedX+KGbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwovPBLBrZTRHE96S2ciks/jJxGWpQbKKF/kjD9NiOMPdstyyI
	l1xnSctRa1CP05dk/VmT5ArMiBoOrxUJQWHGI0HsUCD7IWRew0kEblh6
X-Gm-Gg: AYBFou3nUJHLzfODTw7Pa2IwLMFWt61aDPQElub23KRZGAzTVSF06DxIsfdJJJW6LI4
	yyu0WBuyJ6N4uCWpBEfh5ik48DZPI53QugopQ/lPlyhe9F8U0I54kOA34JY46n+GQ8kyTeaZ1eB
	B+lA2e5B4LadYTk4za3TUBXiMCEU7fKYX68GKOz10ixMSLWNK21Oxbl/AuOoItlIstSVKouZ/J5
	OD0KyaQ6tHtF0LNsmn49fgIn8ak5Swl+P4LM3eFLPH9DYs2iuLzFqzPOuwYv3928LP/Ncg3cB0s
	2w1aQl++clw0jcU+dzv2gYYVhoCMUjtJXy9Uv4vN3RGZC72juOCEvc1GawdNflx59ZTHDL9/A5g
	3lbBECGXXBsfQUeC/fXi5DLJowLf3cSOzn+RSU8yQxtLWa+U6dqEvlm3egkfgGXrEMNS0mn6z71
	4OWXxT/GvUQUnXDVeyXpAnlBo3BwGh81w+QjvhKnG8MRxG2wDFB00HGsbtp3e42dB7ey1KljNG4
	RpkwR6fHYo4glskd2UgRTe3bFw/9DahPmF58yiiY4CmDVRprudMD90Ui2aIyILh32ZblZMnjEwE
	Mcz3t9fOiPGpQ4RK0kD8j7OYDRtcA51pGokvDoA8aoxRQO/O7pEH4182yYJjyAYaYznnZNC+Y/P
	YuSk93kLhkDGHCZxQQe8GQGsTGaq5LSKtv/hVkGKF
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id a92af1059eb24-1ac5cb1c8b3mr20224485c88.16.1793668206836;
        Mon, 02 Nov 2026 17:10:06 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm20581673c88.9.2026.11.02.17.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:10:06 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH] ALSA: pcmtest: Add a volume control with event fault injection
Date: Tue,  3 Nov 2026 10:10:00 +0900
Message-ID: <20261103011000.1012035-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The mixer-test selftest checks that a control sends an event when its
value changes, and only then. No virtual driver has a control that
breaks this rule, so without broken hardware nothing shows that these
checks work.

Add a stereo volume control to pcmtest, and two parameters that make
its put callback report the wrong result. With inject_ctl_no_event it
reports no change, and with inject_ctl_spurious_event it reports a
change every time.

With both off, mixer-test passes on the control. With either one on,
only the matching event check fails.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
This is an RFC. I would like to ask whether this is wanted before I go
further.

mixer-test runs eight checks on each control. To see one of them fail
today, you need hardware with the bug or a driver broken by hand. I
broke snd-dummy by hand to test the side effect check. This patch does
the same for the two event checks, with module parameters.

Two questions:

1. Is this useful enough to cover the other six checks too?

2. Should it live in pcmtest, or in a separate driver? pcmtest already
   has the inject_* parameters and a selftest, so it seemed the natural
   place.

If this goes ahead, the next version will also document the new
parameters in Documentation/sound/cards/pcmtest.rst.

mixer-test results for the new control:

  no fault                    all 8 checks pass
  inject_ctl_no_event=1       only event_missing fails
  inject_ctl_spurious_event=1 only event_spurious fails

The pcmtest selftest still passes all 10 tests.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 with the
sound/for-next driver, built for a 6.17 host.

 sound/drivers/pcmtest.c | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 66bee8a2ce34..c95bb4717487 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -34,6 +34,7 @@
 #include <linux/init.h>
 #include <sound/pcm.h>
 #include <sound/core.h>
+#include <sound/control.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
@@ -57,6 +58,8 @@
 
 #define MAX_PATTERN_LEN 4096
 
+#define VOLUME_MAX	100
+
 static int index = -1;
 static char *id = "pcmtest";
 static bool enable = true;
@@ -65,6 +68,8 @@ static bool inject_hwpars_err;
 static bool inject_prepare_err;
 static bool inject_trigger_err;
 static bool inject_open_err;
+static bool inject_ctl_no_event;
+static bool inject_ctl_spurious_event;
 
 static short fill_mode = FILL_MODE_PAT;
 
@@ -109,11 +114,17 @@ module_param(inject_trigger_err, bool, 0600);
 MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callback");
 module_param(inject_open_err, bool, 0600);
 MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
+module_param(inject_ctl_no_event, bool, 0600);
+MODULE_PARM_DESC(inject_ctl_no_event, "Report no change from the control 'put' callback");
+module_param(inject_ctl_spurious_event, bool, 0600);
+MODULE_PARM_DESC(inject_ctl_spurious_event, "Report a change from the control 'put' callback");
 
 struct pcmtst {
 	struct snd_pcm *pcm;
 	struct snd_card *card;
 	struct platform_device *pdev;
+	spinlock_t mixer_lock;
+	long volume[2];
 };
 
 struct pcmtst_buf_iter {
@@ -544,6 +555,58 @@ static const struct snd_pcm_ops snd_pcmtst_capture_ops = {
 	.pointer =	snd_pcmtst_pcm_pointer,
 };
 
+static int snd_pcmtst_volume_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = VOLUME_MAX;
+	return 0;
+}
+
+static int snd_pcmtst_volume_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcmtst *pcmtst = snd_kcontrol_chip(kcontrol);
+
+	guard(spinlock_irq)(&pcmtst->mixer_lock);
+	ucontrol->value.integer.value[0] = pcmtst->volume[0];
+	ucontrol->value.integer.value[1] = pcmtst->volume[1];
+	return 0;
+}
+
+static int snd_pcmtst_volume_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcmtst *pcmtst = snd_kcontrol_chip(kcontrol);
+	long left = ucontrol->value.integer.value[0];
+	long right = ucontrol->value.integer.value[1];
+	bool changed;
+
+	if (left < 0 || left > VOLUME_MAX || right < 0 || right > VOLUME_MAX)
+		return -EINVAL;
+
+	guard(spinlock_irq)(&pcmtst->mixer_lock);
+	changed = pcmtst->volume[0] != left || pcmtst->volume[1] != right;
+	pcmtst->volume[0] = left;
+	pcmtst->volume[1] = right;
+
+	if (inject_ctl_no_event)
+		return 0;
+	if (inject_ctl_spurious_event)
+		return 1;
+	return changed;
+}
+
+static const struct snd_kcontrol_new snd_pcmtst_volume = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "PCM Playback Volume",
+	.info = snd_pcmtst_volume_info,
+	.get = snd_pcmtst_volume_get,
+	.put = snd_pcmtst_volume_put,
+};
+
 static int snd_pcmtst_new_pcm(struct pcmtst *pcmtst)
 {
 	struct snd_pcm *pcm;
@@ -582,11 +645,16 @@ static int pcmtst_probe(struct platform_device *pdev)
 	pcmtst = card->private_data;
 	pcmtst->card = card;
 	pcmtst->pdev = pdev;
+	spin_lock_init(&pcmtst->mixer_lock);
 
 	err = snd_pcmtst_new_pcm(pcmtst);
 	if (err < 0)
 		return err;
 
+	err = snd_ctl_add(card, snd_ctl_new1(&snd_pcmtst_volume, pcmtst));
+	if (err < 0)
+		return err;
+
 	strscpy(card->driver, "PCM-TEST Driver");
 	strscpy(card->shortname, "PCM-Test");
 	strscpy(card->longname, "PCM-Test virtual driver");
-- 
2.43.0

