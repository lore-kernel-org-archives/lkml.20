Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA3497B79
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164287; cv=none; b=Mttxy3QV16YHoZXy5b9/VIEo9YejlSOH/4oif+hYwYa893V7h7VCqEymp6kdXbaO+KAHhgzoBK4eM5vjoppjg86sTdxQqrY+CEksjTWo8xsYzDXxU2oba5fUJrQ1aqQXtVX6wUQik2u1Gzk40WewqE2kNOFTwnNXqKniVcpnclY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164287; c=relaxed/simple;
	bh=3S3J/dSY166r0J4ZKpPkhdswPpVMH2Q7k4E8eREymhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+KzX+RqVmmtlv5MSezU6uVGX43RjynQL3xIXpC8gSYnmXXbnicdGOMkdZ96U2iXiBMii1r+oPdbhDg+SaXKXrmXUtDbz+bz0LeE1mYXJ8UWHZvlEsfOTEFTxUvWHArxJQU6urQ1bEW4zRArCz5w7ZMbnryGcmRNw6zRDVfWwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/xliQkf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/xliQkf"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so280655a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164281; x=1789769081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA7/TxcROHvx3mFEUwRb/G8HDiCsuFllSkpMG3B1Mr0=;
        b=p/xliQkfpeJB/cKQ3FzlS5oKkiNyH6r+PXBIaDM4IQnKXbfvPoWJws/DQDIh2eGXOM
         niv5sbqWzSdAaFBjUSQs1BN10JlQM2AYwH0nIie0VYtK7+pPM4UZ+bX1U8jvSszBPVo3
         DFdlbUlNHW1tnNwEsIv0uOILlq9nd7ifxHtjYTuKE6QGnBF3l/x9WWasJYIIDb4WmLqY
         YcJhQ/SsVJ3EPvr8lQ5bvjiE6LG64V479qALPZaPzAFds2XuHMt2tS+4JZ8oMBEs0LAx
         qkibt44gQ4dAKiKXiKdGP+lgJjkAwhh9AqegpSOFg3WN/s7xr3tf889Yae4EeM77fKp7
         R7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164281; x=1789769081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA7/TxcROHvx3mFEUwRb/G8HDiCsuFllSkpMG3B1Mr0=;
        b=pKIOlIeer5NhEU7JszFu41V1ih/Ljlco1Q01HuGAVaXhiacfP7TmUYrWjHwaWfn00t
         VGdDKpY3EvGuaz5N8Nm5PyKvaqV8ta03f61H2GmIlVXIdeSmciOdz6UVxPDs0bjFAJHw
         8x7oafqBZ2hxw78Pa3YVv5KPrlH1GcKPF2BHeVC0FiiOeEfeWswnN/Lf5Cxl1F/zQukv
         sp0yEPTD5Rg898lDbOzjECQwwGdaR4biAAuFxE289IQNPAfV21DDLZh1ESm6t5AmyUEz
         7r+O7SWyiQfPcKBtaqSnJAMtunV7dQ6+0YFt8oJRAjpo41EPA79OsUwhuuOmIKvfiVCS
         asXg==
X-Forwarded-Encrypted: i=1; AKwUvBym9sjXbUCLwz2tcJsvZmvRLs5V2TVS0t3ESM36WBNt45SX9BSzCoP3s7/E+nu8lYnzuN177bmUMn0b0JU=@vger.kernel.org
X-Gm-Message-State: AFuF++nxoGV1JOrxUhnq3KtVFrdybvIVTDOwXydprr3WbxGkil3rBzoi
	0kAgt6Q+rWjPoof/p2uNs98NPvEtc+WrXIVmLQMNYsABJor/7LowzOsNqJwxiA==
X-Gm-Gg: AYBFou2PBBdgX6V8cpuQdJoIeJCC/4eLikx5yAi0jacpwby+14ru5fWhu0Is5cYdmwu
	PUsmvoq91aRFxrleV0/B/b0sFlsgAEZjckM1rBh4eL6RcF9jrT1tCaXErLDLYdFQPC2tYz2TEvP
	Y7tR7sSHvAIzASRB1Mi0V7CJkpaubroADCht8W00A4DQlYzqRx4O1Qtzc7mvEvquvT66Bb0ZB3w
	WT/tSvp5XJQYdTN51EZw0YVGcUbce8YHAcKJifZOhWg9FkJUQEDxlQIFKI5sa1BQ39vFgR7RPai
	L6BtPy/QrRPtNRxFWV7oOiNwacqE+feYX23AACOegsIPZAt5kzVit2742rwodslCH5IQvocBIq+
	DKqdzp7vEmfC8/S8+pV0RSITiKFrTZqy+GDNqfNKwbbAFuNrd9jFws+TMtn8OMOpKR1r8dCb5cc
	ot5PV2+9nFiLJYVKHc9kt5OxkYQGblD9DVha7Cm3SxnYqQQdtRwZmMY6fxjNp+I0QFjTxcMjb0k
	zHcXIQgZzEjBWe4M5Om+TTlpUrU+6maC2UKQtD9z/hkhpUkYxuXhPdiWQUEfn/JXL6D1CJsvtwt
	TlWFKc+w5kw+hC+C8KqPkvttDl9p1VsHb/Hcx0jSjqBRPMSy
X-Received: by 2002:a17:90b:4fc9:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39d9bbfc338mr10845124a91.4.1789164281193;
        Fri, 11 Sep 2026 15:04:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cc978sm6554980a91.9.2026.09.11.15.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:04:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Fri, 11 Sep 2026 15:04:39 -0700
Message-ID: <20260911220439.177474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs. The corresponding
irq_dispose_mapping() calls in the probe error path and remove function
are removed.

Moved before anything else in order to handle -EPROBE_DEFER and to avoid
doing extra work. Simplifies the if statements as well.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix build error from the move
 v2: move to the front of probe.
 drivers/dma/fsldma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index fb19c60540be..6db2c4d284c9 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1224,8 +1224,13 @@ static int fsldma_of_probe(struct platform_device *op)
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
+	int irq;
 	int err;
 
+	irq = platform_get_irq_optional(op, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+
 	fdev = kzalloc_obj(*fdev);
 	if (!fdev) {
 		err = -ENOMEM;
@@ -1246,7 +1251,9 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = irq;
+	if (fdev->irq < 0)
+		fdev->irq = 0;
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1308,7 +1315,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1330,7 +1336,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.55.0

