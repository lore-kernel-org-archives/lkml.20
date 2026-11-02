Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793634688;
	b=PGMPIlAPRyMd8hNaIemBp4xvDizhwkZfeWJHHeu5Vh2YBUc5rLxsU3RdEMLy/n1ehRaR
	 uOg3aUEr6e7t12mLqUEWhOYx+7YlJAIXprE3VS98wCAl4MMGg4w3DdXbJCApvBgnH0UKJ
	 AoYxRrDNb3uB4qKcOpupN2l/VaD3b7WpuzDW3ItrfDmxA3W+LoQ/MyhG0mHeUpmS+RIxO
	 B18IxJqA0Sw8EuF/8t/iDP7ELBVUmM7BN1eLtqHQQsM7rHRblMRDjKnCpWyybeo2k2Bgq
	 dkwy/QGhk69LxycIX82L9UAfr2M5Zv8bwTQk/qyiFi4y2hOYuCrjbEH8Ob2tcesq3jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
	b=wVV+q6aWOxJNb2IOhAkAh2Tu0vLzYLXEdS9csr48xd1SlSZKwuExDyAVjZUfGfRQMAB9
	 IYrNnsTd88GfP1xvz8X71u1PreqQwA28ZdWkO0BErj1DWbyjAJq4OCZvneLQ44PdKnZsq
	 suzCVV/ubV4lgzWNa4WrcKrXcv9BLmB8fD+bFXRxHcx6a0Z7lP3vunbhPfy0rTxgoXwSj
	 1bxlSuZSfMeQNxsAG2HIN0sCZP6Co2DjVtDW/Iowd9t3dgdFyrLGWRjr6/bKSqap0tT9J
	 EhFuT2uy4aFAgCjdKzPONK/6AY1VL+uirDqLEDAl1VSCBARzyUKVNZz/iFvRvHyJtWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5hjpdj;
	arc=fail smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991116079906
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991116079906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5hjpdj
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a6ee9c59aso154785eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634682; cv=none;
        d=google.com; s=arc-20260327;
        b=l/R2BxUghyQJDyVfERSaiBuohjwN32gVECcLm+HsF25Nt3Xa6ctj/mAPNNxAiT8zvX
         qaWbZl3GmDtw1tFdEVaAVY6hQu1WPHF+pVOYRK6O8tScjkh5/jsaclhnbyT+jArmt41c
         7b8dt4VHFhntlZ8odtda15fKwLFkyn4JqU1u35UrYmzWdmNsjbAq6cmhDuUilVDF2APy
         Rq3BzNTB9UP7O3QiA2DcdLaLP9DUSlzBDoskT27JSeUV6/A1ss2hLLKpg+R3lg+x96Xs
         5h34kZ2c/1y7LA8l6Y36Dmz4tJNGdoihkdoL8rg7DIUhLWLbDtZCNIt1s4Mb3feCf9tJ
         5QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        fh=p3E3TqMpUCb6FkXP7TSexMC0yYRZEOu6bH7xJrno6VQ=;
        b=QqTy8VEw6A0rdWQA7bzFZtWhtz/SW+wsoJNxtWiwKDesymk6AQTrmnX1BfHsQIHj0A
         asmvjTfCDd03hAkQ3Q4I628chbBv4XbI4ZzHNh64A0dkViM9g7ZfqdCB8sddxP89B+Uy
         v1S2kKv4/Rs1PEaoDCoDnA4uAoBx6GzTj5YEflwlZjhcvEf+d2n0W6tdwSz4eepTx9bf
         WgEsMz7x9N1ZXpaW/NV0elCmOKS6bxOHYOwqDMpKxX2Ttek2vZEqpJgp2m0KS9UnXD/y
         uIxcA9XDKNl02sSZOnVMwXHXKP+2nBQFUjVcPPwmLhl2MrHsjRetTimOClYgTIx0J2XP
         Qd5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634682; x=1794239482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=Jx5hjpdjjlBsO+DGmDLrmel8TNZ68ZGcN+mrdu/XdnLZ3su7Qt+mo5I3Wn4KkNM0RG
         pEpZJirbWbDM2osWmn7EKh5faQSGmGgExI5B1X/4680rFZmaCbJKKxBmzl/T4N/69kYG
         iqs5LLBESRVpZObsQgILvEGVNjPjK35NtXFnUy60hwgDQTNUfkbqspJbsxeXWz9IvNC9
         OHix8ncaHVl/1Xk5w2THLiQ8UoC9ybR8pBsJynLjfB58/ROOImgsNoyOgaPa9aW1Jrar
         3UHkyfTuhfGgcLQDz/LQvCMeJT/xtikdtIUB2DvhmztgXDZ/Mbi1p8cvrIUuQGTutLX5
         ZztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634682; x=1794239482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=JLnrYksvToF6rsBXTAvM+AUA43JKnj535MczVuT2RlnPo2u2kex547LS7W3/AYHcU7
         X+r/IvPvp0BX20KFrfLmlmhP1aO7cVONq3gD57h8b/sjIZENfr/raKbrsAhbWO4bzdHE
         hu7ynQVR4rJjEj+sl42iHoJxw2aqAmjcjN0RGH7XkrNk+8lWSVGbHneG7EvdQZUKeqMc
         EY7haXrwspm8NhpirYX/vz3ZxRA3iC0PrQH6aYZpP8VMl0pd1RviXjUzXRU3thjl+is5
         v5YagTkiw4Uub2otrjdmDdtw4BDjdNVYfs2BF4GlbkZXw3iLQRaausvT/fnffmXxNVDP
         Basw==
