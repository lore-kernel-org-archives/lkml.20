Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1848032B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842046; cv=pass; b=UBy/wePg5T7whO3C17RyPPtPDBWKg7YaAwujLt9hTNy/TfGdtdTRbmTTvLBPuqJ7n0QhCkM9VftMh7dxTT4koJiIERozZwJ7iORPogcK6uWXSEVavOkbQff8e6rJlXjOi5DJFngtJgMapgoh6t/d0GoYvyFoebqQcbNk7zMgtFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842046; c=relaxed/simple;
	bh=UyNAutr3ZBqr3zw4vZvqNGkd6aojgPH2Nb7YhuynXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuPYuH9lXW5tauUHTiNUQT6u8l6j5KQZp5JbbeBLkvZtjy+4GPiunll4k2FWMpqukQoswGdYrr5VSyTbKCJDh91yvU0lEa2bUlCvJWmZHYWMbHtEe2imv+kyaYsIhPK6o5D9LRYVbciCxo6EYN1hDjbP51dQ0jFM+V6qZOw33c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTituS9x; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTituS9x"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4a2ef5ff1so219066e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842034; cv=none;
        d=google.com; s=arc-20260327;
        b=P/E23zvS7EKP0l+eWwbfHJxaC6QpiTloBmFvICuUn+9+8Gsg5o/Lb2kdtXO2ATBdCI
         Im0bUtd+9Th+b2okjW1Mh0xnVYApNZ+gQrFbE4vmeUPvgmtQv064TW5tkWj1xwIR8p0+
         poRzSucoOLwPX9BjVdOWqFTdsN/yRVnBrkGQf8pw6aLd7JZqCPNxC1MOC2N7qKDSn/6W
         H2rfBwdirNzSd78AlLWSuwvl2s/HR1ltiJicU73hts2+SLTsBfxWFtbN7s1joHx6SVfR
         iKN5+p85E0XBjRBU1EtPrh0SaZAgT/maCQ/iC0R+eX6JeRu4fCBjxUVQTgaMR4pP4fnR
         4tRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        fh=jXMOi9H2rPfaNSBSzfpyD56TtrXRYsRgdxlXFEdvrkw=;
        b=jZCUIJgsCx09KMTfkCrVMPX8WzXRc/k1Xksoz3ftq8uAe88VlyR0PRuFGhXC783zbI
         gho73RS18ZQ5/uWso7IW8U6HVbV4HQj00BnlP2g1ZFn8zhfHVqw8yigABDl3Twv7YjsO
         9lSMWIOZGSGbAox8e/sHalBGdYyxh96bpx4YdAIok9U5q7hpmA0fLt7PKYEaZqX3qER6
         LtLzqDw4mUtwxhGhAKiU7knR2Pp804YI8CvNAViI3SgtJSe5aV4VGMOafo/G9CjspiRs
         R/J1bE88H2Rh/DoIKMHlDcmPXntrJFKI4XsO33QazIyn0dbCKLhF1o1IDBXvf8M/30yG
         lEkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842034; x=1788446834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        b=bTituS9xr/yXNciyLAZtTMQdu8C3H21kfPJlFuuk9AYtE8aCx44MselVEtMIS/Zy1w
         T/r9fVIX5RZfNNwW0vNONCitDBdGo9iK1dLJsOEFZx9Al25xsxixVpzWce8xfefUClQ6
         Psh3z9OfUWoOKGg5X+070xyJ+ji3qdux7f6ai1S+HSlowa1yz/2DTToYuGoxMVij1K4b
         Lx8zkZEjYiSUB+fpIcndNJnGc6bn9j2t8SqfsQVusCB5KjgG+r+Z+1ZvGp6DK4vK0nLC
         i/xLUjYPTmrHSYCwarZI9TyfWWg1ZMo9iLMBXTE/dSsbsfh5oW5geT2Y+Vg7XWJOIcUp
         L08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842034; x=1788446834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        b=bsa3P3A9+qm5DrdUXacIZOJnpoiluoSgjwjyjWXG4kTos0fyBD5owVMu9YpQxpVF8g
         bGDZNLfnH4hiI2+1ykspsoS+fJU+Tc2aqHa2nbIoyP2Z9CZaBIDzDDWLrfHhVTek+Plh
         F5/tpvFxo7UgWLNxlUx14+6n8KVyl4RbfitJGDpB0nztNr1ott9oV3rEAAia/QLIJzGN
         2o7/SQIkjhS6QJv6fIPmy+j6fOvZQRlfItphz/w+xPeIa7B4aMmayVUNw5FBC9X+EXW9
         uQLICHiy9QqtHk6XpLksy5Y5lHLeV+zSJ/9qIftmRp07hdnI8lP06dSqQKpzpFdOJGSz
         tJaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFZPzsQgTx9SPs0H6w64Zwj2oaYqVjHxMZZf09apW5BOn07de0oWnAyvM1KzeZcqjBVB4+p17EQuWPb7o=@vger.kernel.org
