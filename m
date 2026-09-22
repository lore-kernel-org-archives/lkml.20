Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0EF53CA6F;
	Tue, 22 Sep 2026 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077218; cv=none; b=XKwqy0P+YsOnMGpaJcY/c45HCI/o0SO6G0NORfTTWfWjZk8h0kZl4s/vcYLNOsKKHTDfkTd02rkwz7YbIxM/AReo3JcRMzAQ4724XVnNNqfaL6DzeHYFBxHYlVCnpmUUThJvLsh3t23e5ctuE3gjcPuP5GTlUSdpxZNk2Zg9M4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077218; c=relaxed/simple;
	bh=fJ5W03CdrVHqnQmqgbVhhu5CXlxZnw6kNwoOjKn9RAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q3Ue8c4HciDQyp/6mrgbT42rPBHZ1ULAS8de4efL+KaofBRpF10LXgY9W4eUMkBvQ8FFKSYQojuCsUznQxuNs5sIUJPErMhc0iuyEz95VZ9oK2YRcZcsdJYa2Rmi4UyJEuFO5g4DTh65ZT2+eZVXjmZyEbZQ7otXv5G0eOi5JJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PqgcwSVs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PqgcwSVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077206;
	bh=fJ5W03CdrVHqnQmqgbVhhu5CXlxZnw6kNwoOjKn9RAs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PqgcwSVshNgexOhnXxSdiccsCSNKYe2WU5oqhvZlrRO5ooSPjfXAum5Ty7r73KUlF
	 jMW8YVYirzlHevEEm9uwDpbRdN81CqTHUv96Wp1hKfpJwJGmswxrXb8X/r0gPy2bXE
	 Me2Hi7HLPawytPLNupBnwvZucRxF6ttVon2uGkBZNRGbwFf4caMrhOVaABLmB4bOj1
	 ONV5GKcwTTYtJ36wMQi3TK4X3sVJ8Fhc4hVK4+3PJLztzKh0x+M5rmcG84gR9sSt5S
	 6mQobtoOneOOJNeojbw5FFbrTR5cf+Vht4f9DuLRh1CKWFp1JZBwz/6iY8iG4K8QbQ
	 5+bi6CB0YNOaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BEC617E0A66;
	Tue, 22 Sep 2026 13:40:05 +0200 (CEST)
Message-ID: <14ca0af6-0c5e-47ff-b7e1-08144eb338a2@collabora.com>
Date: Tue, 22 Sep 2026 13:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/12] media: mediatek: jpeg: fix jpeg buffer payload
 size setting
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
 <20260922091530.241762-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> For multi-core jpegdec, if one core gets resolution change event,
> the payload size, representing the size of Y/C data, needs to change.
> But others are decoding at the same time and it can not be changed
> immediately, which results in the payload size not matching the real
> buffer length.
> The payload size must be less than the real buffer length to avoid
> warning logs.
> 
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

