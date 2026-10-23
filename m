Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773530;
	b=y+MhjGivh++jG9fYA3L+iJ3BRg5PlfvE5e1gf/JKyWVHMdyYvWfnTMWwc6ZciEF3oefL
	 rBHIQ7ecpmQEM03IW09LbNGiR3gHHQf0tmkwSXHNxJZx1i7eeRH8girKt3iT9DOLRJxUP
	 Fewbi4GmmUpt88tfLLxM96lZtTMYZWAgMFXW8bCECU4USlUXnn+QmrfoHrC/+JHvY0yMs
	 aZ5Mqq/nE94iBtg3Bobb0oCqMPK57ZdAAO/N1dQLhmtzgGjBKD/MaeFZLU9WaOugC8jr9
	 NHYEJSHcsYoqUQ7elqoWXg4wtTBV6Y376YlCV4d4hj8BSrZspiwT9aM0DTYGlWqg50g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zDuV6g/pCqdwIIB8L63tabmwXtA/ctwK8ZJVX3nWzkM=;
	b=fB3UZQQvK0xs1Nouo5os1lhx4Cen68b/7I1L9q+1f9tzNi1HKVJq2wvVugV8h4vHN9yn
	 +OfhTS6/WEZuTATJjFX0nLDzWyBbpNlfS2BANRpCtjwwclIkwctDl5rUd/pvwy38nPoq3
	 30uc8WCodRjs7n/b3AIfpqFuS/Xiv0GgM5y3h7+Lf0qoS/psAQdLWP8cndwD+HvLlVtuz
	 Y7nCN7Okd0ylebs9T2gytXo3MU1CRXfC5ohppuCUv+sEE9MLfFN/iTnm7wRZTt+RRNyr3
	 /yoKLbCtRHQInC+zcsIglIHE0+Ba4jMTNZ1KoARkzLkMKReugfr8kIXVd+QUeXkYxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FIXBI4o0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3ED606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FIXBI4o0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so7914415e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792773528; x=1793378328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDuV6g/pCqdwIIB8L63tabmwXtA/ctwK8ZJVX3nWzkM=;
        b=FIXBI4o0JAqSIiEBTvQAwwk1JR8PDwRO8mTmvLgN+Q/O9ggR63Jiy3ZtOPMnL63QbN
         iMHks5ewoc4ZUkFkn/okpC+69g0ejHUmUpdi0B+roV1xwyx4fEh56YTr4lQhlRP7lGex
         Q6qLmDvE//022LpR2Vnha1x8uP+Im+lJF0xyQvtpPToEI4Nem6JtY3GQq0Q7yXqlBfzL
         BSPHDRB798vgBGLpyuRy7OEB3F/fLcJKP4w0LbhWSuI6JLtcq0Koblipulxr1EIwz1wv
         ZLvLFOmYtFzAsMH4ZrnWA03vjhFT2syiXyLWVT6Lds7P5JtKSuqYQdzkeAWF7QjL3A65
         2MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773528; x=1793378328;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDuV6g/pCqdwIIB8L63tabmwXtA/ctwK8ZJVX3nWzkM=;
        b=cK6vYX3RJaH2Hwf7eM73Hgiv6OMD1bTUEUEjeuXD4edK0CSNlBK508ie3nzdQVmhCZ
         HwYR3VfF54LN42+qcL8EZBKBpDiKb8gjVvwn/yy+BQzo7m76rn+y1+yS7KIw9nZ38yx1
         SEiNNWWwj9OTafa+Rurzq7pONQwrQjY+1sZaDvubWPFFbSiIfPgTYX6jq073kBQgyT7z
         fs0Lg1nMzUo5WQ3281om/T7UtYiiYWmbplLKBZ1YuKaHs1LpZYH28Be4DlRja1RmuTp3
         35kIiaA6Px9j2Zep0HmSUCIBI7i8ccVR0Vcb/uKPWrI62wkKyUsdTsYcL57aUe5y3VKy
         QoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Al/lWMcYrx16H4aj+mIdVI4ynSpcExj759F7K97BOkw9sDrAbr9FjXCR2D6/AOFR7DFIKshgqgedU0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK67y65KJ7rlRexhPjpIBGb9Ru3vaZLCClctwPrdHUkbBsa9trk
	73cFoscJUZQCksj7SpraPS5dMLG7XoSGb+RT79VT7AYBPxFjmyJwKbW1
