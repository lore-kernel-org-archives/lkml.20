Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602914;
	b=LYNQ/OiuX+UNP3VR+SazFlRzYnibuIQQX18mXAwTrQpD9iM/YBaYVdezWNdhUkdmP1KF
	 B4TqwVblz2pPWwBhVA/LUaazIZgmcc2IosOb3oKzugFvOOqZbJIaYt9HskZpfvWrvYXve
	 v0TGQtseuPQv5CphD2XRBf+UsLaFqbw00Pqdnt7c+fZIwFvrhkAeGZCYRoPxE2yDbFRQ7
	 a25JGqSb9wvrVWEsnU+MSvjHifpY6aZnjRUhf75yKCF9tFe1TD0B/vEMA61hNPnwmPxkH
	 aRfCg/u7FUqgqRHm4XO+v6HNs4xR6f+FOBSTWBvTr9X+ufmjPBSGXFtF6Wg1luJq8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602914;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=4yDZRfV74gzkAKxidzXBIKvKLnHRDrSBTaKHel/+/uo=;
	b=dEbI+n2wp2eWAnFNRyM5H9bzKdMQHMM875bnWuwU3D4Hvslm2vHmvC0ZbUUkLJ++O4Dm
	 Q2jufFkPHYufY8UyfxZcSBGqQhSpKC6UXGi59jCXhuVVanyJhdu7sJauvJqRvTykILW6g
	 /CU0fnN4XAAeKThWh+Ee+UHdB793LeSIDHOeP+poouE8Te0mE2LIIyZE/X4KRGP6bTR8O
	 POjfRHUZhrERnrXVFHp3dWXN9FlxyJyibsivPEsz53j0cVKf9J8Ca8BfeeKAQ55iqQkDU
	 c5jsti3wimtl3R4R+loaoch2OY1JEMAjAb05GbWLDgkcrSiXtdpbIMvmHDXz8rNRt0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Z+kKRryW;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A2B606A323;
	Fri, 13 Nov 2026 20:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Z+kKRryW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4yDZRfV74gzkAKxidzXBIKvKLnHRDrSBTaKHel/+/uo=; b=Z+kKRryWqzzXo7N0Sw4YRsMx0U
	ooA+n1KLL0vRvKl0ksWJUpF9NphOyllBA22gtQf7PrzXQILiV6FaI/cu2r8f1aCbIVIsV7UD+w8Hn
	79hx9VjKATUDTwLleielum70OnlKZgJeLDSRKRw3bjQYxzj+OlNY7CXCLwmcqovn2xzjI4ZBdL/cn
	d7NOhSl43eEOEjqhkumM60IyzCMvg7w1dtGaOAryVbXttvgmOdQOXWzZDf49l0XeZBEd0QoszaxVB
	+9OG2VQbQYAzRRbxtt4GBeU7CD3941BdZ2eoLGLXpYhbl4B8bEHP5n+4yQ0vQQ9yVFegqy/jiP3t1
	WY3BVGJQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, david@ixit.cz, detlev.casanova@collabora.com,
 maz@kernel.org, michael.riesch@collabora.com, diederik@cknow-tech.com,
 shawn.lin@rock-chips.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tglx@kernel.org, daniel.lezcano@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Fri, 13 Nov 2026 21:48:28 +0100
Message-ID: <OwFpcaCvQyCpxGXRrBGjPA@sntech.de>
In-Reply-To: <20261103192331.394489-2-macroalpha82@gmail.com>
References:
 <20261103192331.394489-1-macroalpha82@gmail.com>
 <20261103192331.394489-2-macroalpha82@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Chris,

Am Dienstag, 3. November 2026, 20:23:30 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add compatible string for Rockchip RK3568 timer.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

can you ideally send this one separately to the clocksource people, so
that is maybe is clearer that this patch should go through the clocksource
driver tree?


Heiko

> ---
>  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.ya=
ml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> index 6d0eb0014eee..b245a3051d66 100644
> --- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> @@ -24,6 +24,7 @@ properties:
>                - rockchip,rk3228-timer
>                - rockchip,rk3229-timer
>                - rockchip,rk3368-timer
> +              - rockchip,rk3568-timer
>                - rockchip,rk3576-timer
>                - rockchip,rk3588-timer
>                - rockchip,px30-timer
>=20




