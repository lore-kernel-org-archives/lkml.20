Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CD253951;
	Sun, 27 Sep 2026 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511446; cv=none; b=JOdF9xLv6I2tce434Aem7ZBXTd5z2K2W2QaI4EexM7n+LZJT0bvo0rkZoSa74DfWTUuupfI9/rs1Gsl9K35+JRmuHPC/0c0imQ5HNFw3+424lPyI066+QYeyD9plg2JCGyBsbYYVuiuf2j5FCz/hj57HaZkBgjktMzp6L+NK/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511446; c=relaxed/simple;
	bh=AX/ZM91BFcVMd5CY4hI27RCqlFArX80vk0q4irK3OB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rw2ZVbBZcBARQ7NMu2l7u5PVmhmQFtLXh+beuoYs7Ukcvv9esKxQQMkFwci7nXNhe7sTmUOu4J00JqUYiyPPlpL1jAJ181+Mcd33gl3d2jDUAuxxoF5fzIymOpUpNx1ZE0MK9RzjZPhsXmk/w0k8EQTasKoT2HPpP2wftrltEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=LAx1bGWt; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="LAx1bGWt"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f3c87f3c;
	Sun, 27 Sep 2026 20:17:15 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: oxygen: use helper to activate the SPDIF PCM control
Date: Sun, 27 Sep 2026 20:17:09 +0800
Message-Id: <20260927121709.742840-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e2cc4d4103a1kunm59a59c561b6ab4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkMYVhhIT01OQktLQkNJGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LAx1bGWtndAn2K5kdy7u+95E7ujDDXRUOyKIuOhvaPATl7TTq6aNTofZfHXkUX7JG4r9rGt521M5W4/ek3ZS8kE+pWGaQM1QTcxy2MnVGBsSf9+L8tqEDyCI5v6d0gjBnph5u3jib7T6ilRzM/42mCY05hQkEzWIEIc5AjpY1sY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=TtvCN9ckUAnBUljenKww0+9IfDhRwP4ovyNfGTvLwzs=;
	h=date:mime-version:subject:message-id:from;

oxygen_open() and oxygen_close() modify the SPDIF PCM control access
flags while holding chip->mutex. Direct access changes bypass the control
core locking and notification path.

Move the access transition outside the driver mutex and use
snd_ctl_activate_id(), which serializes the control update with the control
core.

Fixes: d0ce9946c52e ("[ALSA] add CMI8788 driver")
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 sound/pci/oxygen/oxygen_pcm.c | 37 +++++++++++++++--------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index b71635601..75efbf59a 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -171,16 +171,14 @@ static int oxygen_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 	chip->streams[channel] = substream;
 
-	guard(mutex)(&chip->mutex);
-	chip->pcm_active |= 1 << channel;
-	if (channel == PCM_SPDIF) {
-		chip->spdif_pcm_bits = chip->spdif_bits;
-		chip->controls[CONTROL_SPDIF_PCM]->vd[0].access &=
-			~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE |
-			       SNDRV_CTL_EVENT_MASK_INFO,
-			       &chip->controls[CONTROL_SPDIF_PCM]->id);
+	scoped_guard(mutex, &chip->mutex) {
+		chip->pcm_active |= 1 << channel;
+		if (channel == PCM_SPDIF)
+			chip->spdif_pcm_bits = chip->spdif_bits;
 	}
+	if (channel == PCM_SPDIF)
+		snd_ctl_activate_id(chip->card,
+				    &chip->controls[CONTROL_SPDIF_PCM]->id, 1);
 
 	return 0;
 }
@@ -220,19 +218,16 @@ static int oxygen_close(struct snd_pcm_substream *substream)
 	struct oxygen *chip = snd_pcm_substream_chip(substream);
 	unsigned int channel = oxygen_substream_channel(substream);
 
-	guard(mutex)(&chip->mutex);
-	chip->pcm_active &= ~(1 << channel);
-	if (channel == PCM_SPDIF) {
-		chip->controls[CONTROL_SPDIF_PCM]->vd[0].access |=
-			SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE |
-			       SNDRV_CTL_EVENT_MASK_INFO,
-			       &chip->controls[CONTROL_SPDIF_PCM]->id);
-	}
-	if (channel == PCM_SPDIF || channel == PCM_MULTICH)
-		oxygen_update_spdif_source(chip);
+	scoped_guard(mutex, &chip->mutex) {
+		chip->pcm_active &= ~(1 << channel);
+		if (channel == PCM_SPDIF || channel == PCM_MULTICH)
+			oxygen_update_spdif_source(chip);
 
-	chip->streams[channel] = NULL;
+		chip->streams[channel] = NULL;
+	}
+	if (channel == PCM_SPDIF)
+		snd_ctl_activate_id(chip->card,
+				    &chip->controls[CONTROL_SPDIF_PCM]->id, 0);
 	return 0;
 }
 
-- 
2.34.1
