Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA040A943
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708016; cv=pass; b=Ulo661QV95AH6yCo0sJceMdySG3U3YmUFFJDWJhl9ck2LaowidsYusW1Tw2wY3pBUR3gu2acawWfmzfCf2Vxl/+bB62Ea+e1CBblBmkEm28mEiz7dPhmRKSyHpDgHD+/WI8jKdOvxjVlnw1/LMoQ3sRVHNtzxxMA30fxDEPwySQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708016; c=relaxed/simple;
	bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxdBeU0XqT3+xCzD6cP3c42e0BLbyige1wUB8oinEpheDO2O+4tFkcgiafuKQaEvArQ/l7PQgFHU6U+VedR+RLuf/ZMBnht3aMmt2XgaF0bozXpH2uMdFBgLmjgBdVac2f+dQyqJwb9eNJA+vwOD6udoLyj1gyCe27tO5fxmuAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN6Ntb2K; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN6Ntb2K"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33c30fcf33fso128913eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791708014; cv=none;
        d=google.com; s=arc-20260327;
        b=gdxqoy4WgGwWYV+Zsq4xowO7w/i2NcQmCWVIaWxjuewN0H8jLdsnSmAvAm/CfOPtZx
         G5rQaX6Bmo2Q4f8wpzPnA3ZLQ8RxWTIGP0FL1unjvBzaZ9mkZn/KEQvBMHh5cxmYS8Ia
         j0u3SQ05A6cLTBDuHO/GW6QbUrV1MxaY/Y3tw6cM/g3NzeJKKHT1GYqhJmXbOz8B9Hu9
         ueR7PDWKEwjJW0J7mzjrOnMN3uIz1nf0/EwA6M1IhL1JtiVfL+EO/m3oObKl0JIctIP2
         PAH6RR00jQ7PZq8dpAVTFD3+u19aoR3FWjoQUyHiUIk2tr4q373nIHWNrh5hey8uBTlo
         HxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        fh=bo5VB+AW9/KKWgSVQZc/MOvHtfYr7dagnudxPYsFXcI=;
        b=mX4ymDlOdJTbs9lZo5UpJukAVNaysdbDJ5ucAINyUJ8WpVAiIT8KMnmo/c8hcTeLc5
         PxcjFaAGChZhFpWEXw1Ki+dqpmhYs0tOu3vwX0tn2zMvoB1WVb/kW2eOH7Y7TCGf98tq
         gplB7jeQf9dr18lmoXdoWDiZPwZvRh2oVCANyvdNxu69Igb4DPL89SeBVCwF1aRePkbI
         bzDUOwlglfaCJ7VTPWuJyXlS94EpPXhOjasTE3Xy6nno/mMlvP2/p/NcHNwDwbQ2Xs1N
         nGWdooMHrS/rPQNIXIP+6aM060gEGr7wDykYHknY1gIj1CY+dwgatVlPEsCpT1EKyg8U
         uYeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791708014; x=1792312814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        b=nN6Ntb2KprPYe9wmPA6b8YaCZygd41O+cruDqROLyNvSJkWMDtUYMWZRE+pYm2tRt3
         NHaklGz0SBzG/hzvQCnbXvGU9O+KZkDnBp0gjN0x5P9a+bmgPjuJEhOYnp+rbH1+lFNI
         /pAv87yQaQc5Zaqd8SkDiab0zSuqH3zLmmxVFubiUbLGMU5YEauJpiIST1nGyqOD3Ag9
         CPVCeD6seGvGS7YsRudlY5dMqDoF6fWRDnoSoXx5QbZgu7oENy2FjoJ25hS1EKsjKclc
         GjBDe8bXNu1bYvEXxnhj9tG3G3fku2T6LbVHfLJ83S+tOZ235b9pTWTB4U7PFpUM+Acj
         6siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708014; x=1792312814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        b=We+PKar7SZZ9zOE5YLzW1ubDElCqLbWeVg4W37YD2SGjpsMEy602ixhR8NVHA+5E+K
         49FqX+NrI4SQZVf1SdLT91/PNF+1u9AG8oSBxZWKKHEPVlOruON/cRfqZtAGRuyAEM/A
         0QKItvcMVeX5UWWTH5gBkvIe3oseLealmEigbRuJOpMY50ch6S3PG8On+DW9NvW29dqL
         CsUMz2/vNPrkyld1FeupZP+zuCY25VO60JZ3ga+0vPHzXYTr5dfdKAYN9d50H/KSNvEK
         D7LXmZTPeETzDaBB/MPlbUCBNjlbeRBP3M91bslS11ARzdCQ4qUGCnoLaM+XxCGsdkxD
         ryRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9XNV+Us2bJZJNYFdhA08BlLnwiR3wfGpdtmn48ZuuwmANGxq6CENWE/FIq7wVaechaTHEjKn0HKkwNT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMqbrnUcvUuJ2bZN1MHM6955LU/l/986y2IeYbcAVmmNlDTtId
	GPjzQHdGSyHR+tZ5fdnykYdoJuWG54amad+yN1bfMCKwnpZ11g0g5gZdbYC3eLkEL17xUa9gqjZ
	VO4k+oYFKIZkNpjj864BPyYRtekPFJZY=
