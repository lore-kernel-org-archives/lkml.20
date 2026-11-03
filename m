Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740284;
	b=2EElhyesqrgCeaZ60JfydPtkTkvMONNFb6UNXylPGpjd2UhC1UU95hZfW6ypVAr8vOZE
	 LuErmkr7tC4Jxlgkr+XfazJBi0qEcV6aph1pgWgYhT7lFJYVq52atrifDrKOASKh9ZZ7n
	 7YPd/kM/OhGQx8vmdnGWScZgyQVFLT83Wi4tjdtYLDPuHHVHjYgogdCOR8E9NNivjaakl
	 ckFw38a4Oksu/t+FPSDN3QiYdD8fS0vljgyp0FevBv5Jg7NWs2/u54Mf9K16DIGeJ7Z2V
	 SwIbUPbA6zBP8F/GgPGyZjq0oS0s08wToq1EosYFvCGUpYH/DxW/6w6KfjIfKm83RlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740284;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kHensUF1xdf/8688ORxM8ArA4/N3txuYlaENxML7r5U=;
	b=ozZkKjODuqdZs51flG6cKaoXYiNWpKmvf8cbK8sgZBKHoueUZcQvJ1VS0YTUQJEfa1k2
	 8B4YgrBTp5O+e+xBDUMybbWCX7wKvFmyNkXiuhJY6vZTR2hWfJH7Ej4ZgLhBO/TfvaCnl
	 0HyAf4GrZmnagM2iwe8A6FUSri/Y1riwoL+oLynvXmlWNNtBsha5S5zkwf+N5v/bC6oE2
	 O9gNCOGlCHhLRBy6uQcTxPAgt8GezFjgSdrZeUCI37BQ2NS1rCNU3Wv6plSmkEMPqxbsV
	 fdwCeibRJqWCJKKsQ5lracoL7+QVbc9i2QYaLMXusQ/YZRuXsMspF/7jcvfRS1J2Szg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=bhN3FiuD;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7299606EEBE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7299606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=bhN3FiuD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740281; x=1793999481;
	bh=kHensUF1xdf/8688ORxM8ArA4/N3txuYlaENxML7r5U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bhN3FiuD2t0My74z4lBSBKJKHyd+O98mPzrmzQBTVKpRJMUZDdLxLrBcJM5i4GMxv
	 ezUMxRtCaZOKgxttdricRs7Ee78ANCLgRwSuokTgbbxycz3nFtFzuZmfRRXZRCg7Dm
	 6IeurT4LzHN0SlHqNdfB5+61vXvN51NIUaRG3fhIjfg0KOSzSfghBhilqtY89plF6c
	 mU2uR2zySBgCuZCEIFRJbwnuMie6bThcOHw6iyF1mIIFoSCFRe/aYFJEj5iX5NuBWI
	 dCGNpVmRdAC23sq/8Sgkpp8sAWOQqompIaiCHgORuNzW5jQUfvn9PWt55luZONyAWx
	 G/WbNqNTkxE7A==
Date: Tue, 03 Nov 2026 21:11:17 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 10/11] media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
Message-ID: <20261103211031.1573726-11-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: f580b263e855500e7b9e5b964e66aa138d38ce9d
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

ipu6_mmu_unmap() reports unaligned unmap requests with dev_err(NULL, ...),
which prints "(NULL device *)" instead of identifying the device. Use
mmu_info->dev.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index b1c34964ce..f21f3a1e53 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -593,7 +593,8 @@ void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, uns=
igned long iova,
 =09 * by the hardware
 =09 */
 =09if (!IS_ALIGNED(iova | size, min_pagesz)) {
-=09=09dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
+=09=09dev_err(mmu_info->dev,
+=09=09=09"unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
 =09=09=09iova, size, min_pagesz);
 =09=09return;
 =09}
--=20
2.56.0