X-Forwarded-Encrypted: i=1; AKwUvBzZftmpmnRcm7VEKfCHID0T6/iVLO7KvVwbx7M9hA2O4yOwCukZSGLyfFKHHW7L4FaMhtjHCLVCknIup7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FtVi6itHolIK9EdWvDB7sEdzcfazvWzWFNtPum/hTqJp3AvlS
	Ssweo57Q1LXGzC2Hf1uDeEXexfzziT6JFFG6Pu1W2BxxeZQ5JS+8pYHsPdAsWB+cjcRYJugjMCG
	NYZPk5jRy91sVy1e1/gBavL0t1Hemuhs=
X-Gm-Gg: AYBFou3+/cZnXQSTKinpONfU+ljrurxmf9aGMiKLvmr9oCp+Ce+WHuj/sC8Kp0DgNUz
	7BZHltBOdxP2vUm+cvfkJVEkwTL5y8qB/8nWusMRdtJlYKZ5QaZHL4oMsnjQxF95JsXm9c308Zq
	8SdW1+DtI/vgqV6maBa6ahBJlguZkGOMkkwD32253vYnwQDuI26EoqJK+MEZyQ+nqEKVw9lJOIE
	R2Tm9EEEHe+BKMXxvx6v5fJHisZcuXkD1nrNgvBzxG0s7BTBUhIdHeRhFJnJCjdnOYPlFa7Ev0g
	43/2cd4cn73gp4rNh/LX/fZVzHXlXzGPZWKdjx1ogvvjTt6ZSiYUnmb4LMaS1YZ9SCLvHjHOWEf
	cPt3ASh+F2ErEFnVrct0CZdzh4ELcEDQ02AKYLrVvZWoaGB7BHyaOZ4QwNUK1FXKgOCc5De44Tl
	VKM6lA1p5XaWgc8cCNXn1dbjfo3Vhyq1sBgnv0F7g9Ia5PvcVFtD8QJ1s8MoUTVjvWkr1crl5H5
	lUkAjBb7ybK0iv8iGr/0s6pTy4KJWk/ynabBrUyXeo2M6qe4dowiCKSoQ==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-36a4220aab3mr23175401eec.1.1793634681766; Mon, 02 Nov 2026
 07:51:21 -0800 (PST)
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
In-Reply-To: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 16:51:07 +0100
X-Gm-Features: AclHuK-Fy3prM0NkytCqnZerg0IISmU7H9eN5VZP0wCcLTYRYHd1nA0RhfMUSSk
Message-ID: <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:58=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
> the test won't run and won't show up in the summary.

I was wondering if we needed the flexibility, i.e. if we could just
simply disable them when the conditions are not satisfied, but I guess
given `CONFIG_KUNIT_FAULT_TEST`'s existing description, it may make
sense to have a new Kconfig symbol -- do the ones added here look
similar in the kernel log to those fault ones?

(And I was wondering because, in general, adding Kconfig symbols has a
price: users may get confused etc.).

Cheers,
Miguel
