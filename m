Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB44582C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248974; cv=none; b=PhXk6lT8SKKdGC4+CTRPHdfm4HdW93+K2XlsCi9kSn5J/H2D82TtbPz4v9WBf2IeUEW+DGQhwVs6BXcH3VrMARRhEfVepKc3jli0JrNiWi8biQmI3FneCIK4WrkhXHM7hZaRlePfCpUdFVYOvIl6lv3ijFITwY02v29GfJ7slD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248974; c=relaxed/simple;
	bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cQc6qucXoa1h0GjVbCTTthQ+EXcjMV75nrdw8B1pEg1DyRJpEIAxMnVsrcfubOQHU7qDSCulBnI2/544e/NKTM/b8xPSMkbE6xjy97a9PSIMiFAaN3G650PgkwAYy0JWbjcocePQGy9gNK/VLjOwEQsQJHRbdsJn2TWhbjt6zsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BALYCygf; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BALYCygf"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49564d4b849so2113055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788248971; x=1788853771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
        b=BALYCygfTS2BVtXnvLDhhfw4BR7yY4jqM+05EuH0CkWk2BLr0IS7aIZraZsvBkqEDv
         pw2DNapJrIP+IY0o/LLoR51cWTzblfUr0NHq8a/tIirBJ7QtsgDZcjbpEQZlPcOKLDwb
         i3czOJ4LDyKhJAd9xu5z9k/CLpRrqUfrLDn8rhD3keOE0ZJ7yRihtgU99RU+HqM8kQHE
         jiCANFC+IcOZhfCERpjGQXjHKphpTT2+YAvEf7kXw2yz9oFq4+xrQskinquZER8CqYBX
         jDq6sznfYGybm7ikNS0gSWfbCbtpFzBzrCiVYqxn1VwAObMvCiLsgAGSldDE10Y6JBXp
         Hctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248971; x=1788853771;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
        b=Q9/ve7bgEmXTmVr7szDqlfw+24JW+Gmu8gYyxCf5CAZoGF2OQu46oLxZp0KMzMGofn
         DPMTV39Fds15G2Syo8ncNQ18YoZ/+wgukERfltr6sSoKv3CEGAgyZC278CZcPBuuRfnl
         aq4MZRCDg5X/OLx5Hwj0GjNoywMLD6r3Xt/z86hzpinyt8QWEnlq+73ishCRjDK1uMkv
         XEdlXUK4pst0aYpu20PuVTOD54g3iJAogn+zRKeplb6NahX3p9j6lZjgGNHB9M8DjJLX
         /VH4GEANHKafs6CXvyq1U58EjkE8/DsYFLDKMxgxGpuQAfAS8pKoEvKXF43OBjNq9+T0
         ifMg==
X-Forwarded-Encrypted: i=1; AHgh+RrS+reanetFi80kzqcoaHIHiy5U3Yv7e3adqbSF+eDwHiUYIo7CzGOCVhlq+C+NIdybAq2HrVIBabnQFq8=@vger.kernel.org
X-Gm-Message-State: AFuF++ngI2zD+ac4+3PqaG9ZIq5OLTXSQ1Dn4bc8C3kj/+yhy8u4ZBXj
	phgUULFy2cHjBj+RsaoZVedU0kpgsdJNm+I/m4BVv71Z5ek8n7UvCio48CaOysQS1ygWyAQpbzG
	L0hF+wMckULSfzSB9HA==
X-Received: from wmdp18.prod.google.com ([2002:a05:600c:5d2:b0:49b:e3d:cab5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr453426275e9.14.1788248971200;
 Tue, 01 Sep 2026 00:49:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 07:49:30 +0000
In-Reply-To: <20260831222857.1402608-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831222857.1402608-1-nico.antinori.7@gmail.com>
Message-ID: <apaDisOTtL5r5a3I@google.com>
Subject: Re: [PATCH] rust_binder: simplify Result<()> uses
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Brigham Campbell <me@brighamcampbell.com>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:27:10PM -0300, Nicol=C3=A1s Antinori wrote:
> `kernel::error::Result<T =3D (), E =3D Error>` is a type alias for
> `core::result::Result<T, E>` with `()` as the default type argument
> for T. Explicitly specifying `Result<()>` is redundant.
>=20
> This change makes all usages of `Result` consistent across the driver.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1128
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

I don't really think this matters, but shrug.

Acked-by: Alice Ryhl <aliceryhl@google.com>
