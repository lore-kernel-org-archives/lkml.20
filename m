Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987884;
	b=V0p6WnoJFJ3rsi7EMnQEXxihofGgd35QYLJVA23TikwSIQsQ/ZgPUnqkKga3OxboRy/y
	 Ax6LV3Y7AGRtXRlFbfjiCTDvAW253zA/SHMCh2T/FupoEEj569UX+W45OiM0GquwUQeiW
	 DKltdjkdKUdBq9b04aZmWkNdRFF6p4F/VoSRk9ykf3q243A7UFankk8p2P6VdBPdHctw2
	 jh4bkL7G+V1AVDCr5PDSufclkVotZrSwBFOAnREsfvCDQkJ1BrvEiUepQnFHs+mOOSdHz
	 nMG6v31xSRhzDLN/w/mwifxhlvvGQEuZPrTWn9iGgJk6eOsNvsSH+QrqoDXIbbl4FYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a15VN+jCu3B1XSBa24cW34JdNvW6biC29j8hroS+/qA=;
	b=i/qk462yR/uqnHpj/QGhHxhFfXS0zjqrGhekcBawb9S9ZrtQBUwbNXBn89vcBEEO2Is4
	 7umwEx1UL9REDYSERCc7jC2xTovTidP/s+jF53GQSHk5Rx2ZzrwLb1t9aqh44kBc43ERi
	 D3uy4cIMSZMgi+vpH8bNRLMX3bx/vi1pOjZJFeAkTlMt1bseT6GTdJ4IrQZU+SihFXX4x
	 EfKDmLD5piiqLaP8eZsTRAuz+1EkieLFJ0AH798K99t6wjUNekKpG9T2wsirSjDtm8iS/
	 tl7H1sZXXPJUxzU0vWqo+YnJnFPs2Pe2iGXDm5za4V/+GD7t8lCBWvGawumX66Lm0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MDnmLk0G;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA78606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA78606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MDnmLk0G
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso396589a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793987883; x=1794592683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a15VN+jCu3B1XSBa24cW34JdNvW6biC29j8hroS+/qA=;
        b=MDnmLk0GiJDtRvTa7rGzfrFLnLm5HhiK4yYkw80BDldZiGtLzXNUJmdv+kySQeX1VP
         1lflO8pw3GDwG6HuCB2iT/IUFuUKWvUgbxPGNf0LtgPdS4MRr2tLgGSrKnm7mU2PAz/h
         y2jNeunkWybBSYM2Tf03mTs7Q0Hkas1jq8ysHjx6frlAERZGpsB4mT8JcKuucb3znPgU
         Vc2LVM4ZF0odCZxUFo6jql/0oo8Z54oIBIZ3v3wpMypdzcwmHPilW/zVL4s5ScmTGrrw
         12a04uFqZo56A0FJ5ApPV48aKCTGenn597bpFP9+2xQptfYQhzSEwFYnr0WNhCWsqiG8
         2Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987883; x=1794592683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a15VN+jCu3B1XSBa24cW34JdNvW6biC29j8hroS+/qA=;
        b=uOCNCFGKRSoryzkOlGvJJwbWqIJ1a2C/gJD4XPRZD1kF074XRe4rbMr3/qhw2aKBOE
         1Py1RoREdZ69/aiAYM7ZYNRa7aAUsPHyvaoOoYTGFnBRMvIw5XC29d6C0pGBYMM058JC
         jOGOizEthqUMW2U83XyjR5tJVXVZ5hXmKCx5194975MgWHqKxxq+GIG9ip6uYp/HaWRL
         eXro0aX9SyvuzHSKQ6E3zMQEumPGVFS0h7aTNnP+GyYQFUAahV/vbBNQkYuEenHhzDFM
         YE1r+H/zedCWota1z7+qt6MRwfpwGtgEdfDtr4rW8o1sTf7mXtCkon5s7Q2MhTs9qdDG
         h/pg==
X-Forwarded-Encrypted: i=1; AL+hErE3AelGhd2EiGRNS/E0iiNhsidTFssRsK5+cOuhGaSQFSiZwrY/xxw9irHvSH3ibWYFq24IUoa9OtuOmVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oDgUWxZji+/oP2ce+xetXgrY8cq9TbWoEA3KkSKHFiTuOVoRO
	XuXp+FMcNFTGAODEMjtblGCqVqr9h2NzSDGiafM9mgmmh1lUpPRFJKdVwi3VnfsAzLI=
X-Gm-Gg: AYBFou2dGrQjKlF8QP0B+82hyLKyPCqJCmJrJlksPnsXqGs1YuulgQL0uUKGzYpmcpH
	cirzsyTVgCVsQT13TyyKortSx6p1LKDuwDrPdnqLg2Fug0IRJqDplzosCMLID6F+9yeAG34dHbG
	j0SVJn2jjJZEP7BfP4CmM+VmEud2IzBDUcLCEAlHVxEHig0eyNz5qo5fdnWwheOvtKQi1d3i7Bi
	P5iAUcgcCD2ofrXuMenafwQ1X//ccSJAAVndet/yDpIobJJmbVvff0GwbA+OEUcxOIYblkbIScl
	hJhOLwO+oslfUN4elrTA/eHEUtjjdXZhlMdT/kbCD30/hObzviIIcRL1iQrp2lvVpqKZI5Nb09f
	BaVG/R4Lc714poNCqAUe4HLV5aQjRerY5g4tfqOkdOW/7QGETPsQuzGhoXT9/Kyn0tS2z+23ulp
	emlH6pIxlg/HiFCirhIxsK5ZWQ3t62/p588z0G+gDg4HwWN/0YLvv4q9IMablSP9Ksz67VoDhHa
	o+5hm4l+6Vc6Ffx1GVsvHiDGXnqSOExRDHUPrmyiiwQLYKYR0W+cbJFAr9GbE/UNcM21n4UoZmd
	6pjMOnUXqzjMz0g+eymz8j8z80frnWATqsfadpQ2Cfa+pPt3wJg+w+NGI2ERHbKI
X-Received: by 2002:a17:90b:5703:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b0db6f46bemr3110575a91.34.1793987883162;
        Fri, 06 Nov 2026 09:58:03 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70661c97sm891550a12.5.2026.11.06.09.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:58:02 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Joe Damato <joe@dama.to>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommu/dma: Skip iova_to_phys() on unmap when unneeded
Date: Fri,  6 Nov 2026 09:57:43 -0800
Message-ID: <20261106175745.3362057-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106175745.3362057-1-joe@dama.to>
References: <20261106175745.3362057-1-joe@dama.to>
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

iommu_dma_unmap_phys() looks up the physical address of every mapping
with iommu_iova_to_phys() before unmapping it.

This is unneeded for a coherent device that does not use a swiotlb.
Skipping this saves a page table walk.

iommu_dma_sync_single_for_cpu() already skips the walk for these
devices, so do the same in iommu_dma_unmap_phys().

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/iommu/dma-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index a25ee287a5ac..c4a5fac4f7cb 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1260,9 +1260,11 @@ dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 void iommu_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
+	unsigned long skip_phys;
 	phys_addr_t phys;
 
-	if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT)) {
+	skip_phys = attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT);
+	if (skip_phys || dev_is_coherent_no_swiotlb(dev, size, dir)) {
 		__iommu_dma_unmap(dev, dma_handle, size);
 		return;
 	}
-- 
2.53.0-Meta

