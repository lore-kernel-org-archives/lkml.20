Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F449482E;
	Mon, 28 Sep 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604009; cv=none; b=B+aIvj1oMOftlB/NzPdJ3WGFl8khU2/eqIYr5Vtb5GYpDCA4ie63usYpcHL0vUweLcpMKWk66+7KvqPmzc75bXEBQzRth38g2JHm0vpW/yGpjWtHz/qSOtThIdZ3MtO3P1cNVou76DouoVxZNTMwebQlyloinz2GdigCqMguacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604009; c=relaxed/simple;
	bh=MxFxuOZxN4+PXpU8BxAOPaEv10iHhixBkXXncY6bWEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7r/pxti4zxxSVRjCsilIpPUaotTma5EWVvh5ikak3PUu8eFfj1fiHtY/1ghqU7eEZKOxfp+9flpYjl0ZRBEtgkIZ2JRxBuCL2S2jVyA6pis5DnRiBvSpcYU9h8M/L+/CLtorY2FsamtQfGXI8UZNF5zJUqoJyzNYWSnsK3gXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=gU74/STS; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="gU74/STS"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4htjcH4PfPzMltv;
	Mon, 28 Sep 2026 15:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790603999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y64GvZJGnsTpjIopVVO+4mXuJCw7lygid2OYRpoI6Bc=;
	b=gU74/STSePvZ9flyFvBwS7bbrxaMwnltGHSztGjIqCwpFh8FIGFgXE0jpt6uLxgDKDn06m
	o7xbLDG8o6+8URnlShjy8W/fORFP0QMZL6b+vOe4U8i4YjacKCanMGQ1YuqY0qS+VGKAmQ
	hDirp3gaiq7LJgosrvCkD8p3erf8SJKV34p4zSDp0amERk8vSYy/n+bC4vgLFGE72FNU2m
	PXfguDh2//GCU7GiPUM+ZfCHkzrS2UyM0ZpoKxOu6kLYWdgBF6MqihbP8s9BK7OZ3CWz/I
	YDiRnyC/pFK8iCBFPqF7kb49IVACPlDiIFkmaRqa5MkeftQ3pVRc+YIQqsjPMw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
Message-ID: <2789a6f1-3384-4135-b292-d84a6d603da9@alexanderkoch.net>
Date: Mon, 28 Sep 2026 15:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Khanh Le
 <khanh.le.xr@renesas.com>, Conor Dooley <conor+dt@kernel.org>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
 <179060023276.3804017.17695224297068341840.robh@kernel.org>
Content-Language: en-US
From: Alexander Koch <mail@alexanderkoch.net>
In-Reply-To: <179060023276.3804017.17695224297068341840.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4htjcH4PfPzMltv

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
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Lexical error: Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.example.dts:25.39-55 Unexpected 'GPIO_ACTIVE_HIGH'
> FATAL ERROR: Syntax error parsing input tree
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1714: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260928114019.1441752-3-mail@alexanderkoch.net
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Thanks for the review and the clarifications!

I must admit I am a bit new to the concept of YAML based DT bindings 
documentation and did not realize that examples must be syntactically 
complete.

So for a fixed v2 would you prefer

a) the missing #include added above the i2c block or
b) the new property removed from the example since it is optional anyway?


Best regards,

Alex

