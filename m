Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339DF37106E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932473; cv=pass; b=g9p3sszAUVzMOLcZXyHQhZZRs+C3uaQXV/fa5ADfeUjJnYGZpz41dQ1+xkA4rJt6qirJa+RJTRfSQgmi4UIB/nJJOBwxe8hn4acZXK3pbeLfmrMYSYFAUaoJEIJ1ApSpJZWNMlLEcI59F1SyccjgT/PyXse1TUBbFmZzqtoqpzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932473; c=relaxed/simple;
	bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eM5LMx9JnXdBjYWibd4rqd7eIbSQ1uGAQgOMwzsmkr0vdKZGjK4Rs1eHkh29FpTECfy2zlhGC4Wf1p7jvNMVdQOwRH3EbYIa+qHm18yh68bBISJwwn7BU1wCkZkz2+dCZM6slqu+ymfJHnbPvb7CTrxztjDMMpIkBqNJhIENGf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVIi/hCl; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVIi/hCl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c7962bdcso124769a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787932471; cv=none;
        d=google.com; s=arc-20260327;
        b=RJbZNW6tu2K23dDHDBx1FlVjZCHxs6YkAwVd9rkO4UAYc5H13T/nJVLsvUCez3qYU/
         6WKztBVqlz1/hm+tOHDVsNbUrjqo1SqLJJ1B5rVjHAIBzqHFNfOgoPY6IH7xjUsthKQ0
         kAJYdX8DBrTZQF6DeBp8CNBmmEI1zlN4/bnCtvjocqEVjcw/UOMW8d3rVoT3xY7no5B+
         Mb1aV855Vz1j0fdc1Cf9Jkix+k0MztmjYL2XvpRN87M6rDOXQWU3xptK70R4IWhhhTIb
         q1MVIIuxdarGh4fOKZDqYh5mPe1kjMm3utjLrsYb/2YgZFA6qu5Ygxawmij3iUzXA/SA
         1frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        fh=TltoJTK/IvR+7ORpTrXAvtQmHH40AwKEb6UkGxKVIkk=;
        b=cfA+JFwzBK60rpm0cm9/ZQL7MtAVxrTZDWtupNMb0aGxga+h+QbeNjpA+G+RKDd8LV
         7ylmRhQ0ZvgfME4L+FZjqJIqinOycIrR3PkPMAz5+jllJvUwj491cYwiuwUZIvIBnfqI
         U4v7gGPggoSngSWnIlvhfwcS55Z3FX+yc6g8a9lx8M1b/mEgB6eeW5bQExHEc9TKzLd+
         trjaHbf56K8u1FEGpQy/JRSbUZ1v2f2heztOxaGpPUv2/VhodtSNcy4aMeXj+MmPalSx
         OVkxejKJeorbHKa0M/SpWNBrKnIkxrLjb9a6q5j4BQcQmP69x1czM9ZbjIf51SGEnTop
         HZ1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932471; x=1788537271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        b=IVIi/hClxaWUFVANyFffXlZMs+KF08fI5QRAJUXFxb56FwzMlpLpF2XB+4zljcHqyh
         JEOLo+IWkMRG9CSd4QjYXqU0KPxZUaYCKoFsVuInzDuqZ4i9lALBAiO30CjdzkRQq6O2
         FAF4zfqONgkK7wO09g0fVakclJDrvQ4H+bbDJHhuNu7Zel0celo0t9nCcEvB7obC7Wi5
         K8+U5xkrm8QwGqyiGKltPyQokE6pNZOVAzARaVH7jbpYDIexE8HHDhRkjsMGAgHe7tLo
         GEvDF1fASJa12SnAwq3VlZmsRLVkxlEK33QfPBfxF/YIEx83Z8ar5zwl/NPInu4sWqx+
         GyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932471; x=1788537271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        b=pM2z1naUd328Dy7RG8DAV3qswx56yNolL1cQbpnidXvcF2xHbhFKgpl/u3/r7zY/ys
         eCzaz2izTkjKM1Hsh+Bljm5Fu3jKluUUFNbMEfG/BzE7oMqrKJcxeyGZWBJXCKIsO28w
         P7zqB21XqHGmBCsAGLmEncFePuMx6JKzi7a5MsTbjgmUusk/RXphzo73wOWwZEP9RW+B
         llDKm1evFADrfnDQoJdjnDYlcU+5hnBuaixsFnZodhNjYeWmmOgQI45xyZQ+Q+AdSfrN
         06mmqA0BjutUE9HnmMH2DWlADP5EazQoPbeTYXCG8r/Ofd0diAjX+RXuo98JvUtr3tWf
         jnPg==
X-Forwarded-Encrypted: i=1; AHgh+Rrni5DIE55cNylt/7GxZZQcIjqnVT54QKki974QwreSchnJH0Y65UOSx1/Zzal/GN0ockx9bPWC/UQV5BM=@vger.kernel.org
X-Gm-Message-State: AFuF++kI3v+yfV8U9hD2rS819hQZ37DAKDOt3cx5Fr3eUa6cHnMSZ9hf
	jNNWzQpa/TMKGHAmQ65xpAQcDqgK9U6YW5GWlspMV9M7bXDzuJ3pZ10FAzi8/E8KQg+9Mvg/Q1w
	5b/9ot6pDPUiNgo7pqywGaDACRSwA2cI=
X-Gm-Gg: AR+sD12Nin840gJw6IoutdAXr7+GzKHeXBDA6uoMzSzaS1GCMJqLpuv4mBHJlAPtv1Z
	MVknLpyXbDibL0B9ik5vlj1IsZ/ApI74Kav+O9ujoYkDYZ2UJF//irlF39mMQtEBMrIOP2sdhod
	UFfyxIxNE1fee+6iibSPZZ58E68ZZ8wvfAJZhRo+hh9GP75j4pJRIBwcS86wxgc+sJK8PIWc5qp
	9FL0Rr7mSEL1fADL0B5xanvRX0/TGg5544lTPJmYH1WLsrWtubowp2gubjQTbM37CemMDky20lK
	vVeXEE+mc9YLxgdM/u1bYlNK7Q0a8r8phqtYpzs+HS7lq3TfycbAJ/CkIsqHi/vGBLxxYjqTn5K
	NTZqmLd36aQgTMMRjniOUgkZKvFbBS1isSlbqOBvO2Sg8NZqqK1v7Wan2r1nDYY7yGjnr5v4=
X-Received: by 2002:a17:903:228a:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d74df53523mr73393885ad.3.1787932467853; Fri, 28 Aug 2026
 08:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org>
In-Reply-To: <20260828155033.2101924-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 17:54:13 +0200
X-Gm-Features: AcwNN1UJlMyeNXdr11ELA92T0Ey5VcxcjVrQRE6xE49VX38cuncqB5l7YyzDO7Y
Message-ID: <CANiq72nsED2k9omegCeghVHhpU1vnatBFyngFP-jCc9K=sg4hA@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Miguel, given that we're very early in the cycle and this effect
> upcoming nightly compiler, I'd prefer to route this via rust-fixes
> instead of pin-init-next. Thanks.

Sounds good. I was about to send the PR to Linus, so I will put this
one in the next round of fixes.

Cheers,
Miguel
