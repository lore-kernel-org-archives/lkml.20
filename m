Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE841D628
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030454; cv=pass; b=J1dM92jtYIkPaSzjNBwzDxg69gELIKVVJvupHe1N58q8mqHOpVVY4+P7BfwZ4ESoSEvmMO9OxCUEkdfzrV45Qi4CEBvzlMeZsCbY5f3SmmMcqbkjfznjP8s55R09Msm7jADhAHhn2PJrI/epbSxj4UDgBijwEJ9QlTYgm3qpEzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030454; c=relaxed/simple;
	bh=WRC2ZsAZuRhunv+s3RLF4cY+obMu9wORkIop+4QLO34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENA5gHWoqfLLTpqxhs4d44QcgfT8qfCEqBnzBvHb/JeNuZAeQ1qxm+b4cQMr5CpAThYWxyzipWPQRnSh42sxxvVxDHwzrmyf99by+dqHKLi3hwCr8ZRzt/6eDTunBaVW6BUMxdRD3dWM4JO6s6F49jd4TglO4n41I5J0a/TPYYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjSNRv0y; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjSNRv0y"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so34405eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030451; cv=none;
        d=google.com; s=arc-20260327;
        b=TIjwX5iZHFGnlvUQenehw+E8zizMG5jz5444Bj2Sk8UBHpIAD1pFT+8sW74+LlERDs
         PBMy7lBjjLDUxllk2KbOzhq6uFx+rfxaDPawbEjIAXCtY1piC9ETFXJ9r+8FbJ7aqs3X
         FQEo4QBdL5BctQ2yqJx37t06ct92PS86QfEfZjg7zS7SF4yusMkYzySGduTbdtoeg/6+
         KSmcPjyZhtIWQX6Z6UL9ycTHP7f/7Twmx2AzIaliuc3qF8hlkCCfOIgowwNdY7uJ852d
         MaD0AKRhW+8qqQXBV2xsw/rc5hoWrGfpuLTDEV5IgAuNw6/cVEdVoVqMlw1tRu1KbPkz
         I2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        fh=j+gbe51iuagLX+HMzhl54wA1Ckn9iVC7zp5nijVVOxI=;
        b=QdKdwYFCnxwcbM4JNkBaD3xSAtc6R6u/UETHjCGwwo7ABZBbELKiXksVRluzobjCvN
         xK1Hlzps3ReUdtRP2GfUyrLlAjCzUFPJimTioy9v4IoTTQRjtauO33oUsUiXtAONJuRE
         h6S3GomFfLM6smHgcdQT+IHLPD5wFlEa7gwKU20vACYhEOZRlRn3+MCvkKpQ+b9tfiE+
         snLMN+jwjK2oHBuHAQ6QSnrqgKsll6RzYnzETC5x4jSHHbHelaijqxAov5fY95siX8Zi
         5yCq6D+KYvNt8wET+QFMKLJxC20Opw+FaZncE5S6r4XLP5jXEfCQubEOrkodHBfnR/ws
         g07w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030451; x=1791635251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=kjSNRv0ybOUgtC77f6aGwITRN702J3l+Hqyl2QHaEz4kol/+imfE1dT0Yc8jftJV1e
         RDwJpue6M/tIRgEJR3eu9jW/jHTRlgwnLXbkkGKRbCjXJJJJ81JWp8uhCJdUxYBWvu7a
         eool3WFVRL8pmu2IbNUS/c2S2PZYyUzx5Z2kfyqr0BAvYN/f/zLhvtbja38+F11Z7mCr
         9aWVbi9Yq0I3lUqf+qG5gKQDqnfc15VEqmj6vvRh2BwB68hcu5xtCYrTUC/20eOQNAjm
         +58wN7o3GTdIXAN63+xW/1Xxz8kiNuGExFhPa1+QNyde5HqSHfdNCIsVpCCn8Fwf4hoo
         p/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030451; x=1791635251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=NzHsjlaqTFedfh0uzuZVDygWNPv56KfJ/yCxMdsOcEnCye+uWj1Q9aMJQadrLFKVNe
         RZN8Kv6ARztTFUSegcnM6qcBS7d1zgI6jheLqSmlE9fin2hUKVecInHMBku6bVEdBfpv
         dr/ZFnC3zsTY9os1TTfs46JnAr2sQQ2zeDRMp/ppji0XGbMRJZQ97jzb6WTGdM7YC3m9
         M8TFXtOnTniBziXqBR0q+oVm8SnPA1XOm3r61WB0FRiInL0vC90/IDG5tugfsI+J2WEY
         /yfDbq/BRqLfRc2cmUhCxKtt4m5EVNwV00i5XNZ/Z31MgRyfZbv8QR1v3YCm9ASLUuvv
         QhMw==
