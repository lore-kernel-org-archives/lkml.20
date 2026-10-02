Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB043E7151
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968235; cv=pass; b=nEMIts2m4mD2zV9ln8etGrlyOODz69jTSzNUSuCTGPS9agi3HA3wdNS+74ku1Zt5i+O3NBz5vvglx2HEJN+5YfMb1HwGDXWN7kueU6QxF/wikWx1cvtklMBss0ktiUCBuxLtVtIx0Yog76iSAZmKLY8YDbK0hwYstFQgFhqid6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968235; c=relaxed/simple;
	bh=tsB4IUGeBxXB407dr7P/VmcfoWcXwEQEHgqAlrksksg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDkikl5OCeDxvxtcIj7oRUEZ4j0+avFfqmwN7fS/2y6/TWnkW0fIm+anquUFVG+udnnoMru6e9GEQ+A8FmtaxQSv8B73XId62Nl6xt6QJhBq+e2e1kQO+jMU3woDBytsuBWA6armJBUfXAuSzoTiauBtOAlJ5cS7u8yeVNfLIyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEWjyYJF; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEWjyYJF"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c28125492so347183eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790968231; cv=none;
        d=google.com; s=arc-20260327;
        b=MKia/2QKS7CDLhhp0ikWV5YITZy7QqBQuqoG9spTQDNaq+fHkKI+7tZ+xz5K5V7cYq
         55Ebt9WCt9XvLGkxhIZp8pfnCw9ybQXJbGboLMlmRU8SaCq3H1NUk9PPdyZ4wCKtpXh/
         KeEEY6rw2N9pBe49kh9QVLOtBokG5tT4KQtozqs2aIDLYmvQlQGkEyPwyMZ8Vk9ze5yO
         POo7vSuKD4RWSVVfh3SRzKvZLKrIjiabZ3dE+EReAU9YEvxezZoQZahnpW11a5W8u2XJ
         c/sp42tdKrF0WLPsD8MxYJiFswSbwK9MRcrkoJ7wTerpnSe12dzeIUCAIW3wcuVYv1zg
         Xriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        fh=8BpHuIDZGXPA7tEhM5DAK05N4Bd3LSS+yAvx25h59DY=;
        b=NQ6qWQocV9R1IpJM//ENjwrKjTiKQFjov/DTYLxobnDw8fxQgS2OHYvbh/fZYtrifp
         qJv3dY+z/IiiP64tijPLs3UL/Cmv091Mt0HyUzTNm4W+tpGIowmbSRDNDnLWUKr5zLHu
         FRJ3NjsMPH2SuOROglZ8HQAmlKr7oIZn4z0XBm4llNQQvHaGRv3RhAlJJ/hG+AsKFDuf
         3nZ06kl1iwo195dQFVDQKaeEe8bDD+YZj/kNEEeh+94Xtu1Pq/R75REAaEIVIiy8ZJWg
         l2uGlYPi36Le5oe0Jg8aTcdC31ubRhfeQnQQ2UJ69dkOSSC5icmVBv1cQ5Th1y8wD7mS
         19Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968231; x=1791573031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        b=sEWjyYJFbKrMiiw2xoUeBiT9/IGk3/nQ4kip8yM/KeN1FbGxi0ae+vrhZsCVWKGxlz
         RtRYNGG14/GkcFi1q4HSRTaSZd/utvD1MorqXNz5nA05hIwkI/B1xmTJNg9Q+hZXigpL
         DY7841cy+U/rw6YWYvh0yh+qiB9WfFJhDtC1md78eM0+58z+IOeY5amTqEewdzVpa0BL
         hB3wbSUU0joX/ALNcyml8JyG8dlnB9XRfXzXKuMsfec5iOERXgNdMTJXPGU0Bv6rFu4p
         x2UUY4b6iP8PMYwJiWbX+B4iCS1jotHdDt3PHQS/f/B1xBwRpQWIhxi0p/Lnf0XCexrG
         c7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968231; x=1791573031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        b=gADxirY2O9kkiwZ4OhQgx/rWMNjaD0adi902L9cGfjChk1JMB2WFtMGeIvwDIi17+c
         hgUA/TzHmGuoQHVMDrYwwNQ2BQ9h/8+jrHPK+9hgo5stlfEE3Cb37PIxlFOa9g5UgB0G
         nz+LwqbWPNcO2I4NzhNoDt82V2mD5imGle/33nqGpR7bQL6lhgH9xwP+bTuoRqVLhQSo
         3Lt6rgV+K1IqkTqj1gYZf9m/TnWfCzVDcrptCwl0n22x+uksF/VcovYGk7isP/dZRzuL
         RXBTp/0zEH4Sz44NerGXz+d0/0WrwvKvzj3TP1v8Nls4nrTUtPnm72vqxtMhLye1pW6e
         tuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNDr+AZHzWMPXlrIuvU4AhC9Dg1l/cIVOHPDlyxUz9TSCTONVyPwfV4M7mg+JjbM10ARL2TpoOLQzMOcM=@vger.kernel.org
