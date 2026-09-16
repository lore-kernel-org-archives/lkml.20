Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998361FCE;
	Wed, 16 Sep 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555163; cv=none; b=r+R9sD44aSTWyb8i5YabynGLMVXdo4PUxZ0iGMMqKIbEwIylyq9aGF5CtIhZV1JEyxP95YN0aXainBSSR2As4R00ZesWHcdxIhEAvEK7IeX8bDp6dGzlmoEvrFVYlkxVYFE3SGaxJ6HTALOOWD4DyqITdp2wUx9Kn5R3dlg2Gb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555163; c=relaxed/simple;
	bh=wlK7T+thxGW2u82RLGOMg5hccJ0lex45IGnPBtdSf+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyNUzb6+q5eI4BI0b5DGEiPjkcsbmhx/q1VrutLCzY5WgJlAbMoiOufzl42XwKZnRXgSU+46sjGGzpxN9EwwWAIAFnyXhGHQFXGFCuglFbYh39c4PaWgMdvpaD0PGMXd7QER/X3dZPed+oqbfAUAxuN8VQ+/fRq7JhLTS6LOA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XDkcVR4f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XDkcVR4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789555129;
	bh=wlK7T+thxGW2u82RLGOMg5hccJ0lex45IGnPBtdSf+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XDkcVR4fSHHhOs1N1vcHFg47P3vFhftFp6pUVCKCejhDlKhHl0YV2j4ccwYKtB78D
	 VE5OdeUcSdGfZ8Og+BySib3uUH6sJ4QtT6DEv2KTrcmfnHc7BNgVkUvCy2cr9byTyi
	 nsZbCe+KDJDncoB+lP1hhb9oMqt+XmtKdaYTu+NH3sXM0iF+zp1SFPj0ds+Zrxyefu
	 QKrNRLv21aRh8WJdFFW4r4now/D/7afQ2a/L6llIqLA+Mb/FXJDSvsEKGvLmm3Sz6C
	 kVzGcYE93SZ8m844omREpFeZLOn+A/dxODdiOLNCH45wnOJIPf6ABjv5Vo7SvOrK96
	 DSC0PFNcQM2sA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC37317E0420;
	Wed, 16 Sep 2026 12:38:48 +0200 (CEST)
Message-ID: <bcd66bb6-d7f0-4c31-b527-c1b710df3909@collabora.com>
Date: Wed, 16 Sep 2026 12:38:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] phy: mediatek: xsphy: add eUSB2 repeater support for
 USB2 ports
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 14:38, Julien Massot wrote:
> Some USB2 PHY ports are connected to an external eUSB2 repeater chip
> that sits between the PHY and the USB connector. To support such
> configurations, this series adds an optional phys property to the
> MediaTek xsphy port sub-node and integrates the repeater into the USB2
> PHY init, exit and mode handling.
> 
> The binding follows the same pattern as the Synopsys eUSB2 PHY, which
> already uses a phys property at the sub-node level to reference an
> external repeater. The driver change similarly manages the repeater PHY
> alongside the MediaTek USB2 PHY.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> Julien Massot (2):
>        dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
>        phy: mediatek: xsphy: add optional repeater support for USB2 ports
> 
>   .../devicetree/bindings/phy/mediatek,xsphy.yaml    |  5 +++++
>   drivers/phy/mediatek/phy-mtk-xsphy.c               | 26 ++++++++++++++++++++--
>   2 files changed, 29 insertions(+), 2 deletions(-)
> ---
> base-commit: 917df6be58562d024374b4076e6e7618876a0c4a
> change-id: 20260826-mtk-usb2-repeater-usb2-7d5bad6afce8
> 
> Best regards,