X-Forwarded-Encrypted: i=1; AKwUvBw2THzSCMVXEfOtRE/CbRH8roAVHvu/U4GQdW2PHrURGRjvZKptXZqpJDCNCKpOVl8YXY53bwQ2ySmgQ30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUY0OqvdbBjs2GvKfFs8iOkejNucC47jnWcqdVl9+6m1ni2bd5
	+tpmIKarJCuw+ytf+LpfqQk/8Y/SfV+1EOKIr0oGTO2iyAfMHtYhlWAk4XCPuymcaY7s6KEQ4t0
	bWf3FYIGuQB/SoaVwXfVJkmpud+6djCI=
X-Gm-Gg: AYBFou0TG/vSgbtgekj7nEQC9GH/2WM2aNzHYF5ge0vVkubPdxFvb7pQ63vtN0CWyau
	VLoivyW4kNxkn3aPqujtXp8RZfAlSqN5Z+b+i8MrqzGaeXs0vCo2A6TUgS5pJJt6K0WgCZ9bjIf
	BG9wL8k41bMT3/fBKpNBdrKq2ZGMxTY69aECyeTC3Ur5kMTsxeW5UYQ5ypEdgFsI0qrskykLtjn
	UzVJUd/VSzM3OFVIZU/4MrW3LSrxbp+Cl50srfnG7qekLDohBtoblo7PsleDKhDMLnNREcW85Kl
	DFXjMyb0M42f3yqyQsTGAJaHazkqJ+PMymfbYt6jjCDgeNoWBmk/RKheoSgZl6uN6KFSNuBIRhw
	t+J7mx2PnzWrlM5aIh1vcR+KnWYfzBhlvbBzFftkubODz5tMuWYDO7+B8xDTxtPxfacUct75+iF
	0e2drDLymHyB9aGZ/mueyEjhGCAV8IUzq8/G0lFq196x/+Qz0sBOk=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr10692389eec.2.1791030451112; Sat, 03 Oct 2026
 05:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
In-Reply-To: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:27:17 +0200
X-Gm-Features: AclHuK9DwEiR8riAHJ99e7wWWIvXaYD8TEoP937-DUXdEOHBiBspgOjN68JgAw8
Message-ID: <CANiq72nAhupkFYjRxEvpaDw_CAFZaSSdDCKFjG-3r3PyouEs1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: doctest: unify with other kunit tests
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:00=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Currently in Rust, kunit tests are handled with `kunit_tests`, while the
> doctests generate a lot `extern "C"` functions and invoke them through a
> generated C wrapper.
>
> This is currently needed because of the special treatment of file name an=
d
> line numbers from doctests. Convert them to override `file!()` and
> `line!()` macro instead, and use them inside `kunit_assert!`.
>
> With this it is possible to just generate `#[kunit_tests]` and `#[test]`
> for doctests.
>
> David mentioned in [1] that this should route via the Rust tree.
>
> Link: https://lore.kernel.org/rust-for-linux/e30d16ec-f5a3-4cd8-9b25-96e0=
dfa8b9d2@davidgow.net/ [1]
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Removed spurious `///`-to-`//` change and adjusted `line!` to match.
      Added a comment to match `file!`'s. Made `NOTE:` more precise. Reword=
ed
      to say it is only one doctest being updated. - Miguel ]

    [ Removed generated file from `rust/.gitignore` and added it to
      `scripts/remove-stale-files`. - Miguel ]

Cheers,
Miguel
