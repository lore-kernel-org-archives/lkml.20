Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821B847B43F;
	Mon, 21 Sep 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987799; cv=none; b=RGyJV22UlkuuoXwkKKmMrtsfPzpP/hp2sz1BN7GgAFuPijQ1+inmJiIf8uOP2bmPnr75SXo0w3KsFk9mhKogCUcO8noMrGGVzLi1a4YhzD85imjAx3zemEjgjOkUo8icNFPrNURmMN72CEySCDBCtVE1q1+eF+RqkBoM8ydNGIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987799; c=relaxed/simple;
	bh=8HGmYYTimqOZltofTGZFoBtBIJCOaKgX9a3Ha8IBIXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHuyc9DAboXw1SbvoGUBaCAkerNwOWru23qDAgrKqQcVwCLRC6Vsxp9HUsrptExOJVkgGcUZHmJtwf7WfVJhukBypdadaxCudMnxmjGPCX23acFmF6G2M0zvl1MPaA+k+K0h7MD/CSh7B1Z68WS7eh7seWEe1hYA5BdrFiY1cEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k9JxHvno; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k9JxHvno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987796;
	bh=8HGmYYTimqOZltofTGZFoBtBIJCOaKgX9a3Ha8IBIXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k9JxHvnoPMspFXdQfXdP8ZRHl65gZ4etVK8KmFdXnG2MsjlpJr1FlSoinc2YzVZrc
	 o05WLf2JfqyBNNbaX2+wowquNmDG5VJAPbB7VMevuxFeFXDcNK5L/5chdblLbfSSF8
	 D6Dx/lc4rmBIPrIN2gpf36xwSHsco4pLJBOuSbWiue7HBRqMcqv26vljyN1Lq/Sx4V
	 Hvcdd8JxPVVftiuH4yoPxI5FPLY5XIZ9o2QfewMGvTvE/LM/awraQWd82uKkcL4iiO
	 9LfnJGGsc5pO1olfoVUrfzZYmV7HqVJLRUoDfz/zNLlVfu43HT2oN8pMUYUAeB+tie
	 eMpjxfhIRFwIQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA41B17E020C;
	Mon, 21 Sep 2026 12:49:55 +0200 (CEST)
Message-ID: <900a42ef-6c1a-4c6e-859a-453947934368@collabora.com>
Date: Mon, 21 Sep 2026 12:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add Novatek NT51021
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-1-30afbc35d70c@mainlining.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-1-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 14:51, Nickolay Goppen wrote:
> Novatek NT51021 is a display driver IC that can drive DSI panel. It
> is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
> panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
> Xiaomi Mi Pad 4 Plus. Also it's present in the BOE-TV080WUM-NX2 video mode
> panel, which also has a resolution of 1200x1920, but 8 inches size. It is
> found in Xiaomi Mi Pad 4. And also it's present in the BOE-TV101WUM-NM0.
> It's found in Amazon Fire HD 10 (2017).
> 
> Add the bindings for display driver for the IC, with support added
> for this BOE TV101WUM-NX0 and TV080WUM-NX2 WUXGA video mode panels.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

