Received: from mail-m15591.qiye.163.com (mail-m15591.qiye.163.com [101.71.155.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA103C5540;
	Fri,  4 Sep 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517106; cv=none; b=VCqvjWni+a+7N36kDBU65BUka0oygjFNG0hhfFshm4sOflHLyjghshnlVLCX7FooLPEJaBWqKghM1+UHrSJqHvEc4PSBc0uuUjX9upNSQ/iGDLD03hJNaosfF3hr1/lbBd7ENq8xylzSMhCUUSyR+tldOt4I+U0gq/67WGbYLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517106; c=relaxed/simple;
	bh=ITX64q7TxLg1M8ruo/wTm0clzr6h3tG8AjtyTkUWOCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHEWOsJQ8gJw7OVwa795Igm0icwbsmyOE8TPfeXpsR6rwitis3f1rRCzq1Hu15mocikWCiL7gkGSOHgd9ovQVCc8pLsfj9l1swdmQczIrlTWUrNlpi9lfwQ2mk6yW9kteu6g+Ik88zwfcb5Oghwr61MPxKoE/JBXPhVrnpeDCXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=N3nctIFp; arc=none smtp.client-ip=101.71.155.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="N3nctIFp"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646d3;
	Fri, 4 Sep 2026 18:02:56 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:27 +0800
Subject: [PATCH v3 3/6] ASoC: qcom: common: Add generic headset jack
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-3-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=4469;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=ITX64q7TxLg1M8ruo/wTm0clzr6h3tG8AjtyTkUWOCY=;
 b=7iXZrUxToeSjfc/YDFGJ3/Q2qBK9xm03IMIWKR5TeOYpYET5CT1hj27jroxfM+XxEVGpOjS7u
 27u08EauPtpDbahZBhFYrZfyzzLFoRnk8YXWC3EKTeBB4jJwTLPrsns
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf132109d5kunm6f63729aafb72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEkfVkNISx5KTEtDTk8ZTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=N3nctIFpA0oRtyaFNRDLhsdNnzzHx7YAFfwcZAY5PNA4q6F+Vc80w9O/O/ecHPueO8tff7d8OxYz1gQgEYcTW3CXI5LuoqN980jTnO96FCPbAeoyNfhA6VQdOo3ivaglQNvOfTok1y+PjGPLY85GUaexWRx68XNHH77Um2KAXd0=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=U7e5bACX6Y3RWqCOy398jTMUDaO2guL4ceU7/z30Tmo=;
	h=date:mime-version:subject:message-id:from;

qcom_snd_wcd_jack_setup() combines creation of the card-level headset
jack with the WCD-specific operation of attaching jack detection to
codecs on the TX codec DMA links. External codecs connected over MI2S
also provide component jack detection, but cannot use the WCD-specific
DAI filtering.

Factor the common jack allocation, DAPM pin registration and headset
button mappings into a private initializer. Reuse it from the existing
WCD path and add a generic setup helper which attaches the jack to every
codec component in a runtime.

Treat -ENOTSUPP as a no-op because snd_soc_component_set_jack() uses it
for components which do not provide a set_jack callback.

Add a matching cleanup helper so machine drivers can detach component
jack detection when the DAI link exits. The WCD setup behavior remains
unchanged.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/common.c | 61 ++++++++++++++++++++++++++++++++++++++++++-------
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d9f256d51973..83b745f617a8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -339,13 +339,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 };
 
-int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-			    struct snd_soc_jack *jack, bool *jack_setup)
+static int qcom_snd_headset_jack_init(struct snd_soc_card *card,
+				      struct snd_soc_jack *jack,
+				      bool *jack_setup)
 {
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	int rval, i;
+	int rval;
 
 	if (!*jack_setup) {
 		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
@@ -369,6 +367,55 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 		*jack_setup = true;
 	}
 
+	return 0;
+}
+
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			qcom_snd_headset_jack_cleanup(rtd);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_headset_jack_setup);
+
+void qcom_snd_headset_jack_cleanup(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
+		snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_headset_jack_cleanup);
+
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	rval = qcom_snd_headset_jack_init(card, jack, jack_setup);
+	if (rval)
+		return rval;
+
 	switch (cpu_dai->id) {
 	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
@@ -388,8 +435,6 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	default:
 		break;
 	}
-
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index c1deac109f24..b6204a32bd64 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -24,6 +24,9 @@ int qcom_snd_apply_dai_tdm_slots_cfg(struct snd_soc_pcm_runtime *rtd,
 				     const struct qcom_snd_tdm_slot_cfg *cpu_cfg,
 				     const struct qcom_snd_tdm_slot_cfg *codec_cfg);
 int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd);
+int qcom_snd_headset_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_jack *jack, bool *jack_setup);
+void qcom_snd_headset_jack_cleanup(struct snd_soc_pcm_runtime *rtd);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,

-- 
2.43.0

