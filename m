Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D59352036;
	Fri, 25 Sep 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347872; cv=none; b=jBItuiGAF4eAUitmEahvdG9/KSCK1m+Tw+ODILabKKMov6Q1rjcIXoADUL8hd9wkofB8KiShUv2uGMBilp4+vuXvkO6qgJGJ2lnacNNxuEco1OxX+75qspMtBI4q8LUWEJc3ypQeXP5g5squm0kvR492/GGN+1G1o9iyaBwbGz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347872; c=relaxed/simple;
	bh=E7l28uPnQncGCHbVKFMIujZv1MxM3yYBhzbV/PhukDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jKRplRrTbJSE5ubcm5HxZOEgqs769wd2ZHUkL5hu2aIVYs384Mevo00hSKpbFuFTev//GJZW+hnCMXnMIBH+nLqpTK/yUpX6Ix15BkxOB85GCk0kMarLtwqm1f/Xr07DwOD1jFFSoZdv0izMa+EpR3nUD4LjS0G4ofxdgWjRIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JJFpL8cH; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JJFpL8cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HY
	TkJ1v1v44fINwyzlDj+BHqBRxHEC1d0Z+nyLTWFNA=; b=JJFpL8cHzZ8ZJmPX6x
	loNjtkzy8jKlQUhFv47kd+ECBzytd65rRQNnWljnzMGF9QrB/YjchQBD/USDppmT
	ER3mLQqgE58gUF9Wn5cqH/F9UMfz8qXxapSwpjojFuFxtI+oV5d0jWEYSJ+PRCwl
	O4bo3EZCg/sn7K1mhhyKhf/hY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S6;
	Fri, 25 Sep 2026 22:50:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuming Fan <shumingf@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/6] ASoC: rt712-sdca: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:16 +0800
Message-Id: <20260925145019.2290367-5-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4kXr4xtFWxuFW5GF1kuFg_yoW8XFyDp3
	93urW5G3y7Jr4kA3Z8t3W0q3W8KwsI9342yr13Jw4fJw4fGF12gw1kGr18uF4UXFW0kF4a
	vFsrZa4xurWYgaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pijXd8UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRP2MWq2ijNhBwAA3a

rt712_sdca_sdw_remove() cancels the jack work only when hw_init is true.
rt712_sdca_update_status() clears hw_init when the SoundWire slave
becomes unattached, but jack work may already have been queued by
rt712_sdca_interrupt_callback() or the jack initialization path.

A remove after that status update can therefore skip the cancellation and
leave delayed work pending after the codec private data has been freed.

The work objects are initialized during probe, so cancel them
unconditionally instead of relying on the mutable hw_init state.

Fixes: 6c39710da75c ("ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp topology")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index edba0367d9ce..a9d4e0795175 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -386,10 +386,8 @@ static void rt712_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
 
-	if (rt712->hw_init) {
-		cancel_delayed_work_sync(&rt712->jack_detect_work);
-		cancel_delayed_work_sync(&rt712->jack_btn_check_work);
-	}
+	cancel_delayed_work_sync(&rt712->jack_detect_work);
+	cancel_delayed_work_sync(&rt712->jack_btn_check_work);
 
 	pm_runtime_disable(&slave->dev);
 
-- 
2.34.1

