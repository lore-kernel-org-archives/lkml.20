Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979917;
	b=V7/d9/8F0mIAs/NlzAYa4Ce02K4d63dqVjvTPxqJ7f5AL6oiIVTrSjqn/8mF1Ms4EuQW
	 N/uwSwymGyvepTDnrUK1lxSg61QIYF7Ry5BG00AgORmpKKaPM7ZHdRHvH2jsKRqlUQOGY
	 UCjZFT1LBr292CwzrJfb38szvGQKEObJvJI3SbcKc6NqdxdyDOnGQRCfVwhLhg6YZmF5p
	 OZZe2EoaLEspw0tF2hx2oeGt9umvLbHT7hxgW0szhD2MNWcHde7lrYHaGwQbAsaJSnSh9
	 m/k1CMlge+a+BhcGVwlcGmua++GW7vzaIB+Vlb/CWRd2QBJePCr3TAICU5bv5k7CaOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
	b=eiZqVBSVRWRDaQHszUYqbJEQog4x8KgbP/v0BsmkN0PVqbKw2dBEAuwxTRL1g+pE7kWT
	 caRV7+VhQKmVFNCSdcFiMp+naZgj4BWoqLG3abd4/Y0x9RMGzUUvLWdzVOPN4xBw5Hu30
	 XWG9pLe+MeV6H2dtBdy1ZeMjLU4pHiPhzb4kEMHHYJ31al1aoxT5VeNyCQ3qSfeogsEhh
	 Odq08GCHWI7oAzV7KzL96uuuGa3NqrX8OterGtAdZNsOz22mPeVgKuWQZI2x+r2Dw3Jhz
	 0n/TDd9qel2wNSjg2c7EhSdksJUS3FgzyXkwurhym/vY2Da41dFVJASnvCrt48Mikeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVCIfsqA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B29606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B29606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVCIfsqA
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso4009651fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979915; cv=none;
        d=google.com; s=arc-20260327;
        b=PGqqYn7HhiazK0a1kX1v9UM4aMyWG8umeGanFtecO+S4vSpJQw9qGsjAZmTBnSeHqo
         k3DvqEKk6ByE1ho0IL6HooEp44thEF5oyPdM9c9aYTbZeIhzjNsMPB5PHgX6twxAAoXq
         3VHkpjBW7D4vCameWdyL2p653wE3f8Ch8qINYr4v0a3q4qzuG7b4IkLJ07WqT9x9WO2G
         4ot0W3E1qIs/UjNCMFhaIhiEYXy3n/ega4eiJqUY8hBk9V7Avy50MQ/ldKJ9WQXix2tf
         4S6YTeUlZZ+pvuPNvFFcB6kwrDdk3e3keVk17qJ9xLWBgmXEqcBacyOOM9xQqsIoudBE
         K18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        fh=eymbRXXNFZ7rvN233pxlb4CIPnO82FXGzobYepGVolg=;
        b=R67SHUk8AyKHCLwJITq9L7eJ9o1cgXjQwtJMU0LaodGIPqa1VPdjAXBMb9lLPCu0LZ
         cHRCXvXwwAVJ/oW+sSs/WwAoytNeX28Ak0XYPpao1om7SbJuIrWUfrZibZOerMhA2CXk
         E8ZqnK1Qc5emYvya90J9WIox9KF+rxsZHnALdeBUt3LQvSc5Fj3Lq3/Ck69LE0k6v7zE
         HWQgpdkBLebIJAqA9Ke3aTLWAIHxy/4Rd1Hzc5UQsfAafl+89jdFdGglAeCrS5ABtV73
         3sKkpKyVvMWEmgZfTFS8W0C+tgozEIfcYlFt3GeJMaARXsuuXm3fKrVYwsZukwE9bvAk
         ZQiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979915; x=1794584715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=PVCIfsqAf5aued+4UX32Kej7j7opbHVpjVXl5FZhp8j7wmRx+DasE0lzqCRuCo3clz
         qpbZownOonc5iRdpEU++sYYh99mbKPzkdcUIBKSCWol08MUuBedGLqibNKlos7VlUh8r
         7A8x1Glzqk56FB6vNv9Ay8IAYUnQcclrwpbPUNZyW2agundbnQWocEB+qhdWhxiy0Ggk
         OlnGvRba4fyzYD+DqcHCtBwKjxZ+t+hgEhg38kUVvHd2alHoa4rKFCAGAJ6as4EvXDZb
         MrDVN32K6YE4CsqwBhQfmd3ez5azKL4hFjGjVZyDnPpHWxOysMEkGFCjyPG47s4ObB3R
         evmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979915; x=1794584715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=RhTbKvdwTs9qtLxB01IbCwDY6jezWqqcbZpJzT/Znasr3pOvroxypRw07og3Fa0gDQ
         zty84VyvqbLbV0jm5FQIWqScKaPEpLjqwLvO5MZlL98/z7GbPywhgp5+zjXbIvoPQqWs
         J92jwetDnQXHOg9W9AgJsxRxUOrKtiu0BLVL2rPIsITjTf4eZKyVC59h1it44eiPSUKi
         RZvh/piz+CgE32UwnQhgzcza0khdQLGgayciGks3uN3XlclG65hsK69Ht+ZZ7ZK/HQjY
         U5esPDJAYo3TBG4mqqlqLTdmF4r4BC3YC5+cgikCdaZWkzb+iSkM8C35xwvoLu0othXV
         oGjg==
