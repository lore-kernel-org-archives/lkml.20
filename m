Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704335;
	b=JnIJ4K7cIz8PGZKgxncP8yngzYXVIjN3VBWNVM8p1dM4euwWBtiqbh5nrD542BFwqM0r
	 NaJ8R7qpz41Bas2OoNCAh97bai0EyUPvMmNA/eUSQTuDUs1+LdxcUuy1ZLXjn0Kli+QAU
	 ztedS21fHTwOkPnW8isSJercT2p+DfXQsa6mSTLYPQEPMtjirkIoIiBpVT7F4fKQ6Tx0U
	 0xCUNT68RdCKlqYVASpuY3RBG3U/06h7NJzjSeCpuwihmhcUERxH5ha0xqUvzv1/4BQYF
	 2W5+/m4cdq4MjsswOuWFCP20Z9Tl4dMuw78YTbP/FjOu4jA9c/cA7jcBzpY9zT02CaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
	b=Pxbs+3wSRFYr/jvT1LB9shkFhAz5VSyv30g/+4hcDosLRu2Kr86DtcDMR9i1w0h9o3yY
	 TZ05E93A+tIU6CBTPYmMGaPvPUvVUueNYlnUT2AsLa9tKANncLM9lbD8Z1R68+kqtOgmd
	 VW7QDurrpOFTnt6J3W02EtnQ7arZ7/BSdJiE8z1J6ECcu4Hj1ujOd1R9HUIZFXF010up8
	 kw2AzXk2gvdRFCHUxy9H0CZBZ0zE9hOAc9xW+KYoY2UDD96/gRfapfKUcfTgZVxqbFAeK
	 kxUf7YXPtytHJ+1GJrXwIwLYlNWDXxGQ8UeKa7wZdYLXF4j2BhpSq5l1gqp31Qj2YMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F507606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F507606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2971716eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704333; x=1795309133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=VVLoFXwqulWeucnw8PTyUoqoKo1n49Ix8VF4rvFKoBGKRxj3TB3ua9vgyrgU4nL2qi
         PmkoJxjWcOIms1fceHg+BzbYP5MEl2G9jm9hFUHK9J4QhiCX8Kqo8m67i3mnnhzTZLXu
         B7koqJKt5c7cKnQFC1prGlQO4bQiXQ5S76HBq9ky8BOQEcznfXKRoOE9o8dtxJKRVfR0
         jGKlG50HAOdRETaAeo9ct3E1rJju8j5wA5dFycvcn+bvJmkq1Jt0hWkrHPn7nj+pzTI/
         jt/0qZkh6VIukufGj8bLAWqdzfXdUBhON83OXlbaGjqI7UH1Etad5mwVsjEeyePuQ+u9
         OC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704333; x=1795309133;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=s9iTmP/k9+we/PcoPk8XX+N+G0px4A+e85HlO8SnHRhoCs6kDg1mn0zW3On8PLzUHv
         jM1aQfn41qdbAUbzdiPZ9lIK5ZmbpnvJExsklFzhnpXNSaiGSG8j/vFe+uIqZPC0MTmo
         Nkzcgz2GWcYSwjTGYbwa+OQ/M6TRyizW+nDsQJyFHTd9/4BeQ3kI9W2hsLJbh5mTrKmB
         pnR9Y0vnhfd44L9CErX2JC5224boCXWnZqJzDgMRjdWc91mQtkTxcjejoHqyzwjpDvax
         My/XaFHioXAys8Esv/OIKNcM+ALSIh8l55b+FREF30jlA4BGsjh0jMwXew+I93h43OF/
         3hIA==
X-Forwarded-Encrypted: i=1; AL+hErGo6Rb55jsrTYQKiiBDYnP8+0a3fI0JNo02qgf7czZoNgfGOqsoA5mIMG97VxD7MvPz6NRJd1qnTMEFUuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6SqWus134lIKQmxDLrmDP4YWcz4Kd4lm6Br/Xukgz+bR69fJ
	p6VqQNNo8PIo0kL+LHI6aoM7snocgw/0C1tRNwkQnCmA0tJpAKMsS1ib
X-Gm-Gg: AYBFou3KDQiCoxDdW4VNoYviO+QJgPDeGJHpliG4rsklFffQDhCZRlhzu9NDtqAte9i
	66Gy6c7pbcx9JdOHFVjebr7j8Em1ED66RLceWab0IhdjgiUUzQE918NDcYngHoofnXEASYiKzox
	s1zjUJ2IAxryYKVHfKArR/GcmDS1GNSJmL4j998k6GrP7rqYC0xJ/1GLXld0sjZUCCFxsi7svHc
	oh+ma38G6XOER9kIcfOcGNGe1YDWrtCfTpF5Qbs54m7dvj841p/CCIqZcjBD31Sk3gCfU9FVhzZ
	YazPhXIQDDL01bs/0j5+DC3gj1uKlhoaRTwLLNzgU4atJMEK06cNXYPCamcdnIeb74dPgmByaOU
	d1UgGBnDbJgKBdnc23Nsk9X2JOLEwR7RIC6CA+wTPKmePB0pcwjIMo4Phtv7CdATsps9r2Yx75I
	pt2TdOZqcTMPuNm01eiztRzQPOoq1MITBvnye0XL/4yoLO8nzP9FKyhOsDQcFwJCM4GbTD7fVU6
	C2C2FZftdGt+g8C0CPpqw1z2PH0yTJcGIjPl5PtNKDnHzmj4VZvqkaTgmsykZCEMJc7ZNpRSXkE
	piz08u3BjHTFP6w7/cHxUg03vg23Ovfou4wXe94qXh7BG0EOdW845ceUfSU3h3BOEpY=
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr7375931eec.8.1794704333340;
        Sat, 14 Nov 2026 16:58:53 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35679526eec.21.2026.11.14.16.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:58:52 -0800 (PST)
Message-ID: <0f536451-9f7b-46f7-acca-e10e54dec37e@gmail.com>
Date: Sun, 15 Nov 2026 09:58:48 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 3450e28b4020..dcf3bbde3e8d 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - rockchip,rk3399-dfi
>        - rockchip,rk3568-dfi
> +      - rockchip,rk3576-dfi
>        - rockchip,rk3588-dfi
>  
>    clocks:
> @@ -64,6 +65,24 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> 

When I applied it, there are some error.
Could you please resend it on latest commit?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
