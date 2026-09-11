Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC063E5EF2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096291; cv=none; b=f++DJ3A3gQJjLHhY7aphNHOWIYdYn1nAdDV2BzS8UWHMpaPa9pWQTX7tSwKYiFwVszPwP8fBwO5n/lcttkl9Fj5zEjdmsiQANgaHfriCs+FlGBAVRHUoQ6UAsdnp2u2ezuVJ1N48Gb4SBbdg5nToblr950CvjSLKWvIeF+28pQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096291; c=relaxed/simple;
	bh=IsH/uiXS6PCMYKUcTa6HJLyo15+CD5yZpyixAyCfD84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/d9uf/gXdepHacezuHjD2SWiGx7Fs2LPusYlmK3gmEDETtDdCfRiD7+nui7WrEjmaxUQT8C/9gYoJ3Dq/buNgXtlWeVzU6osUBYrKMwCZLDJc00Lz/E06gJ+1OKLBB3qwoLQxdmFhiTo2LeqHUMtbKdcG0p2Wh2tP3kIoYQzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgm6T8Kx; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgm6T8Kx"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9377f717879so32327885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096289; x=1789701089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+7mpvDw1F56ZPu1ONqje79/4zvVptkv9Mg6Nl0mTjo=;
        b=dgm6T8KxbyCxESOM4r/q/CFHYw+ksIcv+MUJ3BZwIginVpvVqLvs+KULqtJcreG2o7
         /UdQXv36CbYJ8MwUmKKUJSOsU35ohzJ5onzRDnK1z6uojOhOWuYal6KhFvSGVIJmMDYn
         Bbapo5gb0sk05iUt/utI5HQO5Ah/vkZDoTsDbljbwMAvM+LZd/AcNcetPwy64WXgZw6z
         5ZjXrDI5fdOSEr2/mr9cvcNuD60AO4QvtDMxBB7fFdWRujCWC0xRJ3277xO+vFK1ciMX
         8KtmCCIcgcP2463cBXEl3ZHoQDutfsAxyFbaU5Vz3lYI/nbyA7Od91GKcmUuagGKfdcl
         3UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096289; x=1789701089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+7mpvDw1F56ZPu1ONqje79/4zvVptkv9Mg6Nl0mTjo=;
        b=UsTXbYOr6YFuknmtcKE+H1pPazlU6YuhtYprkUgaODMAMp/FWXfObyULygi/9G6VrP
         ziciSPChaWPkIgG1jLPauSs59/+YaP69TSLHsqrtsdmrbbQgoTvW41toAd/I1PPOjbPA
         udgqb+ZPpa9kXa25mvpIK50G5a1NwEqnrekXTDeDYUyb8LXb9iAaF5q/pgwzCMt7PPub
         N0c0oXoLQvLQNpx+FAyT1LHY7TnuYPMP12Ne53A/5fLguaFwoZ+1kYhNAtK1/xf/scRU
         Qjwp1kXaokDBFQGPXUBytBGmVWOvMNhe6mdcW+MJmxVR2zjkpu38rz0T/zQYvz1vIOej
         8JSw==
X-Forwarded-Encrypted: i=1; AKwUvByb30JpNc0zusHYm4fDzYx853qO0eDMypv7G9fOQMhvjjPEyVPRXFwSPeOt+T3yd23mKwiYKiXS8vegPo0=@vger.kernel.org
X-Gm-Message-State: AFuF++kGvVB51wMT5rbH5ma8gb4TVDhkXMHtbT+SD73gxcYdhn7IXDQy
	XwC1punqOoFlAaNEKGjivvCcHpkcUc8C+AcCt4Oi4nHkeK8W9z0vh39f
X-Gm-Gg: AYBFou0PB5WJ0il2p9AOm2p+pA3X7oNRiPuW3D3l02bNXrmkD+FheRgV+yuK4IxP3uL
	IgmuudnHagogOysYqO0dC56tWOlMAYzLSlgsxQSE6bWq3X1d/eu5hTYXtsdYfoumpBn1C1cxWuj
	hKwCOG0yNZxMTegVH8kC1omU16iM8alSsosi1a0fOOeextzigvIcFIa4dThqMnRoNLBUxVnbHiG
	LwET/jU3MZ7mw+YcFKWCvEigwD5sU6N7JT7APKMLgLELmE/SNxWwcO1H9UzQqzN7MR/e3zVswb/
	Bjcpo+PjkW1RTnPaPyOTkLtTGSlpDYOkVcw8EmRbKOdszQV4XXQ7yNXOohN14EvAE+nMG6u4p1J
	f/rPiyLEQm9FGm9oXSFEeJur+9GCAPhzRXiGAo59jo7jSeCZ0dmWv0/41zFfylwz/IOjSuSiiX9
	cAXAeDXgfmRC6w9i8whqgTh1Pd1d5OQ2phnENjSN79gE1MUkzWupFjP6gfNVbAYZ5yk0ZYPzqNW
	HpYoWCRzfE/bWIaZg==
X-Received: by 2002:a05:620a:1a08:b0:934:970a:beb2 with SMTP id af79cd13be357-939ea22a13cmr252005985a.26.1789096288727;
        Thu, 10 Sep 2026 20:11:28 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm136878085a.37.2026.09.10.20.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:11:28 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] ALSA: virtio: reset device before deleting virtqueues
Date: Thu, 10 Sep 2026 23:11:21 -0400
Message-ID: <20260911031121.1542502-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtsnd_remove() and virtsnd_freeze() delete the virtqueues before
resetting the device. del_vqs() frees the vring backing, but does not
provide a generic device quiesce operation. In particular, modern
virtio-pci keeps enabled queues active until the device is reset.

Reset the device before deleting the virtqueues so it can no longer
access the vring memory when that memory is released. This also covers
probe failures after DRIVER_OK, which unwind through virtsnd_remove().

Fixes: de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")
Fixes: 575483e90a32 ("ALSA: virtio: introduce device suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 sound/virtio/virtio_card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 647190f4d5afc..6f35276416fed 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -354,8 +354,8 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	if (snd->card)
 		snd_card_free(snd->card);
 
-	vdev->config->del_vqs(vdev);
 	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
 
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
@@ -383,8 +383,8 @@ static int virtsnd_freeze(struct virtio_device *vdev)
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	vdev->config->del_vqs(vdev);
 	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
-- 
2.43.0

