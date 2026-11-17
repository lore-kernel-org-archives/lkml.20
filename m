Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906185;
	b=NgTCdJGGTPnEZ/FcAFtjcRGKgXIkP2Wkdo1qsV7JrYX/hmF0okI1Ze5UbmsRWzJ51SKl
	 TAA+mLx8K9oNN8MvWBqj6wY5XuH40pLD+/WaruAwH+m2BD2n9ormc+iRjU43PfXziew6n
	 tvRRUDncoVI3EHBpgOmQ1uVDTTF4Bp53+38/eudmGXYLsdA5ZrTBn63wTcZJg0rH0i8hQ
	 MbjMFdaDDsvfFdM7o9RyMFuICvhS2tgbyFroRj2fhcuIe2ZwBjtLp9AyYhXw1nOmlkY0l
	 XW62CNuoS5pO7CJxtVOIj5/xD0UnTNawSA6J1CmMradsUgwJrNF+zlP31YSo2TXrijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
	b=1Z7L8HBCx4ZnW1z+ET3IjqeiJTk+sxGDOPfqqw7wXrRwBACOtKTeMUWqh164iQVRIWWh
	 0bOKnVnZx71/nXIHCEZFlQSn/47aKcyqyh3pNOKxHxjRvxzTQeG4NFp3bxLpiy+B94MFQ
	 kdRLeWXNn4sA8WBL3fGRH46O23qk4RO114HcyNqABrbAl/H7zYAcHpojVwQizMpi6rksy
	 XCNcR7VZToRlgPP+Nyl4+20gbcbNhXFY36/RnjS069iq2/FTU7YaB7Zgk/4tEzxfN99Px
	 Q6Z1eDZ/WqDeggGQv6ub0U6FgjkEHZX0JJ94BAp1pINPGqkPxB6kHsBxz2Li4sDAYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C040606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C040606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1975454b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906185; x=1795510985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=P02okCnLOX7GQFg/FdyY1inxehwiUGMREuCWwjos/1ThOA4/pD0rqRQNGvoKrmJBLi
         jrPE7mYXfKmBLqYxDEzlMN1iQMhpO4rwtnClO63o6PidRV6Q1UDy3qAQQet+KE5ddlU6
         GhMPJ57s47bvZ3aty0Os6yO50Sacp7WmosuzBY8Yv7t5hLtXVX2gJrio3Ya6i2aluIyD
         5hip/jBIn5QkgC3WesUImZ7jrwRLs3c4LK5lBH9plIYqZE0IqpOfDKX7BQSQ8bIX2xEK
         3QGA2uwm02LMchE9oMe8vExBqjODkAwFXg42qRk1OAl7RV8wd1gsbSz8qxi0HcWONXVk
         nPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906185; x=1795510985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=24WgZzEQVkBxpgnQ71cd3L7rzXgnRdetyFDLiEw2YUheyIaXyza3yllQXde0o1AyTT
         NRz1GefG/kHlveoVpvRkzUSyZhG1egb9FF4lVTxCN+GwiAmO++FmwK4ZlSiBNEQDqNVr
         LsKxDV5Z7AYChPRdu1GTaAkOFSrzSb9+U+xtt7raeisAX0aiHXH81NC4u7aOOhVYH3Vc
         oyDP/SbIh4Htmg3lH9dsPEPRFuwqxLhVtS8pUeixdMFpdWyeGJPERl+duM+qfKqpi2er
         9EnF579yYC+8ZFNMoVORF01L/KJY7gGVH/LShuRlWK7mS1MwgSSMHqKRpMyxI2Ag9bcy
         tvDQ==
X-Forwarded-Encrypted: i=1; AL+hErEjrMLmPOQD1RUK76jBw2IA78mOSCxwl2OeimIIf5wYuyZYwc3VD2LD//51FHBSpxkyNVI7nUAKghWYHOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WaUP8lm6yPJ/fHyFejOVWSbE25N6Ksnc6pTQHjCLIEunm3sMy
	rFDuRifdzr7pvNIgiIhhseLYus/RhYOWv4ltq1mWmcdkYxTahQ9bSgzz
X-Gm-Gg: AYBFou2RVsAOhzhsZcBSH/errQ2Gz68anf3QYe0Cq6b2uFM+f9WgO8A2yvkjcvoE80H
	PQiMEoZN6JInqlJlqsD3rv3xxi61YcUy2QxcJIRJFky3eQyajVdZE+yyy9T6EgWYtfn/TD1uhaT
	grpPAJa1tzkqPfkr2s9I629z4Gj0WFJWWmV7vjkPdXPEjfHXCnr0B8fVRqzaZpv0WyYNNtSpsTa
	rXQFNS2RioHrN/Vr44889G56h5iRbYr6GxlsF/tXPdrz2S6YStmg4PD3aZwvdcQYdUBuP3x8RPt
	ZsCWc4mBYIx4NB3+pyQszOomofP0u6KxfVlkczyFEnwqxMFREhmu5VK3Lugl8UiNg/EnaIvXOOy
	kHxD41dJDTOVSYv7HEkdMEIFkxXDjhsZWPlwpeSxB6RDL02QJSKGlffgUkh23+18i0aPsytaJza
	JwGy9hLpVmWtVqsqg0o516QTAfIrE6LbZV793a5QXeTJvqPVWcieiQPUWHEZoXW1EexgWXUJ/OH
	9TAO7ATovXf4jBfTOJQyvE2WEkjP5pqCdHX0+M10lPB+uUmr54bMcxycAfr7e9TXxIf3xbnpGra
	vNs33pT03dI32WVhVNAvU/U+nHYhcWbBfTrYPejSCnN37oNQ/MbEY84ukZ//90q6VZ62W6VxGD6
	EC2fjMg==
X-Received: by 2002:a05:6a00:1c9c:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8beb56cd05amr11614200b3a.9.1794906184648;
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2a20fc8sm4517468b3a.49.2026.11.17.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Message-ID: <57e46e27-db98-4f9e-a657-1f224d3428b7@gmail.com>
Date: Tue, 17 Nov 2026 17:02:45 +0800
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
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Frank Li <Frank.li@oss.nxp.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <avtum_vwVClf7xhE@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <avtum_vwVClf7xhE@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for your review.

Best Regards,
Shan-Chun

On 11/17/2026 4:59 AM, Frank Li wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..d05971662a5d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
>> +  has 10 channels and performs memory-to-memory, memory-to-peripheral and
>> +  peripheral-to-memory transfers.
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <shanchun1218@gmail.com>
>> +
>> +allOf:
>> +  - $ref: dma-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-pdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the PDMA channel number. The second cell is the
>> +      peripheral request source number, as listed in the reference manual.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        dma-controller@40080000 {
>> +            compatible = "nuvoton,ma35d1-pdma";
>> +            reg = <0x0 0x40080000 0x0 0x2000>;
>> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk PDMA0_GATE>;
>> +            resets = <&sys MA35D1_RESET_PDMA0>;
>> +            #dma-cells = <2>;
>> +        };
>> +    };
>> +
>> +...
>> --
>> 2.25.1
>>

