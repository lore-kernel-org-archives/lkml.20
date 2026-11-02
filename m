Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612839;
	b=UTF3RvdijmuXYBhOYMk2081uk2s+oSJmpIG63EYpvmbYoN//c8Kg2ZkXBy+uOXoSkxKA
	 fqyrrTp/+Nkem3yolPLJslkSbRsbAqxDhKKdIFTn8IMmXsWiYUIWof6Kkr6DkTqBtaVbg
	 0mfBvlXq96vc18OzdSMgpZ3YTNQh8TgNMtLc85k4JMmhQFeTldOg3yxFvI0lY7+7b35bY
	 izJvUey8tiZ+rX40/ORl4v/ZNeRIc6cjS5MAOSJsB8X9isx93O/zAmKU7HW7PZKHP+tnn
	 azHBztjBW01tWJIuwWrhbLlNA8AmRAOZPXIAqR2SuJ7PIUsLtrskEYBwDWUJC8PHfCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
	b=LSTbc78uiFLknWJ4ogKs42+rTendzkaX0G3lm5rEdqMDLMJJUCzywT1Chhkd3B/SaKh0
	 M1juOAjhUq/3PtiSabUAwM/skgku+YWm0i/H29dlpm0YoY9cZ58dI2hsTvPtReKMCHVYV
	 xk2q5Wn8hvC7Y1Ohb+Iv4++KbrBqQ5N9HYftWzjyQmOKscoJSo7j28rxV67dnzkHPbgQX
	 OTlTgtaxjx4mCVb5UDz0gmuFWiz9XwJkAxPJqHqpzOZSw97ThUhKKJrjLjEeiFE0F4A36
	 iI1zQkPg4ms6qPepsIpecwxmC+NFLLiUAwRQG6Voj73+5LLLBM/hjElDS9GhPAO0B/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1KK6AZb;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF0606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AF0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1KK6AZb
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17189575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612838; x=1794217638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
        b=n1KK6AZbI0KfAp1IrB8zr0A9zMi8u8uLjJAcfCWEN4jhhBdGkYSdkyL6kGDs7JvRp9
         9sgT4lZGu2w9Hby415A/sw+EgRCMJtm0/bF2tYiSzTV8vp1zfYsJkMghrzLlxIM7fcHJ
         5QlPoozkqyfHgDlgqkPqtD025W8bCXZmbCq2ZMB4DwQj933mCf9XrGRZJpcXTzfRvHhr
         HzHLFZiMf8TyBjXSC1QvVGOnz3TuH3Pz2KtM9PJ6ZUEHwogqRvjLEsAdOGulrBt5ujfw
         fBlwDTLzBE54AbE9Q6hDrjrXeAGPsklorto816SwNHA0fnTaKqlKgneSKtJIhdqO4UWV
         XYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612838; x=1794217638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
        b=rOsnAo3r5eFKzwJ5WhdsZJZPBbxBXz7IAJyKlGA0/oT1+G0WMPYDxl640lzwcm8X1T
         DUxSHaYPvCgz7RL21uoKI3zUapPNGPOKJJY8y2lJvN0KGiRyRlZealwRaiZi/weg+X5l
         Gz5xj8Rmg2a3vRQaFonsR+MUwYIXAe2eCV5wYbslhNSU2TKDA8h1CTwbwoTKcGCIPTeT
         +/ecZuaiygTi/0nSCteGKIxMuBiCrftFrxk+wSVuoyRWUsmKtE0y8NhzTwXixZBHuBCq
         T73VncE2Urp6rETTRXbntpYjC7qywQ4mb4It9NiAgUg8uL0vye8M+Hu7yKoH4RfboXrs
         VWGw==
X-Forwarded-Encrypted: i=1; AKwUvBzVScM73Knf5CEvceGL0rjxxb9nPRiNJDvldqgemUcsffh+qjgiVzazf+AJ+hoUDvNAxsnCYkT4S6QMu30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOJB2QwwqWOpYvaqUrzX/K3MQ9r0EasWOoCc9L+cexhi2zquzF
	5ka6ospeB/OXbPccx/H6138pRa34uSQV+00KoThYDSrEWCr52/FOrwH/
