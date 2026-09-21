Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341E498901;
	Mon, 21 Sep 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994533; cv=none; b=o11pG/TXcBZJeTnZXLNbdNaY390JOUqLh97BZ+gwaTMa2BE3Kek+vUn539atKaWqi0u71wqCtcGirVkZMM6ayMZZ/n4UnwQPCVBYa+n2Y6SIcPyCqgWEp/7uSK7ZHdna/0ueLX+KxgrR8Mcr289A4zBsD9aV+KBkMHOBR+NK5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994533; c=relaxed/simple;
	bh=hPQiMzezBqMJuGIHYVTtRUEQcJeICLchl6bRn8gc/fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS8s6Am4ZEqGfMmD2x5ucgXmYGrtwemYIt1syc7Sym0VEMyakeJwSxb5GPbmw4TaEsO8E8TXAJqaV3N+Cu/R7sFCbtPnSb8U3QaEoZHHGA8JYxwhP+dQciFXKAwmCEijg+VEwnSInQ+JQ0InGuwNr3TTkn9oetR6buyiyG/1K28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrJVG2q4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrJVG2q4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94321F0089A;
	Mon, 21 Sep 2026 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994530;
	bh=f+qMWNaepi83wEdIu8Qj9XEItvl/uPB1JxblYtoeB4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KrJVG2q4gZiF5+VAXs9MAKVgKWbecIdsXQU9VDXCKpS0kkJ26mYvBG3tV1TFJJgHj
	 pvC9x4wj8djTYwYa8PHFw49N2eSa+qpk6nMA+o/R0r+XkaBqbFC7kPRciHoP0JxuPc
	 hfPirJO7dlCUA6stF255eifKklgNYMQh5HYAlHc7aBWxfSPvbUZUvMDfbbKnSQkqvy
	 s7eS8HoWVTEIkAgUafUV5rUo1P9/8TFWKLZBNgwdLQn3vSliNg2O/HmzrbDWbhTSAy
	 Yt1vCC9a1ehcIl1WRG7CwPrJ+OiA7Lp6VAshONAKjOBt0JpyH8bPeo6d5Cqi8issid
	 8RXj6+y4gzucg==
Date: Mon, 21 Sep 2026 12:42:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20260921124206-GKI297024@kernel.org>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Sun 20 Sep     , Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
> Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
> Ethernet alias to avoid U-Boot patching incorrect MAC addresses.
> 
Could you point me where the u-boot patching the MAC address?
I'm not fully aware of this problem..

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 8 +++++---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 7125f2882ce8..073cc975135f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 = &i2c2;
>  		i2c8 = &i2c8;
>  		serial0 = &uart0;
> -		ethernet0 = &eth0;
> -		ethernet1 = &eth1;
..

-- 
Yixun Lan (dlan)
