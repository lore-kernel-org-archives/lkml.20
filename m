Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506514;
	b=XGOw+JcY1oO9So9TYzvW/Zc6v05kmHqctLB4FLVr7j2Iz9n/IPbYg9TrqKZJ4QY+CqCx
	 m2T1ezNPtnkO3FjXCfEVxXWZOLuYX14DIEG1tL0Ha1QtU8VDY6WA37kw6xnsHZwB050pQ
	 qME8kBOkCYv7nW471k20sk6e5olTyAceDRz6CTB3FoYZu45bImQ/x97MUvFpPqwyUP9FC
	 93YCur5IZX1fkr5gQPe9xfd/fs+ubWBRAu8z9VPhesdsx/utou9pCdSdffsdvpDMCTFRj
	 i1mLqsVgAcx4/enhJnkjND2ohJDlzUMtyNYzfLf+ny0CyZiUlq3JtWCNQwEn1InDQ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3tBrz/qTKCl8kHYKF1k44T05Oj35LdC3Rckp4CQoOnU=;
	b=H64EBoVg9u8VJgzqMlDYzh4nRVlRvc+mYpCxDL5IHMdulFk8wybSCCVCFC7DoXUQONPj
	 kXXGVfsdUO+N2huMuUpExk0u/rdEzX4gpbSyJq6BC4+Fz1Lr2gJwfcO+Fp8WCsGvK2Xa0
	 6FLxSa+JZf+iFNvy9Or7UxMsX3VygwSp/CoDELwJpbzjMvRJestXkOPiXmD2yoNvEMGsT
	 tfMbbK3v146ochNaRI9yVc6oIksNBqvCvXPOvWRC62Q4QNtGJWZNuuf6bb2C2/beBUy2T
	 zawLEwvjHuykztj0mwOMJwec6D6F0QDfyKrwPDw+SFf0Gb/U9CvybUOQSKVfLqWPg2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFuogju2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE951606A31C;
	Thu, 12 Nov 2026 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFuogju2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF221F000C4;
	Thu, 12 Nov 2026 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794506514;
	bh=3tBrz/qTKCl8kHYKF1k44T05Oj35LdC3Rckp4CQoOnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PFuogju2+6xQYvoQzKAtvb5SarIO5nr0rUWh6myOALVIM1rJad5DJrSFDZKuBtV0A
	 qOv9IahSawunvpu4u73fPlzKdh205snWLl409Mq65WSwdU+lxCR6RyxfjI8sAVCziZ
	 hfdOtIdszsL8s3wIwRKXCAROZmhXRvuE6BG/+RUny7BbIt8lNmMDm2DvY8l14MvHCO
	 aODyNaDsn88e85OEJxub5G/nhNTGcJLhcKLd0YnNcfpT1msKcMnEM9J48BCdPLOV2V
	 fxOMTtKZtu5GfP4dRbDzfiURw/QrtRZnFoZdRZR9xL+YwrDPFSSqbr9rkRNyHmfzu0
	 QkoOFZvGquRbw==
Date: Thu, 12 Nov 2026 18:01:48 +0000
From: Conor Dooley <conor@kernel.org>
To: jixincheng@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/8] riscv: Add device tree support for UltraRISC
 DP1000
Message-ID: <20261112-legend-outcast-c2226b5e02a1@spud>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AAvjLHGtMxNpSGMB"
Content-Disposition: inline
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>

--AAvjLHGtMxNpSGMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 10:00:59AM +0800, Xincheng Ji via B4 Relay wrote:

> base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
> change-id: 20260522-ultrarisc-dts-9dab3a2316b6
> prerequisite-message-id: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
> prerequisite-patch-id: 92e6cf1352d54e283d7721dc1542b580b8a41be1
> prerequisite-patch-id: 875c2058e9d8a983d785d7447374758f994dc847
> prerequisite-patch-id: 060a9b129c32c623a52ab1ba66f7a357e54575ff
> prerequisite-patch-id: 9aafbac6d2531a378b2057bf57787c814523f9d3
> prerequisite-patch-id: d75120a112276bd966d37441bd4d631e1539d0e8
> prerequisite-patch-id: f526d36e1a4adb659a812fd4145dca2e69b19453
> prerequisite-patch-id: 7d5e12085468dba34526d9047c62b357f874f91e

I applied the set.

Please do not include this prerequisite-patch-id stuff in the future,
none of it is actually required for this series as far as I can tell and
even if it was, I couldn't apply any of them anyway since they don't
belong to my tree.

I squashed the maintainers patch, since it didn't make sense to add it
incorrectly and then replace it.

There's a bunch more maintainers entries with your former colleague in
them for the dp1000 so you should probably also update all of those.
Perhaps it would be wise to have more than one maintainer in case you
leave too!

Cheers,
Conor.

--AAvjLHGtMxNpSGMB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavX/DAAKCRB4tDGHoIJi
0kHXAQCHsEZuICkoZqQBiO88zqYy/ARdSRp4K6/n3R3c/9OjLwEAnDzQG62+DFdx
/zSXcAmVDWwEVsElJwZWjwkwjkJGJQo=
=5fsO
-----END PGP SIGNATURE-----

--AAvjLHGtMxNpSGMB--
