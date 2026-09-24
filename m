Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5C199920
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266342; cv=none; b=ak5Bz/96CCdQ/JaAiBwKj7ed7XQrsdIzunYoaxMoSo9Ksw8VPPs1pxV80kHyJr+9R7dgmlOVXONkQdhdShaeBz0M6nLUz/RGSpUTDIoujYNrzvt6q/0yy0q1Eghh5FezwWAj6XjxuKNMbjd+k2tyE9pNRzWvguur0Agzs0dydf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266342; c=relaxed/simple;
	bh=GdCJNo0F1J7NfeUroNjiOGTicQbhTXmvB4QdfF9GnM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaR1lO8XrJs5ZYn1uil6q5Ty/uqQLKL6sUHahFKyHo0BshVKoj7NTWgGdA7h4/MBiOk+3/eSmTHxOeMm0mzxPiFlNnairulZnmkBv6wIDCoZcgO9cCOqyo8bTQy+9HpTiUnSKfnMmgnrsX82A5/swvoXO2V5PpeuQLQk5Viplqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BeF3eaIG; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BeF3eaIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1790266333;
 bh=RPplfzolB2pTnE62YOM17Sgrq0rS4rod1kMvEv6yvGI=;
 b=BeF3eaIG+AEXEtaHIs7gJMEFhn5OC9a52/G58dRbamCfnQnGyh+Ue0Rjj+GCZYlpnn7Je7fcK
 7IT9/XDxJ7OTvDSyUBFIqhjnu1xezaby5u/zIDqrNR5G9IJYvQ5f2s+x1jng/ls0OzvxeFNch+R
 +vIm6gmb24M7KkStzZiD33/3upUk77Vi6j9rt07X+31uEknwC+mF+abfBiRZaMl/Gck8lPiTrkV
 WS5wH9jY9gN+ELrRXTmRt052DgfWZUgobopWpQbfluJ9/lYJuzUhy3CO61Qi7w00HKQivt1cwKi
 M3vErqjKF5l0Z+Wcf07Jk6VRJzgWPpzOBxET2K78hUNA==
X-Forward-Email-ID: 6ab54bdc57e24cb1e471d61c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.16.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
Date: Thu, 24 Sep 2026 18:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Adam Wermuth <adam@wermuth.pl>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260924071445.441822-1-adam@wermuth.pl>
 <20260924071445.441822-2-adam@wermuth.pl>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260924071445.441822-2-adam@wermuth.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Adam,

On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> which is served by usb_host1_ehci/ohci through the host port of
> usb2phy1. Enable the controllers and the PHY port so that modules in
> the B-key slot, such as LTE modems, can enumerate.

This and next patch is likely best suited as an dt-overlay.

Regards,
Jonas

> 
> Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 149a5306bb03..ad9a91c0d0d0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -758,6 +758,14 @@ &usb_host0_xhci {
>  	status = "okay";
>  };
>  
> +&usb_host1_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status = "okay";
> +};
> +
>  &usb_host1_xhci {
>  	status = "okay";
>  };
> @@ -780,6 +788,11 @@ &usb2phy1 {
>  	status = "okay";
>  };
>  
> +&usb2phy1_host {
> +	phy-supply = <&vcc5v0_usb_host>;
> +	status = "okay";
> +};
> +
>  &usb2phy1_otg {
>  	phy-supply = <&vcc5v0_usb_host>;
>  	status = "okay";

