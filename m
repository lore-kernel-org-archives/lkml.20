Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7C37AA9C;
	Fri, 28 Aug 2026 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934200; cv=none; b=AI8I+3Pq1tMvjtAe7dVoleMywVBWVm82iX1nk2M19ttor+dzCopzjfW7eWi96wTgDVBOe8wSNtsw1FS7fTrrakVHhM0RVG8v6/str6vvtUmNcjUg80Hn1D/D+XEGa50UavK67qfVP9uytfiewyXJly1ZbclWyjPM14JhTsz0aIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934200; c=relaxed/simple;
	bh=YioOYxFhkhI6jlSy/Y4PdfV4bnQAjWHV//Ke4feZac0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F30nKxiHBZNsXfwBt7Jh+ZyPZlYso117XiQVCLxfyTFvbv/8wK8tdsds4YqYgk4odg8xN8aChzA7qRrNdF0CBfbdQH+j88tm36C0HydtEn5TeVCp7qT7pnqGCIFml/2EULhlSO7OCqLVEZbWrEnuP/e7HAW47hGlXHxpT76s6X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P269p2T7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P269p2T7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2A21F000E9;
	Fri, 28 Aug 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934199;
	bh=YioOYxFhkhI6jlSy/Y4PdfV4bnQAjWHV//Ke4feZac0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P269p2T7xh0kRpRQChEzmAbQl5U6J1oqOo6m/n58EXOYBhcU9wqIBUah1jkGGq41A
	 j352LDc4jbKGYSuQWBDzWTYZqxre9xr/D0BQn7XA6wm9IjMCMzFffpLqLWXQBfrhx/
	 TPaiyxKzquwr03+Flk43Kw2ob9wnHHSuyeb6RR2xwU5j2sZm/udmv19aZYcQI2bSOe
	 3vjlV90KjxHgyZyTKZjBfSwNXEgLkik7x55kr1dAVuqYq8zbevWBqGwlll1YplfaIN
	 r+EzKhZAbXHxZGxlbW8RRRnuhZPlfOVHcbjbhoLnx1LsZk/Q2QHb26c4kXpW1yokuL
	 GoS1TDVNxIV8A==
Date: Fri, 28 Aug 2026 17:23:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <20260828-headgear-next-7130588b3977@spud>
References: <20260828132104.21473-1-robertbozik@gmail.com>
 <20260828132104.21473-2-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="060jV5tePOmXoZFM"
Content-Disposition: inline
In-Reply-To: <20260828132104.21473-2-robertbozik@gmail.com>

--060jV5tePOmXoZFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--060jV5tePOmXoZFM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG18wAKCRB4tDGHoIJi
0i67AQCv856XljJDC2TAXHvwtlnCOjI9TDLMfE7rRdF2AYmuzQEA61JmzKEWgtMf
5zvu90Qaflk6/mveR/dptOMz8tCbxwU=
=gqyf
-----END PGP SIGNATURE-----

--060jV5tePOmXoZFM--
