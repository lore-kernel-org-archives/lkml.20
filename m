Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D03D7D9F;
	Fri, 18 Sep 2026 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768380; cv=none; b=rZFf9rTuocU2pnaP9rU5fdPI/HaW17d/versdH37PQR422osgSrRVP4AVEZxNenmFFBElmIAPHpM3Pr9NYD6q+FtUdX4BshlKjjwIsVfmO2A2GStFsSx/Q5GjxbOs59vHM7bZlUZ5EStY38nrY7YmCw1oLoTH4HFjlREoqVZKR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768380; c=relaxed/simple;
	bh=PxHZY7gPLw6GvHpgwubriVfc/bvdEiuUW0dJeJaGNd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGTNbvtgIlbE7Ka5b43Sf7NCmt1uAa7387eAfJu0Pv1p8SoMcUimKWWfzASSWzGpZH4E36nZR5nMdOK95EXZgEBWfVUzgIIp15Kn8fEkBKYKgiLNOEJM5rVWt1oahZuiFR/OpCNDrpyuCVQRafpWy7dbFMcgty3rgfE8lt+xtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4e2esu+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4e2esu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD681F000FF;
	Fri, 18 Sep 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768379;
	bh=8W8XO/Ae5cM2yDYef7QCLLw8szG6m9g5X/FwN3K83rI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N4e2esu+nbbszP6tLi19HQcyp3UTfm/8Ra6HgTLuOQ+lNSqq8wN+HG+5h6voAyqvw
	 JBkuq0O+9qHVnNQbBgRtykiL9pO3Vt6BwH2Sj8pF/dmFnLgHgRR7aDvmMyMcioECsa
	 G+aklz+r4vk8Zf6tskvGHkWPFLLypq9CoO1qx+wVAOYydQqrmMy3HKK6igwX3IHg5M
	 sLlhMMa99E+cjHdfktxpavspkszmjIeW8oThUebLcBwp6ttL7d/w/VRXtIXH6Xkzw9
	 4QKPO2HHZrpt/1GgREjb06tQk9uZU3M+lxyfNiL7jZ1dCpQEMKqJ0qcVPg0k4lI7VI
	 ypWSSAtI1vISw==
Message-ID: <abbbc648-6284-49b0-b362-5d41e34b3e42@kernel.org>
Date: Fri, 18 Sep 2026 22:52:55 +0100
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
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/26 11:48 AM, Roman Vivchar via B4 Relay wrote:
> This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
> its efuse controller doesn't work properly with 8-bit reads, leading to
> invalid data with current mtk-efuse driver implementation.
> 
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
>       dt-bindings: nvmem: mediatek: efuse: add mt6572
>       nvmem: mtk-efuse: add support for 32-bit aligned reads
>       nvmem: mtk-efuse: add mt6572 support
> 

Doesn't apply cleanly pl resend.

--srini
>  .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
>  drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260710-6572-nvmem-eb98c7a73351
> 
> Best regards,
> --  
> Roman Vivchar <rva333@protonmail.com>
> 
> 

