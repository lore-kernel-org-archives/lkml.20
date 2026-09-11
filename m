Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D827442135;
	Fri, 11 Sep 2026 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114796; cv=none; b=lfhm9LMThxF63tcfrqpGd0WaQuPG8W2BWtOgtT3FJwiQqbWZqSZXsRAaGTa9Hfe1/v6azXZ+ru3+a1R7HAclUadMLvh3YsBE6BvxV9inP06zdFnFTOjfzHQbvkOWer5ikrQmaCaP1BmM8Zp3t2tfE8UssIgdjMhlLuxg3sb76yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114796; c=relaxed/simple;
	bh=GRDQnpUjXxPLjT5QpjpHN5QG10a1f3qt4k3HZnOD/qg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zi/ZSk3kzwU41FFxtsx/pX2fUZSUpMLMfcJTzi5di+zKbnJFRqe+4xJeHxUEiUZuI26+r3a59BvvA2Rzg42aW7K63qYH5PqgHajnSZu9pnprFuLMK1057lt8WbfM+nFhdQy4EbsySQIq8xtq3YkMf2DXEzn6T5D0z33WPntptxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 876c5c96adb911f19a56ed5b684f684d-20260911
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2407608d-e9c9-4743-83ba-ebcc4f055798,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:39f8d6c9e1b18b1a5d6b7c1ce49a4596,BulkI
	D:nil,BulkQuantity:0,SF:102|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 876c5c96adb911f19a56ed5b684f684d-20260911
X-User: aichao@kylinos.cn
Received: from thinksys.tail1c7620.ts.net [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 306417463; Fri, 11 Sep 2026 16:19:37 +0800
From: Ai Chao <aichao@kylinos.cn>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	tgaraev653@gmail.com,
	ckeepax@opensource.cirrus.com,
	balamurugan.c@intel.com,
	marco.crivellari@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420
Date: Fri, 11 Sep 2026 16:19:32 +0800
Message-Id: <20260911081932.2605407-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI entry for Huawei Matebook B3-420 (BDZ-WXX9) with HEADPHONE_GPIO
and HEADSET_MIC1 quirks.

Similar to Huawei Matebook D (BOD-WXX9).
On the same machine,audio routing between speakers and headphones works
correctly when running Windows with the Huawei audio driver.
However, after reinstalling Linux, both the speakers and headphones output
sound simultaneously,indicating that the amplifier enable GPIOs are not
being toggled correctly to separate the two outputs.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/intel/boards/sof_es8336.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 9b016136c639..f1e62c2e79fe 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -360,6 +360,15 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 		.driver_data = (void *)(SOF_ES8336_HEADPHONE_GPIO |
 					SOC_ES8336_HEADSET_MIC1)
 	},
+	{
+		.callback = sof_es8336_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "NDZ-WXX9"),
+		},
+		.driver_data = (void *)(SOF_ES8336_HEADPHONE_GPIO |
+					SOC_ES8336_HEADSET_MIC1)
+	},
 	{}
 };
 
-- 
2.34.1

