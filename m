Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723574;
	b=tnpGGd4BXZ5bLDjw/kA6+orhIPNIEho2GClkp/ijy3yI0tG997D+kS7w1NH0kmkXQ8Bn
	 mUhZEavELTB1lMSLaz/nM4tXoRIuzWTmS9nXVaMUYDev6F2PgNn5A15JrQUI/6qD75K81
	 eX01CVPmIgfxNqC5sRZjV0YwxY9ujyXlH/BoCqgOr57eySuitpOWZeV+Zx6K89hdBaIzz
	 DQY5y1iOhybAVUvcVFn2wW8Y4NluHOiWn8UDeNfu6gyp9aCVaCFJf834qL3d+gnmFhxgk
	 WOWpTEgfR+sO7pIEfUQ/FAqOtkgaGIXqpzCkj+mnTj4lQ4c2awL7loCA3AG+TSWGUqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
	b=wS5brIfR4O5Vqn3PzjPQDaSJz8ygnf+Uwu5eGqpvtY1qWCefKi6D4Bzu6tgr1YYuTf+O
	 9S5bNi56F5nkwJudQbVVG/nE+09wmT2r7ZuHkdFsSikiFGvitR+VIQ1kZEsGIPPR0vwU7
	 gUNb38H9NeBqBfKs5lceg4BRgyT2ZkkR22jPZUOymTCyeDgPw0ruBFm0qpxcaqI8O8kPH
	 pWyYX1OgZlKvodCnDc3nTxw8bvSD7rPBA325M2n19dpEWCQmjinD14JfP4m/AQnv8xfeT
	 7U12+zHRIBdswTBQPm/my4eYzPDDYEeF54Y0BwA4I4J6v8D8uVq7Twl3K+/XUmfOIIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763B606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6763B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369fc2e984fso431363eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723572; cv=none;
        d=google.com; s=arc-20260327;
        b=WvEIeF4XXFrPpvRF/vtJJZBbuRq+Tkk+9t8nSeYNl/p975e2Ife5qck0eELfqCYQPl
         cgynzgeosxTGgvJtW2LVtp9kf49lBahEikozXPIwvFE8zmRQ/HHq5DwQOfhCU2hcu3Rg
         QMICFn61JRjO1BFdCII9fg+2vFGO4BUBg8XDc2dMs8erTb3zdpiMQnWBas7W5e49jOXA
         T7ALdMs0O98Xf/7XSM9t4diiBh2Ze07B30vqnsAVKcmNiVt4dCNlGrP5SCBSxzAQqfUU
         2Qm6AT1cSqcSQ+du10Vvbl/MSteX5NrAgzmEbtaQ+jQ2RXGkn6CCuu4urbVVWILlWXeT
         A1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        fh=0W/JqVfclPZx8LvuLyfiALaoatcecY6KF0723sJemk4=;
        b=UpMy+kpkGy32XrYc0P8y3Yg+7YqDTUpaGwVw25BGXrZtZuE9CSYCpiLENsRj028PuL
         NbC6Ehz6N4gvKnig4SuxBAlG1fglPQ3InTQ8RhgFx+aJM/nwJu4+h0dX27OSVhxNd4NT
         rH/E70YEfXlzxwbPHni1GxXJCnC1NMuoi9LhefMb+1IzDQBbByqGxbVtFzfs/OfzRqqm
         OviPac+tjQy5uoCU+73gc9N4VJD4Ant9W6S6fSIkr3di/b/0YpHhHI0HKuvrQDOVkdMl
         1E3pj/7AE/EbXdH7CsheT0RCAdkQNz8JLpSdQ2Hu+8ecsRiajvxsbr/mfgw7pOMO9opw
         srZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723572; x=1794328372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=q3FJQM3CxAp6nXOI7CrIcPwt0ftF1W1wq2B+rAtXOlUHVSX/WwEvf2/4lc2ZHoSmKz
         lnYXZtTv2P2QyyDtQUEgOUQoJkvotlVEjNzE09zJVAbHxhi6XXgNHQ1cEKP0stCoHCYC
         ++eJ1PHCvPzL/r+hM8dBmy9CYmZ2Wv/P3ojk3TN4ga5dbA5TjgOC7rKO9DwwO8uEYUQ/
         i9VXMSRdf8VlHX862nFR4uFY5XCI98B7n7+DXFoZG6ZpUw7R4kSQjt6E6yliUWxYFdEV
         YIVP2G/KStUn6XIkORPoM+IFZM7A/2gtwvghB8fP9b86UPdgBA2WIpPnjTqvvxiZ2fm7
         J0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723572; x=1794328372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=J4A/9G3rEl5Sb6eztae2WB9cUtFBp1exPCRd7naimTi8sqHJb1YpB2Hy/VlNnEnsaN
         Tk5zeG86dwGSpC/rF/D2ZS5d5Cwczx706v5DkdCtR1Tr2Ptx8ZZBBmfQ51FUWbP/LaMT
         TsnTlaDcTXYalG5jP1pfx3LwEY2ZsECbFwKpPOEL9HiUmVeeqyzYSTib4b/BLgywmj8B
         wU4lDQOwHysHLId1LWX8VB2Q8sBdOJqqtcbWLIm3OIaZgognpOjAKYFLtdavD+7fOSJ1
         Ny8SIAgKBOOO/bJG5OMymp/D31o4vSV8XUeVn1mEPUNFvtqPzbvap/bFShKzhaSKR/7y
         5GOg==
