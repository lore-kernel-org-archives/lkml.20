Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B534B1B56;
	Fri, 25 Sep 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347884; cv=none; b=qr6D5CxAZtzZYWIg2i17LkdO6g5kmnBNwRUaslVwy3ULJUHakFJJEWY9hi9JT0YIm1PhhVWsgPPJSqGgt4zK66GZiN6JL7U8xWzoNpjVP0kkwfeQldKstzV/HjFLduwVT9WoNoxgTl4BDPhETEkPCfx5umTSL+7lzHtSstXuadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347884; c=relaxed/simple;
	bh=7VtdIUvFjQtv6rHMn8AAFVZolCkLI6PZ2hiQVzAwqp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GV5ATIzj4HJKXiTOO18aTbjGNE7SWuNZH2TK4DCdpNDU296gS8nBg00xoEm0YXw1Gw9v1hmSJ/MFFXkCL5mWdlt5742MPD1Iy8FeonojEPVkE4vrY2lw9+kCc16d7smO5aq/z3hfpIKX8Q3Plb0NRg/5wtlqDB68yjtDgfdaGdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WJ/jcgBH; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WJ/jcgBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ca
	1icOu94NlzBvdcVGHCuMhUiVllPo7UMM9qGGEn2D4=; b=WJ/jcgBH8uw+1jwvU6
	f0EUwX66jgaXxb5k+qXcEnJxUK+MiCW3eewUvKcAafsdqn9aYRTV0N4I30HYxZ3U
	wdTmlEMvAPrOzM7vEIbEzFkuRS3xlyl247HduzKdQyHv9t4tmUgxjx4vEgZu4xyC
	GHhHEzfXk4EYMliwT7NdpWcVk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S5;
	Fri, 25 Sep 2026 22:50:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/6] ASoC: rt711-sdca: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:15 +0800
Message-Id: <20260925145019.2290367-4-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrWF4xZr1xWw4kuryDZFb_yoW8XFW5p3
	93ZFWrW347Jrs7A3Z0qa10qF18KwnI9342yr1Sgw4xJw4fGF1qgw18Gr1xuF47XrW0kF42
	vFs7Xa4fZr45KaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5rchUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRL2MWq2ijJg+QAA3l

rt711_sdca_sdw_remove() cancels the jack work only when hw_init is true.
rt711_sdca_update_status() clears hw_init when the SoundWire slave
becomes unattached, but jack work may already have been queued by
rt711_sdca_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave delayed work pending after the codec private data has been freed.

The work objects are initialized during probe, so cancel them
unconditionally instead of relying on the mutable hw_init state.

Fixes: ac63716da307 ("ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index e292b28b029e..f74b193c720d 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -369,10 +369,8 @@ static void rt711_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	if (rt711->hw_init) {
-		cancel_delayed_work_sync(&rt711->jack_detect_work);
-		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
-	}
+	cancel_delayed_work_sync(&rt711->jack_detect_work);
+	cancel_delayed_work_sync(&rt711->jack_btn_check_work);
 
 	pm_runtime_disable(&slave->dev);
 
-- 
2.34.1

