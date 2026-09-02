Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64047F786;
	Wed,  2 Sep 2026 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370067; cv=none; b=KTvuNaf3mGBWjX6O4QYqOgYOR6yMxxZCU4P4gWWRaQR+QXUxTYB5QERJL/JSsNjHBDSzeG9Qo6oks9eZIZ5DU6dUe4JMAQx4NOrqsRj6XRuCXFT5eg369nrSjc2ma9xIvK4WG8o3geR30BDZb50UbeWPvUbiKPgxFW/UzIA5SuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370067; c=relaxed/simple;
	bh=GR2EA08jvmQTvupAnjGOGc+0Lj7Q/PJBrSlBg+yYodo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fbw4BlIusEWqcCfg+v/BH+F9wtl1MHEskm/08uhKWZcD7POckrIrDJ6Hk1rLyN3g4W5e3WdC0R0j6b/J8uA8/+n+yO3rO+uVFELKfn5VE3RAitrTtDVTE63iiHgxUF8z9x35DvNUW6wH9t7djksvfsiC3M9n3JzPXiJ4aNFPgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxVsrtuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxVsrtuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284921F000E9;
	Wed,  2 Sep 2026 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370066;
	bh=GR2EA08jvmQTvupAnjGOGc+0Lj7Q/PJBrSlBg+yYodo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hxVsrtuj0+MIa2yjUIlxSBQ7T2h6UIx18LV3sGydccUOLIuHKpwJ51xCOdII1lXUC
	 1LizCvbcZcAMn9B/uk4XJW4zEcB6uDP/lCaKc0yeN7Elbp9u5SFyTACKpzExb8Pqid
	 nBtghccAdfd61a+sI5MYD6UZlUH7cl8fg5oxl0o+TpjrSuant/uLCIYsr2WNZoUyg2
	 fETGYunwFX7Tf5NdT1Z406bukrY5dgqE0HARSk448kB5DosYf08IVPrFefDa95JHTR
	 1e5CM3Tp147ESDP9y9J+TmUSFg+3ngQFukhQ0v6g299qQSpbIIKpUsykU7VQNundDl
	 TLkkwDllTDAcA==
Date: Wed, 2 Sep 2026 18:27:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: media: ov5693: Add
 clock-noncontinuous
Message-ID: <20260902-appraisal-unclip-6d9b4a550d64@spud>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-4-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5T1EuH3zwjHE/yZ"
Content-Disposition: inline
In-Reply-To: <20260902142322.73523-4-fernandorimoli11@gmail.com>

--U5T1EuH3zwjHE/yZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--U5T1EuH3zwjHE/yZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphcjQAKCRB4tDGHoIJi
0i28AQC6ONeTNmzK2lcTSk916ZWObQFvCltBkBFxuYcvqLzR8QEA1U7FOQPDQMke
rp2r2723oxG1T+dgFbuRY8sBpjbcoAw=
=y3ym
-----END PGP SIGNATURE-----

--U5T1EuH3zwjHE/yZ--
