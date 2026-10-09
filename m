Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9EE231829
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508629; cv=none; b=LdjOlKsxfpU/N7tIB2nDI7V5IRDJFN5ScPy8POhbnqIsEa53Qif7mmx5BwQdXrCDOkDZ6zWhE0lIKY6YLlgkY3kmf+LxTQuvHVNEK2JHe6I09npRwwpZ7yFQ8FlwUyMX71m0Z4x0sKVJHvhFeIMpatgLadGdyBTgJdsrLyiX99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508629; c=relaxed/simple;
	bh=MMzdOh6zuM2zcV+/w8InyvA3igLjaY5u/Frz2zXgL3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRl+9C7z0ZV0XMlzJfAEw0StZLwfEctFPvzCZEbh/Oc5uORw0IetcUip8HmJyDQxJH4co9aYSN/fGlzoLFyZNoTkRAasnxPdLL2q5HPTYa5NG3iHG9QuSYY0kbMvV/RSNXgOn08n4iqrWY7p2P9BUudtdSM1a+Ox79aUySQrLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLrrcMOT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLrrcMOT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so25801975e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508626; x=1792113426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=JLrrcMOTngnLsBw23pBiZS2VFeSuc8n1rtA7C6pcban8tKqmqTJsKT2thlSV6RM4r3
         STedjtAXLbwfkOvWSfGBa74tiJYjTgC6C2W15XAK46Pd84yEpMlHfMEQ3qtYgyGEnma1
         tDJLPCNcIZPkZ9vFTca8Sw+rYYe2BKqa1gi0nzf0P+qhuPk+ShNTjT7N0v4XrBj/HeeV
         wJ8n+IV5ZpjfoBBJPUJqsTErZZztP6UWvOYT16ktdT6AFpKbk7xeR080K0El6taASICQ
         G9v7bW38UjiFdCzorztyH36Vx9LQwgGHhxo/BvtjSNv9zKMiGjdQiOlDAedKEwS/9uZA
         IrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508626; x=1792113426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zJZcyCxNs35dQHZgRkxwA5yHjhyI7WkTssIiSVzh8w=;
        b=eVyMjGdR61oDEklh4CI6ItlcgZ4rAKaAMReo1noX2g50DmqOt0R4LTvsv8pZP/fF1w
         VYzAcpGL3FhPzFr8+5ngF4jXCHMCvit4R93BxZS5ABTrMa+9T1Jc9/lKl27f+D3DDaCF
         uxyCzqgiVZKNMITwEO0NZhph642kp6fPU1XZkGHveXWRIHGmZQURPMt5eGL3rdov0+XH
         TG/VoTPJu1+c0200rym5tm0VwXQ6Jsio6vs8n/v80Gc6vfS7k2ofUJIA99PeRA0eOqaK
         /dW3u/UUlr26TJVL6nsjLBkkelfXfSmhtOCmrulOfZLivj8E2i6AeLeLJhoIJ7KMhRED
         cTZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9uJ+DhbLNdLLjJoeY/bd+9rDgiOc+R78/f6bKUG8TAhK9aagRQztn4JTr2pM9oVr6OOOxPA5NWe0W11Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nem3wYU9ruBrydEz/ZKuQrkXMWxkRN0Du1EV7FCqweeMKqK1WY
	pHZaXCgoSNAIhgAbqHkzEZVTnFHBR2kV4ZOUWhq2RY/TjIO8MveufrQi
X-Gm-Gg: AYBFou0soKk6qhjmgalX80c46ow8hf1IrONl9dXpVq3QUpuw2vve64UKuIGXyPvuleq
	dYAJqcveCsopeQAzI5NktU1dDt+QFiCFEJpsWByHwxKmin2DMorXiTzdLKKUGlr+IJjOSCnFBHv
	+JDX3uyP5qZhJq/iuZ9kZghD7ZqOoWArbRisQClhhf4ZOiFUXTJZlttAl7UlYxBkZYGHt/Y6HaL
	RmvLy1gNrhK6jQTarkvO21bMpa/Gfo5szwjqTCNNBx8l5NdkQcpVYqRCZ8TwwzHXDuebSu9LNyG
	2ekAGNmtVXOAfcg4aKcXwtyCNL8RG87HVAW3OSwFn9cGo54wderNaliFnapvZSS+sNOfzb74Hwh
	T3gOgXBz5k5+apzHbR4DLzsDQUu5yORv4HC4Y7PwEBdfdZZvZcTT7Zkg3XSLhoOB+sS5Ao4lkFj
	FvIPQeGbf46UEBeXi04DG3RLMZKh9j+OeOin05vHOfOuQ2Ms0tS9pZg0ohnwwZZhp7/gJVIgVnt
	/IOe/wxfP/OK6fnaXLRo+v95bAKSaYOfgVC7LdnN4G2umrjCCq1xsV8j48VM+yjMh+XUiHfQPmT
	juzKEtZBMHccnKk9Yjtv8KVfM4I90NOWdJ6UR/vyybkxCSIESTfyvq6ubAXsvDOl1fBQDhVkv83
	CUxSBzj99dzTSlMkDcnGqjg==
X-Received: by 2002:a05:600c:19ca:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a18e4464famr4244415e9.3.1791508625763;
        Thu, 08 Oct 2026 18:17:05 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c601sm19861285e9.3.2026.10.08.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:17:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:17:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and
 __cmpxchg()
Message-ID: <asg-nSs2cg7O-znd@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-2-kmehltretter@gmail.com>
 <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>

On Thu, Oct 08, 2026 at 11:01:32AM +0100, Gary Guo wrote:
> > v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
> > xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
> > ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
> > in v7.1 also triggers __bad_cmpxchg.
> 
> I think the issue is that when you get multiple function calls in a function,
> GCC starts to think that not inlining can result in code deduplication where
> that is not actually true.
> 
> But I am surprised that it hasn't been seen in the past, perhaps there're only
> calls with single size from any translation unit previously?

The sizes were already mixed. It is the number of callers.

Commit 5dbc0a692459 ("rust: helpers: Add i8/i16 atomic xchg helpers")
has 1-, 2- and 4-byte xchg() in helpers.c and no __bad_xchg. The next
commit, ab717dd98bee, adds two more callers of the same sizes, the
xchg_acquire helpers, and has it.

> The fix LGTM, but Sashiko's report is worth looking into.

It's a valid concern. __generic_cmpxchg_local() has the same weakness
and patch 1 does not touch it. No file in the tree fails today. A test
file triggers it on ARMv5 with gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE:

- 12 valid cmpxchg_local() callers link
- 24 leave an undefined reference to wrong_size_cmpxchg
- __always_inline on __generic_cmpxchg_local() removes it

helpers.c stays below that. The ARMv4T and ARMv5TE kernels of this
series link with gcc 8.1.0. I will send this asm-generic change as a
separate patch.

Thanks,
Karl
