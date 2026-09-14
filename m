Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58F478E57
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395949; cv=none; b=pA4US8CLdyLUic8fOvdALtaqWusqKqYA80GqMsG4kf8tt/3qPWs9S/r0iTmp0XBi+WM2g+trRxe30qFif05o+n2DoksLfvC5hWvPLdOeMy0jDx5V0TzNOi0RHRY3+mla1QbwLh774KK4dd2TkWg4W4NKOPYaL8Kji25XgIKqngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395949; c=relaxed/simple;
	bh=SJoqlyInyStrJCU2+zHZO+u2KZadNybdgojKIBIcG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gp2znZNbV8CTer90N+ffrojOUeUZPs8f0e4Z9VJIyeHFkA9H6WdhxsXaNGndPnVD7Pazq6a+1M35MOnb02+PjuzQUluF0h4eqpf2yzdFD/yjYYh/jxr2PDtZFn1+HmsdEc7X15n+sEkyDuwWLdhSbyNHncA8EDzqHztjWGIZI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chxmp8Fg; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chxmp8Fg"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c4so156738985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395946; x=1790000746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cbrUuOFw3Wqx9C1cf5Ffbk+aqnpZB5D5lULOB4WppM=;
        b=chxmp8Fgu7QNVvLEJp6GuGL5I3YGETf/FLseZCzBbSyvxWgCJwEcavla+0t1RfSZiZ
         LUMorVGpKkQnyvz+Ic5gsUiU8OWay6b15ocp4WlOLHy3JUpJr3Xm8YlaXLLM6j9Dh5GO
         YDw4OgXyp9hNKuuPvOOmn04yzndf2/2ikc0ZQ6TI0SeKo0UO/oq5v5er1sk4Sunkt1Dy
         83fCdWmTSnDMowhOQwmpiUnWP1y1OODYZHyF7LYB8V8UCp8VS92OHAmcdsmWkZUZQ9nF
         TMQVe/GjK6P8e7xUujD+BbQchRySPp9HvzOpiO033rpcVRW8/DPtZM64cjsKXsXA9uSg
         pkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395946; x=1790000746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cbrUuOFw3Wqx9C1cf5Ffbk+aqnpZB5D5lULOB4WppM=;
        b=kKJizYyc0+V7rtxdmopfA5ejHOCyG+tGrfjmFBau9wmgBcKV58vhIwMj6BOHbrLsCg
         XEf5YQWKrisW2AchxEwOm5CbLE4CBfGhECEjMoAWvBsaI+JHQMuDHD9cZOCt9XwA6qhv
         BzhSpe9/LUav6gXqHo3eUZgKIFz7+FmDsWMcwc8adsCdcwJYafNhuB6UIDXDFaVPPNAC
         7st7ikObKwHsV2Ix1glFh5tc8Z5+07o4PdP2ubbajWg6tJ8C/1opk341lTssjd6Pfa0A
         vNV7rsrf+XJ9U43ljeMrQbjvBEGsQ8sOxeyRAjifOuviF6O9rdGrtl8lxtJHoT0sLB4J
         EsZw==
X-Forwarded-Encrypted: i=1; AKwUvBxT0cnUUdw/X7MXUTOL/DDPb5iNgHdE+2lQX0faQFoSLWLSQg4vzDLgf0EjocIZBi8/9lsjjGmvICvi31k=@vger.kernel.org
X-Gm-Message-State: AFuF++mleFAM71ULULzGIWs5/Rfut974BxDnCFbdri1Ly+opECdF0M/q
	O7xtWg0Cb0Fn3PyF4BZhaf+jSYpYtkLna+ZjNNE88s3R10VfHL+n72fp
