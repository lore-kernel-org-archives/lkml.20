Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFABC33ADBF;
	Wed,  2 Sep 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333659; cv=none; b=tIBdbpV5rBkGIJ2Js2j9CMPHLDgtthh1fPCvpksMKr7fp05+0euU0COsKP7qyUlTEzfNu0FgQP5y01BS/eod8czeqKjpAb9d1sQIdn2zT0RlN95gy8YZ8pfvMVCH2cf5Wr0uD/HRk7xXsI9GF9x5WotG0HKufmHG12RbnM/mV34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333659; c=relaxed/simple;
	bh=gVtQAnMg281lPBWARs+MY44kidZPkrH0GbnrcjoiJIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nec3cTkmuuXoyjd6muLD297IifeC4WJmrgjMeGs0Gqt2Z3J1e88OTNFL7gRE3AXXIeXq+YcqUqXk3vjl/BZqNHB64rm/LHWA70Y4vJL2dE6aoa1aGje7NI4xHL6JvCg0idM3lAQQh6HCnkvhD3YvSQTfBSWNSrgSMH3dKccpeC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U1ftDHla; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U1ftDHla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gV
	mGjSWjpDGmwlbzSXp6NqblhiPKagQEa5tD4b+1e5w=; b=U1ftDHlaIa/k2FrOho
	ggJcpmuY9Zst2vfGX07w5LeudPoeYcNx7GfNzmm1ZjVfmwVMwvUximoQPyQ/jssC
	F3XiGI/fz0IV5XFPuakwwPDA9X6XK2HVO3iXXH0Egkn6OJtd8EY4+Q7Z9W914DPq
	33i+07AkuT97/bR17K5YkB9Ug=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBnP6UuzpdqMkg2NQ--.54267S3;
	Wed, 02 Sep 2026 15:20:17 +0800 (CST)
From: wangdich9700@163.com
To: srini@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 1/3] ASoC: qcom: fix assorted whitespace issues
Date: Wed,  2 Sep 2026 15:19:41 +0800
Message-Id: <20260902071943.522194-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902071943.522194-1-wangdich9700@163.com>
References: <20260902071943.522194-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBnP6UuzpdqMkg2NQ--.54267S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15Jw17Kw1UtF1kuw4kZwb_yoW5ur1Up3
	Wku3ykWFyfAF4xAw1DKr18Xa4Ut3yruFZxCr4kZ34UAr1DJr1vga17tF109FWFgry0gF9x
	XFZIq3s8JFn3WrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE18BUUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6BFAj2qXzjGrDwAA3Q

From: wangdicheng <wangdicheng@kylinos.cn>

Fix stray double spaces and blank lines across the qcom ASoC driver.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/qcom/common.c         | 1 -
 sound/soc/qcom/lpass-cdc-dma.c  | 2 +-
 sound/soc/qcom/lpass-cpu.c      | 2 +-
 sound/soc/qcom/lpass-hdmi.c     | 1 -
 sound/soc/qcom/lpass-platform.c | 2 +-
 sound/soc/qcom/sdw.c            | 3 +--
 6 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d9f256d51973..5e1ee8466901 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -389,7 +389,6 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 		break;
 	}
 
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 2dc8c75c4bf0..5be13dd59517 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -111,7 +111,7 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 		ret = LPASS_CDC_DMA_INTERFACE9;
 		break;
 	case LPASS_CDC_DMA_RX9:
-		ret  = LPASS_CDC_DMA_INTERFACE10;
+		ret = LPASS_CDC_DMA_INTERFACE10;
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..4f8017357aa4 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -468,7 +468,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 	int ret = -EINVAL;
 	int i;
 
-	for (i = 0; i  < variant->num_dai; i++) {
+	for (i = 0; i < variant->num_dai; i++) {
 		if (variant->dai_driver[i].id == id) {
 			*dai_name = variant->dai_driver[i].name;
 			ret = 0;
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 6d9795306cfa..8bbe43facdc1 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -5,7 +5,6 @@
  * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
  */
 
-
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index e162627d6f86..b335b2c8bb16 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -19,7 +19,7 @@
 
 #define DRV_NAME "lpass-platform"
 
-#define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
+#define LPASS_PLATFORM_BUFFER_SIZE	(24 * 2 * 1024)
 #define LPASS_PLATFORM_PERIODS		2
 #define LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 * 1024)
 #define LPASS_VA_CDC_DMA_LPM_BUFF_SIZE (12 * 1024)
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..981884927e30 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -131,7 +131,6 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
@@ -159,7 +158,7 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 		sdw_deprepare_stream(sruntime);
 		return ret;
 	}
-	*stream_prepared  = true;
+	*stream_prepared = true;
 
 	return ret;
 }
-- 
2.25.1

