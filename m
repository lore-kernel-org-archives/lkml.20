Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B735C68C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810714; cv=none; b=HRwpThme5a424p9mZUnUr/pw74zO+HOfgcxy4B0Pk6wtxK5IqkfG3ZA3+j7qyNgtYD/uxOyepuFQWF9MuOaTpndfyT40iimQqzQtvq8jZX4yFVFEjPojdzFtJ6uSnqLbK7FSOASNn/Mv94Qx3YPbJwZ8LVb9REbQUuVBlbayP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810714; c=relaxed/simple;
	bh=FrMvHT1wZFZupgK65Ofd7xRfoF8OXpNBz2uLeNhg/gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp8rfgcfioetxnkNUBxBMEfIY6mGa1vtZicEbAMoYceSeMigAhn2WyAzMFWNIfnJihalOrxNPYp2ulx2xki8/4peTsX3iNYDuSLcxxHUNgBQsoJU1ygitP/EId5NTKBzXgFV/Y3XVgCJFVjrWAyCIb8ZlMsuT2chrIB3rlXjP2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=pKh8JD+N; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="pKh8JD+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789810705;
 bh=zGrl5lrYdWqS+T79tPrrdFjy8nze0T9cQfR/nAnT4sY=;
 b=pKh8JD+NRtk7JZ6sjk9JQd+dSZMxuXcVAeB4GkmQnsB2zi14Mn1Xc63wgzO6lNHyu5AFXzDTF
 skdzXDL4jsuW7InzilPqzUy+21dkwA8gV4L3wCacwTD7YzNY8Jpa0H2N9DYo6+eAmlNdFyY9x/z
 llkHRuEjGYsN5fegXCIf+XtOSWARYEvr7u2rV4OZCJQOXfsOb+lAuNMSu1PHZ3KlKIw/AXivBey
 v8wRKWGaC6agd4vMYZQmdSAkW36a3Ep8id6guakuYwoVm+II1u3VctOF4VCnytvKMilbTw0+v/T
 vOcv9/yS4NDbpW5plpLo2aXVWGqQwGBfN3hYwNuqvJQQ==
X-Forward-Email-ID: 6aae5808a917c0722b3828d9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a558ca88-6981-428c-943d-6fd904d8ef2b@kwiboo.se>
Date: Sat, 19 Sep 2026 11:38:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add FriendlyElec
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
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
 <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/2026 3:35 PM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC. It shares its base devicetree with the NanoPi
> Zero2, so list both boards in a single entry.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee9..dc04946db0 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -347,6 +347,13 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
>  
> +      - description: FriendlyElec NanoPi R28S/Zero2

Maybe name this something like 'FriendlyElec NanoPi RK3528 series boards'
to closer match other NanoPi/PC entries? That would also prevents
re-ordering once more when NanoPi NEO3 Plus is added.

Regards,
Jonas

> +        items:
> +          - enum:
> +              - friendlyarm,nanopi-r28s
> +              - friendlyarm,nanopi-zero2
> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
> @@ -388,11 +395,6 @@ properties:
>            - const: friendlyarm,nanopi-r76s
>            - const: rockchip,rk3576
>  
> -      - description: FriendlyElec NanoPi Zero2
> -        items:
> -          - const: friendlyarm,nanopi-zero2
> -          - const: rockchip,rk3528
> -
>        - description: FriendlyElec NanoPC T6 series boards
>          items:
>            - enum:
> 

