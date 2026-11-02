Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654739;
	b=032FfHmVb5wIx3MYIEnPNgYvtVVMRwejuH/V9q2seNBJVe6GI+ZAFhm++tn4DdWNGlkq
	 2K0ZgodRMN9ptWHKUBO8o72q2aeZoZbl/97nKteOMEHrNIjEKW5yUvmIfpBCTN9rS385B
	 L8i6nOyVxoTB+v5Ph86rKrs3Jjbzz2D+42iTIY8G1Ix0CHFYLERilKfZ6DHl7ulN5K7wi
	 vWJDs7ozLNN3gE4BHNbCzSZK2AlFwIvx0cJzfPplZ+nLBDfATlgE1+vm7RRIRfE8p302A
	 iAYBGwyE6o1YieEPjlKp7WUQOr/2gQ6v8bINYC58dNCZ1RPtyrYRaWum0nN6MdHMWfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
	b=olxWt8SyAAvaweJ1mjzjYEROyBBL7juDvEVxn2g8c4G5inETb1RWxRJYQeqMjriXx9nD
	 Lfc0jgHWFs8KsFqCDjv5RnAxLhDavQJ2YgDK/+vjByni7+UYdQxnAV+KimzAJnhUvTYHq
	 l7QJY8rLy+j6Oy2I4If/bFQeqHqAhCMZdiYbtDnhn2rWKTHdqV/pxuF06iqbY7zPnHGkY
	 C3egxS8e5CTItCg4ecl1bD5q1brrZbVyX0fLUN7UjZt8APPxydHNhvJNd/jCx72x4nelo
	 aPXk2iGffz+YDwCOJjVxcNBe/PbHHFLljYFOflZM2pE/BhbX3d8s5FRcVnwlwPpRGCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32096606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32096606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550dd02c9cso297504eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654738; cv=none;
        d=google.com; s=arc-20260327;
        b=Cj27EkMgdGzxjcU2Dx662W+UodnHjCsUiTvZPdcN3slJRHwzY+6i7LiXn//V76o0fl
         dRauFlVnmg3lOwIoISQWFFV2Ep9/GdsYyj++e2gKrPRTstGLqW5l76XV2pj3GMY7R9W8
         R7mQdxFSo2ieM0AI65LL4Axo/4uwSY8mwgWQ8nxygZWRLGmGpx/S6irxsRVVBNs50evH
         YVBwJ/8lmhnb/O14pb2xxyM0EZoNIgi3RSNY0teBGpRndbEtmgMZf5O5awR2h/0asr93
         SGYfJpiD1Qe4GQAswvvGZG+ATco5oj8enKSiyJbIXzmNpScoKdqmzZYRM6WsDoRK+CQf
         9ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        fh=PTBhQvDpQLtnTeKcv+4EEACJ2wQZZb/NDHkuS0R1eaQ=;
        b=Xo9UbvgRDg7S/Zd1HIgjMKhiju1W5WB8+xCOKs7ELkte7D0KAXoUm8LQMc2GmfjWPC
         qfTyThqQxCzPP200eODH9uGWIzTi2EctocYTShHQswHCQKItbR/vo9TMY7rh78ZIGQ6y
         DrRLdF5NZ0S0PTn0dxtekqMXbyW4cAHGBAXLxNtWwcYkbmwayH55VrMiXwe+w9Z/LBI9
         YI0BAnYjEfMO+JsfwN9RMBs7UoniqZn4fCdVc6sQuBcplDxt2+XgBnY/3DMKkL/yo/Et
         e+q3gPqTQ0/xedpD0Iq2NrNl85tuwJs053CkQIM10zX1MDyvKtmawm1gI8uBqc+HDbCh
         0Rkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654738; x=1794259538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=hrKjcsxemS+R7t6+BuGkaaNRQAWd9Vbo6AUynjlhrP7M0Q59P6cuafnV6pNnxgFAGb
         KB02FBvER+TpA8PD8mjUF7eeoDxUswaCTWa9ij8bXEB72p4RWBNgNvg6rg3zhZy0Vx5Y
         NJDCYA7/soH/rr4G/01TLLkAsxX1ukCI6ZePr0Jo1wNBXWCMKfGOVsOhBqZ9pChaqF37
         wlRVwFP6+PsZH4brKF+ul9RXA6rThMgXO2L1LsfmaJhTEql47gogIQnZid1JQ847hSLu
         4aSmGkmYWJfGzY/3w5xVZQxROOLTYJqrO2uX5eAafjMB5Vs+olIHC52xToxgmuC8fWRc
         YqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654738; x=1794259538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=NhVhNQNj++P1N+yVSm7+GuhPeMHh5Zt7VePfdAE4FhHT5xOmCgl/QuWIx2b2dXpX1C
         aOVC0seW4WBkN/ESrfBiRjXUAmENgx5D/Yy0jdOlAWh5xvf9YCC389BGEWvZoyFDnQO8
         6MYoU5Z9d0OOkAm7CuXA89FF1v+yaxqGlNlMmY1OpF6Gm8ea8kISDUc9ru8lfM/bDsx3
         +7z3SGqqmPKpjWhPkQmrYbS7L4IGO0thOadh8hqeM1CzOXxtyrAVgvidYHGVrCw9unn1
         2X/uWDbOHSUCdcLcrLLioyjB5OstzLu6K7PyzuoX8Ut+wQhryIqShn4JB0GrOVtWx+zn
         cxNw==
