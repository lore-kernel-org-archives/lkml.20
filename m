Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55843890EE;
	Fri, 25 Sep 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347873; cv=none; b=h9dSZahc3OCbyP8PUWHFgguuOWEyPIL1iDPmVCZZaKi/TfXQ35t/pG5Tl/6NGJc77eU6SMrF6P2FzrLmb8TwDcd0pDtLqf5KqfSjcYJJ7msqZsR+I+rtC8rF4bOhqSKGGfxCu2c+Tuk12dA5GUswoasLtLp3xUFwUDp8mtfN54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347873; c=relaxed/simple;
	bh=3glyD/rs9I9faSEnZbY6VUtId0ZKNVz7O/xh7a1F7Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fv0Fp2PWUfwXO+bTZc/al7+/pao7qjiml2kP03hU0ag8leSNMr6bv3QGhKeyYRbenHsKxXMR/zKEAHLs7TOn4CMaQ62r3jNCNPF3ySYr3bKdPqSz5jtO657rfdfdkqZuMEAMgUtI5qQ6xUByaNBD1azwlSU6Sz676aUfSJYvzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hNpAiGU4; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hNpAiGU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n/
	C7+YKQ0BWHPbU167gJ/2zn/+ZjYK4gaCPZvCpioME=; b=hNpAiGU48dD/wedI3n
	d9qv2HA4TjOAkHD5HOIqdRtn++0NX5eZKF9ByUo3Qbuht/y5nAmqdm+/dY+LeLIz
	HBP5ymB0+CBfCpx0/YoCRLJyOPzSc2AqrW/2bn2rYWtZ4Ar/jjdUGKth7WVILAvJ
	c87zx80iKxFKfFoIPG/KD1HIQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S7;
	Fri, 25 Sep 2026 22:50:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jack Yu <jack.yu@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 5/6] ASoC: rt721-sdca: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:17 +0800
Message-Id: <20260925145019.2290367-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925145019.2290367-1-yaojiale02@163.com>
References: <20260925145019.2290367-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrWF4xZr1xWw4kuryDZFb_yoW8XFW8p3
	s3ury5Wa4UJr4kAFnxtF48X3W8KwnF9w42yr1xJw4xWws5WF1Uu34rur1xuF4UXFWvkF4a
	qF4xXa4fZr4YkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pijQ6LUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhT3Mmq2ijRI9gAA3D

rt721_sdca_sdw_remove() cancels the jack work only when hw_init is true.
rt721_sdca_update_status() clears hw_init when the SoundWire slave
becomes unattached, but jack work may already have been queued by
rt721_sdca_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave delayed work pending after the codec private data has been freed.

The work objects are initialized during probe, so cancel them
unconditionally instead of relying on the mutable hw_init state.

Fixes: 86ce355c1f9a ("ASoC: rt721-sdca: Add RT721 SDCA driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 910583162d3e..c65e4d1369c9 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -422,10 +422,8 @@ static void rt721_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(&slave->dev);
 
-	if (rt721->hw_init) {
-		cancel_delayed_work_sync(&rt721->jack_detect_work);
-		cancel_delayed_work_sync(&rt721->jack_btn_check_work);
-	}
+	cancel_delayed_work_sync(&rt721->jack_detect_work);
+	cancel_delayed_work_sync(&rt721->jack_btn_check_work);
 
 	if (rt721->first_hw_init)
 		pm_runtime_disable(&slave->dev);
-- 
2.34.1

