Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32074657FE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195906; cv=pass; b=je14rF0B3hgtMA4S23opcciWbG6ve8Iyn3PiJqkxfAJ1A5AS3eQVHcKAeD5O3D2jgvbLMtqYxd4gaNh8lqJfaJR9XFLNS+WUiA6vlm6b0Q2YJVzCNexpEodd9h6Ti4Ln3AH3d0hFsR7H8cVYBE26q15Uy3NDu1xwwFqjvo+wais=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195906; c=relaxed/simple;
	bh=wbusIXCi4IMQab0ryvgkHW5sveBwQ2NlPsvZNTV8bzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQG2o0aXrsD6/H+VQTK3w8UKt5zeV60pWrfV+WTfZiP+tOupdxvWHW4afxRzLPj4HgGjTXWNNltY51ZmOutqJz1EbND71l0iUrREk0k9UKJjVP+VIFFxs3o3CfNZCAySzy8bKWKKgcKIHJkYugBJ0r5KWLuWFRAuYmldUUtQDt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ln9WvdPm; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ln9WvdPm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66d29b298a4so66843d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195903; cv=none;
        d=google.com; s=arc-20260327;
        b=W7X8bIJ4xUjHZInRE9UJpwV918RVlJGzhWEZ63sJEgbZ3+ALWNNTgJnEx1VuWqglJE
         uY0NtaMMmwRRp9+4J9lFKBVr9iQGj3dQYPg4wG9+ky+t4bYxl7PmG8ujXRFpC7iJ0l+V
         1lZTDRpQu3NItJEvwDXFHhMrYewu325Fk9t+KVrkl5M8mf6C2kClyjQQKjf1tGljgPNr
         r9lRc/Yh6FBsrlFbjLbbmJSI3ckM9qbf7jKFeQaetVTy9mt01TJx/RhhnuxxsYNbsKoG
         FgeDVVdGeQv2U+16gAZXRd5Vf8uPB09c0BmS69DqdypL66NQ4rOufQLHGxpd/rGISRLi
         Fgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        fh=7qVx2iUOI0PUAW1u7fTViRkuBw/Ye4oWm5GlwTASvUg=;
        b=W73AziuEp+iYXd57DBa+RkTcNhuu7PD9Q2UiI2EsGBceJkaXvdbATa+xQXtgRL5H86
         i1MAMrm/QDHSc+euLYcUlwW2M6FO1HIsZxj8IiOnmjYXTYqzqj4UtW/ZHiqH3TS2TZX5
         4X7/7frqTqZVpr2OM9pNVfIS1kknZA8+VgJRKJgJhhyzda186CmK77SAs7SyLJ382d8+
         c7evxcwvRH1wVQGbZgGZ6nX7HIR0NlXjKCeYMBwCWWp0IZutilHjObono0QZ9K55g8ig
         Kev9619JxW5Kn/Tx/mCFaYTW5zOuQBtR68Bb/BgyBqvRBcdIjEDvCe0e4uDE+WzTN2PW
         kEtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788195903; x=1788800703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        b=ln9WvdPmeBNhNUZ6fj/wYeV8PAUd+OOikVvvRh/TvI8UpVlrRIuAPwGrUwSiRT39VB
         1rgL4D8rGyjLT2v+wfQSogdk+ZLRNpcXC3k1R3fEX88fY7O+0BYypBFJCTvYBaUrZqkV
         H0/0xZzWQU3D6cflNxwxjDvWeLr8YbV6hUVP+oXCD7DHiC0tCbCVWe4r0egl41c8OCVF
         xY2bPi6aD1bUlT8l3HVf/hSbaYGz+b5ioXh8zrwieUge3TGl4C0dGJSggeu72Zpllnes
         MyCGPiBiJkSqjT9h7YuiygJNmbf12RMTjzRSpX5vLECVBkLDyCVnL62F6fXpx94itWwS
         dkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195903; x=1788800703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GfeSpY1O8MwrGHI//U6PaOM8wrbbu+iKMbpJd9vFVOw=;
        b=KQKsrzLxf0NphDHqFX/GwHXUjsgMliVa7xgfQiOqr3e0Zpa6Yq8yq/xStDUtfKDg0T
         8+Nszppd9IaFyAQmD/qtJeUywku07NBxFe4wQO6qxfSoXzMyfd5qc6HfdZVSVIG3si04
         KqlcSQWHu7p9ObvplCi6BxIVDWSQY+U6WeQG+B7Tf4squedIoq6me5oQlMUHfpfuHD6m
         +wz8JvyS6hxpPDJOvPG0ukCS7AIpMaKCsET8AJB3aMNLhiLH0V1H+hcj44a7OTerBwkN
         s5TWfoYfS8cb51l6xq7+DyotVWDqyulQahKQwuKjEkhFMrEcfgnan4oq1KHGKGtQauxj
         I1YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh1JlJysLIsNYgbU9drWaGr6AEHODZ2wkBlP8OJM0xkEntr10eiS7iNghHLIgLElq2jigtgXfrf7yhnbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k2dqpKsX+SD8szS6oN+og7TubYmsN+igkfKVHNQI2P3KV7Ujhe
	x3vM3akFpxOVS6n/mmHledzFddrOkO5tJyvs//N/K9xmuVwC/enMOCMLeJAGNwUA1EsNM/m8Q1c
	BDS6IQLMU93wxyY4vk61fF6rW+5qfCXrOzxfLER1C
