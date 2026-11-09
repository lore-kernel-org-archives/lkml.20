Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246123;
	b=WHqjcZ7joB9i2u1JJVPS7y/T5bJJsisZ0tgA+kCeL/yXbJ2ZGacrdpk4hVU7v8LOCcCM
	 rEYf1AEnuVHftENw2dj4UxuKQEs6p1nbigGgtx9ft46MG67xAyT/Yly5l+FDegJbdNhy5
	 IJwn5qIeSH3ACX117SgaaTfbCp/yruU/9J2MYIlcw8VdxnbpyrEB5xXwvrlh/Xjm2zaOt
	 OWiR7eob+r94rJ26CtZqYmU9SfbvK5gbYro1DCNNPd7+MSkjPNFT5nlnrTAGkS6BMN82h
	 s+bfa0IdcC9ipIaIzM0i01Hqu5mpOXGEaVL4WZv5s8jBHZBVynLHHYN/QIYOBvdf1HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
	b=qS/l5oH+0J0poKmNnf3xZc1WCGax9J84lYQTg0SVf+5ixtw//UekkKeHDEsd2C40aVjK
	 g1TSXerQ4Blo/IqxV5jwlU+/TWVCWVZFK9MM/Rs34ovdCRCblIiWy0bUindOHX/l1soyo
	 DuO8yQRtMKe9YTvFLk/ZMXMDAMpk/e2Nmgu+Ykh1P4tGjVjwm0ykzVCJH9chU6V3kJ9oq
	 A4qbpavDbHUymXOjqlI3obrsfPuTdRfaROiOICWBXRXwGW+4woCCbhuyBa8I7H9gzHN5i
	 SbubHvoseFyC6F27aZgQboEascoPI5izFnHt6HGq0e9VTZiErHDDfA0utt0lMSElVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yuBMX1vR;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641C606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9641C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yuBMX1vR
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-849c2965b9eso533663a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794246121; x=1794850921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
        b=yuBMX1vRFXM5Ip52++lbq0FeCO/8O8aUZ/ZKdu7MKnTXQvli6mg4xNe04YdLSLCqq0
         Bgm37gn9A7NswjPhMBs4UWQK1xx0HSDtdCI4+7P2W8kXtlmVCBxXoSvEb7YalplNkDJ8
         HMR7AsLJ7qsEc8VGuMnf439yUrjllBjH+gSZMvhBK34NqHfKh3f0kWNslelvpr0GNiOF
         P/wmVXBdiy3UDVzucwQz1JeWj74JlazmFvJiWd+umOFE6w4b7GLrHeWDA0Ttm1COfzOS
         bITmAazKvGZvFgnaEpDEwHCiNJbo+tFFYEiWvSDi//+Ar9GATs40u1RQoSdCZveKjtoW
         HePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246121; x=1794850921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
        b=vOpxEph351/9HLzpGu73F00EAXqD4/yjP/Ys6PNcJqJhyr8jMZE+LItNqetY0ulH3B
         4f3bUQfXKq3ozhb/R3TySG7a8lUTvH2MhE7ujYSaViqnlCN6R46vWGK3UJtiobQUDc52
         XscnE1P93f1aqAq2GFLvNiyFfo6i+f/a7jxL8TtRBufL8KkXRajIQmoV5fthJN7UZcjx
         CzcHS0NSaLf8GSGUPp4hD0r3hUEltBmR1jAgo6MJkmQMm3xFjPEWCVLybeXDVBHRNcK4
         tU+pqFMKeI63WoW8iRcS1ZjrnUkE9yB6kAikjB3rPgJvXUJwHilf6dz0i/7mHbXc/KoE
         U1/w==
X-Forwarded-Encrypted: i=1; AL+hErHZ+0M0oZe6bIk6SjczrHFsk8YEjCjJhquHyZBH90fPXAXT9e6TvZXglyNJQVrTkNZYQpGmg4/UhEkRTBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wyTzoaC0dDhWqm/42M4bUxtWu8NgoJn/mQt017voNI/Yy+Fd9
	JdH8PfEmVEkRkoOgcHJ+IoIbN1KD/MbOBx70HXdkGmQdiY2h0Gz47+yJ7LK0+PhKhGE=
