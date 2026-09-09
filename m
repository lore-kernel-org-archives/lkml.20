Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F654529E;
	Wed,  9 Sep 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955762; cv=none; b=EXDhFq5zOoJRzK4tcivlwrGvnUf+btstWXPqbaE1maRnbVQ/8UxG70QcaLeI9jFQhrjrLCubL/w930lCPR19BBSo7nzOJW4FTupljaO3bvhRX9VBZM/BA1IcSvsaFwm0tF4ntyMB1qyiHJz13rAJXVA12SA1bahH6sdYUGwdCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955762; c=relaxed/simple;
	bh=16YZ5IC+HdCfW9Gv2q6DSRPBc4Oo6oiTFsl55l+7LW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJtdC+Hv+oG0Bek91yfo2cacVMUvNfi2tgoI+Uwk/6u8Z1YaZIFD1Lie7vQqxrC5VVmHSCKHum6hDV2mokHg+UQe7n+X5tsWeIDbAPcrFYr0itJiJmgRwVTkC/dcaoT6LE2nG9ZI7KEbCmHLB1h+bIL2XdeoM6Jtu9aPp6prknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dq/LWjKq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dq/LWjKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788955758;
	bh=16YZ5IC+HdCfW9Gv2q6DSRPBc4Oo6oiTFsl55l+7LW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dq/LWjKq9R7Sc7+ktwF2/dCAxf7uVwelpU4kJG7OWO8q/vs2qZE9yJsTGg3QG/A9D
	 iBcwmO17Jx7yt0fWIkI+mySR4HpnZT8xOpmNp22llHfXm8z8PcK2U6ZXPUEktcA4E+
	 Tv8uN+ELQCatigLdTx03hb3k8vipZiNKI6JlIxtg2FeWS4rG+hq6HPy++fspHDGK3v
	 WmC8bxF0SYlM3Xu1gAINU86Duj6xZIAocLqM8Votoavdn2KM7tG5q4gF1nTju/8LPq
	 GwZvAT1FqN5ilphJEQARtHCX/xyPhZaW2CtFmftDRmc/8FHPS9vaFrsS4aOBL4sKqN
	 oWY6U79N7Uzfg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D94917E0D02;
	Wed, 09 Sep 2026 14:09:18 +0200 (CEST)
Message-ID: <5d22e425-1299-4c81-94d1-6ff766432463@collabora.com>
Date: Wed, 9 Sep 2026 14:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] nvmem: mtk-efuse: mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 12:48, Roman Vivchar via B4 Relay wrote:
> This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
> its efuse controller doesn't work properly with 8-bit reads, leading to
> invalid data with current mtk-efuse driver implementation.
> 

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo


> This behavior can be observed with devmem (0x10009174 and 0x10009178 are
> thermal calibration cells):
> ~ # devmem 0x10009174 32
> 0x00CDD4CD
> ~ # devmem 0x10009178 32
> 0x0F76865D
> ~ # devmem 0x10009174 8
> 0xCD
> ~ # devmem 0x10009175 8
> 0x00
> ~ # devmem 0x10009176 8
> 0x00
> ~ # devmem 0x10009177 8
> 0x00
> ~ # devmem 0x10009178 8
> 0x5D
> ~ # devmem 0x10009179 8
> 0x00
> ~ # devmem 0x1000917a 8
> 0x00
> ~ # devmem 0x1000917b 8
> 0x00
> 
> Patch 1 adds dt-bindings compatible for the mt6572,
> Patch 2 adds platform data option to use aligned 32-bit reads instead
> of plain readb().
> Patch 3 adds platform data for mt6572 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> Changes in v3:
> - Pick up Rob's r-b tag for dt-bindings
> - Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
> missing on the web mirror...
> - Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com
> 
> Changes in v2:
> - dt-bindings: make mediatek,mt6572-efuse standalone compatible
> - Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
> - Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com
> 
> ---
> Roman Vivchar (3):
>        dt-bindings: nvmem: mediatek: efuse: add mt6572
>        nvmem: mtk-efuse: add support for 32-bit aligned reads
>        nvmem: mtk-efuse: add mt6572 support
> 
>   .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
>   drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
>   2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260710-6572-nvmem-eb98c7a73351
> 
> Best regards,
> --
> Roman Vivchar <rva333@protonmail.com>
