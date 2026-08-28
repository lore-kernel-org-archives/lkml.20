Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41854279F8;
	Fri, 28 Aug 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916870; cv=none; b=l2UGQNBBNVe76CghhSpkGTDcJGwtC/HBtofKBOAk3YiKpHVaQf4hT0ShRaVR4Tx0u5WwvV0VZ+9xwKDoG4uzZZbY46tIsnwnBjNjs3PvJ3YJ07tU1ctCN7lsR8vEfmurTdbw1IXfQV5MAtIMEFXoHq3NQJItwXh+wVh+2ki2m/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916870; c=relaxed/simple;
	bh=ypyGgtp0PyipbVYTmMDjSJugJcff9VErtcOvEOTkrPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2gu3vidaV/FxsG/UavEViugZjC11oPcVBu7FreXD/0BP+3U+heMZG5nzwpe5yvX/xrfXbQCX7iRcFBLfHWJYix7z0H6udpDlALzrDUoSeVP9+6av+BHyPXyMBBnRsYC4fOKdhDyC6ZQkzg6sgGSbcFwnk/0lZJBmFbchUjmHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S6;
	Fri, 28 Aug 2026 19:34:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] ASoC: cs42l42: Propagate system resume restore errors
Date: Fri, 28 Aug 2026 19:33:59 +0800
Message-ID: <20260828113416.47061-5-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyUXF1kCr4DZw1rZr47urg_yoWrXFy3pF
	WkWFWrtr4UJw1xurs5tryDX3WrK34Ika17trWSyas7uwn8GFy5GF43JFyUZFWDJry2kFZr
	Wr47t3y8C345trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUeLvNUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Commit a118fea777a2 ("ASoC: codecs: cs42l42-sdw: Propagate
regcache_sync() errors") makes the SoundWire runtime-resume path return
failures from the LATCH_TO_VP and full cache replay.  The separate
shared system-resume restore helper still ignores the same two
operations and clears suspended.  Both the I2C and SoundWire
system-resume callbacks call this helper.

Make cs42l42_resume_restore() return the first replay error.  Keep
suspended set and restore reset, cache-only state and supplies before
returning the error through both bus callbacks.

The issue was identified via static analysis and manually reviewed.

Fixes: f8593e885400 ("ASoC: cs42l42: Handle system suspend")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/cs42l42-sdw.c |  4 +---
 sound/soc/codecs/cs42l42.c     | 27 ++++++++++++++++++++-------
 sound/soc/codecs/cs42l42.h     |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index b61ca74dcf0b..055c37c08e87 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -514,9 +514,7 @@ static int cs42l42_sdw_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	cs42l42_resume_restore(dev);
-
-	return 0;
+	return cs42l42_resume_restore(dev);
 }
 
 static int cs42l42_sdw_probe(struct sdw_slave *peripheral, const struct sdw_device_id *id)
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index fadf68860601..b6e9b7f53977 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2237,22 +2237,37 @@ int cs42l42_resume(struct device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_resume, "SND_SOC_CS42L42_CORE");
 
-void cs42l42_resume_restore(struct device *dev)
+int cs42l42_resume_restore(struct device *dev)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
 	scoped_guard(mutex, &cs42l42->irq_lock) {
 		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-		regcache_sync(cs42l42->regmap);
+		ret = regcache_sync_region(cs42l42->regmap,
+					   CS42L42_MIC_DET_CTL1,
+					   CS42L42_MIC_DET_CTL1);
+		if (!ret)
+			ret = regcache_sync(cs42l42->regmap);
+
+		if (!ret)
+			cs42l42->suspended = false;
+	}
 
-		cs42l42->suspended = false;
+	if (ret) {
+		regcache_cache_only(cs42l42->regmap, true);
+		gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
+		regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies),
+				       cs42l42->supplies);
+		return ret;
 	}
 
 	dev_dbg(dev, "System resumed\n");
+
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_resume_restore, "SND_SOC_CS42L42_CORE");
 
@@ -2264,9 +2279,7 @@ static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	cs42l42_resume_restore(dev);
-
-	return 0;
+	return cs42l42_resume_restore(dev);
 }
 
 int cs42l42_common_probe(struct cs42l42_private *cs42l42,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 3d85ebc59489..7f17b9f73be6 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -72,7 +72,7 @@ int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream);
 irqreturn_t cs42l42_irq_thread(int irq, void *data);
 int cs42l42_suspend(struct device *dev);
 int cs42l42_resume(struct device *dev);
-void cs42l42_resume_restore(struct device *dev);
+int cs42l42_resume_restore(struct device *dev);
 int cs42l42_common_probe(struct cs42l42_private *cs42l42,
 			 const struct snd_soc_component_driver *component_drv,
 			 struct snd_soc_dai_driver *dai);
-- 
2.43.0

