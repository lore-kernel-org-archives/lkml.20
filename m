Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585366;
	b=pHee5KZ6yQcehkj8TaB7Q6S40Q/gWKE2B2pUS+VztKHfapIh8NuzwJ2jAgsmEclxdtJd
	 madqMlfbGqntraEMNunlb7Nta3WyHV3rRNLJTmQdU2uCP/PYiXeMSlrxsU3LQpJDYsAV8
	 JeF462DaXxZTxEF9nuicl3MSb8WKTo51yBcI1bqFk5Rba6FpjqVBjOYbAxPngwqAyY0RU
	 6uQbj+SvP3VFR/PbZzULDq0g5jZzdn3z3V6i6vTcn6n7tvlLOW7GE9FxWQRexNLRwMR01
	 lnChyQYrUc0q4PZNONwXCiRNrpPlakv2RVa11fIiaS8pk5z+TFYL/KA85RnHKywN8FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
	b=zPjwtY+6XEnBYhxV82gKQIrQn1aZe+RfVvl1XuTDZM3vcsCognr3Rt+oHD69nNKn7696
	 LdlIoL11rLcV89vpM8+bf2t1xC5/XcSD/7/lCYmO94oljaw4DeMxP1XDoeoZxQO83Uhzu
	 n/lOE9rt6+EeZFcj/PBUPwBH8QXT6mxUzVsRAL55XH70DXHnBm7ueRcLxu3O+HQgpPPGS
	 7jhxuKc/apzk5WCXAZWuwb/r87uDTb100/qby1f0K+mrAaZtWtSCPQIGrPjTwdp96ec9w
	 7lgnhIdaibmkgAnhj5c1nm5gij5mnag67H/hb73g3nW1dB4vCW6lbVMefRo9BreP98A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLli9ooL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDD7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDD7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLli9ooL
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a6b774d12so61525eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793585365; cv=none;
        d=google.com; s=arc-20260327;
        b=PJs1QzdDzF0DV63RD2NWU4mmRsH08xHMMZmXGacqbHPgGvqfYqr/bbLlte4SUeulpO
         SfkhQtNldyouvz4s08qHTHCbISi/hZ/T2SQF0BoCQs+w1E3bc/OULkjuRfAHVta8/idY
         ZB4GpBF5hqVmsaMEf86IhqQns5OpUnwINsLtxR5MX3D2JADywvbUUKLZlTtvxLS1usvZ
         GR/aM9/Qucy90ad33e6WM8Q1X2JRW9vLPNxHaxavJSTvLwBQGFCH4c5QWJHrTirItbh+
         86F5T2VZtOSZJG7ZDqtQSExTXG2MpIwTXrEQuUJsMJno7XWS+2nTff2xZ2ZQwqJmo2Pq
         Otkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        fh=yd5YU8RTAxPLKq4xFCRAE2nAyj1f/00naMEUQWpPiPM=;
        b=cm9l/1o/v0kXEotZ48CJioKG70Ekhq8s+vzKVF74Y9xkgy7hj2c76x7c2TLD3Mp2mB
         X0SBtde3k8DL1BNa7b9Km9AgIk+wiRPuV3vBJmbmALCXDFork+SMXGUCT8FjA6RYPLZY
         KRKU1p3opSSQgUNoI5YduqeqLRUBVhmF3Uyj1Min2KtYFWx2BcuilSpwG0o82Xnp1Vyn
         /FMi7bhsrE6PVsFo9R1huTK6lelR2mK0Vo5h2KyUAZam/l0dkgYGkMIupAhEnYiTGpKG
         a41FImYkGlhu2G42eeOCzBFDrgh5ys8VqEIRWPjCmD5EptW99FIcT0LiL1Ku3Tyy72j9
         K9wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585365; x=1794190165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        b=xLli9ooLhzieBA7ShWegrKHg7wsQlkXwGdZxFt4Ehnp8tKPxxEJShw6Vd5tIKTsbaV
         1YnzdlwFEmRnrgn0AhMdBFet7R6GVJ9ZDs6oJIyCzVkVyaC0GFZKzdh6VvbCaZTRjPzF
         TLI2zjZBfGs25VnHv8pszD23F7dFRTR2OCZ8ezOnSK9AC/Lvo4Cq05MxTICnxPp1K1Wq
         8nQnrJ66XVyiZ9ikzfKA+7KWcZeD9mlPz52kfEqAAjvGi1tLG4sjNRCGfHKZZl8dOgJz
         i4ar3liEMt8MTMo0h4mptYCaLpR5HBLxabA+UsOzEjpCLJ7MizXTqNZbMx7vKTeDBswR
         kLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585365; x=1794190165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        b=wc3Nq3XAf1dWClKqvGMJU9BrT3GZyiYJfWR/8nRCQUtZhxW4kp0eks4Hc2RtbpkAhu
         xzKjT+MYte5j00T9ygJkyqGudvTNsjMV7OfDTQCvO+aUWrdOggpOOQH32/dMi7PTOzxY
         B6/AiXIJ70GTp6L394Tv/AdsKUGMNqadHhBIjG92xqtF4NEDvxTpfAtEuzj9/BwwrlTO
         fjVr+DQWbVddDvepHF0cRYqTPrCNHH9pSzbXEDwWXF4Lmn4irxnG6pb4tm0QOo7gyMuj
         W6kQCKBJqh76QL/jKe7XX5k2dxjEL/IAWGwK963BpjyQsHbIojvYw+1rPfnJclmxsQFW
         udbw==
