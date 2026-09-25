Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61089371D1F;
	Fri, 25 Sep 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347872; cv=none; b=PM9pDTX32WawHTp8GxMji0jX7QgimpqFHQ13CtqkVsE2CBZi9XIRknpI/1zMwAGKPeWh3KbNXWZmgnhT8osg7lHBIT3igRUCu2DhuZ2/MtFJPLgLl30jLTkJsB205aqQfA+nWRI8YRhGDGthd7tUL0y0bIJjm9Yh+Qp9RwldSN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347872; c=relaxed/simple;
	bh=5/cETD4AUSbOPwBJc6bJbP3kzWD7edgVG80VNyhLwbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c/iXGc0uuaxemXbfNTfTCApvtGvs+HHlkjhkL0EeX9uvnT7Go4r1vNljLe29STU/gWl5WsrmkqpCnlYx1160jUBOEmT/SBYMGbozRLZzHCAlwpYphses6a4QMoMXTGXC6jlj6V7QwS1VpnNtD+5QADNg/x22Clu4kQF5tyz1E5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZInp3tJl; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZInp3tJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=U/
	7HHlSk0R6hmilQtIdwxz/aZTSsH7cztqsVWJC1wjQ=; b=ZInp3tJlzYJfAQapsQ
	KvVhpKK8SmhVJh4GMaGgMzXNy9n4C4jhRgl7lqX6xnE57f1R5yGNPp2oQh62jz3T
	xv1Fmz6eSg/IvGA8SBhbLI+1zMDves0tfVFbNwQcmnej7jvcgYOghjPaPtpFIK1E
	mKJ252y1cSLhXdlFlAYADLTCU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S8;
	Fri, 25 Sep 2026 22:50:29 +0800 (CST)
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
Subject: [PATCH 6/6] ASoC: rt722-sdca: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:18 +0800
Message-Id: <20260925145019.2290367-7-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy8Zr4fJr18trWkJFWrXwb_yoW8XFW8p3
	93ury5G34UCr4kAFn0qF10q3WUKwnI93sFyr17Aw4fJa1rGF4jgw4kKF1xuF4UXrW0kF4a
	9F4xXa4fur45WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pib4SwUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xX3Mmq2ijXkiQAA3x

rt722_sdca_sdw_remove() cancels the jack work only when hw_init is true.
rt722_sdca_update_status() clears hw_init when the SoundWire slave
becomes unattached, but jack work may already have been queued by
rt722_sdca_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave delayed work pending after the codec private data has been freed.

The work objects are initialized during probe, so cancel them
unconditionally instead of relying on the mutable hw_init state.

Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 5bc9aed58d14..078255fbe1fc 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -471,10 +471,8 @@ static void rt722_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(&slave->dev);
 
-	if (rt722->hw_init) {
-		cancel_delayed_work_sync(&rt722->jack_detect_work);
-		cancel_delayed_work_sync(&rt722->jack_btn_check_work);
-	}
+	cancel_delayed_work_sync(&rt722->jack_detect_work);
+	cancel_delayed_work_sync(&rt722->jack_btn_check_work);
 
 	if (rt722->first_hw_init)
 		pm_runtime_disable(&slave->dev);
-- 
2.34.1

