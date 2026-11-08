Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153201;
	b=Q4f98b9PeWzj3NrlkNGSRIe7Eqry946ywaK0hO69byqYMpb/WFnTrj2xkmY7IxCrl57E
	 4mVi5FY8U1X/fpIvRKQKhsSIwTr4fpAnY28VF9L3FbQM/FKptMspWIN4sJ9jVfFCrXRnG
	 o7Jiz5ufw0L9dngCHR3ckK35eRRdOLkr/dP8++CtPJSMHszpXLJxJaXTRv4tJQXJE2Ft5
	 U8ni2UgxldQT20e/6FUrL4cgT/xtzEQ/QM2doKJ7A4wiHlsKoHxhSg+4nAQDj9blY2SGq
	 1jJjiBlbp28AzhP3N9ulUtWUE8nyxX7ug2Z/J5EkNTFQNZ4KO5fpXPDNr1aUVXnQjtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/S9XJ5Sf+ha4mJ4om/24R0+J7GuBzOrBmWjf2t5Bxd8=;
	b=PFmsamyaBB151Joyo32E53aSXYXAmqN98Yx4TVh5togJp4oixhnnAkwMAgmEsF2TjiMl
	 fDzXFhXpPh8DZojITK5vIB07ktc5ukSXlPHGF+YtQH59BaISHqlP6/kGIYHEjMb2uBbDM
	 qnvzsAv9QkrKQL+ojii+aoypdkjJvLvDFlzANUrjEt9jaF035tGbYhTXeZL+9B2u8pUYP
	 WcomXNk663oWGk2SlpGCU0aBM6y4b7kHB/E6QxRdr7TaJ2U2qSDlCrAIlk7LdNIvgErVf
	 donlRs6np8kmildCThgKjG8btTCqMAVQxSClH92C8vNr4qVvC8BMrkDPrV1tNmtmhDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFJVzurq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C663606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFJVzurq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DB41F008A6
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153200;
	bh=/S9XJ5Sf+ha4mJ4om/24R0+J7GuBzOrBmWjf2t5Bxd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cFJVzurq9HbKbqEWGxr01b1RQqds6QMtBC1E7K90XsZMRtQnK9HSjS+nFUW7T7IsP
	 1XCemhABaTppK7yZQGG/tAkmTDOtTiq0yPwAV66Cc5PQxt/PxinItvHkqIDsSgKzGb
	 NaIHxPjkAoglzLoYp9V7yVVDLWYfRHZtS3BpRQUhwXHoRB0Q0ZEZFIZx6wiIPQ49uJ
	 aaLuW0CDkXvmDBYbhqDT46xbhfycfXg6rGn2sOBzT1r+m4tTApb26Q2Hrnx20etEdl
	 9PdohjnYg224/l+HXjePyqzQvx+azdRrtWzz77DZrjauVgsRBfdLndiQkNy6f2rJwG
	 /nPBWtWszVooQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso216114e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHEcVLexVEcSfL7rHdQ0i6oPlH1YbRM9rMtF7s2GJooIn+XDpVsjjhxywDq8rLw9PmBvugpQfdmgjPpGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8znAIjjWVgqEwjZTntlRloRm7CaxsBpoyA3Ml2rs9MpWJGL/fD
	t8LVJa+ctd529deROYjvSTmUE9BTZ443xwNIfJ+DeRTmQni/PmrD9oiM1779tNWaOpY0h7nFq4H
	tFwV9YjthHxhOkxUnlRdrfHFjhEKML0g=
X-Received: by 2002:a05:6512:250d:b0:5c1:4f4a:68f4 with SMTP id
 2adb3069b0e04-5c14f4a6a11mr46761e87.32.1794153198892; Sun, 08 Nov 2026
 07:53:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com>
In-Reply-To: <20260928063824.1386524-1-morbo@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:53:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkm-S_0oDt9K1xn5kOVp7f6KwG7y7nCNE2asD5K69M=PQ@mail.gmail.com>
X-Gm-Features: AclHuK9CiXVomc9vdDMRXSjLJTZjnIEg_krpNQUFLmn-Tbw0yt_ODEgP0qy0xbA
Message-ID: <CAD++jLkm-S_0oDt9K1xn5kOVp7f6KwG7y7nCNE2asD5K69M=PQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Bill Wendling <morbo@google.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:38=E2=80=AFAM Bill Wendling <morbo@google.com> wr=
ote:

> The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> with the 'size' field, which represents the number of elements of
> type 'struct acpi_gpio_params' allocated for 'data'.
>
> To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> attribute.
>
> Analysis of allocation, assignment, and access points shows that the
> pointer is never accessed before the count is set, which guarantees that
> this annotation is safe and will not cause runtime panics or
> false-positive bounds checks.
>
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Prerequisites handled in EFI so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
