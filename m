Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B320342CB3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817590; cv=pass; b=hF/Djm1YpIHdHmuG6V8xFlN21fs59Z+QyxRv0WphhSQnh+efeMyCzuvpKd7qRwsMiuySpOWZwArp3YIbQmtDDrxgAONCEa0z/cYouA9e0Ujb8x1ZQFveqGrZq9RIXMPrQNiVaWEk9hQ8dDf45IzxTJLQ+Fs0lg4i8DrLDKtJiy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817590; c=relaxed/simple;
	bh=sMYd/G2O5aFpZUUz2+9x2/OBCEzxbrVIwrVFRQ47Afg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jo3Ut+71HeMB1QZ4wf53To6qO9dncFUhl+4NaG+6SeeY7qZVf/Y4l9v8z38WkwMDyr9jH6OAhZ8Dqn0IuAR09WmRK5TqjFYC7cqriCrVjZ42+Twhi6Nv5B0zTa5jLMuQrM3uBf5fu2MrzM/DSPVyWY1hD7zBKYUmuG8Zp88NRj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+5NcF1K; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+5NcF1K"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bb359e6878so680747b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789817587; cv=none;
        d=google.com; s=arc-20260327;
        b=lQvowWX9aj/iOTyz+iMj9RjA2wm11Oijz5kX4jrOIiY5BOFcSdUTMWcbBImTG4kPUG
         O5a2pXUXBbDGbQxeS8mNzTle6WMXsD+dtXA7H1KvvxSysUkgeqHvE66JnHniNPfv/PqO
         Jafchp3rExPm5H+LIKb8qLHVt7nDo2ZE3qPoPcNIiu6Zn30gZywLYvXVg526H7nQAVwS
         4vlQfBcf8pIRF6WWTDe0OPMbFl4MdbQ22u2sU40kQU/24jHRxp7BJ3qbxWJzAMGxnE5M
         vtWcSO/kU8wsSF3VYWJvtYGbXfT/rIL/dVB8wgElne69FsBDSF6sX5x0AnCKUifXJZTs
         mRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        fh=Y/75kUPeaLIx5HosxTiTd/Uzgif1WxYJ29hk1KWfPT0=;
        b=Hc6pCHbX/GQoFBp2OoHKZtuPh/3zFo6PVImm4OgTS6bAYAXPFjLQSo+Yoh/ZHO7+f6
         NWshHjReDU9O44Z01med6GJ9398yQtDnhNPld4uBAuTSmv2zC9d2RAkrRHFHoXY0jXVh
         FpZmjI/O4x4ahhGDDAk7UaxYQ52BlFOqxv2z7ph5BV2JHzr7GcyMyghjz6mgHTwaETrN
         dEFGiIWX52LKP0nF/OIVKPGKzGE0rn2OiF0XSJjju7BoprIzdT6f61xGq/mxj+9X3/sv
         HjMheuEe0h7dKJsJZ0w6R6U57SQLYdpqv3ejm/v/6P0XFmY+rr2CCtRSM7hu8fYn+W17
         /52A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817587; x=1790422387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        b=o+5NcF1KDgcbL8mjOtY8tlnJLK8PthDVVwqDdxqUhrztNvowpyZu6RhW41puhx92N3
         osIQzoUUWpSJE4RCCfSwmiCMwYxneaF0D7HKn5cymTFp1LXZg1dJrybi7mdxDbQgEl2C
         QT0N7mpQb8ag4PG80ET0u7ID3RhNEuMAYDrubz76BSy5AGisCQ0+pu+dQndd+ntla3xm
         Gwh9HN6zUF73E1jctKH19JVMpBlLpgQX0c7uVGvusTe067wjc6KLK276VBiLn8n46m3/
         Ga8pIxHX/f2KC/3rtw8JjRxu9GM+bgLIHDmWZfCBa/6Tk/Aw4ihKn024DhcTikp6a9R/
         t80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817587; x=1790422387;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        b=biUILqmyWnYBHm3M8Evlej1n7iNP99OhXTIq5iLB8jw9jJyEjp9DGNNyyN0btkbeqs
         P70v21mj1VSj2Ucj4LrcMrXyWEWwaX9GQ/H/2na9bicjNiwv3nf/vU7Wd3ZOdC22PFnc
         DmKDTAFHajEwIJFjxNzszK/AXThi9XHG2usYF1h2wQdTerx3ZCMrevWMrWeCjOLyeUSA
         vQxZmNXYYAIZx00iF5oFT7XJ0JZrafscUcADhIyGUzyjqzr6BB71Gan4BiENto36Y1u0
         MsiinXbz9Um6j8dC6uPXDMUbbDK2L0wmUoP1zMDR/3rQA7xEuuPEketrShzzUuYjenkh
         t8Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzoEGUd+qdXO0mMunlXuTOnqozkMdcKsHBAHMFT75gYePKWfo17ARIDo87hKxbUjlA6xoOIpY7+gcjNTME=@vger.kernel.org
