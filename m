Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629612;
	b=tIDQhiYgb8k/nfRdpKn7/xpI8UooEM4W4F3pbd09elAfkRSKxhJdYz+GevZfk1CJ2RXp
	 g4uuH59kP6qCpr6BTi+A6NJPtH4rUEHP2jjSgn1o6iOwHUuLtbWACb08k20zqEoONgl/D
	 CqpFu7fKt01+4ofogqfHKR0Vv8M8Nwqpb7nhmyWq3GTGPaGJIJ15VzqpU+lDXf261sdp2
	 VVULmSMKmCSji8UdJ3mfJNUjDe5lQT2vOzW2TweA32a0fdwgOGQc2WAyglV1dlU7KxKm7
	 p+qITj7+UPq0f6izAUvke3LpZiC5wL1rGacCl4tr4NsZbP39ZNqNkNLIDhbVxS4BThw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
	b=5WHhkLd14wEQk5Ngu1DcClmj8RI+mRYw8nU5U4Bn6S1zKckuFLy2G6S6zu7gbF8pVsPc
	 VWEhWDolECe9tZvjrBJsd4jGC85vxuZZLwnUreKwIcQ9mlIy7uPdKfgtSdmNbNLOPBljH
	 zwjwfLagLTXbLB7dH0+4Boqx2dbalDFiL2OxIZituOVZAmDU8IWUfl92MibuwnqOVlgtq
	 z//SpnodXAi4mipDHZm2y2UasAySqh8HHMb7zjvSDZcVdBkA7pJ52PBkaycYmIvJRFyGn
	 c3c7iX/n6ffEL0aP16spuvjDQHARRcnjX2Igsbhxv7w5QZW8Vu6WwGg+/COLnrt0QLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4lf3Q7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E12606B924
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E12606B924
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4lf3Q7C
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcef474680so348407e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629605; cv=none;
        d=google.com; s=arc-20260327;
        b=lUSqspVtRvm84CxNRNK8usT15b68AE8k8bZk4d+y9TYQRWAtA+Ch2x3/AhsVMNtT3i
         PKRbPQmStWIjxGXDjUaQjvpBdguri1vkSDVcjY56q9dI8zMKBZOWWA/5pYWB2iZlMY1M
         Ke2IrB+0UYGb1eTFe0qUz0tUs+3/vLitn5N5mhiD/08r+8AB49SJor0PY1Cs+w60FVOH
         WanawZjFlqQUDAJbNTlDkr+yQ29cLFoWH1eRWQmxI1tDlixg6gytuZqFcsXq1j6POa3x
         5N/LGIefGa1RxnoJ7LrpEC+ZOxcmLnfRiz5wl1qy0d7fNfSuU+RgmmSFb9n7tXyLxg0M
         YldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        fh=lZVjZNmrQKN1Hc6kjny/ASpQ4/aP8H0OCRckPFIU2Ow=;
        b=UmKKXm2OUIO5BWlfvK5DDVU4QZpR3CySO5EJAZFtsboTRxOJ2ra9h2hgB6BEbAmxNU
         Uv75iLY/9Nf3eYGinO7YDbrqw0aS5sSS5pyFx+OnD0f/aSrLfKKx6CdFFjxokzgd7mtC
         9y4cvScQGLWIe7R3iedaUkcuLkYy/c4yg/eapjRla6dqRO/ppoaD1w51ckiKJbXYxhur
         OlGpWIHDZLrf1QA5pQJQNr+Sv3/VPwSRGy/gf55r6pgII/uN3swgQ9ZNE9HodM+gyzvT
         /QgnFLM1inhPjlmWlgUaDifupYeSK/OgokLBXuSxBFS5hxhjUwBCggWaMRP+HpryEmpn
         rUUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629605; x=1794234405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=g4lf3Q7C/ECvl0ewWE3h3lYQ8L1Zui7aD54BIDr3V1N3Km5Sr1f/fn854t/MRGZjNN
         sNdMgMCrxMB0zDoeI7bUQuQPvpQd0wbj3RB3BTXjJKa7hhMGfN+WR3OLNZUZImJLGLa+
         zXEsOz2KXsBMVaSrf/+3I5XGZQbaGRbqVxMXTxgxr2irqEkeVO0F+7BOc0obkHOLakHp
         beEiMidfsTQxxwA+hGc0URvyhVngIC1sLwx7Q32KfWvNQ+TnIWF23cgnETDj02w7aoF4
         +KOkgN853eF1nlGnjs5J2yQAN195pT/tZTYytbeSLLp7PZBPKBzVUze+umlqlXRhaALu
         HqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629605; x=1794234405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=k2MUaMQ9mE05Sntzm0b9o6idi96su9bGkr1mz0sOD6uvnZSOODnMSjObSOtbtjvXhQ
         tAOYz1kZLhDJvzdeYZPIXSULqqg4ndySVbaa+IWLtS9ynu4Fhr4J4kSZWCjJ+LvpntNw
         IE4CoFmIZ8qFLJtH/H1YlqsKsIJ3HeBt7yOzlhmcLk953SRHfBPJGxFirGxKKXnyj1rQ
         vC0r2p8NX+vm4z7/btXi8K8bDtV7goJ8a++tfKt7tgc553MyRObbCuQRFiUm8vGjwnK7
         NrgU8BxAxboZNJTl3NapWRqmomVTfaEVivfvon58gD2QxOlT050vgLlX7WQsp6y0KdQR
         sZQg==