X-Forwarded-Encrypted: i=1; AKwUvBxe0GlnWkN/D15jD8cETashEW2xqG1InBABjL20LI/vOqh4/oP9c6Lc56cS/xuHhaBh0Nm04GZcojb6iFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RD4FcHyzvLFbIPoZvS4lGsQhPjsG++iuCc6nVGEXVb0pdvyPM
	dNvSzv3LhZ6K3sgcYNMC23DB1fsTQBEWm4gPzK2bp04pqWB3VEr+aGzciKcxeUTf3xWadSU3vc0
	ppr2FlTtOCdYYGHehOYRmE6WO61Ragtc=
X-Gm-Gg: AYBFou0Rvk5L0xw9YeESb6Jvlj6kHd4U8vkLTbeXVgYDWDs2gd23+D9QLvWwVlvdY52
	8vIOAoKfHTcECslH27J2YzvdEVSiVP7L68qHS58aWm8+e3t80UqaXQl0sm+OaeqcdTUDqEfMGBx
	T8W1LeLTmnsY5cWdhth6tHqTZVDktHPNzAe3JLZ+DcJHXuj09ZQIje1XebIjqywa6TfjDX3xFaU
	ev7s4GwZ6CaUb17b8gD99damDkC7xGMzJMWSx3vu1aejkjVr6CdxPhqYTIsOmwgmuDHj398VKHA
	LSJXyeBNWBpKjtuHTmm3xBRHqD+I7gt/JiWzYzHZmxYkV4UBlchBLmB/CCaKXufb+f319261jYK
	3h/QAdvqk2FbMTedvZOxE4iK09Vk6nwSMSuFyXzdn+L6LVd1Or2Nzej8sPSeu++U74+xcs9TvMK
	t7ENYHskdhEJ37kg32di8tc0scJgFjhnO7KY0ZcFO0LqsjA5JjqUVsA2k6euX6GMHLaT+2/e5zC
	XvsgdIyZK2F4I4xwp9vbJEiBOuWjk3L3Y87
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a4239cc86mr20960721eec.2.1793585364848; Sun, 01 Nov 2026
 18:09:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 03:09:10 +0100
X-Gm-Features: AclHuK9ySQ6mOkAgL_UJrSzXhdUVu9i8QnIVYFXWb_u0s7kLFxls3StjHm71adg
Message-ID: <CANiq72=jdQdNeTNoSxnMGvQ9URQ7yJjLWceYiB1ZcbpoYxj7wA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> bindgen 0.73 emits the blob of some opaque types, such as ones aligned
> to more than 4 bytes, as a `__BindgenOpaqueArray` or
> `__BindgenOpaqueArray<align>` newtype instead of a plain array. The
> newtype only derives `PartialEq`, `Eq`, `Copy`, `Clone`, `Debug` and
> `Hash`, and the `MaybeZeroable` custom derive does not reach it, so a
> struct that embeds such an opaque type is no longer `Zeroable`.
>
> `spinlock` is opaque (see rust/bindgen_parameters), and with lockdep its
> blob becomes a `__BindgenOpaqueArray8<[u8; 72]>`. Commit 71ec3c7d6db8
> ("blk-mq: quiesce a queue that joins a quiesced tag set") added a
> `spinlock_t` to `struct blk_mq_tag_set`, so an allmodconfig build with
> bindgen 0.73 now fails:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49
>
> Which wrappers exist depends on the bindgen version and on the opaque
> types of the configuration, so they cannot be covered by unconditional
> impls in rust/bindings/lib.rs like `__BindgenBitfieldUnit` is. Derive
> `Zeroable` for each wrapper in the generated bindings instead. The
> pattern allows for the spacing of bindgen's output when rustfmt is not
> available.
>
> Fixes: 71ec3c7d6db8 ("blk-mq: quiesce a queue that joins a quiesced tag s=
et")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I can send this to Linus in a couple days, unless Andreas shouts or
Jens prefer to take it through his tree for some reason (now that
v7.4-rc1 is out, it shouldn't matter).

Cc'ing Emilio as well so that he is aware that this means we are using
a regex to match the source code that `bindgen` emits, which isn't
great (fragile etc.) -- you can see the context at:

  https://lore.kernel.org/rust-for-linux/20261031152846.746656-1-sashal@ker=
nel.org/T/

Cheers,
Miguel
