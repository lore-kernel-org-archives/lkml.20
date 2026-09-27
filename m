Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667D547062;
	Sun, 27 Sep 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517206; cv=none; b=XIDVzsq5E/cIGmKW3IbZ79FXbV8c65xelupNcqo6TQ8ZfKvEBBIb2f4BdbngFhTyXgVT8k8wqhkfpJLxoSrKi+mvcnRzpsBcx2KTrMl/arQUJziFFQaeUWVmHumTlra0cHc8iKaUgRWxPj6VXe8daxSbLgr3Xaj/wT5wVGz7N7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517206; c=relaxed/simple;
	bh=PEdLkGmGzmkZmUOxVDlg1LzDU+XcMBt+whu+M214eZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YKScpTRJjTmO3aq97CjzgU326y6cnLcBbIQJahd+KjY4A/jelhyiaXIzMGrQgNCFC1jcgmrTcDFAdSVlKdZDY96Mg9HoF21C8uaak00WIAzGyKITdcXJ9Pyko4hs+A5ek+IAHTYtHNjXWe5jux5ukacPVZw5kcjymt/eGBZKnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=bVi84cED; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="bVi84cED"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f3d5f309;
	Sun, 27 Sep 2026 21:53:08 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ymfpci: avoid changing control access under spinlock
Date: Sun, 27 Sep 2026 21:53:01 +0800
Message-Id: <20260927135301.777475-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e324184303a1kunm753548831bafbd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSElNVhpOH0JJSxlDSx9LH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bVi84cEDE97+GqhYabqH/GqfFmfOCi68zFdu3jjfd5m20433li8uw0FQEpOe1KyXYJU2zeCzzVkV1xLHT5/8FZNPBXq2tDE13hZDqKqqgkje3eAfKOeEaXjazWNUC0FetIWetviBaZFCbWXVvfY8CsZY16XdK8v34NkPo3LaTJg=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=oA/XgZoI69gAgyLVWxAdBN+Po2if3pb0qbtkrAEiKY4=;
	h=date:mime-version:subject:message-id:from;

The YMFPCI playback trigger changes a mixer control's access flags while
holding reg_lock. Direct access changes are not serialized with the control
core, and snd_ctl_activate_id() cannot be called under the spinlock because
it may sleep.

Track the desired control state under reg_lock and update it from a work
item. Use a generation counter to serialize prepare with a pending stop.
Cancel the work before the PCM private data is released.

Assisted-by: LLM
Fixes: 177a7cdbd1d8 ("[ALSA] ymfpci: fix volume handling of the 44.1 kHz slot")
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 sound/pci/ymfpci/ymfpci.h      |  4 ++
 sound/pci/ymfpci/ymfpci_main.c | 69 ++++++++++++++++++++++++++--------
 2 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index a408785cf..33c7d4327 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -12,6 +12,7 @@
 #include <sound/ac97_codec.h>
 #include <sound/timer.h>
 #include <linux/gameport.h>
+#include <linux/workqueue.h>
 
 /*
  *  Direct registers
@@ -260,6 +261,9 @@ struct snd_ymfpci_pcm {
 	             output_rear: 1,
 	             swap_rear: 1;
 	unsigned int update_pcm_vol;
+	struct work_struct control_work;
+	unsigned int control_generation;
+	bool control_active;
 	u32 period_size;		/* cached from runtime->period_size */
 	u32 buffer_size;		/* cached from runtime->buffer_size */
 	u32 period_pos;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 2ccb976e6..e5c0fb78e 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -355,12 +355,52 @@ static void snd_ymfpci_pcm_capture_interrupt(struct snd_pcm_substream *substream
 	}
 }
 
