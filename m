Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0B53C3DB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790066; cv=pass; b=DSsBwFvZHKgK+XqDrcOO9+mfx/zowqn8IMxHeiibkeBYS5QdanGDRmIKncYzhhi972zW40Kn0x97Zn6lWTsausrcw8Uv5SKy+tRhiMvVgsZ0mOsKSi3k0Ljw5nVIdJ8Muh6AozzBYSyJ4xbV/RBSnIHswIUw4I3C2mvNfBuCFZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790066; c=relaxed/simple;
	bh=QIPKB89nXgDV1cfQB+FMow3NJ0Z/HH87YQ4Av5NDtpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si3+UqX/ZEoPhz9clM1wQfUbrP25iFHtiqQuVu5FOwo+f7v635jgEWq1C4BNwa34FIg/uCpX8tyRKuRhVFDHuWUJquLyH6fFmqFOM6fFNEk1BT5eLFoxP7LREi1dHuk7WBPkbPe3USqNKibq5U7cmM57KeQilByriTxZKI6VJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neLE9dAY; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neLE9dAY"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so182704c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790064; cv=none;
        d=google.com; s=arc-20260327;
        b=FInbXcEXR62Yofe6+oaincIJ/quyJY1kfK37422Tya9rtx4gO0zSmQAeL5zArN/xBC
         QEQYG9gGrT76dxzOZfnRN+EGW+0iWmE4/jUwvqthZ/pDYd9QbLFQSrzgBW+zSV7wIq89
         DUBLfQ3dXUf11l0jXe+kFajq7GqhCLry9HMA/VQDFnoysUKq87e4+BetuHVT4rx2Q4RN
         +l4uqFfQMAlE0aym6m7Z5QLXRP052I/ZDyHZiVTVrDXD2w9agTpCYHUHcBcg9AFNZmdw
         tUEFH3mJi+aA0w5SRz3wsTVzTuky607SDLqq8a2FCUrN8dQpAGbQhb0FuzZbzEL4VnTk
         HQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        fh=NgBr/YICfiFnr0/ltw3sscSGklDqHyB9d9+im+scA0k=;
        b=pZFuoreZee+7/hNGMv7U/gHBT8J1vbYpnWKVIYW5WitEb5wIfDvuCQC25CcGzlOMz3
         9bFjBAnxJuukBvUSl28qO9EAHpygHqFhJ5tLE/sASJpEATcpkPJQq4JsdVsyBd1zJkbi
         tSntCV5suD7Lb/bMMjs6oyeWpBboepZ8/U8E0Seeu1Ch1ro2E/POr4s3TwGNO/V7EvKj
         LAj8YMM5jH0+aodaG9NY2UXqCLmjRmzdhjRol/IUVA6hBcrWVDsbfiYH5HxmTH+SUE2C
         vXaRWLC1bzvpZ4VEGpjeUTi/ISntnsF7OWtnWYMOnXl1Fh4JXl9bayYX8MhtsElKeMOS
         CC9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790790064; x=1791394864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=neLE9dAYSQhGiJKSU7ZKOZN9I7n4pWI3QqWnC2v21t/EDQHwpXabp7zLBYv3ponCi0
         S8lOPRFP9mB1kdhYrxGm+RYWzmiFZCOCJ5n/os9Hr1lsLQfv8kvr5DWqipoRc6x7TUAo
         X7u+UleIJrMAirYRxwweXC8AymsUdIYEC9vhev4tzF4PVKp7PmJlWiRtmd1PoMAuVuw8
         0Sxy6Xn82QW9XsHSbjL1A/251rWQpF8sRxEAvjwqBxgevENU5Bhm/IpjdDi2MCEO+rKK
         msbZ7Byr+RwPUAihqvJ8j80dWjdTHjr7k6OLMWdgFm51ZE0ZdfmnlZ9FXYYMRVzyFA5C
         Rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790064; x=1791394864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=EyL8LD5UQMbiO3yM7TRipJZROrxeazw6zhVTDmDZipFJY8aNDo5yN8Z6KpXgG+aonu
         CXSat9Nz+aWjB8TnH/e85FM+c2ZrFx3AQeOVL+42W95YcLaGAkaWzZxBbuJw4IJJAyWc
         fMAEfczyyNduQA/wiDqnDp8JYDTbKb8N0gnIhG/r2i6n6Xw7TGhRS35U8yJHXgwXVHD3
         DrnP1FPhCBo66Xk6ORo9DX9KYrQMjJ+w0uvTtI0Uzic+T0vVG77zhAyhGaF0TCiE7UpO
         gSU7fc27X2mg7+4HjhWxGpWCaZgDzXT2UYgsCUME1J0SlONw/AVBrS5I1PHCKgiLQeOI
         b9wg==
X-Forwarded-Encrypted: i=1; AKwUvBxxgQ/Kq/GHnGinfF4vB5isMWNfPanevgNijd7QoTshcr4yGdOu20VBlGbwBqol0djQwYfbKI2o6IOpcCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1+LXdgC9hYaWrD3OTGPo8Ap/0H3WvnxBtpeW1AYHqIHJ6gIFi
	6Jccfio/U9Z522CQVo03RbwqnWKL2YPbUmVb3m4juWGlTvXKKs1s8pPYQumevl4E+efAfCPpxlc
	opcFP/ab9BJQga3Ro9b7NsEPkxv1k0NY=
X-Gm-Gg: AYBFou09qcXGywp3PpBOJnfbdh2ICH5PRVB6W9hDMQpauhzftcRNZGed0ImaO1rKmMA
	Uqbb6++VeF523KxYoQ7D6TzaCbuuSSm54PAkejrdrH9pKXs9raMwsSEyv9mQUDUbTeTAzU19vkb
	F2KZszTsJdH340KJA+/NhzjfG1ia65u/6iN/GMMalfeIFatpSOl5dthT+1XcwRj9/AWkYFsMXYa
	sgRyiPh1g8rYoEvruSbIuwSVRRX50/X+w8yBOuOXa7uQL0sE0OnzTWT4rLvkduXRLNbI3g0Tc09
	aO8Ysr2EoO6gPnXhCdqX+TCFwC7rzkkXMx/qCkZ9/Vq9r8P73CcXvxt8ZdO5CEg78Wl6zInTQoK
	2OfPlL905v1bj9xLO317wagYMGjNDQVajq6kiG46g7/Vno0MXbQxqrBBhLioUP3h4bGxNguxWyu
	tUH3/Okkd0S3ebv/X4xLpkmbk57yzPkb2VNrYZW0BA9Tb8FUboGW/ggSgWqbpeog==
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr4199997eec.1.1790790064283; Wed, 30 Sep 2026
 10:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 19:40:51 +0200
X-Gm-Features: AclHuK8-tNSnrbUegQmqadgpN1Vx-fpMXj_ECffz7b1Y1rIMfXI_7fEe_oGZOcw
Message-ID: <CANiq72mjeXdGB14ySO3RyiRrLtm2wQK-FJ4VkMSiHkJsGY-3rQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently rustdoc will generate function names like
> "_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
> doctest located at rust/kernel/io.rs:824, when building with separate
> outdir using `O=3D`. This creates overlong symbol names and is also not
> reproducible.
>
> Fix it by doing a custom remapping to trim it to something like
> `_doctest_main_rust_kernel_io_rs_824_0`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

    [ `rustdoc` already remaps these paths when we use Rust >=3D 1.95, thus
      this fix is needed for older toolchains. - Miguel ]

    [ Added `TODO` comment about the minimum version bump. Reworded title
      and comment for typos. - Miguel ]

Cheers,
Miguel
