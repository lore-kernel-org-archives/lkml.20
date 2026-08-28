Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1543D51E;
	Fri, 28 Aug 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916870; cv=none; b=m97WbrLBNJekTX9szBHwq0Sgfc5TUrPGhPW9V2CT/INQX13Pp6cm/Ga5lLq5k11BeF0RYoELJpUNpdmapILdQ6DzWbYogAhogxGtG+ck9/QYNb4A1EbiRfCCNRFa16VDgwh5iMRG9ZW5b9nDB7eDIWakEE90HT9PUJqbVSXkOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916870; c=relaxed/simple;
	bh=OqpEilYNvuo3aZ2GxWNYOOHybkrMvAzDhsBnTp+ac2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amHhzbTyd/iQJmoRpugoqa+tsDXh0zEkFpClZI2f+/INwOLzAtEeftre5TlMPjiO8zk/0hxGjqFgNaDj3vvKOEtLG7pe1wxolmhrLB9qmo8ozMUYWW+PhWIKJwi4WKimrcKizSW5lyfZ5q4hUkvlNILBIppk8B3tZigdUQj1Y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S9;
	Fri, 28 Aug 2026 19:34:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/20] ASoC: max98088: Propagate cache replay errors from bias restore
Date: Fri, 28 Aug 2026 19:34:02 +0800
Message-ID: <20260828113416.47061-8-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S9
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry3Aw43Ar45XFW8Kw47twb_yoW8Jw15pr
	Z3trZ0vrWrJayUC3W5ta1rWFyfGry3AF4ruayjy3ykZr15Ar12gwn5KryqvF18Xr1DWFsx
	Xr12yayDAFn8KaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
	CI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjBTYUUU
	UUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

max98088_set_bias_level() replays cached registers during the
OFF-to-STANDBY transition but ignores failure and enables additional
power bits.

Return the replay error before those writes and keep the cache dirty for
a later retry.

The issue was identified via static analysis and manually reviewed.

Fixes: e86e1244a413 ("ASoC: Restore MAX98088 CODEC driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/max98088.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index df438baf05dc..b1e7a03f3408 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1323,8 +1323,13 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
-			regcache_sync(max98088->regmap);
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
+			ret = regcache_sync(max98088->regmap);
+			if (ret) {
+				regcache_mark_dirty(max98088->regmap);
+				return ret;
+			}
+		}
 
 		snd_soc_component_update_bits(component, M98088_REG_4C_PWR_EN_IN,
 				   M98088_MBEN, M98088_MBEN);
-- 
2.43.0

