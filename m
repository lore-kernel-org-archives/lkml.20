Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691377;
	b=5ZzOWzhIV7g45jXeshN2+vwUz7IAhJzSEdWl9H0hIfwDSNtF2/ZlrAYsom/HtyJnGf5X
	 e0Xj9WNB5LCufm7+jZ+RyJraVa+sV2fYqWeSNDjc2pASh9FpaFe47kto9HyLask05J2hO
	 7goiQxhEDQGgP8eQU2Yk06dhmZnxPepFywII/MpZfBQeYNGb8dwmLGFy0qUmBPvRnVeVA
	 zWVNSCV/ops4TOGI3Pj0uUxUj0ypcd+uyQ4eRLiVmRKyVd2ip6ZX9ZKFp0lkIPkDC5V5m
	 VwhBwsVM0kk4YR0FnqcdMJA/IgTPy9qa7WKFHMjn7Ba/9bbn7coROFKx+3PMFyTSXIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=;
	b=wwT2tyyrIYyZ2EeoX2EfQaaB5Gg9YTncFRdmaGEmeYNSKLsibOidF6MIbke8Us3sPkKr
	 XALBTMxQA5z94m8Q7KlDUKj9j2FUK8pDnexlokcWnsHdCDgZEnOw+9pPuqqPnBtrVqFAX
	 oglJXV4wHFrGFBWOGE9YhCMUzZOxjNBzokvGPyWe+b7yB7NS4yfDv6grBLnpSXiuD1iyL
	 YOog77xcFoIdHOdD5A8a8+4zsbjGg/6t70vW7UM1qd2wDTkDI4Q1xAeopYOOdMgxpLtYe
	 wi9V0clEiOh0CohZ3pj/Yf+EyhiL2Z8FFdpkAyVAv0F6EfSkh9LsU2DcMVgLFzqQLZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4745606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4745606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so532085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691374; x=1793296174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=;
        b=0kEND2xf3fBy1KJqmJVDswWYa9ne+xTAHgwzJwiaTBM1RPiVkbi5NpkqgMmVMTDirH
         1ychTUA0XbQrHKj0KFydqlIyCEKKBsT7GUdj688usg8ta3HW0b5LrHUW40M/LKmalEeC
         Y1lTAX63iLUNGD/ZgT5rOpZp0umuFFEdEQzJZl6y/dnK6DS4zT0XxUT5P2talVcQQnEr
         PST5eTK91SvpgLxlZkXbpCdi7rziqyTDPs7hhvzsZKA2UMr6AxqrmlKtj0DvB8gT4r2O
         WDEuvTs+yfU6JHW2HF0SEHq3W4jkXAzEBbLIOOrPKkaelIofp0OSUvg7O1Qc0P5mMzCJ
         G6Ww==
X-Forwarded-Encrypted: i=1; AKwUvBx9CTnMLhEpwDHzoyPLOD0uZQjMewVFYWwDypiK0pPgUtIgHccXVjmBDXDwaiVGLF3YSNVBzTzJrP4EoyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn+LOCZGI1e8faByq7WFWFRqQl+K9HGHO4WDKWmbHdqATa2eGJ
	cA/QhI7ivHIOb3XGyqFGS+YA+Zm5W8Bnk4MWKdFpSMSTzoAHeAI3Vajv
X-Gm-Gg: AYBFou1BHZUhcU+IdNgW8kepkt8O1QAUh3f1Lunj/ki0C2GL59a5dlwdeLVwqkviQTA
	SrBb3XMnpCP54EVLnzXF1xtXqmeOQbAXlQNBGqTjLuU6K3FUaG2OW4XIvYKdxSjQkpUOtRe3V5b
	IIqRxqv+45t5XJlOxJ3g16MyaqGcpETJbEq7v7iT41YMouT3ltxWsIilRTQyvuSogSgwAxg7B9P
	R90rsNOAopN1aXcc9HRxcHesiqXnDl4EMoKiqWI2MX5ncJ6AWu4eSXEV+8bL5IgvLEn67E5xHfV
	9sTPMDdGi+OSOik+BzDBONchFJb9KpUvlgUxXWSIuID3Pix4+Hp9Ehx3q/5suDMQ8C742ZZ5wCG
	NxQq5pDuCRYgCrM6t7JcYLapiUs9NtSdX9Y6lrwNZ4KsIGOQ8G1RElxl3q5MAvjO2vROOBQMSBf
	iCKOtMi7zqolvSvZjfeqHN5VWGf4q3Y/ixmi344uC9GfqTFgvTqRL0WuySJPGr731khe/Zj1n1Y
	EeIBqp5R0S3tZsuCmRv9/vHksXWbZOtziX9MNUN/oAzC7H4snV4K549plIx1dVja9qZ/vOrpp3/
	wP3AEJ8vBg==
X-Received: by 2002:a05:600c:4684:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a1fdd74b6cmr122177475e9.35.1792691373949;
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm13451355e9.13.2026.10.22.10.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Message-ID: <a23b3a53-9cdf-4e32-8ca8-a80d927d65e2@linux.com>
Date: Thu, 22 Oct 2026 18:49:32 +0100
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
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <20261012-suds-karaoke-efc4acf056af@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261012-suds-karaoke-efc4acf056af@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 20:18, Conor Dooley wrote:
> On Sat, Oct 10, 2026 at 11:59:00AM +0100, Lucas Tanure wrote:
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> 
> If the net guys think this is valuable,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks, but I will drop this patch as is wrong.> (although for something 
like this, us acking probably ain't needed,
> ehh?)
> 
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
>> -- 
>> 2.56.0
>>

