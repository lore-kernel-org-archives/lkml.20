Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2D408602;
	Tue, 15 Sep 2026 03:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442776; cv=none; b=V5eT4v/LLbOD2gdWr4cNCQDYKUCpDI5NLJmBKP022RvvsS4FYFORHPT5g2hw9akfpX3Ekr+HbhhcXc2PXX3vdSOiRQeEtS5nbKGn1ahhzDvW+Ls1RwfHnFfi+vGu7qX10QQpFRwmA90S0cXyi+X46p+6yITRI+pn+uxSfh970T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442776; c=relaxed/simple;
	bh=h5Rj9bqeF5Cdvze9iLmoO6Lm6fm3xpjPLZX/g2PKnmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1FgHRQa4rNWEzo26cZ/ghEq8hLn38dE91YmOMwYudmC/vC6pQLkynIN3JBE/2/kZqTGI8HlAe7oAQfNt+oGvcYkW1wwy5B7xJG+0to7TCd6oICfGq+yXy4b7f0QPcKBWEf3vlrQb8U4rZcoFGyWdO32wzC3bPyZ0L6XRIntx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Mxmu37ke; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Mxmu37ke"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9C4D10428C;
	Tue, 15 Sep 2026 05:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789442772;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y6tqAcnKMATccMeJAtItTA1TzHzXFuF+as57JTYCMrY=;
	b=Mxmu37keQlI/dIMcUxL8Din1jzxvVUOgHgmJg9Sv3NJVVH3QNgIaKn/ToCRGFs4tZMcirq
	SSqSKNPAmzdj5TW9iEXxZOb/r4xgqWy3UL8DEj5KYEFBLrVOr/W/HpaN/idH9X/wwWu9fl
	uM5wEyx+KIC6Jh9Lxp7a0UUGQsiT4XLZUXQGa/boBGRsu4v5fDSvrpIcmvSnpiQQSZAAES
	/U9Ev1SDKKuHZY+cdkRzX8avWNq+94c9bMpSX8PnaMG9lOV9CLxUZm3fWPjYkEvzQSu7e5
	DycDPkfFZ9iJnHdzIQB333vtWGNhuLW7c32N86L6Zlu+3xjzpwXpAUMnfBCKJQ==
Message-ID: <76db8193-6144-4460-acaa-f3d11fddba44@nabladev.com>
Date: Tue, 15 Sep 2026 02:10:16 +0200
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
 <f80845ae-9ab8-474e-89b2-80ac3fbd184c@nabladev.com>
 <656ae6e2-608a-4839-bcfe-941dfffdca11@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <656ae6e2-608a-4839-bcfe-941dfffdca11@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/14/26 8:29 AM, Michal Simek wrote:

[...]
>>>>> There will be thousands of similar boards out there and I am 
>>>>> definitely not going to have all of them in the tree.
>>>> Why not ? There are users who benefit from having their board 
>>>> support upstream. This is what other SoC vendors do as well, it does 
>>>> not seem to be a problem, rather it is a good indicator that the SoC 
>>>> has users who care about it and about upstream.
>>>
>>> If there is public documentation about it I don't have any problem 
>>> with it.
>>
>> I do not think there is, but no public documentation is the case with 
>> many boards/DTs that are upstream, and it does not diminish their 
>> usefulness to their users.
>>
>> What do you need to know ?
> 
> All these SOC based boards are created not because of hard block (PS 
> part) but because of programmable logic which is not described in any 
> upstream project DT. It means no matter what manufacturer has to 
> maintain PL description separately.
> 
> I don't really mind if other maintainers are fine with dealing with 
> these kind of boards without any public documentation. There is no way 
> to check if even your description is correct.
> I am not going to take any responsibility for maintaining them.
I can help with maintaining this board, it's a non-issue.
