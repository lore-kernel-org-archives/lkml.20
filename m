Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388346;
	b=goo5WhTs1/MJWT8i6hNuiO19RotkgcseDxFKxvzJLYVDMK2AuL+Dv2jGuLjOzKYPbpsQ
	 LxP80UA+HY1k+wgkrxcrwzQdQ9Sel8z5DpIMSjEofMaTD+h9nQP/HCrDJuWokmWyT6Pv9
	 AVG6nXJZwrDIyCoKeMi8tZQM4QFC/CX2Bgiv6ZkCb+BUsH8H9b/S3kKh8vNkrRGA/5eJa
	 ey8aRmyIHQs9RVVG0G+XyqnyDW4QOtPxHUuf1oE5toKKBzrsCQw//jXl3mcl+ek6fQd7K
	 REAFXFWiHJH6IMsfQY1IEX5168y1oTaZMLqS3M1MmMSeB7jwc14ALDTc6R6e31k8gwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388346;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=9Gz7En1oK8OrbG/8Czlwpynj8nEeQahmBEOy+4rFJFg=;
	b=1QScv+2DO+xjJ74743LcUxkUVF9uzzWxcFhFmlIcNwqdXV+1MGYmotx3q4QhtiGHGQwZ
	 suy9+CrbpJuPlkvFAibDMIiKRfcImfoeyTlFvk8Ehnp7LMNupDH/C+aWzt/4rxmXCkVzv
	 WL2MI3jwF2Wh/4IUQanjc14VT5OQfwQ3kLqvylG16ohqQHMo5stYB+tUrxMFIYO1lH3MT
	 NDj3RNHqT3mpyrCe7mHqHBCNhlXguEakcYBEjsuRKrBdk79WFIMLQi7p/eJPpCkyYquqF
	 hxIO3gtcxMs6VCZPi87iKiPWXO1aijPltKqjq6KhblgeMa/lJPLFtu1AO5Y16qChGtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZmiTEU4Q;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0862606A31F;
	Fri, 30 Oct 2026 19:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0862606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZmiTEU4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9Gz7En1oK8OrbG/8Czlwpynj8nEeQahmBEOy+4rFJFg=; b=ZmiTEU4Q4TcxpYKXHIHlrQXt8W
	wdsj4IoKSFCB6MzSwA9c6xHYx8241QpdOroAmqLzwGF6RobBF2DvEtmC97cvW0/R4CT1zRnA1nOWE
	oQnBw3+eLfuLQGaM90cntLhLrY6rH75dmfDLULAXGU08j9jtgmKkyvDXRJhYNysxHWOniarnyT0II
	tD1jes14OFWXVqv64LB49hE/9Wm/bUDz2bIekNPZLtdjuSqUz69BHPjZqYbRr5fuoboJ8yyY82NMI
	ZsHHqBfeQzi/Y3E5TGBxNlBlnZl3VM7s4uPaw/QNZoanlhGbl6A5iwI1GR7ZnViwpWKjsZBfAD1iL
	JStRZN+g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Daniele Briguglio <hello@superkali.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
Subject:
 Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Fri, 30 Oct 2026 20:25:31 +0100
Message-ID: <22143920.0c2gjJ1VT2@phil>
In-Reply-To: <20260907122406.1862398-2-diederik@cknow-tech.com>
References:
 <20260907122406.1862398-1-diederik@cknow-tech.com>
 <20260907122406.1862398-2-diederik@cknow-tech.com>
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

Hi,

Am Montag, 7. September 2026, 14:22:43 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Diederik de Haas:
> The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
> Add it to the NanoPC-T6 list.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee98a..aa828ee60d21 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -398,6 +398,7 @@ properties:
>            - enum:
>                - friendlyarm,nanopc-t6
>                - friendlyarm,nanopc-t6-lts
> +              - friendlyarm,nanopc-t6-plus
>            - const: rockchip,rk3588

somehow this seems to have slipped through the crack wrt. a dt-maintainer
Ack ... maybe resend the series?

Heiko


