Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926831;
	b=o7CY7M8pvOXz27EDxljfrXI2NBjMQOw71bBujDlWMWIO1/HzYuCBbNYwIrhn2/7VszYm
	 xysdOY4zXXDTcsxA+0bXcQ3I4s5g4jMTXn62682tF/mr85x+8pQBKcvvpgef/cUpyxgam
	 jcQLMPaVhEWSG7ipT+Q7cmLaABGO4icdEhaARoqwgWjawSlG/GaPETPqkC64N9s0zxQ04
	 t0DmUcOFIKzqQKN3BEdE60O/+lp6cDbCG+6gZJmqqnT57qkCBgINNMcmikxg+B4/kEJbj
	 UfD1WD9DVuRWae43Mm2QlsWu27i1lTFbU9SEnANGRMrB1ynb9GMa4jhFCnK3s6wC3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926831;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=h+xz3GMcqW/m1kBN+Qe+3pRTeww9ZYGHWYtMSX9E5aY=;
	b=FCJOu9ycayD0onN1FfDoG2aSlyUP+ef+IYEBIYmPmAs5s3BvcQ+E+R3O2dEArpALQ9+/
	 0j0yemfXjZeuBbjuCKLPPrZN6LmAg7nhKyXk+PbxuuoN6vOhT1V7couV8vduaT2G7KnS6
	 Ls15KtR887LhgiOmyz9JGYmv4d0+IP54mQSRXJMdUpqMd1FeUvPcVoIbSdZQzCQXjOwaU
	 w+MAtPYmKURJR7iTF4SE0ck2dMPM6G0Rkig+/pY8lHnmz1Jz8Xdk8sC+yDreCzEc8eGsv
	 M+6IRTY4mf1/WJJIJbFo4Q0IgPwB5fbkCccMmDG4G5QbPYSbh2xPsB7O4xdFYunwrcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HXDZpyGI;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DA606A31C;
	Tue, 17 Nov 2026 14:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 331DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HXDZpyGI
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e7b4;
	Tue, 17 Nov 2026 22:47:06 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Fix potential device leak on partial registration failure
Date: Tue, 17 Nov 2026 22:47:05 +0800
Message-ID: <20261117-571e631490-alsa-pcm-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa1e9f9d39803a1kunmdfa31a2d15633b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUwfVk5MH01LH01OSEJJHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=HXDZpyGIIfMHy/AtezU1zXl4UBZo2IjUCr0EXgC0qS6J9ugTKc/ApBjDrCyrSVexR+KWPCvFgWu/wyBpDebov00p7k4L5lFzb0KF05yBTzHXpGFPTbDP1uAu4tJDI1jE38R8R0HS/k7jY8rF1q5Ba35D6jEqNXzz2STjkbV7HfM=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=h+xz3GMcqW/m1kBN+Qe+3pRTeww9ZYGHWYtMSX9E5aY=;
	h=date:mime-version:subject:message-id:from;

If capture registration fails after playback was registered, the PCM
remains in the BUILD state. Card teardown therefore skips its disconnect
callback, leaving the playback device registered and holding its parent
card reference.

Unregister previously registered streams and release their timers before
returning the registration error.

This issue was found by our static analysis tool under development.

Fixes: ef46c7af93f9 ("ALSA: pcm: Embed struct device")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 sound/core/pcm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..7343b366986c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1080,16 +1080,26 @@ static int snd_pcm_dev_register(struct snd_device *device)
 		err = snd_register_device(devtype, pcm->card, pcm->device,
 					  &snd_pcm_f_ops[cidx], pcm,
 					  pcm->streams[cidx].dev);
-		if (err < 0) {
-			list_del_init(&pcm->list);
-			return err;
-		}
+		if (err < 0)
+			goto error;
 
 		for (substream = pcm->streams[cidx].substream; substream; substream = substream->next)
 			snd_pcm_timer_init(substream);
 	}
 
 	pcm_call_notify(pcm, n_register);
+	return 0;
+
+error:
+	while (--cidx >= 0) {
+		if (!pcm->streams[cidx].substream)
+			continue;
+		snd_unregister_device(pcm->streams[cidx].dev);
+		for (substream = pcm->streams[cidx].substream; substream;
+		     substream = substream->next)
+			snd_pcm_timer_done(substream);
+	}
+	list_del_init(&pcm->list);
 	return err;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

