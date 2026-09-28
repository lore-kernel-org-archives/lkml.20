Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393854BB28D;
	Mon, 28 Sep 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604128; cv=none; b=kj0I8/eQNrSqPrDUev8uJUcIqdnAd6KJfMUAmgQPrdEiN95B23C+/lyCnGZVD2xJ/ADlCFZ+LA5vUWnB4BpoXBipnbmLnBlfLohBy6VHh6IothHo/djj1e85MzUCDBFneyQHgcNkQ0RFlubiVf/kpD8xt6j4iv/rJLk/HHP2Iys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604128; c=relaxed/simple;
	bh=8338N/MLUsSVLfr50ikls34dEQtzKihPaRcPDbLoRsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Im2vWsRL0Y2f2PgX/XXcXV2L8bkCwJ5+7tsFnw+++NFy1fTqjDHFd6vRlHrRxs5tZqxMYtTsyISUY5F0Zq0AAdgM9hXoFUgc/lxR+Jd4/fH49FRiLi/2ivI/OijN2OuXWkVZ+lBkj8tOCgje9RFMZ+5tPfP/CkTCS2ouwMwQnmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=YQO7w6Iw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="YQO7w6Iw"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4htjfc38vkzMlrS;
	Mon, 28 Sep 2026 16:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790604120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4cEe7dLmKEHxBNr/9u9hCoZ8kn9K4vqRyeK15aUsoes=;
	b=YQO7w6IwJEptPdadGHC46a7i/TJDT0KUwwPMbIo2g9uPrkk27W1xxH2H2SugWEBscQB/5Q
	nT+obrCHrkrgT9NSV7X0Y4eRF3Z7BTrYZSQ0AWj9omXzWuqSb5iLKgTxelzQ8F4bZVy56K
	F+OCLCK/YBWbaQ1cN952OZUy0gWQWWLAFz9eg9v0mpCCAVXrBJso6LYfA8nZjBsVSGFIfP
	CQEnB/q8VvJB1Zt0W848QKgekcM5lbLF1PRIRo0NkW6mVvurqCZK/xIl3dUJwkwb1VbGnY
	SymmZRgD5B+zxWj8eGjTlsFsOskQXUV02zGcFJjc9jaIOOSymvYr4+WnkRFkbA==
Message-ID: <31cc7f2d-4a8d-4584-8866-6961b7d7af31@alexanderkoch.net>
Date: Mon, 28 Sep 2026 16:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Khanh Le <khanh.le.xr@renesas.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
 <20260928131208.GA3834499-robh@kernel.org>
Content-Language: en-US
From: Alexander Koch <mail@alexanderkoch.net>
In-Reply-To: <20260928131208.GA3834499-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Add documentation for optional property that enables operation of the
>> 'PDN' pin during initialization:
>>
>>      codec@10 {
>>          compatible = "asahi-kasei,ak4619";
>>          reg = <0x10>;
>>          pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;  // <--
>>          #sound-dai-cells = <0>;
>>      };
>>
>> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
>> ---
>>   .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml     | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
>> index d412531ef9a2..3c7754351e8a 100644
>> --- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
>> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
>> @@ -34,6 +34,12 @@ properties:
>>       $ref: audio-graph-port.yaml#
>>       unevaluatedProperties: false
>>   
>> +  pdn-gpios:
> powerdown-gpios is a standard name for this function.

Thanks for the hint, this might actually inverse the logical polarity of 
the GPIO that I had in mind. I will look at other examples and consider 
them when submitting v2.

>> +    maxItems: 1
>> +    description:
>> +      GPIO controlling the AK4619 PDN input pin. Used during driver
>> +      probing to power up the codec.
> When a driver does something is not relevant. Would be useful to state
> the active (meaning powered down state based on the naming) state.

Understood, I will make that more clear in v2.


Best regards,

Alex

