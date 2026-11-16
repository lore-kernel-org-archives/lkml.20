Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794853536;
	b=XK3FTY8b2Xuq8TEpud2PGoxdurnIeZu23qqNE27w2XYFOIChiY8AsuiDDli5OXjJvb69
	 WlNHcpX0r6OIZ9WP3sChM9P1gOflzXyMMZR55g9u1XNlYKKYCBdLvmAO930ZKRXgUCyfT
	 EeFOelgmvnVQeEXFpzX/2ue2kp70DEDL5XPJEAmVxWHLZt3+a0/l1uO/a6X3j1bKxsB4b
	 mp26itMD5kiz/Odvox2EFaV0cE8Ju9espudxl79HTDgYu3SfaHwPRCgROpBHBmAhA8VUW
	 /1Okk0FQALj32TOU/kUBPTLdSH3y+Fnx+YzilQdqTdbgDesgGX8mhLsIXjv9pWAMCbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
	b=ntEsiEO6Lm2EAd7lcbOsZbuqrERObFAZThSHltgBI/2kWYKz5tet20pcsPhzuHrLjClR
	 GYHh4Oh6+Qz/0eWxQHGrH7p9zBkNH9+H5PlCRyxECt7CIjAqc+5oVQJW6RhXQMPliG1Su
	 hcqAox9qJXO88SoDwC7kzOPRFmozQa1i5YF5bZ3Or1lVupO2tA7zpNjw9pC+yaFm5AoBc
	 F0Him7HP6PXfSLo4d+8JYA0X4wDwXSyicnwVlmvc5xONX+lu9doIPr5ozOp5rc29DXjKJ
	 tXoyL/I10uIHA4FkBgnrVJ7oCaM4kc4MxBDdYdjAadWeAG/229jrFPY9vSsSZMcI3kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV49A7wz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ABB606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2ABB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV49A7wz
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso303607e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794853534; cv=none;
        d=google.com; s=arc-20260327;
        b=hZXLBYfIFW5kr80rUCGEIGPGdgaGPzQ4fJxOgs92El5aPX0FV88BW8VTUq14Nf3Hch
         tdR3kKyq8pNC7wkFbHd5OPo7k+kCPe7TDebZ7U9SC/LHN9MmCCbpTxYwveV4EEL3NyW6
         vSiGefUK41z/SRsUe60farlggqQO+r7jOPD1flMF3OzOaxiZET+pShEOuqvSYzna91MV
         +mzIygOGCqcc7xEGJ4oewvXddzzPsokDnjAUEazX2fPkPzRaRuq3j+XejZJTTA/own4w
         tTDsbJGOUgryPyp4QHXIAdGAnrejzJx8GmNa/tAqlwslsTns4pLhSYu6ZLtx8dWXYgkC
         rSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        fh=cdRF87dPHmb9V//MNEdB8DoOscSuzSjlyBDGfsyDbCI=;
        b=h9XYhc1geY7GNWmnKfuB4M/h7wP+S83v/kAdChqg2zDn+sRixH/R7CXNx8cZl1eilx
         dvYQkC2lVXlzYDZY6ngLmNuaBn15bShDxEYP0VGMLLq9Ly194IxmUCYYyTVOmO0k+5h/
         UNY6QwcroWm6OfR+wV2zrjFQCd/UCphYh1MZBFV0DkzfC0xGcc4Pj1NFdmYd6PlR8KRk
         E32WWOxh9FHTWmpVZ1YefumbuuHO42rKviBqn0r8qV/1hbUFnStzOvublF1JaYRIYdr1
         z9VN8SuFI/CARoRs1mv+7TD8X51bhYbocjy8luEwruoSxll0oLamTPKxqPegTr2Tx9oO
         nSSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853534; x=1795458334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        b=lV49A7wzomsZqR8kiAhUUO4KY4cqfBghHi42jDCtjLcwddNEXzn3+we0WVIyLa6NaM
         rEDvFzIWrRI2EyUL/1o0NkWi3J0I/p+1J2TBujOoaCJUN8rl+D0d2O9hfhf5jmEM6mYL
         UZq3v2IMxgOMAKYJuy/HcP2nEtUJ4O9Rcc3RzZ+Z2ZWcCmDqPbpldH6xI81uZAm+bL2+
         OEzheyX2lOblF/iXoDIEj5mk0IG2eLCxXJEL6IFYaBMResQ9FFej3cKhX5uTPvIbrQOb
         NpfyZVdr+i4exhyG0A425X+83YzxPpbTlLmUI7gvjyXN4BmWCl01eI5DrD5m6+StZzqf
         7Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853534; x=1795458334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        b=V4ux9Zcv9QJ8jBkN2qXufgLcUvbQ1pQT0tws1Um/z64L2I1FLJw+bIdhEicrkKoxj9
         nT2lkUr3qBAPXGci4O9w+MQpEeTrnQDCuFeMy+SQNyHJ4LRAAGWfwxmDnGXrNlGMUPVr
         fUO8acNvx76nWegPQSNxEGJrbFaGVDZ54IGaBVAvv4zEkNL+WrdgP2KY314xYZyzlRSw
         FtpPPFbqPytxlQZa8ix7d1xEkeUT26mxcQrdyVhk6ZZkA4+JM3jk+xkmP/1xWF5fSawD
         CKvFKyrfQELfcpZoQkZAJrWaepyE8IvfH5qI5ak5tMse3KkocGvHfM5wbiCi40zPfDPS
         PG1w==
