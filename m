Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAC53A8B6;
	Tue, 22 Sep 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077218; cv=none; b=BrZC9U94bCe/B2l5KoRS8pHltXoeyLNLih9YJZGPDylfclb3TMhcuq0CJrUhayGT88KZ0oNSulwtdpgO9+PqPemojr8rOfzuKeySJFcz8W98GCcWlzxRP8Hs562x+iOwGkJWfuDgqleMYBw/R90hUVTKa9NcSBzeQ38H6yW91Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077218; c=relaxed/simple;
	bh=g+uWp8GE5+l5SIkEyY6Vib3qVErtfIu+oq4xkgSWvfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nCeapRIB9TWhwV9ttziqfGlEfr36NVdI71ciPFK/Y60Fdk8eqv5H3NLyTIamhSVgyt/tn3/s2sjiyHT6FzDcKWEFQQhKMf2s125/rqYp6gIVR+L/uEOQyRGBHXEaJuNM0fSRob9chEH0P9sc0J+OfDm6IaTAB3ZMzD+ZCFOAfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CvNIdMLd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CvNIdMLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077204;
	bh=g+uWp8GE5+l5SIkEyY6Vib3qVErtfIu+oq4xkgSWvfo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CvNIdMLdkrFipraKmV6ceiqmuuxTu0xed6CBvGQspKvg4IOHdqZPUou/SFPp96iNn
	 IpDM9+bPlOCDV8PDGQA7zUpHgmStWsRT5uf+Zg3D+NXfflPVMWbyz716mpHSkaeeZ+
	 FKq1U6s9tCaJc6mnkBrVKKbJWs4Z8dVkwBp0Tcz4Cmyzt37YcKMKxY2a1MrQQhnVXf
	 uAvNbgb8Ay9p6hctPP7tDqIx6sIjZwjBWHPxhaJcNfvV1juwKYOr2VOcm0bEbsOnTp
	 rd1g2BHZMXemIbqgiQCIQVJ/X6hpNSq7CtKpgM3F6WL7/FL/e9epS+1IC2pk8jJzHP
	 jy3jEO9a/V5wQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5E4017E03B6;
	Tue, 22 Sep 2026 13:40:03 +0200 (CEST)
Message-ID: <193cb5ee-09ea-4105-90ab-3968c796ff86@collabora.com>
Date: Tue, 22 Sep 2026 13:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/12] media: mediatek: jpeg: fix buffer state update
 timing
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
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-7-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Update the destination buffer state only after the decoder has selected
> a hardware core and resumed its runtime PM state successfully. This avoids
> assigning frame tracking data to buffers that will be returned early, such
> as when a source resolution change is detected.
> 
> Protect the destination buffer state update with the hardware spinlock so
> the completion path observes a consistent context and frame number. Stop
> walking the done queue after completing the next expected frame, since the
> remaining buffers still need to wait for their own frame order.
> 
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

