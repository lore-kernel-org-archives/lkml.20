Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631500;
	b=nIUsG51uB31Ukn6OBu6oCVGP+PGx4r0TssExaMDcgFFl42yagWhrZD7Jhe5nZ7IcyxXb
	 HLJea3v+wHNgxCoPIfSJGBMYlpvTdqEwjMC87fwxw9RAgqTTk7KpXAE1zC7iS+mEKBirU
	 dX4jIYBBVv0XTI+XjcJwTX+UxwJvt3puK9HAu3UWKn/76KhNtUS1UKYH2OcLFtrcmEYqt
	 97vUHAaX/7+aK6bm3zJBZm4W/HY89/MxaYaAcx3uO9eclWvcqUP1JrNK5ovNunajBuBSu
	 3CyryVgq1BE35eQOlPFCRu0bI5+2A/A5TtR1otRHEQjIQY/V3ffMukMg76q9Nabf5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
	b=WczakXPiF3yFFghBhgAfJF3MbArNb/8iJTuOiGrRBQ84jFOez2f8mYHcbEZRu/I7EFzA
	 25jSKRQ6egBCZ5DrJ67wQ/DA7fHHoS1xS3ob91rAY7BIrrofiWmpDo1C+hTNog1a01OuD
	 ypWmXo/AKNy6F7HnOBSasSpYxhD7lN1+wCKXJsJjj/rh3UgQOUYlTCHUPUNJCgsnAdK1e
	 +1fmVdW29Hm9NFaR9Unjy2h+5eBpVk0VVW4XSAo2LO7XtldR4DYFIIfy4VBzXJ1vEyUNV
	 S3tG5iCLMlExEmgSlGvPvc9zcRMpm1/HLnw1clmSE0bjXnrI4IKPENtPJpY0ko42dMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF818606FB59
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF818606FB59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so4271962eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=A7TNQmEtRhSGmI+/kljCE0Gf4gfBJHEXFtpbChpK1os5kr5tgYhjV+owLFr3lxH8Cl
         ccE8XMbOJoiUuY7e5Yjkc2+Dxpku9mV+tl255IkMZfvrrbw1S4XZr+GEshcP1SgVuJlX
         hxR8HudvVUygZv7ZszkctSoeyEcH1yC5lYWLIOiP5GLlYgTB90kg1Cx3PUkN1nVkhhMG
         Y/Bm72LV7J/NZyre2Nzisx0wk1LzHo2wi0DyxJE9CURZoU8cYI4W/ECQ+ZQAtofypAh9
         SNT3pEAqIVGV3ITZxyIjtB+WE2fLlhHCrd/UAKuPBIQjvdTNNGMpBbV8CGl+oECIvuV7
         ICNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=RnGpoSP8scT3HOwGzWn5HGPgugzNMHYFV84+N9WuYPKIaO5Gx2ifdEvTZonsTPoDR/
         QDuGH3dmDWwHD0NCBnyQOJwLw8SMnGERKcIrQlma74X8dmxcL0cuQhE9zoYHC9gZcBC3
         idxblzoZqGhNF0WCiQMsE6rqIekSWgpZ1Hx0Xu3ahZlLIaxWyzbVO2pxc4ZsFe2WKjiq
         Tk89GfW0qm+JxeLAPHuZ0776D9LgDAXN4LTicuVBK3gOw7HI5UuGRH3DY47d93r6WMTQ
         7Sn5q6P8pZgLg+jQnMOLHdi24FiPfFTdkGcC8tVNmi5tQsQOZdZ/kyb9NcA3ThJwixYL
         Q+DA==
X-Forwarded-Encrypted: i=1; AKwUvByTQR1fu3KYh+t9R/pQzkTMZOJa2uy0uD4X6wHTLqZ5p85RcOt94Jj8ucryzaOCSAp4CtlOrumdvAGpM38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/HNc6WgqNnGFE89W0QVGIf00uuvpAD5HyGSLzEme7VABB0/5T
	p1Bf4iW92Pp6O2cIgPLrNE3bkGlZ9sIPrX6cPXMVGJ8v/j7jOqFOxXo=
X-Gm-Gg: AYBFou2LYaD4jBvNb+b1QiMxYNzNTv/iDVeL766lN04nU+eToCrBDpsNg6RRgqvpbd2
	QFwKKNX9t3icjd9h2ZOFiIULhZm7C0cmFzU+/weuWtR4ecdQ+Bt5pFztP1oHp9ljQgTB/ZIQj6m
	VSk8EFpfaHk5q/qzH3tdT1tMoYscPTHgjg77FjO0EcT9zhCUn6GujOG66C2WzDOfsPAv4GbkGoY
	ZNJ4d8SRcg5HfeO7FEEmjdvRzAkb8BgQcAJqIKDTlaqo2n5KVi9EEw+9cOaSlpW5C306i/+0lEG
	LYVD6cPXU4I8wm3G0NHmvbrepTzHI2/9XPX4M3dMqrQCz8eYdSVPQ5dXmRdHU34vdaplDMDgQwO
	cCGVKY08V2qJfu7/XgzsYaLWnUDfjTfyubfQUPVdgNYkga8zdwo8g0v7H1R4kBB8mnBI9SwqBsd
	0GFeEjafoYm3L/TmCGYTkYp5wbuzigm76X9C29tWQhxPYm2sIX0gjKilpK4BMVhnWJg2Ez22Qaw
	6AW9YbjYLteXd46qY54MIR9e4N5bwivAA49qdirOVb2CvdnJ53RW2h1qQlS0s50Bc45aNHjYpoG
	pTqzSRmhhBX3FdsyI1RETd5ScDZhVBE3LMroFLZAEiuDInYwdf6UZXEP2nMxoVM2
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr16137115eec.7.1793631498925;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm42424368eec.29.2026.11.02.06.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:58:17 -0800 (PST)
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
Date: Mon, 02 Nov 2026 11:58:11 -0300
Message-Id: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>

On Thu Oct 29, 2026 at 1:59 PM -03, Nicol=C3=A1s Antinori via B4 Relay wrot=
e:
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> KUnit tests in Rust are written using user-space like syntax. This patch
> adds support for the `#[should_panic]` attribute, enabling the user to
> test conditions that are expected to cause a panic and report the test
> as successful.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Hello, Sashiko found two issues [1] with this patch:

> [Severity: High]
> Will these new selftests crash the kernel or hang when
> CONFIG_RUST_KUNIT_SELFTEST is enabled under CONFIG_UML=3Dy,
> CONFIG_PANIC_ON_OOPS=3Dy, or CONFIG_BUG=3Dn?

This is true, I tested this with:

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_UML=3Dy \
	--arch=3Dum rust_kernel_kunit

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_PANIC_ON_OOPS=3Dy \
	--arch=3Dx86_64 rust_kernel_kunit

And some other configs using the configs causing problems.

To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
the test won't run and won't show up in the summary.

> [Severity: Medium]
> Does defining macro_rules! assert and macro_rules! assert_eq at module sc=
ope
> in kunit_tests() leak the preceding test's #should_panic value into helpe=
r
> functions or impl blocks defined later in the module?

This is also true, the solution was redefining the `assert!` and
`assert_eq!` macros inside the function's body (as Sashiko suggested).

I'll wait a bit in case there are any feedback on the current series and
send a v3 with these changes.=20

Best Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261029-rust_kunit_v6_send-v2-0-5ce551e=
fc48e@gmail.com?part=3D1
