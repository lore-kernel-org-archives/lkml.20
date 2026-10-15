Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EAA499F00
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054071; cv=none; b=r0fPb36NNxJeSQIGekMzgarOqDCIrdzalssS12G3Uy2hTQQiopTGRMaPXsYtlt0uXcWTnfNnSmdMb2p5/WuJFk+EThhcn5NbgtnYEo9fEjmiF1eRKDgcC0XOCg3lba+UQPN6227skNkBmjSVWVGVB52hFb6LipJt/Wp2EciRV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054071; c=relaxed/simple;
	bh=UGKBj/h6sbvEgkDPV05IVG/HSnc4PBVKluLbWb7zkDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXy9vSx7zAasa4EdMy+FHLyE6+IkPEVC9uLdzcl19YxBiMutNdg2UGQixyaQ+Sdy03EU/nznGn2YnYAYoNtKVkd+gfxe6gMuPF3ho4VSE6NMnkpGkUHYJILN1TanqB0t+aKFttyKRgZh6y9Xfl2/DtlEeFazPVh31Qj9Ywufaiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqPDEyxa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqPDEyxa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso3169841f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054068; x=1792658868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LoAM7/O56qtCbczKVBsmCZ8BcqH8pl/3PC+hZvCjxc=;
        b=IqPDEyxanP3NJpe4pMcmtZNKXzn67Wa+0NE0HrRCc0dgoO7dw/3k+PC0gXzTQNjkIb
         MAKFqIypdSPkhHsHP9B100v+LVznxhW9g34uMYJ49zovMNrCUTD5AWkhR8fo4OdXzTlf
         WMNSnc+41kpJjh+83FaDI78U/bfIPR7rbV4MHGlU8A39cR4KYUwz/kI+ErUb0C4nzOCv
         cv7bKN3YtNO48c8x4TuYa/mLHMt3mIUGuwtGTsrtSMhqUVBORCDPhaA6tnr4KXFH3lwD
         L6HNV26VAmJ/eQf6t5TwktMgefc1pffFEn6CqsRved7Zh2gk1Nqn7CgGscNmy280asPp
         rkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054068; x=1792658868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoAM7/O56qtCbczKVBsmCZ8BcqH8pl/3PC+hZvCjxc=;
        b=zSPwCYjSboeMSysre+qaYAVr9sxKqqu4f4GvAjRGLTwUqBO3EvuQgOiUhmoZ33Y+w0
         Aym01gHahfb+peMXYH7iC5EnYsDyNiTNM0ghQj6yV2v6ZVb8wfHKGgCkmeHChk1IqVSe
         qM/i3kL0XknU3wu2KSm7HvE7JMsKrWpXBvrUKt+OfG682HWNUx4pN5MhnEkbgTKIOROq
         G+0CUNM3T4UxI2gna8oGGRBdmU5RPZ6DResnH7IG8IRbgrQ5+mwtTYkCDOjGgbgDI8ZV
         eDSiOtIfG+ZbWj2xs+hPSmMji13sk9vkI11FTNf3Y9bj59r5pZ8SW2yPLJ77ZGyU6chA
         sseQ==
X-Forwarded-Encrypted: i=1; AKwUvBx99Wvpwwz2kdbB0irTbAIuEtxocCF/0Efp+l5yOuKG9yaJhyTs+sr35mQFqeEQ2ST9HCx+0/DuKLSTcCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0iWpcs3340HUPzRJHq/28MwMLQK/pB4dtJFb6HFDKWo2YF2XG
	bcZChUu26tyP0UIBDuU66s0t8zbl3DTcXfaRCDyrFXmEGfcJ3AdZVhIQ
