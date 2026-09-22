Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D2A3AEF45
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054134; cv=none; b=eN6oo6eQPxe7uK865d83Tl8+039VEm4qxU0o/+rnv+eyQWio6mhG4mj726sRYZZpcn5Wtyanz4edUEwjObyy34CEYAr14NFVYVTklcabOUUUxHpzV6+A4Esw4L2xmx7mG50NMHFnE7FvrQBbpcpgNqqo0pRioRhrlvEfmXq0Dtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054134; c=relaxed/simple;
	bh=ubfpb2m5HU3YtEzZMpoa32QD7iyghjLtFLw7dcH/EXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=I4YtcysCLEyBzq24v78MmTfh/FgmjqQgkx+H8Yg0OxfTfFaaWPPXTzWRlG0Fz1s4pnLq0KStJZFT3Z67aJ3vSVS7fEKu/wFgFQCwUfHx898InCt2FCjh2vBjEH+r9gpDLYZPJZy/6yjHvWll/7WqiNdLaRxHUnzrNjqcI1fmGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHtMia+D; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHtMia+D"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so3397384a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790054132; x=1790658932; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+v2SnJ+erN2CVEopX6PENJdGxiYPbzH9Iy+gl6b1SBE=;
        b=CHtMia+DDWplNTiQULOsmitkeXcYRblV4YzkBWX7YCvTM8qckq35pt/n1tH8QByRHF
         jSulh6q6RE+mdyWZhQoiPFOquNhhniMC7Skpul8k017PtsIzNF42U2txuNIZUDv/xWsu
         lAthq2Wv0iyaWX/5l1a+p5of1njPQ/g/Kokyyxy/c+4ayiy4VNSJv8dye9zJUsR5Np9d
         4Eg8lQbFsIt7cYUIshwBCkgCZKMuCsTGhpiMbiL6EWom72JFJxB++U6bILv+Gunl+Urx
         y0aHPhGi3UQp+l5D/Pj1u7sInr+g2Yq0Tfiyo+tZV4LFT2ICSz9wI2EUIpLPEtl1umne
         XNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054132; x=1790658932;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v2SnJ+erN2CVEopX6PENJdGxiYPbzH9Iy+gl6b1SBE=;
        b=G/1xTJo3TljD7+0WVwVjQtGl6mmY3L9xFdluelbgysqEGNa12beYDwkVoyuuyCSJND
         2Kc1sConDfh9JbtfH++dUVXO+ib5l8NSt3VOECUCyZFxHUhulGdCJn3yT+0wPZ7I+8Ys
         QifhDwt8YB9o1zMHTSKXyDxP5lI38PTc4yC/VVdVeR0MubMiLY6nl56B8TwFl7kbvQ3M
         LjDEx/Dvt2XdYx4rLcJO+RepSRIjEq/ocuZRHfy6mE6YoQk1BziByYnkB1O9g7AnykQs
         Ql/GzQg2vSkbfRmkYuxEoblxaWuaGhytH57k6/51kRxp+/s88/XQfkzNtzkHcqIP/CjQ
         xN4A==
X-Forwarded-Encrypted: i=1; AKwUvByxLEVis/QOLSffYSrnDHYB7ZOOnxWHFvWWK8b9tewDk5zdSGXh/2Y1THX7YwBZAg0nDMF0A9tXancoVBk=@vger.kernel.org
X-Gm-Message-State: AFuF++loynrBixTnH/mBFw/cctDJIRQEihKW76P/uLU0U/yFYhd5o5uo
	NwNAnW48ZhisRW6ZUCSHGAQnF0RzKL/N1tn5g4WQ7PNWL9rtU5mn3edZXvUolg==
X-Gm-Gg: AYBFou0sQvo9yqdENiZcYC6vbHbvJzyZTtvJ46BAFBPrTbu6QXEKeHPKd+ULds7FtN7
	WiLQbX4qCY7IUBAHV9IoRJ516K6Se5JjI9+bomqEnrw/gexZW3e5IXQsiBTZ/aj91dZdT5tn8Aw
	Z8pL2swUCo5DpPnh+TWbSuHygzpE0L3gRY4ys1s8d8MG1wEAZi7vmhfjz3ldC/cGnuW1qIlqxnH
	XoXwqrcl5g9AWJu9J7NA7wHRVVnbiQSvxKuQc7jbG4PrWAsXwIGfOHJPrPr3J9oPbGpgHY/O/YJ
	R4D5t+03j5eRoyxBQQp1FyTKCBn1WCaFtfe1fCA0AOpVHMPuBl1l5Wa6HjzxqXC1LxeunwwpeHW
	CmEEH1b0BIvIs+t4dIarjmBkslIR4tyRRgbAfgVTiwaVyZOdFWhJAsx6pVUQxoiG5bUPl9ty8u/
	XpH4pYmJW8aTi3TxPXDFGNsJYpwCpYScBdV8I79yMO4DhR6TVwWMBvPXwllXNwxOWFtDAc+srfq
	mcr09/uk78egxYzEtfHUZKGwVCCigwlS7GkijCIFpOROQz4I2KlSfFYXq2kmQUquLnObKaSx55H
	f5A=
X-Received: by 2002:a17:90b:37cc:b0:39e:6c6a:6579 with SMTP id 98e67ed59e1d1-3a07325025cmr4175a91.60.1790054132035;
        Mon, 21 Sep 2026 22:15:32 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cc3600bsm399617a91.4.2026.09.21.22.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 05:15:30 +0000
Message-Id: <DLLL8B7OSHQ7.1BTJDA25ZCGF4@gmail.com>
Cc: <bpf@vger.kernel.org>, "Vadim Fedorenko" <vadim.fedorenko@linux.dev>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Karl Mehltretter" <kmehltretter@gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260922040413.28885-1-ebiggers@kernel.org>
 <DLLKN9WTMVHD.1601DUU5LBVAB@gmail.com> <20260922050723.GA14616@sol>
In-Reply-To: <20260922050723.GA14616@sol>

On Tue Sep 22, 2026 at 5:07 AM UTC, Eric Biggers wrote:
> On Tue, Sep 22, 2026 at 04:48:02AM +0000, Alexei Starovoitov wrote:
>> On Mon, Sep 21, 2026 at 09:04 PM Eric Biggers <ebiggers@kernel.org> wrot=
e:
>> > +config BPF_CRYPTO
>> > +	def_bool y
>> > +	depends on BPF_SYSCALL
>> > +	depends on CRYPTO_LIB_AES_CBC
>> > +	depends on CRYPTO_LIB_AES_ECB
>>=20
>> This will break the build with CRYPTO_AES=3Dm.
>
> No, the new implementation only calls library code.  And if that library
> code isn't built-in, then this just doesn't get built at all, as per the
> 'depends on' lines.
>
> I'm not sure what you expected.  This could be a tristate, but that
> would mean it would be its own module, which doesn't seem conventional
> for kfuncs.

I see. peddle back. tristate is indeed overkill.

>> >  struct bpf_crypto_ctx {
>> > -	const struct bpf_crypto_type *type;
>> > -	void *tfm;
>> > -	u32 siv_len;
>> > +	enum bpf_crypto_algo_id algo;
>> > +	void *key;
>>=20
>> No need for this. The bot was wrong.
>> Reading any field of struct bpf_crypto_ctx requires CAP_PERFMON.
>
> Okay, it sounded like a weird BPF quirk where the type system was being
> used to enforce a security boundary.  But if it's not needed, then
> that's helpful.  I'll go back to the original struct embedding.

+1