X-Forwarded-Encrypted: i=1; AKwUvBywn3kV2jJw+4AhPGjgvnq8H1+EexkErZpmXSQb9rmcPfmk/STKJz5DIM0h+O5OBCe0Dar/3BCdkNuS2rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eDX5YBAGBGwZbGHus0lvzkTlHajn/OWPDwOHdpgxY42Q1K7Q+
	Fm8mBMsaQnzPstpKAtkWUMv3DxHaY/AHk0zLIxMHC9NNdJaO+qYemCgL9mVKfBV6CeL/VjmjTsb
	3+z0iQt3IZanzOKYbF1nXDH0EqB+RJtI=
X-Gm-Gg: AYBFou3tF7VwBvocrY0+jM0+uhJt+Yu1IQLaZDcLcNuVBRdplbwYWt7eQuN6q9Kf8tv
	5oDJTo53R2hAz/knfbjP+TLYdXp2kt/pgWNUHX3+AWzuke9yiSPO9NUk9kN6K1KMHI0w4v69FeJ
	e/V5gK1V9z200vn63JYQZg/ZHAiEeKW6TLxUKrxvRBsM/raVblzaK6WaVlcne2dU8pZGVpXd9Bf
	r31UnGZRsEXTzeN49RsJd8nlqZ+/fRpv5Frij+AYNpdpLQTo+ZJV0O5a9qx43bdccvq2SPWjtgc
	CUbra1/3aEvxzflgiUsQFtP5vC9Cg0UgxUUTh42X3rzxLNitCc4uNCMlrpSoD+mOQ3IwNbiuR4z
	MXYwNr7z7g1ZMRappR6/gsqHu9kgCcSV1guHRJBI=
X-Received: by 2002:a05:651c:1612:b0:3ab:2a19:8624 with SMTP id
 38308e7fff4ca-3acf3a11804mr5879131fa.5.1793979914945; Fri, 06 Nov 2026
 07:45:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
In-Reply-To: <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 6 Nov 2026 22:45:02 +0700
X-Gm-Features: AclHuK-XTflrXNbXUwnG9Gy_4IC-jvOmhlr3UlYx53CWnDfOKCsQP4T4U6VaP7U
Message-ID: <CAO26r3TMHb=YxzwS7DYDUTS9U454zrq05yC-b8ojva-pAdCsRg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Shuai Liu <847807867@qq.com>
Cc: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:53, Shuai Liu <847807867@qq.com> wrote:

