Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886402;
	b=qG5l6EKGgC9Dv6e+cyFTO7i/TzNus+/UzSrd8n4Ggdr02xoYgH7WoXkkV/ZMr5crvfLe
	 fZ6plttIG+Rl0BPkwT3KF4aH9qSe7YldkhQrNE8gtKoaX9CVBe1uuvRD1e7deVxIACXik
	 uA3rFBEN2RBYCnVSbLIZh2S6jZsiczwlB7kDD1pp3deZeMWS74VfZArlutSJ39MRYN2sj
	 it8fWph0E3P0xdAMJ9oZh5Ml38JrQx75NeidcJeG8tOfrC3Xit3gtGd4jaIXxlaxlBh9S
	 7V5Zg1EfCHBV66cbtT0gLBcW75xnVBswmf+quRq03ScIUb6n40kbDczYGhGBqqpviNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
	b=4eh4BZmJfg1Tx2FT1nQ/AVBh4gZ4piQttT5cVNVCd2gzIvB2drD/vcTE7TjiGhumCqz4
	 47/Sq3fWqmo1D9CkdHm5jA90sDPwGvuvDC5TTR+XL2BOPSjfryUJI8PBwdN2R21SR41w7
	 WFUPrVwyFdqnRKVMvUUZUoUChZWIrkILdgw/cNuw6AApwX9WxtepHwkCN+F8BN1q9ZBKf
	 /s5Zi3A9LYskzE2xcT35CPRiGiOGVc4TGGLubMrkY3Izo0K6t+EVJSIoiTx7wHeEitlWA
	 3vUg8xR79pD8b5g36pijMxSQ6N2lNljA5yaekcYIl/X1cPyGoLcuqW1qb6l/+HwJ25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C794F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH+RVuwx
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e977109392so11364885ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886401; x=1794491201; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=IH+RVuwxIGYS+ptSubw3zVuKvxCYD5OLNL1eP0s4El01U4kCzmI0TYmQmuDZAe4xMM
         f2d35D08HOFyL+mRi6TnLDpLiuXbPGwdZ++KWgxANFGtdG+EinywYtq5FhY66LVupRUX
         Y6gL44mwhnIgJ+5T9cV8DQc3YFppkRcKIiAglBePWlab+gM9AUYg5ewyu4sQ4DFHidcK
         EQLpsRq64uaKaDg8jJ88xiFX74Q3oxcxrIst5wUI3JDf+rbXxnicXd5dEr9pIzLaTFPJ
         xt/TjL6jB3JmrH4BXyGqEDZewz1nAjoh/JTHKSWdyOeGBcYH1zKV+ojfP4pQ7Hjhjt+p
         AdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886401; x=1794491201;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vPSGzrcpdRS3fICM7ap8IknGi3mQqqFBaTOgviuKOc=;
        b=E5UQTj46s3et8lA6U4QNAdgqX9TvwwokScPYUetB00VbswiiVQG9DNKgzcB4YCqJU+
         m3hsKJCo0/vbalqA7nmGXmHdit20qL7GPqjI0DOy3HyXDKwk4QH7gK6YXuB5H+9M/rHX
         RvQD1D3lf9hsw5e4wtcPXapsfbigLHmwzE12RMB4t/M8H9YvJR3xYu7SZQnlhkBQ7h9e
         R7UN9rkioQoYUukV5t7W4KtlkSp0QyDdAy0Zc9GVgAcxSuSeDnHqSTvZwyqtfQrOYAKp
         FtGjPPOvO8AkiPBbaYGjtKC+TkJo1ooLELh8ohGi3WJ0ivZLX//XrvPuzqInZLzi3N7f
         GLwA==
X-Forwarded-Encrypted: i=1; AKwUvBzx88XMvKMZzYP+EkR/ev9+L+11WZ7qlUViamnB5hrbginPqxkig/a8mZxqTuDPgRgIgmYbNRit0iu5bbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySfUETbP2CIECrCB75V4fpJFZrLlmWpy4ZK/8frezUo5VE3iZ
	/NjdJOhBWvCX73eqXTfHtYrCIK5x2SGjDqHn2NHDe5aZqekPVnbRA9E=
