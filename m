Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3151FBC8C;
	Sun, 13 Sep 2026 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268663; cv=none; b=uObHNWF+qo7nE90FKQZYWwJdN4onKosimRuvPJUd+uvByH+WwfauUld7+/ufjroYU1SrM18uMrEXNSqc2KZfGMOMowt6F2eSyAEjlTbtwRN7n2+OLRXyAwWmTt/WHE5jAQZE3Dcu6nJ/FPNASTBZ8beiWx2jsSAKv7KCRz/6Gbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268663; c=relaxed/simple;
	bh=gRRkKE0fulyNwqplE8fkM64FWgkQMqJLaKEoav16UYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utDaUWQVX5vzSWQRc1euD6TzckXGFtYmXyN9LANcmMCqI0qqKPR772SLS8ravccvzXdMT2TSI3cPBDqHGYnQyEexLguIHLXkepv3cngVj0v0MYEGOp0iWjpJQYg4egK1J2y75mGuCQyy1+OQ0n7tgApylD37mtKxqj7dFLe3kME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ImCoAi7F; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ImCoAi7F"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33256103CE0;
	Sun, 13 Sep 2026 05:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789268659;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kMD9p5TTIjgCEBU21mlko+Fs1QpjbWq8gAPH4kWw+U8=;
	b=ImCoAi7FcXODL5F2t+gDvjcxKKHiullY1lFwR7bYIZ2AGgwbXkaMyiY/8vAO+rXcaSGhov
	8bXjhqHfIA69Ipl67lhWOsMkcngtcLtsC+4TehWSLq4thztJPbm35hLSrPH+zdgQLoHBkb
	s3jlAQ4dI/SPDFtYa33K88i6jkb3uBA16uPgbhGulms4LyTdgyIDbjPvwf9ePPGgg46LaP
	9OgEDGELfW+VnktC1W3BxD+T8DF7EKAjTos6iVacfbwxRc9XwfIYzxqOe4yq77Hc++xTbZ
	bxisJaVJNqmF/SRAYKjvNXdAjA4hTsc+xNNhy/GZXC6DfTrnAnJKm7z+6OURZA==
Message-ID: <f80845ae-9ab8-474e-89b2-80ac3fbd184c@nabladev.com>
Date: Fri, 11 Sep 2026 17:54:44 +0200
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
 <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
 <a0d23fc9-6f7b-4c19-9f6f-9cc0c7cce3f5@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <a0d23fc9-6f7b-4c19-9f6f-9cc0c7cce3f5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 10:38 AM, Michal Simek wrote:
> 
> 
> On 9/11/26 01:39, Marek Vasut wrote:
>> On 9/10/26 9:17 AM, Michal Simek wrote:
>>
>>>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>>>>> @@ -44,6 +44,11 @@ properties:
>>>>>>             - const: xlnx,zynq-zed
>>>>>>             - const: xlnx,zynq-7000
>>>>>> +      - items:
>>>>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>>>>> +          - const: ifm,zynqmp-vhip6
>>>>>> +          - const: xlnx,zynqmp
>>>>>> +
>>>>>>         - items:
>>>>>>             - enum:
>>>>>>                 - xlnx,zynqmp-zc1751
>>>>>
>>>>> Can you please provide any link to public documentation about this 
>>>>> board?
>>>>> I wasn't able to find anything through google..
>>>>
>>>> I do not know whether there is any, it is an internal board from 
>>>> which other boards get derived.
>>>>
>>>> What would you like to know ?
>>>
>>> I would like to know value for me to maintain it. Why should I care 
>>> about board which don't have any public documentation and none can buy? 
>>
>> I think because the users of this board actually do benefit from 
>> having the support upstream, instead of having to lug around random 
>> downstream patches in assorted state of decay.
>>
>>> There will be thousands of similar boards out there and I am 
>>> definitely not going to have all of them in the tree.
>> Why not ? There are users who benefit from having their board support 
>> upstream. This is what other SoC vendors do as well, it does not seem 
>> to be a problem, rather it is a good indicator that the SoC has users 
>> who care about it and about upstream.
> 
> If there is public documentation about it I don't have any problem with it.

I do not think there is, but no public documentation is the case with 
many boards/DTs that are upstream, and it does not diminish their 
usefulness to their users.

What do you need to know ?
