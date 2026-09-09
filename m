Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC563AAF40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997565; cv=none; b=jDGRw5uf6ZQgVgo33F5Gmx4dA/lclTGoppz+bdTMFyWyVGtBroVQ2rHiv76DHWZAzKYvYPwkehAxFkXEKXwsERY2+/n4G8KeEs61R/2t7e5nF6gJvplhU1i6mQxkLw65oP52UeQVD7QftXc7ktO7y2N4ipIn99Ze90I5zpfQZbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997565; c=relaxed/simple;
	bh=BbGzXwRH1wQ+dRmcbeHv6DcwhPa24RjD3eePzB+787w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpjpf2I9Bxyob0L69xgzK/rLAaCcySOjyeZb8SrzWHpSU/fzShphGggy/Q4D4B3o5fNnbuGy5gmXQvaxzxjhdj+j0K7dcY7SxYi72YjFZe5uiJrcFV+fyux9EnLYk5NPOGBFdJuDfTvjWStQk/byLqnWfAZ4+tP+uv3iJvwQYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8vfz+sH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8vfz+sH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso961037a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997564; x=1789602364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhEZwtuKG+E5Z9325MZIhX6COOpcwqX8hfk4svZURw=;
        b=J8vfz+sHB6bloP/yi4lruQRqXB9epyp0X5CH5p1hlv9XiMINW5mWjxDoZFPxaJQz/G
         4mlwYRdRNCPD2o711Bc+v00iOM8HIXRtLcF3WLRQDpVefRwwucY5FxDExwJsIcgF5PZx
         0ej6JiXlm0GTE0LYS5PHBT/R3N97nEbPscPynF25ft0vhv+0EXeW9hU+GVTMx9HvF5kH
         /FLLWJZExEblpYyjFi0WhNQNhyVHK87/zBG/Z+wk0LCBtuDljoruHhKD0HCJ/pRX8epY
         EaJ2Ed4bvsPlVsMqsN2ilIhAKDPsZ2420qvcdmst75AVgEhQtCc3fGH2kEwpGzxnuadH
         dkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997564; x=1789602364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhEZwtuKG+E5Z9325MZIhX6COOpcwqX8hfk4svZURw=;
        b=jWJChzDJpmgZhC3eu2xEiUNAh5PKEMHsU722rak2LJMrWH3OTFPLe5CyZN1oLsY9Xg
         1TG1ds6scwzd6k9XBR/0aPNO2pFGD3jnt6OIhgF7dYSv2R/tl9XFXhUP2kOEGjS1XbNL
         XuKpBKyaz4LNnU9Wcqs8uvOASFHk0/8MVSP4N5vDyHIeJX66iluPHmSOSbQALlMNJ3zp
         9t/ktw4FFFPdmVlH+cslzfldpGc6rfCtGO/65kciLXpLGvFwv3aMJ5T+zxJWdEgn+lbW
         5Eyc7N9ymOtDgwdRpO3RKxD0g+/YgjLlMl1YDrolLm3KLXJpwYntb5FLoq+ULzE8YVA6
         6fQg==
X-Forwarded-Encrypted: i=1; AKwUvBzFwdrvvE9UXBx4Kbd8thhw134/yIHaS99GyoiyfHsKRta/+if/OovmtLQ3qDFiYWBEdK9SbgLxiDTS2F0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLa/3yNlcc6pYLYPCbK3hQvssX4RPpq/u8RvJNEcS/krzAbBZh
	LXKwmEoNJl80Yb6tHQXMSLtLnMOmHVeCtaeJpvU24m4M13USR/B7/qC9
X-Gm-Gg: AYBFou2H7o1WVAPeaUDzJ/EnuP4tQnWctgLS7WdtqHJSyF1DtP+Pl9HiDqKqPU1oRfA
	cE/M9JFlCcgTLK6y+7ls1p8ALuS+L3esXEp2w9bgGu6ZI7Ph1nL+SiF5GW4Hq83lHYxDn2x6EzC
	doMhLTxrMw4tOBlIy9dT5ZY40N4HLPruhoVPX9YmViTgRXK7EunoJ/hFZK5aXTMHz3mmcoNRL6n
	GdcUY2LG2aE391Ley97Pr7IthkNyY6d5oJJcitbDItPCqlUHQNaQqjmpm5Q6o+aJvjbbmvd6rHA
	vmVnhMJkwCWOk/ff1XkQFdywwB6SRUs+lOUo6FU7CNRdCqvlnkbpgPWbqT4JSFkWhKn4FS+GArm
	BRee/KKi8ZWCDdxiGaEBTkQPDaLGocziim6eFCHHnOA8nZS/jSU3nHVeYHOynA3iCIaboc5eWju
	XUORGiTC0D+0ddp3kARPlNpLrc5pwhwgwSNYC77ApjMJ6Tb6KO5utTNYZoG84HQrbyRsQwD7/ka
	LERYVwufuBME3mdtA+cgzePjh3g8Now8U1FOUmP60CToLA26Tu5kVgkzst7sPfG8AqXtrKYUYzF
	lMZTyivQ00BNigfLbcBBualiuonzrg4KW0K0TcpYkfu7GxmtRzFGGHnwTCI=
X-Received: by 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr1631597a91.8.1788997563939;
        Wed, 09 Sep 2026 16:46:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77486a1esm1942399a91.12.2026.09.09.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:46:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: kill tasklet on channel add error path
Date: Wed,  9 Sep 2026 16:46:01 -0700
Message-ID: <20260909234601.101883-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If request_irq() succeeds but a later step (self-test or device
registration) fails, the error path at err_free_irq frees the IRQ
but does not kill the tasklet.  A previously scheduled tasklet can
still run after the channel is freed, accessing freed memory.

Add tasklet_kill() after free_irq() on the error path.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..24f22db5dfa1 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1162,6 +1162,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 err_free_irq:
 	free_irq(mv_chan->irq, mv_chan);
+	tasklet_kill(&mv_chan->irq_tasklet);
 err_free_dma:
 	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
-- 
2.55.0