X-Forwarded-Encrypted: i=1; AKwUvBy77NzNhAyv25XnjwAE2atNUPRVWw03xQD+ehscLfcVL66/1jXCCCx4kFVk4vyQ913ZFZ8i+kP9qof8+7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z98x48pdKXFL1KXH2ELv02TI/rDofww9XwZpqbzb9f53QPijFbH
	cBig1yf2RIqG6RDD1TfylVAccVEQ3nrKwXr1Z98xSEfsI/LnU0IHGGfxJpCF2dLC3+Gqb5RL+ex
	UCR7vP59skAW3Nm7slKtIYFY6ED6AMoU=
X-Gm-Gg: AYBFou2IAN3Jq9Bign2gVlGpCL0kCNQecLkL//l86TJDmjMjVDyHVAlhjLbROpjEN3n
	aCpKUhlqMfZFoXkVyexysllqXBlLag7/qVvpOPEWc7ZueOzMuo0W1MMYztYMZvBIXjY+CuibBMO
	hC8T62fjw9yyLtcByd4NQUJmQZ3CVXrBiFIMuKJCQZb96FOKCBe94vM13Eg31HFjl+fv4A6BcRi
	ZC7wvzQ0OQ0tk5PbqMxu9ctsnxkpx6dkzwg9MKLjWzvLgo+vRQ7MXYbMcfE9LrAIrRky53oUZqY
	yBwnzLzsJVf+su+eW3OrZ4HsXG9fIFbPNU9ZRiEudti7UBYnxyWZFkBNx8DiKxDAKsR0PpIakX0
	aihZBX9uOKc1XRbkYZX1583Ev0GeRDTUF3z49wEiTXljzmk/YJwjYs3DWMYf7Jwdp74tb4B361c
	juWGeSUS7NY0RRvnEie2vbjymHS2G1JNYpDRgTlm5oRwm8GmYASLvwEsrMr6QUeAOo69NV1Gl6M
	/6c1Ac7PPbn7WLaxU7LiXoHVJkNFeSn8uiE
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr27747765eec.2.1793723572486; Tue, 03 Nov 2026
 08:32:52 -0800 (PST)
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
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
In-Reply-To: <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 17:32:38 +0100
X-Gm-Features: AclHuK90AIFn4pqC962aeL0MAPJKIlqb3W_SNsS254mHQiyiX6txvzvtQ8rl_to
Message-ID: <CANiq72mf6Hx1YZDKv0GKwEd2gDfQtUkuA4RGhgUEfOCpR0ixDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: David Gow <david@davidgow.net>
Cc: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:46=E2=80=AFPM David Gow <david@davidgow.net> wrote=
:
>
> I'd rather this not pass, personally. I think that an assert!() within a
> test should work normally (i.e., it's possible to assert that the test
> state is normal, and a failing assert will fail the test).
>
> I could be talked out of this if it's really unpleasantly different from
> non-kernel Rust, but in that case I think we'd want to make sure that
> kunit_assert!() within a test behaves like a normal assert even in a
> should_panic test.

Yeah, it all boils down to what we mean by `assert!()`.

When I implemented it back then, I intended to allow people to write
the normal asserts they would write (which could help in case we were
to e.g. import code from elsewhere, like a vendored library), as if
would have "Rust-panicked", but not "kernel-panicked".

Viewed in that light, `BUG()` would not necessarily need to make
`should_panic` succeed or not [*], but an `assert!(false)` would need
to make the test succeed. And then we could have a
`should_kernel_panic` and maybe expose a public `kunit_assert!` etc.
to distinguish them and so on.

Having said that, I am not sure how many tests would actually rely on
such differences... I think the core requirement is that, as you say,
we are able to test for Rust panics in functions we call within the
test (and ideally also other Rust panics within the test body too,
when viewed in the light above). But if something simplifies
implementation significantly, then we can consider other things.

[*] I asked an LLM to test what happens in userspace Rust when one
aborts/traps/etc., and it differs in stable between a normal test and
a doctest (with the default `panic=3Dunwind`): essentially, the former
dies, the latter succeeds -- it doesn't seem to be well-defined yet.
There is an issue for the doctest side of it:

  https://github.com/rust-lang/rust/issues/143009

and there is a bunch of discussion on the different linked PRs.

Cheers,
Miguel
