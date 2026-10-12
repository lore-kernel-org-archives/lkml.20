Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B9381AE2;
	Mon, 12 Oct 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831892; cv=none; b=jjPiFEKWc0Q1fvvYbZFnULnCxqEZHrmHwJ8/Wdk30xn95uMDWb+LiBkyQ8woB4zND+DlDtzW7a/ff959yS1eNXNzm9KrcK5O095gPjKfyrqe5FeK9RmfmdrjT5aCxM1TVsuDooWO9kBTNByoMo3zAtNTLNbSmyPpufWZymc5rbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831892; c=relaxed/simple;
	bh=Sd7gT0cZ2JEXcmELDLJbmC3v9kr1qLatSYfj93AFVb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWZHacDW/sMnlW8EYFglGfdpsJlSpS//D+IPCK4Sz4OzkDO/VhxBVe5zQS3jAFI6spyvllvgNMoQcvTilTDpG1Husbvp+5c/F2ZPZixNCiV7/LWe/Mb/vJOhDAU+DrFpN1dw+aEU89gxygvWLMG+HT328yHUJwwaV8hZFJyRjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOEmi5jv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOEmi5jv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99851F0089B;
	Mon, 12 Oct 2026 19:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831891;
	bh=Sd7gT0cZ2JEXcmELDLJbmC3v9kr1qLatSYfj93AFVb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nOEmi5jvnUlVp1pTWPkECEFku2lR8EfqdEMDOhG11CG3pQQwBtDUq12sBSIs0JrRy
	 YoXnmab6mR4X9l72gQqJGXwvKiNM+Wx/nmznlgNQobXT2EdnoXC/AWLGfE5rTHlzSA
	 rvCEEb86yt5OL/MPW1z9FesOwD+s/gUpuzeeV6c56XQXcP3vHuKtE8YjKM2r2hN6MB
	 1aOd5Mxc4sckWYs4PihgHXpODyL1SORGzS5YfqOF5bCDbWbXdWo+EVZj3RWoC0ehli
	 mpcQyWH7zMgt2CfIHlfkkwTraZckL1+QpRDtwwCOdfGTbeP7ZCxGfJF6e9l3fKbgnn
	 3ap/SglhlOs7Q==
Date: Mon, 12 Oct 2026 20:04:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
Message-ID: <20261012-item-retorted-59435575b86a@spud>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
 <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzyGk1aiHLrMLCjC"
Content-Disposition: inline
In-Reply-To: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>

--yzyGk1aiHLrMLCjC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yzyGk1aiHLrMLCjC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0vTgAKCRB4tDGHoIJi
0j2EAP90lvqVOokj0MsD0LOmbp8NLfly36LxrN8jYO1S2xIqbQEAnnJbWticefSS
LYz6A5TasKE+NUCli2VkyFeLBqLlLQc=
=O5ZW
-----END PGP SIGNATURE-----

--yzyGk1aiHLrMLCjC--
