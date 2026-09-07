Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6C3612E0;
	Mon,  7 Sep 2026 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758635; cv=none; b=ZieA/8KeIFjKqgJ5SL2bB7uXnd9hySNltDf87aKR2RLL8c8gAodUxBPkfgCIYxr9DWfqcgOWp0H6vSO6Xra0LR4V1K/fM8uXlPXqloO0/ReP0PZ0WdmBflFOYCiFYXTP5A0YXAeIey2O1s+Sus69fqGwzHSDRtOiTP4uvnoSeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758635; c=relaxed/simple;
	bh=jN8tNgG+4eAZHHUwLyYepmeoqakwtx30pP0hoIMJAok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+Ygr/N+NERRkdP2cbw2wG0Z4sGSXRbFlpDC/KriA9Ejqae12tRUIqe70fTawSor7Y1+ni5tM8R6ie5+8rGYOVjEeV4sc32rk2L1L1DyqLR1NtWndS7rhrvmDhJ2TvUqXmaBqtfB9NsH+Q3mWB2BwC9F38SAIzhBXJhojpU4b8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NnzKiFkl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NnzKiFkl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LuC27taB2IF/lU1JfOMklqbdMtf+CtnMNlFmlDqS2xk=; b=NnzKiFklyBnI4Q669S0R3Gq7wk
	3ur8B+BIYTS1fwd78a8vOFUlPSLfd0e8NlifcyfKsKfnbJHtnwd9Oc/D7TcnW1C3PEaluo4jccZC6
	/AJ2w+4KBifSGh/4L5paMvQ4ucdrkeri077AxYFw38IaV+//BRzYud5qUrfHupHoWtswLTYVaALAl
	DTBmrDqMGBzQHtte+6EI0QzqazBS/Y9+0m/IecdwVBN4Dq+V326wU/MOlIKvoC4fznBvgtf38V8EG
	8QPaCIbViER/z3twAFp8B306fw4k9gdE1CKJ/ZDmpeFHdksUraGA0l0sTFOxQBdh7Tq9MsYmPRgUs
	IqygTlag==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Rpb-00000005va7-32Y0;
	Mon, 07 Sep 2026 05:23:47 +0000
Message-ID: <273db26b-2485-4614-9045-97ac7ce5a009@infradead.org>
Date: Sun, 6 Sep 2026 22:23:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
 <20260907043933.33452-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260907043933.33452-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/6/26 9:39 PM, Hemanth Selam wrote:
> Thanks for the pointer, and you are right to raise it - I checked and this
> patch does fall foul of that rule.
> 
> The word in Documentation/arch/arm64/booting.rst is "zero-initalised", and
> I changed it to "zero-initialized", which quietly moves the file from
> British to American spelling.  The minimal fix is "zero-initialised".
> 
> I followed checkpatch here, and checkpatch is following the dictionary:
> 
>   scripts/spelling.txt:875:initalised||initialized
>   scripts/spelling.txt:874:initalise||initialize
> 
> Those are the only two entries in the file that map a British form to an
> American one, and by the rule you quoted they should read
> 
>   initalise||initialise
>   initalised||initialised
> 
> so that the misspelling is corrected without changing the variety of
> English in the file.  arch/arm64 currently has 58 uses of "initialised"
> against 132 of "initialized", so both spellings are clearly in use there.
> 
> I will send a v2 that uses "zero-initialised".  Would a separate patch
> fixing those two spelling.txt entries be welcome, or is that better left
> alone?

IMO the 2 entries in spelling.txt should be corrected.

thanks.
-- 
~Randy

