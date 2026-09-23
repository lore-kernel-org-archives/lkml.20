Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36D4071E9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153052; cv=none; b=eYRsV4U1JaycL83h0ja7IZrx+t7aytlC859iJO9cE7kNxuG5PVB2Vi/680gbSo5h6sz3CNIhl66lXv0Qm9NDvmlCkz0AKg5rkq9Bop0gHhAhJI2M8QLa84gnrQfLIzAaCRaCzqqazCHi/+icyOrk+lYGz4B0i1MmvdrpRQcQZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153052; c=relaxed/simple;
	bh=8odcg3H6dhCFDRMQCvgsCqvdtp2JXMTsaTwkxPBWRLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/xJDJzi2FrAWrpHUpniZeDxKRw9FEYSG672GnqjivLQETV5RdSavIAMVarLPhD3tKO5rq4OTOesdZjvZvA3skab02ORY4kcDxYm5uW19eVgKOIlyvhciGQ0XxiZuuwoufc39ZAnOl0SiolrC8U5UtwAoOHycc4f+BPzdgNE6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuO+VMcR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuO+VMcR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so437245a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153049; x=1790757849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=FuO+VMcRUoOqKkLT+zeCzJJa0TnEHdBhupvLmu49DbMMZh3ZYBr5VSR7MxN5oHxAg2
         m5S7TsUQVCWkX/+hjT0+UsmMPbfm1+NV/Ctq1qrkeyZkeyZs8YWWU9gNFLdglfIPKumS
         zt1DCt2obKpk7mGQ4XyDgOaz+kEfVYYiVD3PGyKJNkEUVNgp9kZO692o5aVok6ba9ifK
         bKZ/DKkGmbsBkSkhPFY+FIpuo29r3Hr0bb+g8IYewUVvavDQW1l9x445NjB5oJrUxSpU
         TJ7QHnb1+BS3SysFrjiPmWzvpa59sVFWpcw9lVJ5gSVmVQWxh5YZK4YlvlOFartdV7Un
         mjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153049; x=1790757849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umACWFaazc12UAjleCpDrWJBtxSe0mv/jfhX0ARVviA=;
        b=qlw0Rgj4xbTRNVcrKbsJJ2ZU9MJTvtTEJsSxwybEjWrj8SZUYhrQLrcUV7a06pATFF
         8VCBhv6r2hnV8PDVgTxB4NeMvdOyoD6mg+xNi3XF+k9ESMK88gMpSSOysYbzXD+DfHvR
         3RGLPd1wOEvFVa0NlGgzRItn5CkTx/JIt5oFEPA8jsbtYzWJqZwnZbj4ugWyZoERGMNt
         Ya8lKO6IJgaZxdd6cAM+1G7YJxI7/asBT0CTssxec+XeKe3q5acquqrYYLgK2fpUue77
         8DjZV31sATNV/o3EJO9J6mNCpfRbhuPHWtnDIYP4itBV+RZ/7Kq0iJq5WeTHvJIf/KEy
         /TPw==
X-Forwarded-Encrypted: i=1; AKwUvBxK6s/g6QkHWVXHScxwBbjPlmupn+loWujr8C7qncUS4956/wMJkj8yMcE25loUl/bE7pZElc99v5srj+I=@vger.kernel.org
X-Gm-Message-State: AFuF++ktcRs1n9xnEXQ2p2y6yB4olPlKGqQ/k7B/IQ+FmBOoJdibTgZu
	Kzz+c8nUSVIcsWjOxKh2ElB59Y9ZuweZegOD2mdiIwbLxTkbo3sCRHYd
X-Gm-Gg: AYBFou2AYk08ShKhrCyDIazHs9rG6ZA2YgLNWjjuNrA3YpO801p8v3wXqW1myKqSTHC
	4/5FUDAkkaIiyKzI/FiwfoVJ8CG2gIuTNFIbP6rrxp5VUUB1APODok2ei24UM6cXB9iX6Xr4NVf
	X95eRgF52M5IjV/+Hu+MXEub4t3bagfxaw0MmOJ7Faw+3BhB0/5OurIVDBrhBpTYMa80G+ZaC3H
	7a6yTLVTsrb/AzH29TbHtAyIv+VD06loyKQr7p6mZnAkmHyXGDdX+Hmms4S6hcuiZX9M7Q0Y+EV
	cXvSunGK94et8U5EPD7PaIBzpX+VniQ7wGIbG2AlVOooH0jvfbprd0T3V/Y0Wb+2ozHAYn69qMF
	7FNlk4lbIh7QNBeDKVHfmEENCGpFBVUmaNvpSR8GT8OsHo5sYXWn8cKG9Am3A9BmFrVIfh/l51v
	KE6C4hoW1eBlDCjaPKQhL/0WkY+7/8nPc0AN8EAD3+0j7IBLqCcBf453uxr07iPBwya5lR41pK0
	ult1ryYu0iBKaXAcgxdREw5bBN3xZKCfvsHTa9Ed0HhBV3CPwWWZDfy0Gygkls3qT0pkvrwUlAC
	Jw==
X-Received: by 2002:a17:90b:5825:b0:39e:6c68:c77d with SMTP id 98e67ed59e1d1-3a07e6b5b65mr1774611a91.51.1790153049477;
        Wed, 23 Sep 2026 01:44:09 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a088cf5b02sm1534349a91.14.2026.09.23.01.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:44:08 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: claudiu.beznea@tuxon.dev,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mchp-spdiftx: Fix a deadlock with the interrupt handler
Date: Wed, 23 Sep 2026 16:44:01 +0800
Message-ID: <20260923084401.65336-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mchp_spdiftx_interrupt() is a hardirq handler and takes ctrl->lock to
serialize the user data and channel status updates, while
mchp_spdiftx_trigger() takes the same lock with spin_lock() from process
context.

Interrupts stay enabled while the lock is held in mchp_spdiftx_trigger(), so
if an SPDIFTX interrupt is delivered on the CPU that is inside that critical
section, the hardirq handler spins on a lock that the interrupted code is
holding and can never release.

Take ctrl->lock with spin_lock_irqsave() in mchp_spdiftx_trigger(), like the
other process context users of this lock in the driver already do.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -306,10 +306,11 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 {
 	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	unsigned long flags;
 	int ret;
 
 	/* do not start/stop while channel status or user data is updated */
-	spin_lock(&ctrl->lock);
+	spin_lock_irqsave(&ctrl->lock, flags);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
@@ -335,7 +336,7 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substre
 	default:
 		ret = -EINVAL;
 	}
-	spin_unlock(&ctrl->lock);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
 	if (ret)
 		dev_err(dev->dev, "unable to start/stop TX: %d\n", ret);
 
-- 
2.43.0

