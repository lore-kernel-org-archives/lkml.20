Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BCD303A04
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289332; cv=none; b=gZWUqddRUVPeoQBVI/RnoPMlSfzB/M9VlEsXmn+sVae5cmb3Ce1uJSYhdeQ82AsMHASmHbGb/Lq4D7hgmfGyk75USIM13vLPRlJf5bsIZXE3CLpuDLAMnYBmFqhkERCAnnUdRzxaQQvzgsqRGz1Gi4uhjWu5WQ6GbshcpC6kMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289332; c=relaxed/simple;
	bh=6yk6rSQ2xuCcPa8aOjqz85Jek3V1FUDJxgzFLY6FT1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDeFqTZ3Qf6H3kLBRAwdG+voAmR0vIR+N4M4qLxKunZUJL4BKIBToJK3IeetmAG0W1CTm/sktBCfwLSG2MCpADA+v4eiMkRBYc/CdZiVMZI59yoXjI1igGwxkA3LfN9WJmD5PcQKAUH8brfmWKsMYBgWNsd4xf2hXSZd8dDrc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PunsL07F; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PunsL07F"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5364c951da4so6662041cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289329; x=1792894129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ0g9Te0u3jHEEDvVwqU4VmlgImgFGlZj72Jg2wM5+4=;
        b=PunsL07Fr0briGkYEPHDqObem6i+Uq794JwGRyICFpPoQrPu8DdWC4dqXxqcNn5mDW
         XEES1jpOPIUaA2DwsHHxqAwTAZniqphE+LCtASVsO+VUFvFSh7F+wXrHsh7McBq3mlAo
         XU5mfiGMEvmMn1pn/20a7hZsJ6aqflFvBDSNRIMroCSx8rx9xDADYnK0EXt+gzEsRS6J
         10Dwasu51xKCqpf/u8W2osl847MLecNRHmxWsad8vKEvcNhT9HFOa1Sc7YKpYRmJAV0r
         Kb9TO/18fZb5EjAfdsuvVjnnd3ep/bpCbqV3qk1kqHkVFhM9OBBr4LhbXKJYZMpgImsJ
         kc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289329; x=1792894129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZ0g9Te0u3jHEEDvVwqU4VmlgImgFGlZj72Jg2wM5+4=;
        b=kE6GQRVqu933a2NNpCbTTTrPtILI+uqZLAGFjiYWX+J8E3gh93/gkB3lQbxD5epaiA
         VqvjlicEKyl+VuQhFzZyGyWmR1IYFXjDcUQ/8VyzmfPCy3ivIWVf4UdenSqlIOF8d7iM
         c2YODPfpM048Y3zOvZI6EgSx/72npWRQfNJiti3MkIbAUURnNIC91NxWGM5VO+UJYHZC
         1XpDGjL5+9TaBKxacek6SA7SKSd79G63PY8hM5323FWmvz881Mn0AavlOUk4e1wpxEwQ
         pnOMCcy0Ar13VPvqInKWM959rsAybZm+V4+lH7hQ0XZ+fRVI/7Vv0NDrK6puHB+jg+3P
         QH0w==
X-Forwarded-Encrypted: i=1; AKwUvBw4FBfA0EL70ST2gBk6eozpXvrPpy5+32AuM1Wk354XylvDc5+f1hH7FCmBu0H6BkJXiIyNbK+DZOG67uY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgFGLx4Jc/qHhvhXVVBYV1DtJP3of3dCo32LDmPZcYlElx44xS
	xnEO47L1wfN1YelhsNc5fYRZ7CjWxBOvwWdpBgqcUEcanSZTQYHOiU8=
X-Gm-Gg: AYBFou09L0DW5z1LWPh0sGhv2Y5Hn8e9wxbBv+A1vMJl+6tFtKdAZcWW7kVFB+JGfOE
	kGnbs0NL3AdNXXCCwXe7kkR5MLgKYWAusb3Td+SeW64qlGGPLK22QpGTln3AYo9UVwhfUm6Ivrj
	ZzS2Z04Y4DuNV9uAFFnQQQS8Q6SwYCQpVJ3x9sRwrIaLuVlnHlvpY/Yqb6ZYOsi9zH3zPKSKxzz
	Im8QeoZTDdtNR2qrN67J4mSOBiCSLlcMyNCXoN09WGgdLVIjAkPFIB6mezB2Aq6haqudqGMDhFx
	RsA3VNHseEXBLed6zRt+GehqrMSR+jZWJM5M6t+PlK0YqSvWw5t1kJwtUo1jyBfCHRAIFVVYQCA
	vwtlabU9V0KjwQL5du11eVJ7Sr64WW5Tz066vA2Iio2Kz8xqCrPrjIIpIQEbowF0FwOhz1xvEdu
	G+JzmRtuPG8Seoi4NZXrYJYb58RlIXeuUg7IP+IEYX7gfg6rTJ6aUF5z5bsiK1GN3k3i2iH4jeB
	OZQyx5UyJ2QpGHcdn5LRLQKsVviV2Pxv1GVQkQARBmrZzevswBzybbxo5UPay+QMs3fLqNR3JHn
	wyiZbPTjio+72LyzpdG572jAKwyO
X-Received: by 2002:a05:622a:1349:b0:536:3950:5d7d with SMTP id d75a77b69052e-53645faa64bmr63867181cf.16.1792289328931;
        Sat, 17 Oct 2026 19:08:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa68f8esm61731291cf.29.2026.10.17.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:08:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ae878000@gmail.com,
	daniel.machon@microchip.com
Subject: [PATCH net v3 1/2] net: nixge: free IRQs before killing the DMA error tasklet
Date: Sat, 17 Oct 2026 22:08:39 -0400
Message-ID: <20261018020840.3851552-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018020840.3851552-1-mhun512@gmail.com>
References: <20261018020840.3851552-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX and RX IRQ handlers can schedule dma_err_tasklet. Killing the
tasklet before freeing the IRQs leaves a window for either handler to
schedule it again. The tasklet can then access descriptors and TX skb
state after nixge_stop() releases them.

Free both IRQs before tasklet_kill() so the IRQ handlers have finished
and cannot queue further error recovery when the tasklet is drained.

Fixes: 492caffa8a1a ("net: ethernet: nixge: Add support for National Instruments XGE netdev")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/ni/nixge.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 230d5ff..8697a76 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -927,11 +927,12 @@ static int nixge_stop(struct net_device *ndev)
 	nixge_dma_write_reg(priv, XAXIDMA_TX_CR_OFFSET,
 			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
 
-	tasklet_kill(&priv->dma_err_tasklet);
-
+	/* Remove both producers before draining the error tasklet. */
 	free_irq(priv->tx_irq, ndev);
 	free_irq(priv->rx_irq, ndev);
 
+	tasklet_kill(&priv->dma_err_tasklet);
+
 	nixge_hw_dma_bd_release(ndev);
 
 	return 0;
-- 
2.53.0

