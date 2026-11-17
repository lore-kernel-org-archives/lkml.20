Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902785;
	b=DAr3WS2LvcuOIvZQPwuIWx/qPyJsPxMCZhUnpiEU0S+bOKmJoLBMvv+1vl5+uD4aksPT
	 XiEs8Itf+BkDfmn48Pon9A4Z5vy59h/kYoRdfvdJmBGGV+/RnG8jh/SEhqZsEdZ4+xMYa
	 MTt8+9BLQjJObiX1B8r0n1+MiMjAWRrj03dJtwdUPdw5PQvaO4gYN0P8G3qb9M2IluUMR
	 d2W6aaLjjE7zrL3eKtdHippeFUl19skJ1JO4BguCfghZXDCzgPb2fyWCQ97LdZoxX9Ve/
	 xmV3zqpmVYNp9SCTBFqm1E09IAyUv5uCzroxo5V3OH7hksRp+Lq7GQe8/LqRRdb5Tgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z3bsET2VankbK8eLMSFl3LX6E00addFEYj4yT5/Ks6E=;
	b=YRjSyai8jsvNZtc9RtZpzlBX0POqOA0xbw8GKlVj0THvC6aiXbS/95sp0cZIT/aR1e4i
	 z63OJ5cFUqoIwSwTdvK5Y/2Rh/xI4LtTKzoDCrdTq27wsmnLulvVy2LTWAjbX757W3IwE
	 ZSqatqVfKxu7ZSo4k83dmI3wRpJa9QAp9R7hSoE2X5rm4yFwy9LK4TPt3tyqYWRQps7dQ
	 VzYzFRA2TJZi0AK8bLfPJSn54VVcl1JbT1/6ZBj1pXxdpsNM5lEdcBhN71jnwOn/Ynd7q
	 bz0nDukWD7EPcxDNL+sppFiT5+qKR3SUy0HT1OcYs1ccWG2gxRoSjDEJU4OdNaToZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8M+d3Au;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D3606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8M+d3Au
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso25967835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794902783; x=1795507583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3bsET2VankbK8eLMSFl3LX6E00addFEYj4yT5/Ks6E=;
        b=Y8M+d3Au5EhqgXflRKbuhsqYGpHM+1f1ypEl9qCOk7/jHm9wV58DTM306fPtgThg/i
         R4mQJOG+VEx4s6k1qRNt8L9FU0v7dkonIorYcCUwR18eU7cGBLxi4x6qjPHapt78p05+
         7yK/5FKUigxCX9baa2/d9+eCHLWm6NX7vXh4TOGC4ZA6Fv4OriL6LzEUcGkYmdog2eaR
         SxU80LsS3RYuEFDGZAuNSm7PaIZm0aupbhY1G0ZA27APU8hNpGlMUQCGH5RWQJn5QJ0+
         9Nv4YVBd0gg+69a3Nqjj8Lq1hBej2giJJccfx9iCbt9Ylgm147xRusSIZYeT8NJiSKkX
         ZQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902783; x=1795507583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3bsET2VankbK8eLMSFl3LX6E00addFEYj4yT5/Ks6E=;
        b=blj89HErtAbKKUtSeGyeGO5hOHBMy/JLKlQ0FTD72mcGdQujP9ehcw/xufQr63AwTZ
         +pUdroG+g1+HoqF+HbKe3kgrQKvbQEmNZJJ7QoUU68grTNyv9UFdBNOJHLZNF08IQV9D
         SOacLCHACWhx3/2hQH1C/rLg3InBB4KNUzG45uOp70c5H+cvXlZKmePAWCVUPSHVl8WU
         9hQRtVfK41tyjlw7M9Py+odPf7x7vuDySnb90cWoxipxUU6bcP9OXCDd3M5Tj3AMv3Uh
         GseP6Um/TV3gJGkRXpdQ5wFN8THAKv5NnIyCidksdYBwr6l8xN8Xa1SRi3WmvK/AfwO2
         /zIg==
X-Forwarded-Encrypted: i=1; AL+hErHDuoMUMSrfAUuKiekhyaIr8QDiSO3KhmOu/QlL1yi5HivW+r7CX+6rC0xZvUaDtZbjFcsn+ASlj1Uqrkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ooCUuvCsC5LYe/zt1P1PauqwDnnPOJ/1gBtRHK8BRo4GCtYrX
	DZ1iQ2I9EJup2SCt+aIUmUsFehB4pC7x8fM/NttL4yPU8u+hPyv0KUSE