X-Gm-Message-State: AFuF++n07wkNcyv1QqsZKl4U+/71Y3e5HCLTgsNM9ma58ZoFypPRk1UX
	BgQ/rnK3fNdbxpFhuDtF34r0Ou4lxew9JvyVU1UEFmz55XsO/69aQepouwVPS3NXABT4zJQuVrc
	p/et1K5rc7+tf+Rpnstk/4pgk1ArLP9M=
X-Gm-Gg: AYBFou0D2Oc0jE/MyeA+K0Tq43DqT5ABng21Y0TNjOx3HkLq4M5oM3qEhsLB4e4MRkb
	QucZJG/GKfWas0hwHm1H3y4cDrtuECLSxrd7Ji5zw+BGFawHU4TQEfekEIDLazFB6WtS+CAMm7X
	2WWdXWc+wV6MBGySLBoNF7+UkzRjX0oAVTRjMW2/KUCPDMQHi3Wfh8+d9O9tU3u6MZkWEzwehFX
	bhz6d+ZoX2TzbZivS08gHdUBfbwqQwKXHcXSs3qtRzvBfQCCSoyIlbetCOIHLOaBa4S3EwoLCtB
	2WClCq8gTq/0hkZ1ub0ZTJy0MwNZiXX1r3dAS45p2dhGG+jW1p3c6E9EibKy0sGC5Vjwbb3RmkX
	lCehUtAlXghQ9iKyfCuBP4KAD5CBm+aIXIoq24RQ9DG6bI/fLNPb9taaIiJT62sevs8BFShz1ib
	Ggj83N4TVTSKg1jCUWBsy+SSNA7T4QWtnXgp3irlxUis8xZRYxbKK4ASHSd5uCfw==
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34f06678c69mr5525272eec.0.1790968230985; Fri, 02 Oct 2026
 12:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 21:10:18 +0200
X-Gm-Features: AclHuK9O_olN2liVpV_HQXYkyGUi9E_lc5eestVbB8U5SeeEQTTudNCDACSsowI
Message-ID: <CANiq72neqitKHftQ9UVJaKLkcUdX8uAWLtoE08-G784mqX+H9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: macros: vtable: add `#[optional]` attribute
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:56=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Currently there are a lot of boilerplate with the
> `build_error!(VTABLE_DEFAULT_ERROR)` because Rust want a default
> implementation but we insert `NULL` into C vtable and never call the
> Rust-side method if it is not overridden.
>
> Add an `#[optional]` attribute that injects the same default
> implementation to avoid duplicating this everywhere. As an example, the
> misc device vtable trait is converted.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Reworded for typo. - Miguel ]

    [ Rewrapped docs. Reworded message, comment and error for typos. Rebase=
d.
        - Miguel ]

    [ Reworded title for prefix. - Miguel ]

I was tempted to replace the hardcoded message with the
`VTABLE_DEFAULT_ERROR` constant, but I assume you did it so that we
can just remove the constant later when everyone is migrated.

By the way, did you consider allowing `unused_variables`? It could be
nice to not have to use `_` in the signatures.

Cheers,
Miguel
