Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740271;
	b=cp9isvyn2Xe++M9pUBZebKJy6Z/vw0Tq/hypCCchCJqLPhkarn59O1maaS57I4c9qDQr
	 ddmJbdIhN83ZRSK0kL632PkgxLkHdauo0fZSRMhvLingq4HvZMU/afnv2TuFQJIiH7S8u
	 XRDwUySRaHVVznF2pNocTN8aFmvkMrfXmIxoWIB691rAEI7W8+mPzpkjPDKqjxXKd6efx
	 ejwm0PVqFk5qVntaPoL3SD7sXvmolc0gxkqsGuUp/Cf6qlD0SB7qeJJ00ADoZqPIwovhB
	 w7uVj4NEid9S0feDZFIhbBplt3I6HlO6ikJ1hFSEix1ivlLNnVnZ5gJVeIMVOzPnpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740271;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LPjYozZiSMN/PsK7FJKM7k10B1MxOzV/+6HXqbOISfw=;
	b=CUYGszdplIxXS+36O3R/5bJaEMSQGJFyANvgDCtK3JXnFC0CyEUvyEIBJbSC+U2669Kz
	 vUeqA9xE0H3iKCJnH7uxk7kBC/3Oo0ii262YKxqXIDFEPwvE9mQQZbk36TSzb/je45r/T
	 4i5yw5DxcH6iV+zC39ZkTtdYNYn9L+ZvqA8N8dYrHPyBSSVC+EMOWQ5IXvMrIqq3Ch/Xx
	 J1Idi+pRK73X+caQhtmitm69mxlOAQPO23U7xMnqbxy9+pVvArEEG2CNF2k3uYnqX7P1p
	 B6lEpSv5nsM/QqoZPiBVarKRYUN1/TFr1j9L9YZSLgE/1Mj8lCO4GFch6+MJRU80cHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NtupSTwB;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE65606D813
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE65606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NtupSTwB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740268; x=1793999468;
	bh=LPjYozZiSMN/PsK7FJKM7k10B1MxOzV/+6HXqbOISfw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NtupSTwBftkL/j0vNKEgBfXeZZwrsKnBkCbAdM2nAPYXP32ilNNZJgkQNQRn1KkD9
	 LKxzpG0bla6N5oUxzTmfjV5a/dvD8iVXHuCfecdA1kaXwuIiw777Zmy8UMVWLZI7aT
	 eDALRB817UO/WFEL3BwHEW/o4coZclQiM1aRoUH7pngIZMeV4/b5Mzh1vkHVoEjX0A
	 aUphRNpbfmSYxDzyTLvgWAi1J2jEqr70y1dI4HFAaYUZLOyALuv97BZxsIaUgAEwFe
	 +l9MPaYztvUEwZYZjvkKbSNEutKqp5K+u54X1KEYINLScAQSCvvZoglLWwrYmBghBw
	 YJOvqCVI/uNYw==
Date: Tue, 03 Nov 2026 21:11:03 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 07/11] media: intel/ipu6: fix IOVA leak on first entry failure in ipu6_dma_map_sg()
Message-ID: <20261103211031.1573726-8-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 122c9768181599dea10e16ec46771d3f6fed3076
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


