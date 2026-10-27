Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087309;
	b=J9uNbvEzRiYP2yg8TKk28kvdx0sRdSzHkCDzhFg04Cnqq3Jc5QD3Pyk6l/7NDeZAyAbL
	 B1q2vZK2FMAYW2G+Pa4QP79fFXbIjFQtPD8AiPZGt8yi5N3YEyR3T9vo15F22IVzz/EQQ
	 NbEY9y69oeLkEQCjtDFX79RORhVZDFrTqHurMT1Wl1xaou5nXEYV23pGZimV32PEvcd/i
	 ACY1uie0VLcP1ZYH56g4hcEEJRcknxuoy4M6EAVnR0HUxeRGtseFqCOSIytI2gbJ7p/lJ
	 n/tVwHp3oSGKA57B6Wv8VuORO12Aa92vASfRbiu/HR09MBvBby9TimZKpMZUVdkvsIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087309;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hyOQjk3K8q/yVPwZ27qrjO8iwmjy2yoP6q4VHiqEPJA=;
	b=qLX900eJWWLeb8B2Gelq7FvfP+xc80Mg/2AfjkWvc2N1QLxfpPZ7I4kllhrYip76ow+D
	 +V3QfJrfuNFyD3272qDmQjxkAAotw3k/x+CV2nauhcUn9ZR9Zqi6wt/WsKWlzgEyAcOPx
	 F/YDQab4F6Lzbo5q0aJZwH8xWkhCbmsEUrw/IU6iiHbXIVn44wY8YtMuD5F/JeEfS2dLG
	 eahb2k1Vvnd7mFkPqTYRInMKP8/N3Tc1EkIirgxnU0yQgXsL9z7Ke1Pn7TgvIdse91KoY
	 t600tWBR5qpR2Yw5TmxzKWD9pn9/DS8koQwx7z84SGvinJrpQ+B3dn2vCk+6lepBI0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AueqGJCd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F9606A31B;
	Tue, 27 Oct 2026 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AueqGJCd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3791F01825;
	Tue, 27 Oct 2026 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793087308;
	bh=hyOQjk3K8q/yVPwZ27qrjO8iwmjy2yoP6q4VHiqEPJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AueqGJCdW76ZbmKfVwzLggoxxer5DgpH1Dw1u53556Tw8kBTZ8I5O4TaOh6ICA5bX
	 rb8KqsfEJulnjeOYcr8oN1n9eDQTcA6cEK6HnRTJi574uZK0dBO6KyuUOaufuxGeBG
	 I4UsLAVkfEOMD/X6ntBASRocva2oomX4CybsMjv+OyZDQYFRUc5ucYBpJ4lguzxQih
	 bgzi9ygh7zjrFd7Xcv+oJ+uXznziMhDRAeqXE6VFRZGmdKr+E7dHUY6jhcfJWi9Btw
	 e2S4yaVMrfrMCuLoCKbIBzMWsRFh2QY/U0DlcswEns8h0I3cbagWQd9U2Ak2Qnt6E3
	 Q+Te8VODsULpQ==
Date: Tue, 27 Oct 2026 08:48:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: heiko@sntech.de, HystericalDragons@proton.me, amadeus@jmu.edu.cn, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, hrushirajg23@gmail.com, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, macromorgan@hotmail.com, 
	michael.opdenacker@rootcommit.com, naoki@radxa.com, robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Message-ID: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
References: <5520293.6fTUFtlzNn@phil>
 <20261027022801.377819-1-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261027022801.377819-1-liujianfeng1994@gmail.com>

On Tue, Oct 27, 2026 at 10:28:01AM +0800, Jianfeng Liu wrote:
> Hi Heiko,
> 
> On 2026-10-26 11:43 UTC, Heiko Stuebner wrote:
> >> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
> >> hardware design from CoolPi and confirmed that no hardware design

"no hardware design modifications" is quite different than what commit
msg said "based on".

> >> modifications were made for the Sige7s.
> >> 
> >> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
> >> than being independently designed.
> >
> >if it's the completely same board, just with a different print on
> >the board, why does it need an empty devicetree. When it's completely
> >unchanged, what's speaking against just re-using the original one?
> 
> The existing CoolPi 4B DTB does work on the Sige7s, and I agree that there
> is no hardware difference requiring a separate device tree.
> 
> My main reason for adding a separate DTS is to preserve the Sige7s board
> identity for long-term upstream support.
> 
> The CoolPi 4B appears to be discontinued and is no longer readily available
> through the purchase channels listed on its official website
> (https://www.cool-pi.com/buy/). In contrast, ArmSoM is actively selling the
> Sige7s and has committed to producing it until at least January 2034.
> 
> I'm also planning to add mainline U-Boot support for the Sige7s and
> integrate it with Stubble-based UEFI booting.
> 
> While U-Boot could update the model and compatible properties before
> booting Linux, Stubble may replace the firmware-provided DTB with one
> bundled with the kernel. Having a Sige7s-specific DTB would preserve the
> correct board identity throughout this process without requiring additional
> distribution-specific modifications.
> 
> This would also avoid confusing users who purchase a Sige7s but find their
> system identified as a CoolPi 4B.

Maybe just install the DTB under new name if they are identical?

Best regards,
Krzysztof

