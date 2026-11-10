Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271177;
	b=U4DSUy+XSM3oH/17BfyfeEZSAzl0zrpKSkKbThPI7+Ddrq10dzT8jJj6mMCXBL8ReZQ/
	 j114k/WeyC9Ir7AnDVKUKrdAaqIvipgDFQwrCrtA2xl26eCg7Gw06xTTT1X63yrLds13L
	 9UNoU7ZgeR/prVLThRmC1RbW8NZ0tVqVsxmT0xYeNHMyMDre8NvTJCGur5baFTc1krMmj
	 5I4a0W6N523ZhlvUI/cJYI47dY7+R5BxADKcj1emqdfGuSuf1jYnUYGhsZrJ0lGMWqn71
	 w8Vc4lGnprzloxDvlHnTvu41cG5LshXshdKB/QWnxhAVOL7groFy+6/kMlXhZHhaV1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
	b=ZI/OnsiU5NpPHfb/MZpszCRYvw/2jc/hsjg5gGuAvwZGFqkx7Zagg77Fg3DGFfxXqB1U
	 wOwzNe3I6I96qQVsNZfW4JsNpk31qwnPTie75vX/HM6Lf5AVEbqISrFxlM2/iVDL2DWCL
	 384GZvKHRYEIWLf7PfqsBsZa2/5S9A0NJ67YGb+uYNQk/r3Pq25/YJTFYciudXhN1zSAC
	 wK/nICWAlyu1zZUsFYPVKyhpFcISOVxAjlmlOCMCaWI1JlSP8qmAEOaershuckEcZDpHf
	 NGHDhqODEEXjZZd4lf98SeBHa7dyqys1MLb0CpFO4HE8GMwyR7Uu7NaOXuRaaz713bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E623606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E623606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1139376a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271176; x=1794875976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=a6nYydig6QvSKo7EkEElyV2YraExoirso0hjPWfiBXMd5zbsE5V2+ys7gBTXGBgLMy
         KztL3S4lXSLQNQFXbomWBbd4uwbtyFzJ3PlMxe3uSSdlmkG5VE/Md9tv0hOKnruaYi0x
         aPiGZY/Lb/b9UIj6yOm3Bkfm7pAV+dJnpXqlq919gh7//xQg6gdoEVc1qcuuy4ZsBpqV
         bd01OkHyArnS20r2xDk3ROR//CEabXF5XGAQjI7VyXzuf/s1A2ioL/h/VL0QUAHHRZFz
         iXsyGWYm6ejppGHGdXnl0oclHQR9TKzhn0HYYCOubjWw6Rhb4LBRNRyKYxgjASXaQTqt
         k2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271176; x=1794875976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=wUzqDVW5JqV+I4GeRrUQ/bW1kNc+5fSxbPuwZP98kOIDkBcnxhNkwpoN6v817/yk7a
         5MdpgTLVEktgoXq/GgCt1TK6UVipqAAFHWQEXRsEOQ76fF3D5FiEFBrjnKAv6GjJ4Czj
         C6kobFsPnHT8uvUQ/1wnRjj5f0PG+MLw7ivuxqySmsP7LF9/rGgSSeyNjwRndpBPcA2H
         BZhLwWHBOF2F4ePcXe6tw5Dvosiwx13nQ+HJxx72YEufkli74RNXTXw2yhNkUzrrt1IT
         QDTTPrOU/T9r874oBnuxPmgKrIXjqF5f+z+TLWwEKZkLP+wmU3Nu+tKP5ZOCu0Jltmgy
         aQSQ==
X-Forwarded-Encrypted: i=1; AL+hErF3C/0b1qT3Ed8tvMmLtJHc6YlhXc/lEnkTl6kL4MBvidAKQ/SXtrVjDwXJxGxqeQ77IEsSUdAdxmTQFIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VHwe5K2cwVJzEoP+tvyNJQLyngM06Ol9OsuzFYwLbY1gdeHuH
	l+UxQNCb98htBihdmM8xuFO2qxIgeTV9Y7v+vdBaqM4sBZP/pjUko2xj
X-Gm-Gg: AYBFou0tiyHyMKNlEj3BHlM0qRXkp2b1uQ5N+h2ibqK8hAxgjAH0UUMrXILvJHRAKdQ
	3VVT8KaKEZAWVg9/upYPNUNSa+moQuChcWksUJllPVMjQA+D/ksqrRyUBRCqUhBq7yA0ut1zVR0
	l+cN82RQPg7C/sQayHbvKxfQzeXtEFyYX2TI5qBbJF/cpovCAOCDoJzJg2Yn2HIAaqvl9jotDlK
	d7ciGoo00GK/sS4NU92BxszZhv6laxs+kokNuY14aF7KPBy/TYkPHA7WsrVf3YRkxkuSvUO7OaV
	pPv+6NyohTLU6v5MBXYF0IvrD7dJ8uTLx6CE6u9+ha8k1CE0+jLrnsMRJV5Qie42rg2Oqlf8O4U
	ywMhN/44in/j7Xe6/knc5kjcgeFxrDlrnl00MZ6TK2kmlR8bp7LhsyydyObjAHAYAiASfmYwrrh
	IPNIUcP+zgwmg/TdNZqgvP7pNf9ujSevPhOj0KQUe8Kuum6zRq2/M4KeToEbllCkw3M6umxycY+
	UytPSiOndu0hTsRq/MMGb+Fy7NSRJN7efpxqQh+dva0Pw/AHyhHeJB8yT7kBrR7BJcqNLBceOhA
	TnrwkyFUIalNisugkgQSMHXGV36qIwPgIVEsyj3fBIElEI04YsHG1y+FmpggvxXpWL/L6sz41W9
	BMZ4b
X-Received: by 2002:a17:90b:4ad0:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b166ad1ee5mr1415032a91.9.1794271175917;
        Mon, 09 Nov 2026 16:39:35 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779d5c8sm1512711a91.2.2026.11.09.16.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:39:34 -0800 (PST)
Message-ID: <d2f451a0-33bb-47ab-b31e-aa40df9d7ab7@gmail.com>
Date: Tue, 10 Nov 2026 08:39:18 +0800
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Krzysztof,

Thanks for the review

On 11/9/2026 9:16 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun

