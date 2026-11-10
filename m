Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304880;
	b=h8ZlYbQ+tJjzVPkajJdbERiK7HRmbAPEqfKY9O47ZeMIr0mnBO82wlHm98RqbZORPmiY
	 apsvhH2LzRalv6Z1llZf+YKXY1cMgbHRjDmhtsRxQJnWB4fUiM5W4Db8AmZJtwiVqAmr3
	 3ri8BE8P9qw8SlCJKNFu0MNT58DGwQvWeqvDAyrFEQumAlQcUkDuevidoOZuBJEYtE33O
	 dSGdr777DOWk/I0oaqZ6pdBb//z2bJ5DMZcOu/s49hj/ERGEUlT+gE9h4zDR6Vf0QC9DY
	 eMZTsYMkHtJIe2s4W5PpkQmlr0izH4DrdaiwxnbsfTGmA9olFu+yb3sHHNmsHtBVoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
	b=fyo0ll/GcUPNruL2ZtLwcja07MB2Q/ePG1QWA32NA9Ci8eK8HfJVv5cR0ex/HFeWDV4X
	 duwzQ46TDOEq3ys88WLwUiBrqpG/lmgg0tfbrODKNE0elyKXGup+UAI54cNMbNUM0hNCQ
	 A6D7h0li8NtyQx8xT8a7g9bUa0NLv6MVoImF2/LodvFGj/s3JdF0jFWCflBtZLgMqgOWI
	 yUeBOPU4+RKPkfTvu3PXFSD7EwUPd/UwWqc+2qQx4HJA7wWIsDK9GVl2E8BZ0eQKKBf8s
	 WrYtkoZ71FVPrFphDOExuH23wATX18kaKCzTqO7pBqWkndS2im7eOh2w3zgGnruftww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hihSnyLV;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222B60A3816
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D222B60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hihSnyLV
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1165549f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304878; x=1794909678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
        b=hihSnyLVB9FjyRlDuAovNuIBjgewXp5dc/cQqEO+qUuZyz51f4E5maO2fTlg9fxjmU
         85A5jq6UUjxbgA5fQlRAE+RvwEwIMtIPPpPJG2jTeCKmaod1hgWq2ZrxpkYS4XPP/Lir
         a7EAw5oUQqDLxyjeJo1wkT+/Rvvj7BX5K1r5AXcLPq5VF0uSW4ArS7/TTmGepGQdebkR
         uNE+5OJLM+e8RzTyICAmiZlySlTFU8Banj+xC2TMXlVF2p/FX4ILu8goir89YN+FD6Up
         XrQF78+wReRB6xrljJv1O4/wTHTIIQePnWNiB1bgTc1wgpVHOCVrzJD21lxK2SoWDnTX
         P5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304878; x=1794909678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9Pl8QyXylw3efq/GJcZ2H+q3w0RBKBXrliBi80vKGw=;
        b=Dwk83tutNp3SANT4g95CevR3WR5FDhsQgfMhqUSwBU3nyP4OSz4ES0c3Jwz9BawRvc
         RQhiRAXCbUVMkgcRuU0g82lOJvd21azaEDr4f2wPKin1NEKNvjcmw+NgmIfdO36UPzMa
         AtrLkDQgicDamRrJIC9x4zf4lioZwk2fbDwMTSZcDd7fcvJuzK/lv9PpBr3CePQ3fQT3
         iTU0iLxHD4pOXPnqLScPcCYWs5g1+G2uYabW5qUgVZ7JoZBfUICEukPM06xuxdNesQvi
         n0jIZixPLoFwjZZcd7AGz1H3IraqZ+Jb1wN2eCJQd86V5OLDUTs3jtcdxL1QzGPvjh52
         eyTA==
