Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66E4A8A11
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373926; cv=none; b=QWtl8m1VN1Dey+e1faYVQFFpUmnFXj7rlceEqwkW3utf2wWI2cJYM7veGVPgW/zVJKYdyDFtO2ufk/c4Z/9WSQhMBxIayjjl5xdm2Je/wZjmaN3LAJlSqn1f4av4rYKO8AqOxewthLuHq5wHdhTpiA3QtdlyrdfnNk1BF9N9ExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373926; c=relaxed/simple;
	bh=5SbQ4qVfDk+O3G5b8f8HVnIF2DIqTxp8g+oQUr1NxyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tH8sRlBN8cXwqlJ/lBdjFWPm6BRab0W2COueP2sFSG+EwwxpPEFg1UB0+pYFEeRxBAVz7U9F2TQO4I3jf7eyLTphrinKL3JdrWatLploAqMtDIg6nvLIAKjLHIGSuZkQmEf6BySutjiPkKZigXnFuBVF0fkwOPAarfoo4TKhEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SWcF0QU6; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SWcF0QU6"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43b7e186a0cso833769fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788373919; x=1788978719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi0Sf+aTtT6rp3DHMlcGuCDc4NN0FWj4XsTs8T+XdFU=;
        b=SWcF0QU6RhZnqsXP8ya+9RlEFTJFGKOAhGTzhyd8dRoK4sJ0RBIvuZaKxeH3turVNU
         LlrL3sbfw33+m6Qul5qtdqataDzv64uyyrrF6F4QD0MENKQ5fyA3BugKklixuAsNNqsh
         nSPMl5fHJ1Xuwu6iPyUJbZYithVB34ymu5snpRxPsttu3/LtLw1vpmBSoPwHlD4Qaqo1
         HiFCuYmq3s8m0EHpwO7sANzRLNj0WMYqDqQY08YQRUpSG69OiZb6VL3q3COMwDesn5q3
         LB+Azsm334Aiu7/fevVoSCpHWkjPgMjtULV7rkg//5YjVYWpqG5VjYR6p1axnYNNFidb
         FmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373919; x=1788978719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi0Sf+aTtT6rp3DHMlcGuCDc4NN0FWj4XsTs8T+XdFU=;
        b=aEjx13RCGTGwPzRP50+YkVigVgorhw2Yocp076sORMDqJQPevh53dqhrqUMo7qq4EQ
         t/QjWJj0XJvgAw9KvfNmreXDDLZQUs4bgTSk/3Ls4mxxjC1ILDpW/ncTBO8FEcfniOnB
         d2H8VWIt/4waP6vk1515tQ4Bh2CugG0uP9qwzUq3Pecr+uIVEbQ0lCQ3j5TDSmEta8vO
         5aAsIsuYlNRoTYdZYlEPAK5D/OF4Di+pgK4+jPRUTH+LyZorukaV0/ErFCt7W64iuLMv
         +LWRCeMWpHHs/PZiCBZLCnWNKdBuhHXM8ZZ/j9etI60/O2LbQyGrwWgHJVtGxUMQv+d/
         LmbA==
X-Forwarded-Encrypted: i=1; AHgh+RqKNcMgfdRrGyF39UmP+NZmbOTzpQesRrfOFd7K+RTXrgqfGcMGm4/is2SNa7UkE1CyPi56It/wgfbo5oM=@vger.kernel.org
X-Gm-Message-State: AFuF++k2uzeTTWoYtBRJlUzkYnrAxGO2+o8AdzrCv+lY4lRSbXfXu1ey
	9JmVs7nD/eQsLGYB0kYOWJpk8tuOHdTy9f7PLK3SExrNcjQ1fbtasPMija/X1SdGqqQ=
X-Gm-Gg: AYBFou3N4L6kXDrx0CIVMCx7X4SwLz31qV+ir+TXbvM3AJZaM0VywBN9Ly6w3RF07fE
	DKAlarcjBelaHWvhYyZTJtmk8ALR12GZAL+xkZSPrqMdnt+3cp1ddT6LLEJdH7iYiT4a9AEItPN
	GM5lr2/7ZdlxPeaBNIcGWh0UMLhaGmVPltqIZUtktXfWb8QPAD//99o67zF1dSA8flAZLducISi
	NxUABA6TFueTEcN/l4lo8kNLRH0NmtuF3g0lSG+pqykzMJOpfnTUcwC15qksAmRf61rkPE1XW9m
	NdaNu7NSiB8sBKUkka+uZ6C7Ex+6FuDDzHAIdRkHdenCbvX5moc2voGKiHgAdxuUXBEpMc52RMi
	7fY3QPPUP5aNBxHllfOcLe0GT6CH3xIpzq68QcHodhulkyEP97i020wg4/3h1kXkKxeSwApsB5i
	WcH1Ovjl1QvPyF9yffDxLaJtorFubeDL4K+JGtp8GK41uiv763XiDYdN6lfdVLV+TRhvDuRIx61
	qszRkunDVghRC80XVsQm0R8RVdkxgpDO4NjHFoe
X-Received: by 2002:a05:6870:440c:b0:46c:feb7:5443 with SMTP id 586e51a60fabf-46f8341bc02mr4883463fac.0.1788373919124;
        Wed, 02 Sep 2026 11:31:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:518a:9db8:615b:293f? ([2600:8803:e7e4:500:518a:9db8:615b:293f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f32933b9asm4606620fac.9.2026.09.02.11.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:31:58 -0700 (PDT)
Message-ID: <60dc58c6-dfe2-4377-9a73-f65cda56179c@baylibre.com>
Date: Wed, 2 Sep 2026 13:31:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads1015: Add label
 property
To: Flaviu Nistor <flaviu.nistor@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260902172230.5234-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260902172230.5234-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 12:22 PM, Flaviu Nistor wrote:
> Add support for an optional label property per channel similar to other adc
> chips. This allows assigning distinct names for each channel which can
> match the schematic signal name.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> index 718f633c6e04..777a75c21d7f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
> @@ -66,6 +66,11 @@ patternProperties:
>            - minimum: 0
>              maximum: 7
>  
> +      label:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          A descriptive name for this channel, like "vcc_ram" or "CH3".
> +

Apparently this chip has quite old dt-bindings. Normally, we would have
included adc.yaml to get this and other channel properties.

And we would have used diff-channels and single-channel from that to
describe which pins are associated with which channel rather than having
a magic number for reg. And the ti,datarate looks suspicious as sampling
frequency is usually we control at runtime.

Anyway, none of that is really relevant to this patch. We'll see what
Jonathan says about using adc.yaml here vs. adding a label property.

>        ti,gain:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 0
> @@ -125,6 +130,7 @@ examples:
>                  reg = <4>;
>                  ti,gain = <3>;
>                  ti,datarate = <5>;
> +                label = "CH3";
>              };
>          };
>      };

