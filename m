Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B593470445
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783266; cv=none; b=VWRu+b/gjJRbz5a7Z8zTP/Zli64jYbghDhayTfUBZ9tEF2kOh4m8cEtfJ9vxMQ5zpVHkU+gqQ7IqfIy0AtxZayvKsW5iJhnDu60FQFxidJdy4O8aYVjT9qCQ6mgPD43CYHBXxcuXGX4PUmOH0Stv42JU3Vq8sTdj1pOR3eg+GIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783266; c=relaxed/simple;
	bh=UTrnTwVr0/6BvSqXaWbnJ6AR2vQZSFhfgdbJrJZ3Bkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MzxFgh5HK3RmDXPwzynScBCEpOJ4nQIFzo7iR8I/6cMHNR+Y5L3X7ixDd1Khwb578fNkt9ubIoBIVoSam8ef3VSDwzqsJ3XrEA98eMDjhXo9mJOjwrauVq2vrxPNiCrlfodLreGym5sFKial1/a0hpp05vxkgtwDYhAotX+9nXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFMzCKt+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFMzCKt+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so5448610a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783262; x=1789388062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYyEbC+uMh1/QUV58z0d9bHJ82hstcEg9VU6J+GXbrM=;
        b=VFMzCKt+LqgUo/hNkIKsR1DV+GYSQgrAjJIlRNKu6Tyz36vLwk8qeRTrFJ9E9AIXSH
         TQNF7sZcoCld2BwPsBn8We9TbsfiQqsrG6skMkmyA+m7eMsPS923vbT7qc7EdwFX4roz
         doT1WDM96DTCgnT6KTOjM3OFDqpo/pVkrC+nexp2UL4QyNwTX+wYHEvA+Y7vdwehzfng
         71x0VYlgUOqNEn6SNBqGgwTCj34IyO2jEjbsc8GLnKesgAw8aUrkk48L8AlK6xiny3Cj
         Vo4/V2+W2k2vA8dihN/9BnIbv/obDyfcp2wBciI7J3LaVn25+mMtcoX1R+qQDP5Qubjw
         MypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783262; x=1789388062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYyEbC+uMh1/QUV58z0d9bHJ82hstcEg9VU6J+GXbrM=;
        b=rNVaxM9HpwarjVpU7Y06LevT/Nd14tsxg252qe3RfDiocUmIaBUlYQt9SCybSZf7jI
         I1dgJ14dxFjZZyi1SMfNRZkcd5WvgRbr0PDPP9VL7W9s2n5rR07/LwRNXoVJRxHPR2m6
         d9g5tgPUasjyOIX8IfohGCZDzNFS3LOsFzTPBJ11eybUxVA9z5cFnRgGt2TmgIdkihkU
         IiPI89csVB8kVt29ZwB9LiUHOIsr0bQZjmmJdn/xgTnrXrlPSFlVSvVJL9t3sT/E5rlO
         7H1MNcD2KKABcKghY04uvw61gfVAJUVOTkXAVio5FiyG820q2Ikvo7H+9W6CKiKu1pcG
         3R2A==
X-Forwarded-Encrypted: i=1; AKwUvByFQdpUNUwmNqWp/sNW9DVrkILGM3v4MUOm2SZlyGtxffBOgHtY8UpPdAMkZOA8gVPQX45Wc1U5BohKVPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kjPDvt25XWA5sOm858aYt1MdIsuwHCPN/NyMsuFYkkptXbSqLU
	JC5HK0kwWq/V9/CFIJ8fD2IF6UWy9Uk+fnyQQC1tX2Lp6kjpV25bDb0=
X-Gm-Gg: AYBFou35NsTebRpW79ZQFzx8zQvrAhUMB4BCK7HyhAqmVj+h6hfcZlZFU4CfsuI3ll0
	YOL4k5f6Pa4Ruq64+6ifeXq7bhVhyigHnNHzr7jJGx/9+zwMbs0Gf2l/dZfpB79yKVn+RYYCdli
	9lczDqwDHYcZBiXFzvOPSzwScMyswYgioqOV+f/R8n4y3QqQENiwp+UFpiqexqUH2ODJs7LzJ9y
	hIv5cajXknCPZX2v9jZihjJbnBy9gxGSn9Y8LYIVMY2De5ik3h0KpnjUlAo3fAhxYbPo33wIrOB
	9VIgMIviIWSQK6ijWv6AOZOzzNY3Hix2tzltY5jS63Y7AtEPEF0nAAJCMwu9BmLji4cs2L7EhGS
	Q59WKsvI/YobnZ8x9L36zNinaWxQT+8OziiSF/UvdCsmxC9yGQO8ne7GMTkhHddMNxrZQuf768I
	cBjEQ8MHynmBlHCdeyJurVkkDrvNyJRqIyD0Shdm0qL+1nNQ8d76OYfAIdflgrFVBpgWiCYSw5d
	DOkf24ZUxs3yg8LSNjrt9yLmYc5
