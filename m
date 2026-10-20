Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519943;
	b=dc7Vi+0mkMQsUTVGjVi1WUve+XFxWOT7hBanzUT+0P1BO2u39NRgDY92Z0/Bdg1mtE1m
	 NBRgNkEs9s+AFvjPjxgrpxSNsQgzQVG1m8GoLsMzu+/JV8jVdX0njIPcuguhxVrtR/W0Z
	 O0ZmqLVIajXDoYsCBcraWj2h41Z8lYwwAffxjicVRxrSSSQLCFEV0fqPc9Ll6WGTT9iJi
	 iyoXJnK44kNZ9wufSg4MRXV8KE5F/vENCym6OYBCXxIOFa5VHH7td0EU9Sj5k9G1L6A9F
	 30IyL5akujs9LHPBPTOXTKbGgCGax+fomH7fBjV62gKYObzUdIJIwmYYNa4aHZcSsbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 In-Reply-To:References:MIME-Version:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q0IBvTQMEWBs8o9DTQ9g44FzT6wyIyEPpp62Eq3IeX4=;
	b=b2CTED3duVD+LBV5Sbjg1DYhp50wyWBClap1KjS7wBwIn8YrK/pNyltVtOIG/XiCwtez
	 T4tRfXKa9OFOGADP38uXXM+iQ/2WS2yuW2gVRNXuUG/FFQm/Af4yBiBsBhrHW8JJuwq5G
	 Ytf6jnS+zoU58CEboaMUx3DgmQOtiRpBFtC2VBWl0j3HRxu3VvCKykeAWeydlW6KeAFos
	 k0GeXso4xvvSXFJXMrTX7k3oCjM00bNmtoqWgwotdQZdoIEwM09EdggLvAT4QPT2Hcl5C
	 CIAtKN4/4xQ/WSyRPZAotgsNhaDCgZCl+482rS9Du0yihBiWVvX57ol0MnENH9+G5dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bGpYbKcY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618A60A260E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1618A60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bGpYbKcY
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b12b0bec19so603897b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519942; cv=none;
        d=google.com; s=arc-20260327;
        b=C6DYGg5lYmKieut1IOJjG420T7dXNK+imB/i4qXJ0wbb3b6kYVUMeudY6JJGWXxDjZ
         1J6CXa+mf84uNS3e4k0ULDVgmzzs4Ap6UEGMubVsOfTlWppuv50QwWxYJMwg5CtHdB/K
         2rWa+Z7X+B+feo699/9TFZeE/MsA6rhnU5zsvbQSzDfnjLr2hSQPm70R9X5WY86au9+z
         LnZ1KDlVgc4RFF11T9moe6k/qyQ8Df6ydzbh4CmHQIV6UQshsnZL6NId7xaj/u+BrWDb
         tANLU/7aRs8bJ9tHYlOeWW2ZfNv9yMRMuvdoa51DLpnMP1sZ1HFCZLL9OPLgF8yQIr8n
         GCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Q0IBvTQMEWBs8o9DTQ9g44FzT6wyIyEPpp62Eq3IeX4=;
        fh=odI9QZF2zDQivdCEDJyTYEtbrzGJeGolorPl/bHsza0=;
        b=CRBXgvt48msjZaXIuyihD/HPB/Tcg/lGBgKgwP5Hn7z5RYsTWsB4JfBqeO3J96BF32
         MBW6ktOMQo0uO/I+J76awS48kRdxbDMe44QpKllNQry+X95XW4bIDkv1CH7AwlJBtKAC
         uUui5dzoVAvFXrde+gMvB54DHkqzhNaU7uQ5NJ9Zd3TnpxqVQQ06U4CJy2SGY70DqOvw
         x6nO4w0hnCWGjlQo6daStaMOA7gKO4GS9YzJHnopgsdqmrpAgAl/Iahbzq0KDxlIBjR0
         akUvGojlc+JF7hOZRe8mos3IzAGbps+TathPojjtum8icPZhVb5lLdwW4HB2YsrdtxKo
         n2sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519942; x=1793124742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0IBvTQMEWBs8o9DTQ9g44FzT6wyIyEPpp62Eq3IeX4=;
        b=bGpYbKcYceno920JNl8OlwfzfQjEsWshM2x+pHFEsTL8OvSB1Ad3Vkr/u1rCyp+MKs
         o5sMhAzxOV72Hmb7IPexCnZBtd9/ZRZclzdsG9bQc6pYU/ZpNm6/Pae2blYkGifjHs+L
         Kj3kMHFbTtXRwNVN7xVHQSfRefYW/WjfDghzgDAAON8vggU6GRPxnTbXh0cy1OqkV96U
         b97/2agJnEqkLsbT8Zr6wiyb76Sg2/BIzoUqFyvJsYXsiKRRygs5eBixjmzrumIEPnTI
         CKKvi8s10QHD2HP/qb8vJ5taC3n7McZgAUfXYI8DWf2c9ZnWRCU+L+7YiT4fRRBmd/Te
         xZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519942; x=1793124742;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0IBvTQMEWBs8o9DTQ9g44FzT6wyIyEPpp62Eq3IeX4=;
        b=v6GpX/ADVSXftEu+pVTDDz+0PO5qeDvU1oTzSkmM4icPp9kKbfZq1keD7NPVAto0BR
         DwS5D8xS8S58Spjcu++WdzauLtA3TnttfszXPbB6uRPadr7Id/K0SEbNCOhT44m7++G9
         9ePv9Hd428wLYMy4uDxl7kYP5TCVJtKSNBjj2RnEXAQqbhsEk7LsndrBnxQ0H+GEtnOW
         eUgiBd89nezD53OzagxDZw6mQoEeHql/MvLgiY4n2rWCGoQ0G6fzTuhBJGlBALx1ZcA2
         tSVBW1bheunUglYFZuYeySrZJnG1K/nmA2WXuUfJhsX/vdocO05LbGTv8pt9pXgtpFGU
         vZsg==
