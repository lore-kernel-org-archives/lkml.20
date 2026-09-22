Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78F5538D91;
	Tue, 22 Sep 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077206; cv=none; b=LftRH8fhFBXcr4PaAuG1U7AqXpLK7Bwl8o826f1SuEiJ+bEt+06K6V0cSezX96FllPOmGwhIutX7BjwiDx3N/IdPqfxpeWZqd2OxZl7eiQge8KaNv7dJc3/1YV7261V7iMer3788XT4ouRhNP/S4KKxnmUVEJlCBvabKfKiAd34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077206; c=relaxed/simple;
	bh=BlNsu5y9N74CLlypKsAoY7D/nmyC2bMJlD/FQtgwghU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX3iRu+KrsQnf7UpaEexruyFi6YILLLcjafIt8DnpeXgOC5p3aOfL8z1qxlULgAEjn4CIqnVIJXsgeX4QpnJY0qcGyq2xGa2kmj6IBhuUsmmwUOJVUCP4Mt04oGVpo3yO8lzZslAEHvjSk/fk8CKJjmyIfjl7CNghXBNUSWnnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b7KFLW7y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b7KFLW7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077196;
	bh=BlNsu5y9N74CLlypKsAoY7D/nmyC2bMJlD/FQtgwghU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7KFLW7yKcvOZMkUaajcF85BtYI+3FnxF0T28XELjdze9ubwlApkbmJ4X4Zifly0C
	 JXHizn672BzzV8pnNR/24FOSDbUoNsf+71cFtdEDBDvnX61qa2FknG5G1+UZfyCeE1
	 g//hzZHf+oN1pAXf2/hQ+Oa/Kc/3RclddNiyT0qvVheB4rfxxpKhbAU1iYG9Ou3oq0
	 nw3voyE0/4hdjbrmXH83Wl/sMQImVsl6jVl7cWpsKgrjfy/rUI4CtGUB7A1XWvuuL3
	 4lZvoc9GKc7+B3g9pl7w5AyXCKd0YbdgUfCxeMPv+ThYbM95pVqFCCTHtftJsSm587
	 T/L9Wrzct1t8g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C505C17E0D7F;
	Tue, 22 Sep 2026 13:39:55 +0200 (CEST)
Message-ID: <b1730fda-67e2-4f07-bcb1-8ac18c49479a@collabora.com>
Date: Tue, 22 Sep 2026 13:39:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 09/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
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
 <20260922091530.241762-10-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

