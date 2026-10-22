Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685133;
	b=g23WDcEW+D+uvTN7Ul5F+ypKVswULdj8wqlAS81me+1ymtb3cIfRCgz1mM6qj5TYVlmD
	 HMgBpSawviP5/SgaQIES7HNqKzpjeiYnEODEHzluWfchlwIppsXc6ZLDkicUXhFjgxAOw
	 /0Z6cvy1na0zEcaGLshG0HXG9pihOiA4kiEiGqCnWTdniMrrt4zRYx7pvPpZSPaPGZGIZ
	 +Y9IKw4SV4CMYqUgc5OkkGPG1UjOAddWjwj4mhN4yssKnvSKexBMoVsOQgbqNmOycDv/P
	 aCGosXTlEWTf9PI6NEUMS0cCefgr9cjit2JORz6ozKKtgzXQgp3/9vpm1dWPoPyY8lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
	b=eG6iKFFCpSZ6uSOPf8JRpS83UF7Ci+zLvXRIONTKnZRKRWMZKe1DvMx1gdm/yUxyq4i8
	 3C1NJlEXm4Y+hIXaJev/+F5Snx02gOk9iR5XOTIPNWnYZy6DNaqjd7YWmHU0FLq4bbrON
	 EAF3Ots4MCo9eo5hGMlgVIvoE6pqfh3Ntqe43yZXnTwdXrwaxRMCYsTFJwHeM1pjPj5b7
	 X+0MvYIZqG1CsC73o7MjEFwO57pLLMnBnfapqYs4balEkKnP8Q+HXGDzmk41+AY4tjVO6
	 U/RqlsEMXR3T8kbEDyfLB1u7e4dG3g9se6wrLCTlTa/PT9uflrKhxp5JMR7yjp9bRHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=po2Ejtmm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD9606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CD9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=po2Ejtmm
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so21142731fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685131; cv=none;
        d=google.com; s=arc-20260327;
        b=fS8DCfgIjTk0WQr21C79irTUg/zb9ZPdouup08LKBvES+IWCbcGMqYxT1yzaMCr2WH
         XBM9+q2QKpzAJ9KK2FI84FV7+a486Zg42sa4LEdpXG9PkdSDzQNV/p6tM7KJ4jC4D59Y
         HlvvxGF1kTnkOeKxFG2Pt8SjoNOKdRVA1qHlgQCXXhTdHL8/FcD1xhiBwD50udkmNqe0
         2k+aDmBWNrHO/sKIZvxj1gx8RXdJUjUjpbGTHVfqkOSNpLqz+SBk09kU+m3OH+i+ufEW
         9CKpndV6XZRq9SaqfwtWZFySz2BTHWF+13dhS+1wyfZ0ZN1+2cAJtpyagnZhePhmOwnW
         ul9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        fh=1jzw9XcmvgAYV4cEYE01/20qS8P9ICbymOY7ojCchLs=;
        b=oNNPD3hscTHVJPXvD1UeZm33POIcVsHqGhsDkCRRHLSD8T7ozXLAczgWy59AhmUlnx
         fJLRPZlui9qrN0xG4mYQslH44trGfNuLzCZbbfvWoYbtFaohLKGRfO+EPwaWIPa9NI0J
         WuAGViO0At0TZMlgBlK5soqFw+b4davwwZPEvB0pMxNsSCS2w6s4+5zY9nRtBh/M0Z4T
         hxhB9FRM6CQFsAjNvph66bJgYCMz6Va/BceUACI/LkWtbM3IoP8CxSf9LZy2J4DzpS0J
         WBmXqYLz5J8JXVtYXiW44oq7OyRHkXJfbxefI2b8wB2WAs7enn+VTvVjp4hFCP3XWKPQ
         mwXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685131; x=1793289931; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=po2EjtmmhjEnBHkbQa505xq9tldXRzLLiYUKajpmJEW6SybEo90CZ0lqMjVa63jsZc
         hBqO+hVyyfp3yMA3aOmJ/rYRiZTHJeyhNRuTBX5d7el4UNaAUSpUj0iajRk30E1ugAdr
         2G4T5gLJtkMgJThjAbkjcfdONnuZbru9nEP8pIO/2nmPriJoUBZnQekt5x2y3lec11md
         bQ7OfvBEGTrDvpc0tQtmEBfFcnEXfoKGYpnbVi8qY5k+7PRNl6d/wifiA0bHvzixl07I
         pvFROBWdh0rZOyDKhlPSor8xwgaeSIbOVGatbpAHmH/8+VTlGB27UgUCaThtBfsY4u0z
         WE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685131; x=1793289931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=X5KDFVlUDBgzdwf3UZE/wi1QRDJdC425MvLi9b5vIEePL+4NbNZh2iIyGsPJ2nc/1i
         tKDdpkQxlOcu9AHh5J50sLjmOIFCeoLpHeeqBCiiZkgg4zt+QiEclVw4HJX8jaMlzGN4
         EBB0yeJ8RdyzE1oc87ffBEnftDwm8eLrn06puKjxlorhrP3myv4tXlv9649ouiHFAvMS
         jer/2t0XapNnn1Urf3NfyMlPbqgM3lmtIG/4nhmrvK6tAuFjxvegICM9y/A915JERr7f
         Cgw0bbwu0KOLUGeGGI4H72HIkj+vLvqlvZa7jfsEbEwTODWjzZqzEDD8AZtB8wKc4jpe
         elow==
