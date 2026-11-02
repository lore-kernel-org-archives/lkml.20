Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631020;
	b=DDxUbiRBygoMPOMvlZm8UKV0OX00VsgqpQgM1wztSzvFPHdwkjQfMfSnzzC/l+lavUC8
	 CM/0Naee6BLgY/y0rehbYAj5+jAaA9/E7UkmYWeQNB+gf84xl++IaPV0bSWgslYtUaCGa
	 xQ2NQz4dGODpG4Zf5/M9s7gLfaKzy5vQ3rODmL/aWWiLNXwqB7rLPfN2goVwGqgwjFPBR
	 27NmPROIRFtAl7wTmBOXg/r9fybbL90UO8azsYM5ggAaojlgw0og/7nyjOjvScW1ftEKm
	 hvY0jVWuoPYYQMPYVhegmCX68NWF8IsK46ddPiSnbac7ZLtuXkDlFVK2KFKAb+aUo+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631020;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uhM1UTWuc4g7yfe725dymwVdxVySHHcDwAeuexSN2yc=;
	b=KBOccOWmkNsVido7XU3Sa0vCGss69ECCvWRPmKLGWgaF/MpJd0vhL1Tf9DVAkfm61cwH
	 MlrVqZmOI9/lru2YtZCdVOhd9saRcaFY2USF6nGa/2YKkdV/9PhnwIuo2gm2bwYMe8Pro
	 QVvYdLfKTIf1sLhMRQbzCpAdIcYiBqPmkdHFc9WGl8/7VshGVgs+bNEfKZH1Xdc6dMgP4
	 tOExm/k+WBv1a61TCX2nP9SE+SxZVS3QH2Iss3Qcp8be/GHVEt17f/lXqeFoRP/bds44F
	 5EByKh42AnfVX1qmC+AuLA7C2taj0kO4q8V1zh9glPZ6TX7mAltd2BcxBiaI94AmDSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L2N/YUsv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF034606B1CA;
	Mon,  2 Nov 2026 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2N/YUsv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EFE1F00A16;
	Mon,  2 Nov 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631019;
	bh=uhM1UTWuc4g7yfe725dymwVdxVySHHcDwAeuexSN2yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2N/YUsvjqd/tHl1+8rOb8n0OvOulRgpaoudqrAtZhLaL52QygC80DVbWfaFE8Wh9
	 h5htpDGB+I+nb7u8RsxE1GvdXO0doXtB1Oqmlr00nfyhO+jwo0D2EM+VrMcLYPAzD1
	 tZUL2IG8bDqpvrlfTY/ILmNK7Dr9C6N+9TO0n/INrDxSWaf3X16q/ixFrNz3xO6YrB
	 SV7gXHZEaeeiqUkQ7oJ9gA81+wqjqMAhrAzArb84fAgVfyuijDnjejSt0OhQBAMGXZ
	 URrmbhwVgwPKUFEDVf5Jjm+S3QzOxDHlwm2rGp0SV7b7upALWaRAnImmz5TBx8sjR7
	 S5ABUewfSLvLQ==
Date: Mon, 2 Nov 2026 15:50:15 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
Message-ID: <auijGRVEv2tzZx6Q@solitude>
References: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>

Acked-by: Marek Behún <kabel@kernel.org>
