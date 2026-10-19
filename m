Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018F4AF692
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402858; cv=none; b=d3jb4QpnT/czGbqfPzp3RE9Vo/nnIkZXpNU+sA8KbrndPpeqdKSAlieXT/2LU9ItdIWa8xvJbGDFuhXQkzj7yCLBOAn6PheWmp+qKJcSTrAiZTLRLkRlgV1fwuEDdEmDGtvElgIZSSZCV66T7AHo661IIE5oAN2c35TdJWL+nh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402858; c=relaxed/simple;
	bh=c/hiHtUZc12+bQilX3ZGK+txTtWqePafViyNzLVXymg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GE+Fz33JhTExcvU7x9wdQZa7sp386yQHYCaaN+vb9+LzmRkL0wNNQElYnJNtVQ7h6qgfY05giVlr19UrN/CohveYGULmjFQb7anzYMX2yOgpuBUChpOAmmefh6iL8HeRfGUG0EHEgL3u2Cm5jjbqA5bK6tFtg2B7ISlyjdlSowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGgPxyKl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGgPxyKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAC21F000C6;
	Mon, 19 Oct 2026 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792402857;
	bh=ojxx9nhEWkvJwn8p5+rm0APJk+Pi1n3Ff8wZwW56tgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZGgPxyKlRG+mE/fXMg+GJXOOj3xNX3FhdnCOtWScVuFDNJHzvJ39Im+zQUmNTrn8k
	 lL0xKXJSnHvIEid2ZabhUrfq4d9YTjPvrxpfXjyFYU/U3pCOd3mcpID64FfAvHXFEj
	 pFotsfkMJ+c5Ze9/xuIT+6UI8D/Cr8oGRUEOuUF/Xl34/aLrqPfYcfTBNh5k5qyZ4z
	 R4/xWj7OvyQkjBY6dsixCZLxQSw4ESPbCW7F9z3SxvIdaOW2Ae0jR59XjNv6VX52NI
	 VGT2ZYxlS5wJrOyL3xwYqqOJlMs6EOquIzWTmHE6rdXbTnYwiWKpmkICmD9yvmxfpx
	 WbKc2YEbQO6Sw==
Message-ID: <2546936e-1ae6-494f-a3e8-1949436bfd3a@kernel.org>
Date: Mon, 19 Oct 2026 11:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempool: optimize mempool resizing
To: Vitaly Wool <vitaly.wool@konsulko.se>, Christoph Hellwig <hch@lst.de>
Cc: Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@gentwo.org>,
 Hao Li <hao.li@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, vitaly.vul@partner.samsung.com
References: <20261014130301.GC15407@lst.de>
 <20261017090802.1423681-1-vitaly.wool@konsulko.se>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20261017090802.1423681-1-vitaly.wool@konsulko.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/10/17 11:08, Vitaly Wool wrote:
>>> Imagine you have a mempool with 10000 elements, and you have to reduce it to 3000. Then
>>> if you at some point want to go back to 10000, you'll end up reallocating the elements
> 
>> Who is "we" and where is the code?  This is a highly unusual, not to
>> say most like broken usage of mempools.  If you need changes to support
>> such a use case you should include a link to the intree user (or bundle
>> it with the submission of the new code).
> 
> This situation may well happen in the block layer (zoned). The numbers will
> be different but they were arbitrarily chosen in the example above anyway.

The block layer zoned code does not use gigantic buffers from a mempool. The
mempool is only used for small zone write plugs descriptors and if the user goes
over the device advertized max open limit, using lots of plugs, the device perf
will start going to /dev/null. So optimizing for growing the mempool for this
case is really not a priority/needed, at all.


-- 
Damien Le Moal
Western Digital Research