X-Gm-Gg: AYBFou314x7sTg44q+ZJb6H1UsOY2HQRJ+MBm/HGVqBGpQ6yegDQ2C3nACYA50WCxgD
	2OyxtfGjeNetvXnYALH1hLsSC9lOfPV2JTjOPvLXHF681q4+HEJ7/0KsjLe7V9ED+FgVKCfoEy3
	pIyDAFuTpvrAYDWs9aFq8si5m0r9BRTQsv5/6t4ojABAC7qotbMWXWKx2EQULmpNmkY1MZo3t3T
	H5+3WPi6mLg5ZtOTcxDfd0UV1u6QrOpZRTvOMSHBS3+wEFBC2BDSujUQtI+V6e9PqSf36LvGhTS
	QVmJlnjjtJkpqMbC3eHOSy9xvog36888xFHz3fhja6kNB0iHko4VpyaOjsHU2Eqf0z/pBnNYgtY
	TptF2vg+BIDs/Q2czCp1lj3leHjrBlMz30v+36v5Gjld13bXKoPyxBbGq/mXNzpar6rqZo4IyCp
	VKuCMBsjhPr1NuCNspNzxymAVj7aDC9383B04sSeTmao/feavECqjWLlHun3cLBQUsirX++w==
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr424902385a.0.1789395946075;
        Mon, 14 Sep 2026 07:25:46 -0700 (PDT)
Received: from omnibook ([2600:1002:b1ae:f93e:a20e:364b:d6a6:92a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecea9f35sm934237985a.7.2026.09.14.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:25:45 -0700 (PDT)
From: Jaeho Cho <jaeho2025@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaeho Cho <jaeho2025@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 17-dc0xxx
Date: Mon, 14 Sep 2026 10:24:42 -0400
Message-ID: <20260914142445.3476212-1-jaeho2025@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OmniBook 7 Laptop 17-dc0xxx (SSID 103c:8d9c) has mute and
mic-mute LEDs on its F6 and F9 keys, but neither lights up. Its quirk
entry only sets up the two CS35L41 amplifiers, so no LED control is
registered for either key.

Writing to the ALC245 by hand with hda-verb, the mute LED responds to
COEF 0x0b bits 2-3 and the mic-mute LED to GPIO 0x04, lit when the pin
is low. That appears to match what ALC245_FIXUP_HP_X360_MUTE_LEDS
already does, so add a fixup that chains the two-amp I2C setup to it
and use it for this model.

Tested on 7.2.4 with the patched module: hda::mute and hda::micmute
are registered, and both LEDs follow the speaker and microphone mute
state, including from the F6 and F9 keys.

Signed-off-by: Jaeho Cho <jaeho2025@gmail.com>
---
Hi Takashi,

I found the LED wiring by trial and error rather than from any HP or Realtek documentation, so there may be details I am missing. A few things I was unsure about:

- Setting COEF 0x35 bit 6 also lit the mic-mute LED. I went with GPIO 0x04 because it matches the existing HP fixups, but I do not know which one HP's own driver uses, or whether it matters.

- The sibling models 8d9b ("OmniBook 7 UMA") and 8d9d/8d9e ("OmniBook X") probably share this board, but I only have the 8d9c to test on, so I left them unchanged.

I am happy to revise anything that should be done differently. Thank you for your time, and for maintaining this driver.

Jaeho

 sound/hda/codecs/realtek/alc269.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8f55c3c..9cdfa19 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4318,6 +4318,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ACHG6,
 	ALC287_FIXUP_CS35L41_I2C_2,
 	ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED,
+	ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS,
 	ALC287_FIXUP_CS35L41_I2C_4,
 	ALC245_FIXUP_CS35L41_SPI_1,
 	ALC245_FIXUP_CS35L41_SPI_2,
@@ -6627,6 +6628,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
 	},
+	[ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_X360_MUTE_LEDS,
+	},
 	[ALC287_FIXUP_CS35L41_I2C_4] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_four,
@@ -7671,7 +7678,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dcd, "HP Victus 15-fa2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8d9b, "HP 17 Turbine OmniBook 7 UMA", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8d9c, "HP 17 Turbine OmniBook 7 DIS", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8d9c, "HP 17 Turbine OmniBook 7 DIS", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8d9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8d9e, "HP 17 Turbine OmniBook X DIS", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8d9f, "HP 14 Cadet (x360)", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.55.0

