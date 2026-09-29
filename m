Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF5514740
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680527; cv=pass; b=TyR1y6GVXkqEP5Uk3LJupOw77BHb4t2hi/BVLG9r4dKXjqjJlBO7XDEGZo3sMhepnuhQVt1P7EBtDuk+1Ipv3P/wny8PoJMJYCqy5pWgccbD+yqJzaurLCcUqnl1gJBQXmnDwqmd1ser3HHd89cJ7iqSNSh9OLW/lPq5RnNiiL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680527; c=relaxed/simple;
	bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3S+mPrTDIPdQ4KivE5xX/YRqa49npbZZDri7Aj5nslIUJXI9BtYFTgvoG5DcD8wPDjJpeG6nMvvcAhqu+DBNaaRQuNugimfHbm71gxHZF+DtYOzqZyyFMo9XarqGZbHCHoGqsdCCptomw7VZoltzZRdzsMQnVhaM8lOOObnl2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpV38yQW; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpV38yQW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so30297915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790680524; cv=none;
        d=google.com; s=arc-20260327;
        b=anmt2POyALu4UXxp1EQFezEdr62Ayg7ng4WSY750j/X7JJ0ujukLtafOsZhjQ2QKcR
         e77P2ezwV4Mk/NYq1Q2szD6oCNcjZhtVyWGi549FF1TmjdlzfCXn6q8SU7y9rBhybo7S
         v5CXcRIO8obqDuNWXgFq1YYS65CHmH+ULBwUmilyB4Fs0Mai8JORYiLMeHcZjXU+ASfY
         J5UZ7MD9saOoN5MEWUQ0MGmc65SnmGpYSMkxUWo7SJjKZZHv+JQDbeqCSsT7yBgl9kzK
         M7YsK99ngckEV5d6bEK7idco/CWHV06Iv9a73E2KVAMFFSn3yoTOhn0/c0MiwbmARz+b
         4AXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        fh=VWomWgz2laRPP3uisPC7SlX4nT05pSWB2IkvzsavojU=;
        b=N46hwcWfVBjtk3p+OeB+xH8jusxY7rr/yLOPPOWClI/BnwBkF9miahhY0bHFkdGetY
         cF/CXZNJFTCI2WCWJ7jmjxqMdUXMYWKcVX/VEoYOxKFft03WvtjziK9KpgVe9IscmDif
         rbc8feLndf9psxkaRFLP01guMmOncJbncMApq0cWRiym66wEHWfAQyzyDZqlcfygbZYK
         Tx8LRFHiWnNI9I2EjS32XZDVRxhKq8iwb/YYx4TrqWPQP5IVe5+7kAx0G9TRxzr8w+RR
         nezZjuAl7bMhSTip1P312TsgtpmhsM/JHLpMQ3InXPwFR559nnR+ZHXbijlkTYFCjSXM
         zzqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790680524; x=1791285324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=rpV38yQWtOFpUS8caMEJrpkxNtQq47hOTlWvpPER1VUTHzjCVLrA9OO25/NqjcuYyb
         p9J+ITAp1Z/NgVPrcEhUJsd3+teA3T5jOnsyHuRcLQIdYoNZJJ8HelLaxlhWiCPEzSKP
         73TIqx95eNYXoLXDOjQcjjUMUXFRtBHMFOD2eRrZdFT1HpAp0T3l0QoteGIDgNCq3rUW
         Gu9EMi7fGTL/kiHQ+Q9FnqKVOuOuipmXiWEALzRL4k5BJVBWpQOUVyPCyX/JiBLZr/IM
         jHNGocAU9tcMrAnu4ubt42HC0V2uipKdAA5PPeVIsJu/hDz3cDEl6shy5Rabw/7i58kH
         htRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680524; x=1791285324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=pDerJw+R/x9KTeZvMD0OSSK+OaU13w4qcXKRHBBelJY1r/C5tZo0QAeHVlgwEPQ3Ig
         lFU4m/Q1QNHTcSBIVD0TJ1uvqJI1WAeCZA9e01pQqPOksPetqPjcKGwIe8LuaJ1R2IhS
         jhPOFiBw3ZnaKa2D4nWBXK0LH50r373avOh0d428nW7XOdALb1h6NnRSfJswKxvj5rUD
         nq01ldIBVNapMLZUTkW0xjSPbUkZK8eeGHUU7abwXW7qKvqs3YM9pu5NMZiNTuk8ErQP
         d4x8+uzNDqc5JiMzwiKjVJDhLqMaXCYDPrt9B5p/SCw0ggfGkWxhDNk3oChufYym6Wb5
         MDEw==
X-Forwarded-Encrypted: i=1; AKwUvBw2uXYAZ5z7//eSH8UcuVST6GF3lF8RMVcZGGNpEq1hV/V7Ha8mah3pojeEGphPNBDUOWZCRuRykNnJJ/U=@vger.kernel.org
X-Gm-Message-State: AFuF++kpt9Ox7RJrbFPZZ4TPgR+5YkDO5YOuc97QlyjMKEktWB6wWh9+
	vccM+TtA0b2luWKYvcRmQ3N/26uh2tcayXUiSizjY81qTJYs9772YAQ3L8kcrTPhZmVZRVnzk6V
	LiHjoZ5vOIjGca/IER/1h3REZwM6VQqSWJGLiQ2ky
X-Gm-Gg: AYBFou0wcKWzFCbl8gDeKmPMmkrDfFgJFw2+9WyQRX8bvLzrVRBrWf2fEkMT52Gzq8l
	ky4BRjcxbDxXFDC2jxnNqse9YQ5ZHSpt8Mjfvf74gjE+bcS4PFil2wAqc7+WCq9jN4YTnYrCzk4
	m3nwkqJbhHI6chBtXSwD0yp/ooraqe38Ag45CIn5sHYHKtQOLueaUAWVRYMAxA24fpBrMMoYV0r
	9hYtbfx3o7x6GCkKXz/KLVOs/W4U53bds/abatRdaFF7RxuNduvFU+pglJF4F90edGL0d4h6rxa
	Rthhx/tAtpYKZBJcQMMuxFlF4LQ4UnGDdMPpiWlHlstbjr+4l2mRwbOcpb/HN69s0CQo12CPDyW
	W5DjRiIpB3gGfjdLZ/svMSBtJ3TECobIwlGGbyCGF0ITzF5I1diUE
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-49fe66f9fe3mr278996775e9.31.1790680523000; Tue, 29 Sep 2026
 04:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Sep 2026 13:15:10 +0200
X-Gm-Features: AclHuK9UFcxmG9GmUlSlAWSVdyiMyuABuak7MzbC2Kn8ucmeQP62kVdtbhyOryQ
Message-ID: <CAH5fLgjV=qMfG25TQnTruHeVQkVuitzAyUV7frsx0DyGFA8yUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
