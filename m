Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47F4D9915;
	Thu, 24 Sep 2026 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271015; cv=none; b=bKfhFeZNPpyUsqQdqKfZkPmjgIuSGLKLVjLOppZzRdqlyu//VMmRPB0IKkRQqGNFAwIBAvRnvVssdJ4s3b4juSdta3iZPDiVSixp+VaHvJBntpBjmHoUWafvIqGUIg104c+BOlnKSPHyGKbimEkwV/rbmsE6+hI+D0uwpgeWwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271015; c=relaxed/simple;
	bh=nvAFkvzqh+rKtldne6866Rnc/3ZmRNVxIJE8bcclmC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH7t5FIvBtxb21YwN3Lal+Pw/8Wi9I+nDx1TxftKQMOSdM7KD3n/BRKXek9hYFjvRzwmPhLjsV8CO0UGYfW3twT/5RAx6yPAllf6btvuz9b2KNULDHPPtr4MdMj0JJzUTXoActrVgZ7NiWN6U3ON8kQZwAvZdahVvQhezFvcFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOEfSRH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOEfSRH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CAB1F00898;
	Thu, 24 Sep 2026 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271013;
	bh=nvAFkvzqh+rKtldne6866Rnc/3ZmRNVxIJE8bcclmC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOEfSRH3LV6nVlGxHJtBF3th9C4OoizfyD46gcL8B0SmyJmJZfmYOHdGntZhMlWj7
	 ROACidVx92ettvCB/H998mBvXBt2dMFYfKNGUtaZTf7UxhhmxX8xtFFopy63tHB44Q
	 CljUzwf/xJ5lqF77mXWQMfxkAflylxOYwdzaMoyUzI8SjCiy+3XkLThN0stB/AVmdx
	 Yb+6x5N/5LB3xTu1z7rrcHcB7cAnTGyEQSQEjpnPMYCdKUQjasmzXzLhvaiDfE8GAZ
	 F2gVwGwgJDdphpv4UvEGHEdywFCYCHKvXq+PegTgPsnuRou8WvlULzkcd5kj9ynSfd
	 mZPMbs2Ofg2Gg==
Date: Thu, 24 Sep 2026 18:30:09 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260924-duration-glider-23821a683645@spud>
References: <20260923191449.2204388-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yt1E4iQNtxZJRtOo"
Content-Disposition: inline
In-Reply-To: <20260923191449.2204388-1-robh@kernel.org>

--Yt1E4iQNtxZJRtOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Yt1E4iQNtxZJRtOo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVeIQAKCRB4tDGHoIJi
0r6cAQCSajiXCPf2QYjQtwcarboTrsvtzZAAEayZxskc19d2XAD+LD8hWXRPbcFF
4ME1NTsLqi1Dlu7kIi1HNQkOtoZoBgo=
=s6AX
-----END PGP SIGNATURE-----

--Yt1E4iQNtxZJRtOo--
