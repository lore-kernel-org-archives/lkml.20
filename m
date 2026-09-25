Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63C388E6E;
	Fri, 25 Sep 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347876; cv=none; b=clwquCSQFKLxNoTtTmy5Co3KdDKkMSm8hAEk4p8c83u/H4dc44FjnxiHl7+yYbqlIjPuT25LpWo+rdWhBdkA749rB6wy54fvzj/1nPetChlkOMDcOGoz9kJdkJegQTDyg2rH7Sn0gXcryvqS7jw4/B4oJwvuwk/o/rXeNW7aCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347876; c=relaxed/simple;
	bh=xLcaKk6dbpZw5O0hRVC7YVpWiuFvw6u7oujYCkwoQvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtLohFi7P9kSKt6oOoX4ZsB1Yrs943VrFIEUvPXNaEhRtm5k0zL6ViTozdPDs47v0YpI9Tmh6FkfDm0uIDT5M3pwr2zwNdjcnrytTYryspQXpif39XvEXZgnI+Ji3koLMc0H6DkC/bdZtW27shGHzOWua9pPsrIgcmenCF85TS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bbGyfwVP; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bbGyfwVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=K/
	du7OTEUfgdK3v4q6qbOfc+DSD6Ntjya+pVPffKdPY=; b=bbGyfwVPB82wRsboJ9
	xtg3n1xhmT7JTWji2HCgyGvgVF7toa0zuGyPAt4gKY5eAFKmq7ZRv5nzORce4c3J
	ntNi+bzr2+hOFnesw1NZhdJ3C6lUVQRpsgFRqULJwG0j9xOlFN37eTJWpwU5309C
	sr2HBGWshxiRwzAtjtSdYNXdg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S4;
	Fri, 25 Sep 2026 22:50:24 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/6] ASoC: rt711-sdw: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:14 +0800
Message-Id: <20260925145019.2290367-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrWF4xCw4xXF4xAF1fJFb_yoW8Wr4xp3
	s3ZFWrWay2yr4xAF1qqa10qF10kwn29ayqyr4fGw47Gw4fGF1qgw18CF1I9F4xXrWvkF4a
	vFs5X3sxZr15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pK-eoAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhD2MWq2ijBIwAAA33

rt711_sdw_remove() cancels the jack and calibration work only when
hw_init is true. rt711_update_status() clears hw_init when the SoundWire
slave becomes unattached, but work may already have been queued by
rt711_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave work pending after the codec private data has been freed.

The work objects are initialized during probe, so cancel them
unconditionally instead of relying on the mutable hw_init state.

Fixes: ac63716da307 ("ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt711-sdw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 4ad2b1da1954..798d181d5c90 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -461,11 +461,9 @@ static void rt711_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	if (rt711->hw_init) {
-		cancel_delayed_work_sync(&rt711->jack_detect_work);
-		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
-		cancel_work_sync(&rt711->calibration_work);
-	}
+	cancel_delayed_work_sync(&rt711->jack_detect_work);
+	cancel_delayed_work_sync(&rt711->jack_btn_check_work);
+	cancel_work_sync(&rt711->calibration_work);
 
 	pm_runtime_disable(&slave->dev);
 
-- 
2.34.1

