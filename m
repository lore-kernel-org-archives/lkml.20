Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793464679;
	b=NzEPAXWlLIAK/dUoOM8BElF0kzeM53EUgzkTdkr2OMIRhFZw0Cyo8j0/DQcDoogde1HJ
	 Vl1LAo6REPAfMf1IFim17gGCBVkwIKgh63nu6sLe5GrWWTYCcYnOlIJPywbCVXb3qzP8v
	 stwlV8sqjBOUgdVZc6Z1PQ8lw8pqA5Wm8XZuL5RselhTwNPGoXBRfsO4SIIAabT7bjPmN
	 Cmj4yos/UQQ6z7XinzyxFiWU58mBaiI6YZE8qA+jeaz/K31Lndjok57HAfpWdGsAeXxPW
	 6ATxfbyD+ZIycqYnW2YWnLh0DYOdk3GHqXoUKayJGCMNF42xB1APyom/2tzP+XONukw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
	b=2/8SGoZxalhqP0vMsrSs+Me7/0e5S2odBgJlRhX801r2n2Jx0ekiIKiqEpZISEH0MOB0
	 N+oWPWM1xUiKtQUwlUQR6PnjrhfABi9twwuIISSJlCAf7G9vFAvywub/FhldaiFIKG8qB
	 WM3yCC30ETFiIChjFJYKpeqGifawIM8j5a+/d0r5ABpDbanfFa24u7U/5e1Dmzrzi98B6
	 3f5alpnX78GzAakjCc+EnA9VmzG5b3hRsZQvY6xeo+BNmdZj9UKcNHCicym8Y5QCUP7GD
	 0oqJXyhzlBhQ/KU6PogKNTGPfWfGeob3G+80PzXKlZHHfEsFSFX1nAl8u7IuNHUFflQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aQ66LJVH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44215606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44215606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aQ66LJVH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16652895e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793464678; cv=none;
        d=google.com; s=arc-20260327;
        b=JDSZjZ/VeWpV35FCAZgovLy/BObmKLaYCudFTS9wT1L0Z+0MkB4o1J26oFbD3EShKX
         7l831A8DrpYt3jhK7xC3+8RnqOFlEp5p+DBMWtnxJZUpGTC+rFlhT8cKjHniT5D7bMOQ
         vqxg8KPfQa3O26CXZ1b9w2YmmgLU918HVS0pHydSmfXgcaOhGxihWCTCIlyj2CVBkIUO
         iMSafqKJ1C8+h3ZyMEWPTM/ScB5HhFsNQ7LQ7RlA028S3xHnKUrlACRh3mAIiNuzEUrN
         cR7i6ZOIUjrDgPi6wJE7QNpqT/TB7VN4OeSWHvBd5J6bW0DBjrQSoxZ/LZCaOwcyz6Vy
         iOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        fh=9qF4qsn4QC+G7eGNKoCt5sSm8p50ejVwNSuRsp6WsJs=;
        b=qB+yvLCEcirYh9EhVixc52ZzHbQoT4OEyu7/SvlgD8Kj3lqOJ4Kl4uGcOgHTO4NhEG
         tz4lJb5XuoMOicWQ+XmACrrf3kiUP1h0eG2SsH4R0RN3qD3QXMd00LykKMTEQlO1U7XS
         FB/pLZG1q3mRGMu2CSoF624/bv1hPemOdpf+foWkO567T3Y0QZEuWviYyp5fQ2eBSNKu
         UMUoydFHbM8Y1UjN/+9s85SPo8OCANGuUdCshL0MwT9I8MgQi8MIJiZ60ZukAbvaL9jh
         YDTAIeitT0nO1jxoVEGpr9sjIf8LmgyVVEV6bld5MHxvYaAmUGxBCZ/vW7uonENd9S2m
         OnwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793464678; x=1794069478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        b=aQ66LJVHa45dKPfND15WpLhtZXSP12gQFKUFRmdpv04UfYxD5t4mm6VdojacX3Hdsc
         K3xS/9zxTc4kVjl/GEH6AxRamuHawPi2K0lLvuI7n8G6DXqMVteNa87oDeqgfU/I+qli
         BSRrus5eNIJgPMK1Jqp6aqBICcoeVNg080NS7sQw5I1tdob/d0ZU8SXalXfzYTJgHb7j
         x1hRdVLyWIQdHWJuWnUbGiksokchNqXDXb2DsK8+HIKAZJ4WqG/n72U7joGmKwfhBGxy
         vOexyE/+Ueb5ayaK/D+P2oG5vWGh+4ixhsoKvNpSbJaNiu39wWsaWfxaqzvbpJUb/845
         L27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464678; x=1794069478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vq4vRllAgK6PadituL46LOg4X2pEj6tW413DrF/8Lj4=;
        b=prgEFfJql3AXMD4I7isBHIPvPOo9VBfFogCTnhy13m5CmkUlYiaqzX0Y2jcBQ//Wzl
         aIKuM7FUnkAsS6DB/EJysyq0tDxYigDQn45Igbj9RV1i+hT0HfcYdneHVY1jyw5300xj
         ds/ZpSDhn6gHWBLAaJQYNZIGTH3QLNJyu80NCejqwmjG0ToNm5AgusC++rx5m/jHJNjR
         juOicsuwvWT7oVo3h++0NAsBuJ1nktNvsUpukYBH8WF9XkunYRsfF8iAix0wqPFrrPDn
         rdmVl89RO8wxSAkHmYeXlt3NsP+asi7A9UTDJOF1rl/5XkJHkjpKE/hb6vd+Njk1RuPu
         6m+A==
