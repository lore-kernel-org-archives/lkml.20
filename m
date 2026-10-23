Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785372;
	b=dW2fjxU0Ei4fhv1Sc0wwHvCg2GNuc+IKVYJYIw8z5O+UR/6Sathlzx19ygHoh1EGVUkq
	 zjq1WYjh4PbSgycI6KF3BRp8SUP9ePZjF55S4K9845mFyF9TuOcAURsQGjfzyTeXcrjN7
	 f8jsEDxthdjOpXg4Ryiqsn2jyQu86jOl2w9VleBV5UlN06apfvB5jlr6Gq+pXO1Zo0e2O
	 YHBUluVKaFj2zf4WolKTtDXRS9g6Hj7vn9YeEWxg0e4QxnfwNomCxo1meB39SiB7b8zhr
	 SCJkr0r8eGvYD3eUo2Dv1uNjKf0+vFCDJ3xJ2VqRe0AdT55OYhSY+9mK/cAUGOfCpNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785372;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lCETcVajyZpAk3AyXA1QIP3jXn5xFSvwyuG/CW+/QYg=;
	b=k/nJ1lGSHTfSyn5nBiZbKoOzYFTgDaMZIWZbvnLW8EB3Wl8wZ7p0HAiAXiT5/iGCk3Ci
	 QArLKN/IIbtAV056hGIpgLmNaXQ0+uv3a6DgLQR7FMPospeQbDOVrNeEotUg9PN59mGNm
	 7Hzg0SmukqYtEvLO5Oo9z28xWTsWW8ioXpGK49Bfi0wYPbo9Ovh6VO/Qx6PX9YWpI/ruY
	 c4garvaREY/bnMLru4Uuppz86qK6+suTimQ53ddIeYAKiuXW6oaLntZ4bfjnD81HyTapu
	 iSlR1KrBCYBRwa830O+tSdAP8gDzVcPTBu+tFU0f+XFTC3751xul0Ctr4bp1SN7L2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="RXQdbp/f";
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1960A2608;
	Fri, 23 Oct 2026 19:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C1960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RXQdbp/f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785369; x=1793044569;
	bh=lCETcVajyZpAk3AyXA1QIP3jXn5xFSvwyuG/CW+/QYg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RXQdbp/fANKD9d9ar5CR3gwIzVtDwqqE1wUROft5kd9N/CjD2uomFZgqCTX011H4B
	 TKtsmhOGLV4fg+sP2RjjEWW+WhmIZpabjk/Y++i6QlVu+IIbevXnWL0XMZX8j2lJ9C
	 4YXOVIsAkUBNZpbqcSpBD4C5AjVyW6RHS4QLpBsmIt+5f339I1im6j3n+w7hENdDhs
	 G23yIAvwHKZSGckQCMG7Rtw/AB9Na0k8Ojok00iQzQa21Yd+d13Eoh1o4Y+AOsTf/C
	 wlZYnJcGi/Z4tBgr8FdQTLazVltcDrPZeDT1a4O3OtuuPNLkei6jGwEl7rRi4I/jpS
	 5qNRA/4qfxHPw==
Date: Fri, 23 Oct 2026 19:56:05 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 10/11] media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
Message-ID: <20261023195446.22578-11-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: ce7d1d32a23e3a064cc038474bbe0f39e5a65a24
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