X-Gm-Gg: AYBFou3F7TB/rgIy5yHvkRHIxhp7KjS2BhqKKxzXanzsst7ocRu+3574ijZhsCwNUeS
	3g8digx4KdMnsgcpt2NB3uVqqnzl7w6knk1/Q7+UFKjEXV5a9tQUZZHKAhl6QSVx8UnStr17Pzy
	lhb7Q01WeGJvzAxSKSl5Vo7Xmu2lqxC6omvsKPvVXACJ6Zeh8lKwiWURJDAvi3XtxelQJNepX0T
	XOYuMmkRVG3VQwU8k1gqQ1mg01U7b3T69Vzmw2vra4ojKRCgEumtCb+60FpSyYyjNVmaaDu/fxA
	Jqz/r2+vxGjLkaxdzW/4mziNTCCf/QKuKEyV9v5h9GJg4SFsmPj1xgET8q/GADvDICb8thPzTaU
	KqSBb5+hmNOLoGyRqh6CnNyL+1Ta+GBh5LPPzMOa3ly7DCItSdgqGVk5PbbmFgTqIh4azuFjy6N
	J4dpip+dW9ttT6rTUaFy7PwYHmUrpGdmvIk5NjOL/koMjtrJBdz57kL6p49cmxNPYnE+WV6LFYw
	x20DziQSwwGowZBRyJZoDxXlUr3U83sdkecIqFx4NB2h1J/R7MxbIe4Za3zs9VZIAoEhA8hwoiN
	dfyaf++4wk1NvzxCtR51X6TzMxyZehAQ42rk+RL5TLc49lViaeuVBNUDkKWdstTWwg==
X-Received: by 2002:a05:600c:1d16:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb55a44c3fmr278620995e9.6.1794902783279;
        Tue, 17 Nov 2026 00:06:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm44520775e9.4.2026.11.17.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:06:22 -0800 (PST)
Date: Tue, 17 Nov 2026 08:06:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in
 is_signed_type()
Message-ID: <20261117080621.7ca022dd@pumpkin>
In-Reply-To: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
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

On Mon, 16 Nov 2026 14:26:25 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> Replace -1 with -1LL in the definition of is_signed_type(type) to
> prevent sparse from emitting "cast to restricted __le64" and
> "restricted __le64 degrades to integer" warnings when evaluating
> is_signed_type() on 64-bit __bitwise types such as __le64 (for example,
> in tracepoint __field() macros in net/mac80211/trace.h).

Don't the trace definitions need fixing?
The trace code prints the numeric value so you really want a host
ordered value in the trace record.

An alternative view is that even asking the question 'is_signed_type'
of a bitwise variable makes no sense.

David

> 
> Use a 64-bit all-ones constant (-1LL) rather than a 32-bit int (-1)
> because sparse only permits casting a non-zero integer constant to a
> __bitwise type and ordering it with '<' when the constant has all bits
> set across the full bit width of the target type. Ensure that the
> constant before the cast has 64 bits set so that sparse's
> restricted_value() and can_order() checks succeed for 64-bit __bitwise
> types on both 32-bit and 64-bit architectures.
> 
> Add a KUnit test case for is_signed_type(__le64) in
> lib/tests/is_signed_type_kunit.c to exercise 64-bit __bitwise types.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  include/linux/compiler.h         | 2 +-
>  lib/tests/is_signed_type_kunit.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index cb2f6050bdf7..2f133a7c3885 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -326,7 +326,7 @@ static inline void *offset_to_ptr(const int *off)
>   * Whether 'type' is a signed type or an unsigned type. Supports scalar types,
>   * bool and also pointer types.
>   */
> -#define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_signed_type(type) (((type)(-1LL)) < (__force type)1)
>  #define is_unsigned_type(type) (!is_signed_type(type))
>  
>  /*
> diff --git a/lib/tests/is_signed_type_kunit.c b/lib/tests/is_signed_type_kunit.c
> index 88adbe813f3a..b9c8f7da45e9 100644
> --- a/lib/tests/is_signed_type_kunit.c
> +++ b/lib/tests/is_signed_type_kunit.c
> @@ -18,6 +18,8 @@ enum signed_enum {
>  
>  static void is_signed_type_test(struct kunit *test)
>  {
> +	typedef __bitwise long long bitwise_long_long;
> +
>  	KUNIT_EXPECT_EQ(test, is_signed_type(bool), false);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(signed char), true);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned char), false);
> @@ -27,7 +29,10 @@ static void is_signed_type_test(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, is_signed_type(long), true);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned long), false);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(long long), true);
> +	KUNIT_EXPECT_EQ(test, is_signed_type(bitwise_long_long), true);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(unsigned long long), false);
> +	KUNIT_EXPECT_EQ(test, is_signed_type(__be64), false);
> +	KUNIT_EXPECT_EQ(test, is_signed_type(__le64), false);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(enum unsigned_enum), false);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(enum signed_enum), true);
>  	KUNIT_EXPECT_EQ(test, is_signed_type(void *), false);