+static void snd_ymfpci_pcm_control_work(struct work_struct *work)
+{
+	struct snd_ymfpci_pcm *ypcm = container_of(work, struct snd_ymfpci_pcm,
+							  control_work);
+	struct snd_ymfpci *chip = ypcm->chip;
+	struct snd_kcontrol *kctl;
+	unsigned int generation;
+	bool active;
+
+	kctl = chip->pcm_mixer[ypcm->substream->number].ctl;
+	if (!kctl)
+		return;
+
+	for (;;) {
+		scoped_guard(spinlock_irq, &chip->reg_lock) {
+			active = ypcm->control_active;
+			generation = ypcm->control_generation;
+		}
+		snd_ctl_activate_id(chip->card, &kctl->id, active);
+		scoped_guard(spinlock_irq, &chip->reg_lock) {
+			if (generation == ypcm->control_generation)
+				return;
+		}
+	}
+}
+
+static void snd_ymfpci_pcm_set_control_active(struct snd_ymfpci_pcm *ypcm,
+					      bool active)
+{
+	struct snd_ymfpci *chip = ypcm->chip;
+	struct snd_kcontrol *kctl;
+
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		ypcm->control_active = active;
+		ypcm->control_generation++;
+	}
+	kctl = chip->pcm_mixer[ypcm->substream->number].ctl;
+	if (kctl)
+		snd_ctl_activate_id(chip->card, &kctl->id, active);
+}
+
 static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 				       int cmd)
 {
 	struct snd_ymfpci *chip = snd_pcm_substream_chip(substream);
 	struct snd_ymfpci_pcm *ypcm = substream->runtime->private_data;
-	struct snd_kcontrol *kctl = NULL;
 	int result = 0;
 
 	guard(spinlock)(&chip->reg_lock);
@@ -377,8 +417,9 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		if (substream->pcm == chip->pcm && !ypcm->use_441_slot) {
-			kctl = chip->pcm_mixer[substream->number].ctl;
-			kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
+			ypcm->control_active = false;
+			ypcm->control_generation++;
+			schedule_work(&ypcm->control_work);
 		}
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -391,8 +432,6 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
-	if (kctl)
-		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_INFO, &kctl->id);
 	return result;
 }
 static int snd_ymfpci_capture_trigger(struct snd_pcm_substream *substream,
@@ -636,7 +675,6 @@ static int snd_ymfpci_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_ymfpci *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ymfpci_pcm *ypcm = runtime->private_data;
-	struct snd_kcontrol *kctl;
 	unsigned int nvoice;
 
 	ypcm->period_size = runtime->period_size;
@@ -648,9 +686,7 @@ static int snd_ymfpci_playback_prepare(struct snd_pcm_substream *substream)
 					  substream->pcm == chip->pcm);
 
 	if (substream->pcm == chip->pcm && !ypcm->use_441_slot) {
-		kctl = chip->pcm_mixer[substream->number].ctl;
-		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-		snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_INFO, &kctl->id);
+		snd_ymfpci_pcm_set_control_active(ypcm, true);
 	}
 	return 0;
 }
@@ -843,7 +879,10 @@ static const struct snd_pcm_hardware snd_ymfpci_capture =
 
 static void snd_ymfpci_pcm_free_substream(struct snd_pcm_runtime *runtime)
 {
-	kfree(runtime->private_data);
+	struct snd_ymfpci_pcm *ypcm = runtime->private_data;
+
+	cancel_work_sync(&ypcm->control_work);
+	kfree(ypcm);
 }
 
 static int snd_ymfpci_playback_open_1(struct snd_pcm_substream *substream)
@@ -870,6 +909,7 @@ static int snd_ymfpci_playback_open_1(struct snd_pcm_substream *substream)
 	ypcm->chip = chip;
 	ypcm->type = PLAYBACK_VOICE;
 	ypcm->substream = substream;
+	INIT_WORK(&ypcm->control_work, snd_ymfpci_pcm_control_work);
 	runtime->private_data = ypcm;
 	runtime->private_free = snd_ymfpci_pcm_free_substream;
 	return 0;
@@ -945,9 +985,7 @@ static int snd_ymfpci_playback_spdif_open(struct snd_pcm_substream *substream)
 		chip->spdif_opened++;
 	}
 
-	chip->spdif_pcm_ctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-	snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE |
-		       SNDRV_CTL_EVENT_MASK_INFO, &chip->spdif_pcm_ctl->id);
+	snd_ctl_activate_id(chip->card, &chip->spdif_pcm_ctl->id, 1);
 	return 0;
 }
 
@@ -997,6 +1035,7 @@ static int snd_ymfpci_capture_open(struct snd_pcm_substream *substream,
 	ypcm->type = capture_bank_number + CAPTURE_REC;
 	ypcm->substream = substream;	
 	ypcm->capture_bank_number = capture_bank_number;
+	INIT_WORK(&ypcm->control_work, snd_ymfpci_pcm_control_work);
 	chip->capture_substream[capture_bank_number] = substream;
 	runtime->private_data = ypcm;
 	runtime->private_free = snd_ymfpci_pcm_free_substream;
@@ -1044,9 +1083,7 @@ static int snd_ymfpci_playback_spdif_close(struct snd_pcm_substream *substream)
 				  snd_ymfpci_readw(chip, YDSXGR_SPDIFOUTCTRL) & ~2);
 		snd_ymfpci_writew(chip, YDSXGR_SPDIFOUTSTATUS, chip->spdif_bits);
 	}
-	chip->spdif_pcm_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-	snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE |
-		       SNDRV_CTL_EVENT_MASK_INFO, &chip->spdif_pcm_ctl->id);
+	snd_ctl_activate_id(chip->card, &chip->spdif_pcm_ctl->id, 0);
 	return snd_ymfpci_playback_close_1(substream);
 }
 
-- 
2.34.1
