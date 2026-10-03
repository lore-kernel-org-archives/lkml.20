Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A53DE456
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024395; cv=none; b=QDsGdAmq4WS/O25Uj98nfP4XosYGaGVLwRZHX9kduuAb2bryBt4wItT92Bq+927O888ZiQMDpNYn9L7FioS3PreW726FfDCZEQyKx35Ibo0wruLHhji1fMgsZB9MWGoMLou0CisCys4iAy6/fgI+1HUGgSBUTmxh5Dj7AIFxfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024395; c=relaxed/simple;
	bh=idvxGuLkq+sQb4zIcAERMp4WjduqYGvTIN3q9L7ywvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oT409fWhPJLrCyBwzsF5VwVJfhB1Uwxkpl5tNOQi6W+OUAZeNrpbcvIo9e+l0coBn8aQW5jpvU+aftJCRK0Uv1K5ukF64PQVeRafaQU1PX+zCswEEl9fenCdB3GX0aVh7i5e2earQCq2X6SeqhVSiPpWSYjFeUY/ast/oONuEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bp7lyqy2; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bp7lyqy2"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e01f5c0aeso76269866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024391; x=1791629191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=Bp7lyqy22dtkDtBgCaPOy/YpLuidGCaKL2LluRaZphZD76VXP8ZUceOL7fBY4iEDAG
         P7l+8iJAh0YKs2C0uiJw1n+itNn/TpiEOVBcAdiOW0CWxj1VvSPTmLF5c+gREmnSMJuS
         fU4KmjbWaPLVXMZw7ORLteyYv5trjH422IaUOvcOVuOq+0yBzST7xasy+bA5SVDiOlY2
         qavtykVnoold9L+exf2ilzsrEqQsUALJE+Vc+4WLv/pWRvkTq8WGvVBnharq4qLPDmZ0
         xwdQAar3xtVsibD1PEaXl8RukdAEEioKeHm12tk8g5PdTyMzx46DE9uOmqaJmdIJIxXj
         omCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024391; x=1791629191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=ajt1gMTlsX/nDu/UfH9iDYFQg7JvfFjlCPK6Df7zXP0RLJTNINkiUj6jMSNgSNPHIl
         hIV6ePpqZKVPGMMN6CfOA6WhM702Q1K+q3QeAt+bFyt4ON1xYl1n8S+O5YheDSopCbiO
         hpYjQ8zP4oPiWwQqXy/V5LBg/Wr5Q03aOHtgBaCMGXUc00Wrdc+Bxv5JKPch5ozs+nhA
         t5UKcp1+Rlzc5BG5eI+zJacKhsy/NTGRY6kdfTNSCZBQf5ximHLfeWlxMC07j0i7V29+
         N+r82vbKCGb1vdDvLWM5iltH/z2lQVjp5sMUepA6+AJUl7iJYBXv+zcjGtXizevxTD3/
         fYOA==
X-Forwarded-Encrypted: i=1; AKwUvBxiCVNS936eobeGRsCnnR1/NGSac2wvvP/4kDFgmcutIewgdxDOsrJwGI9qsxlm3ToQcjPTtvN/f0XnSnU=@vger.kernel.org
X-Gm-Message-State: AFuF++nGkq88iejaQxc+126LxJAW6Z6ytWrn9n3dd4lxxRYtyfbIL6Uq
	FA6s5jAPVG960KNco7R7koxO1vHbaB4z85yguRuyEkIYzRToAihjBs0wsEXuxn4ZqUXFXMwlWQq
	DTLhCq48=
X-Gm-Gg: AYBFou3jpoK/N6GFdvURNLmYgXTEofpTE4KRGLHLnL0i9qUE11nFwuyvUTKbm1A7CXM
	UCAsD6ztYuxiuOYZ2QRV8c6nfcuOUQbV6Tn1R1tNXcSG405lZXZZ0w+TWFfUJ/ioimid6VMdwR7
	942i90A2If6bzRHnxauhNGqaqh/VCNLbKOwiuoIvkJ+bafwToWb/PyPyJ6BnnzuPOKUK8InwRzM
	PxEMyRPubHX+hm+82vnPty2TM1WWwVnkYCjklRzmS5GYdRQX9l7Dp9eV/M2h1JvL6u920902oww
	DP+SCmqw4R9S+W5KD7lvXyHNCxYRKtMK1l/Txv7fQRrr8x+SwVq+eonUMhDBQRBz7UHFfifBuLP
	JFli4Qw85VtJ/Zk6ZyLOu9G1af+neCgsbi9b8XLrGiWBGoBkMlMnvo8+OXXLVN5fMJ8QLopWr42
	JLZGUfk7zqXlK1Z4T/o1dz9Jtn1wax504/WNMrdZNIAuOA0S5cSe9BISpxBia1/7EV0JR6nTmaG
	vZ0PKHRMIc=
X-Received: by 2002:a17:906:f58b:b0:c2e:30a9:c04f with SMTP id a640c23a62f3a-c2e4ad155a4mr454607266b.13.1791024391402;
        Sat, 03 Oct 2026 03:46:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm192822066b.42.2026.10.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:46:30 -0700 (PDT)
Message-ID: <61a2d75e-4061-4be9-ad8a-a85c5bf7368c@linaro.org>
Date: Sat, 3 Oct 2026 11:46:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <Vv2QfKmkyPTU5VXXS1TYn-cg7DX3OD7InbT-5UjiZLMHVPPDWcj-0hgl7PJxI7ugjmudNTZJfhXCisY2fExubQ==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 11:42, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
> binding. Unlike the RK3588 variant, each PHY instance only has an APB
> reset line, so add the new compatible to the single-reset group as
> well.
> 
> No fallback compatible is used because the RK3576 DPHYs match neither
> existing variant: their control bits sit in a dedicated CSI-DPHY GRF as
> on RK3588 (rather than in the shared VI GRF used on RK3568), while only
> a single APB reset is wired up, as on RK3568. Falling back to
> "rockchip,rk3588-csi-dphy" would make the driver request a second,
> non-existent reset, and falling back to "rockchip,rk3568-csi-dphy"
> would make it write to the wrong GRF offsets, so dedicated match data
> is required.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08..92d0c961f4c4 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>         - rockchip,rk3326-csi-dphy
>         - rockchip,rk3368-csi-dphy
>         - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3576-csi-dphy
>         - rockchip,rk3588-csi-dphy
> 
>     reg:
> @@ -89,6 +90,7 @@ allOf:
>                 - rockchip,rk3326-csi-dphy
>                 - rockchip,rk3368-csi-dphy
>                 - rockchip,rk3568-csi-dphy
> +              - rockchip,rk3576-csi-dphy
>       then:
>         properties:
>           resets:
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
