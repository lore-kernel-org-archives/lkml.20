Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263895;
	b=LHNyydPgZLw9dmEndYb9AfwTvJLFNmoKJTiyD8DPQ9ndSOs/DmjBZ9Z4sr9LkUv0Azxj
	 xrnpn4fXhVsYsxiAfdKmbm7gCHiE0NAyNsAJPF2subaga4new64OTsxvRQhJ0v/yqW5Zz
	 Xg8hhisut29Ej3C0n6VzybfLraLDWECh4+UV/knTJUmLjqq0innITnphRo5/4wkKLFwD8
	 hHoMkS/ffNma7f5ohRpGRy5nHKf4d6DbpV5pBcUHZW5GpkMcAVsmAH1pwgR5iBGRKBTLq
	 hnKf5OqDjXWlPVjXvOUz1nzw+1YjlBt/KXC8P19rd1gPLpAKBCr0L0jl/GpbGiTcP/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
	b=jx2Iqg67cXhufM52Iz3osJl3rL2QhFAi9DIIq4NPsHQga8ZnonKFluLd0OBtx2J6ICQo
	 QUKRv6BAEERK7I/DlID6Yj/iffucvHp413hLE/XAwTP/YI5DIOX0rnDJ/s/35dnArWwFC
	 kNYfvapSjru4QoFjyyJ90Cg4W7mWpQfuIFWVvUPk+kn6nH+Jkx9xyfBG6EiHZXrN0nNUy
	 5UNWbSlL8Inhm5S2xnxC2+TbWXGDUSTh5Bv6mgtOhAHfRhY+oS97sNSMPVzhm1PkQgJaB
	 JHT5paIyhg6OudDqhxmcdBEQDD/X2qBvVU/aev8f4cSbmt4+ArIZIsOR63yxseqkqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hz418sqQ;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F7606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421F7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hz418sqQ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed3f563739so7835ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263895; x=1794868695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
        b=Hz418sqQ5WLxOrswSzcH6/jjg8l4emN3gYOn1t5FpTvrYHQAQXwv32GRZWcofR6eT5
         nSJjtLSpe6bd8Z02Vh30sinBXoxoMuKNwGZWCOvpqYcKcx/9JLLxL+MhMYRxTy6jvAW6
         b5geHLwXjwwGM9qBHv+hiBBwpB5Ww52NuVTmbQeFZI1HCmLN9K93b+x6n7dn05ly97iG
         wj9fgRNQkuqMe0XiImGwjjub+dpa7g6whhOikrLUNUF2N2sSGxbtV5PIjXNsbT+pTbDA
         wmdM0hER3yQSIO3x3upeVSpuL7380iNwQEoAK54RIW8ngEW7aJrhKvXfL/JyF5uLidZ4
         w+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263895; x=1794868695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
        b=ksMPmu900tIkhQlD37wiV3HnYv9JjbuTm0geY1fgzH74F9gP1wzPar1XAtRbhCsUoM
         hq2mPi9YHBVo5WGreyiUG+gPAy7Dsudpr5pTcKv5sX4on21g6ITEVA2zZ2fWZ9gYeia2
         /C0kY+XT7QwgrukZbWnMwcBk6LXCApPzBzvQO0Rhjq/bHQfOLzYc0lUjWV9VxdNTYFhT
         rbvHJXz2mxm3RuJoeOmKp4pYnPKs/NmyEzlWyvusRoj2gkChpgXH5TXjERkCZJX4k5xN
         JP+zXHjX9A3JdtZgYRYhdfa4GsDP172zOc4qGWTL9+JssAsK54wwB0vFEJSGxVlmuBQw
         caJw==
X-Forwarded-Encrypted: i=1; AL+hErF3aXcF3rVhIANYkvw767zqSmClNB9ghb2BmqyD7hrFGNGivkcJWZmbAFbE4NR048KFS1bA6L4ZAuo+3vM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D6xdZ1uPN/TUNJ8PHWbh84BKld5VC+K0reUVLEW0Hikjdy8sA
	TyVqGbfa+LPqHYuD4mXgZCPlzNublyivVNwBQW83jRYR43DIi9U15HVShlm9qMcT+g==
