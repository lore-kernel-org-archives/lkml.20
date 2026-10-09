Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523927B340
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508925; cv=none; b=lzXuDeHxpfCvw2v37A2TtmU4wBRh8+ZYCJCnMr5QUBYLDlCM09MmFar+rb74rPYKkHBJLf1k0r6AQHHijdcCph+okQ7YRclQBJJ1BLLgY8CFkQcBlTo0lhdLysKLi4BymUpjngRoEuMRUMJTOTeUx32OgCSIeHJxmlweMlBjgnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508925; c=relaxed/simple;
	bh=/giPkOM8S749gAdpJ+SHhYNMnuvXU63VwSMR0eGe8mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndp5yeqb7Yht/H7eS0uYgqt1EDapE417qhbpw67qcgtKNkRalaM+cg88IlvPnTxowyoEeBDFrqHMylwBQxuPQgy/TBMdCfgJUQyND0b0+rjIhLtE9Mqi8H5xWNRciNQLMQCtZEZY7lhH9iZLHDq+pTs38s/RtP0HggvMHXU0rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neyRZ/K8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neyRZ/K8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so22546415e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508922; x=1792113722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=neyRZ/K8F/csSLhtW6yuUUN1gWUdJjjW67ve13ma/j7gsK16yYdjZjM9xlroasCGU7
         7OzAD4TQ9mauM28tTxHor2CNpbDaRR1eN2jSDP+cVueboMKlrR0vBjR/PkWo1NCMvugR
         sYAbomRpGTBmNDVOx1hzcZbjHHe6J7DySlzvU6Pyl7yd63IihXNKmz4Hq48HKs4y5AaO
         w9VqOfSIBLIZLfFFdiN4/g4/POnxfAGQ/JnzyShixVprclONKPPcAYjkMnem6DfWC5No
         sq+a105hGng8+2C9c9BaPe4/Z6bDYSYsYJ6QbHJFTJ9M2CmW8if15DKamZcffJAApn8j
         c+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508922; x=1792113722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=O5cP1vaJorNDP3MTz6Ye8JAcLaQk4hwIZvVx7PdzxyUBfgbBuEN8x5Gn7hjityK4/l
         h56T7SWCSZXjBcyM7xHcJJctdYyK4LXPJ5SKT3hEZ8V+kRuRyRFOCaXSh6OxNZ+KZ8Y7
         GsuCOZC7jreJUy3pHb6Nxzvw6Hlu1xaWlAkxW9dXzf2CMEnhF9m5u9QJyF9t1UkCIjwR
         YuMTRRRlkVxQZjCzODW30QSBPUgec8fUW3CO7H/kwvFL+4ReWPHq67S4RzV+gky7Dtin
         Ov076GX6ZX4ehAUxgLhvwnx4RwF43nVqV26sEA8iPpPfLkPKspkjF8frf384F/3mZL2y
         n2Pg==
X-Forwarded-Encrypted: i=1; AKwUvBw5diccZmouCS2s6bCNjM5WTRbPhVcEiWsczReu8bHsJ0b+Y4UcieZlSjX+yiuY3B/mGjPN65hHfQ20B74=@vger.kernel.org
X-Gm-Message-State: AFuF++krfeKeZDAYgLkwTi967jDT8gX4rT6LohKVMogNg7QsZw0l6VfS
	0E4qPCPryqeA9eN0NqlbBHYt5PHDK6F4xxaAhCplsfnO6i8V9pw9redz
X-Gm-Gg: AYBFou25txqKtL/j6q9mhTF64nwJ1AgeJ88HfqFi2SLpKGISXuWrcMu+aiGX8s7i1Vj
	lDAk1xjBTbqVKyiAR87XitmuvGJoXJAXea4Qs4SB6kT5N7l8BBmYuQzWEcVTtOZc2lyc7qNQHYo
	34eBfpX+p6JsO/sbK1pcXwMwkrtEdqukX1pFJVCoZjk7CSFS6kbj4t/CP1KyT9lfktngaKkCFAM
	LF+QJva9dEIlX64jHfrWjRKJ28y/hr/MQ+d1F7nlbMeGwNVcVR72lPaf8AtIsOHesiOhRohmZ2v
	dzWZ4oN5BL0xHq5CDCK+9BMWpLkBS3A69sCzFDz5sQesub/NNIULCdNcAwOqvqabcGd79olQA2l
	GhfrAtoGlS6YI9Zi2lDK6V1QrY/ZvT7VwrEO2Q7hRlSZmPkGmQ6trUn09nNxNHkcr8ZWJphSDUW
	79ttvcixBRnffuhao5GuEpykSewdzXDbfqScGJPMrioRuI/JYEjZSNPezeDjWyTkeZN6ICymPK/
	OSwUqIS+FwX04D8SSigWxTdAeNHs6zMczrt526rxglfYg9UkI4MtnyaKYom3u/n5lWoQB+xD6Ip
	Gc3rxlDRUx79Xf+MCqAsT1QPvW//ptcrSM4Q2cSxeyyZSM4vUGKcBfFbMLMctfhTSr40f/+Bxf/
	a6IA2cLvtTI2i+TPczSEZAsuMRaaHpBvg
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr3757845e9.7.1791508922467;
        Thu, 08 Oct 2026 18:22:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm1207925e9.2.2026.10.08.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:22:01 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:21:59 +0200
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
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Message-ID: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>

On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
> > +=============  ================  ======================================================
> >  Architecture   Level of support  Constraints
> > -=============  ================  ==============================================
> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> > +=============  ================  ======================================================
> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> 
> Can we say "ARMv4T or above" or something similar?
> 

Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
alone would cover too much. It could be

  ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.

That is longer than the list. I can change it if there is a preference
for this form.

Thanks,
Karl