X-Gm-Gg: AYBFou3jZalgE5RAOlAMkV8PZTjdlcU+fzyVc1C0OmtwTT7OWcufNZ5hSywTFnDUarq
	clspmDTNus1O122hr5kri/xHqCcchHIxIbh8XI8xN7/ru+CMCtHxpJPskJVkLIaKVj9WBWIh/xF
	lcC/fMGlMkgYOwOy6PbXY7TXEkJWeyo06GmNqsXOYYWyVW/Utdsd1qeo0MexmSAyLU6qUF3TST8
	EegkCU2vjwpWA8qDadNGjMj1IA/oE0RFDEFVwtld95Hdyh49GQH/OuNgSZhBBu595Z98eshL2uf
	cjjoeFfp4rpSgaz+Sbb/5nH7CXcH7veBivNs0BCAEXRctElE8FdqbRHA7ySfJLFLxmJNfDBhvLG
	GSqSwkVDBiQHDParuDyi56nxgBz4zIgCbM5MGUoCPqrPwCljxdLyurIVjANivOPWs3v7kaS3+OO
	HI4EyxFH5EoARyfXv7iZN2/ivcJZU1IgKXBgYae+4XSiLIfMQleeE=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr14508544eec.0.1791708013983; Sun, 11 Oct 2026
 01:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008061326.177841-2-blum@kernel.org> <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com>
 <asflx_blsGkQ7Obn@kernel.org> <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
 <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com> <DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net>
 <DM0T7FHCSQUD.2SEUSVP1QJUXQ@nvidia.com>
In-Reply-To: <DM0T7FHCSQUD.2SEUSVP1QJUXQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 10:40:00 +0200
X-Gm-Features: AclHuK9-jIeBS8y2bRr-0D0cVzd5X7vM0ALo0OC9UdqtGxoCspUQEXjCpgNlbDQ
Message-ID: <CANiq72=rwnogLqmpxnsvhsPWX+mBtH62=Yu_avQEYEmkWSVidQ@mail.gmail.com>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in strcpy_into_buf()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Thorsten Blum <blum@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:40=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Oct 9, 2026 at 11:11 PM JST, Gary Guo wrote:
> >
> > A `NonEmptySlice<T>` which is `[T]` but `first`/`last` can just not ret=
urn
> > `Option`?
>
> I looked it up hoping it already existed. :)
>
> That would definitely be an elegant way to solve this issue (and IMHO
> should eventually become part of the standard library). This example is
> actually a great illustration of the panic/unsafe/result dilemma we
> discussed during Kangrejos (and yes, I'll follow-up with a proposal for
> guidelines soon, sorry about the delay).
>
> Until we have `NonEmptySlice`, I'd say the current unsafe or having a
> panic are morally equivalent, so I don't see a strong justification for
> this patch.

Sounds like something to explore; filled:
https://github.com/Rust-for-Linux/linux/issues/1262

I can convert it to a "good first issue" if you guys prefer.

Cheers,
Miguel
