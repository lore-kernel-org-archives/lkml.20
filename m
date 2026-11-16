Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852214;
	b=iFygvnvfjD5wFm/qCcBl5qeOHmA9/nxpkjGUWWjssZ2DyaWfdir32Lt2l04YHTXIGVHA
	 8aCqUI6m1/G/VMm0/cYLHGq9u+ZM1BWKHh671R95Y9yLPJCyV5RrgU4DjVB5xGEkfhhUc
	 CbaImaUAsJBrg6oGSzOnvYzfdaRyaMIiWu1h1N938MdRiyzVqu9PyBtjyiR8SiDCSQnpa
	 UPa2JiikJHw/UvkVE98oXmdFrtAa6hk3TWl87f1H6c/6J1uOPddVGLg9fCEoBLwaop1L7
	 IxGtRwauI38ZvR9VXgGKgrPYA2cL7Dvm+2r5UT+lwKEO7IwXfxFhyOAXT4bb9UEz7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852214;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WFKF8TJjLvFYAaPjC2YxhZShngdw1jZ6Mlp+B+lilQ4=;
	b=CdkHBkzuGe+dTtPgbJy7FPunDMEaICyUA/kCQSe0nKUcg3MJTmWAaUyMyz6pYMXjNBUi
	 YvAGv/V9WjOrLIRgEvhAzmDm1uSXL72d/hUhv11MJAJ3V4a060FezrAfDiliqWq6f2mL+
	 VwPPDOWXbM+zVsw6oaX+fgY3xATHDmo9fQmFZRuslqNH5/NHD9SdsnJL4OB4sMRQ/GMht
	 uxJhro8KNhN1XISThBRBZPIGF1KWAiiHCJgERg40I3HZk3Wxw6Rd1+QaubobiSRuJLBCc
	 L0Vy2aP8FOE8K+l8mMzUqu+E/othXYM44pxdBEdlxYHncUQmb7qZKudvY7+FspLvtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBwdMtiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CB606A32F;
	Mon, 16 Nov 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBwdMtiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCC61F000C9;
	Mon, 16 Nov 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852214;
	bh=WFKF8TJjLvFYAaPjC2YxhZShngdw1jZ6Mlp+B+lilQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lBwdMtiPQ6HAFV7uxQPyLzZgj+HUBCr9yvaX16XdLnUVxWLsNJX46V9J9h3ryEmJP
	 OsrfDTbOXhXYgMJuqcVR9XHuAdjRWp330pSj9YTQBsJPdLm8POiJCZRDeHip8eqXRB
	 OfnG8XxVbjU32Bl82wRQ3spbBLxsusYxo17una/YDzzfVUQwnt7uS8d6m5n4vN9vvL
	 nnv77br/EkPkaTzwBVdSEaJ3XEFyOC/0FOA5al7pGxmm9Mp7tRTFOQXDeb8Q25rdhR
	 yTv4rAE5MXTY+YQa5hijrMyjMjJL//Bo6pj64j77Zw4eoDbAD3JsEuPtM8ZpAyCp1Q
	 E4dQzWRPOnMAg==
Date: Mon, 16 Nov 2026 18:03:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Message-ID: <20261116-renewal-freefall-49f4293903c0@spud>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="6d0eNxJMD7Efv/LA"
Content-Disposition: inline
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>

--6d0eNxJMD7Efv/LA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 07:52:15PM +0100, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thanks.

--6d0eNxJMD7Efv/LA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtFcQAKCRB4tDGHoIJi
0oJzAQD7hEupl2KpNFe/m14Et5KQQJiFvG7NFJaYnD3zS3gt0gEA/HZL9OtWtfSf
x6oKb0UDrB38UcUYIyLXW9rekLgjQQc=
=nK4E
-----END PGP SIGNATURE-----

--6d0eNxJMD7Efv/LA--