X-Forwarded-Encrypted: i=1; AL+hErGmRuFmFnSVj3liP9vCcf8fa1GffLKgKr3mme2FbKKmrzZWqn0ERYsB7IIFQqiMYBoSAAUwb0KfMOgDTdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s+FlHpSMqyNEEN9/cNXj8IBhEWaUrbup6B0ttTrmHIyY30br4
	ZOrR3yiqLu/beTWaZdjfZzO7bfye0F3kW0WCWy1L7Wy3Gla+SEfBZyIS
X-Gm-Gg: AYBFou3m6TXTG+omiN0MYv48UDed2iOl0PY9L8Wq1pR0L+FjUrl+gGZTxRO/vRrt4Oj
	U+q4VW3VRoCPJFdllgnKy8rHp0zCO+Mq5GrG59zpvvbPYZCB2ZpvdQrDUuSW/Ie/fAHMNKVr+/q
	2nS+TEPvQC9Py/LRvF0yGR+5cHwvxVOZsN9iARvLDPVItY/SbcoMC6ELDsXS7f8COfvJsRZjfnZ
	439L2y92rpxZuNwYtkoi6p4kjOYZFpZubpslAEGUom3yLoOMstjMmi1WxfoaOe1ZprehUcPo3N6
	wplnQFS7Xo0OP0Ip7QS+JPQ6DY5EWGyuRUZH80KtVDfrD/3aL/1gIF8KAWluNZm/vPtO5NNGn3M
	n4/Kp8Ymv/R/bKTEtS/46eAlj/ab0qYTJM9gcuPL2AzQ/BxPatUe1rfUucmHe4zLAQiSk/W/L/3
	uuE+IDduH4QKnRBUhqGuZo5yzpc+3LaDIcBwLP8JhHHh3KwV7gU/pvAGN/LT0SHTv7HVppIkKWF
	Frwpcbva0qRKDKLbaT52BTmyaHm8KuXe6mxEHjGauqHKhuQ85oohviZUGrlXrOgoTRjZJtALzWF
	8wN4zlcidXqhnFqlj6F8eye5wnYgnpoYpqEmOOt3CVr6+wzUFZLpX4wvhujHf3fBRZu4j/xsY91
	zTxt4Atb1V+3Z
X-Received: by 2002:a05:6000:2003:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49830b9829emr4172839f8f.43.1794304878022;
        Tue, 10 Nov 2026 02:01:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm2567009f8f.14.2026.11.10.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:01:17 -0800 (PST)
Date: Tue, 10 Nov 2026 10:01:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matteo Croce <technoboy85@gmail.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook
 <kees@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
Message-ID: <20261110100116.5c435722@pumpkin>
In-Reply-To: <20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org>
References: <20261110021622.122490-1-technoboy85@gmail.com>
	<20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org>
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

On Mon, 9 Nov 2026 19:39:25 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 10 Nov 2026 03:16:22 +0100 Matteo Croce <technoboy85@gmail.com> wrote:
> 
> > Add optional benchmarks for memcpy() and memmove(), enabled with
> > CONFIG_MEMCPY_KUNIT_BENCHMARK.  
> 
> hm, sorry, I must ask "why".  Nowadays optimizing memcpy() is a
> super-specialized thing undertaken by the bravest architecture
> specialists who are unlikely to rely upon a generic kunit test for the
> purpose!

You also want a comparison against the 'obvious loops' (which it can
take some effort to generate because the compiler tends to convert them
to memcpy()). Otherwise the numbers are pretty meaningless.

But kernel benchmarks are really the wrong place.
The 'bravest architecture specialists' are going to test the code
in userspace where multiple algorithms can be tested and quickly
tweaked/dismissed.
You also need a bank of systems with different cpu variants and run the
code on all on them - much easier if you only need to copy a program across.

I also (sometimes being one of the 'bravest architecture specialists')
try to work out how many bytes/clock the a copy (or ipcsum) is doing
and what the fixed costs are.
That actually tells you something useful.
(But you always need to check that the compiler generated something like
the expected copy - otherwise it is pretty pointless.)

David
