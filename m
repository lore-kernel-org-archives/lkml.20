Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DD296BAF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118357; cv=none; b=rR1I5IAzymnr3c7f+0HdYNij/UT2q3R2gdDglAhjmcTEvpTdv1tsIN3KOmWPCNBm5U2S8AQEpLBtRkFxVDMnN9S7bvWv6hkAUFIvTapivPDGUqH6nNu0tX3lm4h8OaeSJ2Rt1ThfjOWpM6xHIWJmGjISWSJmRzA1ICRxdeL5aBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118357; c=relaxed/simple;
	bh=ukvRG+eGml9IVW95j6YyXQHLAFiPnlfIx2qs8F/RGic=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=H7yQyfe+yRN711DgXMAfE8ibdq0vdCmB17LfOAoBvd6EHvYUq7/sT8g/yPLNb7QWnMg9eTZyQIF/gDEtxf1weuFA6PGfPsJBW0ag+28Bxm5wsw1sVzsLPRrSEMIazfh/hTE4cTWVYWHObLbOQAwPvPijCARa680cMRut8As7Y78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMQszls/; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMQszls/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5350c1b9e0dso24843351cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118355; x=1792723155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSW72b6TbEDeHWj4s+TQe2ybMIewbEC1kCXuvHMAJq4=;
        b=hMQszls/BpON0PvW98EQHQZjchs0Becn5V3ufv/HesZ+1GMb719fI9zPDTOaTaMqAF
         yJG7L7QsAsbO0CdMi3kt7qt/vumfuKeP/3/QipYWBw4ajhRc9Q9T31RlilqfP5vjIZqE
         xjPFL89IKzhs+DoircawqEfCaV9J2JHRFv54y9ZEKRQQq9Mz5wrkzGjlNFYaA7evqY1g
         i3hYZoZChpJ0an4cwkvbD1qAWG1jl6Grm4bjEotvTBgW+4UDyIeUVhGrKmERRx6kwt1e
         lZJf+3LrWF5QbW6BaZqwUINR97TwxzR1/epZBIiXqrm2r+naymlInEbR5jvQcuCv4N9L
         X3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118355; x=1792723155;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSW72b6TbEDeHWj4s+TQe2ybMIewbEC1kCXuvHMAJq4=;
        b=AV4j+j7u2zgh5zoQq7PjGQhYZiany5oVolHznBZlHyvvWXKHlaJrGHx7aw0zMiVvpk
         JBRgbQUZjjC9f7xpSrWeyJ4HIkmAqgiVuRjYab5SCOF+/E6i9A5b8mW/3g9iJejabjZD
         mTgxrwbfe34kz2P/qjz4gDJ5f7doAXv2lAqhSW9qEz/ecF77W+yZl47Y/jWRi0ddwRcl
         Rv6PwSd4Qtohr3nKW+1X9HbN6n2xrNQ1cnfUgMuDPt0ZBkKBDoTks+M/4O78i9c2McoL
         sNHYAahvr8mrljWKsLlSWQcsDmXUp1u3HjnR2OiARXQRAxJs6OMQNEGbDShQ9Zo3+5fM
         4rSw==
X-Forwarded-Encrypted: i=1; AKwUvBwGT3n7WLF6g4iykrSZ7T3qKBe2lF+1WtRnDJem8vuSqvdEj0xmpoI90jAFMnfW0zy98qKbs8SOwDMq3So=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWw1tL4Gh40HVEhF+epEHOlO2qcT7AVbGax1gdD6VPsFXljfFk
	YAuDs0ajP6h0GoclC+4AXFSFmvHmxeOKsJ5nHbiDdw0eRsxEgkljcAw=
X-Gm-Gg: AYBFou0c3BontxrxqtGP6laqtHLTmEg2dSAMGHpUZiMcHZaWHvZ4ZholI6I0n2wpAUZ
	Lq6AnbuWYSAxtsn7zp/0PRsfJF0OHfnzVPenNg70VIev10SjLtoGKnJQR6XS4mYAlHhSZK6UALy
	xE2ly29NfKtaIAiWSkl4jsT+9QGJqaVpb+8gMBcu7H1itysrp47oQQ0rQ7jhKNqi6kyzjfgmGcp
	PLDyoxq/QYcwdUwfxRvB+uMUBEAV98eeNcdeO3NfRvFQqVGuyk1QkqARgyzRbxbuXuReBxyksGn
	HQjG1I5w2F3fL0Q7QQR8RFAx0q0twAKXY20Bjzhvso9/pVVSpvDfYeG6ZIUmSrKh/tVX18bn+z3
	gMiLeyFlm6aQ2k4WKC4YyrEYu+K/HMAJI4RO6Q7ixCEPJdv2Ot3d+D0OU7htzKoEreW9NXXqk2+
	8K0c3jtTzLSd8c37CjCSLmDI6Eihx6AGDU1FUW6MZRz8Sqz+/I8QjPLRrBl68qKvUvi0BaBg1Kx
	0rJPPecSW/uwzJ25aJSRLxQAGycgar4izivDjArwq9+8il3hW1i7yPkRvbT5Flx+9kUCqyqEdIz
	pM96q/pPkp5jVZDWarHSUPGtgscw
X-Received: by 2002:ac8:5f8e:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-5359f46d56bmr352039851cf.4.1792118355392;
        Thu, 15 Oct 2026 19:39:15 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e782fsm10160841cf.8.2026.10.15.19.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:39:14 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: fsl_esai: Disable reset work before suspending on remove
Date: Thu, 15 Oct 2026 22:39:12 -0400
Message-ID: <20261016023912.3658714-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XRUN recovery was introduced as deferred reset and later converted to a
work item. The reset reads ESAI registers and can restart the transmit
and receive paths. fsl_esai_remove() currently suspends the device before
cancelling the work, so a running reset can overlap regcache and clock
shutdown. The managed IRQ can also queue another reset after cancellation.

Disable and drain the work before runtime PM teardown. This lets an
already running reset finish while the device is active and rejects later
queue attempts until the managed IRQ is released. The IRQ handler's own
register accesses during teardown are a separate issue.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

Backports before the tasklet-to-work conversion need adaptation; check
disable_work_sync() availability.

 sound/soc/fsl/fsl_esai.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 4a530a6..83a9963 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -10,6 +10,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/workqueue.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
@@ -1099,11 +1100,11 @@ static void fsl_esai_remove(struct platform_device *pdev)
 {
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
+	disable_work_sync(&esai_priv->work);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_esai_runtime_suspend(&pdev->dev);
-
-	cancel_work_sync(&esai_priv->work);
 }
 
 static const struct of_device_id fsl_esai_dt_ids[] = {
