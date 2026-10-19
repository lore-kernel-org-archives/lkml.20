Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25736513EE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418839; cv=none; b=i721jEHi3qaOePExCBiiZLr9V+HVrkbbw/S1/IydsvNEDQZtmUrlpl6+WOho1JStw9CaWYWrFrKCh8LsRojMbsDx1O57TmYUWnqg/VYuXeocRn2QZ4qF7+oUCwRneY6Kjz2qCgxzuPzmmPPlsMr6LvJd60VpQVLK+tuu5q8QULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418839; c=relaxed/simple;
	bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nhIDSZfiDgYmtw1N1OcuVU9l6SmtuFcogsYDdmLsJq1Rn7h5vRKE6/hO+XjNtFJUcLNxcCqZriFwiAhJoAMsQQ/FApkWmCGYnQYKZtpfe5jHjST2e0HvS23G3VhCJWzVkkNwmnLWgQsZt65/VDqCbaovD5p3dsoM1pUD2P1Rdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qC6zEoJE; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qC6zEoJE"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0228f4a1bso12791995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792418836; x=1793023636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
        b=qC6zEoJEKUZn86jSiPz6PvfVYSHEXKaueFhcEB+GANODZhNkkhZtLZb8KtfRG9wSi+
         a6qsPrI41b8GH0o2p1v0krD2o3Nr7faQ6hJ9voXqCRszw+RP8yty8o+zV/+qnw+17U8i
         3/HP5a6TsjVc+q7YA2p/1+6pej/5Vf0+0aEPaPb2Cr1D9Ay7sZA/v/qTFniaOL8KSh/3
         L84zclu4YnT5wfJmxdjF71BTvhC/+bTsWAQjHPJgDaeNe21llwrSyZO11mEwsxCVRamC
         92fuyt2Pi0gtomDIBmdlghopMBi6vlGrcN13rkleyMIkT1Z0whmt8kimxOp7c6e1Qj3N
         CHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418836; x=1793023636;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCT4Yq30WAJeEOMR6S3DAdC6oiFVO3WCmLbbkASuAhI=;
        b=RC6qMW2183JIOqHoH13QkGf9T3U0YsGV4moCSaKHeijKEf3TSKdmk7DoN//D+swZK4
         PGPQCR7N4/XGEGd9vx3Jvt/SH/2zPTmHRsF3MPsjhLRLbT0wXeEB7Zcp5DkC+antK0gO
         BiHLwtYtkyrC3Kcy11d1ifVo0iwkgiVu5e4GOsN6kE1Ft0U/wGWnEeBOh0FQKYcTa3Ue
         0HdhLkHzt2DjvbeQspNqz7Dl33iZP3an/iyp+FLELqfHgkp1G48uWp0/2bosjMwYdjt+
         c2sNhiQ95gQQP4K8f/h9hawynOby9YiZ3cEShhGM8wk6Br50gl92nwEukqd7zmnEhbIC
         pzqw==
X-Forwarded-Encrypted: i=1; AKwUvBwejOYXnBXQwyxER5XIeN6p8q0fvVGAT1uwaR+KRl2MbahM1lVZ3wct2+lplzQrCNgMdwzMqZ2w24QIlEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlBttC744dDGUjmuMMe43tUXnh2JkYN8ASlUaJcVjF9yq7BBy8
	8siVj0wrcJPOYriKG4+hY2qUvNRY+eVBCZDbgC9dvIhEi4OpSEBRUCZT3Rax8XkToSkOucOKGTW
	yoKrnkxPMv+sj8LszLw==
X-Received: from wmkz7.prod.google.com ([2002:a7b:c7c7:0:b0:4a1:9e7b:11b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr85001955e9.18.1792418835770;
 Mon, 19 Oct 2026 07:07:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:07:14 +0000
In-Reply-To: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
Message-ID: <atYkEo0iTU3vnKCi@google.com>
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
From: Alice Ryhl <aliceryhl@google.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:57:38PM +0200, Link Mauve wrote:
> It was previously generating a ton of very short functions, such as
> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
>=20
> These are obviously better inlined, although I wasn=E2=80=99t completely =
sure
> between #[inline] and #[inline(always)], but the former worked fine in
> my setup so I went for it, we can always adjust it later.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

I agree with using #[inline] here. You only want #[inline(always)] when
you are using build_assert!() in a way that depends on function
arguments.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
