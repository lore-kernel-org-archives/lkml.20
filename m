Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515028;
	b=gXmZO24+uN0n+IHUAbmsIoqd5Y43k64wwrB/SbGxrxdgyJpvEKIkrZmlHTehRyBlxeeQ
	 JHxkjUCkWycaMr1wy3Cy/Q2hE0ZWNyN8+2IiS+l4tALhHk/xjvB3oybZlSnYo3q9zrG0V
	 f87Mgu+58f0X6i77tOjPweVDBZuWiVa0rkyZ5NFlvPsT9kMfZtktfujWWsxgG915W7XUB
	 MVZWlTaSRUM14eGqX1XJgzyy/GLgh9Z8TQrTqybKqpyL6YAdIax1fkSfq5Uz3rYkIXrdC
	 QuL93wgx/ZyTeOrgE18Jn0ixluSk+04y/AkBTLbPG4Pdq5WMlcXiyeynKI5bTpCruIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515028;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CCI8TZHqQgliAJL6UDTU3vUys44T4hQaCZ8A85wiqHo=;
	b=YHz79WY/3HCR7JRKMNy031TmxbQFd0bqrfBbFbijE7Q86Fmcj4HC1+a9qy80P8Nglk6N
	 ycaK1+kfQgz/xivPqKGVXOOAf63ca0Eoudqf+AGv9Q6cH5gCMigMU+tXtBA2RjbjY2WQA
	 Ma2KN0EZY3PO6x9/gQKZqNLnJaZPfkbXBiFL+HdFfScMZqMWU2sR+1NgMXjJpY9MaTfKt
	 nYRjESUBXuopd5TVy+qNGTjs6/pkBCwTtk4UwaSSPuvL92T0rgAaPbElrxPjkUTwfUslV
	 DypnVS9ykM8cmx7E43CBMnpRa2b0Jq2iXqGyANURgL5rtH+Ip0KzuoPYrO+TBiyyrIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=sIA4lh8W;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=3D0czybw;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E9606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578E9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=sIA4lh8W;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=3D0czybw
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792515023; bh=CCI8TZHqQgliAJL6UDTU3vU
	ys44T4hQaCZ8A85wiqHo=; b=sIA4lh8WYAo/upsGuPhL0k1zoQSwG4HoyoDDHXFm6jECC/iDSH
	mDX3F8aqtlhXWNmfbpLwI+NAiEWY+JSpUN0egA6tyZFdtGPxrlfoYML32w+TI5yCnYdL4It4IQL
	ueH2Nk/yvBVLGSZjPvi1d+yxFtHGBR4BdbHRIB7z18cLLYKkgAgb876ZSy+uQeA5YMbd0Q7M5nc
	qsspJvpL7F6qWrVbFSvczIcCRZ2iik4wDj/SI9lSp8Rou2LPuEOmFj2MWxVWp15ERAKIGpg2yGt
	lvHA7+NwhjvhyT2Im2+hIKxmR9PndUXGckIfqdA9SPeTMQJN5t+1dmVE2ps5fXgqqsA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792515023; bh=CCI8TZHqQgliAJL6UDTU3vU
	ys44T4hQaCZ8A85wiqHo=; b=3D0czybwiZFy1crCLlNhxugQL9kXmLTKAmuQIYzIrKPlDcSdeJ
	YiObu0KC51Daffa0Cvl49L/mnEDKRm9lwaDQ==;
Date: Tue, 20 Oct 2026 17:50:24 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Avi Weiss <thnkslprpt@gmail.com>
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] profiling: fix sampling step on 64-bit big-endian systems
In-Reply-To: <CAKOB7-YhfVyoo95LtfOSkJTVxgjOA0bxPBndca5L+9M9MXTSHw@mail.gmail.com>
References: <20261020101225.917959-1-thnkslprpt@gmail.com> <E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org> <CAKOB7-YhfVyoo95LtfOSkJTVxgjOA0bxPBndca5L+9M9MXTSHw@mail.gmail.com>
Message-ID: <FBD0DC2E-B6C0-400A-A2C2-BA8BA127E43E@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 17:47:22 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
>I'm happy to try it anyway - just so I know how for future patches.
>I'll see how many I can run through before my laptop gives up ;-)

sometimes the crux is for these kinds of patches something in some cryptic
arch gets messed up in vmlinux stage, odd right?

This *makes sense* for me, off the top of my head and thinking hard id say
this *shouldn't* do anything bad to a cryptic architecture, but I've been
shocked in the past.

>
>On Tue, 20 Oct 2026 at 18:07, Bradley Morgan <brads@mainlining.org> wrote:
>>
>> On 20 October 2026 11:12:24 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
>> >read_profile() stores the sampling step in an unsigned long
>> >but copies only four bytes to userspace. On 64-bit
>> >big-endian systems (not common obviously), this copies
>> >the upper 32 bits and discards teh rest, causing
>> >/proc/profile to report zero for normal shift values.
>> >
>> >Cast to unsigned int so we get the correct 4 bytes, while
>> >keeping the shift calculation in unsigned long.
>> >
>> >A small C reproducer under qemu-s390x reproduced this and
>> >proved the fix works for prof_shift=2.
>>
>> If you wanna be 100% sure that this is regression free, you could test
>> building on all arches. Sometimes linking fails in cases.
>>
>> >
>> >Fixes: 2d186afd04d6 ("profiling: fix shift-out-of-bounds bugs")
>> >Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>> >---
>> >
>> > kernel/profile.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >diff --git a/kernel/profile.c b/kernel/profile.c
>> >index 1fcf1adcf4eb0..e7defa90a34c9 100644
>> >--- a/kernel/profile.c
>> >+++ b/kernel/profile.c
>> >@@ -156,7 +156,7 @@ read_profile(struct file *file, char __user *buf,
>size_t count, loff_t *ppos)
>> >       unsigned long p = *ppos;
>> >       ssize_t read;
>> >       char *pnt;
>> >-      unsigned long sample_step = 1UL << prof_shift;
>> >+      unsigned int sample_step = (unsigned int)(1UL << prof_shift);
>>
>> But this would compile anyway.
>>
>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>
>>
>> >
>> >       if (p >= (prof_len+1)*sizeof(unsigned int))
>> >               return 0;
>> >
>>
>> --- Thanks!
>> "I'm not a very positive person" - Linus torvalds
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
