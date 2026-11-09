Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229792;
	b=EXXCkTUIE1SUoEo1blTRGSuMlLhHV/5Re+ApAyPFtyAvgmBMCHqVSQUbqktknk//tLh0
	 hAOQg+MsuHOI0v/HO/Zl/KG/hyE07OJ868KeOU8WSrxunwBKCsol3g7brsbxAzRLH72tF
	 qtXNiLsrjhbBtqVaTgCjdE0xVseY6i+G9sqXSVi42WBKgKkGxKjkqoUngCofvQdVaRejc
	 lU2a2wUCz+hHekK36Q1rul6Oyqmz6V2fSddssigbrY/VUO6UT0uzQqyW9Tyt+NWbwHSNa
	 wHRPtQL4891XBrMsdm+Avmtl33ScMNezgntbDoguXzx4mM7fUvFlDmNv7EX7G6X5VNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229792;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=nV7oXKiV62ZsxjSXaHgOD6Aiu0kDVLv1U4JeSZ3apCY=;
	b=Y8uZJHffy0bodUHVHROCt3tac66i4TfcYWDKJrcNU32gm/E+oNq40Ov1AqKNiWlQAKB7
	 nTt4Md06QD8KOsT8vdQdvd9EYqMxBi3ClRp8e6I5nlDe0ycg8auGH/gff+bXpKoPjjBYR
	 blYRrflVq5fmZa1HV4MSW10uwQUREYe/mIPaOMZJsq9OtXVvm/RviKmwNUEPEcYuVCgm8
	 OHn5b+QxTr5qJcY3mcMsDas9rfUwFL1ACKIJX4owDmv5PuKHN4PS0lJe26YMhTyURtHQc
	 SN/G+LEX0kvXUt29W0ec6h/TfHs+hKf2YoBsq4VHsbGNe2eiCX7g/b35kWxb+lVvukQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BPb1ULkI;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB94D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BPb1ULkI
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54050f341;
	Mon, 9 Nov 2026 21:09:47 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] most: sound: Fix potential use-after-free on channel setup failure
Date: Mon,  9 Nov 2026 21:09:45 +0800
Message-ID: <20261109-21df1234b2-most-sound@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c06dd94e03a1kunm4ada4d9e121489
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUxLVkwaHkIeQksfSk4ZSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BPb1ULkIXz+XgcDacvhiPwDnvfH1cqjwU5L88rMVJ8ADbkLP3Kv5xpDYFdrtRW8tzVvnr/RKdBs/f2bkEp7AkCtxOXNXpYbiTqJjL6ZwiMSzGkc63aiH8keZSeSlKIdM0w+Wrbvy7MqolDZjzKI/5cQ2bLuu/uazljHfjwdGwPc=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=nV7oXKiV62ZsxjSXaHgOD6Aiu0kDVLv1U4JeSZ3apCY=;
	h=date:mime-version:subject:message-id:from;

A failed channel setup releases the whole sound adapter, including
channels already linked to it. Later disconnects then use freed state.
Link the channel after PCM setup succeeds. On failure free the new
channel and release the adapter only if it has no other channels.

This issue was found by our static analysis tool under development.

Fixes: 15600aea2754 ("staging: most: sound: create one sound card w/ multiple PCM devices per MOST device")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/most/most_snd.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/most/most_snd.c b/drivers/most/most_snd.c
index 68b9e6c64033..d4166c743057 100644
--- a/drivers/most/most_snd.c
+++ b/drivers/most/most_snd.c
@@ -584,27 +584,30 @@ static int audio_probe_channel(struct most_interface *iface, int channel_id,
 	channel->iface = iface;
 	channel->id = channel_id;
 	init_waitqueue_head(&channel->playback_waitq);
-	list_add_tail(&channel->list, &adpt->dev_list);
 
 	ret = audio_set_hw_params(&channel->pcm_hardware, ch_num, sample_res,
 				  cfg);
 	if (ret)
-		goto err_free_adpt;
+		goto err_free_channel;
 
 	ret = snd_pcm_new(adpt->card, device_name, adpt->pcm_dev_idx,
 			  playback_count, capture_count, &pcm);
 
 	if (ret < 0)
-		goto err_free_adpt;
+		goto err_free_channel;
 
 	pcm->private_data = channel;
 	strscpy(pcm->name, device_name, sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, direction, &pcm_ops);
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
+	list_add_tail(&channel->list, &adpt->dev_list);
 	return 0;
 
+err_free_channel:
+	kfree(channel);
 err_free_adpt:
-	release_adapter(adpt);
+	if (list_empty(&adpt->dev_list))
+		release_adapter(adpt);
 	return ret;
 }
 
-- 
2.43.0

