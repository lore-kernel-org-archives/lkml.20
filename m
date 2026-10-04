Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A26230264
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122808; cv=none; b=LBd5hL0GWmcJg84rACzcBO5srYU6c5Fm8mD3wt7yPcxjzMlsZcW1R1j9mjIfF9yFUe8K8nA6tGgPO48/WKveR8Rq/++0YAa4I+JjzgotYfdA3BKELUlBwr+8dNgD3L3XoKmxSEChKUzB5XXt3QNhwCx9FCNH49Z169CfaLNAXzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122808; c=relaxed/simple;
	bh=Eta09yHf0y9K2CX42Ddir6PtPan1JHP91SRbMGkdqe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4Wyrx5MSkk3YMBRtofbJd9Qf2xc5kozzhVkoFaNOz4Q64nazxbjkKnJvt3MQ0i35GfNURHDh6V75GX9VElUEl53PXGHhN1jjS2OKfGAfWWLcBjEmo6uVxNq8F7LO9iaWhfA1/RIMnu6g6abIlJhMR9NPP3wGOzI1AMr1ei3LB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1706a2b24so1681015e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122805; x=1791727605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUXvy50bECQ2jjyhstzsZVcApJzJFF/Z6zq/JzULuvY=;
        b=b6/sXDgrv9BjLJXlKvynASvVGdN+zFllPsHG2MiTkWDCa+1YF/856ZZEmaf37zN5qP
         NI0CUHTzHfrDcNsDuIh8QL5bQ938U86EuHAgyrUk/hAUkufF55Wy+c/n3QdgpiijObn+
         VsyWFX2Bq2NForvPZ227tzWwYk0ywT7YVqImAOOA85DQefMCfxXoJ/eOKS02y/CoOrWI
         56yMxhBfPbtGdy3pYiCsqDlP/8aMRkkcaAIqzyrcoAehLEqafd/mlRCD3etWpPznVEh4
         EzYWQXxawy3ICqsiQLR3LAK2Q/wxjVQDA2nTzr4e6YX2xHHiRzF6T0TVlPk+aXd1CzAW
         XF0w==
X-Forwarded-Encrypted: i=1; AKwUvBz83BJdUaNs4T+nPz54X9tXmTVTNlbcPoLStPTBjF/wOmlBu8qHN6rymx/ncDzMSkPeplUvpXOEAbjmIjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kOdWZ7MSKQpBlrSo0BQmTdJFuxKzPVZgiou07rF9Fv6vwniaK9
	pqqhwvZXwQDX1cq4zGHZn/Bn0n4vjrQSono3xV0jNrtoPnH+cGKddVPP
X-Gm-Gg: AYBFou1+KtAWgOFom2n/adGlJEKXWg/IFjWvEZ4J2gafOdtoyGyj4MUsualFltV3f3F
	DVTSPkyd58oso28J/OF0G3dg78JlZ9F4eJmJSF7CMHf7ckZZXX+DA1uzrfLLewBNEtZWECqQ8mz
	O43msKIv9Z7YcCkqWMV6+gnWO/UebNlOl85qEBnf/VDNfXav9RDBZe4ey9aMp+wJdRYix2/bxp2
	EMFkViAz0FSBZgWDTvr8HGTbYYfECDc87IbSHprxGcF7CRlYEN+7jqIiH9grvwKtD+Ww/4wyNHE
	rsEZ2hOOjSDDyHbbzsVWnLGzxQcEF5BZSgnkHGTtzF90Qj+DB9dLOp116dZ8ITjF90d0zIRs5j5
	YNT7Jb3ENVDuTgJfxvUo5s6JM81ROTwCrm58G+9axr4KiqxKdRvV2qXMWZdDoFoUYNPDjUoiiXD
	OAqWdYo5Z+hRMMH/Q0JmA+tsen2KY0ks3a+wRBljHVN63FFd88qghW6XaygloTNt5gk9ikph27L
	fPpM47qvJtlmr7l5YmmbPZh76sy
X-Received: by 2002:a05:600c:6212:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a0275432f7mr127957445e9.9.1791122804538;
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17125adfesm30902405e9.15.2026.10.04.07.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Date: Sun, 4 Oct 2026 15:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260924-stinger-stoplight-7c327c3225fa@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2026 18:21, Conor Dooley wrote:
> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add the T7 compatible to the Meson DWMAC binding.
>>
>> The T7 DWMAC controller requires the following compatible combination:
>>
>> amlogic,t7-dwmac
>> amlogic,meson-axg-dwmac
>> snps,dwmac-4.00
>>
>> Add a conditional schema check to enforce this compatible combination
>> when amlogic,t7-dwmac is used.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> index 5c91716d1f21..b529ca5577a9 100644
>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> @@ -23,11 +23,24 @@ select:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>     required:
>>       - compatible
>>   
>>   allOf:
>>     - $ref: snps,dwmac.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,t7-dwmac
>> +    then:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: amlogic,t7-dwmac
>> +            - const: amlogic,meson-axg-dwmac
>> +            - const: snps,dwmac-4.00
> 
> This is not how fallback compatibles are described.
> 
> Instead of doing this, which affects all other compatibles in the file
> by allowing dwmac-4.00 for all devices, please do this the normal way.
> dwmac isn't special, it's just this binding that's weird!
> Can whats currently in the binding (before this patch) be largely
> replaced by just doing:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - amlogic,meson8b-dwmac
>                - amlogic,meson-gxbb-dwmac
>                - amlogic,meson-axg-dwmac
>                - amlogic,meson-g12a-dwmac
>            - const: snps,dwmac-3.70a
>            - const: snps,dwmac
>        - items:
>            - enum:
>                - amlogic,meson6-dwmac
>                - amlogic,meson8m2-dwmac
>            - const: snps,dwmac
> 
> You'll have to check this yourself against the amlogic devicetrees and
> see if this is correct, but with this you should be able to add your new
> device without doing anything special.

I have the same patch in my T7 work and checked it against the amlogic 
device trees: meson6 and meson8m2 use the two entry form, the rest add 
snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example 
needs fixing.

Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
in common.h, so the core is 5.10a, not 4.00. And the controller reaches
DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
so clk_disable_unused switches it off. My node lists it as a fourth
clock. Does the AN400 differ?

I will send my series today so the code is on the list. Not a race: I
will drop or rebase whatever overlaps once you tell me.

Thanks,
Lucas

> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>>     - if:
>>         properties:
>>           compatible:
>> @@ -38,6 +51,7 @@ allOf:
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>>                 - amlogic,meson-g12a-dwmac
>> +              - amlogic,t7-dwmac
>>   
>>       then:
>>         properties:
>> @@ -93,6 +107,7 @@ allOf:
>>                 - amlogic,meson8m2-dwmac
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>> +              - amlogic,t7-dwmac
>>       then:
>>         properties:
>>           rx-internal-delay-ps:
>> @@ -139,8 +154,10 @@ properties:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>       contains:
>>         enum:
>> +        - snps,dwmac-4.00
>>           - snps,dwmac-3.70a
>>           - snps,dwmac
>>   
>>
>> -- 
>> 2.52.0
>>
>>
