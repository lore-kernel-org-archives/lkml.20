Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4F2C21ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147093; cv=none; b=tKoxmlf40PHMd/XMcP+ze/+uOcfsfS4tVW2UYhAqrO3nCegz8gYxRmGVboERPfYow6x29z3okqRRzuW9xOMxaLER8kGUKEzkXaoLoq+bsMAQRnuU/HtHIdwbPx8I9B+mqcJhM6lbGtY0JGwxoks7N8DsnX0y/yZGt2nKlIlPox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147093; c=relaxed/simple;
	bh=K9mC195kTGkDqe576lBOFyGmxBtljNyscPxIuA9C7CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyJ1ZRLOSLNZe/M1XyE2mvNlrqfj8EBpYZWblkuGvOTOwkeNSDApViUY1oM2iBgQ9+BzIfL3/HDDYBMzR/9/gOy53oghmaCNiAL7PPRqevVOM7Ee98LCQXV+D9gF9P7pkkvdWkRfJMacqzY9NPgUIisjQa5JO7fTVaZu2re0j6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQj4jr0b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQj4jr0b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso46582975e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147089; x=1792751889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=SQj4jr0b+A613FC6vNIBdD0mqbr7aBlY8+Ytl512zUnY5muA/Vh8R7ppco/GQxcUbt
         ZuwJx88IbqEQlmNQ4zZrLCYjTRbj3eaQQev9OZjuyweiCdfM6MHSNg8GV3kjLKiPRLMJ
         I/EmeIgUq6IgnmGJFCKAZEnx5nsipyxSBLhx4wHr6hC+vWhi0E2rdM+ZNSC4wrZWN+g+
         mi0uzhP4WmJ0qj9h4adeWtG8VQvjGn+mHvQBcPnc4KBVW2Mf0o2SzPuzc+6h/9r4GaAc
         2bC2ewGTOpQEFTCdFU7Pz2ci12qoa0f2T5kigAp9DL2AxTDg77MsbtMAs6a1kuk0/efy
         DEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147089; x=1792751889;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=unkk8QVPYkUyHBBnDmQUjgEH2zDVSDgij9RrBq9Iq3eOMHeEue8I4yMt9Qd6SM0nRH
         vZWSb9k4bDHos6uFdBG6eK7I5R9RM/6NuS+dmOtK3LMx35Bwym15c2j+czIzx3nFXZTN
         XD41Zd5uMlTpyXik5dKs2BNZH7jtZ/c6X9ccQuDyzYrz6uBc1j3duUTz+sQK5f/63FGS
         mRS0jTZX5tvQWCQczOPszSaWtykwGWe9s/xQE05pdjyFZoSosz2Z5s2vNS8Pvc/G0T3t
         2jtthaJpLzBUUG6Kcci4dm6PtKgWEBxJTfkCvvTWbWJ7FGfq9ApCAtXDKhC8EYPrGvbj
         GzaA==
X-Forwarded-Encrypted: i=1; AKwUvByRN/mFRR0+vkSaoPgE+uG5jJtshaU5IizxE/8TtWmJxUE1I/fGPID5T0A/+u3tdGyc84AhlAchDX1tFgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCTZwtLOClUqa46i7sGcLUZXmF5r/+u2PV0YdgQUzDz+6HvuTW
	XfRmM8OVd+axEsosQtcYZ7/WITSepEI1bp7wQFYknfzfqo0bFZ+baUs9lsfZk/4U/ivyHMVyRKH
	D1Q0E
X-Gm-Gg: AYBFou2UqKU89h3RnOKPJZFD6MXyCRuYyUsaV1Qin7KwB3Yi3/DUSNku4zBPk7UPIEp
	VM0KB0loGPUZRS2TK7tWtFndOeJl2b1iqIdkVE0PRZDMrbpQRXWS/NQKm5fidiJf1UpLHw4rgrW
	C1+JOv/LipclBCQmbP4Tv7Co0w2x2rEmvOM44dVVtbBNQfI4g+DMNjULIQg2mQTvVBU4SbrBLdP
	qKhRQ1cKYWiwz2LmhsL+688wH+H7n8mTj4V4igw0uvRR5LxZUlj176gnNN6bxnv0Wv3AdJy/un1
	TxsF9JzfUec2WeSy8Z2W89YD04ORTaql2g6it6HOK7l/glGVQ4YqCAmCXygVzHe86SYdJbvS8AK
	4Lv3FUwwsZGBkM3joVjMhrftBC4Zt9/D6McBoLHoTjfxXerk/+XmmI2pESLTWopETh14jq6YYSK
	V/myzaZ9tQVUQ3VDk1f96Qgk7l2n+bXu63PXz7LcfB+S3nJRjzn/cGk5hWRZfJ5uH3UXOk05+Qq
	0TTFcI2DCU=
X-Received: by 2002:a05:600c:1c23:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a1cef3fd00mr28299025e9.9.1792147089174;
        Fri, 16 Oct 2026 03:38:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm26430935e9.3.2026.10.16.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:38:08 -0700 (PDT)
Message-ID: <b4a76677-0929-44bb-9c94-7ceb09952168@linaro.org>
Date: Fri, 16 Oct 2026 11:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 09:56, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
> blocks have one of each and can use them at the same time, so one PHY
> node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
> PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
> PHYs.
> 
> Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
> transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
> DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
> host.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>   include/dt-bindings/phy/phy.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..9ead74d9a172 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -29,4 +29,7 @@
>   #define PHY_POL_INVERT		1
>   #define PHY_POL_AUTO		2
>   
> +#define PHY_DIRECTION_TX	0
> +#define PHY_DIRECTION_RX	1
> +
>   #endif /* _DT_BINDINGS_PHY */
> 

This looks like a neat solution to your problem.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