X-Gm-Gg: AYBFou26+xlpl2/XwhYelGAv9xIBwo5PIaezrDYOYVIYNZOcLIGAYgWZPOJyKkRnMMM
	BJJ3c8SvfVOQISTax+S/OruImzbY/ui6p6Wrvmip9+6wkkbdL+l+jXcnoYyGwdNYAHi0Um4SI1y
	/aNPNquZep2bvN6wiUK9XotSO709/TCE2IypvUtF/UIwe/DFM5q0UIQ8T54f0QNTFGJrdYx65d7
	GC6H0ZVbOVyJBWkjnrhbw6LwriDtv0H/SehdF1czxLXc8UI3ALqf++UN3WRIaZA+sOL0xERR2I+
	u6qkIjz6orY0bSa8Aka7gmIP0EeAalV+0w4oCE3fIkQ9yNL8pDnH5QCiHEREfPyEJyva+TRy3wC
	AT9JlRCArcMR9p/RiEqFJjTX2adCRvFvnuKyvSGrOAtjAq3u1m7ONLn4JWaCHlh2HbO3hKG7+DQ
	g2/6Jci1YT5c8QNu8bsDCPstzXA6Q0qANl9bkuccXj07w4IvPB3tT9fkZk4XrWZQB2jKGQdGy7f
	dUyC3h3/VMELpTbOo6/Zztb2H7GNf7jxgO8+dB2W0D6N5kkp96Xx9pVhm4fbf10RT7I4aWq/xvn
	RdiQcT+uHxzSXyPv
X-Received: by 2002:a05:600c:8b41:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a211cb289emr45180365e9.23.1792773527873;
        Fri, 23 Oct 2026 09:38:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062ce5sm19750475e9.1.2026.10.23.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:38:47 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:38:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Tzu-Ching Yang <shingekinocore@gmail.com>, Eric Biggers
 <ebiggers@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, "Jose E. Marchesi"
 <jose.marchesi@oracle.com>, "Jakub Kicinski" <kuba@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, "Simon Horman" <horms@kernel.org>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] unroll: Make unrolled, unrolled_full and unrolled_none
 function-like
Message-ID: <20261023173845.2ca86a63@pumpkin>
In-Reply-To: <3c25921c-7bdf-4edd-ba06-838dd1765db6@intel.com>
References: <20261016025613.2690485-1-shingekinocore@gmail.com>
	<0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com>
	<20261022100140.101ddf52@pumpkin>
	<20261022110959.1173447-1-shingekinocore@gmail.com>
	<3c25921c-7bdf-4edd-ba06-838dd1765db6@intel.com>
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

On Fri, 23 Oct 2026 15:42:28 +0200
Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> From: Tzu-Ching Yang <shingekinocore@gmail.com>
> Date: Thu, 22 Oct 2026 19:09:59 +0800
> 
> > On Thu, Oct 22, 2026 at 10:01:40AM +0100, David Laight wrote:  
> >> Is it possible to make the syntax:
> >> 	unrolled_for(....)
> >>
> >> Or is that made 'all hard and difficult' because he setting is sticky?  
> > 
> > The pragma binds only to the loop that follows it, so it can go inside
> > the macro:
> > 
> > #define unrolled_full_for(...) \
> > 	__pick_unrolled(clang loop unroll(full), GCC unroll 65534) \
> > 	for (__VA_ARGS__)
> > 
> > 	unrolled_full_for (int i = 0, j = 7; i < 8; i++, j--)
> > 		s += a[i] * b[j];
> > 
> > GCC 8 to 16 and Clang 17 to 23 unroll this fully, and the same works
> > with break and continue in the body, nested loops and a loop inside
> > another macro. The count form has the same shape:
> > 
> > 	unrolled_count_for (4, int i = 0; i < n; i++)
> > 		s += a[i];
> > 
> > As a fourth option, the _for forms would replace the four unrolled*
> > macros: no clash with identifiers, and the loop reads like
> > for_each_*(); the cost is a new loop spelling at every user. Olek,
> > Eric, would you prefer this over options 1 to 3 from my earlier reply?  
> 
> I had considered this option in the past, but IIRC the unrolled
> attribute can also apply to `while` etc, this would limit it to
> `for` only.

Is that really useful?
Partially unrolling a variable iteration count loop most likely just
trashes the I-cache.
(The unroll can't use simd instructions because they aren't normally
available in kernel - ok, some cpu have a 'load pair'.)
The only exception is very short loops where unrolling once can help
because the cpu cant execute a single clock loop.
The compiler is likely to make a pigs breakfast of those loops
so they end up in asm anyway - look at the xor parity code.

The blake code is really a special case where the massive unrolling
lets a load of iteration-dependant values be treated as constants.
(And I'm sure it can be coded so that they can be loaded and the
loops rolled up without slowing the code down, I've tried a couple
of times and failed - but there are enough clocks available for memory
reads that it should be possible.) 

Also while(foo) is just for(;foo;).

David

> 
> Honestly I think I'd just drop the unused versions (`unrolled` and
> `unrolled_none`) since they've gained no users for their entire lifetime
> (sorta understandable since the former relies too much on the compiler
> and the latter makes sense only in some very constrained environments
> where usually, the related compiler flags are used globally instead).
> 
> > 
> > Thanks,
> > Tzu-Ching  
> 
> Thanks,
> Olek

