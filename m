Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515994A4F0C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155684; cv=none; b=qTxXNAASAdvQ/I1lYH8/y+XxcMu9K04jCWHUFpwgHq8N2Puq2zU5fu1jHt1dz05L2VOwk7b/JT3wXEJe6hbfigrjfNY7K3O25yoXhb5oXDeG28W385u4+/EuM/wLceF9EClM3EOXf0parjXv4oTWr3lUHxgjowUXccnGq60JR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155684; c=relaxed/simple;
	bh=zLNCi/x43r+dPYZ+ZjrT65xXB3nkdcDSz7QxgPGzn80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFfvyModPtaRExDQSuGc2DfJng3b8G3KSoOYm3RgSnfLGchqhGzI2ktYjHK/V6/PxvLQy8YEo7zRwLpgES7tEIAGMZ/GCwVKEB9HGQTlNDl1YXRyDW9lX+TRWmaAhI+Gj8DUNMSIB8oqrZYN6D01xKJz6EUPTj2YXdTYSZfFw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfJUyhjp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfJUyhjp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4ba4425so1001313f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155680; x=1792760480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6SG43mHsHGUs5imH1Rk9lZLOCzzEMaWfOhJt2v6hsE=;
        b=OfJUyhjpk5iJiJJBLciyxNtmfHa/lMAgpFGFyWWxfZjqjW1kY3fy8pbMJc9KtPQHBA
         CSozXvMJebwvarT8jnWOS7M7BzIJqNobk/pU7T5MkyIdlrGE62i8fnGM6rHXvgg0E2Nl
         nOVUzk/RmXX96KiHBwPFLRodHlZhVe38XI8J8tn/2IO4s9qcKBQom2iXkHjHNlSj5SsB
         6vidzkJKlOtFqcwbopdsTR0aD/veIE8ImFtwjOpsXagqj6LHZPA7p4oEhxdwnB9B2PbA
         25Kfmhk8OhzgTFGPL9tnu7UrQe+BJUsjRqNapuPL+0FVcRtoXr7FW2dCha6FMw0uxxl3
         Ig5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155680; x=1792760480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6SG43mHsHGUs5imH1Rk9lZLOCzzEMaWfOhJt2v6hsE=;
        b=Oq4YHB40FAj6OOm24BnfMnCBhBVwiqedINRicLZsN1UFM7lOyQ9Og9iILTXrICI5m6
         5w8G/mBK4w6CsO8fG/e+6gKIkZ8rpxmKCtzoybabHl+/+r44UilLYdaWtnt2T1nk+++y
         anVf53/cEiPD2JhadWA4I9b9Wno474O9ie0R4MPIVLWFmviw4cN9pjpcQAfYJBzluaPh
         bwklBRaCsP1Omyoa653nbuCOJZdBPFFzOIwZbrP+Gd0rM/qiFXr1OfP4ZxDGRvoY5k4/
         Fq45z/9jvc0A7EBjPbMLSocxwoTE4vNzxQYsb+j0akSHXYQrdWJvkGpAq46+bNA0SuKp
         Ab/w==
X-Forwarded-Encrypted: i=1; AKwUvBwCWnPgtGpcDtK2pyzDghHtH1UBILzw9BEUo+zQkF5ZFcSUA+ugc2R+0NlWHZBkdfJeCtSlfwa+jJ+qzCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKWK+YAHVKMjw7rKfDzulfkyfAU5rRps8Da10BV5S+i7LeLs0n
	W1uLmAceT8MAEwh5E9ZyaIoUggMX52i5Kd77u+G/fFiLe82Ie6NX2J12