X-Gm-Gg: AYBFou39ZvxVdrOWd5W9idt263OcDQZ7STgU9jCZPkbU6fbI/F0QMRtCBJ3n4aPk3+/
	CNQd1pu2SN+OjUtKdxfOnc+e4HFLNVSoZhbCart8Fce0iA+B/cd56Xd+khLZGo7GCX1jjXiDqjV
	lkYFOVvfD03LxzuYtffQyEKcQ3t2YlxigSt3K6lj8p42St6mO1QVjUnIfXvl9BDPeAjeyLwTET/
	9D+nfTbqz0cG3xOAera6V7rXFAAvj2+NKFXeSBMAhk9YPaZCG4RlJ5K1IdrLx8Kv+yaHu/mFbas
	mXAhTFjcefLdXd/tuZyA+f3DkKMdRlZESG4LRQ060ud2sLaNnZwqu/9tPHpLAQJSgE4h2057sXU
	5vq8+uExmQ+UZlYlPBRVoC5tWgUepKk3S1QRY7wWr0ssi/c6dLKiukZIMDZNUD1RNfQ8O/lUj8u
	ygLjyTP4atnWQvHKBYZD3qU/icW0zUjbCnCdaOZIbg49rEXutQok8Q6UBm8AT4QSjbrF2Z0hkda
	QhEtYm7jABw4S1qThqW3Mj62ranJ6LORNXhp/a8sg8UmbOtDZSU48Sf771CyzwZMJD3AvN0Nu3H
	B7BGGWKgcjtqy0W6thdyzATid7nw0TBb+nHpYRL++rkH/xsPV45LyJMhIf277V8m
X-Received: by 2002:a17:903:3c27:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2eb36450a4fmr182650275ad.32.1793886401061;
        Thu, 05 Nov 2026 05:46:41 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091cf87fsm17710175ad.67.2026.11.05.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:46:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:46:34 -0300
Message-Id: <DMNBNKKPHI0H.EZQ7YA2CSMEA@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: kunit: support #[should_panic] and same
 test name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>
In-Reply-To: <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>

On Tue Nov 3, 2026 at 11:45 AM -03, David Gow wrote:
> Thanks very much, Nicol=C3=A1s.
>
> I've had a closer look at the new version of this, and have a few=20
> comments. Ultimately, I think a mix of this version and the original RFC=
=20
> is probably best, and in particular, using a panic_handler instead of=20
> modifying kunit_try_catch, and removing the special-case assert!()=20
> handling would be ideal.
>
> Le 30/10/2026 =C3=A0 00:59, Nicol=C3=A1s Antinori via B4 Relay a =C3=A9cr=
it=C2=A0:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>=20
>> Changelog:
>>=20
>> v2:
>> - Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
>>    and changes.
>> - Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
>>    successful #[should_panic] tests": Solved by adding
>>    `rust_should_panic` in `kunit_try_catch` C struct to check if the tes=
t
>>    is expected to panic and act accordingly. Dismissed what I first talk=
ed
>>    about in [3].
>
> I think if we only handle Rust panics, this should go away, right?

Yes, it should. Since we won't `BUG()` anymore in case a test should
panic, the test thread won't exit with `-EINTR`. Because of this we
won't need to shield the feature behind a Kconfig symbol either, since
we won't have error logs in successful tests.

Here's the raw output from the panic handler version:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
    # rust_test_kunit_panic_in_kunit_test.speed: normal
    ok 1 rust_test_kunit_panic_in_kunit_test
ok 1 rust_kernel_kunit

for test:

#[test]
#[should_panic]
fn rust_test_kunit_panic_in_kunit_test() {
    panic!("This test should panic and pass");
}

>> - Now the tests that have an inactive #[cfg(..)] do not appear un the
>>    KUnit execution summary as ignored, they just do not run.
>> Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0=
d45311dd@gmail.com/
>>=20
>> - RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git=
.nico.antinori.7@gmail.com/
>>=20
>> 1. Supporting `#[should_panic]` [2]:
>>=20
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported yet).
>>=20
>> The way it is supported is by adding a new boolean property called
>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
>> `kunit_attributes` in kunit/try-catch.h and check for the
>> `try_catch->try_result` code and the named flag to detect if there was a
>> panic in `kunit_try_catch_run` function.
>
> I think rust_should_panic as an attribute is good, but it should just be=
=20
> checked from a panic_handler. If it supports more than just rust panics,=
=20
> it probably shouldn't be called *rust_*should_panic (and again, should=20
> probably be based on the warning suppression instead).

If we consider failed `assert!` from outside a #[test] function panics,
then I'll leave it like this, otherwise I am thinking of
`rust_should_fail`.

Thank you!
Nicol=C3=A1s
