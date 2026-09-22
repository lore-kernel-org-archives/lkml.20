Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A033A7843;
	Tue, 22 Sep 2026 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077205; cv=none; b=ATLplBBoBQPca6S3LEBcljleQHd9aZr79VOuJolhQD9+qrTXYfC9SEG/kr1BYo/gZCUOBjoGIV57qKY+C2MIMG9SwytSEk0ydeDw+/2GKBFSaWQCseAlPx9k8LnOqt041uMMHSJLcg8erJi1P3YTMDdDecr1wcT2n8E2BUVoJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077205; c=relaxed/simple;
	bh=7H/mtiaqOfbB2OIda8pEHKXeDBj6OH/vgfVNZdtzp4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mi+3uRefsH6+pDCYuU4xFTR+fseusQbGIHKLPaCBbAqkyhlfOpCBWrpUoGNCXTTB1z/NHXq+shk1pz7WNBJPlvclpGyVLfTpdKItczoMSjjkQyEPddOCrZ5DSk8dLPVsA3hOrKBx5YDUQvSG724GD8zTTD+Da9dg9axoP5d7Zv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QX43lBwW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QX43lBwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077195;
	bh=7H/mtiaqOfbB2OIda8pEHKXeDBj6OH/vgfVNZdtzp4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QX43lBwWKlUToJ8P6ZaRZy0vegdNUj0rIBJ8S4LefVj9iY2ca65+dqMZ3fombT3cy
	 qEfukWlF8HG/AsKy8eLzninuJDH6x/Jkydm7uzLMe5IaR01OXkDbrUUbq+w4r8arAE
	 lJqkY6NyI75kTjmAo0CMJac91vrBJnWQcqcw1Ff7hSkVMzE4bVlX7eMbp6P+LBabTX
	 f9sj+tNsMG5Kv2rXkKSQpor0ooOHzxVmBcpA7c5CRrQdqpRvtulD1mVL/tGh/4r4ju
	 7PW4m/umMjdW2Tt/2ryqJVH96esCLnSdAm6tkF7fdVc/FF9mhwAW6YuHrEUPgsh08P
	 RqEdKnEbn5hvQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 915BA17E0D69;
	Tue, 22 Sep 2026 13:39:54 +0200 (CEST)
Message-ID: <27ba92db-685e-40ad-805d-765bcea840a9@collabora.com>
Date: Tue, 22 Sep 2026 13:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 10/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-11-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-11-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

