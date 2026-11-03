Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739758;
	b=QWPZZfR9ZKJErIbGp/znZCKBXTlASBl7NBKyw7/S1HwUa9W9mAoM6bN4x4mUJNQgEz+g
	 oOn3J9Wt6FckTf4QYkS+ZchDBrOVGwNk2/gW6kWsvMwniaEAN2nmvM67sRkE2INt5aYfy
	 TMX8OQsN7NbjOnedBi59tGJvBFJkQ8P8S7xM/FWcyk5361rF7q2rnEVeJh4qUCJmR4Re8
	 +l/BdPv8HI5kqCXUr3BE70xKcirNsi6g+lqRZjhzRW7MKk/1QQcxscbwGrKAT1ibBwa9y
	 PuyFXPCwZvfch5KGbz171asXbaP/EoUMvvZTr/Zd2DX46UleKNVwRBTDMXIdipPGzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739758;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7W6iJ4PEM/6oQdg3L8UO1TyccjQBYc6ORMBc+BFA3GM=;
	b=TkWziTbxtgJNBVejpVMbI89kDRT57WifaiacC3sHhtw1kIy+4pwjUOhXv5uYhdds4zxI
	 3Tdx+cAX8jVx5u8C0x7nHgBQNTeHjbuqA9yyhgClrH94VctZbxbqfU2bmVOqe0kd0PRZ8
	 0ATfo7rrP5JzFpBjLEhBh/TJaPFJaUKuhdpgoOLev+Tp/MtMrkMCWPhqadbHGBm08fjTX
	 UTlRuHvJwADv/icOI1NUUv96WlrgtpbR35YuKTl9JZWyTMrku/tv8rbaABtNAxJ+6FAkM
	 HCkyEXtCLF2Nl+n4ym+G05mPhoXImqhKW2ngx3Mn+S0YVZF4FUNwqY+hF5Ok4nnML4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=CndBKG1K;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C5606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635C5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=CndBKG1K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793739753; x=1793998953;
	bh=7W6iJ4PEM/6oQdg3L8UO1TyccjQBYc6ORMBc+BFA3GM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CndBKG1K5X5IMPct6PIuPrD5aCGMpSP3clItMgDTnuyNJAHpk/youBP4ZSsXebws3
	 Lh9pOlxeEDdic7EGWGoLiT9+13OAc7BQvM8h626ZX5xvCuVXUv36mXpIQlXQkpp9W6
	 UE9VA0+OnaX0bTtV3T+KyAsz4v8BQCL4bqHaU9VYdOvh4a0wAOrDYnYC0c5+9oPa60
	 m4+3E7Et40Q+XRgGjZN1yyMM/yRtDCzoC7wlBqpbzw/nU9SQ0LZ7qZ6Y3sVJddvj9u
	 9ZWVHGEwEzVE+vED9rkn49l166wxrz4BMJhEXtV5OMx4EU5/L4C4LJLxJsHcbW0ikD
	 SUoCxAJV47niQ==
Date: Tue, 03 Nov 2026 21:02:25 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Valerii Sokolov <valerii.sokolov@pm.me>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/11] media: intel/ipu6: return an error from ipu6_dma_map_sgtable() on failure
Message-ID: <20261103210132.1568564-1-valerii.sokolov@pm.me>
In-Reply-To: <auUeDraiy9tu1NDg@kekkonen.localdomain>
References: <20261023195446.22578-1-valerii.sokolov@pm.me> <20261023195446.22578-9-valerii.sokolov@pm.me> <auUeDraiy9tu1NDg@kekkonen.localdomain>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 694b43e680177d713e0be172ce3a76568143e461
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

Hi Sakari,

On Sat, Oct 31, 2026 at 12:45:34AM +0200, Sakari Ailus wrote:
> Hi Valerii,
>=20
> Thank you for the set. These are really nice fixes!
>=20
> On Fri, Oct 23, 2026 at 07:55:58PM +0000, Valerii Sokolov wrote:
> > @@ -459,8 +459,8 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sy=
s, struct sg_table *sgt,
> >  =09int nents;
> > =20
> >  =09nents =3D ipu6_dma_map_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
> > -=09if (nents < 0)
> > -=09=09return nents;
> > +=09if (nents <=3D 0)
> > +=09=09return nents < 0 ? nents : -ENOMEM;
>=20
> I think this has been written as-is since the thinking has been a negativ=
e
> error code is returned on error. So I'd fix this on ipu6_dma_map_sg() sid=
e
> instead.
>=20
> dma_map_sg() returns 0 on error (which is probably the source of this
> discrepancy) but I don't think we need to align the error codes to that.

Good point -- ipu6_dma_map_sg() already returns -EFAULT and -ENOMEM on
its earlier error paths. I have updated patch 8/11 to propagate the
negative error code from ipu6_mmu_map() in ipu6_dma_map_sg() for v2.

Best regards,
Valerii

