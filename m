Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED483E92A9;
	Sun, 13 Sep 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303925; cv=none; b=Yn7c3hhYV0NEfEtEZJkEroAMKin+gJN3xNMM+7etHLOWqSKqSGguoTfFXyy927CY89mkeQVNRpP2hvQwH9KgmfplqkaNxkmvpdPl5ESYrKuKjntBwExSd7NQfkWAAWOIxMrjAbeO63MGM6bjApylq07gQVLW3VnqQF6ogZBcAfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303925; c=relaxed/simple;
	bh=Mc8QK2n+YD8V/JlZeidvLJDV1qOU7sYquPyG57WzL+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rq0/NGTNSWPVRxXourtP/F8pAVQ+Jab4tBlztIE3avRWAuL+8UKjDkDjcstXEbM89W+n1SlERWTA8DwaUVXHn3Pae3tIFMCjwNdMVrleKXXj9dW506JcryMJmaFyRdLns7pzaucIiWLKUmZx2lJ67KYjWhlSf/NyC9UF2qK5G9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=CEsrt+5g; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="CEsrt+5g"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3e7;
	Sun, 13 Sep 2026 20:51:58 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] ALSA: hda: trace PCM open only after assigning a stream
Date: Sun, 13 Sep 2026 20:51:54 +0800
Message-Id: <20260913125154.109944-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad30dc003a1kunmfbd618962511ae
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEJOVkhOHR5NTE1NSkpCSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=CEsrt+5gbdNslcswlidabBByy9QGXP7ed74VNu8OR3oHPaqTzeKgx1UzJnX5xCFUMbEo4qxbD9yqzS3AzvGzS0O8vcwuyCqi0v5SP/ftuPhjBRabqYAY/2aCuRie7POXLVHT+8aF8cl8bkN2xIazQ8X77TydzKaa8K8glFht7A4=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=wG5WWuo5z2kadfPwiUDj9PQrzpUCgd0XF7w3a3hhHOw=;
	h=date:mime-version:subject:message-id:from;

Stream assignment can fail when hardware streams are exhausted.
Move the tracepoint after the NULL check because its payload accesses
the assigned stream tag.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 184865085b88 ("ALSA: hda - rename hda_intel_trace.h to hda_controller_trace.h")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 sound/hda/common/controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index afec5c5546ec..18dae022b324 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -586,11 +586,11 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 	snd_hda_codec_pcm_get(apcm->info);
 	mutex_lock(&chip->open_mutex);
 	azx_dev = azx_assign_device(chip, substream);
-	trace_azx_pcm_open(chip, azx_dev);
 	if (azx_dev == NULL) {
 		err = -EBUSY;
 		goto unlock;
 	}
+	trace_azx_pcm_open(chip, azx_dev);
 	runtime->private_data = azx_dev;
 
 	runtime->hw = azx_pcm_hw;
