Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600073;
	b=XzYViSP583Mcz96SGJF4PyscUVCC8o3vtSn/vL8rsMXnbTvJqeuf0nPm6bSOf5yhqjkk
	 inTv9H4FCxm0YkztU27lJ8slFOyaRSJeGoUZWLpEbYgKgN95GU18PbR/BFOSMGvpkcIN7
	 sIHSqoke39UHaSG5YBvBHU/g+4YTRJhTDOkZW86ah7Keg6XEGc9ySjj27zCUa89dq30wO
	 SZYJsJ2DSlmwdrdrTPU+gLrCc7o25QWL7lanO4vjJlkdLZXqI/sJ2bCd/U2DwefpxY5F5
	 S6lqXy90Mexm2ezHhtjBI9WzrYHmF/MlgSD8NoeuxUpPnE3DJarKmoeC5+h6rgoJx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600073;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aLumz5CHjOJTllo97qgVcnqY9y2ht9c0L800dC3uAtQ=;
	b=MPrloInzH9JIHodqJopzUo/UsiBRf7vBsfFYwh9VtktyGb2oSs8g9Kalz3SVFJaxEFOf
	 7rApbw0Ozr3RqvzRQxfBXd+FWTVw7UjsBDGDYkznSxmuvKNCDCS49s5pJCdAuXvoylqIG
	 xUze7JR8XD/XhEaN2ivNWCc4eEkFdIISggQm1kHXlE6TqLMRIBF8O6B1MIbmoTojEr0nd
	 7TTIkhZ14Kl4Fv6WPOhr3JM/2wMRh0+NgyrZsIzGjm+zmFDfEzSf/x835RbkijgVTnp3N
	 aETXFm2zPYG4fbIrOWHEVKydkK7ag4GIdNpeot2p0KdsASxa9M/2dIp/lkA7ugS1znQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=X0io3Ygf;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349D606A8B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9349D606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=X0io3Ygf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aLum
	z5CHjOJTllo97qgVcnqY9y2ht9c0L800dC3uAtQ=; b=X0io3YgfB141+Z5RXvbU
	a6Hh228LbvqcyoDEnE7oULDbMrb8F/Bwok0xAcmMwATLrRhMbfOEWW6WsVjr+WhC
	4XbKvH8deshYKS9sI0Mae7xHHiv2HvY031n8bUP8SU4H/aEYUtfW4KYqfzwf20GS
	PzV/mdinm8eT2hIOrftuumjaeanHf2oStXe0UHdpKVqhzImA/R/pnGyOfLWkFcub
	mGc0dQ/2QhlF5qebLDbimUuRi0ILu7g7eGEYMlIF7LXx01AwOulRIsmh3hRTh4/2
	829Gz+sYCPG3FjSzQKPlGGCtpqQYo7ZJ2OYGATv0EgDQwPDpUwtEyXYVAq2jI++8
	vg==
Received: (qmail 350957 invoked from network); 13 Nov 2026 21:01:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2026 21:01:01 +0100
X-UD-Smtp-Session: l3s3148p1@qY4m4y1gcJIujntX
Date: Fri, 13 Nov 2026 21:01:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
Message-ID: <avdsfFHl1Eoj-2i1@shikoro>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>

On Fri, Nov 13, 2026 at 11:14:52AM -0700, James Hilliard wrote:
> Keep chip metadata and controller storage alive until the final MTD
> reference is released. Unregister and disconnect each published chip
> before releasing the resources used by its hardware operations.
> 
> Disconnect all chips before dropping runtime PM and transfer buffers.
> 
> Run NAND cleanup during disconnection; the final core-owned put only
> releases retained allocation and layout data.
> 
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

From what I understood from the coverletter, this seems valid.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Miquel: can you test it? My RZ/N1 board doesn't have NAND.
