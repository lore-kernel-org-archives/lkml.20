Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785362;
	b=a7KMzTJUMEhYrX9hDkICFqaCiujP6DlWKhnrmBCnNM6YH/NlTIHlPjaUALnLfibjA4kK
	 l1OeT32YXUh1zf+3oh4OaBiX9E5RFMD5A60xh7MQLzB2X94MHHDxtRC8sHuLBW49NQIam
	 OutJ9+XMX4Hn72do64GubOXHn0VKh3jXOQmaAP5lcy53VBYFJVVcpbhUjCSX1k05Hmb/I
	 D52bXTqBpW2PA99W0YoVFkgfCiveSjKU3+F5EiDPazh05gHcluJrQuCWwf8k9QAKDTdEW
	 ydkV1AcLE3Q08VHEgOhltHuQnyLB22KpIQMhHv9VJ63uAGUIKQnAPYzIns/Cz+zn1aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785362;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=UU2/l9uiGTJ05ANLh/MkjKB1i1Yw98Qmjp0XD98bKU4=;
	b=PqjI6FA4x6htsihjmagVj28rtXBKGgct9gVJSxpbgkca0Q4y4qDmEOihFQ6Kp5Tg7ya0
	 XPj/AAJSt4qrZVJKMSG98tB/+hU1tM6dESQNkJQ3VVt+MpX7wpYbq53tC1UABKCDWtHMm
	 2E+XNQzUTN61FJrYMbX5ja6ZcWmTOK7l9mLxVOShy+8ITolq41t+n7dPvHw8HfV7BPNqN
	 J/ubYFGcbjdNayrTiNHJPX8x5X8RYwOWuxhizkPpF7e3t5H3hcXmS4NN1FsncRqyXzAhJ
	 8/txW8fTjeTsHzKUciSSCD3k5LN/tsyAIdsAKAiSFh8rJdb2WkyaE8JtOFRDOH6QCkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lTTzjeLX;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD708606A928;
	Fri, 23 Oct 2026 19:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD708606A928
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lTTzjeLX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785360; x=1793044560;
	bh=UU2/l9uiGTJ05ANLh/MkjKB1i1Yw98Qmjp0XD98bKU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lTTzjeLXfiZIP+FQtMuIBnrns7N4jtaI5+7Kckn9z5JPuN7tCv/i06JmfFAdnZvvp
	 vNJCYDiPFWE5HqiZAzpnGyXk1U9ywAUdV/3+P4jk7dXnWvaJa6P9m/R4mG3N8FHfBE
	 MMU3oLDCoK+9A8zYBZfVtSiPtb6z/EGoW9SSjkfv0GzYVC1vHKAyvyj8HEqPIB32Y3
	 WT7/QWH7zjcWkS56VY9QTBZywGyOWnyIoAFLyVNo2SxxflQ6KiKYp+fH2bfXUPfZ2E
	 HKrvkgSNXzgoUAADnqSHotmN3hOH6sNmip5wzftLMgXT/HoihN2MGpjFkqGdHEq+U5
	 RSmUW35i8jqpw==
Date: Fri, 23 Oct 2026 19:55:54 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 07/11] media: intel/ipu6: fix IOVA leak on first entry failure in ipu6_dma_map_sg()
Message-ID: <20261023195446.22578-8-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: b47286ea8522e8e9334f51613acfd0e323a5609e
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

If ipu6_mmu_map() fails for the first scatterlist entry,
ipu6_dma_map_sg() calls ipu6_dma_unmap_sg() with nents =3D=3D 0. That
returns immediately, so the IOVA range allocated with alloc_iova() is
never freed.

Free the IOVA directly when no entry has been mapped yet.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/in=
tel/ipu6/ipu6-dma.c
index 90f530a937..a923a1e4bd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -444,7 +444,10 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struc=
t scatterlist *sglist,
 =09return nents;
=20
 out_fail:
-=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
+=09if (i)
+=09=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
+=09else
+=09=09__free_iova(&mmu->dmap->iovad, iova);
=20
 =09return 0;
 }
--=20
2.56.0


