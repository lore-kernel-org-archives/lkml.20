Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BC43B6CB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279366; cv=pass; b=DilrgtENHZIuOoqwLtjWHxUBEFG7CTkg7cgxtfGeKqNJ9yE56wVnQD9JjClPhvdJgmjfFvZMhwDg//gV18qYPaxrm0PqTUYlcxbDWY3yi4gfXrw6H0hgLHFq0KKksYKqSKNHGu6/UiDUluCTyMyRlxXMKIAAD3HyuHMZg40cTg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279366; c=relaxed/simple;
	bh=F6MPTDS/Eqn9KuNPCidvBhD+gbRYSXGKg84eSl+zteQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHM3yu3cMDeSKt6gjtHD0jLNZser/kqeklvPrQD51WF4mLU6L9GhgS1NVzQEP3MjAzk5jmwc0tph77eoD1KHyz+fDAgW++x3BzZUnLF2oCOcTkcyCfI4R0EeaE1NsKygLA54ZaX8IyoM8ZaPmixTRkGJvMCDHL05il/CKH51smc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leVOTp0v; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leVOTp0v"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d70066b704so5291675ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279365; cv=none;
        d=google.com; s=arc-20260327;
        b=Wf7IwsYIkVpB3qDJJYcMNjwYrtpvnLbxxvDkIkN6ZuIoplIh5vtWIS4BFJt8ibqNCo
         XpnLGd8rJhP/D0NxGex/HbNSoYNkfi7NDSnDmlQVykNjg4Ual9vJKM5/zzkjIqvjM8yi
         ANrnRK/f8XiDb7Mwma7c91+8EoAse2keH8EpVTTrEPVOEGKYYJXf1rdxxlTP0dknJR0M
         UKlnaNOvYEVJKNpUHF5XvRwVd1/DvYEUUVr/8qF2PC3p5L/ZCH8kskgedr9dPTdqHckk
         I6zUCvDvqMV7JbAq+obzLayORqWLjJ9M7TfmaVu167tohBB1D1oXgUll+MCDO+zW0pCJ
         LRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        fh=5j0RNF9bDnsPnpzjAgch8cW+x5rc/cT2kuESCXYqBSE=;
        b=D7E7rymG1yAbqhIpPvtf9rqSehsTCUCFsGda+ugBMUyshXhGwETQWISArbWdpxiLL3
         CcK36D7F0+hLkXy0oBmhbL5lNLsdjw2FPR99+4lAn3IBEIvnfe0IAYq6YIiS7L3HNwKT
         sDK20AUGy2lj1HlSHeGSrHo6snsGzFfgOxjkh1JpKcwGNHn+N6Cb2zoIgR6xekjC1HJf
         4/9M0wIF6serteGc/C/APkQHIdJp9fkUFYI51XyTNTsSgi96O/gLsoqig6HdDxEAh5vt
         fSdvArqRAafU4Lkepozk6GGsfUhkJDAuyHLaODHUHdr5nE90M+1VqI84Zxhe+VTlJ2YN
         AR7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279365; x=1788884165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        b=leVOTp0vW0NbRVJNGDc7c5iBwRf1nncQkjYdC5LF/0JCT0ZIxVFXUSJk2yLSG7uT5T
         ps7AnHzUOF8eMjd+BODItg8Ap5LaRsGgyfEh9LoMufzPnIBx5nNh+n5Hvoh5gfYtHZ2v
         ZOurboKc88l2KjGh+sZHHFx4h91cnQodPy6DbL0XGl/ccU6qjRjx0tlmN7fPemXfLVjc
         14+j6/5YHaKU4Io9DuhL1p5AdWSF1orZZsEzpj7Xt5AnWGmxQr+wPbstyXwETJsmDvob
         tUFYuRNlnEgyWgtOYPL1GFw6BI5T0zaZp2czKHJGmqrqvsrxxBgxjMxRNOBVUyTixG3m
         ToRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279365; x=1788884165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        b=oaJWi8ftnGJbhNAr1fOKxF0Rji9w1xO5tUNfrA+KWzaY4r6xPfItiNAWxKgEuBqUuq
         plyNIbkmPCwOlmqpCxTVSF6HRCGgW5fpuVI9KrTJS0N9hEiYUfPT8oVT9Oi5fSZBzNds
         u69V9++pPXABP9XTo8KePQCnL+khKHnDNcDtcItYsSeuOJoWJjyeY/jtZD1TblfAfJEz
         ZeO4Gp8jK4MoRLTUtTcJnvHORCBi1obDc/SuT8fuI5x4GpcDrUhNXp1v+Y5KWTA+gBus
         tfazmuA4RMlQ1saXezwajcI/bRHLuOzCkAMIZjwbl8gtBLLsif5M8/5tppSxQCxZzKoR
         ZyzA==