X-Gm-Message-State: AFuF++kIzDcALSw324ZBwmBydEHNoCznlsJJFThgFMF9mwmzm5BT9Vdo
	zkZz0A7GtrQsrLU5kAO470Y0m6iU9JSxJZsO3RZwsAaJujc65f4TCTdeWnVo+yP1iVtCAeiryY2
	k4HTOfd6dsIdonrX1UKNwZEMHzDNNh+gDOOY2Dzqk0g==
X-Gm-Gg: AYBFou2KtSja8NECVGH2RtOcOmTDj9Bx50FhQgBgAupUakR4wllgZlx7ZT/7miqdyMY
	9vb8IZkWHY+xPU+Or2Q/VbkDq81jxHkOUEe3dB0qntn0yfotVV6dwSEVXu1xKHioy7y4+BDMsa5
	kZf6TEVd4uOFVK837RlNz9If4vHgUNIWODLRBTwJT8f5EQvEpY/pl1bG23aZHixvg5g8OUxNUsh
	3JYr0TueQy4i2UEWD1+/5274mp7Oi6H7uHwGeTSr8eF2FPyrlMwmJ0YfLdIcxXXcaQOaqAvfcCE
	34X7yozY8S4cF0CWyciQNEuW2PrDevAtvHos3qCc9nHzGAFv70d/iJ9edMTnuYZC3d1vhL/kfsQ
	aPRVAt7hz0zVpQdoQdnGN5uslAtQERGsfF8yVFAh4SJ6M+x4b/2+6sJ669171c67uu+GSCpsGly
	xYn/hgGFMO90Ymm1AGO8yjAGKObBlHQV4=
X-Received: by 2002:a05:6808:1393:b0:48f:c907:7a40 with SMTP id
 5614622812f47-4ccf5df1125mr5367481b6e.11.1789817586988; Sat, 19 Sep 2026
 04:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Brom <bartosz.brom06@gmail.com>
Date: Sat, 19 Sep 2026 13:32:28 +0200
X-Gm-Features: AcwNN1VPYDXQ81j4BgL6OwAYPwWgg07mS2mzO8MDKUrktd2IJuXmg2lF-0OXIP0
Message-ID: <CAN3WbsTf=MYcGC7mCYtAvtgcwXpUQDSG6VRpmVZ-s-erCaP19A@mail.gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eh3174nw
To: tiwai@suse.de, perex@perex.cz
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
existing fixup.

Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
speaker mute state.

Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 5127a111c..2956e666e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7581,6 +7581,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt",
ALC236_FIXUP_HP_15_FD0XXX),
        SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+       SND_PCI_QUIRK(0x103c, 0x8bc7, "HP Pavilion 15-eh3174nw",
ALC287_FIXUP_HP_GPIO_LED),
        SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
        SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx",
ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
        SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