X-Forwarded-Encrypted: i=1; AKwUvBwHaD+w72ZkiVK63vDKkna6Xd/1p+JcxYEJt+xSCtUsHb+4t9AgmqAdHaLTPTB/rbWD8IkIi3KzwlNnUgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ANVCIZSiI2jtgbOpDEqxXwB/ROalEsxt3GxAVnKvGu27HE4U9
	vEARLQIACs2PFjvX6m4HCXp1ajK3uVaWn3D2gy/78eOWUtqGCC23lv3l6lVHqonj7ojM4ddsiEh
	GhBmeLVGt45yYjw7mdclD2TLE31LlasU=
X-Gm-Gg: AYBFou1Gr2z4THHnExsJneoCwYqwL0wgnbwVOcUbe0nBk7bY5YzfaIr7dLpFWJA/uwW
	4bu1vA0XC82WFirKP1I+gN75/qsMLwCmReDJGkfALpJyhTsK39e3KLYbpewtM1NY+mq9S8rYcdz
	8EXoLTiioFLlmKZqEe0lnAHj5d8TA990VqjMDFAkE0jgmIAJa/ZZn7kOWgL0rGG4EH38OnunNJt
	T/pPWxAiJzVlgq5LwYQAWNcfbOlffx7HQP0yUoP0Du/e0xslhVQL2ZlnSx1popIlR8dvY8riqor
	qP2KpmnexIbELnPAs2bYEXlFQLHWo7fTGSSh5oxk3iI9uI85zyC+p/PdI18rD2NHfVB2oIcysQn
	2Oj8/U0rRev7KAvrVT1gejOBEyaOMtLY1XM+TUNGUg0OL62TRCT75GylsGQYsy0leO0HCi1Zu7e
	T6IqJ4TZVaeAfGAvLMP5KyE9cDE2+oazou+aW9y908lOaWuBKEYxBciv4hyVGLSZHFm4U3xC9mF
	BAk185/qemB7mG5UygCiY42zaMfafAHrJtC
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr22873570eec.2.1793654738038; Mon, 02 Nov 2026
 13:25:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com> <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
In-Reply-To: <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 22:25:25 +0100
X-Gm-Features: AclHuK9dhZ8ASIbeBndwVm6xD67vsmWuidG-t9qUn_gDwZivwLzke0us5vCUJEk
Message-ID: <CANiq72nVDshaUDKzLKsa-4kB13XvrB1-f-WaVkBecf-B45m=ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	David Gow <david@davidgow.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:53=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> I first thought of disabling `#[should_panic]` tests by directly
> checking the conditions in the macro code. I ended up creating a new
> config because I thought it would be cleaner codewise, if a new
> constraint arises in the future, we just have to add it to the
> `depends on` clause instead of modifying the macro code.

It depends on what we want: if it is meant to be configurable, then it
should be a visible Kconfig symbol; if not, then it should remain an
implementation detail (which could perhaps be a non-visible Kconfig
symbol).

> Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:

Yeah, in that case, I think a new visible Kconfig symbol may be
justifiable -- please see below.

> The only one that is different in `RUST_KUNIT_TESTS` is:
>
> #[test]
> #[should_panic]
> fn rust_test_assert_false_success_with_should_panic() {
>     assert!(false)
> }

I guess it is reasonable to expect this test to pass, since `assert!`
doesn't return and actually panics in normal Rust.

Having said that, I would expect our `should_panic` tests to be
generally about non-`assert*!` panics.

> On top of the reasons I gave above, I tried to follow the same as
> `CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
> in this case in particular, the config is not for enabling a test suite
> but for enabling a feature that can affect multiple suites (in this
> patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
> `CONFIG_RUST_BITMAP_KUNIT_TESTS`).

Yeah, it is a "mode" -- that is why originally I thought we would try
to just do the right thing automatically, i.e. enable them when
possible, but then when I saw the description of
`CONFIG_KUNIT_FAULT_TEST`:

    Enables fault handling tests for the KUnit framework. These tests may
    trigger a kernel BUG(), and the associated stack trace, even when they
    pass. If this conflicts with your test infrastrcture (or is confusing
    or annoying), they can be disabled by setting this to N.

and I thought it may be fair to have the Kconfig symbol, i.e. it could
also be annoying to see the traces or similar, and thus it may be that
someone needs to disable this.

Having said that, if nobody has asked, we could keep it simple for now
as well -- that may be fine too.

David: what do you think? Is it something that was discussed back then
for that one in C?

Cheers,
Miguel
