Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794392980;
	b=u5z36vzsNmQyJpJYyxX7+qk5aS7tkyX+Kq+5+li+5q9vLKu+u1ZU6LATm9PE3bI8ju1c
	 zFexzrESjNdpguEhiYHPiZtTWv7Xn0BEjWjyIInS1RmDBEWbDt3D3m3cEZuiFWyd3QVp0
	 lTYUy3yR99wlERVFv8Q5dnDqWen/75sL8FYfDpFnN+duALkXEKPE+gocXx7UtUF+FirQT
	 K34sa5NtDGGmU8Yv2kS/KcWd+UQEF/1S4aE9ESagFLDhmyHZ/5OzAzF601ZWOVZuiK3XG
	 uCFbSz40ZjfzO0whdae9LQlpKFzuScKjfrbiNojViFshzSLTqObVrTIhHfJnXyC4lqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392980;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=;
	b=4baDXkAS6Q+bPgOhDCe5lGB3b+aGvDdV7OPOkj75vOgC840Uegi+qcL3WqukpMILOE8O
	 LN1lWr4U9uJ0kIgDguWqDjGrv8Mq2VUvbsoTpVJ5r2U4WyzRrbyAU31/TJ/gY1ccWrFxW
	 R5jco2D2d45v7H80lSqa4Rm3NWHjznHv/mRJcTWYjwgb1zGxy/3C4BdzWBSE6PLEr5GSR
	 zLkWIz+0uPG1HczKipdCebgYp1Huw0tBkXhFgbEuiXhmANF+DtSWuwwPKjFPUGdPA6g77
	 q/pDBNQGDmTSFC/AZgHGsg5zAv9p6KfMqz4qigblwj3+pAPBQuwBK5pvXRJ5aQGgAFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AoD3nHzP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E024606A31C;
	Wed, 11 Nov 2026 10:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E024606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AoD3nHzP
ARC-Seal: i=1; a=rsa-sha256; t=1794392956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JTe5DoX4QFDA1xlPbGZSB+3f0P5QxcTRBjZeKv4QyppbcQWFYomOXtmOhbJ5/7eWPkl4gHGAqw73VR+bcZDZ2Zw8OjLS9Nd3fOj4xuJUEL8IeFkcToP+m4oYbB6tFU7tu/1hHYNHek1IdSqlydeFRGe4ojYU1GYgl8m84oU2H1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794392956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=; 
	b=kLNcBvXSZrMN1elJw3mrcslxlwsDBilJJtF8zRGBe08bqp+tfun9Q6WnGnNjtzZ457JezUXauhcz7mLEeqYfdiTHxC55u84W6HkiMb3+GTAUtoPAPIIlIziaKoXGX3hcINdYTFryxcfm0FG6jN5CPHDcURmPd2WDO88dbXQsHwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AoD3nHzP+3PjVMejUKvFVKHMzU3OiYbWy/ZL3CVykrmGsEZBu5qdqjSmtElRKQxat9FbOP/NKZsD1BG+TSk4in1TBCLy9K8uNEo4pyO0IKPNree/TEE8k33cqKiOpYwk3AEDNoqof5c2KjeLMZuqZ8PlBGD6J/lA0lYkIim64Mw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Lg42JcAukHQ8iAveVz5DalweO0LF5sTRtDq7rYcWLEc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794392952987100.75485625514011;
	Wed, 11 Nov 2026 02:29:12 -0800 (PST)
Message-ID: <9b5f5fc4-5fa8-411c-98fd-8655f208e00e@collabora.com>
Date: Wed, 11 Nov 2026 11:29:07 +0100
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
Subject: Re: [PATCH v6 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch.

On 11/10/26 09:18, Jason Yang wrote:
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
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  include/dt-bindings/phy/phy.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..9ead74d9a172 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -29,4 +29,7 @@
>  #define PHY_POL_INVERT		1
>  #define PHY_POL_AUTO		2
>  
> +#define PHY_DIRECTION_TX	0
> +#define PHY_DIRECTION_RX	1
> +
>  #endif /* _DT_BINDINGS_PHY */
> 