X-Gm-Gg: AYBFou0CxaB6QIQ5WJCx74sFCIrTUjg8hy8SXv/Vs+HLgrJKLL1QXIjKxT94B3p8vPo
	BBA8pvOHJc9iyvPUrz4XwQZZoRGUVxndRSUpxnRaivZgvVOwP7ys92rI4Ewmf9M3LcWkeMhhoSl
	nMUs8U+AJVLurO0+AjGv+tzirfbEEKo9aUjaSZEIgF+51eshItuYPbGKwQZr5pLWF0yhQaWwzBR
	uwrfFpdFd1sONHhvzQUl0c01GlK+7MFNBOyeOv8Xzfh/jdbKsA/X15mxY7ZOBUdCPruxMH5tluM
	OEA9tKwRHOPTEUrTW1v7eX7bkXZ1Mk5udcgj8WVj67RBpc2TesnBLS3987xwAUzFA2v92A2sYyO
	0OMo7N7r9X5WBXxHXuUaH/I6GW2aRuPbuXcvI4YhQmgRYn78uT7Gi6IOzt0ZiIrch5waw7d+y2X
	F5UAaAenUfIHQheNULw1GoPA1QulVWc3hCpHFLKQ2UyCl9E/a/wKz29IYajZNxkgd/rdsUGF1Rn
	bAoC8yCYAvJmLGlfLMwHRqXtPTn54viUIDIYCxcC27IredpuyeQWyip1oUNRM6qczr5BeohNDOs
	gQlX1/TKi+OoR5f4AINQrAFAdto7V7xDrYzI+pQHeToPJMel955Nl7QHpasoUA+2
X-Received: by 2002:a05:600c:1d07:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ac150b229cmr228838185e9.2.1793612837680;
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm496522815e9.15.2026.11.02.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Date: Mon, 2 Nov 2026 09:47:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <20261102094716.2c8b1cdd@pumpkin>
In-Reply-To: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 1 Nov 2026 12:08:15 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> So the Kconfig 'expr_lookup()' function is criminally slow and takes
> over 10% of the time of "make oldconfig".
> 
> The reason is that it's called just a lot, but it *really* doesn't
> help that the scripting versions of the hashtable functions has not
> understood the subtler issues of the hashing code that it took from
> the kernel side, and in the process got things very very wrong.
> 
> The "hash_32()" function is a perfectly fine hashing function - there
> are better ones around, but it's fast and "good enough". But when you
> use it, you need to understand that it puts the significant bits in
> the *high* bits of the result.
> 
> The kernel uses a model where you give it the number of bits you want,
> and it will pick out those high bits, which makes it all work right.
> 
> But the simplified hashtable code for the host code didn't use those
> high bits of the key. It just did
> 
>     (key) % HASH_SIZE(table)
> 
> to pick the hash table entry, and that's basically pessimal. When
> hashing an address that typically has the low bits clear, the low bits
> of "hash_32()" will *also* be clear. So the hash table ended up being
> mostly empty! So even though the hash table was sized appropriately,
> it wasn't being very efficient. And while making the hash table larger
> mostly hides the problem, it's the wrong solution, because the cache
> footprint gets worse.
> 
> Teach "hash_head()" to use the high bits of the key. Because the users
> don't pass in the number of bits they want, this is pretty hacky:
> 
>     #define HASH_KEY(key,size) \
>         (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))

An alternative would be:
	((key) * (u64)(size)) >> 32
which avoids the division when size isn't a constant power of 2.

David

> 
> but at least this improves on things.
> 
> I also stopped the expr_lookup() key generation from using XOR of two
> pointers, which I suspect just ended up clearing most of the shared
> bits. I doubt that makes a difference, but XOR of thigns that may have
> shared bits really isn't great.
> 
> The cost of 'expr_lookup()' drops by a about factor of four on my
> machine, and it's no longer the hottest function in all of 'make
> oldconfig'.
> 
> No, "make oldconfig" still isn't the fastest thing around, but at
> least this removes on particularly stupid reason for it being slower
> than it needs to be.
> 
> Somebody needs to double-check this. I don't love my HASH_KEY() macro,
> but it should work for power-of-2 sizes. And as far as I can tell, all
> the hash tables are powers of two.
> 
> Comments?
> 
>                 Linus

