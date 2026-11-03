Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731485;
	b=XwWEKnEE+t372ck0jF+MZwIXCGPVsYlvAQ1Y7O8Y3/i2EMzqCxGLl4NFRD5qsYEIb1Mh
	 bmu3J+8Rrshd6UA8zAkNrNQ803FfESllLGh1fMlj7SANPOug+66kjYyfv7jvf0ke/MWMV
	 /0iSFi5dq9/P/RtTnbdixqv2/3QHLEY4qquBMd7Z34jYUMuw/ukk0Hi+h5K+sBpkhEqaj
	 XndfmHb+oNPIC281F/3ND8D9b2GzyMygWRZgZHc1m9ePusR55Z0ux5PHTXz9VO7hdntzm
	 JfafOON2IiVORchzolYyua4BIlqBLR5uHjwEz4G6Rs78Cv/lEwQIOvG1OYch7G+bfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731485;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1A8p6Yw8QB5cZ4R6ZLUTqYya8xg0OkNzmH7mK5ip2II=;
	b=qcdWdFpl2RsYUJEg7994WeLIYkgEBtCQJVvNfoN52YMMqFLElOJ9e53ATOuQu5hrLlmc
	 0jDQIBWABL+mlPKKQbchdUMWuIorjGUk6eMxbokZBJgAYKtQvBdIMxFmV3ysl7ClqGlBB
	 QHia/kr/kkLin6S+xJicK7j0k8+AplB99tBX97lt90zND+e7bFYbjjcKzloAejGPgON/m
	 oHSYkFK5L4xtuDfqQj/KCuEQod8DI7/R5ztspmzAnaFrq6Hzo6JMYuNXjfE4qoDJpYuN1
	 KmLCdZ+xBvGdxc+kZt3y3nE7qVcctKOJTEA27BsdVYytt85hJ1IUpojdmhf4zK4yb+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="RE4/eDH9";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA1606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RE4/eDH9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BD561595;
	Tue,  3 Nov 2026 10:44:40 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0B333F628;
	Tue,  3 Nov 2026 10:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793731483; bh=uAQW7HvA0v7nIV7mc4N2TG5pPdvVVKtuJnC0ma5RjYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RE4/eDH9BflLfmG4pGA+XUXDeV9ihXn60ajrcwLY+TgWH82Pbak1ug67AKrnpV94m
	 zxL9dPNkSuyq/d9D5CRQiQGg4iOo4rD/gyaiTZJp7ObekDaiOHS74Q7bYHkdg1iRUz
	 WuCWnBi95UKRxA++0Wq2csBpNcihRbP5C2Xu13aY=
Message-ID: <fa595d08-9b92-4266-acb7-489e1b2277c4@arm.com>
Date: Tue, 3 Nov 2026 18:44:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
 <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
 <9400d7a6-3d00-474d-bf1d-6db1a08c16fb@arm.com>
 <200bd69e-61fd-4680-8e14-338e2d45c266@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <200bd69e-61fd-4680-8e14-338e2d45c266@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 03/11/2026 18:13, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/3/26 9:48 AM, Ben Horgan wrote:
>> On 03/11/2026 15:01, Ben Horgan wrote:
>>> Hi Reinette,
>>>
>>> The change seems good but I think the commit message can be cut down at bit.
> 
> Thank you very much for taking a look and providing the needed changes. Since I
> am unable to test and especially since this involved a locking change I ended up
> with changelogs containing more than the usual reasoning about correctness.> >> It looks like this patch also has the plus of addressing this sashiko
>> report:
>> https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729468
> oh. Would you like this commit to capture this? To do so I can add the following tags:

I don't think it counts as a real bug as its only going against the
cleanup.h guidance and making the code fragile rather than actually
breaking anything. Good to fix though.

Thanks,

Ben

> 
> 	Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
> 	Reported-by: Sashiko <sashiko-bot@kernel.org>
> 	Closes: https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729
> > Reinette
> 
> 
> 

