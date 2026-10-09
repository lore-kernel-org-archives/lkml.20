Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA74F054D;
	Fri,  9 Oct 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568121; cv=none; b=p7etKN9DE2n1u/Y+hjn6nJXbaKTSKobF+HbN0d6oj0Q0lwXOUVx1rbJftDc3niuwWdTHxviPLo9CzZtw68HE6z+jjcZ3qY7JrymZERhpjqUpHXRNGBg1uFLvBYkLbGyN+YiIp9niB0ENTgV7HCggKXQKQKKlQWHVV24smx5Ya6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568121; c=relaxed/simple;
	bh=G3Yh5jJWwGTbKPRUOcEguVJPQ+TNmKw4RF7L2nTeSDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee3O8bHVbfMJFeguIvIY23GbbIQ7gICdmnfMHIrSTmbclQw5MTbjIHh1iV3tleWGhuLpVwVCnNAjqvTUskB0yGoSlQMQTu7XPMO7WlStagXndK0pB9fg6XbNy9DViMaAFvXXs0xQ7Y6l2hiO9iq+B6UEtmyyu/DKK0BKcI46Y4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijKhJ1uQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijKhJ1uQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB361F000FF;
	Fri,  9 Oct 2026 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568120;
	bh=F6ImCMxZb5Sw4KKHhc+xwxhy7w0cj5k069k6KL1b54M=;
	h=Date:From:To:Cc:Subject;
	b=ijKhJ1uQMR/FbbVfmPCpq+6ID9kHvJRaurza2zFGO17hb6S85gxrbMY4fiVdo4G3K
	 uo51UddkAYMyqhFJSXvR2IhrcBfv2fvLanc4z90i9xm6iBdGx2EjxzlV0fDoUBLQHc
	 xkG5ubx2eM+mkVGxMI2Nic9p4qcAKB35aJZhSFl/CqoppanZAH1Ea6YsO9h/a+p1DV
	 GQB3qBQd+kq4JWn0/DCnqFCJClzlz4+GlL/ULRyW2yPAE33rjiQFskw4lUwAipjP95
	 PgFIKPha6JhIfAvdk9BiSkJiJ5X2xYH0bRnMdbGWV9DISTnLbp8NZ8p4KXY0brdDKv
	 l1iAJ4jiOwyyw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AAD1C1AC57CE; Fri, 09 Oct 2026 17:22:22 +0100 (BST)
Date: Fri, 9 Oct 2026 18:22:22 +0200
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rockchip tree
Message-ID: <askUvlHM8oVO4y-e@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6MY8MTjsmZ3hA8oL"
Content-Disposition: inline


--6MY8MTjsmZ3hA8oL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  f204f28bd1fa9 ("arm64: dts: rockchip: enable NPU on Radxa E52C")

is missing a Signed-off-by from its committer

--6MY8MTjsmZ3hA8oL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaskUuwAKCRAv73Ows9A4
iWEsAPkBeZ+v/rNbJOOjKZfq/XYJP5IIl5QZ6HHSDCaGAXrSqQD8CMMO6j3oFgL1
waYWvtVog+0aOL9X66zm0cC2fR+NzA4=
=EtX4
-----END PGP SIGNATURE-----

--6MY8MTjsmZ3hA8oL--
