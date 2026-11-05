Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891514;
	b=1Ae49CmCTG437GkY9tRXeMqvBLOW8ErndgLMeTXZiIRxSFVjj7jvCQ4R0hObOwWq4TVk
	 vedX7n2kn7D+Bg+8Cm00GLTxHsd3q1I4z5AoQkqNXiP7qMMfjo/JIruPJneTpH85rNgAv
	 FFi7iB10dkxBbL5pmU//DLZMfxqI1YZ7KCQVB6XvW6FsgPz2LmOerxd4q6/VhjcOW5Xil
	 jP1NKXfE4LLWCJPvcUaHmZwSOdy8asdkmASvFVDEzUa445VXbRj5nax571Ced48sj/+c/
	 yQEqVDBqN15Rd1f0yRMm0kZoJ/QQsyR4f6s0TSMjyfKn36i5TtfouqovQaEZyK4XsDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tw/aNcFF0dA5DXgMzixhUalk85FG8CPwafC6ZxgRlG8=;
	b=ANgjTRktx8qwczJiR63ilydA98YmB1nb1NtPGsOBG8cWl6T/pfAC2JKC0rGyItaBBa9B
	 wFgtTrv20aK0quUBTbK3qYGeH0Fa5PQ4WBEvOO/GKvihCIqo5xz5EptIUwphGM7kN9+uB
	 HWL6UeurG7sVXvJHCAin/L6607FXDZ5rriU6OrGsa+h0AYUgKO6i5TB6LIY5JCd/CH09v
	 1wCMmODqilt0ht5HSd1ZFXQ3Ac08wlPQvyQB/AOCzk90FioF1F3xo7n11JvVNPeZJEGej
	 GiGAlJe+q3YBb3J44Mk4Y+E7r7wHHnr9gmEdgzZE5J0285MHkG2CYSYZovL93qruEbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd9Vkxqg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C969F606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd9Vkxqg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D614D1F0093A;
	Thu,  5 Nov 2026 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891513;
	bh=tw/aNcFF0dA5DXgMzixhUalk85FG8CPwafC6ZxgRlG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qd9VkxqgoS2SgytT0/JM5Az+BJpOIe/NbVuV3M42bSJyVnkO7KtGDSnJydkMmpU7w
	 NoTxgHrkxgLBZaullXIZcKz00lnrlHr5ZoCAqUJCzrwKim12vEBPjFvSLWk29JSodD
	 mqsBGAlz8cr1hZCMoV3VlO9m4YufCNp3GZqa4H/SCIdOKPYXxll5tRV6/REZIdT8AO
	 LDtms19QrsTDYkb+vOcKq4YHfBsmiaMjAnnckx/e3e+1dH5Mcz1f+zttej3zmoR2ZT
	 OxdfoaLuosWZ1yIrTlPpL3ycmx/R5VZKkv+A9FcTYil+J9kTJfariwsn6fAEbO+SqG
	 BUOHSIUgqSVOQ==
Date: Thu, 5 Nov 2026 15:11:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, 
	linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>, 
	Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>
Subject: Re: MAP_FIXED leaving holes on failure is very difficult to recover
 from and can even be a security hole
Message-ID: <auyXeApQlV_CMQDm@gremlin>
References: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>

[ please check kernel mails in MAINTAINERS - my and Liam's at least were
  incorrect, which makes it easy to miss. Fixed those up. ]

Thanks for the report.

In general linux system calls do not guarantee compound operation
atomicity, and any assumption based on that is incorrect. If you see an
error - the operation failed, perhaps partially.

Further, a failed MAP_FIXED leaving gaps was the case for most of the
history of linux. Avoiding that is infeasible.

I advise you to review the NOTES section
https://man7.org/linux/man-pages/man2/mmap.2.html on MAP_FIXED - your
suggested use of it is not recommended.

--
Cheers, Lorenzo
