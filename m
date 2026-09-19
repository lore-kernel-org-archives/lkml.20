Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C13BFE2B;
	Sat, 19 Sep 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820034; cv=none; b=uVDjndx6qtyFBqVrjvq6S8tPkWyTZiDte0FuUloMvFNuzXAZxsPEkDWk8sfdaB5Y28M3KtbRbwyCp+eeRarhDtP6HzewnGSLdUDfTyCRnX68ybSX9R0+wFhLAc8BFwj84REsleOM8z/eQk1aFXUw4gtqkcQFbzqVVgKOPxLDZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820034; c=relaxed/simple;
	bh=3V+gyg4UvFwIdmvNDxSHw/MnbrozyQTiBBKEfOS4gco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kfn4FxYcmS5EeZxl5k7wm8mjWeFnqJNJOz91sIp9VkIru8DX2FvXhSPTn3VSMFWA8zZ9R/XQuP0ef3RrGqAuDtGUXURB5U3EJT8G94NBMj75TIn7NHwo+xu/ni9HJZBHuc5DrmdNI+BtgcxOLgP6q0NOR7zuzn5/vNVwEs/EYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=ei6zQvJU; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="ei6zQvJU"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5f6a4ab;
	Sat, 19 Sep 2026 20:13:45 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: amd: acp3x-es83xx: Keep an owned codec device reference
Date: Sat, 19 Sep 2026 20:13:18 +0800
Message-Id: <20260919121318.1618315-3-lhfff@tju.edu.cn>
In-Reply-To: <20260919121318.1618315-1-lhfff@tju.edu.cn>
References: <20260919121318.1618315-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0b996390a03a1kunmb5cccea33e6273
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGR1LVkpJTUhKTEMdQh1ISlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT0
	9LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ei6zQvJUretJW2JRawQRW/ln/on+bfeqKpc22wnOcTQAPPlbbM9+NLYSI1R8MQ5DKYqmiB63xb8oLW6DJg+cBiz/XZI4MSdCyuneZooDisKIWs+MZl0rWJHDniqMCqCnvf2n8g6FGzFEW+JllTDTkff4FDJK+s5Ig7yuHFLzVP0=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=h5k6J960l6QWCMaVx6aERKjGAkFEwDDxzYE5Yw3J+/0=;
	h=date:mime-version:subject:message-id:from;

acpi_get_first_physical_node() returns a borrowed device pointer. The
private data allocation failure path in acp3x_es83xx_probe() puts that
pointer despite not owning a reference. The successful path also saves the
borrowed pointer for later card operations.

This was reproduced on current mainline with failslab restricted to the
real static callback. The rejected devm_kzalloc() returned -ENOMEM, and
normal codec platform-device unregister then produced a KASAN
slab-use-after-free in device_del(), with allocation in
acpi_create_platform_device() and release in acpi_unbind_one().

Use acpi_bus_get_primary_device() to acquire the reference while the
physical-node lock is held. After allocating private data, register a
devres put action before publishing the pointer. This balances action
allocation and later probe failures, keeps the saved pointer alive during
card use, and drops the credit after ASoC card unregister during successful
teardown. The existing OOM put now correctly balances the owned lookup.

The same filtered KASAN guest with this change reached the same -ENOMEM and
unregister path without KASAN, WARNING, Oops or panic. The test directly
invoked the production callback and did not emulate a complete ACP/ASoC
card or physical Huawei hardware.

Fixes: 54fcd9dd44b2 ("ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec")
Assisted-by: LLM
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 3a640e652314..568142b6d115 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -41,6 +41,11 @@ struct acp3x_es83xx_private {
 	struct snd_soc_dapm_route mic_map[2];
 };
 
+static void acp3x_es83xx_put_codec_device(void *data)
+{
+	put_device(data);
+}
+
 static const unsigned int channels[] = {
 	DUAL_CHANNEL,
 };
@@ -428,7 +433,7 @@ static int acp3x_es83xx_probe(struct snd_soc_card *card)
 			return -ENXIO;
 		}
 
-		codec_dev = acpi_get_first_physical_node(adev);
+		codec_dev = acpi_bus_get_primary_device(adev);
 		acpi_dev_put(adev);
 		if (!codec_dev) {
 			dev_warn(dev, "Error cannot find codec device, will defer probe\n");
@@ -441,6 +446,12 @@ static int acp3x_es83xx_probe(struct snd_soc_card *card)
 			return -ENOMEM;
 		}
 
+		ret = devm_add_action_or_reset(dev,
+					       acp3x_es83xx_put_codec_device,
+					       codec_dev);
+		if (ret)
+			return ret;
+
 		priv->codec_dev = codec_dev;
 		priv->quirk = (unsigned long)dmi_id->driver_data;
 		acp_drvdata->mach_priv = priv;
-- 
2.39.5

