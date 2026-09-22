Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DC3AC0E4;
	Tue, 22 Sep 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077214; cv=none; b=GFnZHA4uS6t3uCS5uSl6h5eDVwtVVUhqRBsAPPv2tEMKYU6+wVcq5SfpjM8z8p7cq6SJok539FE3ICIIkyHwLBaG61wCwuhgytqw55U00Djfj0M0WmGWirtDnwpbwDrgUiVWyCuTYBYlDQXr7WWmIAfrSIEUwKIonWaYHYsGtCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077214; c=relaxed/simple;
	bh=bSFP9C9XjARx/dNNgNrfSYeFoPgGa+k9SPVPrwMzPcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=laEe6kYCqzMFK7t7u87aODAZcx23BleM3WzIrTN6O4oUzAzO/uzM3OZEJ5L6MQFPo+MefE8LPjZhWoqJW4ucsEUvm4Gys1+y6pSbAfkmXEaK7oWTJo2Qe4CcE6clJBDteKVkPPxxPBl6T6obqHtdTduAVJ/Cn2qdAHPt72zVaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Us3mJDQT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Us3mJDQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077201;
	bh=bSFP9C9XjARx/dNNgNrfSYeFoPgGa+k9SPVPrwMzPcg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Us3mJDQTlFuo/LamL+FrEDlGp2GUp6RetzX1uEuUXGI2Z07wV8GwgJQYoIGs4wou6
	 x6PHTe9IvfbpyvaThgcWyi0aeWRj4jjEY7zPTZqZxmd27Iz21mBDqBBOFC1w5dNHVS
	 j/8XY7ZPKPPv38WDqkSzKOE6J/jKg6+bUJw+sVOjsGmOWCFw5H65Qp8Aw8oECguXe3
	 UKu9v+d62dk6IcuHWPyJ/9HHkfPtjAXUFj3CO4+BHaX1C52AfNDhIkn6Mt3250eKtG
	 WtnbxgazIraZ3+KTNuCw7feZJaXgFRZDP2IUCgmAOcYibqyKveWNpjn2hopxwtvkEd
	 uivI8lovJ8ocQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63AA817E0EA9;
	Tue, 22 Sep 2026 13:40:00 +0200 (CEST)
Message-ID: <9a40a5e2-ed21-4727-927c-ab4a1779bb19@collabora.com>
Date: Tue, 22 Sep 2026 13:40:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 07/12] media: mediatek: jpeg: fix resolution change
 event handling in decoder
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
 <20260922091530.241762-8-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> This patch refines the handling of resolution change events within
> JPEG decoder worker. The `mtk_jpeg_set_queue_data` function is now
> called to set up queue data before signaling a source change through
> `mtk_jpeg_queue_src_chg_event`. By reorganizing these calls, the
> patch ensures that necessary queue information is updated prior to
> transitioning the context state to `MTK_JPEG_SOURCE_CHANGE`.
> A condition is added to exit early if the context is already in the
> `MTK_JPEG_SOURCE_CHANGE` state, preventing redundant operations and
> improving processing efficiency.
> 
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

