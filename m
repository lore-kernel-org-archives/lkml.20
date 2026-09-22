Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E253CA97;
	Tue, 22 Sep 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077220; cv=none; b=LCo1xBbiJtaY6c/elGBxhclQboBC4mY1tz3UufhfV4gq0I5tSyF0wY4ehpDKYg/qN4oKyRGjV8P1l894vpEQ+RjWS8H18X38FOaFqARJzn5sa+NzThP/GZJUO/Vimf7INL5T9L2qtHiDPOYXa4PwGvdkLokW/4PbEGdDUSmyjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077220; c=relaxed/simple;
	bh=FQNyYELQWOZqqSIXXBpLYWmzFgTJEJee+pRKGcizJ0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FySJmTanMpRl3gICDtJIFE1Fl4rzfZY3ZkvkvhwMsX+X2LlJ0h29AqAGHLcoM5de3RydZUdyHry0yAARrAWOsepAqPYaPL8LlXZDxUB7oTYzT7prQZi87rvstmNWhTvibx7/WbKzZdjGNp+hyW93jB/93ycIXClVI5DzAFFY3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YtTGMFvZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YtTGMFvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077202;
	bh=FQNyYELQWOZqqSIXXBpLYWmzFgTJEJee+pRKGcizJ0E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YtTGMFvZt32FR2ik55eJTZB7cbefvgxGu/0SlyEiF1Y7UFrlkQN23qA9fiOr9aqbK
	 9n0RprEcLFyaRrQO/5SZHuxLKzEZZBrugARQxcQnByCjOPKJpMdAyUNOHT3KimKIVo
	 HFbY7TfkRlnubhwpIIw9FnU2GbXhTLDaNWmUI1BQBQ7tE6ruldD4LWshFAnyp/M7TS
	 gqnJa+DTf4iNlyrsVK7MM57RCMrQlSkKo/LFeVxD1PsuXWwHG+lJcmzL3EeGRswXRy
	 dyjsJYbcpiHJp/x1JT/bbRUD3C8grHpnJErGsxt88MpWxD9nKiCSzO5JS2Ai8P5Srj
	 azhaGnDWTp1cw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B6A417E0FB7;
	Tue, 22 Sep 2026 13:40:02 +0200 (CEST)
Message-ID: <f07598eb-df4e-4766-953c-0189940d3617@collabora.com>
Date: Tue, 22 Sep 2026 13:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/12] media: mediatek: jpeg: Fix buffer completion on
 multi-core streaming stop
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
 <20260922091530.241762-5-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Enhances the Mediatek JPEG driver's stability and reliability by ensuring
> that all queued buffers are processed before stopping the streaming in
> multi-core environments. It introduces a call to
> `vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
> `mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
> is enabled. This change ensures that no buffers are left unprocessed,
> preventing potential data loss or corruption during multi-core flow.
> 
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

