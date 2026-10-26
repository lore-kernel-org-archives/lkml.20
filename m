Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050372;
	b=0cfU6ztLw3Wt6Ik+7jzCx+Dj4yTYB7rwggE54ON85pXI1mIiR2J3dHmXQ6Nwdzu/3mKR
	 /ADzwWDFfRYptgxG1nVgMeruplEeRaaFe1Gm+lDRHeBuvcam5DfqH5emwNP+KHV4B3Xjf
	 RviV5tU661Zm1HuWJtSPfbmItCYab2iL9otR9wDB8MH0mOAHZlDX+4IJKXC1aE1Yz+1+N
	 Oi1QjiQxe8MpRGAkAH82zSamqNiW1nuGpGFuIPzC8WGzz4x8Cfsgidd6UGDmd5GeGJ7Mo
	 OokQokQ1FLgopeNbayG+GID9wkL49VZPPEQssZvCRdhauzR8NUakbNm5vi5C1I1lDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050372;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=6UXRkofqIopc1VIlz2O51kfJ8AOtnEZxYiLwN12udko=;
	b=a+y79iVBdRx0UfLVRYL0jWvI8f1fuM7XusTVjcGjJu5RmdUTsvgQHOtvr2fF63Iu1aQh
	 L0XVeTDDsWdSA9+6qO+pnBohuzLyMfjWqcrNKKU8Gl+y65UrN0GDRh64ejK4cHKj/6+z2
	 hID+1aHZjTVYayeOyLZYLIWHwFgCJR+3k2YrvQy8X33RjSdGRExPje/eEV5B6dZoqNo6r
	 2PoDuBdmxulA1wnkU+55iiq7d810eA1DSh7VdgzgG5pTXz1b0az5bysGKR8KTMf7JIOi4
	 5NLyx0y4QXajBZ2bkNj28+OfGZwsdWk7Tec14FGpiYNyh4yMFykoQeUhWHt62nZY9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aD+zDZ5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BB606A31A;
	Mon, 26 Oct 2026 21:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aD+zDZ5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D627B1F01825;
	Mon, 26 Oct 2026 21:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793050372;
	bh=6UXRkofqIopc1VIlz2O51kfJ8AOtnEZxYiLwN12udko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aD+zDZ5MKeko/KtyWmyU0tJWGzehxKk8dqVx5bNemApyR0czWhDVPAZn70FNVhnbA
	 crFhrdWAJNrwd4kUi73t4guNK5Y4I6AOIh5T5/PFPtpXiXQWh6uTMDR3IeqVStcGyz
	 MkNOULRqjcrkeLR8/Y5UNQDFLKtlR1ohf27mFslfYJKfFumaXy0NTyCJgAMDWttmQU
	 VkVsExzqu9kHsE/9OkzzIpQqh2Rk6KXmXSZrHaQ2PsMeZsVveWc1BWCqjcdHByyNAZ
	 ZWa1X478duR3KSR7jr9ARz/G8esOFk43bqLgOJO4DCTwYg32U5EMAk6vNHMMs4Bwln
	 BO9mTs4QFC8Qg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 387F81F4211F; Mon, 26 Oct 2026 21:32:39 +0000 (GMT)
Date: Mon, 26 Oct 2026 21:32:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] ASoC: qcom: Add Shikra IQS LT9611UXD EVK audio
 support
Message-ID: <at_G9w-g-f_x-49c@sirena.org.uk>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="sLF79ND+0+YdUvNI"
Content-Disposition: inline
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
X-Cookie: Whoever dies with the most toys wins.


--sLF79ND+0+YdUvNI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:13:08PM +0530, Karthik S wrote:
> This series adds audio support for the Shikra IQS EVK board variant
> that uses the LT9611UXD HDMI bridge as an I2S audio codec instead of
> the MAX98091 codec used on the base Shikra IQS EVK.

This doesn't apply against current code, please check and resend.

--sLF79ND+0+YdUvNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat/G9gAKCRAv73Ows9A4
iS/pAP9L8xikTlyFwI312pIvQdu7ppiUpfFKf9aD9gkuha7PXQD9ETqUINmBzQCe
NSSNDrMJJfSxpRnUpMP56Q46aULBEA4=
=grle
-----END PGP SIGNATURE-----

--sLF79ND+0+YdUvNI--