X-Forwarded-Encrypted: i=1; AL+hErFqUyVD4FzudAJmeyT1AUXLwb+Bgd4c3rxoExkFp4dEP4vFh2cUEhOjU8Av/AjyF99MmmdPZsFhim80owE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nW9oQW1FO2gEOmLTuzZ/phED76Vq3/XGsIfNXMNMxfjI1BVBc
	sZv9lhFS7X9QWhJA6G871qMGveHOzQaWdQbkUUr/naHrzzv4afmxHVw4PwK4YdBuLpDzHFV/nUy
	WY7TAgAc6M3fFOgbPi8pPzzmYkxZD1Ub4nQ==
X-Gm-Gg: AYBFou3Xt+WXwEG7vjBsY3/IskK9YE0YueD7LEHmYw1a/HJgv1Ztlyc8CGLgEdngJTb
	FPEmTmBi3wHFDaUptEf4Lq6WkUT0nCxTtGBf9Z/QDmEDVTP3a8Q8eaNk6j/Jbu82nl65KtOOcA/
	rkKgp9o5H0Uscco9fFqDRpfGSICKAeF4Hbu6frhiXHFhPuApWJdoJ+O0YtAZpJBAdJkjIw2brnX
	yc0OXS6I50F8ZeLJc+oaZTOz2OX/XOcGP6bsSYwvdGKMlQCha+BV1dGgUcQIXGPUwN9eH0CoUgg
	XuBR0JXqwYAymOTVKp32dhAWUkl9fl/3QVyIR6c/boK8jFjK1bGYwqfzIb2zo0W4tj1BDg5aYDU
	qLnkI14rhWmo2e98NTzJrL06xSrJCXtq+NfoWOVJcsTf/tqtbXBZaF9APAg/rOXnyq2rcIg/omU
	Ndm6bJRR+0x8S2p5A/3gTcuZRZK1nLUCwc3d2njZhfjM/Sy/aGhlf6CbkS0RlZqYnmtKUbhEbfq
	1ODN8nK7wFzpr9Y/9lUf8vwr3j/TIS3+K3EhFOwZLdEToA2AElZ+wPlP1RaHR12t9zJ8srN+Eqc
	CWf/n7ZUiJSeL3ZCgdM=
X-Received: by 2002:a05:6512:3d20:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1709e0a05mr4430696e87.3.1794853533682; Mon, 16 Nov 2026
 10:25:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111205204.481923-1-afd@ti.com> <20261111231053.529616-1-afd@ti.com>
In-Reply-To: <20261111231053.529616-1-afd@ti.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2026 19:25:22 +0100
X-Gm-Features: Aa3M54rVRyf4es6TqziTYOUJHmL_VeIv9Dh3QTOWmj0uc-rB_srLGsXruXgTUXQ
Message-ID: <CANiq72my47EZMwqQ7+esPjYv4rcuawhXJVuptPUF-SOWWe5c6g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] rust: i2c: Remove use of bindings::i2c_match_id
To: Andrew Davis <afd@ti.com>
Cc: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:11=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> Well Sashiko suggested I take the easy way and just re-use a different C
> function instead of trying to open-code the loop in Rust. The C function

I noticed this series while going through Lore threads, and yeah, it
is generally better to avoid re-implementing logic in Rust if a
suitable function already exists in C in the subsystem (unless there
is a good reason to not do so, of course).

By the way, while the maintainers may already know about the removal,
I would suggest adding a Link: or commit reference to the patch
removing that C function, i.e. to give context for others.

I hope that helps!

Cheers,
Miguel
