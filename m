Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3646A5EC;
	Tue, 13 Oct 2026 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871030; cv=none; b=eSsqkSu+VNzFtPGbUvnxN/bebqSlMks91xQy6o0Mrl8NIO36RIpy6JCKWcMWUfMyEmBL77ieLhJsFg5JXxEfLqSZ6CuPvmuW7lFTLC3Kp0/625gr/twgwD3wU6ldwqDqgYautaoGW0BjsWuO4nUj5N6kciMIYnztwNxxExTyIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871030; c=relaxed/simple;
	bh=18/qfX4HcXJRPcrQ8STVuCZiIGfxRwH/y3T8TPswJRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvUG7KL4YfC3x2qPZ3Zp8vlb3dM9t8OVFBxljXFdjxIP/JcBo1Z6AVAiK587ftqaEHh5fIxKIJt6TwBFoxiZ6A68fzeFlCLBL2926WjWNKxvBOWDArhul3lYkQw+Cw7g9gVaGWpCzEc8CkAptAiBTjdMnaTEwgO8Muj05W4RnDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DKJimCxr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DKJimCxr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mj1hufmP8BiibhXLbvfAtKRleJuT2qaHQl5ahc3a4Hs=; b=DKJimCxrh2hSz/OjLyxh4NPu7K
	eubpknqXEcLrlsHHM1b9MgvHzI+F4M4vGFFZoIjxpueeC7ivt0FRAvO1aEon7BWtae4+W7h5BYuBl
	h7BDQFn1VEltkZUF+9S6nGAJsBuBV6Hl/cPFkHt1Qk4bcCP1SXg65uE/ACIc4nPYHXV2WDp9JBeG6
	UNQz9Z1K8xWSakFu6iqDwMGJevSczwbw8P6R3bzC8oKv4D4ErcNw4OdloC1+LtH/Wuxt4InvnLVHG
	8QS3O8s4F3iRlAnqQU8OjUOYctFhCBs01byc/Pmc0zgtkuFAfxwiI7vbZCQ8xGvBeS8bnFE/i+lOR
	mFtQlI/Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVVU-0000000C3vZ-1fl2;
	Tue, 13 Oct 2026 05:57:00 +0000
Message-ID: <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
Date: Mon, 12 Oct 2026 22:56:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: remove Assisted-by references
To: Kees Cook <kees@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202610122124.08E058768D@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/12/26 9:24 PM, Kees Cook wrote:
> On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
>> The Maintainers Summit reached consensus to deprecate the Assisted-by
>> tag. Remove the documentation requiring it.
>>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> Yup, it has become as redundant as specifying what editor I use. ;)
> 
> Reviewed-by: Kees Cook <kees@kernel.org>

and for those of us who don't know details about the discussion,
how is it redundant?
Do you assume that everyone now uses it (LLM), just as everyone
uses an editor?

I still agree with what GregKH said on July 2, 2026, in
https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/


-- 
~Randy

