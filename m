Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC723624C3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636166; cv=pass; b=NgqUExXfQsScCRsywygWu9VbWoRfXEd3aO9NmDJcn6VbWdOTo7Q6TU0q4a59YUXobjN1PmqRohMqmlbOnNrQFA01xiyD1lU2L8O9QmiDomGmMncsl4rUy8y3eo7ji6b1MZFiZta8Dt+ZYYqmxN62+D7iVm8z6xC5W5GITyFv4XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636166; c=relaxed/simple;
	bh=yF37/Nza90qpovsTyPIotV3GHJX8YLw3YQa4ToPG68s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUAUQ7VBf45wNBrIVnvT7hSxkBDYGjChVGGFDTX6G1mH7e+c1cblV8fa7wyAF7ZCM77ls0INb3CN2KRgkRMOiHHqfVrwkZ22j+qMexbjaPsjDs+Cni9w1KAYBcO0CzKHmfmNFNnLuiWNPPFok2ZFNp75zzndjGNpJnQIeQirOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMvQbhU1; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMvQbhU1"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso1433895ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636163; cv=none;
        d=google.com; s=arc-20260327;
        b=Cw8k446oW0YSJC7yYTG/cqDbW5RBGRenTCrct5g+WpEqHQtLA03rhhzZVS3OIUbJ/1
         XrwEx8YRoUxoqtQVfTzObBw48FN+NXNpyUZgR9Dz2mOd8km/pzdXMlqzNevk47gDN8pm
         Ld7wRV0q5xv1pdbxiSnbeQjURDC5Jkz860eGiGsQnimTfYcRs7U5Ist2gaji7dZsPvtS
         6ea1L/90aQ1wKlsyKMPVrkmd4KWXyn4Gc1vO1qoAZUeFILzK0X0LmY1Z2W21rxy3cw7j
         gBoPdIsisTGLBjBREHdrCI87vo29DpeAcwWmBwAtpuxse4HJegUsAYTbZUZSpUiIg9J0
         +l8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        fh=t4lVoO2m0ju8W+J9H1eceUFhzLs2VJafis47XYJ+yS4=;
        b=oGi8b5isNEljj7sb76ztRCjNLnLfOR4psDwbos1xSgknEm31l4v/Y38kUGAKOWI++j
         /jWbOeHJvlQQwa72BzVrwR3bKYz2sIAEJizVELG8x5hu08E+9WhRbLR6NN+vjHoj6X6Q
         yCSyGNj8bdaaiUfVC3dWIFXfZPHbvjq9bhIYiLjk+jKdNUfNhETDEVUnnyai7PSw2r2k
         v03uXMZkcmcJsePAL1pBspZQ+TBVqhL3nAnqVubUt17L6mTEMXWzDoIXZu0pdpoxeNxo
         6m626IFk7YtuqYRH3NDAnbLDQtWmM/sBr9dbMiKyXhw5hCyKSW76moLv6YezOoL+seRG
         xrsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636163; x=1789240963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=HMvQbhU1ti0n9lhueEGhNyQx907yj3lOqhfVzjDLGcQSZrylyPwIksCdVGBnS5fjxQ
         Ky+QL1eYy/+KvbGivmYxs92NSxDf3EEStVYzb7zE4zp+54VGWoqw19mW1jBOXN1sexJM
         GPrUyn1uxTXEXgjiwJtQrJakwF8o8XDRf3UoeMqS4UDqyuLWERRvFvN4r3BJrzXXJ3BH
         W5aFM4TZmP3BJc3S6P4faRBpMptLTHIeX7wjRgWS7QWy1btJkXqW6bwhvmsz2dobFn80
         OzV6OPAcu8CUB8IKymu3MBqbLuegon5ZKiE0IArK+2TeE4PjNxVaHEBpCB7YdKQMby4d
         bB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636163; x=1789240963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=bPCMKwQftZvKZvZrHj9XxW2mHgva/0JFYwviBoWXapSxfKEUZVM4/dm9G6Jfuvek5U
         +JvER6KEH7TV7i5OBfs70Zmg2PUceRPxn74FCimXmQfJ8IIrFtYG+PYm227mOb2fPG/u
         elMNkApWbIZ44LlJ0s+WezpOJljhYYoA9cDfxadwUI0d+/RN4Joo77wAyPFMcNaFmvSG
         u/7G1DjHFnpMczYQDlSjn8Z0dM1/pY577ifXUj56iMpmmQaquKX/ZhPED4LT01v46ZEQ
         5eKupqnlcjTJ+VS9KZWkGlBOxR5CTuJUrb7DdeWayre537Ljkwx77A/hpfnEmjuftT5Y
         c9Qw==
X-Forwarded-Encrypted: i=1; AKwUvByotr1JTfQjszS2K9WkcEBnsFVtL+0FDb8jAAHralXtY1UVSj9OWom7Ytw9Xpom45H4/H+lSpDRB9TcVr0=@vger.kernel.org
X-Gm-Message-State: AFuF++nCBm1ul+poMi8FhWnh2zt9tSQ29HxEIujB97G1eKZWVIQgq6u3
	Oj0id5t+df7wxKfDVq7akMcGWmkhKqIbrNGIj+gPqu78OV5JhmMmtW2jKoskx/WFX9IL7YgbTie
	9Blft5pAMSBWeHSyjpWXX1d/dIf5JQIc=
X-Gm-Gg: AYBFou0o2th5PZQGIYoKrN7Yxu5VzTXMVKh1WJaeBVGe682yAhURREzOHaStLv0SWop
	831RFthXkDPcom2N5CJ+twar2edFdf29SLCY/LjpS7ZXMymXmDrVTzR/Q2OAIO49vch4pXET5Ud
	1OHQDwlIeCZU4ZXpdef8B7qih5DBygD6GD4tCrBMIdfQ+kMoBnNIoyNyTOZah/0VzwEirkpnGfm
	/ZTMmLspLuLVx+Q/hybbeLzapGp18Fj12NxbxNXuzU7+RrNvxNU638DWfI+K9bfygA/VTAwitU2
	zFdIrO2Dqnd8Lfk+s/sH+akeGv/WUxc5oaMKTqvvoitSzF9iAEXOJcKTHOZzjymZuZFfPa3yRqJ
	TbWNnSIk3g2+zMUmKc4d85BFVySBNEiIWdF8D1SCqhN5dWQ/hbww2HnIVYJEJ
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr7470429a91.6.1788636163260; Sat, 05 Sep 2026
 12:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:22:30 +0200
X-Gm-Features: AcwNN1XYNGZeZdAbyqW_MpHHmRnUCoTfhvfgQ1L93n760L7NneO9Fvtxk2YGC7Q
Message-ID: <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Convert from `Self` to [`Self::Repr`].

I think [`Self`] etc. work too.

> +/// - [`Self`] must be [transmutable] from [`Self::Repr`].

We say "can" in the `AsRepr` one -- we should be consistent.

> +// SAFETY: `bool` has the same size and alignment as `u8`, and Rust guar=
antees that `bool` has
> +// only two valid bit patterns: 0 (false) and 1 (true). Thus `bool` can =
be transmuted to `u8`.

`false`, `true`

> +        // SAFETY: $unsigned has the same size and alignment with itself=
, and is transmutable to

`$unsigned` (a few below).

Cheers,
Miguel