X-Received: by 2002:a05:6402:2552:b0:6a7:ea54:378 with SMTP id 4fb4d7f45d1cf-6a7ea541ebbmr7455112a12.32.1788783262180;
        Mon, 07 Sep 2026 05:14:22 -0700 (PDT)
Received: from c13-yoga (85-195-250-62.ftth.glasoperator.nl. [62.250.195.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb790sm4714443a12.3.2026.09.07.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:14:20 -0700 (PDT)
Sender: Yorick <yorickr96@gmail.com>
From: Yorick Rommers <yorick-rommers@hotmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards
Date: Mon,  7 Sep 2026 14:12:28 +0200
Message-ID: <20260907121228.13754-1-yorick-rommers@hotmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "AMDI5682" ACPI HID is matched by two AMD ASoC machine drivers:
cz-da7219-max98357a (this driver, Carrizo/Stoney) and
acp3x-alc5682-max98357 (Raven/Picasso). cz-da7219-max98357a is linked
first and probes the platform device first; its DAI links reference the
Stoney ACP, which is absent on Raven/Picasso, so its card can never be
instantiated there.

This was harmless until commit 42d99857d6f0 ("ASoC: core: Move all users
to deferrable card binding"): devm_snd_soc_register_card() now returns 0
for a card left pending instead of propagating -EPROBE_DEFER, so
cz_probe() succeeds and permanently binds AMDI5682. acp3x-alc5682-max98357
never binds and the internal speakers and headphone jack get no card.

Detect Raven/Picasso (and later) by the ACP3.x audio coprocessor's
dedicated PCI function (1022:15e2); Carrizo/Stoney reach the ACP through
the GPU driver and have no such device. Return -ENODEV so the driver core
continues probing AMDI5682 with acp3x-alc5682-max98357.

Fixes: 42d99857d6f0 ("ASoC: core: Move all users to deferrable card binding")
Cc: stable@vger.kernel.org
Signed-off-by: Yorick Rommers <yorick-rommers@hotmail.com>
Tested-by: Yorick Rommers <yorick-rommers@hotmail.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Tested on a Lenovo ThinkPad C13 Yoga (AMD Picasso, ACP3.x): with the patch the
card comes up under acp3x-alc5682-max98357 and audio works; without it
cz-da7219-max98357a binds AMDI5682 and no card is created.

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index af559653e625..1ac729a58bb4 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/acpi.h>
+#include <linux/pci.h>
 
 #include "acp.h"
 #include "../codecs/da7219.h"
@@ -742,6 +743,18 @@ static const struct regulator_desc acp_da7219_desc = {
 	.n_voltages = 1,
 };
 
+/*
+ * The ACP3.x+ (Raven/Picasso and later) audio coprocessor is a dedicated PCI
+ * function.  Carrizo/Stoney - the only platforms handled by this driver - reach
+ * the ACP through the GPU driver and have no such device.
+ */
+#define ACP3X_PCI_DEV_ID	0x15e2
+
+static const struct pci_device_id acp3x_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP3X_PCI_DEV_ID) },
+	{ 0, },
+};
+
 static int cz_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -750,6 +763,16 @@ static int cz_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct device *dev = &pdev->dev;
 
+	/*
+	 * AMDI5682 is also matched by acp3x-alc5682-max98357 (Raven/Picasso).
+	 * If the ACP3.x PCI function is present this is such a board; return
+	 * -ENODEV so that driver binds instead.
+	 */
+	if (pci_dev_present(acp3x_pci_ids)) {
+		dev_info(dev, "ACP3.x PCI device present, deferring to acp3x-alc5682-max98357\n");
+		return -ENODEV;
+	}
+
 	card = (struct snd_soc_card *)acp_soc_is_rltk_max(dev);
 	if (!card)
 		return -ENODEV;
-- 
2.55.0

