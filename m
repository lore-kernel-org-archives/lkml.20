Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835828;
	b=BnJvFR0vhPd+a7CKkQlXyUFjyeFkKE3YS2+tLWLsUWZesDUuVEhehq5gy2ULGGZUYean
	 F4BJ1YddsjGArNeMqraogrPzRbyMjdvMfPzdxa7kvZSJDST2u/NDS+IxDPhMQtyCLwCOB
	 fu7xai2q8vY2E8RzzodIxp3c40GCMAKhnW5OoANFaqx/4VJqG73e1hTUO1iCZzHc4fXYx
	 fc6tE8XPC6WPW3JurlSQVZ339orHakfmR8uKVQcNYVZIXyrzqdRTqJSupiJhedNRfiF2K
	 Eoy6hNERyIcusR1DBOCuNGlpkPQGbHvp3uChrzduYY/i6Jd39wSEwcU8C0WWp2NF8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835828;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yawkVcRsuwVeIweRz0csm0s4kUXqPTcriF2Qjr9EKD8=;
	b=5nDIBCGG0+WpmscQoWX8II8VRqArU40e3BnNltBMtao5BO0iDbqjNZ1IadJmU4UgPp5U
	 OMpGyipuVChbOXe2Xu/ryD8Hx01qr3PkLCkuR0xt10UxkcquTUYMsnV9dFjwHSpghw9Pv
	 Abu5V7ZDWP9xFGSFXLQSf9nvzrHiIG0H2GiNuP01IsYYnVy9huwrRNxntaOQmJ0pmIUsU
	 0+7pWF/YERr/9qiUHqKCBSzqEosrvubTz/rAemCeBp+bhHiiMOgIpL7JmMieWyxj6IAth
	 5FYxG4YUF9taWop0bPLhmo2ufIJddopOpxLFuA//pqLMNEtlveouzEgQlweC99gGITw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eb5MQFqQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BEF606A31B;
	Wed,  4 Nov 2026 23:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eb5MQFqQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0EE1F000C1;
	Wed,  4 Nov 2026 23:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835828;
	bh=yawkVcRsuwVeIweRz0csm0s4kUXqPTcriF2Qjr9EKD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eb5MQFqQnvJ/TIW8QMhuCUSbO10ykl1WLdAG1EVf0wICh0B3M0zI0QHRMFCDLYO+E
	 tG573gOWy/mo7k/SNRp24epJtAy/Ip3g4MwTpbxmufFpaPLbzYtLFCEpzqkkTDhgqH
	 0VV7Qw5JLKV6VfLM6UDXxa5NwS957YpkmpU7OcIGNDQnv/ELo3V9P4pIqPZtXabsWg
	 yLjvX7aMuFlqeZ6ee8oBG+QynW0CCPYXJON8wz7B2BkihjL8eiGBGcLQwvWkkQKiu9
	 s+NlqvT+gYf+dzE5zAJR7hCnxdGlNXk8QOF+uMnbHPkbGyhisuBhHvXikIixUCSftd
	 +9C7zkoFgg08Q==
Date: Wed, 4 Nov 2026 23:43:44 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
Message-ID: <20261104-gallon-xbox-19dbe330d50c@spud>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
 <20261104-sf19a2890-dwc2-v1-1-d959375e26ab@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="Wzpvg6V8XaO6Wszf"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-dwc2-v1-1-d959375e26ab@telaak.dev>

--Wzpvg6V8XaO6Wszf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Wzpvg6V8XaO6Wszf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvDLwAKCRB4tDGHoIJi
0iiiAP91LQ4bkYWKhGAszLG7eeintMoIXia0zmhpLrfWn5/P2gD/St3IyUhp/OJS
wtORRYTl8BHSyx1yjgtyOHQ8ZPuKSgo=
=3qkN
-----END PGP SIGNATURE-----

--Wzpvg6V8XaO6Wszf--
