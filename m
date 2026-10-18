Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14641BA93
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353659; cv=none; b=KL2aYKnGr/iYoA8YDHBNDbJyuNXpoNXegFV8tPdSwA0E4Lm8u+bTlUTAX/JgoAldVMRNfUp8/DlBvgAFG0s2prFdtbAwcSMakAgDmInL1GORytWh9qRRCYSK8jf4c85FzvIVKucBI/VUuHUYzZVPP6ILcnk5MMNV2NG/LvT4QEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353659; c=relaxed/simple;
	bh=7DXDKizFUs2Cy9tSHE4KHil2ccfrx9+eco7MbQktoVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Se56y9LE1I4mBin21I9FujnCqy/gCJsj7wI4EvPYDaRFqhdXJYBf+2Y5KNVeF1EBWk+kuMGPKSJyHegojXvf38uhAuXT7y8XXD/YmffdGz5RIPAQmC8vfeR3OgNWMfZVRgU74MSEhmMgkFEHUdwnyZ/3g6WRyzktVfK9/KBsgoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L3CmQSxM; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L3CmQSxM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7DXDKizFUs2Cy9tSHE4KHil2ccfrx9+eco7MbQktoVY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792353656; v=1; x=1792958456;
 b=L3CmQSxM7/2PwxUvfX+LmziGw8HANDt6C4hVdh9UuVHTATcgf5sSL9k5NMuJJ2SgOgH+3eZp
 +eDsu0M0MAW6d7F91gZIWuwn1R4H7s53YUR3I4QvuHwVyzGlvuzMaCnUCOQbvwdD/5G0BirtK0A
 n+mP87183NCs+1njGZGmaJ5E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b37a12a848d1d196;
	Sun, 18 Oct 2026 20:00:55 +0000
X-Mizu-Trace-ID: b37a12a848d1d196
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: tas2783-sdw: refuse playback when the init writes failed
Date: Sun, 18 Oct 2026 13:00:08 -0700
Message-ID: <20261018200009.1493438-4-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the SDCA function initialization writes fail, tas_io_init() leaves
hw_init false, but the firmware download has already set fw_dl_success,
so tas_sdw_hw_params() goes on to play through an amp that is missing
part of its setup. On the ASUS ROG Xbox Ally X20 those writes come from
the ACPI DisCo initialization table and include the posture, which the
BIOS sets differently on each amp.

Refuse playback until the init writes have completed as well, and log
which of the two steps is missing. A stream that is only prepared again
after a resume does not go through hw_params, so check in the port
prepare as well.

Fixes: ca8f3611dcf8 ("ASoC: tas2783A: use acpi initialisation table")
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/tas2783-sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 8e7376889b6d..6c4cc8868415 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1055,6 +1055,11 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	if (!tas_dev->hw_init) {
+		dev_err(tas_dev->dev, "error playback without init writes");
+		return -EINVAL;
+	}
+
 	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 	if (!sdw_stream)
 		return -EINVAL;
@@ -1427,6 +1432,12 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
 	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
 	switch (pre_ops) {
 	case SDW_OPS_PORT_PRE_PREP:
+		if (!tas_dev->hw_init) {
+			dev_err(dev, "error port %d prepare without init writes\n",
+				prep_ch->num);
+			return -EINVAL;
+		}
+
 		/*
 		 * The Function has to be powered before the port can complete
 		 * channel preparation.  hw_params() does that when a stream is
-- 
2.56.0

