Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569538;
	b=kbFzk5cg/15ws+DXhNJffgX15a0/boGVf0XHGt6NHpOYrVdkVP7XRZWvZ0Coxhc3Fbxn
	 +Fmh9LFjSIvzmatmW7AuILnuqVQbuELE0H1Zo6uTOJRMFhM99bEeFPiIPPGWoTmE5fEz5
	 DD+aPdFqzjZsK5OC11AJlTbo57NmBegwvzDGYT9ogoZnd83su11ilz28b31KyTiIYgiwP
	 0UzkejTnEk3zXBv1p19hF1FULwhxOwjfcICVk/7DA5jvnNQrJ7xQPQ9CCNewJQnBDG3z7
	 tstsWC1PnowTDBcHAHjVRCtanXCVghUFVYPee0Po/SMKzZw6K8S9OYCM3fat6+e2MRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y9mujQ4uVPf2xnYoOMpJi9F7duEaE6HydYALywSp2s4=;
	b=O1mBzDV0KGog9yVIV7OtRggLoG0xE0spnYd5+KUKiqy6BXpIVPj6RuvdyF4t7a8a6hMc
	 pVhxj39RAciflA5KpJk4AfPlqTRqkACYrHP2DBf8z95go12DGp0UC5Dvnn3CWvmNdK7r9
	 f5VzjRmowfdY10hKmdSZNS32LVwF3Shws9sW2CDFKKVPFgA4fPZ/NvB8SOYZR0Iq2kIfa
	 EoqQboneqUp/iJ4QexTcGg/EkAsOLhGUUlgCLNL4Pd3Z6CIS7Alqzd1fOFzaLThuYb8J6
	 4MxPOSKgmANAZS3M5/wPjoQtRcX0pSZMDK3p587uiTKow8UsFnII7QeCwZV9bK3wi9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYaa+8TU;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB44606A321;
	Fri, 13 Nov 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYaa+8TU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569539; x=1826105539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EU7t5dhbbmJdPonhlPJ7QsNISS+2dJdXSzHIyq2fs6U=;
  b=bYaa+8TUvXsLdHzGmYCIpIhBwLBRzL38gTdnP/RReClVgPK0fusC48GS
   CTHEII1eIVSLKLF949HcbpTjDZMn9dFCTrdnY6X3M1frnkHXat4Y6uod0
   pESPk3J/OLMLv2BA3spA5VkdBUhqbCbNs49b6BHczr9zr/r35pveFA/Qs
   esO0qAkApcRfipW3LsKVLZjLKORw58rrE/39k2zF8iU3R05qaan+AEIMq
   tAM8PgNS38k8wgVJf7e6nx03L2dnmoNkVj/nlAUvQbEl8d02R97sS7SBN
   /ky0EPU9hS0uxMJ3iTWcfdRvcB2hvN1gGVlTYuNK1Q173RnYYmcyI3Rao
   A==;
X-CSE-ConnectionGUID: ohchtoWeQIu4BhKoUgNxHA==
X-CSE-MsgGUID: b5IV5C2SQuCZRJn4vbH5aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246905"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:27 -0800
X-CSE-ConnectionGUID: 5sClp3AgSgKAGc++r/e1hg==
X-CSE-MsgGUID: fHXgQd82Sy+wx2AJMwxF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235577"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:24 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/11] ASoC: Intel: avs: Do not skip errors from avs_path_pause()
Date: Fri, 13 Nov 2026 12:38:31 +0100
Message-Id: <20261113113840.3067489-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

During downward trigger() operation avs_path_pause() occurs before
avs_path_reset(). Only the result of the latter is taken into
consideration whilst the result of pause operation is ignored. Fix that
and make the first error take priority when returning the final result.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index fd4ab14bfe04..b0796d18c1c4 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -271,7 +271,7 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
-	int ret = 0;
+	int ret2, ret = 0;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
@@ -303,9 +303,11 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
+		ret2 = avs_path_reset(data->path);
+		if (ret2)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret2);
+		if (ret2 && !ret)
+			ret = ret2;
 		break;
 
 	default:
@@ -492,7 +494,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
-	int ret = 0;
+	int ret2, ret = 0;
 
 	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
 
@@ -530,9 +532,11 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		snd_hdac_ext_stream_clear(data->link_stream);
 
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
+		ret2 = avs_path_reset(data->path);
+		if (ret2)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret2);
+		if (ret2 && !ret)
+			ret = ret2;
 		break;
 
 	default:
@@ -868,7 +872,7 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
 	unsigned long flags;
-	int ret = 0;
+	int ret2, ret = 0;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	host_stream = data->host_stream;
@@ -915,9 +919,11 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		avs_hda_stream_stop(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
-		ret = avs_path_reset(data->path);
-		if (ret < 0)
-			dev_err(dai->dev, "reset FE path failed: %d\n", ret);
+		ret2 = avs_path_reset(data->path);
+		if (ret2)
+			dev_err(dai->dev, "reset FE path failed: %d\n", ret2);
+		if (ret2 && !ret)
+			ret = ret2;
 		break;
 
 	default:
-- 
2.34.1

