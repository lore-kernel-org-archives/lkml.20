Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF4440622;
	Fri, 28 Aug 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916871; cv=none; b=KNcX7FRmdRii6ktaDZNsOWFyd9gH+S3yOixauLqplsr9+5r/jPwu8nTTj0KlMC+kc8LNWLF7EN6aqC5gOZqSFWh1pEyYnQ84K8XDgb/I2LToVTcupyOZ8d9rkvShmwnF6CqPCOBlTKw6QTjGYXptyChHZN7j/+r3H9w8c8htnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916871; c=relaxed/simple;
	bh=PjafVuArOql+wp1QyYp4+pKTh4ff5ZAuNcrdxvKMMZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI+2HBWTzM0TY6sleb3jItO7UCRuGM2tyP38hNwW0Q9Q8DQt0gSN3LyW5XgFp/Tz8DuxNGcRwaelKDHtUrqKrASqDDAiEl6DE3sEiRi3rHsR+RI9rf0VC4mRvkKvm5LhAjyArU1e7TKpHwlWjZJHjVyFjBJe+1Mc8+7prty7EZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S7;
	Fri, 28 Aug 2026 19:34:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/20] ASoC: es9356: Publish IRQ readiness after cache replay
Date: Fri, 28 Aug 2026 19:34:00 +0800
Message-ID: <20260828113416.47061-6-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S7
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1xKF1UKr1fCF4kuF1kGrg_yoW8Aw4xp3
	yfKFWktrWxWa1SkF15Ar4xJFn3CrWIyFy3A3WYywn2vFs8A3y5JF1rAa4UZF48XrWrWa1a
	qF4DXay8XF1UJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r
	1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUnSdkUUUU
	U
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

es9356_sdca_dev_resume() clears its disable_irq software gate before
waiting for SoundWire initialization and before replaying the register
cache.  If either operation fails, interrupt work can run against a
device that did not finish resume.  The cache replay result itself is
also ignored.

Keep the IRQ gate set until both initialization and regcache_sync()
succeed.  On replay failure, restore cache-only and dirty state and
return the error to device PM.

The issue was identified via static analysis and manually reviewed.

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/es9356.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 80db0f2f4aef..4eb240a0dd16 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1107,9 +1107,6 @@ static int es9356_sdca_dev_resume(struct device *dev)
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 	int ret;
 
-	if (!slave->unattach_request)
-		es9356->disable_irq = false;
-
 	ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
 	if (ret) {
 		sdw_show_ping_status(slave->bus, true);
@@ -1117,7 +1114,16 @@ static int es9356_sdca_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(es9356->regmap, false);
-	regcache_sync(es9356->regmap);
+	ret = regcache_sync(es9356->regmap);
+	if (ret) {
+		regcache_cache_only(es9356->regmap, true);
+		regcache_mark_dirty(es9356->regmap);
+		return ret;
+	}
+
+	if (!slave->unattach_request)
+		scoped_guard(mutex, &es9356->disable_irq_lock)
+			es9356->disable_irq = false;
 	return 0;
 }
 
-- 
2.43.0

