Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07284137A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377228; cv=none; b=UJQV7TOqJSVG2cpa+slB/PqGMnpvPtoiMuciXhuoEJA4qV64kihGq/FYY1p5Qc6e6aYtyVKcXt9lG0XKAvb5pxTzdQE3lSuyXFw+CaLMQ14dz/v44Km/uHSydZcgu85rE3dw98x9MHtAY6WgVKpUwyvxaAbbyMAmjBmYoYRTCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377228; c=relaxed/simple;
	bh=wAkA/TF0GMLe5sbkuZ12h0qdqM2Bir9jdQUaL+xkQ5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KttnMo8vc/QnxnjmNRaXcMpfIud46sQDh/KHx2xuq69l63rWNiX7ja+Apmi+ka5p4DzCLdyZjIkv8D3ZrUnXHcRuPFIDu+I8kbAHLptaSdKEj4+y0a1hTVwcX72kqq6fPB5m4V/IfkQmWOGi4Kw/sVg1nhYmQA1FYp8ZBeFJo+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=t9Rxma3B; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="t9Rxma3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789377225;
 bh=wxs7CW/umC+9+eoq20Tn39ltfqLOc3ED03x/dPGj1Jo=;
 b=t9Rxma3BL5r5zWM671e/UmkLCwe60TeH6/NGaGibAOjjxtYO5syKWtIEZReNQDeFKgcapm+t1
 JVry6UchmDOVz852izKF0dlMa7+cvjGzhhI+1wuE6/nzNtAblTqVkf+kPg1QAup5cdqIu518G7c
 Ot1Ixtit1Ydb7IDM3tSBEuLBw+WOffpzElbxMxm3DU18AoqjZHfFN2fiSsvTtw+z8rejx1XonHD
 cdj7NF6XOx+ga4IRHz8fymjrBp00Z5LLSneeCyVqv3gifz1ohu8Ld+iCsjxVq4yJ+huxqW/UkQ8
 48CRb/ZrCImmG81yadGWUUB2vr9md98Q1o0vJsbB6UHA==
X-Forward-Email-ID: 6aa7bac38051bf6db6060bc8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5016be61-1a65-4fd6-850a-96fb0ab17d28@kwiboo.se>
Date: Mon, 14 Sep 2026 11:13:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: rockchip: Add FriendlyElec
 NanoPi R28S
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>,
 Andrey Korshunov <razor1702@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
 <20260914-r28s-upstream-v5-1-7409c498e8dc@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v5-1-7409c498e8dc@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/2026 10:24 AM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee9..709e2cc44d 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -347,6 +347,11 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
>  
> +      - description: FriendlyElec NanoPi R28S
> +        items:
> +          - const: friendlyarm,nanopi-r28s

Maybe instead add this board as a variant under existing NanoPi Zero2,
seeing how it will share a common .dtsi-file with Zero2, and also with
the NEO3 Plus once this series lands.

      - description: FriendlyElec NanoPi R28S/Zero2
        items:
          - enum:
              - friendlyarm,nanopi-r28s
              - friendlyarm,nanopi-zero2
          - const: rockchip,rk3528

Regards,
Jonas

> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
> 

