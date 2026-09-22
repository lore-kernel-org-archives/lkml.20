Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19D53CA69;
	Tue, 22 Sep 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077211; cv=none; b=C1ECBJrRh0syCe067ahicHN0TLBa63qSG57F6FZ4LaEjv4ngiWG22azpVrD1hSoxfLIKSHGzP1ovUPoYbJiiMLmQh4peGayz6X322DXY9qVlSeKoJzZTBsmUlnir3kBZzXK/nkQ+EV4Wd5+9Bt7FsFIyft8AN+yzWej7pQy7JwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077211; c=relaxed/simple;
	bh=wXBz31YYAqZAgxYBge5P36ysNsF9WzmlFm5K4PaRbgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ol6ksCx4dEnEv+Y9uBw8sPSC91RGhx4TjLYfpFVq4TSKWydSDjVUH+UdGEF5rDEX0/XiEYs51v9RI5JR3PGX6j6he99ScFGdbbSNj5tejSV1AdDv/hLR6kFQm1KWNVA3Md98jOklxdwHVnLkO16HQOuIdLxOrvUPhLttcnh41t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oE1ydEiX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oE1ydEiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077199;
	bh=wXBz31YYAqZAgxYBge5P36ysNsF9WzmlFm5K4PaRbgE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oE1ydEiXT0YFVSwwKAwRK1QjdOU8PyAEzxmKSShu5U0YKqp1bvu1S5Vbm69pIoR5k
	 SvId+xQbBPwc5wb5EhWDvjmP0RneGeoIbNs3X+n8S5yVjF1avpa0wXFk/yWeaZTkjx
	 fGMLlUz1vSjcaL6jN1Z8cNv6Lbtp4TY2ZHkUjClNTtdeigTh0/hPWFuBWljNce1z4L
	 8ZLVj1nG31VxEjFnlmxzn6rSGzq9x1S3xQGeSyZ0bd+KQHMr+3y0dMf9IofL3HtR0u
	 aegtKGbtJ+EcxdHw0+/fxlr96ICWP7wlPpocoRWBroUExx6fJCOSSYzQUIoPZLbbbE
	 u2tfVvONXUlbA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB4B817E0E01;
	Tue, 22 Sep 2026 13:39:58 +0200 (CEST)
Message-ID: <3d056e8f-2d03-4356-b205-f7c1fd47d713@collabora.com>
Date: Tue, 22 Sep 2026 13:39:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/12] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
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
 <20260922091530.241762-9-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Move calls to v4l2_m2m_src/dst_buf_remove() inside of the spinlock
> protected scope to ensure all necessary operations are performed
> before buffers are removed from their queues and ensure proper
> synchronization of buffer handling to avoid buffer lost.
> 
> Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