X-Forwarded-Encrypted: i=1; AKwUvByuEmfVIqcTqCW6nF+ZRF/uyO+SVV5WEjdXllxt/7Q+hrLQV7g3gAJ2KFgx1epmX8d4MgdNuXTmnOgG+FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BV+oZDLtN3ssslYofwO2Nofeoh9RCij6t6Yrg22i139lC7ImG
	LiKNHw6+xCG9WoU+q20xY0eo+rUOHuwbkg03XYZr4MW7MEt9IyD8UmfhHiQl3FQicrLjUq3NLS2
	z4uuKuOc4exV0mR/yRLyb7cgCaCqralQ=
X-Gm-Gg: AYBFou35WIP6d/+ovbnVOdvoGDlP30GJL1bIdsjMZ8bpWFVhtnYXOliRc1jy7zvmb1n
	bZAS14ZG8XADYQb78wW8kNf5G5Giws8TXLTRScJVRoQHDZkvgN9/fN04mTg6V1LhSofzWg8+Z6c
	MFsWOFEA5tJeIm911GM9pvKe/P9f3r3Pt5m3O6CqHUU1q7gmb3xp3vjrrCu3+brCmDCH3sBuoS7
	QkuJ3+GhLA3/4VjTSujVuqz3H1YlhXLNnSOwqI6QXmCVV+8Q7J0cmQgti1/EW7/ecAVvHsHf8Ga
	WQtttjoKo+alSismq5iYeHhuL7/Mo3+qurt+YevcOMXahRIxPBAWVrvvkEujiwdIDUCMr1sJgHc
	XVfgQV9g8J8nn1PNQbAP3pTcHihbf2s4dhtUz9FFxoH/1RA23zgF+yWjKtbJEqHDDmehpgeqyd/
	GwM3mR5+hclJhcsp2HYrDA4fh686yep1SCKSbzresGMKHI0OAvAOILTLXAX169upLXUkYwc0SIN
	uqsKqfgDQIyOx4QbxeNlrWY6Yd/o2lkmWbw
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:526 with SMTP id
 2adb3069b0e04-5bfe32c075emr2457375e87.3.1793629604846; Mon, 02 Nov 2026
 06:26:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
 <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com> <kw-1793624159.027890950-307523-1@younes.io>
In-Reply-To: <kw-1793624159.027890950-307523-1@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 15:26:29 +0100
X-Gm-Features: AclHuK_BjZvgCearm3rbmVV9O5UMJr8vcWg-8C7BUiu_MBE5WEN3h5cW65l1BlY
Message-ID: <CANiq72k=Ru3QsiUjrXOtFqVuA-D+w8fJ2fUOTAL2cKFS0EhLDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: Younes <git@younes.io>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:56=E2=80=AFPM Younes <git@younes.io> wrote:
>
> It can only underflow if rustdoc stops emitting its own
> `#![allow(unused)]`, e.g. in a future version. A related case is a
> crate setting `#![doc(test(attr(...)))]`: rustdoc then emits those
> attributes instead, so the `- 1` can silently become wrong and
> doctests without any attributes get shifted. Either way we'd want to
> notice, so in v2 I'll check that the first line is `#![allow(unused)]`
> and panic otherwise, instead of clamping. What do you think?

If what we want is for people to simply notice, then I was thinking of
just `unwrap()`ping like others we have around there.

Having said that, it can be annoying and confusing if someone writes a
doctest and has to figure out what to change in these scripts (scripts
that they may not even know they exist...).

Ideally, I think we would have a "warning" somehow, i.e. something
that doesn't stop people from working but that will get noticed.

Cheers,
Miguel