X-Gm-Message-State: AFq9FYLJ/Pa8LXmm9Zh8hYpcbBMWikUZXH/xv0YPKML+Sr9VZbpNqNZV
	l2ENTZSkdVdj35mEp4VSCsR+AR+hID75+D1dFc3OpCyPExcK85TyA11t+M7Ox5ZFJJtI3tOrKM4
	weYnIPI2IqTW5vq4WnkbYwRMU9cDFigo=
X-Gm-Gg: AYBFou3NdZ2hFX0b5pfyP/GzkQUO+TVqUKuDMD66a7fjzqOahjfIUDTs5/PUYoiBnme
	H4jEyTpgEiIyFN7vntbtcx/qy8t8y0l13ZkNMyZ/D62ebeuKXcEvBHrXsbDHvzyDidwFR7oKvJ+
	qvS8EP0hCoSh7X8qwgsvhUq8b6ZUfk0BbzqyX6e19qhxL9tXKXv3Ki4npDOabY7KMWP1dmi+S+o
	tiV73WIklG90VDwNIE2hqXkoPhMcJ+RuBebwzYqyS3qfrHaDu6VgZ7y/gbGaJE60ICuJfIH8O0p
	J9NJKZiHBNpzGd5cbS+IEv0Zvo3+y1t0i7jG3CkvMBqbicbj1gn9rivAZYrr7zMI
X-Received: by 2002:a05:690c:6303:b0:8b0:d28b:7120 with SMTP id
 00721157ae682-8b0f20640fdmr73203517b3.1.1792519941846; Tue, 20 Oct 2026
 11:12:21 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 14:12:20 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 14:12:20 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-string-strscpy-kasan-first-byte-v2-1-c93073250e6b@gmail.com>
References: <20261019-bug-string-strscpy-kasan-first-byte-v2-1-c93073250e6b@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 14:12:20 -0400
X-Gm-Features: AclHuK8jxheInEZQp88vwy8iR4LpiWZaam4FG48zif5YZiKEGKaYGQuCm2rDABM
Message-ID: <CAPAsAGxVSdCKhUVq9zq7ASRC6JSuXDexxr8MH4og1tQv9RNjrQ@mail.gmail.com>
Subject: Re: [PATCH v2] string: copy byte by byte in sized_strscpy() under KASAN
To: Qiliang Yuan <odys.yuan@gmail.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Collingbourne <peter@pcc.me.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> sized_strscpy() copies a word at a time. The loads go through
> read_word_at_a_time(), which checks the first byte of each word with
> KASAN, or through load_unaligned_zeropad() on architectures with
> CONFIG_DCACHE_WORD_ACCESS. Under KMSAN it copies byte by byte instead.
>
> load_unaligned_zeropad() is inline assembly that the compiler does not
> instrument. Since sized_strscpy() switched to it, generic and software
> tag-based KASAN no longer report strscpy() reading from a freed or
> out-of-bounds source on x86_64, arm64 and the other architectures that
> select CONFIG_DCACHE_WORD_ACCESS. On x86_64 the kasan_strings KUnit
> case, which expects a report when the first source byte is out of
> bounds, fails as a result:
>
>   KASAN and string KUnit suites      failures
>   on x86_64, generic KASAN        before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Copy byte by byte under generic and software tag-based KASAN too, as
> under KMSAN, so that every byte strscpy() reads is checked. Hardware
> tag-based KASAN keeps the word loop that load_unaligned_zeropad() was
> brought in for.
>
> Fixes: d94c12bd97d5 ("string: Add load_unaligned_zeropad() code path to sized_strscpy()")
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> V1 -> V2:
> - Copy byte by byte under generic and software tag-based KASAN instead
>   of checking the first byte of each word (Andrew Morton)
> - Rebase onto v7.3
>
> v1: https://lore.kernel.org/r/20261018-bug-string-strscpy-kasan-first-byte-v1-1-375a2c46d88f@gmail.com
>
> The other callers of load_unaligned_zeropad() are covered by a separate
> series (Peter Collingbourne):
> https://lore.kernel.org/r/20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com
> ---
>  lib/string.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/lib/string.c b/lib/string.c
> index a3778d5aab4af..d14e42ae3903b 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -124,8 +124,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	 * uninitialized bytes after the trailing zero and use them in
>  	 * comparisons. Disable this optimization under KMSAN to prevent
>  	 * false positive reports.
> +	 *
> +	 * KASAN does not see load_unaligned_zeropad() at all, and
> +	 * read_word_at_a_time() only checks the first byte of each word.
> +	 * Disable it under software KASAN as well, so that every byte read
> +	 * is checked.
>  	 */
> -	if (IS_ENABLED(CONFIG_KMSAN))
> +	if (IS_ENABLED(CONFIG_KMSAN) || IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> +	    IS_ENABLED(CONFIG_KASAN_SW_TAGS))
>  		max = 0;

I think this has been discussed before several times.
The rationale for introducing read_word_at_a_time() with a first-byte check was
to preserve the word-at-a-time implementation while allowing KASAN to check the
access.

We should avoid changing semantics or implementation under KASAN unless
absolutely necessary. Changing the implementation specifically for KASAN means
we test a different code path from the one used in production. That defeats
part of the purpose of testing the kernel with KASAN.

The only missing piece here is the equivalent first-byte check in
load_unaligned_zeropad(). So the proposed instrumentation series [1] is the
right way to fix this.

[1] https://lore.kernel.org/r/20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com