X-Gm-Gg: AYBFou1gaAqn7DRKPVTpNs91YeHFK4usXd/mxQdq+3zo3JtIlVGBnQWT1ADXjPDSrFS
	eiiE33B5MabApn+o009wKYWCEey28yYChianOvx9+J3I7OfplvaxGORzGr7LtpXrooXj3eodu12
	nSIhxisSbtycBpAh71IwNb/2YArzlF6hgsaHPps/rBrU6040tbJl5P/BfBV4QQdDFCZHVyWPYgd
	D1bpm6Zi4WEN9cXl7C46fQm1gSrScMTQdo8OjMxDIoO1p72HR8ztVvuZDV5PSFdqKfPjSy0FtyR
	clQECeWdUWtPSXLtNvazEl+VZ0V+HEhRZQKJZx6k7lys6GyIU3AzOtkR5M/lyVfBClWK/OfjnIa
	732uSS9OTn6xJ1fTvGKgwyi8oSszdu4nZazbhWHYRhIvytNj274j+0t2gRaAl1eJKMRCGOxI/BY
	kOyR0cuDwlC1LhyZUHt/MUmhxjwo9w76vYkGs/URvGTf4wQ2ZR4Ou8p2A/hg58/KzFoZ44GgpvV
	lTb4RQoqcc9iih4ze0Pe16Ca3m6OAmn5XdOLDhbH5WN++XiRGVEu5TQxh+QoTe/LhknJozTgXvM
	5dYVSULueEdAcR2Khkm/mvbd1dTN3iYu2jIsNJT5XeOVt5jbrkWr4QWDijQga6Edo3J6261WMLx
	0Nj5GcwVf9JtIXOmfpslgk/s3/xd64/Sr8A9ZB8Ti1wWb0/45zPS61KgxJw/0MY1TdO7cIAN4Wh
	d+8/U4Ji9gDwwbtEkK97zdrxUwZiFBiFnqvaMWS9oEzD5UAyFVGhcvEA8/nNGPai3i
X-Received: by 2002:a17:903:22ce:b0:2e6:344:7bb4 with SMTP id d9443c01a7336-2edba3c0276mr716915ad.11.1794263894152;
        Mon, 09 Nov 2026 14:38:14 -0800 (PST)
Received: from google.com (25.229.125.34.bc.googleusercontent.com. [34.125.229.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm1108885a91.14.2026.11.09.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:38:13 -0800 (PST)
Date: Mon, 9 Nov 2026 22:38:09 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: push BR_TRANSACTION_COMPLETE before
 BR_FAILED_REPLY
Message-ID: <avJLUdbdxhhUDL7K@google.com>
References: <20261028-binder-reply-fail-v1-1-8b71d4daaf1d@google.com>
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
In-Reply-To: <20261028-binder-reply-fail-v1-1-8b71d4daaf1d@google.com>

On Wed, Oct 28, 2026 at 09:46:45AM +0000, Alice Ryhl wrote:
> When building a reply fails in Thread::reply_inner(), BR_FAILED_REPLY is
> delivered to the caller before BR_TRANSACTION_COMPLETE is pushed to the
> replying thread's work list.
> 
> In a nested transaction, the caller can wake up upon receiving
> BR_FAILED_REPLY and send an outer reply to the replying thread before
> BR_TRANSACTION_COMPLETE is queued. This causes the outer BR_REPLY to
> arrive ahead of BR_TRANSACTION_COMPLETE, which is not legal. This leads
> to userspace tripping on an assertion.
> 
> Thus, push BR_TRANSACTION_COMPLETE in Thread::reply_inner() before
> delivering BR_FAILED_REPLY to the caller.
> 
> As a nice side effect, this lets us remove the now-unused
> BR_TRANSACTION_COMPLETE error path in Thread::transaction().
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Sorry for the late reply, LGTM!

Acked-by: Carlos Llamas <cmllamas@google.com>
