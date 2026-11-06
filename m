Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998551;
	b=kFabBeXN67cdRQVjxkpwAIsh8ReHgncpuK5GAOmbF4YOZI1CGgW/OEJetRiFbCSVWn3r
	 LE/tP0wt/YsH8Jlwhu/wDatY6Z7Kvx9/XPNRFtLoLPQ1F2A9CV46bFO+xt3To5VfcK13T
	 Kdii5WIZvS9/amesgD+7r8bkZ2RIzHkY/iR9mMm82cKXV/pHA89VktdIC4J00piqlcDLq
	 ImKxaFKiMH4p5uCtj7NisDQqvEj8B0h3RCEjt+0DRV9X3Q190zDf7/ZOs1D2WqYS8iROt
	 3Yo+2ZJ5qhE9eVUupE97wLL8ifsHrXWP2CfQ7bAdBqVWqNPQOb+X7r6GZm71MK7WAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
	b=1rnFBqXWhdB1gsq5cXVfAMAN5i2FziqCubrqJaylAt76DAvtdTTGx2Ea8Baaot5zQ/v0
	 t+b9UdPn/C/8becHw2CJpWgRluihv505GS+gWXJkACfvT5lYbswKo/KeS3rinoUmpxUtv
	 SD0WBRirQmoTWuqf4EykWshD6JYmZTiTdNVdgOqwb2AtXsrG0+4kk2PhFhopSzddrJ+g6
	 3HVdZYnsxQ55oRsVtGUWQy3F18WvyynMKfZZ69WnltTw3nBveFe6+wpQYA27K4xC7V1Nk
	 KHBBxwkocZexeE1C6H5QVPGRP7+hiKkR9oD31vHcWBKNOYA1jJ33KemBzg7O4KybXrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/WC8+Pi";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945DD606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945DD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/WC8+Pi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9366515e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998549; x=1794603349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=r/WC8+PiKuYGcgHsp53IhgtATamLlvmJ9DxHOqwkIsCelkKWWRQIrBdiCIZD1k0eJL
         UosQXsLyF1Z7uEToXzt04F8abWfCoKztejsGn58VfW/HmzSB8UJMxcuk0SwF3Co0uJNr
         Z/NmmI4XzLPCpudKJlLslycAYpZVnmiqSzKXhkD/7Yb2F16MsZlE0vU+vJchCXX+VlF4
         l+ZDdF/lzQBnNI64oOQCRHKn/XLYq6BCZm4ESXKnrNjq+ZFxfSmSdvhbQtMoM4UClk4R
         U5xXEwTNI/To0847cbJoe7RvXGtDPHYQNbaBNG8WF7wdmfXLe5FDIlmI2SXq0ES+2gqi
         jpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998549; x=1794603349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=wbuZlKH984QRr4Y1TVMI6x2Pv17v717kSRBrYCb9Wcr8oKedxinB4zQJ0n2tuolih0
         ASwuljX1wOtxqvQhgVzE6GqtdF1CwJAMozLWz7YMtRivrZ/uOUkKnjVIzlsquCTqJeqQ
         eE6Lt8eWlG7t5+IyK9OkQ8a3eT464jmG4jULH75QDDqyp/hk0te2wEPc7xvnBed2KJYP
         tpMBA6NgUNqmgaUI9sUf7Ae8Yz23gAwq8Ch65drGgQBtfM97Q6tiKp49GrnGCG9NnHwU
         COhjeb0sMZi0k1ov/+kOye3xHL84eFzm+j4QOaAvQYTT97wsZDbSl5N15kKptaZR0fEu
         PqrQ==
X-Forwarded-Encrypted: i=1; AKwUvBySupN2P4F55DJKyhg+CYLqu+YxAcf/Ch/u6hzmsxfKqsxWAx9OZVyRMSYjzItVBZla/tXs4v60I7thof4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ClvdwtIwFFbAtYTRd4PHoUxEQAkB+BHr2+3BGPSdDvolje1Yt
	Vx7zi2yvM1uOXGrklxMgHNIJe/L63mJBpXkZ+W9mQsJhKiQFhIBs2hGcFirkRKBAsqs=
X-Gm-Gg: AYBFou0ZVEx0HLtCEYDV9uL9urG0heSomryu8F60jlSFVAsGKaw3A+o25HhgmdLpQQF
	EninrqeTv24YMfZw18w48YCokd/MGoJLF3t6Yrn3LSedk08Joo1a7nEfImnXwvhc3Tj9iN3xWZ1
	8ZleaaLzxDHyhAR6wnLeJOUxWASB9hte54jH+nP6AI08tdPd9zeg4DAwNcY3RrsKYCcWCwAmHpn
	CHUr1Cu9HSJoQblc3rtlGjAULj1ZrtmtwFqIoCn+H6FDzoN5cyx9hMqe0WEe+qG3dd4gyLUL52I
	Ov/dBhUS7PKq2RLiC2ooip7Xc3ac6q5FVixJrD1q23VQwvS0EW6GoXSIiw0BM3UK5jtqY/ECgXz
	yIMqgZmHEHLHkYwA3LdED+U8UUibWZdYI8eu8nVBpnXhALQ0FIkrHf4SFRVN+nnXmQ6oPBuvJ4x
	RpPXccSGKzYUNJMrHRMRKgb0xB8pmoBhuhfaCiraz1t9RY95vCRfPciEx6M10eLFs3llRB+FbMX
	WQNVUuKt2YYHIeRTt0Sh8VgvPTOHt4ACbb6xCcNOI3M5yrr6y1G+feofWEejcQPeKnZUOaAFbi3
	GRf34zbcm93977b0zw93gh6p1D3C00s1MfbhrniYa33ivQWyb+vOWA==
X-Received: by 2002:a05:600c:4fc9:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4b6e017053fmr65530385e9.23.1793998548862;
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3271abasm7354075e9.4.2026.11.06.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 21:53:47 +0100
Message-ID: <20261106205347.10407-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.

Signed-off-by: Francesco Giandinoto <testata.nucleare13@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

