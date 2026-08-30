Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9C218592;
	Sun, 30 Aug 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099521; cv=none; b=vAnrqgw9hMPFBO6OCJAwQU9AWDk8aeTIZ9v1/3XRZuWOILJOUZZ0coATF+POD03KTZfoxKLt+EH1wFSHVkY2Ghaf7jU78gISbz378MTjFpPc6RQt48T63qIXZ4bZRRVYaRw1ukHuWQTvgUuF58WVr+Q4nQ5SWI2q8UU9kMaBmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099521; c=relaxed/simple;
	bh=ABPHStH+QhuUzlxKfOJeUhI0q0fpMI2bZvMLnt+c798=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UV34dOB96nPopOsAZJLTltzlPUuCZK/c9SYAdAv0sug5YzzkXfDeXONh8Cw2msX9BaGapKmWLxgFWUrlpmVfdx1M+JQ3xq96PDJk+Ucw8zUU8kB8lJQmrdNTuA5tOIhqE3x9qQp2pRd1Pm3WyQZTZYoWRNwM1Arj2q14jJ5i3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUC3O5RqK6ebBg--.27828S2;
	Sun, 30 Aug 2026 22:18:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: nau8822: keep regcache offline while supplies are off
Date: Sun, 30 Aug 2026 22:18:28 +0800
Message-ID: <20260830141828.34419-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3AUC3O5RqK6ebBg--.27828S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4UAw18JrW8Gr45Zr17GFg_yoW5XFyrpF
	s5KrZ5ur48uFWrZFyFyF48XF1rKrWFyF4fA3ZrK3yFyw13Ar929rn5KF1jvFZ8JrW8JFsr
	Zr47ZayjgF1rGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

nau8822_suspend() disables all codec supplies and marks the register
cache dirty, but leaves regmap in live I/O mode. Resume then attempts
the cache replay without first leaving a corresponding cache-only state.

Enter cache-only mode after the regulators have been disabled
successfully, leave it after the supplies are restored, and stop the
local resume sequence if cache replay fails. Do not power the codec back
down on a resume error, because deferred component resume remains best
effort and continues after the callback.

regulator_bulk_disable() restores regulators already disabled by the
same bulk operation if a later disable fails. Only publish cache-only
state after the whole power-off operation succeeds, so the regmap state
continues to match the hardware state on either outcome.

Fixes: 1e3cb6c321be ("ASoC: nau8822: new codec driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/nau8822.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 830164e991a79..889c3b5f6d04f 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1059,10 +1059,14 @@ static int nau8822_suspend(struct snd_soc_component *component)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
-	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	ret = regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	if (ret)
+		return ret;
 
+	regcache_cache_only(nau8822->regmap, true);
 	regcache_mark_dirty(nau8822->regmap);
 
 	return 0;
@@ -1072,7 +1076,9 @@ static int nau8822_resume(struct snd_soc_component *component)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int ret = regulator_bulk_enable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	int ret;
+
+	ret = regulator_bulk_enable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
 
 	if (ret) {
 		dev_err(component->dev,
@@ -1082,7 +1088,10 @@ static int nau8822_resume(struct snd_soc_component *component)
 
 	fsleep(100);
 
-	regcache_sync(nau8822->regmap);
+	regcache_cache_only(nau8822->regmap, false);
+	ret = regcache_sync(nau8822->regmap);
+	if (ret)
+		return ret;
 
 	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);

base-commit: 32b4e6b134c62e14291206da331891e99e2fb63d
-- 
2.50.1