X-Gm-Message-State: AFuF++lkmffJdATvbvKGyIKjqLuRhBRunwUbDAa0csi+fPRk79ePqoI+
	+yYDtRdcMWIgLnOYgn8po00O1SUkcKLpG9pAkY/MhZUYLesv1BtWlquZr8HzVGcdJ0ffyOAy7Qf
	gIao/ma5NW5sgPCoIXYGFHXlCdWH0V4w=
X-Gm-Gg: AR+sD11tbwCeH/V9q9uo3bMq4unyB6JyDmF08JAu2t9EFRQ6Nu1uDdZ5+pCUGLF0Ecc
	lhqZInKiLBQujUFe5CpYmCn/b69t24PSJNVmXPCMiJjg6Sa4pPAyc7+isOojq0zu/qpm+0Djene
	2jAF91dh938+8wKBszRxqXxgD2XzbYTRMUV0By3yPG3dJjeWtW4cRsFOA04bT0YP+Zsc6hYPVKe
	ef30w0oujK//s3hynhfbvePBX2CvWSC1qVCxvkf5FwbgPNyRayi7ejgCLUyLGRPRiGpYU6VpZ4a
	YB3pD6rS+WJhzqcjfWozat3sbrOZyFFGemi7gp/qD5BRfm5cIH/w6fSo6N2MCFCkRH5WjqdMygg
	obv3pRDj3dsFMDf63k+S05ttjz2moT8aNsfpfLlGKWaWK5kLnY3o6aBlizrbU5khRh3/VK/E=
X-Received: by 2002:a05:6512:2524:b0:5b2:8f21:9208 with SMTP id
 2adb3069b0e04-5b4af8125bcmr1537133e87.2.1787842033712; Thu, 27 Aug 2026
 07:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol>
In-Reply-To: <20260827030352.GB2327@sol>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Aug 2026 16:46:55 +0200
X-Gm-Features: AcwNN1UsDJQr_7lyG3pHWuoyy3p3_nTOF3nxmpNZaHmXNVMz_ZzoncBZkrBRMoQ
Message-ID: <CANiq72k3COcjo1s1MXdh=K7qRcOMMSq7-3_JCMtNKN3J0zQmjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:05=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/.  They should be in the same place.

Did you see my reply at

  https://lore.kernel.org/rust-for-linux/CANiq72=3DuUR4Vo9W55Kq6tQjc+6Q4_+w=
iWhCo-VLdkvg6PJeoAw@mail.gmail.com/

?

But if you feel strongly about it, I guess it can be temporarily
placed elsewhere, i.e. Kconfig symbols are not tied to the path anyway
so they should be easy to move later on.

> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> > +{
> > +     memzero_explicit(s, count);
> > +}
>
> Isn't there a standard Rust solution for this?

If you mean a function in the standard library to zero memory without
being optimized out: no, there isn't.

For context: I added `memset_explicit` to the ISO C standard and
informally asked upstream Rust about adding an equivalent function
many years ago, but at least back then they didn't want to add it (or
at least in a way similar to how it is specified in C, which doesn't
really give guarantees, letting compiler writers do their best
effort).

I guess I can ask again since now we would finally have an actual user
in Linux... :)

I hope that helps!

Cheers,
Miguel
