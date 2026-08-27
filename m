Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8023A3830
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819005; cv=none; b=EmlLotgfJWm6cTd6lq6zmD5I6t24msLTtOyJo3uAWxjmCwW8RBlETSO9vClPRvvtXLmEoudWtzePfcEbXoz4OoDSYhOV5jQhVGengW/pJiIz8XiWwFsfIIAp2kD5hVLRIbehk+2LwMa7pFKokUqK9nrF8a7rgUBWdrCPBJqIkrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819005; c=relaxed/simple;
	bh=WPX0/BZ5LnEVrTPcPtmV68GfdYM6tPz4FQHz8zmVGXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnGlEjmfHHt9mOdMJVc20mxP3mnncpUMtLJIzgnHwIMR/spMHJuYOFZRkFkJxavPLCgeewU5s6f9nCwJi5jqP/cIkrxt6qmujWGmNFTNJ4oKKP3a6gYAkgDgSRNQ0q7Mc0n1v6zceo0yNx42cOzaLdlQNns1+e0lfmHKQ1D35w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQrguZ3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQrguZ3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so16522465e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819003; x=1788423803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=gDQrguZ3GbygbvSTSsbzOtdcDAZ/KmZ5QpeK0A0GJd92eCwnyEpTX/n7DykR5/EMRG
         Do8E3XWkes0pQRMXViSHKRmqpVePXr3bC4zHHlg5Ca0sBusFMyTZMeEunbnUzUsKbZAT
         UEEMBBYryLKIQTkkkoqCfB/e7uEnWUH3SZGLbxkaJZvT7lsgmfoYdADIPILIzvrsrE+h
         F+/ZI7HTMWnDuTV/h1Taf/z3/PHm/BRYR4TZN940zEqJYqiQJe9f3VBepfxoFyvSAA/g
         TAQuMhaaZOIdFOlatEXzjKk/aDp78x3HxhpqQ5a5nRDx+w1Y4k21OcJsYqRvCjMJw/ee
         Q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819003; x=1788423803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=phReD3wejAIk7uHexY6b4mvXR4YSH0S94xJl69ineeZwK41YTIuy+ls87U/ISLCVPj
         aI+J645bXXqElRjmS5dX1ccUntvVkQ6gCXcRfRNPEXiOJE3pIgkPJ/qwWhPqyJ1Yi24I
         P6S+5PhBEuj+r9f2pgZyPdQVSxPbqB/jxsLifLcvceLzDAcPCK5aMhftEm/wSH27eRLb
         T61dynZcnooFnhFseQ7afOU4XnFWwthQ229Am0g/orJEBo2QfpIK7K8+LFe0eLimy0wi
         KCOHFSrJGiHKmIt0GPAWI53c18mLFjVhuNA6YdyOn9Bf0FzG9LsY/8ywoJU/ZGrvGDqh
         UMDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0dz0OgPWsk4pVei2RyGY1PIjxiiGqSrxV1ok4eHb0qwPYYJ/dK0KRlMypLa/aCH/gPgSZT8OgO3YsDNM=@vger.kernel.org
X-Gm-Message-State: AFuF++nRtxs/vVgZSq/30F+5K0n6mroc9+Kmbeg6tBBtm4RUrUis5v7N
	H7uPlpVVfHhQqofUHd3jM6cScLj/FbC/yeLvgTWAtXN3ceSUcaDA9ur/
X-Gm-Gg: AR+sD10jhehHKsVa7eEsYYMsrLEaPqHzb2wMkI3Sz6BdJG+iyX7L/veJHVDfY/aGq0S
	Qp4GASsol6UyTeRiPHweqa7L65yyy+ywbe6clTb6Yj3eYWxF9lbjmqc8z1yhdFrJJzC0Nm4sDV7
	5vO44iBfvZMe41+4nwRfeuISgccA/hZzL6vzHxDqgYa0b9dKaG0OhODJF6YGm8g0upkwC2r9kqw
	clhZlhi9HCIWnlagq6OK0zfEw5rSep9w0MvbxcRqC/ooppxwaIjDRWc7s0WSsLIEPretEaTLBbC
	pe0ir89zLUtsKfXBddmR4vpYKbjayowDTS+/Oak1OwTTyBW0shFoScL2EgutLv6fPrKbAKkJ1Ly
	zhIG1qlz2Nl9EX0iggdOGZ3OnF6aFONjhn0Lpm2O7a4dHe3CNUPD2voDAEJO1Sa3sOXMqju0JT5
	j1kDTwp+arVnNxvw2lI9S+yTHMcWMezCdPE8olnM4WL6vnSEbOPEJclSPHNWDIY88Q6UWL3PkcW
	t/kuNPjmMKpQz/l
X-Received: by 2002:a05:600c:3155:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499dc6feffcmr116979315e9.8.1787819002485;
        Thu, 27 Aug 2026 01:23:22 -0700 (PDT)
Received: from [10.51.121.166] ([193.118.38.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm7350450f8f.15.2026.08.27.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:21 -0700 (PDT)
Message-ID: <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
Date: Thu, 27 Aug 2026 10:23:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.08.2026 18:58, Conor Dooley wrote:
> On Mon, Aug 10, 2026 at 11:54:03AM -0500, Rob Herring wrote:
>> On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
>>
>> I missed that this is N input clocks and 1 output clock. But that leads
>> to other questions. You've implemented a clock mux then? I still don't
>> understand for what h/w that makes sense. Which input clock is selected?
>> The locked one?
> 
> Yeah, I thought this was n inputs and n outputs, with each gpio
> signalling that an individual PLL had locked.


It is n input clocks and 1 output clock. It is kind of a mux, but the 
CPU doesn't control the clocks or GPIO signals. The whole idea is that 
peripherals check the output clock, when it's locked that means _all_ 
the clocks are locked and GPIOs are in expected state. That's why the 
selection operation is not really implemented.

Actually the number of input clocks don't have to correspond to the 
number of the GPIOs, because the GPIO signals indicate the locked state 
of the clocks that are not accessible to the CPU.

Slava
