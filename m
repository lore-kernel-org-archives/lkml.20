Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360741F349
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378116; cv=none; b=LiZPEkQ0MQg6G+6TNPSwFaNnZa1+csNc8U8U8Oc0Qcy0sYvKWRr+G46lScvBGQ9qZQfq9xv3TWNX/T6neh8zt0ftWWyrmkPeXqYoOjFRtbH7VtmJfL6gTIMnqSfFtK9wkXt9/4jHgyFWCUMcYblYckf22+q9rZcv8F4RmiGlBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378116; c=relaxed/simple;
	bh=aOoRiF5ZcIqkBQech3uSRQ8qZjtxOqi4FHTB7U3fCc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYvoT3yC79kykO7RvyTYr2yWjXwigvi91ZdpGiigX2RPgYsp8G6BDB6PwUFZ8/5DyvnTNJ8LIIJI4+FfITMkzjbmoeVWL5IjoLghnH1aRJ94FmHpwIduaBPUdHXXVgJpGZTDatqcD9Mhhw/ZH8WbbyaiCFirzZPEwiy1cojkbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=mk+DFCC8; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="mk+DFCC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789378113;
 bh=mewteUdeB+vh/ROowqyMXpJPpjRCsZe73lQbBQU5dyg=;
 b=mk+DFCC8Qpde+98HYbY9GEi6/LaM8jntiy+C6HDbqk5wldpPyE74SdWlhus6jQjDZCcSS98ET
 sKudZDU/hL5AjQplmZtuBnNO1t6iCaQ9VDLjQpaIRPK48QQTNEPMZ4iHTyntm+kMYiz8Fqeyaxv
 jDNNI1/uvbXFu5YyQrL817sVpK4275JDnAmJtmES+ULLQ9xD/cUrpH8V3UOI3uasL9DjDik3FZD
 zpgC4QMjdImY9+VjgNOM/s1k8PY7NnOGFJEXWoVv7NkrFWgt6pXEOXj4gTwj0GwRcAOnPgtDsCK
 /pZ04KqbRkpZ5HISXw8w+0DEnqsNGDkz/9+xe5zwx3DA==
X-Forward-Email-ID: 6aa7be39469f56687e0fbce3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1074c834-1d64-4bda-b6d5-599755324dcd@kwiboo.se>
Date: Mon, 14 Sep 2026 11:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: Split out the common NanoPi
 RK3528 parts
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>,
 Andrey Korshunov <razor1702@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
 <20260914-r28s-upstream-v5-2-7409c498e8dc@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v5-2-7409c498e8dc@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/2026 10:24 AM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The FriendlyElec NanoPi Zero2 and the NanoPi R28S share their power
> tree, storage, RGMII Ethernet, RTC, SYS LED and debug console. Move
> those parts into rk3528-nanopi.dtsi so the NanoPi R28S can reuse them,
> and leave only the board specific nodes in the NanoPi Zero2 devicetree.
> 
> Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 307 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 304 ++++++++++++++++++++
>  2 files changed, 313 insertions(+), 298 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> index 97d85124d2..a8d99f983f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts

[snip]

> -
>  &usb_host0_ehci {
>  	status = "okay";
>  };
> @@ -347,23 +74,7 @@ &usb_host0_ohci {
>  	status = "okay";
>  };
>  
> -&usb_host0_xhci {
> -	extcon = <&usb2phy>;
> -	maximum-speed = "high-speed";
> -	phys = <&usb2phy_otg>;
> -	phy-names = "usb2-phy";
> -	status = "okay";
> -};

I suggest you keep all USB nodes in the device board files, NEO3 Plus
have USB 3.0 support and uses different configuration. So it will be
easier to get an overview if USB nodes are kept in the board DT.

Else most of this split matches what I played around with for U-Boot at
[1] a few weeks ago. I plan to send out the NEO3 Plus DT based on this
series later.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commit/40382468ba7ce9aa2e7dcde0e59003fd0d220b43

Regards,
Jonas

> -
> -&usb2phy {
> -	status = "okay";
> -};
> -
>  &usb2phy_host {
>  	phy-supply = <&usb2_host_5v>;
>  	status = "okay";
>  };
> -
> -&usb2phy_otg {
> -	status = "okay";
> -};

[snip]