X-Forwarded-Encrypted: i=1; AKwUvBzA30gkjRWWl7im8MGZZinYZRgN83MuSIKXnsBENOXlu8y24HDU5UeLObjb5CYTP4cA3PGKTbitFUpNXwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJJjlYbiWOg+2Xy1/8Ir4Ncgyev8yyRugEu1BDVoinDmt5B7I
	nQQ3kj2DuZ/geiunNJTeJbz7r3tPWtG2C7OTjKxYMpxzW7NGC1o8jMcXXkP+C7DZW07Ptgbd5dO
	0kArLQJi/aSK0Ocb/HaettyRa8hRvw84=
X-Gm-Gg: AYBFou0HzIO+VpmFi8Kywkhe5KHqIcUDICIPpUk6J26Smj8vAvDaw5kEbzxBwx6Fcs0
	666WznLTHtB03N7Go69o3nOYr0sNhKXmzG6w+c3PS0WRD+HHgw52kR8m46tsE/Lj7wHc+FuqpWN
	YF8c9PdbP/RYAVfC+ZJnYkfhW8eN5Ktg6mkpK3CzYQRDEnNcb1m5/ptwAv76O4fmNEiSP9wQz1+
	kCaQgvCSBkMSh5sOViTBNHvVdZxEWU18pzOi2rFgaEE7GhYlQ85IKCLPkm4SrFIJmnxP47PN7W7
	Qdekr/uOXCvqG5oXVh2LGl4suboZNBtnLVg4ahxKVcmilgNz0skkkTVGSlW5dRlBnZWl2W70VZI
	m8EYU4m2lVJPRWjw4gyIO2g/jZIYIa7vj4w+9bQ==
X-Received: by 2002:a05:651c:c01b:20b0:3ab:3f1c:c2c0 with SMTP id
 38308e7fff4ca-3ac441adcf0mr12071131fa.22.1792685130710; Thu, 22 Oct 2026
 09:05:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <179260197668.3127.18219777718091081046@linux.dev>
In-Reply-To: <179260197668.3127.18219777718091081046@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Thu, 22 Oct 2026 23:05:18 +0700
X-Gm-Features: AclHuK-_6y3CZAcHO0wx7PGRH7qXj55F0nJkQUzx_zuArGiTC_UADw4Zf8xvi5o
Message-ID: <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 23:59, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hi Muchamad,
>
> Reviewed the lifetime/teardown contracts you asked about. read_raw() has
> a problem: it takes parent: &Device<Bound> and recovers &I2cClient<Bound>
> via TryFrom. That conversion just got removed upstream ("rust: i2c:
> remove TryFrom<&Device> implementation for &I2cClient", use-after-free,
> unrelated thread), so this won't compile anymore. More importantly, Gary
> Guo made the point that needing the conversion at all is the actual
> design issue: a class device shouldn't reach back into a generic parent
> reference during a callback -- whatever bus-specific resource it needs
> should be captured once, at registration time, and handed back via its
> own private data.
>
> Concretely, this means dropping devres and letting Data<'bound> carry a
> borrowed reference directly, which it's designed for
> (Driver::Data<'bound>: Send + 'bound):
>
>   pub struct As5600Priv<'a> {
>       client: &'a I2cClient<Bound>,
>       #[pin]
>       io_lock: Mutex<()>,
>   }
>
>   unsafe impl Send for As5600Priv<'_> {}
>   unsafe impl Sync for As5600Priv<'_> {}
>
>   unsafe impl IioDriver for As5600Priv<'_> {
>       fn read_raw(&self, _chan: *const iio_chan_spec, info: IioChanInfo)
>           -> Result<IioVal> {
>           let client = self.client;
>           ...
>       }
>   }
>
> In probe(), capture the client once via deref coercion (Core -> Bound)
> and split the driver struct so the registered IIO device carries the
> same 'bound lifetime:
>
>   struct As5600;
>
>   struct As5600Data<'bound> {
>       _iio_dev: Device<As5600Priv<'bound>, Registered>,
>   }
>
>   impl Driver for As5600 {
>       type Data<'bound> = As5600Data<'bound>;
>       fn probe<'bound>(dev: &'bound I2cClient<Core<'_>>, ...) -> ... {
>           let client: &'bound I2cClient<Bound> = dev;
>           ...
>       }
>   }
>
> register() then just returns Device<T, Registered> directly instead of
> transferring it to parent devres -- that transfer is what forced T:
> 'static in the first place, which is what made storing the borrowed
> client impossible and pushed you toward TryFrom.
>
> I built this end to end against current rust-next: compiles clean, zero
> warnings, and zero changes to rust/kernel/i2c.rs. Happy to send the full
> diff if it's useful as a starting point for v7.

Hi Igor,

Thanks for working through this and building the changes. I'd be glad
to use your approach for v7, and I'd appreciate seeing the full diff you
offered.

I got the lifetime model wrong in v5 by storing an
`ARef<I2cClient<Bound>>`. I only realized that while fixing the
documentation for v6. In v6 I stopped storing that `ARef`, but ended up
relying on `TryFrom` in `read_raw()` instead.

Storing the client reference in the IIO private data rather than converting
the parent back in `read_raw()` makes sense. I'll check the lifetime and
teardown details as I prepare v7, and I'll acknowledge your contribution.

Thanks again,
Coirul


> Cheers
> Igor
