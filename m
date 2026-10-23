Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785365;
	b=DPs2V6UjhO7W8O/tyR5G01nlg9bLTGHbgI+vg7NV8tNGa9GWTmaePgzUNLMuJK2lNFXU
	 dNTkOhdALJ5xHPvpocMoYBoBEdwbnKvSrDNzYdM3kKhNy8phIKL5sZCwburjqBGKpiOva
	 5BTHgYxZHdcPzrKenHwyyowA8dIKs7dSW9uCLxNkhRMdLQgQ7M4dGDLM0ATSSNMqeU6w9
	 vSzY0qK4kw+KQhN1aaaJsjg7tECDdiNHuxANAHCfWsP1zupbYNknwtk8LJyCaloYj31ql
	 g7aJfvwA5Esm6CAknKtXHiDff/zcCt+hAsmjtBQov7zAYhGJbTStKA82oypUmmpNXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785365;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xYibKUXUGyrTSXdXuSUxNYcCPjzxvN7w1HBp6cwIiM4=;
	b=j2+XLla2PxTRh2srd/MEYmJPXpF+540lVy2GvMsK2nvq68BH19HFFlWipQZUtCB1fnwL
	 N1DIZMQMzEUMBwvs7Y5aTnOpeRskBjZ/HrKI+k4d0ITwvz6BHMOWA88K43Yf8ZmqtPiRu
	 EbirVPie4GHoT6z0aFX33+bBC+z6e8KAU30Rb5+OY2iXErU8p5dGONMLNrTf0jj1XExjv
	 5+kDEOaXlyu0b2LRz7jCzQJe7EpZiE3cQG2DkU9OBXHOAzzD0enN526+/jhiJorizuOJ/
	 +oQgmG8ejeiN9mXTi4kB+CDPh26JzbyzWvpxovLajNHHm1FizWm4KqDtiJ/tLjfwMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EmztR2+v;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795260A382C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3795260A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EmztR2+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785362; x=1793044562;
	bh=xYibKUXUGyrTSXdXuSUxNYcCPjzxvN7w1HBp6cwIiM4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EmztR2+v8FKsp8yZS4Ta4T4oo4KdTrKPukFY5vNPzlqPnc0kN0KHg02CN54I6ChkC
	 /D9xkrUWT2JDadsUOCsHoqFuztjBVf9enhZXzHgil+MFIQpcBf+jgbAH8PLuPDRpQh
	 73l3SRsmnOzkOHkFKCsEL/rX0We1xty0YzW4G+f+ncsZh6UVPbby+qEJp7GWgAZane
	 pAYP2VMgUZX32tQqJHCwXnfDL4u6f5fQIfkfjV+MEvYl/4u4TzfezXDBc+5f8sjsF2
	 GqMIclAmpxHxwLsECdvLPl9r86bqgWRQWld3invQybdWa9akHDlu+nYztUcSb3xm91
	 gLXzzbpeFCFzA==
Date: Fri, 23 Oct 2026 19:55:58 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 08/11] media: intel/ipu6: return an error from ipu6_dma_map_sgtable() on failure
Message-ID: <20261023195446.22578-9-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 6c1b308bf559afe3008309f96493f7f81b8d2a54
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

ipu6_dma_map_sg() returns 0 when ipu6_mmu_map() fails, but
ipu6_dma_map_sgtable() only treats negative values as errors. On failure
it therefore sets sgt->nents to 0 and returns success, and callers such
as ipu6_isys_buf_init() and ipu6_map_fw_region() go on to hand the
hardware an address that is not mapped in the IPU MMU.

Return -ENOMEM when ipu6_dma_map_sg() maps no entries.

Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in dr=
iver")
Cc: stable@vger.kernel.org
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/in=
tel/ipu6/ipu6-dma.c
index a923a1e4bd..37b5c25259 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -459,8 +459,8 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, s=
truct sg_table *sgt,
 =09int nents;
=20
 =09nents =3D ipu6_dma_map_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
-=09if (nents < 0)
-=09=09return nents;
+=09if (nents <=3D 0)
+=09=09return nents < 0 ? nents : -ENOMEM;
=20
 =09sgt->nents =3D nents;
=20
--=20
2.56.0


