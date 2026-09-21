Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227274A5C3E;
	Mon, 21 Sep 2026 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000213; cv=none; b=tLa1c0937nnhP+qd+RDu0xBcRV5z4QlrXeBVzpSY18yFI0QQmTEH5EZaZLfsEkSi5T3Pj2+6wqvdYyu5UO4uN69FPfQ3B6mcZGMM78JpJW1x7GiDsvdQ7Gnb1I8ZC+SeJyCMLBRRdJSo51FUilkujTNRw7CI2CS6PxGnhOYG5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000213; c=relaxed/simple;
	bh=CVS9FBd8ilGp5plqdwxKmZ+N3riALwMAdtdlZPWgDG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEVpn5jdBLmyi66Vsj6/jiIQW3kUEcf53ziZWm+djNMVmwOAuX/nmwWoPaSx4jiihLxhHmZDlmcnYi0H8P/+jL64W9lrtlI+882Xp1uhXUQntj6YOMbB0q4gyIFMSX68OmTjeFIaQyhFUlEO92nFWqMPSQGyoq1zPuzIs6rTVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvWjaEml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvWjaEml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575041F000FF;
	Mon, 21 Sep 2026 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000211;
	bh=3wjL7y3SEZdP8mm6Cy77lgUlhxbXv8/qZYBgJrT5MiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UvWjaEmlvlzBBoroKmgcRfxEtPNH5lnePHxM/uRu6ENsgFuF+n9Uc+oUvoT1i0SsC
	 6POYKpUxDZyWzAbFtAg+6RElNpqm+HiaoeRrLwA/n5VkISkY2X5s9zaWcOm7EJfe/K
	 yed7i3wBONZZgojA9Fj7nGXu6FSC10X3elcHmb0p3J/FembpLhrnE1KvNzvkgIhnYW
	 jv0zbnuSWPgjcW5NjiWHna21aOZ8sS+wSxwXzDE0Fd1skArlJoK2pbnqSwKukzoHgy
	 87gBT7CEcVuw82N5EGLmnaqV1TWV9BvfxEJH3w+q7hPDe5R3fHDJF6MbevhVQ34ZEi
	 zCOkc6FsGrTbw==
Message-ID: <89e1e02a-1a41-4c40-aafc-172c44ddeafd@kernel.org>
Date: Mon, 21 Sep 2026 16:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
 <20260918-strategic-hairy-kelpie-46e807@quoll>
 <20260920075924.GC7878@cabron.k.g>
 <042c39d5-0642-4bcd-b965-61fce77b52ae@kernel.org>
 <20260921090659.GD14552@cabron.k.g>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260921090659.GD14552@cabron.k.g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2026 11:06, Petko Manolov wrote:
> On 26-09-20 11:52:36, Krzysztof Kozlowski wrote:
>> On 20/09/2026 09:59, Petko Manolov wrote:
>>> On 26-09-18 13:57:22, Krzysztof Kozlowski wrote:
>>>> On Thu, Sep 17, 2026 at 07:31:56PM +0300, Petko Manolov wrote:
>>>>> Draeger M48 CPU Module that is built around Altera SoCFPGA.
>>>>
>>>> How can you run a CPU module alone? To my knowledge there is only one such
>>>> case, only one exception, and it was explained by the authors. If this is
>>>> second, I already asked you to properly explain the hardware in commit msg.
>>>
>>> I've described the board/carrier/module/whatever in the cover letter.  When i
>>
>> Cover letters do not matter. We don't read them and they usually do not end up
>> in the git history. Your commit must stand on its own, not rely on cover
>> letter.
> 
> Fair enough.  Shall i drop cover letters entirely?

No, they have their own purpose, but not documenting what is the purpose
of commit.

> 
>>> put the same text in the commit message Sashiko rejected the patch on the
>>> grounds that there should be just one CPU architecture there.  But there are
>>> two.
>>
>> Sashiko cannot reject a patch. Does not have such abilities nor power.
> 
> It does influence your decisions, though.
> 
>> Regardless its comment was right - your description was between incomplete to
>> confusing.
> 
> You do realize your comments mostly criticize, but do very little to actually
> help resolve the issues, don't you?

I gave you already precise expectation 10 days ago, which you ignored
and repeated "what shall I do". I expect explanation of the hardware in
the commit msg, especially the non-obvious things.

"Your commit msgs for bindings and DTS should explain the hardware..."

Best regards,
Krzysztof
