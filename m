Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC0355049;
	Thu, 10 Sep 2026 23:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083567; cv=none; b=ZF2RQAbxdxiw20A7QQswqiv5VlLLYv/YZ0K0JFnPT70zuwsBhk+qoaBCGH8vYCYpqJLk/y1066ZX0MfEr+prjPKorCD+A66D1aVZ1EiB6akuik2X2Tb7zPDiy7cxitHolXnCmIsBx6Dpmtsqi+mK/c60GJE9dp9uoxIPBEi2ZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083567; c=relaxed/simple;
	bh=5kQW6y1coDVmYNqOugvG9VKW30Paol1Kout/gnCvfzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2s2K/e9UCcSpNuKzKGvd4kYgDD6IlrNOto28NkoQeuNYoUXE7R29GflrMDuYNQw1F8rjkFJCVomhZDBYAcuJb8qqj9au8hnmc79I2pfWHIXQKMg0zJTeCi0cnsDCFJTgAuNG3tfi0/d4VrVH/LFgMqSIaFUmWw34XRxfy9lER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cCpzL7FP; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cCpzL7FP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A52E61031B9;
	Fri, 11 Sep 2026 01:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789083553;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yzM2SThJXQtr6zFl24Oqno+3Ld43dN90vFMCB/HxBhI=;
	b=cCpzL7FPGzC0ImZ9y9sk8sJ4CG7EKEUiTLniKKt4X3dbPzjbclmNtCLxJDMG5S730PgTOh
	QgqDcZ3m9OqCInXm0u+DJvubzn4JGVCOZ74ixgLRsi8Y93kpPc3VmJpqWfcwYN26qawMMn
	iqyJSsqPDHDTrYsg/2vpB32Fzqq9W0HvVX/Q4AD5dhAsFE5/GBWwZiPFyeH7n4uv+HQzrW
	TIC94Jghw865EVmBsG/iqau/p7azOiCS92FAgcMWA2UUw2WsO+rJzudlAmxGQEzNxEXi+O
	zPPepGQsCNueTOyIGpBoLnH2kETtTf0eKFgMA5QqxQWpvdgZWrZEqRA4OOIk8w==
Message-ID: <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
Date: Fri, 11 Sep 2026 01:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
 <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/10/26 9:17 AM, Michal Simek wrote:

>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>>> @@ -44,6 +44,11 @@ properties:
>>>>             - const: xlnx,zynq-zed
>>>>             - const: xlnx,zynq-7000
>>>> +      - items:
>>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>>> +          - const: ifm,zynqmp-vhip6
>>>> +          - const: xlnx,zynqmp
>>>> +
>>>>         - items:
>>>>             - enum:
>>>>                 - xlnx,zynqmp-zc1751
>>>
>>> Can you please provide any link to public documentation about this 
>>> board?
>>> I wasn't able to find anything through google..
>>
>> I do not know whether there is any, it is an internal board from which 
>> other boards get derived.
>>
>> What would you like to know ?
> 
> I would like to know value for me to maintain it. Why should I care 
> about board which don't have any public documentation and none can buy? 

I think because the users of this board actually do benefit from having 
the support upstream, instead of having to lug around random downstream 
patches in assorted state of decay.

> There will be thousands of similar boards out there and I am definitely 
> not going to have all of them in the tree.
Why not ? There are users who benefit from having their board support 
upstream. This is what other SoC vendors do as well, it does not seem to 
be a problem, rather it is a good indicator that the SoC has users who 
care about it and about upstream.

If you do require a sample board, I could try to arrange that.
