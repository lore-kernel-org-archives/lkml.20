Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63711230264
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967730; cv=none; b=eMDuDlq00HwPX62DlY39mTL9utxK6cdFE7f4GS8VSpAApBSF223qRergq9DSOVF8O1uPGS3mmKxbmWzZeKw4NzjPAFSzGPofGXA+vJzQc/ZciBKrtvDuMCR/Ztox1kf2pV6/mA/7D0yMPDosI9lS8c9hphIeXtA1VNoAduJu/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967730; c=relaxed/simple;
	bh=g8XcicxFYo8wF7A0tBlQ9S0fXChh9zMT3f5Jur7ooxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+LNCfGeOpM1DDzUgydPH85NxSqwZORHnv5GcHD3cZuZom4rbLWYhPZt2gukSPydLGjYbcRbQk1UrAeUklpQeLtTtCs6sMMT8jCBuqmXGuFcH2kf1+uiqb/R9nVb2m9JSegl3OkWBCgi8vl6BLdfpMwOYv49kk0avmJ9gcVGKZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmyFumcm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmyFumcm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48af4ba4425so601698f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791967727; x=1792572527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhT3YkooxXBMSFe0coHgCa0F6iJBgz9/OodyDB50qVY=;
        b=JmyFumcmWNxYmGKlZ2ZlhRSWyWzDJcqFnogMZCZJXJVLADh/A9Yh+8uPkVZqDSq2kp
         X3u3Fi8Dn5C3kesP/YJoKDscfs2Wut9536YT5f0YRio637aMwa5dx27jVcaPQ9NAzpJ0
         TsawK8t+buAbcreNwct3V6y/Tyx62qbyW7NLGUPJqpfxPsHvNWhePAHYmtQXAz3FT9i7
         bIXKfiHJOY5Z3rTiTc3RmjgqmAbvqfjrI42cDEvzIqkL6oHFTY+LkVEDNijmc86uLpBt
         zQ2MH+CsAlwYOKSnbqsILCkh2E/IflmiUkkWY2Yv6n6vZN3/BMOElzBUdHgWzj5DL0cV
         oxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967727; x=1792572527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhT3YkooxXBMSFe0coHgCa0F6iJBgz9/OodyDB50qVY=;
        b=xV7smNcQdzXRjneSksPS4U6CxaNgqO/V58ABvz5OqAtZJkKMkR2/NX4VA0mlZnLH/h
         zkQiRizU/3i26WjQ4T9UVAU9WDHNIi+4tRBV9TOd5iqC3v+PbM0xWftdkNvkD8odiqqW
         WxQaMIrw/sLGUiDGND4mdVlVfMuQtKUtB4XjiUyagZIfInOBpSMplAZhCGgNTwr79Rej
         DWInhEGfKEk0GFLSAYWoFxcsQSxN6nrXZhiMiIeqbn1MiYDYSUNL7wCd9L7iK4+bxyig
         keHYpaInphnmwCgACvzohTAHJsCHWIPvHx5w6fMy7WNOeuYt24acXVtJRn46TWSKUg2v
         fUpA==
X-Forwarded-Encrypted: i=1; AKwUvBzF+SPl0CAzwBxtxxMcM2N238L34hnylrzatYnejLcBMzK2bavUqzEHx8X27bK1ctKF7jL0RMmqkhCyb4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrA6a5JcxwiOpi+/yNd1G7lZOPRNDGHcAsQ6B2XQh6l7b2B33V
	I4ryZtMxmiAw8x1+IrjJSLLN+2iURo2iQKhsGbwK4YZau4pif/G/bndk
X-Gm-Gg: AYBFou0EDZ9jj4Xk7ubcNuD0MgnYP82sd1GrB7BUVRVi6tGHxRs8CYiIYOI/zW+hJf7
	gWj+s53op/E1D4XRbf5e9GOKyFou/k4ZTKdRyK3jnAYylfIYClt6FbnWeYKBk7kitQBERRRiIHW
	NM11zrKKTa1k7tlMraRPAVmrPHmtEe0BzBNPxyksgnyKCUP0qHCortTFeeQQSBAfwyvFkpGElmQ
	mKTktoDa66rQP80OTYPPn1pFjWw40Cmbtgig893d0Qd407xt6XLpLCipSOv9ufMrp7a5eWcyR7O
	xVFtl5STB32uYxFKBbHzoIYk4avBVVWyZcKVudPY3X+DRSQgkJEkwQz6qVJUnGYM3eLcqKrIEUp
	rOVJrIF0TI/rpWdP2q4A/HSaI+1c5UFAFE2roRNEeRDjwKfqN03WPQZzGYWkhy9ocegFuXR55w6
	1NmjSSUUhCGhMyTz/FGFhCjxMbI4rs51xXJOdMZgweBa8ZfxMhtzB11gA2x+Bu1pkNgz3gbePjI
	1xvUJt2hwUi/UXVEGond7Mia4RGlWqMgqOM+jGo6yWaNsyEY/HeAm6TxRcNZLrwiCM=
X-Received: by 2002:a05:6000:4681:b0:48a:f5c5:d067 with SMTP id ffacd0b85a97d-48dba79be2bmr19646031f8f.2.1791967727231;
        Wed, 14 Oct 2026 01:48:47 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm10492158f8f.24.2026.10.14.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:48:46 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] drivers: net: xgene: Fix dma_unmap_single() size
Date: Wed, 14 Oct 2026 10:48:16 +0200
Message-ID: <20261014084817.41805-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xgene_enet_refill_pagepool(), the skb->data is dma-mapped with length
len which is set to XGENE_ENET_STD_MTU which equals 1536. However, in
xgene_enet_delete_bufpool(), the same buffer is unmapped with length
XGENE_ENET_MAX_MTU which is 9600. This may erroneously unmap other
DMA buffers or cause other issues.

Change unmap length to XGENE_ENET_STD_MTU.

Fixes: 6e434627bce2 ("drivers: net: xgene: fix: Add dma_unmap_single")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
index 507db46daf2b..2ddcbf27014e 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
@@ -185,7 +185,7 @@ static void xgene_enet_delete_bufpool(struct xgene_enet_desc_ring *buf_pool)
 
 			raw_desc = &buf_pool->raw_desc16[i];
 			dma_addr = GET_VAL(DATAADDR, le64_to_cpu(raw_desc->m1));
-			dma_unmap_single(dev, dma_addr, XGENE_ENET_MAX_MTU,
+			dma_unmap_single(dev, dma_addr, XGENE_ENET_STD_MTU,
 					 DMA_FROM_DEVICE);
 		}
 	}
-- 
2.53.0