X-Gm-Gg: AYBFou14McSBMRlfOo4WtMeWzYg5jbGu+N8kgJdavfk+tRzzgbY8OmsnEc4lfRWDFly
	6NQfIZ99f6mERq1d08tolyMGrXomfbkkKNAxQD7yYLnOSgzbK6lh5vACbl3U/gi/Em68f/SsHil
	PbE7i/2SL/hr7Ol+inNSbg8xuBIV+q74Ca84sKxaQOJuzC7XDnNCEA+3km2Gb7A0lN0j4xHKSfw
	8BJjJkXCSXWgtSknuQYVIdB/vx4CZYSjl4lZj1ANL9FdDye/KomLAKUv9u91NdZsJK75Mis4ngI
	O8Q8Jbk56B33pope/KmPe6VaggE75MaVEpKfOC2OMrvyk5wbxYcBQso1biN1uUW7nMgw4kAExv1
	h7BQEQ3RNnTD9p7nBRHUxtH5oaQxHDz20TPA7GjIKYQarYfYKMaDztggehtV7/87aC8uA0WhxP8
	ETMoSVqJvgQCdJ1Xy4h6TntDirtiOcHYazX49WC/aewoE6Stjwh9U2LfEWN3QCIuSYLLR9U6r7k
	lXQKSKmRg/O43n0eOkJPgB0ToB65Fas2+6JmUmWEBpPZxSj7LaWMKe8eN8qOEpPAHvZ3xZf8SW6
	Oqay9LloYVlribkPbslVdkPffJc9oQ==
X-Received: by 2002:a05:6808:120c:b0:4b9:a829:f00e with SMTP id 5614622812f47-5683cc10684mr273208b6e.26.1794246121311;
        Mon, 09 Nov 2026 09:42:01 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71bd0sm4925229b6e.4.2026.11.09.09.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:42:00 -0800 (PST)
Message-ID: <b4c191bf-4d46-439e-b0fb-ead747413d48@riscstar.com>
Date: Mon, 9 Nov 2026 11:41:59 -0600
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
 <53323b7e-5169-4a36-a051-ed1eb1718b7d@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <53323b7e-5169-4a36-a051-ed1eb1718b7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:23 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> Define the binding for the system controller that implements the clock
>> and reset controller functionality present in the Toshiba TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
>>   MAINTAINERS                                   |  8 +++
>>   include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
>>   3 files changed, 122 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>>   create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
>>
>> diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>> new file mode 100644
>> index 0000000000000..5a241a9c915d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/toshiba/toshiba,tc9564-config-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 Multifunction System Controller
>> +
>> +maintainers:
>> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description:
>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>> +  includes an embedded PCIe endpoint that provides access to various
>> +  SoC peripherals via its BARs.  These peripherals include a simple
>> +  controller to gate internal clocks, as well as a reset controller.
>> +
>> +  The clock controller uses registers within the same page as a reset
>> +  controller, so this system controller controls access to both.
>> +
>> +  A total of 21 simple gated clocks are implemented within the SoC.
>> +  At this time, support for enabling and disabling only a subset of
>> +  them is provided at this time.  Similarly, the SoC implements 13
>> +  resets, but currently not all of them can be controlled.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: toshiba,tc9564-config-syscon
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +    description:
>> +      Clock ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +    description:
>> +      Reset ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    syscon@0 {
>> +        compatible = "toshiba,tc9564-config-syscon", "syscon";
> 
> I disagree this to be syscon.

Conor Ack'd this patch, and then followed up asking me to
mention the other feature it provides, which I agreed to do.
It is an important third use of the memory region.

   https://lore.kernel.org/lkml/20261105-irregular-awaken-b329b9c37e70@spud/

In addition to the registers that control these clocks and
resets, this address range contains two registers (one per
PCI function) that indicate when a DWMAC hardware
initialization step is complete.  The nodes representing
those Ethernet MACs refer to this syscon with a phandle
property (and offset).

Is that additional use enough to warrant defining this as
a syscon?  I.e., with that third use, does this no longer
represent a "pure internal-register-access thingy?

> This is internal to the PCI device. I read Daniel Thompson answer:
> https://lore.kernel.org/all/auOI8LbZNWbNGJuN@aspen.lan/
> And I accept arguments that you want to re-use a lot of existing
> bindings like DWMAC and so on. Syscon does not count there.
> 
> I remember you posted somewhere full DTS, but now I could not find it
> again and I do not see it in the cover letter here.

I should have included it, and will include this in future messages.
I squashed together the DTS commits into a single complete DTS that
we are testing with, here:

  
https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

I'll also respond to your other message.

					-Alex

> So again, why does it have to be a syscon, which is pure
> internal-register-access thingy?


> Best regards,
> Krzysztof

