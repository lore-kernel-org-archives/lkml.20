Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035F1990A7;
	Wed, 26 Aug 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745240; cv=none; b=q49918aRIoJFacNZnBq2zwe6ZXCyyJ1DBOpwU5eBA0JPk1y9XSQKkhNeVPgB/IiB5Zgr70Fp0LdavE67++g+jJ747WRJBxULLVk/6fDzR74eF5loXf7jBqu9qf/76bly7Pa/oXr+Q3+xYyuWVxac1eZbe/q6v5CK9+tdJtgJVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745240; c=relaxed/simple;
	bh=oEnZ8Am8U2+w1Uivf5bMPYLQS2cYsmAH4fIx8UpSk2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a2C8kx55hzNqqYll0d3Ou+AZ1wZnHQY282+3kM6H2E/OsDm8qO+AKA0pJypwoBFnnP6SwOWNoe9zQh7lVKP+FrWJW6AzWUfLQtRBeDcEGmZQ0POZa5X0YY6dp4HANl4uuBiVC8AyezaaXci1NMYmhB3H8EA/xIDRc8ZRvkhlU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cc7cab64a14411f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f2dec469-82de-4d2d-9312-1de37da8be9f,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:73833bb80bfc216a23de1368f34623f5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cc7cab64a14411f19a56ed5b684f684d-20260826
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1342511268; Wed, 26 Aug 2026 19:53:48 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH v3] ALSA: hda/conexant: Always enable the headset-mic pin on plugin
Date: Wed, 26 Aug 2026 19:53:44 +0800
Message-Id: <20260826115344.2128835-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260825023855.394959-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Rename the function to cx_process_headset_detect_plug_type() to reflect
that it only reports the detected plug type, and move the pin control
write into cx_update_headset_mic_vref() so that node 0x19 is always set
to enable the headset mic with the 80% VREF whenever the mic is
present, regardless of the type detection result.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
changes in v2:
  - Optimize code logic and description
changes in v3:
  - Based on the latest code modifications
---
 sound/hda/codecs/conexant.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 8e950c796209..7357dc91ac49 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -207,7 +207,7 @@ static void cx_remove(struct hda_codec *codec)
 	snd_hda_gen_remove(codec);
 }
 
-static void cx_process_headset_plugin(struct hda_codec *codec)
+static void cx_process_headset_detect_plug_type(struct hda_codec *codec)
 {
 	unsigned int val;
 	unsigned int count = 0;
@@ -241,10 +241,12 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
 	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
-	if (!(mic_present & AC_PINSENSE_PRESENCE)) /* mic plugout */
+	if (!(mic_present & AC_PINSENSE_PRESENCE)) { /* mic plugout */
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x20);
-	else
-		cx_process_headset_plugin(codec);
+	} else {
+		cx_process_headset_detect_plug_type(codec);
+		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
+	}
 }
 
 static int cx_suspend(struct hda_codec *codec)
-- 
2.25.1

