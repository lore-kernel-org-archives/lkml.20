Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919995;
	b=o3F3tcPCmUrjPlivhoOxrytk6/APO0O8n8W9OC2UoVRpCRLgadMllee9V4eQXgc9qUBf
	 fpJJvGoFWYFHrCzH9SifmAA7zHZRZqG56V510e0btzlKjYr4EvsH8qE2au+/ZNofisgdV
	 oYdpLyf+/7ITZPwnuILjg8aNr26Gmj1CxIjjrUFetvZtJHZOhOhGc56S6qwAz6E1xL1tm
	 GmB7bxPpprF8KLGy8kR8DeEqedQIE+OPl59YKGENQwUv9OjmOSHInbYrnIeC3Tph2ZnkF
	 ypETWo14F45fqSHixYI7qH7b01O4byBM8uuFgeiF/XWpI0EHVLF+XOZOape0TMOxbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919995;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5EC75UY/5H1eELpwKD/MvkxcdymfjtiEp+RmePnImOw=;
	b=aKEJCdvd+TaKlEBG/Fk8YyLe1k1GX9oYyhFlpuubrnxF9+/mUjaeZofGD1jwELvYHyW4
	 1TBDAqoVMZcsMlCgrPQNK0e/W/jDWQrGy6fHvgV+QE6RSfROwc4p2rHhXwL4kXIq5jJxs
	 mqdxqqsZw0gcaq7rRyC/W2k4QEipM0QupKxKAUAVgKhicMeYjxFCj86wyxNkJ+mAW/K04
	 pIevlRPRQdSgrJ9TBhZcdhYz4nx9NJ3aMzuqCbVDchdar7YzvzYtZkRiQvGTGIv4nudAV
	 P6RFtMsgLvMwKe/cVqnCOyT/0NZwmLQ26GjsyN2ZME4xCMx1IZcOkqAcFQc1S0GuRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="MQI8/J6Q";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B9B606A323;
	Tue, 17 Nov 2026 12:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MQI8/J6Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794919993;
	bh=b//NguUji4jyiZfZWVRqjJq3eBMUzebVwK8kbx1zR8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQI8/J6QJ1PfMD3BA98v0q5scoDQZBigWJSvetgvtc2F8nyb2tb3BGrK2fGRvq+gO
	 dg1QXOEnIidiM+rfRbIyl2aTCrPLF/g6Pe+DriRDrL+bDHofYD5p7kgvvPcQ6cybwD
	 aS2hX+rvQhJxyW2IijFfK6S/HlJ3dVqhbMzlxqwSsUi5e9jhGGsfbhn0IqeVHXfpM3
	 zT0wWWi1uRFe0cASUEhQjVGdyuZu/po9hMOWDF9lNdid03kERVE0gwK9ZpP5heVmSp
	 UDGID3LALNasPD0W0MFTTDpx2nL7hTp+8BVtkZ0Kj4ZXCGYRodse0tvMdYg21FT5yh
	 S6LUwNyXUHXfg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F90817E0311;
	Tue, 17 Nov 2026 13:53:12 +0100 (CET)
Message-ID: <200ef6c1-eced-4c36-832d-3fb409aac866@collabora.com>
Date: Tue, 17 Nov 2026 13:53:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-5-l.scorcia@gmail.com>
 <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 13:35, Krzysztof Kozlowski wrote:
> On 21/09/2026 13:38, Luca Leonardo Scorcia wrote:
>> Add all the DRM nodes required to get DSI and DPI to work on MT8167 SoC.
>>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 369 +++++++++++++++++++++++
>>   1 file changed, 369 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> index 27cf32d7ae35..a50bae4307c1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> @@ -16,6 +16,22 @@
>>   / {
>>   	compatible = "mediatek,mt8167";
>>   
>> +	aliases {
>> +		aal0 = &aal;
>> +		ccorr0 = &ccorr;
>> +		color0 = &color;
>> +		dither0 = &dither;
>> +		dpi0 = &dpi0;
>> +		dpi1 = &dpi1;
>> +		dsi0 = &dsi;
>> +		gamma0 = &gamma;
>> +		ovl0 = &ovl0;
>> +		pwm0 = &disp_pwm;
>> +		rdma0 = &rdma0;
>> +		rdma1 = &rdma1;
>> +		wdma0 = &wdma;
> 
> Folks, what is happening here? Why Mediatek is adding bunch of
> undocumented aliases? This should have never been accepted to Mediatek SoC.
> 

It's always been like this on MediaTek from day 1, what's up with that!?

Btw, in this case the aliases are useless.

Cheers,
Angelo

