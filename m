Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B9448BB7;
	Fri, 28 Aug 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917214; cv=none; b=Wl9Jf/POA85hflq0/4E9HW8q0AeG0vaw65Eg+obB3cS7uU8QAVsJFr6UVwcH9ntkJReHOPaQHI7+k1CXNAqh663Bs7MTgNOTFWqu1iNMDxmr+tFRZOeLXnlcWpYcHlruergDhcykzDJb7rQC79CXjSgNrT/ZpgLykJ13bs/4b88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917214; c=relaxed/simple;
	bh=YtaIj7j6uklHV3bsU5JR56b9uu1S94tIVVqnBv3DlJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqVIAFANMfpFIyOVEc6Ndc+MQAaZBWZwuh2vHaPto/NJ4VxhH5T4d03KNsJBpVV8bwAU3248/1HofuBQVCdMMb1fjNFLXon8Lnxf3E4MysFjqGKNOuQcuNPZXFEvEJsd8tt+YvMdoc9oqg7zA+Os3jDCmF9Mjm2eonLO8rJpI34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S19;
	Fri, 28 Aug 2026 19:34:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/20] ASoC: wm8993: Unwind supplies on cache replay failure
Date: Fri, 28 Aug 2026 19:34:12 +0800
Message-ID: <20260828113416.47061-18-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S19
X-Coremail-Antispam: 1UD129KBjvJXoW7JF45Cr18CFy7uFWxXw4Utwb_yoW8JF4Upr
	93WrZ8trWkXr4rAFZ8tr1rZa4rKrWqk3W3C342yw1vv3s8A3W7Wrn5tr40vFyUXrWDGFsr
	ZFy7Aay8CF13tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

wm8993_set_bias_level() enables supplies, makes the regmap live and
ignores regcache_sync() before VMID programming.

Return the cache error after restoring cache-only and dirty state and
disabling the supplies acquired for the failed transition.

The issue was identified via static analysis and manually reviewed.

Fixes: cf56f62746c3 ("ASoC: Disable WM8993 regulators when turning bias off")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8993.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 2a94b23319b5..5f7ecee6ea0f 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -996,7 +996,14 @@ static int wm8993_set_bias_level(struct snd_soc_component *component,
 				return ret;
 
 			regcache_cache_only(wm8993->regmap, false);
-			regcache_sync(wm8993->regmap);
+			ret = regcache_sync(wm8993->regmap);
+			if (ret) {
+				regcache_cache_only(wm8993->regmap, true);
+				regcache_mark_dirty(wm8993->regmap);
+				regulator_bulk_disable(ARRAY_SIZE(wm8993->supplies),
+						       wm8993->supplies);
+				return ret;
+			}
 
 			wm_hubs_vmid_ena(component);
 
-- 
2.43.0

