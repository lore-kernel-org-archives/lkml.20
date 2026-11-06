Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951902;
	b=m92XaiUJatPY8MB1CVDfzCRoog6EVcqlrMi1bqt67BsnOk2jUS2x06sPe9H3HBmblyBa
	 2eJjy9IA13DLBsVFtnJNCqItev6tr2shHGnPnhIBhXOjaPEgs7VxGItDksGfP3qKbUQgT
	 3Co19wWbsustMFoHJVv31VONxMUoqH7F+f/PM3uBaOtjKZSxHhLaT/0A37XT+l4gYaSRo
	 lJoyre9cuSocqBOCIf7hbm5DCPd64o3BU6tf1/WylsQ+PLoGlwPJNs4GIjIUnBWvvzBAK
	 3E6oNREvtdou16qyhXrbrF5z7iE71CQPvCYH2KS5M1bJVkuRYGsKL9UZAzz9nj33Img==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951902;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=G7sxNEVsyIuTPV8a6FVFVg4qeZbioTDu21HyPpnSnRI=;
	b=DIob5JZC+ZzeaetGDT8wC5roHrTp15zmyMJjzzaqq/bEUz0cq6I1rNd1EZPa+bgVZ2Ev
	 mhLIGm43B32cjidY9uy+gzFTI0sor6dXztJYTKTQ1ojeSYPSnMoiKYBDWc8kJSvL54JUP
	 chSy1dDXJ9EvDKEWDkRsyTWLSz06qL2mGVZyg56CgKPu3Bnn6XomAMnzYD6lmt/kREkNl
	 gBhSJ0sZaKSZt3cB5sAYgLokyBHeFJUBa7PCc++7U6A/q783nsDh1Itie1OAsOyuEjcgO
	 hY9gjV8wXs9SYNZA0fBEKAvKWWLxLgJ5sy1uaAtSW7XO3+3mcy36/hRtn9YfMVQN2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4PDt2E2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4PDt2E2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF8F1F0089F;
	Fri,  6 Nov 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793951902;
	bh=G7sxNEVsyIuTPV8a6FVFVg4qeZbioTDu21HyPpnSnRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N4PDt2E2G4E+VIbvP7UlpoJPj86dhujZdzHPEsZxc3xuXtlYhZskE4BayNPfpZ/oR
	 P8gUzu9WnPVRdzSBSb2ePhoiGEmmDBep9EAQ6jSY1hXdRbpyyiRm2pc87Xx68vFi1/
	 5Ny7OoMEhaXP2x8+4d0uWbuGxGEqY+IRHHOyMf+cVuzuMy6TwlFyLXbzMQTvbrYapr
	 uoDtgKkKt1JJARcN0hgr0Vxtxsl4QYrrcrRlQuaxpX1KSflyhJkbvVjWnDfhI5DWt3
	 zIbZxsASJ5jb6CgyhoBm9ppPnATR24JLITsmmbhiWMwPrw3rV/J55g4HWmJ1m8ct1Y
	 Oot/kWOGNLORQ==
Message-ID: <5d13a6f7-6b00-4557-9a1f-acc934a2c168@kernel.org>
Date: Fri, 6 Nov 2026 08:58:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAP_FIXED leaving holes on failure is very difficult to recover
 from and can even be a security hole
Content-Language: en-US
To: Demi Marie Obenour <demiobenour@gmail.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>,
 Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>
References: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
 <auyXeApQlV_CMQDm@gremlin> <310aec2d-3a83-4544-870a-ccd5abd78f48@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <310aec2d-3a83-4544-870a-ccd5abd78f48@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 00:59, Demi Marie Obenour wrote:
> On 11/5/26 10:11, Lorenzo Stoakes (ARM) wrote:
>> [ please check kernel mails in MAINTAINERS - my and Liam's at least were
>>   incorrect, which makes it easy to miss. Fixed those up. ]
> 
> I thought I did that, but obviously I didn't do it properly.
> 
>> Thanks for the report.
>> 
>> In general linux system calls do not guarantee compound operation
>> atomicity, and any assumption based on that is incorrect. If you see an
>> error - the operation failed, perhaps partially.

I'd think we only cared about not exposing the temporary state between unmap
old and map new, right?

>> Further, a failed MAP_FIXED leaving gaps was the case for most of the> history of linux. Avoiding that is infeasible.
>> 
>> I advise you to review the NOTES section
>> https://man7.org/linux/man-pages/man2/mmap.2.html on MAP_FIXED - your
>> suggested use of it is not recommended.
> 
> Does that mean that MAP_FIXED should be deprecated?  It seems that the
> safe use-cases can all use MAP_FIXED_NOREPLACE, and that the use-cases
> that cannot be served by MAP_FIXED_NOREPLACE cannot be served by current
> Linux.
> 
> Specifically, if a MAP_FIXED mmap() fails,  the mapping might either
> still be there (in which case one _must_ call munmap() to cleanup)
> or it might not be there (in which case one _must not_ call munmap()).
> There's no race-free way to tell which is the case.  This means that
> MAP_FIXED is unusable in multithreaded programs, unless one is okay
> with leaking address space.

You said "This was fixed in the past, but the fix was undone in
4f87153e82c4". Any idea when exactly it was "fixed", whether the change was
done consciously (or some refactoring side-effect) and if somebody started
depending on it?
4f87153e82c4 is from 6.12 (2 years old by now) and nobody complained so far...

> Are there cases, such as anonymous mappings, that cannot leave holes?

(I don't have an immediate answer. I'd guess that if e.g. some kernel
allocation can fail, this can happen)

> I believe there are some programs that depend on this to handle
> SIGBUS faults from truncated mapped files.  If even that can leave
> a hole, the only thread-safe alternative would be longjmp() out of
> the SIGBUS handler.

A concrete example would help I guess.

> An alternative behavior would be to unmap the pages, but keep the
> address space reserved, as if the mapping was a PROT_NONE anonymous one.
> That would avoid the "it may or may not have been freed" situation,
> as it would be safe to retry the mapping or call munmap().

It would probably have to be a new flag as that's a different semantic from
what we have now. And the use case for adding it would have to be strong IMHO.
