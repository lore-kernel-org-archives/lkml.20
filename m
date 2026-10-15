Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D8439F75
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073495; cv=pass; b=usVU4yxYqjbKNRl20r39aPYj9ysoIWPnHsvZsC4c98CgJ5BahqRF7Y/eYI1O0gTwrmn+op7sOX+1khfWC1daL28LL7iqrVWx8uc9B3SA1ObedIQYU0gY0eg2HcJxUs0uRAimU5SOR82oeayeAU4dWp7m/IWu7eDlbLx7DytXjWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073495; c=relaxed/simple;
	bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWDYpD8MqsCO8xoGyaXor14V3XeiU7XoAcvyaLZzBfau3mVoQqx0naa8PjLzB+9bAm0tv6EmxMECC60DXrYH4I656EK0ERO/rl+VRLhudm6QsxhX9yDbPAb24u39ZX1rvzs8+wBkR1EX00mgr+k0no6F1PdDLL0MN5nMYPZKrZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRg/RFyg; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRg/RFyg"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49de5c7e06fso134837fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073493; cv=none;
        d=google.com; s=arc-20260327;
        b=VCSQwEiS8Jm5F0XLrHjjgvrB5zsDKfiRJs/a6Pi7fBVAZ1Ni3/pwqh3lLUGwFwNvOS
         UBXq3HD2po/cbZPKog4MHmdbmEqj02X+mHG1pb6cqCn4dnUWAnD6kYSt5rzCJwhAwK4Q
         pNIttwtu99l9yrn5Uyqoqo0zip4mah6K6InoRPuTUyh/gWemhxLdO0bs4jyhcavWHAx3
         fNUb6vtFMPvk1V+tUvJfVdk1XskJBrpZgZofI8BZsgXbM7Ap0nlWTWSCDSefS1DDB31P
         bnyPnOJ+oBFqVnS/dLkA8OjIE7X0o5PnOX4UD+uaU8FXzQ1cn5ta/0PVHdKu4YlUsTDN
         sRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        fh=6ulo8MA8rB0+Wi56QFq16x5vjI38QBktK9sn5rEjl4g=;
        b=F7lZhN8LpcOFfFD3YaPqgNkbU3O6pmJBqypF81Mxj0ChGY5n4bg6ZSen2V9f3M+ncn
         eHmsMXwySoyUucDPvhR9IuonDE5ncBGU2HBqFNl59V+pBoIp0cQT0TOpAZyKzspCsghH
         2JEfeizgnwFj/dTsrLHVLgqWwvaJ3KxMcQ7TJs6UzhPwApBiwENlCV27MPPmSQ80uVU1
         HHL0rAAOu5oySdV+bOdLPKhUdUv0PiYnJMlO+7MmkUoRbU7Z7hYXx7Q91HezEVcEvbVs
         JIXVkklevWpigO4O3jQkWTYr6pBYnqZ35OwmhhABr2G2y4uN2UMQ/t2GMfhghBlL7Wb7
         gr1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073493; x=1792678293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        b=bRg/RFyghr0rxCER7Yccit9X31cP4U3s4lUls/fNEgrJHCdzIE3iXtbBfKPMwcniFx
         Zmq6/aP3s4568w2ozmBYud03/FVm4rN9TpZKkT2JAiCFrQvz55Yw9pIcKtiql6dWSPWa
         +DcgXtuzGMGNtkkHlI0MctneoMdiHB2m4iE9McM54CdO/AXPLshwQBwIXOahRQCASmN9
         mJO5Kv258cFeLDpeuAButPfL8FeT1c4BbiW9+f0LUlemNisqVH2P8oD5v2hn1icYVICg
         SPVb1/M2zODxBAy8Ww92YYt6m0ojj9MjNbCRqLgDd0DPTXn+EnG+I9xlbn5u7Q1hox3N
         KwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073493; x=1792678293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        b=ugYUvfoozQOExP13mEAj3528r8GLurrowRFg71TORth9/dgmyKdQhKSdXu3rlEXkBB
         zd2NgDk5oZVO2tJjNDdbO9Sd6SLuFlT7qUniTneQirxfCBK4ob7V/7xKfEJgLUterk/J
         Q5E80Y25tgDR/ajxyDKyA48gn4bfOfuWO8bL5pfGD7A1e0WiRiM8Kv0Rv6v0sOZahhmZ
         ULq2+xDWdlpzGvMrJHPgMJ6MdV1T3hpND0r2PIK0E0JQy3JCgY9aDL9Hqz860+oYmJLh
         XaVbSPO4FtQkPhGOpTvwmpOXtmGko/wtoseeGkd93Vjc1AJIkav6DPAII9twDLNuNWaR
         K3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBw7SAveN1A6ox33/Yxm1Nt0aa+SR5uaogKb5ZMbQQ9/CaeS8b9YckenCC56tv5NdvaSB7eGVeokST0B8lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKejqADU3saW/G5HuCBVlirEJno3I3wMYPG5iBdCGkwzbFBTCQg
	h8ikcAs4GVKRhU2dNbct7wMbz2TBXjVeLUBSlAJVfBbAw4RO0ndKUVRizTvFF5YTc0OljRSvv7U
	F+kvPZFgMSxDGFVDJjxUFYIJrI9wef3Q=
X-Gm-Gg: AYBFou1RWAGGM0mF+d9OOy2QbV4yN56Jb5EPBgZc8eC8vAevm7weYLXpGd+MS/bw8DP
	H82jdSFDPo2GLcRTSeDYMuvuUD0ed+4H6OxPWhBasc5B7YbpOGGZnXMca3foW+CM6asispX1M54
	vLK0d9q5KzeH0s2GGu3bzPW+xeL3Wz2K3EO+3njkakw9IHTQqbV2xNWVSCvs/NGGEwvv1T55TIf
	50J7oFyD5hkSkIoKqMtvYHsD/CUlpBDSGXNncl1MPo4m4phJmvwS6dXIp+8oo01RooxWe3sBheL
	PQX54wCaLhgfG93WMqwCbEu1r9BUL3jmX4RJrpFZ5SOe9ZzpQGnR3YsVodaFygzpxk8+vr9+D3T
	H8rlw2rMy3hdiiRfAnRVoyY+xpWIDivx/KLKx18/S7/orPeSrLZEVB8gxRoTfCRi/DfN3thd1h4
	ng5RPWybXxzwf5iZCKHGWrGwco0RL1FqspChbdK1htu0e2XnwpITk=
X-Received: by 2002:a05:6808:6c82:b0:4f5:c569:b9dc with SMTP id
 5614622812f47-50c322d0685mr27828787b6e.0.1792073493075; Thu, 15 Oct 2026
 07:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com> <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
In-Reply-To: <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:11:16 +0200
X-Gm-Features: AclHuK-BrRtruor9bjEzlo4wzp0P652R9kks6YvTL17OLNy7yC5MpbvU74aLVxw
Message-ID: <CANiq72mBAAQaJkL1Yji9hbPjWd9Nm48j6i1G1uE7+KP1kKSHrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: add NonEmpty
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lorenzo Delgado <lnsdev@proton.me>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> `kernel::types` is too generic and becomes a dumping ground of things. I =
wonder
> if we should group things that are new types with just range restrictions
> (together things like NonZero, Bounded, and perhaps eventually Range, Non=
Neg and
> others).

Yeah, we indeed had that problem, which is why nowadays as you say we
prefer things to be more split than less, because going into the
"grouping" direction is usually easier (i.e. it is easier to comer up
with better hierarchies when we have more types around, but it is
annoying to have a big file growing with no boundaries meanwhile).

Cheers,
Miguel
