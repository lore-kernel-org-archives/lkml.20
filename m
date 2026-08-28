Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040C43F4CD;
	Fri, 28 Aug 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916873; cv=none; b=If80fXaBiTgH33ZylWt1P3E/J7VRuU9W2nIVLgFVaIjS5X976SiSLxpQxJJjCqnws6tCqJNmIXmenQ44lDwEWqT9bZy3v48bDVYIXIMk1dJsO/UALo4X7HMaZzr+DZFALO1s8KMULo/G8YvMH9Cbb2B5Ol1KAkydGGyuWgbJW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916873; c=relaxed/simple;
	bh=1AVULoQ2lb9e31EADF6ITc3u2ggWbxrCuhRX/qsBKfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdmhqTdg0bSqzpoNlKncMo61BkKNob2HrBEFAs52FcJfAdVaE+BOj/eYRSVpmgM/2Yok+aJQE4QUQSpKnoAJFtFmrncLBL5XQXZ4dVO2oabMB20UfMAPObbGdufyWIfF51K2TGeDhqW/5PL6z5IKRtya0ruGRkwzCgeYYCDGWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S11;
	Fri, 28 Aug 2026 19:34:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/20] ASoC: ssm4567: Unwind failed power restoration
Date: Fri, 28 Aug 2026 19:34:04 +0800
Message-ID: <20260828113416.47061-10-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S11
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15uw1Uur1xtFyDCw4xXrb_yoW8Xr15pr
	ZxuF1vgrs7Zw4I9F4aqF4UJanYkryxAFnxCa1jqw18ZrnIkrnrKr45GF4kZFZ0grs7JF4a
	vr43Ja48CFn8C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtV
	W8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhNVPU
	UUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ssm4567_set_power() leaves the regmap live when soft reset or the
power-register update fails, and ignores the following cache replay
result.

Handle all three failures through one path that restores cache-only and
dirty state before returning the error to the DAPM bias caller.

The issue was identified via static analysis and manually reviewed.

Fixes: 1ee44ce03011 ("ASoC: ssm4567: Add driver for Analog Devices SSM4567 amplifier")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/ssm4567.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 8415dd163edd..2783bff77c72 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -354,14 +354,25 @@ static int ssm4567_set_power(struct ssm4567 *ssm4567, bool enable)
 		ret = regmap_write(ssm4567->regmap, SSM4567_REG_SOFT_RESET,
 			0x00);
 		if (ret)
-			return ret;
+			goto err_power_off;
 
 		ret = regmap_update_bits(ssm4567->regmap,
 			SSM4567_REG_POWER_CTRL,
 			SSM4567_POWER_SPWDN, 0x00);
-		regcache_sync(ssm4567->regmap);
+		if (ret)
+			goto err_power_off;
+
+		ret = regcache_sync(ssm4567->regmap);
+		if (ret)
+			goto err_power_off;
 	}
 
+	return ret;
+
+err_power_off:
+	regcache_cache_only(ssm4567->regmap, true);
+	regcache_mark_dirty(ssm4567->regmap);
+
 	return ret;
 }
 
-- 
2.43.0