X-Gm-Gg: AYBFou3qMeOlZKY1/Vg8IT0iNm0VYm+vm12Zez5t7Y+Li22wFsy+mxYTfle4nb9UuYx
	Z2EXN6aueSxrNg6RDpb0uHybu/WyYY53rOdi0CsYqix7FH5ZM6JyjNC52yz7q+SZkjQSKWRUaEW
	WK7/Dby1nTgB3QBT9VYGRdPeCzH7kP3Y/gLVu50OtyPu8j62GAJqfI3sAOEA7OhNJahusT1NqsM
	uf3yK3FXrQIAqArmlVM0+GVyzn69zyWxLy1GOrSKMG7AFzcy7qSSg30meLdIoYzLRr5kb2/Lsl5
	AA3MrMewscn/j0fKqDHE4wNHSu/ukzWtur8bvD8aAtr6ABRG5K3N3SIBYVewofLMxflD8uWHNXT
	A2ftlzZmEQOB3d/WqLzGwd1gaoWXHZy1THrg3+Pfl1rku8zq3FrWKz33c7psbFVy+LCbbgAibIo
	zE8gb3ZR904xoX/cLz9WkfE3vSjgumXe5TzUshkaTP9P6+2XAtENIMl6NqaqdAdZ0lOdsBmL5SU
	tsQsLLPtOZERf+OIDLn/ZldOgGPx+tUVeAfzx9ZBFJ7Ug67HyPkajwJZ1qDM8yZ3BkYx+7W
X-Received: by 2002:a05:600c:4e12:b0:4a1:7f8e:6e5d with SMTP id 5b1f17b1804b1-4a18e4a393amr399094215e9.6.1792054067874;
        Thu, 15 Oct 2026 01:47:47 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm76383725e9.10.2026.10.15.01.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:47:47 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andre.przywara@arm.com,
	robert.hancock@calian.com,
	horms@kernel.org,
	joe@dama.to,
	suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next] net: axienet: release every RX buffer in axienet_dma_bd_release()
Date: Thu, 15 Oct 2026 11:47:43 +0300
Message-ID: <20261015084743.1798326-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RX walk in axienet_dma_bd_release() stops at the first descriptor
without an skb, assuming that such a slot and all after it were never
filled.  That holds on the axienet_dma_bd_init() error path, but not once
the ring has been running: when axienet_rx_poll() fails to allocate or
map a replacement buffer it leaves the slot it emptied with a NULL skb,
in the middle of a populated ring, until a later poll refills it.
Closing the interface before then leaks the skb and the streaming DMA
mapping of every descriptor after that slot, which can be most of the
ring, and is most likely under memory pressure.

The walk also frees each skb before unmapping it.  With swiotlb, the
DMA_FROM_DEVICE unmap copies the bounce buffer back into the skb data
that was just freed, and on non-coherent platforms it invalidates cache
lines that may already belong to a new owner.

Skip empty slots instead of stopping at the first one.  An emptied slot
still has a non-zero cntrl but its buffer is already unmapped, so the
skip has to cover the unmap too, which it does by coming before it.
Then unmap before freeing, as axienet_rx_poll() does.

This was reported by the Sashiko AI review bot.

Tested on the AXI Ethernet MAC of an ADVA TimeCard X2 (PCIe card, with
the built-in AXI DMA): traffic passes after each of ten down/up cycles,
each running axienet_dma_bd_release(), so the unmap-then-free order is
exercised on every buffer.  A failed RX refill was not reproduced, so
the skip over an empty slot was not exercised.

Fixes: f26667a373f3 ("net: axienet: Fix DMA descriptor cleanup path")
Fixes: 7a7d340ba4d9 ("net: axienet: fix RX ring refill allocation failure handling")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 919e644d9158..a8b8c0efa21f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -247,13 +247,13 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	for (i = 0; i < lp->rx_bd_num; i++) {
 		dma_addr_t phys;
 
-		/* A NULL skb means this descriptor has not been initialised
-		 * at all.
+		/* A NULL skb means the descriptor holds no buffer: it was
+		 * never filled, or axienet_rx_poll() took its skb and could
+		 * not refill it, having already unmapped the old buffer.
+		 * Such slots can sit anywhere in a ring that has been running.
 		 */
 		if (!lp->rx_bd_v[i].skb)
-			break;
-
-		dev_kfree_skb(lp->rx_bd_v[i].skb);
+			continue;
 
 		/* For each descriptor, we programmed cntrl with the (non-zero)
 		 * descriptor size, after it had been successfully allocated.
@@ -264,6 +264,8 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 			dma_unmap_single(lp->dev, phys,
 					 lp->max_frm_size, DMA_FROM_DEVICE);
 		}
+
+		dev_kfree_skb(lp->rx_bd_v[i].skb);
 	}
 
 	dma_free_coherent(lp->dev,
-- 
2.47.0

