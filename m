Received: from mail-m3278.qiye.163.com (mail-m3278.qiye.163.com [220.197.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB93F8EB3;
	Fri,  4 Sep 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517121; cv=none; b=iIz41t8wCTPOSgE1CQ517wWF9TnJTplmdHqe+NvF8kG66O97iWHE+VQtW9CNCjVkJT6FUb9qoQjNkH8w/vSrefcDzvuVqgHwvWYntNzeDfTpItkf9xCR0aW1SSLISLOayFE//3gXHBSZNSm5OGF3gpF1qdXD7LjyYZCkqMW/+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517121; c=relaxed/simple;
	bh=uU45ngtFZM7M60giThROBp1vWuJIs8ZAf1FGc1ApM0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TktqgZRHbYT639pl1luJcJrKzLjA1r7NEhm2mqZHIzNML0XFTK+QEh5frPt7oUF300q3PX4IyVXElHOlzChqgspRD+6bcMPbUcho28DqZadNqh100UY1xg2ZuZBfRL9hwyKtpghmoaWVUZLdV8m/eC0hnVDoe2c0nt8phKzJONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=k0dbijPg; arc=none smtp.client-ip=220.197.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="k0dbijPg"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646e4;
	Fri, 4 Sep 2026 18:03:00 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:29 +0800
Subject: [PATCH v3 5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-5-f49146d85af3@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=2525;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=uU45ngtFZM7M60giThROBp1vWuJIs8ZAf1FGc1ApM0E=;
 b=VmgUWEvr2lsBrl6YyvzwcFl+ZfZRCIbZxWF0UmLdulwzX3rq5lIceyriQ0RaVchgjdkm92AgJ
 ZjGQbDDF9CACAhBlIPv+A6aHBrxqDsPejoDrNv+SUW+X7RH3lJB00i2
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf235f09d5kunm6f63729aafb94
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSEMdVk9KQ0oeT0oZTEMeTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=k0dbijPgSWPJI9marrp8uVSZKPy3eq1JS9P9CS/9mtTpvDaECP6Nn3W+qhiYNtnW6BFA8iFWfgDz/jQ1b1byKNKe+LqQuifYH1MmB3FEu0+8wOp6xpTphPLMxksQHihbZgDtoWa4TTy/rMqNDqSFISxL+Dlv+gWc++H51qQ6R00=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=HW5Z3J523FbzqVUD8ZxicdUroFUkrS81sJizOzooGNQ=;
	h=date:mime-version:subject:message-id:from;

RubikPi 3 connects an ES8316 codec to primary MI2S for headset playback
and capture, and an LT9611 bridge to quaternary MI2S for HDMI audio.

Add per-DAI data for the primary playback and capture links. Configure
the codecs for I2S with normal clock polarity and as bit and frame clock
consumers. Program the primary MI2S BCLK, configure the ES8316 for its
fixed 19.2 MHz MCLK and enable component jack detection on the playback
link.

The HDMI link inherits the card-wide I2S format but does not request
codec sysclk programming because the LT9611 codec DAI does not implement
set_sysclk().

Select this configuration through the RubikPi 3 sound-card compatible.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 368a54c2cdf8..73009f9bb8e4 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -577,6 +577,28 @@ static const struct qcom_snd_soc_common qcs6490_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common rubikpi3_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_BC_FC,
+	SC8280XP_DAI_DATA({
+			.id = PRIMARY_MI2S_RX,
+			.mclk_rate = 19200000,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
+		}, {
+			.id = PRIMARY_MI2S_TX,
+			.mclk_rate = 19200000,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common qcs8275_priv_data = {
 	.driver_name = "qcs8300",
 	.dapm_widgets = max98090_dapm_widgets,
@@ -656,6 +678,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
+	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
 	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },

-- 
2.43.0

