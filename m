Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785367;
	b=AHJhrDkSm5xW+NaJz/ifw8QKZe5cWxW11Q3vzRHvUUgCXE/UPnSW8+jxZmhARebGph1+
	 wbc31PzcBawYwjQzNgqxF3oD1MDgaNJRj7OiHpkPJ211Ccvprqj8MtUAXi0VgsXhatuVY
	 pAvC1XuKY9WxwS9VGY1rhYxsCjMx+Q/Qj7Q/VVeewNAmdde1EeY3FV0Cfd/Jmg3IqF3Hu
	 Q+T+fSab6H4vRKwzQNFJXwgbHeSTNerVJg5Vh0SEFNXVeuJMjm0/fcgecBn+ZxP+uI4YH
	 XXYsbXHFDHlWpJtAvvdc18d8KkuSbiWp7cMZZ6uFk4byq0PdCBfy5Ecq4T74XCKUXRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785367;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tUnI1u7sr3vxQ+9AJ2z58btSAD+OaPy1Lc3CTeutLSY=;
	b=yUUmMpI7dcxkedBresipty8gPzgAYxyOr1DwWenSJz+nHGdiX8O0ubwXa9vgzpmfIMgc
	 qeJsrEUOtQudr/ssfWLxz+J8nPbdDbQrujom2U07g5zD+b8g9zB2G1ST6kGVKdrdjukn5
	 ndOy836ixlst2rz1+igBTCFOdZFu1BvIZ5+vCARc962EBM5/vU0nck+9WcEhUbU/DGAKf
	 oqkvUPOjxkiPfrcZE6jy79xq8+/dM8m3YYwL603il74msen7M4DCYq/eu/+Bf1ryX5WJY
	 2jylNTdpyQd3/3SuENxpjYFcXqW6XzvynGb2nNWHSFCgYdk5gBsUA7JT+QTMCV6qUjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TgfiZytr;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B7606B290;
	Fri, 23 Oct 2026 19:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501B7606B290
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TgfiZytr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785365; x=1793044565;
	bh=tUnI1u7sr3vxQ+9AJ2z58btSAD+OaPy1Lc3CTeutLSY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TgfiZytrdnjfIW3J3U1uu1mNIUCHZ7j4Wt9p1s5Hr/MoidKJUSGlHX1W+kwlysWgr
	 bXmDTMScdI5nt0b1Wn2S3Gw1MQ36ri6WMrHn99eVhlVBpa3YbXMHDyVLwnOfwxfM7W
	 BZqaKycoTpATjQuRToenrGZ2j+c1oH/IMyFQ1l8i8/BcK2K03mfbSFiJThDR5+ikDO
	 h0fKjJRTgxQooFKQrHWTa9iy1WX4uPqwi9catI3NvSihbLFVl8A7u3tgxg8hqXR9D/
	 dGJk6eGRIvzkxIBs800b+5FU7biThATULGqplKjpCM+se/ZxZY8BWgAOa5241a+vwy
	 cVos8XDH+2Rxg==
Date: Fri, 23 Oct 2026 19:56:02 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 09/11] media: intel/ipu6: unmap the dummy L2 page table in ipu6_mmu_destroy()
Message-ID: <20261023195446.22578-10-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: d30bdb6ad93e605b0f87c8a6993dd37d13e3fb2d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ipu6_mmu_destroy() frees mmu_info->dummy_l2_pt with free_page() instead
of the existing free_dummy_l2_pt() helper, so the streaming DMA mapping
of the dummy L2 page table (mmu_info->dummy_l2_pteval) is never unmapped
when the MMU is torn down.

Use free_dummy_l2_pt().

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index 1a564ceb74..b1c34964ce 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -668,7 +668,7 @@ static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
 =09free_dummy_page(mmu_info);
 =09dma_unmap_single(mmu_info->dev, TBL_PHYS_ADDR(mmu_info->l1_pt_dma),
 =09=09=09 PAGE_SIZE, DMA_BIDIRECTIONAL);
-=09free_page((unsigned long)mmu_info->dummy_l2_pt);
+=09free_dummy_l2_pt(mmu_info);
 =09free_page((unsigned long)mmu_info->l1_pt);
 =09kfree(mmu_info);
 }
--=20
2.56.0


