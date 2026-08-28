Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8943F4BD;
	Fri, 28 Aug 2026 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916874; cv=none; b=Sa17boIqWQw6FaPvg3zzGQDAZZQhTlz1ITSkV/ms08DCfHS1o9KqXh92QPZpP5qf5gDF9RYlvpA45uLNbl9Bsbm8cdntZpMNhH3gzRVXD2o/ekTRLq5mJtdZDWQLFxQjG3iTIg4xGHg8ymF1ICdWox58yMXWzm40tF1Ymj9xgpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916874; c=relaxed/simple;
	bh=kJmO+904oM1JMka/WNZAwkM6QbavByZxLOuHb/DqlLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edznappuV5QGvqu77BH4vC72z/fmbEKJ2AanHFSE2rk0UYABbmUJOqt4a46Q9IopYorAsTFF2EiEUhodOdlSIARihTO/wRjrtcj06LoPPqfYtkAtsYVNcsAsnGtHF62xhD2UpADRtX5BFUTKIg+mWlTCPULChpd7uZZltcjgy2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S18;
	Fri, 28 Aug 2026 19:34:21 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/20] ASoC: wm8991: Propagate cache replay errors from bias restore
Date: Fri, 28 Aug 2026 19:34:11 +0800
Message-ID: <20260828113416.47061-17-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S18
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW7Ary5WF15Jry8Ar17GFg_yoW8XFWkpF
	Z3W398trsYqr4Fvas0yrWrZry8GryxCF1rAa12y340vr13AF1SgF1xtr42vF95XFZ8GFsx
	ZrWavay8JF1rGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUaZX7U
	UUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wm8991_set_bias_level() ignores regcache_sync() and proceeds with a long
anti-pop sequence during OFF-to-STANDBY.

Return the cache error before that sequence and keep the cache dirty for
a retry.

The issue was identified via static analysis and manually reviewed.

Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8991.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 225c235d3d89..ce66bd3ba7af 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1083,6 +1083,7 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 	struct wm8991_priv *wm8991 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 val;
+	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1097,7 +1098,11 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
-			regcache_sync(wm8991->regmap);
+			ret = regcache_sync(wm8991->regmap);
+			if (ret) {
+				regcache_mark_dirty(wm8991->regmap);
+				return ret;
+			}
 			/* Enable all output discharge bits */
 			snd_soc_component_write(component, WM8991_ANTIPOP1, WM8991_DIS_LLINE |
 				      WM8991_DIS_RLINE | WM8991_DIS_OUT3 |
-- 
2.43.0

