Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580485;
	b=mCaiO4f/6H2bBeiIdGdXu/s1T/aBp+U4lnkQcjbRyVi+d2IiB31SRr9+xprADn7/u1Pq
	 bDgPdTlABDRMo8zTj5qY5kzqSXNMdZxkIkEUqe61q/DE8Z7Ba/Q1SeL15wi+YTdZheqRb
	 13HWAegj6HNPe9Guv/sIxwbuDmht8QJKJq3zCTt1lWE6EqlCF7Ib4T66J6Se5wVSehi2/
	 C5VNOesbQNGJ4D26CNLJCKDM4MN2zDoGcbGPBxxuzAFsaXQ99EryuBnTSxXVWf0M6oQ8K
	 uayV+Y9Hq7S93k+Lxn/Ayp9WGmWTGcxZy9P521WOL/E+Wrp7WFlWrXtHQu3pZr1heSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580485;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=euWQn5Rv2hCwzrMHnDv5CR9xISzY+IWgczl37e3t6mM=;
	b=Wk5/hb8hXiXiUHuq9i1cZhNhIQC/Ta6Jv+tzbpAKDG7MboUy+R2HzXRpwH7sS/xHb/A8
	 FIPTIIftQG8ShAmvgDVXQLiRPqFtH4aEi9XlzFaIe4K19PXy7y9gSfCC4SPwLUmrDvcwv
	 M9SsCMHCxIPDiI+b4ZQIzYSuPowu1HGZyuFwR0JIZJT+Ckp3Eqc6YQXffPhiObUB7u9fI
	 +2wvKvT7QZYY3tCTxKQNpNRx8FMPLcpRWdVgKjckzvL41eyO8kRM6sN2wI+sJfWjPqtRQ
	 PpooR/mEIb4GAHl219eSvaOuwsgBfo9eD9TuREB9bY/8pXlTKOOUO5OsAHZWTqJEvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8PInzIN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE3606A890;
	Fri, 13 Nov 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8PInzIN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BB81F000C4;
	Fri, 13 Nov 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580484;
	bh=euWQn5Rv2hCwzrMHnDv5CR9xISzY+IWgczl37e3t6mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8PInzINTKuTvIeuDs0rRrwxlosMMlQd6oS6cKKHIiqRlPL2gOzeDieeRQHo5gaMN
	 qGZFEMoxVOX5Lxpt1tMMREw5ynGNf6umnqNnEPzrF4otX3L0GmakulMQAQEVzb2P0Q
	 oUtFZbeTBaBv7w1JqAlXAjQpkwIDeRdrRiJLjkafqL1vx+/sGTBXmSWw7pF7qAuc1l
	 iZEOwn/vgI3C4EXZqX78M2eOwl0wSMQKltoPywTttLS6m2SvkEjEu8r9d1uyfDAKJh
	 MalvtEGt4c/blxflZYQX8xwm+zjSrmeip7/lUBkc0C7JgzZqsmocb8xCZmwX1BK955
	 NLHcrK670Otww==
Date: Fri, 13 Nov 2026 14:34:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
Message-ID: <89a0f5dd-0d18-4c81-905d-efac36c4f6f4@sirena.org.uk>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
 <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
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
	protocol="application/pgp-signature"; boundary="dow1+n6YN2YGv1I0"
Content-Disposition: inline
In-Reply-To: <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Cookie: Flee at once, all is discovered.


--dow1+n6YN2YGv1I0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 03:10:39PM +0100, Patrick Delaunay wrote:

> These bindings will be used for the SCMI voltage domain.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dow1+n6YN2YGv1I0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3H/4ACgkQJNaLcl1U
h9Chlwf/X69pVoeLUuVJyXO9yjCfCse3Jt4TBfhjSyktkLI2Zk0QaQ3a6XjGyNAZ
VyTvS9Kk2/z7/lJg8gLnxZYbJ5pIyQpT1wn043eg4bE5QBq2UoxL9bExVm7tEmhx
+ubD1mwsMP3JtL9u7DB8IIXscKxRI822PSAnm8QYR32qlTAFn7XXtZVvlMrUw/UA
1d/UwsXjVPxbcKCmkHVHx5iPvhnhTa4qBDHrmifhqsE3OkRQl4bifpBfqn8nitTZ
EyGOGdcANVyzQjWre2QdTCs7mSgcFvROBOxSmePIgyfu2mW7k74OuUBWMMrjbwKq
Vya/66pRh6Boe5zHJxo1HTZj53iomg==
=hQv3
-----END PGP SIGNATURE-----

--dow1+n6YN2YGv1I0--