X-Gm-Gg: AYBFou3VW/N3ZoalOMkA9DVuVwEFEgGSjggpKYyGSzs7ZnNA26nwY69zZ3CqIDi16WE
	tXXSwiUJ5e/qkp8t133WmGEC07kEStxf/PFSgIDP2f7qyPyvZCXwhOAo2xslKYWgJfwbaTRyy0E
	wlv0XJq/i8MolXK3HcaaXDVk6vHIx95nF8Go+BL/X/iXizplyaSL/bH3KK+Yflkk1Kw5KAo5VWW
	j09V3IibG07iMIsZizdfZ+pvnhSI41tIxENRYCS1ak6P5r4PDk6PQuHMa+S72XByX8HjGfDywLy
	JGJASqB2kx9nlrYgzkyk1PgnBnNNcdk1PoX66Qqj7/AGtwVE32Gt4QGarXqM3/Mgr6C3fcG1ezS
	6vR6HO4G3TLgVS465Q70gYgzmmkh9o3L05BUTcLHESDTV0ChYqzPE2Jn0QcoiXCgBNNE5M70R2f
	VCdASeCAq/A9UowvOmZa3XNrLQzcf7nxG8zONqGI1O6fRKfMpnQPDpj7riD6eEwcUiRq6UF5ybL
	/AMtXt1tGFe3+r1KfhSzT4xjNACt6ecdbHcw6YjH9+ovT4IvPKPlhFcWEtSr8gzG7o=
X-Received: by 2002:a05:600c:404f:b0:4a1:d05f:3efb with SMTP id 5b1f17b1804b1-4a1d05f3fe9mr18704235e9.0.1792155679827;
        Fri, 16 Oct 2026 06:01:19 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm4331624f8f.7.2026.10.16.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:01:19 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kevin Hao <haokexin@gmail.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:TI ICSSG ETHERNET DRIVER (ICSSG)),
	netdev@vger.kernel.org (open list:TI ICSSG ETHERNET DRIVER (ICSSG)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: ti: icssg-prueth: Fix dma_unmap_single() direction
Date: Fri, 16 Oct 2026 14:55:28 +0200
Message-ID: <20261016125534.36024-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In emac_send_command_sr1(), the command data is mapped with direction
DMA_TO_DEVICE. However, in prueth_process_rx_mgm(), dma_unmap_single()
is called with direction DMA_FROM_DEVICE. It seems like the buffer is
written to by the CPU before mapping the buffer; and, after mapping the
buffer, the device writes to the buffer. The DMA_TO_DEVICE direction will
handle well the cache maintenance operations, however, if the IOMMU is
enabled, it may cause issues with device write permissions.

Change direction to DMA_BIDIRECTIONNAL.

This bug was statically found and compile-tested only.

Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index b8115ca47082..6f4a3f64ad39 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -98,7 +98,7 @@ static int emac_send_command_sr1(struct prueth_emac *emac, u32 cmd)
 	tx_chn = &emac->tx_chns[emac->tx_ch_num - 1];
 
 	/* Map the linear buffer */
-	buf_dma = dma_map_single(tx_chn->dma_dev, data, pkt_len, DMA_TO_DEVICE);
+	buf_dma = dma_map_single(tx_chn->dma_dev, data, pkt_len, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(tx_chn->dma_dev, buf_dma)) {
 		netdev_err(emac->ndev, "cmd %x: failed to map cmd buffer\n", cmd);
 		ret = -EINVAL;
@@ -108,7 +108,7 @@ static int emac_send_command_sr1(struct prueth_emac *emac, u32 cmd)
 	first_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
 	if (!first_desc) {
 		netdev_err(emac->ndev, "cmd %x: failed to allocate descriptor\n", cmd);
-		dma_unmap_single(tx_chn->dma_dev, buf_dma, pkt_len, DMA_TO_DEVICE);
+		dma_unmap_single(tx_chn->dma_dev, buf_dma, pkt_len, DMA_BIDIRECTIONAL);
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
@@ -303,7 +303,7 @@ static struct page *prueth_process_rx_mgm(struct prueth_emac *emac,
 	page = swdata->data.page;
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 
-	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
+	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_BIDIRECTIONAL);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
 	new_page = page_pool_dev_alloc_pages(rx_chn->pg_pool);
-- 
2.53.0

