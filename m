Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE40E3B42DD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374538; cv=none; b=GsjqZGc70iibphZ1Ci8gtFv3R+isFJmf2N5RzhtTa30jVwlquR916fDCdKa99iSQknRg7CAq0Sxm+RrIQwLVwL7FjJTdZgt5yfpwID6l96cVNzb06zUo69N86eZHaq30zAES5piX7/rssOHoLcrI9cBjt5UgXOEE86eYbn60wbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374538; c=relaxed/simple;
	bh=KHI0cuA5l7duBjdUXztGvNoQN6qtQU7VotEB/SVs0g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMxcybSKRE+6SkSB2hKFODJPAq7yM/fbaEGmTrfpm/oFZ5haMqABf1SXu0zFHdh7nZgZ/gsU0cX3MXmm8ZFW2rnj99Rp9578h3JJec/tHFv7CigUtA3IgrRe7391O9Ao8L++Rf8CE87NAoR61TQFlN0WT7U6mwBc1XWO95JNRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBPH2cCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBPH2cCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0E1F000FF;
	Fri, 25 Sep 2026 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374536;
	bh=LcRvlK/HbBz+SKxl1aYcXjvCHhEqzNV399j3CsElZuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBPH2cCWgOGSA1GSHE866Vn7npvRMvUVrV/v2GPvMWuFhUe7XwuP6O8EO8/UoZkFw
	 KkGabzc6Aw7qljtmMXO4QLhjbCq5hY9sB1vavWLufrr5wPn4r+ohz5aZ9/T97hX0Zo
	 ov4YSQvlhaoBKjvs9J5L5zxAlyDVdJNZudoVWvexoMGWbjXDFA42EjMGHVacijWEWh
	 Iu9Ul3+Pkty+CJixsnAEnWD9UN4pCzKLNpNFtdUBtbxrOByVA4jy9EjNanpB/2InZb
	 qhjJ363lvr/cbHnlMg+nC544f5NtJwtD2Z0bdrNic/lu5zRe3G2CwK8sIWiV2HzfXT
	 5QEFEUe0mPydA==
Date: Fri, 25 Sep 2026 23:15:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Message-ID: <ff062c05-4da2-4f55-b81b-0fdfed56bb92@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P0MhuSJkYqHcPp+v"
Content-Disposition: inline
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
X-Cookie: Love America -- or give it back.


--P0MhuSJkYqHcPp+v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 02:20:45PM +0800, Justin Yeh wrote:
> MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
> a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
> MediaTek configurations the symbol has no prompt and is forced to its
> "default ARCH_MEDIATEK" value.

The following changes since commit 940de590b839f71d6dc846160534bf202401b8b7:

  Merge tag 'hardening-v7.3-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux (2026-09-02 16:02:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-export-coupling-api

for you to fetch changes up to 59951bd9c6b63d4d98539db96becef729ad60b4a:

  regulator: core: Export helpers used by regulator couplers (2026-09-25 18:44:46 +0100)

----------------------------------------------------------------
regulator: core: Export helpers used by regulator couplers

regulator_check_voltage(), regulator_check_consumers(),
regulator_do_balance_voltage() and regulator_coupler_register() are
already declared in include/linux/regulator/coupler.h for regulator
coupler implementations to use, but none of them is exported. That
limits couplers to being built into the kernel.

Export them so that coupler drivers can be built as loadable modules.

----------------------------------------------------------------
Justin Yeh (1):
      regulator: core: Export helpers used by regulator couplers

 drivers/regulator/core.c | 4 ++++
 1 file changed, 4 insertions(+)

--P0MhuSJkYqHcPp+v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq28oMACgkQJNaLcl1U
h9B36wf+LhguYCEcSacCFn9QT75ux5lJ4HRaD9vAYEGQ2IXsQhIEDJNpJHFIbjvO
3aIo6XR7eoDRaar6InusXYtBAWRLjR+tEZbLedAn+0E03tRo5bLrRKt1eze394ix
d6hRvvea5gh+3O0jd2KPIzhWb9FhKbMs0RztZo7cAuq4zLCzbK/V1vyLRIoVFIB6
DnCAlafjgTMUwh7x/fXTq6x0U+d70AHey3SVpxK/ntNGd6krhL6SdzPc7EhKYgi8
pES/JvJLKOu9FuZEE+TRYHagdGwy8WWOpwYcsA0H53o2Nba3YVdPJ6y8RjQ2bHpI
J9V2P9qRXpVXWP8bGV/9Sh4ThQEnZA==
=nDY7
-----END PGP SIGNATURE-----

--P0MhuSJkYqHcPp+v--
