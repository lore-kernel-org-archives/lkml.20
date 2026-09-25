Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4514B488E;
	Fri, 25 Sep 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348043; cv=none; b=ZS4aIlkVGBMXdtZmL9mAMRWg+6/MRGhfiFzkzvR558oq2QgTHsQpVq/lsHhEtaLWwKtn1HCnYdSGkTi4Obh69xG88m+vIAGgONMsa3xY1mtmFS8P+O2JDZDD8TaKTXb4qClrc2VPpeFDgTern564Zc6YdA8R6NcJoPccRorHVdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348043; c=relaxed/simple;
	bh=JyMxU6snONWtt3RhFpbfAUM04pv9R2ebELfpNymy7L4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mbx3n0X8ugtnuTZygq50Bm9IEj67rtA0aQVFRN4aEyS0F9jW59GmRt/w8rHQlSF3ey0mWPcCjm+ye/BqhMgjnfMmPxP8XdxMJ90Fu6H+Q0/snBFMabXFe1HWqBQXZD8rolHkk0PXki4/xImv6fyY8Kvj53tlfEVYjSQD8T/scaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BqxZ2HiG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BqxZ2HiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=g2
	m4iPWcaNoVzycK5u3hyWJISl6pndfOKW8vp8dCRmY=; b=BqxZ2HiGs3CaClH+ny
	ZJnh7p/ptARb42BBbTdlPfy4uCVPL01c4q7ueHIcBfchjacQ/WTQ7RRlbrSKQcHi
	lxdK9ED+PT1wvmGyhodS0C0ZWTQhkO71uIjy0GeD44bh51XiwejfJkzMDiX/7h2E
	awXciyStGMCffjkoDRFo7eH+U=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S3;
	Fri, 25 Sep 2026 22:50:23 +0800 (CST)
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
Subject: [PATCH 1/6] ASoC: rt5682-sdw: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:13 +0800
Message-Id: <20260925145019.2290367-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1xZrykKr1fWrWUCFyUJrb_yoW8GryDp3
	9xWF48GayUJrWkA3Z0qw48JF4akrZ2v347Ar17Ww18J345CF1jgw1xJr4j9FW8XrWv9F17
	XF47Zry5ur45CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pM_M3iUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A-1MGq2ii-q3QAA30

rt5682_sdw_remove() cancels jack_detect_work only when hw_init is true.
rt5682_update_status() clears hw_init when the SoundWire slave becomes
unattached, but jack_detect_work may already have been queued by
rt5682_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave delayed work pending after the codec private data has been freed.

The work object is initialized during probe, so cancel it unconditionally
instead of relying on the mutable hw_init state.

Fixes: ac63716da307 ("ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt5682-sdw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 23c7d2a9dbee..5f2897c58ad7 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -704,8 +704,7 @@ static void rt5682_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
-	if (rt5682->hw_init)
-		cancel_delayed_work_sync(&rt5682->jack_detect_work);
+	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
 	pm_runtime_disable(&slave->dev);
 }
-- 
2.34.1

