Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E5175A8D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635932; cv=pass; b=oRfciPQeJYA6hwcariTKk+HUQIVhx4UZ9B/kL8u+lT/nGAeU2qP02vL6OyZ8GmTh2mbWTaiexL/6iys15aBMj5/lBlZp6kBqQWMvo5j4whj7iq94sTz1ZAX5wjw/ibxhbUFNb/WOhp9t8ABzV0adGF7ia/z+K+OER6ReoSri7WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635932; c=relaxed/simple;
	bh=1A9tdM4UxvEUDadWxG3NZidYXbKcok5wvUqTQR6GVlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvKO0+GTxpd8S8gcUhAQcrVLJTg2wtSkf+qruVJKnSuGUwm6Hq9QKHUqiXWxFvyMCZeCOkwF6kgCc/W+86/e2jV4Pu5aGPpkJWC0+mA72qcnc7SZwnMqBlfbKL6VJ4SKo1Ji8IZh8izv/c5cxPazgVXqMTf+yY5gkRtyOWxNgd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q22iKF8/; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q22iKF8/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so244242a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788635931; cv=none;
        d=google.com; s=arc-20260327;
        b=g+Kupr3vTgJSJDM4nso4l/Bpv/w3fmy6Kd0ddydCPvQZQa5FRge5JSxnCjD/Ar0sDW
         cEkuqPZ6Dq6JaQWcLXLVSk8GBk1MQFlhtg6HkMWMlMfbyenWCPVpJdoGfwQ+tWEM3/pG
         4VS7LYjp+Qa3qmd/OzHvMk4NV0jH64L97V+sAd2Kh7sXnSMwdaaEch/Yc8aMpWC0iPMt
         OU1mWeDHa+72/Dd49CnZjSg/iZD2RJAH4kxUtb+fok3m8V6Ua1xZLka8DI9o0f07yQGs
         QsRePVpnnPBMDK8az6VhOFcqbrVeSFSbOcfgu1MTAogNzqZvf7lcJqRdlQUyX8rFSTpo
         3evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        fh=yTw2WPQ2mBKo+DbIz8F3tq1/zbsjAOkRdR/DLKu63GI=;
        b=b9iP6hm+p+B95Q0trIwrKunhGXUWo6faFFDGQKHCFu9km+qCE6EIw2Ifwtl3N5D4gf
         KipqpbMwjMpZl9pAkAGQWIQEtQry9F2OrQjHf6cGZyV/trPq9J4mIeYAoEFLvk91AUPU
         s0i/j2mUtSdh7A36dAfW9jdXfCE+jy+qkszTx3n+U4GRbiSXmI7W7VCLsdrjJa1SI3xY
         M0fDgkvp8yTrFVTvbwUx3UB55Cl7Ys34DUpSVc+rbEmlFGC9EqZ9tcRxErvd/ONzsiLb
         gOeLfX89MM79hdFV2tzPS4fGzqftuEbD1mlWvwBuixMfSJYljRfXpBmJ1vTZaPqylW2+
         pDkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788635931; x=1789240731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=Q22iKF8/xfqiNmykx9EcWT6bQCxt0wnOrocFLh0rF8/8QAW9Cc+PHcJwgKc0mLMmhl
         PtC38ZHD+LoU+zk9b+aaUPO9zykq9K3Du44XY8BY4BNBu2zHRfbEthKB1xe2Xh3s4lWz
         DD3Shmn/YW72vnBl5qWet0Jlnqs48Lw0NGnmpsOmLdJ++PQw5tueLoXvQ36cZSA2I3Ey
         6Z4Z2Y67L11LKmY+zrvmw/3M0qs/3ka9Rfl+DSWFQE08V9ww3e+P0nnbNnp9FecT7lDV
         99c9dZh55BC6D9QeSuX5hwzyGtq9xoxy7VwGT/fTKflffpW3BrLLDcFzvd/dFULqvs06
         ukKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788635931; x=1789240731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=HTnA8a1jFvPWxkXEGTJHt604urj+MvwkzsL8YHx4xj7LE2CJbPOzkPZLBYxoRJylHD
         hEdK5HVy2BW1FHz2nvGM6VLBFIra4zlZ4yNFYGoSWiGhXzIUn1A9CAKsmgd4L5Wohh0a
         0exlSLx9FY8yjBudaExFnQ2lcBA5EO/PVNnUyOXcL5sX3Oi5LzHPejptSSZWlvDgbdkQ
         pQTF32a5pZ8Qz2oiZQ/pmNl2aYMQXzcQOfdLOTu8Ub/7T+lFE+n5XzyFJiWVotan4swf
         F8g1gn1b3CxFm3L6AVEQ0Rnr5OW0allG/JKgQArbkM8trViohF3i3xSJBC7MV0QuVvOG
         174Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNV4B51RlWxAYpIpx4CB7y6JXvSr/mxJZDWY9MWm4N+Nx5FDrMJgyPC5wurv8NoZEYa0qDCe+dv3x2GAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kcNGRL/Q9L/EfkcMaKsFbIXm+65NnWI3J0LdDhWBxObuQKKL4S
	SBQAtkCd5R+G/UqakogbCx5Gkm7/z6FkD/1NcrHsasKW/UQbq98uA1y36WnB6jwtJLGTODbjXkO
	MFHPflIclhSeKyJVcgKSfZTOwBRy0l3s=
X-Gm-Gg: AYBFou26wFoRzqczbYv4RMGigMCiTLMSgXk/OGjjpzg4fphDZZGAzUVAfIUE28Rb+k/
	EuCyA2NccSOgLUuBwjoHGpFPCFBJnI9wwCz8gEsTth/6M0wKa+LCpBQ+kUHBEzqQ7A5IYB2CQKY
	eJ3+lk5gSf8O4mUsBTZ08JK4XBUP1UMmuEAJVEuH3+sHidTHiefzLQpqQEPjD8Gmr8wjZN1UmXc
	3hWIi0Ch5KwGB332zDt1UyaJ2AsHDOh8u3Ycdf3S+eaDKZSk1zbJEt+pbm/Nsmgoj0qgEVZCpiK
	YTkWsQMfA2HDNtwfumFmSEyHlN8Pc4T9YNxF85f3UyRa6qqfOuw5qL7WeZu8o+xrudc9PpPiSgV
	fCeHLFvc+9KiWwyYnUIPkbU0t1vCK0mTtrYwfMml78ZZvJ95CJ5OtgHjiDcbb
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr6481594a91.0.1788635930630; Sat, 05 Sep 2026
 12:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:18:37 +0200
X-Gm-Features: AcwNN1W_ZpD7BnW-6N9vI0Wb1kb0jyPzchOyBf701rQL7ntZoTH7GyzL5sIHsSA
Message-ID: <CANiq72k4NQ6yJByyb73Sy+iwqVc=i5CuZy2b5uRVksA+gkr9qA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] rust: mem: add `transmute` with deferred size check
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
> +/// This can be used when types are known to have the same size, but onl=
y at runtime.
> +/// ```no_run

Newline between them.

> +///     // SAFETY: We've checked that `T` is u32!

`u32`

> +/// This is typically used in generic code where it's known that type wi=
ll have the same size, but
> +/// the compiler cannot prove it generically.
> +/// ```no_run

Same.

> +    // SAFETY: transmute is safe with `IntoBytes` and `FromBytes` bounds=
.

`transmute`

I think we could also link to the intrinsic and the `_neo` one,
perhaps with a permalink to avoid drift if they go away, but not a big
deal of course.

Cheers,
Miguel
