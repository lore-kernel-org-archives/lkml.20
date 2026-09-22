Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB148F031;
	Tue, 22 Sep 2026 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103112; cv=none; b=TW7ncMbchvvcbN3dp2tKM4iC1FPEVGj6AeN6TCLr8NwfqeI6vUbIuhoFHb0epdFHraujsAGSd8UcpiLO754vJKLvn6iVqJ8nbeE6iWt6w6Lf6T4n5ukOEsa+eOG1VjQKxlJXjzWCSXaRzQBE6xfASsViJ//WiEtEcRtz+bCj1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103112; c=relaxed/simple;
	bh=KjFlhvPPAexVMiE7rXYAYzQzoNnnhsZPKZsY8E6du3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvZXwUTZDvan9LBOSlYSzmjcnzO+jQxYpyUYRul4RYs4C6SVFlqIrrmYwBXLbmPTqXcbh4AXz5v2IxUREiMDaY4PmaoC6T8a3mm1SXg/Zyyd3hAkCmItBMfwyvJ8U/wRrVodNU3zqIqP4rbZRHVIltRPN8fIuuq+cSw8mXk11vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=D7kYlUxy; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="D7kYlUxy"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ec0d7bbf;
	Wed, 23 Sep 2026 02:51:41 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: amd: acp3x-es83xx: Keep an owned codec device reference
Date: Wed, 23 Sep 2026 02:50:57 +0800
Message-Id: <20260922185057.954150-3-lhfff@tju.edu.cn>
In-Reply-To: <20260922185057.954150-1-lhfff@tju.edu.cn>
References: <20260919121318.1613824-1-lhfff@tju.edu.cn>
 <20260922185057.954150-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ca75a22b03a1kunmdcb19010a00f3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB5JVk5JQh9KTRofTUpOTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=D7kYlUxy19JLfIdlrJwDTTLP6rQ90Ri7e8NYaKF7qmd6+fKubsR+ABr/HW9LKISU7RVA1r8YxLJBHCpyYaq08qRrVSkzHkX1C9BkkN5l2bGZdOz7CvKKJFTDwA3sT20VjYSyGNrg81nrFFEkmwHO8zXzzV/5iu58lqSRCL8Tb14=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=utpaX38nsiRCRhDjukPJzz7j3yLAqdRynwQ+tkqWY+A=;
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
card use, and drops the reference after ASoC card unregister during
successful teardown. The existing OOM put now correctly balances the owned
lookup.

The same filtered KASAN guest with this change reached the same -ENOMEM and
unregister path without KASAN, WARNING, Oops or panic. The test directly
invoked the production callback and did not emulate a complete ACP/ASoC
card or physical Huawei hardware.

Fixes: 54fcd9dd44b2 ("ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec")
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 3a640e652314..eb0e9a6af6ef 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -10,6 +10,7 @@
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include <sound/soc-acpi.h>
+#include <acpi/acpi_bus.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -41,6 +42,11 @@ struct acp3x_es83xx_private {
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
@@ -428,7 +434,7 @@ static int acp3x_es83xx_probe(struct snd_soc_card *card)
 			return -ENXIO;
 		}
 
-		codec_dev = acpi_get_first_physical_node(adev);
+		codec_dev = acpi_bus_get_primary_device(adev);
 		acpi_dev_put(adev);
 		if (!codec_dev) {
 			dev_warn(dev, "Error cannot find codec device, will defer probe\n");
@@ -441,6 +447,12 @@ static int acp3x_es83xx_probe(struct snd_soc_card *card)
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

