Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082053D79E9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359648; cv=none; b=fPueD7cRRIU68+5a++ndUuzNUf+ZydIQVts65dv05m/yHDx1PB0kcoe2Oys81K1AJhmIlcJzePn2DA0/2tgBzGxco4uOuwR0eM6aCR3L7Ivefwo90yZnX5bUSoEsG5eAgD5o/AtuiNXsF3WBsSpI/lx7hXclmszv8x7V2m+paOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359648; c=relaxed/simple;
	bh=PYF9TR4BQUWBZvgGERh7mRajBd0v9a//xzSFKidkRQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sleHHqjPeJbmereEZ/uVp1j7SYiBF6u5KZJ0YvB9IXh/gvbkZC+aft958F71+No+LtWs6DRDyheXAAw7F8lb5nr9dV/9bPhHwf8OoURpu0uyrdvXomm+U0JkJVELmO249jtwq8XhymQ5VJbmj0Uy00JEsLi/arDI2DvoyDzLs/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=QwOxNvby; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="QwOxNvby"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hrzFB3wzWzlfvpN;
	Fri, 25 Sep 2026 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1790359642; x=1792951643; bh=PYF9TR4BQUWBZvgGERh7mRaj
	Bd0v9a//xzSFKidkRQo=; b=QwOxNvbyM4F4Mo48F43+1iA4qYro3f+bajtd8n1W
	lpp/Haey9x7jwOk5bDS96QrPsvRj3nAXs0T9y8bgr7HwtIsprdyDVtyuWKd8bboQ
	RIsmZMZCSx8zsYVaL9tyHNqhVNF1h/zMLo0SkIuzrHQT5z51ZWskQPwhOI+8cSTc
	RTjfpfOPmVcRgymPgpJP4X6P9YmlAiP+UA4qsLPFeXxA03M/BcUdrJFLUGYq24Av
	+36mXybTtXvIfbBFvZCfhMjIKNaempeyZCziVoeodRGNQfgZzqgvvAhS1vUlCVRy
	oY58eZcWQV90GlUMgrF4uO/5CZk/Bd+EroCXM34apTpAbg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ubuHLlAq5Az0; Fri, 25 Sep 2026 18:07:22 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hrzF361DSzlfvpG;
	Fri, 25 Sep 2026 18:07:19 +0000 (UTC)
Message-ID: <8704b5de-8554-417a-a025-ff5bbcfae18e@acm.org>
Date: Fri, 25 Sep 2026 11:07:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lockdep: Fix subclass resource leak in
 lockdep_unregister_key()
To: Nilay Shroff <nilay@linux.ibm.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Geliang Tang <geliang@kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20260727182312.3750145-1-nilay@linux.ibm.com>
 <4ad8d6eb-aa40-44cc-b72d-60cccf590809@acm.org>
 <bb85c786-9dee-48b7-9ace-b387092fe528@linux.ibm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <bb85c786-9dee-48b7-9ace-b387092fe528@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/26 6:57 AM, Nilay Shroff wrote:
> A gentle ping on this one...It's been pending since quite some time now.
> Does this look okay?

This patch looks OK to me and works fine on my test setups so I would
appreciate it if this patch would be queued.

Thanks,

Bart.