> 1. clippy warnings
>
> `make LLVM=1 CLIPPY=1` reports four warnings on this series, which the
> Rust CI gates on. Three are `clippy::ptr_as_ptr` in the IIO abstraction
> and one is `clippy::useless_conversion` in the driver:
>
>     --- a/rust/kernel/iio.rs
>     +++ b/rust/kernel/iio.rs
>     @@ -202,1 +202,1 @@
>     -    let priv_ptr = unsafe { (*indio_dev).priv_ as *mut T };
>     +    let priv_ptr = unsafe { (*indio_dev).priv_.cast::<T>() };
>
>     (the same pattern at lines 334 and 397; line 334 is already inside
>     an unsafe block and just needs `.cast::<T>()`)
>
>     --- a/drivers/iio/position/as5600.rs
>     +++ b/drivers/iio/position/as5600.rs
>     @@ -133,1 +133,1 @@
>     -                Ok(IioVal::Int(angle as i32))
>     +                Ok(IioVal::Int(i32::from(angle)))

Hi Shuai

Thanks for catching the Clippy warnings. I reproduced and fixed them,
and the Clippy build now completes without warnings. I also replaced
the ignored, AS5600-specific example with a generic `no_run` example,
which is now compile-checked without being run.

> 2. ignored doctest in the SMBus word helper
>
> The example on `smbus_read_word_swapped()` (rust/kernel/i2c.rs:841) is
> marked "ignore" and references driver-specific facts (the AS5600).
> Ignored examples are not compiled or run by rusttest, so the helper
> currently ships with no tested usage. A generic, compilable example
> works here:
>
>     --- a/rust/kernel/i2c.rs
>     +++ b/rust/kernel/i2c.rs
>     @@ -841,8 +841,15 @@
>      /// ```
>     -/// // AS5600 stores the 12-bit raw angle at command byte 0x0C with its
>     -/// // high byte first, so the SMBus (low byte first) word result must
>     -/// // be swapped.
>     -/// let raw = client.smbus_read_word_swapped(0x0C)?;
>     -/// # Ok::<(), Error>(())
>     +/// use kernel::{i2c::I2cClient, prelude::*};
>     +///
>     +/// fn read_hi_first_register(client: &I2cClient<kernel::device::Bound>) -> Result<u16> {
>     +///     // A device whose 16-bit register selected by command byte 0x0C
>     +///     // transmits the high byte first needs the SMBus (low byte first)
>     +///     // word swapped.
>     +///     client.smbus_read_word_swapped(0x0C)
>     +/// }
>      /// ```
>
> 3. repeated unsafe blocks in the SMBus access helpers
>
> Patch 2 implements the `FallibleIoCapable` impls for `u8`/`u16` with
> five near-identical unsafe blocks wrapping `bindings::i2c_smbus_*`
> calls plus error conversion. Extracting four small safe helpers would
> put the safety argument in one place and turn each call site into a
> one-liner:
>
>     fn smbus_read_byte(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u8>;
>     fn smbus_write_byte(client: &I2cClient<device::Bound>, reg: u8, value: u8)
>         -> Result;
>     fn smbus_read_word_data(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u16>;
>     fn smbus_write_word_data(client: &I2cClient<device::Bound>, reg: u8, value: u16)
>         -> Result;
>
> For example, `io_try_write` for `u8` then reduces to
> `smbus_write_byte(client, reg, value)`. Happy to send the full diff if
> that is useful as a starting point.
>
> With 1 and 2 applied (and 3 sketched on top), `make LLVM=1 CLIPPY=1
> drivers/iio/position/as5600.o` builds with no warnings and the rusttest
> doctests pass.

I also followed your I2C refactoring suggestion and added the four safe
helpers as methods on `I2cClient<device::Bound>`.

Thanks for taking the time to review this. I'll Cc you when I send v7.

Thanks,
Coirul

> Thanks,
> Shuai Liu
>