X-Forwarded-Encrypted: i=1; AKwUvBxMDuSOoKO31PXWYYFywuTWTalIN7+BSSooDNAzKtRiR24EofgbInN0Rl9jKDsr6sVXcAf+3N/A6TfgmN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy6ZwWjxxc4UXLk2270Vnbz21ZufMq9WYBsemgh8YRD7cVLpaj
	ZCgSV2BaL0+RZ0GDNzF0BzFJpCyNKcwxUNhsCMxjHIBfODnqCHd8uleD7djVfTln799fpRWXPnn
	KA5QQ6Tl+e9ymeb/DRsq8c7hASUEcSOjOa4DGUOzb
X-Gm-Gg: AYBFou3uNTiasJwz7kEHwV6R3iQRCZrO9MeX05nqC/vp6BxQyEwsvrJRbNhJyjAsKTA
	zOUTghlfaAdvio1mIDy+lRqNYB9+lth1oM2ruAuJ96XE3q3v6cInIS23L2fwvqmsjVgEJVFxtZB
	zUairWdav4NkI+AHoq+WPiu4mhK4Psawtsr/6BOND/VlF8AbtFgMEfXgyyW3t23amMKkBt6E+CT
	+Rj134yQpLBwrn542E5+bs3Lk/JxN6wwjrc9BwC3ce0/OD4H9KqKNd/g5zCq3KZVX7/LZgJZANB
	TkzaZCXEr38ZZDrlCadOolw747Lg9tMz+L1XHrwNPh7jWEaXDN9tpUWIt+RVX30gisUjk2GxE5U
	MIkB8C84RSxVbmc+FnQXO9eC61xZDdKV/siXvv9wQ+wBXNaAcA4Wvyr0gZXkLL33yVBB9cVGzWa
	DAqtmMjq2+gweE7vi04A==
X-Received: by 2002:a05:600c:4e90:b0:4a2:526b:d410 with SMTP id
 5b1f17b1804b1-4ac17565fafmr135441625e9.13.1793464677281; Sat, 31 Oct 2026
 09:37:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk>
 <20261031152846.746656-1-sashal@kernel.org> <CAH5fLgiSOae48jr65rv6ynLWUhT7xVCjjCEK=9oKXvSxKpdq6g@mail.gmail.com>
 <20261031162931.792607-1-sashal@kernel.org>
In-Reply-To: <20261031162931.792607-1-sashal@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:37:44 +0100
X-Gm-Features: AclHuK9n1IaeEszr_jQNYJo2v2No4a1cdwGVbESZzGLJe-RbL495VHIWXOSenUA
Message-ID: <CAH5fLgjpB1-hCkUhsFK7bEVYwz-N-obsoPoaCYA-BWMQ5MPTnQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 5:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Sat, Oct 31, 2026 at 05:17:46PM +0100, Alice Ryhl wrote:
> >Is it possible to instead fix this by adding the impl of Zeroable in
> >rust/bindings/lib.rs, similar to this piece of code that we already
> >have:
> >
> >unsafe impl<Storage> Zeroable for __BindgenBitfieldUnit<Storage> where
> >Storage: Zeroable {}
>
> I looked at doing it that way, but the wrapper types don't always exist,
> so a fixed impl in lib.rs won't build everywhere:
>
>  - bindgen 0.71 and 0.72 (we still support 0.71.1) don't generate them
>    at all, the blob is a plain array there.
>
>  - 0.73 only emits the alignments a config actually needs. On x86_64,
>    allmodconfig gets __BindgenOpaqueArray, __BindgenOpaqueArray8,
>    __BindgenOpaqueArray64 and __BindgenOpaqueArray4096, but defconfig
>    with Rust enabled has no __BindgenOpaqueArray4096, so an impl for it
>    would break the build there.
>
> __BindgenBitfieldUnit works because it's always generated. We could do it
> in lib.rs with a Kconfig symbol for the bindgen version plus some way to
> know which alignments a config ends up with, but tagging the wrappers
> right after bindgen runs seemed simpler.

Fair enough!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
