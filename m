Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F6423EA4;
	Thu, 24 Sep 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268513; cv=none; b=JmhZmpzDgNtksT5umBNzf1wmR8Y/rHPFf7jk4MTLnmoMBlA94gIyNSiM2p4hKiyA+9CTUPJ8USN8fWGGgWyiasqDoUyj7CJM0Vq01norD1pC/HN0oAwdjsLViukJNfeex0PNihNqMJoGigUDFEqeR09bqp80/4DAaBg3qgnC02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268513; c=relaxed/simple;
	bh=UzfMfNTQCkY4ZsxfUknTt5iuqxpYH81DBEfnWb8KHmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SOS4assqEl1hKYyBReixMi8Mvfc1ViJKQvDSloBqfudNjcKECibFQOvMhlMRI1pMVSGFlMuBS+7afHCbNFkhQxDeCYGUgzTUR/dJOSqouU/6EJPs4BCSRj+2gbK98IT+X3XUXnP5JDP10KgV3DfHxNNsVfqv/4pFjimvicgqOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7j2aFdx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7j2aFdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790268512; x=1821804512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UzfMfNTQCkY4ZsxfUknTt5iuqxpYH81DBEfnWb8KHmM=;
  b=J7j2aFdxb7Ks5wY369wOpFIizEDAr7DsAnzIMyusMmOg5iHBdo2wtBZQ
   t5+iM9AmT1GRJKX1DH8YPJto3nxpSkgDynkhym+QO35CkrH3//GGtD62k
   pITDkPckZ9Zy1lAI62fVLDK+Ic6Y9iJrjzQvxrha5epeBXHusacvpwGLE
   BCFz0/xSy6h49XBE5YO9GtANR/tZwkMM6RPC2BmAXL557rXs7/nDCp64H
   uL2moewmcZaka37+FCg4hNVvl3fo1nHuyBYaTsmt+huvkQr8avXCWUhR2
   xU4WEYk6YL1aRTgkcEnvZaqqADsxhrr9xbUP6XHqEHVbj83Es1lpDgHyS
   A==;
X-CSE-ConnectionGUID: 9UlSVuAuQcioLeg6yhx9pw==
X-CSE-MsgGUID: IeYjXRW9SYyX8rcguAdDWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93545718"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="93545718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 09:48:31 -0700
X-CSE-ConnectionGUID: UaUIP5h7SI6SQYOgyvs1iw==
X-CSE-MsgGUID: RFJxkSj4SdybwW6PyYfCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="300358917"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2026 09:48:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 54CF599; Thu, 24 Sep 2026 18:48:27 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v1 1/1] ASoC: sprd: Shadow errors from dma_request_chan()
Date: Thu, 24 Sep 2026 18:48:12 +0200
Message-ID: <20260924164812.816743-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reason the SPDR PCM support code requests DMA resources
in the IOCTL. This might lead to the Linux error codes, such as
EPROBE_DEFER, to be leaked to the user space. Prevent that from
happening by shadowing errors from dma_request_chan() as it was
done previously (see Fixes tag).

Fixes: 08d77e31df21 ("ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260918115229.CC8AC1F000FF@smtp.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 2 +-
 sound/soc/sprd/sprd-pcm-dma.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 0b110b72482c..d18c9a4e5a77 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -157,7 +157,7 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 	chan = dma_request_chan(dev, dma_params->chan_name[channel]);
 	if (IS_ERR(chan)) {
 		dev_err(dev, "failed to request dma channel\n");
-		return PTR_ERR(chan);
+		return -ENODEV;
 	}
 	dma->chan = chan;
 
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index bc4d24e5a25d..fadaafbd807c 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -171,7 +171,7 @@ static int sprd_pcm_request_dma_channel(struct snd_soc_component *component,
 			dev_err(dev, "failed to request dma channel:%s\n",
 				dma_params->chan_name[i]);
 			sprd_pcm_release_dma_channel(substream);
-			return PTR_ERR(chan);
+			return -ENODEV;
 		}
 		data->chan = chan;
 	}
-- 
2.50.1

