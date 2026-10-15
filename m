Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83055038E8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068398; cv=none; b=Ngl5DMnDIcPBzoHMU+HJEO/WabHLMOijmE+6h3+et04fcN9mP4MsL+9ctlexQQIXZOwkI4+kiMcZ+jvxbrkohaK7TmfhVOJbbCNlfvvktnCxYCNYOud1dk52eC9xh0Eoz7wzgTOpBvzukIWlaIH1/B3GA+DPYULZE5d7v4Mlkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068398; c=relaxed/simple;
	bh=cFiDNlYzTpfBr4CpahMrYQnDXXyhSYH4MDv7Q2S8ipY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Buq0UGIfPGXZG/iupXva8xOGofsrOfMJuk3EDCoWJVjf22d4qmm/kUUBge0rX/kqoYpFbnN4gpSrutwrqMH6rYVocWWMEr8MoEqR1TEzbxl6B/GoX5qdMbxH0+HSoteobyt30Rt4nS7Ds+s42Mfzwcavl5w/D0IteM32jJWz+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT2jOlMT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT2jOlMT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so10490655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792068395; x=1792673195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+l8FvzFknLtk4IDfbn1d5i85ebVlKTC+SH6Z/LTFqeA=;
        b=HT2jOlMTOD1S9Ly7eCQTKS7yo5NsJWUgL9WuYRFVlNT8iPZ72FXmK5aCZWcacg/dSe
         dlVRFfPNJ0LeQSE7RLWIai6+hFidcyo5HdbJ43ifroiQYuZRghbRvcyWP0V9I3L0aT8G
         jG5WHAMUpeHZWK1mDWyTctRdpro5jmAVE54WzkMOceMzpImI1yxVH+bhFjbT5BbT2Uq4
         MGc46X2Z1AuvDGrD1fHu4bzL/Dy6iQzspQacwvBIQOSiI8eICVhZqazhJMwlUBrLNqRe
         57HgZ8diZSgdIZIqth+IukUlPEQx3SVrTPsHkQ9Ap5HiOyIaN9xPu2qaoS9TvD24gd4g
         gn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068395; x=1792673195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+l8FvzFknLtk4IDfbn1d5i85ebVlKTC+SH6Z/LTFqeA=;
        b=xo+LCpXWfwyBc129ssZWfPmDaEx7FOdz6VVmQkKfXzgZkq6M0/j91epF0vY1vpwGrb
         PbqB5coKJ80vgL1n2WuDU1S7oPNYVsfiaWn3AAEL3TI4/Ovt621pweI3EW+0pqSd9+Ue
         w4Wbvw2L8qyRZD2XYw4WcN01r/qp18NaRQfxJsa/OtBwf4fiZqeUf1Qy4imV7v6/sXt6
         2a4MGZR29mUYRr4GTiuC3WIRrT/SPN3iicjIX6wgmPPEXXAAvBzXqEY3UWJRyMg/gqAC
         0lte4NWY1HfBQaF4R8DnKmR5Q9yWp37XA8bsSkFF4RMVFlOA46EPxZyyVcr17zrtxKC2
         tqFw==
X-Forwarded-Encrypted: i=1; AKwUvBz5FhkO5svueXG7o4XAgl/xzGch+S7UKpgkgtpnUkKHHHNKK2SCwLcaUKQo88Qoi3FSABZmJ7rukUZt9oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKYwnvhJbd4HtMvTM8wEwAtRnIq/37DIHB4Jp992eUA2GKn5C1
	4aLNhnJhj6RyOwJRt0OzPKBIzuDoVvmqtohedHIC1Gw+N9PI2IVR+twwxj4zfHti
X-Gm-Gg: AYBFou3cGey17Sf0HYs4rhXptMMhFXBp8OZqi2TXcxHCy6GwhjfgxC1yrlBQEIHq+kT
	C4ix2IGGrhUdrxmCa/E3fEV7AAr3oIowqURRsw2ClITj9q5lztcf2K2ogaTMRS1bwEhZ4xKNpo3
	1fVnvZCny9DpNaohvy3xsjOzo3Y+mCp4JvQq2NWq2syTY/v47SG8KZ64GvVmwzXUS6INe7z+xYi
	Jzo94JLxMFh5ScHRoaJyy1M1/dAv2cfxn4B4kQ04QSwzRl1meMkXjQD0EzyKOv4aWi5+WcnuvoE
	+Nd1wpdvuoqBqTnl4bdQOduA3yFUVcAtN30o3lEl0J3Ivp0c/a+XYKwsDKO+Na6i9IgAKGt6q1e
	2yYeeQWwWKTqdUmKY9Vdx7F/KEXfWulESzP83tkGhCJW+nr/iub11aBG5BimxaIKMf3gam90VD5
	uesHC+eIve3dcH4hwd+ldEZofcWem55735oVLj5Dn+EYAwaIGxKqbRFknUNd/BPgIBxX9wJvJIl
	HNfeaQRYlrrgzRMWozJCC8pbnPcItMgBhHMZLXVV3qxwJtAXSeUnPhif1+SUVRWbCs=
X-Received: by 2002:a05:600c:1912:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a18e3ef211mr354944995e9.0.1792068394724;
        Thu, 15 Oct 2026 05:46:34 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd99febesm80110545e9.15.2026.10.15.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:46:33 -0700 (PDT)
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
Subject: [PATCH net-next v2] drivers: net: xgene: Fix dma_unmap_single() size
Date: Thu, 15 Oct 2026 14:45:46 +0200
Message-ID: <20261015124547.29996-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xgene_enet_refill_bufpool(), the skb->data is dma-mapped with length
len which is set to XGENE_ENET_STD_MTU which equals 1536. However, in
xgene_enet_delete_bufpool(), the same buffer is unmapped with length
XGENE_ENET_MAX_MTU which is 9600. This may erroneously unmap other
DMA buffers or cause other issues.

Change unmap length to XGENE_ENET_STD_MTU.

Fixes: a9380b0f7be8 ("drivers: net: xgene: Add support for Jumbo frame")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - Fix function name in commit description
  - Change Fixes tag

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

