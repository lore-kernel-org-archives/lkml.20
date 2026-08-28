Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92838642A;
	Fri, 28 Aug 2026 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934734; cv=none; b=OquQ0iHNVjFcIcwR/mzamxWV/uRsZ+1cm0uVwDFiBL6dg8MD3b5Dq1ZZcOK2XshESIoqx7/rXuR6CNaolrmKLGTNFHBJ0dr4pPqk3n5n0uyS6J8F1t70dF2SYCIbeiRYqEClPIeN3/up8e5n96OVDmbZ6itZDDLjMk4icrtJO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934734; c=relaxed/simple;
	bh=njILdYWzrPKAMv8FuiQxSWnVfxjzgLDz6ZD28Fr5mB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCquCq3ehIJb0EyNp5Wrs/Fu9tLhl8ty0Yh1lfisEeYQfQUJmIMJ1UxtQIY5EAtgLnuyv38ZjqIb3bWo+823HqFzpUTzqbQ6UQLPJDKlAUoTmZ8vRfQN7vt26T+bOvRFCbNtYzZVCJF8Lep5kyEuZCjaJxhtujw2GNnU4XCXaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKF76TUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKF76TUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EC41F00A3D;
	Fri, 28 Aug 2026 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934730;
	bh=njILdYWzrPKAMv8FuiQxSWnVfxjzgLDz6ZD28Fr5mB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKF76TUtthzkUDfKUzttCut0Jicjf7g4vNfbgCo/PS+wZeWmCfF4VGbQ9z05FBiAz
	 gyjh4JnIkafdxE2KvtzJNBohHJM+BsU2mcGUwCfogEzx9SZiMBIqjW3Szui0ErCD0S
	 b4v/e59GFuSx197hzgelX49k2QqkqUFidmssEjMD9Q6lYZZ0hhA17tEyTwgExSGZbz
	 EvswYa6VD+6ab76q4Y7WqIm7y7anczrv2HP74PUU6SWbIy99Lf/Hz0x7nN0lKq59pB
	 mIJmiUD63F8RXG6K5xP3R1kZuil98RQ6sgB/cp0xKWFj4ho6O33TP45LdFqybQGP6s
	 m/AduVLpbIlAw==
Date: Fri, 28 Aug 2026 17:32:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
	Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20260828-hedging-olive-eaea0b4027a0@spud>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
 <20260828064843.65047-2-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VvzjIjB4ZnlO6lyl"
Content-Disposition: inline
In-Reply-To: <20260828064843.65047-2-lachlan.michael@sony.com>

--VvzjIjB4ZnlO6lyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VvzjIjB4ZnlO6lyl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG4BQAKCRB4tDGHoIJi
0vEDAP9Y5r8QxUbjfWR6ImpEelzBAsd21ww9C7zBt5XbY14WHgEA1IyJXsR2sK3t
57X8B7PzRHm44B0V2Ud2NqWGJmUKrgI=
=IbDy
-----END PGP SIGNATURE-----

--VvzjIjB4ZnlO6lyl--
