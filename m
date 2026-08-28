Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB452BE02D;
	Fri, 28 Aug 2026 01:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880104; cv=none; b=N5GUn3fW5u1PKrhggdyi4HtPBnyMItip6DCpaFZHLJrK67CKyq0tc3M5FpowtP/jOssm7z1CXnn/yB/EJKKGvQg909etvrn1TDRzZjMNHS4Lt7Sjnzazn/BhWN9SHpUGPtw7voL3AHj9+i4/qlOTHav6ZUjosaqcwe4AXdJ7csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880104; c=relaxed/simple;
	bh=aIckynKWDUzQUw0mQ6DliNym+pfa5mWNQiS7sM/h+ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToVRk6Ud2PiVvojI/mjVIRu7I92fTTAGtKtQXhah8jgzq87UYPf17tFoyyGcO9DdLQJf/96GhaB+5R0m/tIkqtD9xUBxB/vt+xoYCR53eECSsPJXGUYBLZUbx2dZD9jHV5vOy9pqlXgM0XHjX1OjAxX3meWIl2K+oTKdDIJmdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=UO87sDGL; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="UO87sDGL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D07811D0C5;
	Fri, 28 Aug 2026 03:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787880096;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cmYwe1UVmG+P6y8XZ0jgJInhQsv9JOJ7agmlWn6XZjI=;
	b=UO87sDGL3sBebpYqbD84s1YbNO4v7eideJxNY6dAzQ6IOvkH76bWtZG9ZkbU/+bUSwVzNt
	Jko19H/EExvQs6ppzLw0S0m0jmTbw4d1Cye00HzCjVIUJL36mQGcX7aZuKts88CMXbyn5s
	MpFmTPw2O9lWMM9KPFJHdcMR9GwDleVcEofgmGINwuD4uDVbUnrnnbp5ZYGGU+EF6zc8O2
	1tFLtU1LP/xwfHIuDWc56Pe4jsYycG8BWnh5IMszwMWREgXFFKhWimYSytyHGNF73OUNWo
	rGRuxTcenwER1IUlcXJ4bsjZ1++zCCDNR9D5qvNZkn8Y+J7gOtV0IcZuxtZGrw==
Message-ID: <202b1b0d-5ccd-4fcf-bc7b-bc013dd84774@nabladev.com>
Date: Fri, 28 Aug 2026 03:03:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
 <20260827-skilled-optimal-shellfish-c548e5@quoll>
 <9b197208-dbb4-44dd-b0c0-b4dcaa57c403@nabladev.com>
 <3264c2d2-4c53-44c0-8164-d2d83f75c175@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <3264c2d2-4c53-44c0-8164-d2d83f75c175@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 11:35 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 17:04, Marek Vasut wrote:
>> On 8/27/26 3:07 PM, Krzysztof Kozlowski wrote:
>>>
>>> OTOH2, you have now patchset dependency which is nowwhere explained.
>>> Merging constraints are the most important part of cover letter so must
>>> be clearly stated. IMO, should be stated also here, because many
>>> maintainers do not read cover letters. Or just decouple dependencies
>>> with using 'compatibles' pattern (see Qualcomm msm/mdss display
>>> bindings).
>> I wonder, wouldn't it be better to write a driver which binds to
>> st,stm32mp25-syscfg , handles the SYSCFG clock, and does some
>> of_platform_populate() to bring up the PHYs (DT subnodes) ?
>>
>> I think that would resolve the ABI break problem, since we wouldn't need
>> the simple-mfd compatible anymore. And it would also correctly handle
>> the SYSCFG clock.
>>
>> What do you think ?
> 
> Yes, it is better and more flexible approach. Solves ABI impact.
All right, let's do that.
