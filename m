Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA0313547;
	Mon,  5 Oct 2026 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196392; cv=none; b=INtTSghj5pF7UDcF3PnAULrCDfkJJe0CSJNXldWyuyoBdY29P80q3k6aLREPPbyisCTXLRK3IkTZnhIvtzvLQzr3gMVO0I/l9JiFFgW534XrBsBe2ZXG7mnV0wYQAVWS9dy+X+jI/BA3OZAzRjLnljIcPx+adQU7Jolyy0Nlt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196392; c=relaxed/simple;
	bh=SP68aWqcUIiCLbe3gtIU+Ne5a9RIgXb8vjRfnsdsVYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdHlemjEGgMGf1OQvyuL2Ap9JxU7ODlFvhi36W6EhHwiii5ASmofSCKsG612GygUHStM8TgmmHlUWZ25HfyLE6QTKRk9X34e6oloDxpIlLK8ewth7gP4SkHfQLVEKWEzxSggSo1/wC5cIDg8AF7cYA5vix0dTxDMHurpXYZ7AnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMhozXxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMhozXxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06531F000FF;
	Mon,  5 Oct 2026 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196390;
	bh=wmmb3KcY5NisqptuNyx/TYCapXemKT5lX9sBUrHnZQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMhozXxNNFlhfhGaBRTJpnrBDFS/HiExDyP/+w9nfYrj9XKn4WBd9kLhHMuEYoBme
	 055vVeD0jEbt+jEyq88/ii9CJo8Qr++fTxHAEcwDKRZx9QAaWaI0rMz6esIl8Qs5Pd
	 c4J0QJRsX+VgYCqLED568EXuaPjAIJlf47XetUZhD4eVh8iaMSJ0B5dBHbYo5t5qnZ
	 Dg/E0hfzCujol1EkvzvOCkU2q36M/+hD3a6+JAJkQqLUrhrilHvICQOLp8W2pG9gmS
	 Q7d3qD8k6v3ylaP/B53PdJQwShQpG9DTI1c7uRj1deP6f5AbriZW5DYJk3tdPKivxr
	 MOR8/vJggdOuQ==
Date: Mon, 5 Oct 2026 11:33:06 +0100
From: Conor Dooley <conor@kernel.org>
To: nacht@dxdmail.cc
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
Message-ID: <asN83ijsjvnbTsmP@squawk>
References: <20261004-gts9wifi-dts-v1-1-1f0d7dd47e4a@dxdmail.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="59wnhxewauGzizuu"
Content-Disposition: inline
In-Reply-To: <20261004-gts9wifi-dts-v1-1-1f0d7dd47e4a@dxdmail.cc>

--59wnhxewauGzizuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2026 at 06:47:21PM +0200, nacht20-de via B4 Relay wrote:
> From: nacht20-de <nacht@dxdmail.cc>
>=20
> Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
> the SM8550 SoC.
>=20
> Assisted-by: LLM
> Signed-off-by: nacht20-de <nacht@dxdmail.cc>

This (and the author) need to be your name. Otherwise, patch is fine.

pw-bot: changes-requested

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 121ca557ce1e..5e560f523d32 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1173,6 +1173,7 @@ properties:
>                - qcom,sm8550-hdk
>                - qcom,sm8550-mtp
>                - qcom,sm8550-qrd
> +              - samsung,gts9wifi
>                - samsung,q5q
>                - sony,pdx234
>            - const: qcom,sm8550
>=20
> --=20
> 2.55.0
>=20
>=20

--59wnhxewauGzizuu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasN83gAKCRB4tDGHoIJi
0tb1AQCBcMDg+YaHBf1BOxBvCdJEEfMB8QZKGz1srtyqkSJZpAD/at2dF8lC2cXM
+lcO2EMgDaxcUGc64OVghcpdlutI9Qg=
=/iXn
-----END PGP SIGNATURE-----

--59wnhxewauGzizuu--
