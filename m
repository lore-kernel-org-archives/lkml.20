Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A08429037;
	Mon, 21 Sep 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987388; cv=none; b=klpbEYGgvXV5Hb7vNqjUCxBczCLTbKld0qVJCelGoaP80/TSLa1uNwimucNkNLfdQasl06wWvYqr9dlhjAM/Fv/YQDHltigG8Nvvu1ZO3fwi2KfGCi6q0crpiFYf/gSobzxYx2L0pNapPqq53oHV47k8FyPOrZHXFgmK7IPOOa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987388; c=relaxed/simple;
	bh=Jgwpcker6k9rDea0kRKtirRFxf58xRqNK/1bFIhkyeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YQcD2If1VEMHxC3iHH5tFKyVrEI8nJSK/4nU7QBMoJ6kXB2KJu8ddfvzCWY2r0UB7JhRyW8bYb1IAiQZ9uNJOqFwMAQIbCtkFm5oov+ofmGBMb7H18C2EGspkTYWKM9imgo/2tODmBKysmgJfLeb0dNv/2HqwvblD1u5Vw+mSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oMTNaCUU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oMTNaCUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987384;
	bh=Jgwpcker6k9rDea0kRKtirRFxf58xRqNK/1bFIhkyeg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oMTNaCUUQMOFVvWtgJ8FpNZ78+radWm4cFtglDxYayHg0KljOdwH8twiOXi86vS+U
	 P3VUGiXZmygGnudp9xbNeTLWgolxWIBtpw50uZp180Qt5J6bwhxGXRSHalytZTM+6E
	 2zxNom4zWTDpnpi/BFF1YgFfhfMoLnQE3suBwwbogv6IekEHfTDrFHDuJrXjjSDohm
	 6v50HbEataNqYDAVG6gHO69vfRYaEz3UtKyFlL7EmlZNEoGJ11fi/hJYypEtBORh4u
	 xNxx8Qt4b9iGK7fOa/1MsShkRNlvXC0pUMqKDGSQLNt3bI4p447TOs6WYGN4plBFxQ
	 2eNtJ8McJQ3/g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C7EA17E09D6;
	Mon, 21 Sep 2026 12:43:03 +0200 (CEST)
Message-ID: <bffc0927-26c0-4b36-9d66-d75dc5aa3b89@collabora.com>
Date: Mon, 21 Sep 2026 12:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Xia Jiang
 <xia.jiang@mediatek.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
 <1505ca0c-4a31-4673-bbe0-8474133fc504@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1505ca0c-4a31-4673-bbe0-8474133fc504@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:46, Krzysztof Kozlowski wrote:
> On 01/08/2026 21:55, Krzysztof Kozlowski wrote:
>> Correct a few white-space issues, like double space after '=' or before
>> bracket '{' characters, which will be flagged by dt-check-style.  No
>> functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>>   7 files changed, 28 insertions(+), 28 deletions(-)
> 
> This received reviews, is trivial, waits on the lists for 1.5 monts and
> it seems people are repeating what I did.
> 
> I understand this won't be picked up by media.
....in any case, for MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
