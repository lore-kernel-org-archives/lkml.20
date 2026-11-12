Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482457;
	b=cWEsV0fp1K5qyWNWGERWMvh273CF5CWv7RmGA7vExQibqJmzODtJuH+y+66ynrdQrrDr
	 WM37l2bnd7WUP/BTJVZtuZH3J5EIHJJaCIIob4swRYrNVj4OEBe4GEcvM4eIzmKbJuhcg
	 wb1qQ8m4z8Xs4Xb+AeBFgdQTZ4l+J+VZObteNciOfCG91A0DPO86qGtwOb6UUc3WV2kdx
	 c5UynS1Rx0D6jyWewHMH8Er+5UtCagLBn576VLDlbeerPBkn9mQiTK1YMf5L3DKBUlg3X
	 52TyLsjx5tu7RS16gam/v0X50UE4GFG+Jv0JO/5LSGGhSXFzPHPieW/UsvgD1iVqtqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482457;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cs0q7B7MSfaibYoJpjt1BO5ZEbu817EWGpbNhNP+bzo=;
	b=wLL0xGT9WgsGBgWtB3zdKLKulcVlKgTUuoIaYxH6OfiSzzF+Z/bgFt5/ItZiU91+bYC3
	 fTZsMkJsTR7ISoBhNqGU2WBMe3QXJTiK3+gVKZMivhs7Y5kzxsRvnBo4/OhKpVbOEJP8d
	 ox5n0zwnjoL0mgFk7eKECJ6iz5ZU8SrZ3c8fwfQ3kIa2Dkc0lKawlj4Ng9nX5LCZm9wuW
	 z2M7+Xh8d0aG0T2+o2ruAN5kfwfUp9hheB6EWw5T9watebF9MyOtkeW1gdU0aPcnWxhT3
	 skSJyNFXzb2U6rGj6/RmIflEk9HwFdrhaVV8QEqF0fYMf5E1229XoeJRi7KBQpwwLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnFxgbB1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C5606A331;
	Thu, 12 Nov 2026 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnFxgbB1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA131F00A05;
	Thu, 12 Nov 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482457;
	bh=cs0q7B7MSfaibYoJpjt1BO5ZEbu817EWGpbNhNP+bzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnFxgbB1Do3DL4+8PW+K3S2xaYDWkSDo7VNra7peWZf/0ZN/lxX9wrk7E/jkQEOVv
	 EiGhNfdQmHWk8lZtnd+M+F3nVNU2GrI6FwrymYstyvES/t+9o8EGAZs/ub6ay3VMBF
	 VvHezW8pswmNW/f2ubLsHEqOkvk3G28LwoZkl5HO6YYvYVGs5Mz4S1BRU6xITv4lJW
	 WcQb9RvJ67oLBra0U0f3MRuZgnoUp8deWk8kETX4KrlaUSl3TkP0Is9E0zYEx2Hka/
	 RmUxc1uLyIMHVTr+FcInImdUkOHsIQX52CbxtETLn9lPynpEpZHM/WeVmVzHv9rYFf
	 K1PFz1/frwHvA==
Date: Thu, 12 Nov 2026 12:20:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: atcphy: Add M3 series
Message-ID: <20261112-daring-lively-skua-aae32e@quoll>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>

On Sun, Nov 08, 2026 at 04:43:40PM +0100, Sasha Finkelstein wrote:
> M3 series SoCs have new phys that are different enough to need
> a new compatible
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> index 0acac7e3ee67..39461c5dcf20 100644
> --- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> @@ -55,6 +55,12 @@ properties:
>                - apple,t8112-atcphy
>            - const: apple,t8103-atcphy
>        - const: apple,t8103-atcphy
> +      - const: apple,t8122-atcphy

These two are just 'enum'. That's preferred approach and more
obvious/readable.

Best regards,
Krzysztof