X-Forwarded-Encrypted: i=1; AKwUvByAgwE7nn58rpF44ToXFBzJmPDBJ6sStP4Pnoa5m2HNGKKbHZQiiAJpmnkuMKPOWjtcCO5eg5LJW80M5NE=@vger.kernel.org
X-Gm-Message-State: AFuF++lnkSdeBVsv6q3sytRvJh/nJOBAOoN8zvXKgmC33jv0FODvaFSG
	w0MewW40YQ4yqyxNVLo/jX3y/BPBVjy0ZXHQfak6jYvm4yvk8ccdMIt3k0cgiAZ/8RNq1TPb33D
	icANe7XgnlANacoZ8BYTgs/BjOTTPs9A=
X-Gm-Gg: AYBFou1uN4qQIUrxxtJrx6vFc58CvrEO6EKmK9EbygN/cqA0C2ChE4KD/GzpQPiDDAo
	XY/ORUEpRWtVIcbbV0AscKJN7KZztJ052QZ31sid8KDO+rXMiNJjYvPqKE+bcvtoI70uMMzfM9m
	QA4ekBnoyGaDM+YNXSbTfHO5seOLEVnxGwReaFCSPT8VEv9la2OPzh7mIB60cCGecBmmWXpDt6p
	YRssmUi3g15dJHUnFXCac0069fFDEVvs7BQFAOvJ9nzskvYd0+PeOLQOAojK9mtmmYMeB1KynrH
	uGwDJ6U6qClpQdJ/CPU5a5/oFi/vB896sfOPZMFXpM/1tESgwEZL0o6br49NuWMAARfpmgSO6XY
	alf1IILwqUgXZmqkn8DtZHN99bf6dt1RgmPBUZdON216ez7qN1zlhORUdOnloNA==
X-Received: by 2002:a17:903:1106:b0:2d6:f09a:da1f with SMTP id
 d9443c01a7336-2d74e0bab6emr289807995ad.4.1788279364809; Tue, 01 Sep 2026
 09:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 18:15:52 +0200
X-Gm-Features: AcwNN1W8b8265qN_tDq5LcEUWEhKOJq8yfSF3I7LdYBVS-vnqEHCYN7HeDbPUPI
Message-ID: <CANiq72kb=X1igu+pK=KmAxqDncGYF9zpxrihSuSD3WaCUm336Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] rust_binder: consolidate transaction failure prints
To: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index a56ba6309594..380cd3f7276b 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -135,7 +135,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error =
{
>      /// Creates an [`Error`] from a kernel error code.
>      ///
>      /// Returns [`None`] if `errno` is out-of-range.
> -    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
> +    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Erro=
r> {
>          if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
>              return None;
>          }

Generally speaking, one should know from the context whether an
integer is supposed to be an error or not, and thus it is rare to need
this function instead of the public one (this one is private, and the
two callers are here, not elsewhere in `kernel`).

So I wondered if Binder needs this -- I noticed the change when doing
my usual go-through-the-ML exercise and asked Alice about it, since it
seemed to me like Binder could perhaps avoid using the fallible
operation (and maybe even define an `enum` for `BinderError` instead
of a `struct` to be more precise about when a `source` is needed).

Alice told me that the `Option` in `BinderError` is just meant for the
zero case, i.e. the raw integer there should not be a random value.
Thus, since the `if` already covers the zero case, it does look like
this could use the infallible operation since we do know statically it
should be an error (modulo a bug).

So it sounds like the change can indeed be avoided, which should also
improve the code.

In any case, if we keep it, then the `error.rs` change should be
mentioned in the commit message.

By the way, I am still happy to take the first three patches unless
Binder is picking this up.

Thanks!

Cheers,
Miguel