X-Gm-Gg: AYBFou2ZpaSvfzEA3ZiHe1Gu8Bz/lZcO/IHz5fLuobupnfvAFShA1KfqdHfHSerUYdI
	NeFqOXvKo4sZ8WdRQhZ6kbrW5jD6/nLMGY0KZ2e2sW5bopRb0CVWZ8grfmcPT+tz6u9gkE6Rp0i
	surUV0sxc3aoj3Xn1W656D4A2ppHzrwfphxdKHd54CKfiDxdd+VLYtkci6umNnKDySlWwK4ZtGM
	zIFIPBTN8EOhzuHp4fq++3uItXCHHOqxXULoFFB51rVQKMS5FN244OcwvxyZaPf0NPiVlkQ8I0o
	ExeKgpq9i6SFDPiwtOLOQGIWRy2DDZVB8MEJh29XHXY/jRFTamgd2jK0SNVcPZ/heMBwYc3uEPB
	LffxzCU+dfddbSRZi7TNMrabzUc4lWPe+owa3NhYtoRoNDg==
X-Received: by 2002:a05:690e:4512:20b0:66f:8594:b85e with SMTP id
 956f58d0204a3-66f8594c483mr815185d50.2.1788195903415; Mon, 31 Aug 2026
 10:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol>
In-Reply-To: <20260827030352.GB2327@sol>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 31 Aug 2026 18:04:51 +0100
X-Gm-Features: AcwNN1XRUTonc9UtClpJ99JQyGyLSWDpm68a2GF558801nidk82gsfB0bRqsHB0
Message-ID: <CAHbf0-G7aHw5HMCMfpABnFUpvLHz5R6d7zmyite9xAqzMXJGvQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: ebiggers@kernel.org, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, Jason@zx2c4.com, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, lyude@redhat.com, gregkh@linuxfoundation.org, 
	lina+kernel@asahilina.net, bqe@google.com, ljs@kernel.org, 
	joelagnelf@nvidia.com, ynorov@nvidia.com, david@davidgow.net, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026, Eric Biggers wrote:
> > +config RUST_CRYPTO_LIB_AES
> This is being added in the wrong patch.
[...]
> Likewise.

Sorry I'll get that sorted

> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/. They should be in the same place.

That one isn't specific to these two patches, so I'm following Miguel's
reply on it and I'll go with whatever comes out.

> If you need RSA, then please just create an API for RSA specifically.
> The crypto_akcipher abstraction has never worked well, due to
> differences between the algorithms and various other reasons.

Will do. The generic akcipher wrapper goes and v4 has an RSA-only API.

The only operation I need is RSAES-OAEP-SHA256 public-key encryption
with a caller-supplied seed. The seed is explicit so the driver can pass
the kernel CSPRNG while the tests pass published deterministic vectors.
Would you rather that was a narrow Rust wrapper over the existing rsa
transform, or something in lib/crypto?

> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> Isn't there a standard Rust solution for this?
[...]
> > +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> Similarly, isn't there a standard Rust solution to zeroize memory?

There isn't one in the Rust standard library, so the memzero_explicit
forwarder stays -- Miguel covered that in his reply.

The aes_enckey_zero one was just wrong: it could have called the
memzero_explicit helper instead of existing at all. Miguel said the
same. v4 has one safe zeroize() in the kernel crate, used by Secret and
Aes128, and that helper is gone.

Mike


On Thu, 27 Aug 2026 at 04:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Aug 26, 2026 at 05:29:49PM +0100, Mike Lothian wrote:
> > +config RUST_CRYPTO_LIB_AES
> > +     bool
> > +     depends on RUST
> > +     select CRYPTO_LIB_AES
> > +     select CRYPTO_LIB_AES_CBC_MACS
> > +     help
> > +       Enable the Rust bindings for the synchronous AES library functions.
> > +       The selected C libraries are built into the kernel because Rust
> > +       abstractions are part of the built-in kernel crate.
>
> This is being added in the wrong patch.
>
> >  config CRYPTO_LIB_AESGCM
> >       tristate
> >       select CRYPTO_LIB_AES
> > @@ -216,6 +226,15 @@ config CRYPTO_LIB_SHA256
> >         Select this if your module uses any of these functions from
> >         <crypto/sha2.h>.
> >
> > +config RUST_CRYPTO_LIB_SHA256
> > +     bool
> > +     depends on RUST
> > +     select CRYPTO_LIB_SHA256
> > +     help
> > +       Enable the Rust bindings for the synchronous SHA-256 and HMAC-SHA256
> > +       library functions. The selected C library is built into the kernel
> > +       because Rust abstractions are part of the built-in kernel crate.
>
> Likewise.
>
> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/.  They should be in the same place.
>
> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> > +{
> > +     memzero_explicit(s, count);
> > +}
>
> Isn't there a standard Rust solution for this?
>
> > +#ifdef CONFIG_RUST_CRYPTO_AKCIPHER
> > +__rust_helper void rust_helper_crypto_free_akcipher(struct crypto_akcipher *tfm)
> > +{
> > +     crypto_free_akcipher(tfm);
> > +}
>
> If you need RSA, then please just create an API for RSA specifically.
> The crypto_akcipher abstraction has never worked well, due to
> differences between the algorithms and various other reasons.
>
> > +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> > +{
> > +     memzero_explicit(key, sizeof(*key));
> > +}
>
> Similarly, isn't there a standard Rust solution to zeroize memory?
>
> - Eric
