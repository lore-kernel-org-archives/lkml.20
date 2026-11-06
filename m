Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961926;
	b=NYeRGDvFD4gnbMdCwBsEmRE3onF9hUdBiLSmUKGDBtCD0K+Q6l3dbXcTz9yENLw6HsSE
	 yziOG01zMKVpDcMGOr2fXRydtrQHpiRBIBtbDDa4YqEH0om7HIp5nNC6uW3EW3ukyrZUo
	 /gNHkEcvsg0PH0i+MB3Qq1varZnSXNa6ACmUXOgl8TM1UBcIIACpr12t4cgWoM2ThUFKR
	 6VvDEtmVk8rMS7Knm4Ep/Pn1+G8VjvRDF5fRS6a8kIk/osHEAIzInsdI64SOc7rEK4vIs
	 Xv9v9k9iBzie5gyn+L4qbRgEHC9p5O/LKq4b9g3JgKxuKAnzO6kq5Ovm3Eiqfk2ta4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961926;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W5cUQZWfaC3MxgiZhu2mJSrd0Wxis+9ZPmTNrRYPwYk=;
	b=ak0YUs+G2o47MYOcKKd8KA5OiIwPqSH9ZbjKMJXmNg6Q/dknUii86CT1Fe6776yKrqNF
	 GxPFWr3x84sFij7IxeXfAkq0YMjv8k20DbV79gXIioMPOznFapsmGDx0eBzWPI0IkRX+R
	 P6QFo83NGRfn19vpoNaT1bGGwDx5lG+YmgkwAaQPSwBgIJ1+gB/4jEB5v6q26ANgUdDv/
	 xxEKu4MU181dXiGl2JtV8x30AwRy94MyT7U3l78FznPE+q99cSoBoZuADJ2neuOBRe8CQ
	 Ao+/QM++Pqf5X4zrkB2z46pOWMWCHFNg1J8Ys4E93VusGtMo2lfCFrxhAaAXzoDwh+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CA/mpxxb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B3606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CA/mpxxb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB951F008A6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961925;
	bh=W5cUQZWfaC3MxgiZhu2mJSrd0Wxis+9ZPmTNrRYPwYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CA/mpxxbb4zkwHztG9icljyJgTPbLYK6Ipv4X7oxHpISSEScpKKIj2+gTsvI+/pvi
	 njCW4N7pIO7tUpmnFwSsHzT+eQrPRR/XScD/m70ZruHrGSzdhfsmby3sLucE7EsObW
	 EqeLa0+w8wdvSwcN6Adj+6+ScjKRBTBpuXoY3Bp28jPQ4EoYsvQ/iANjJHwYs8pWof
	 /sOrMQEnqccCQ8y+GL0DbKN2+GgFVYedb4IW9fA1XWsx6tNTqFJza0A6FWOct/wbmz
	 5vTQ2wh8EptmLCpJoGq8ed/mxJA1cwcIVw/RxAzEhCfLkx2uspc4ejOT9YImPhY24U
	 oURdWOm9irl3Q==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so57164766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:45:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzBRfM3PLVcERSFTqQMgZxMnHvMQP5red8hY2P4s3eiKdTNtA5R3+1tEf0LYKj3rw7Dpp7dRK4E+1FVqEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZfWYyNwdt7j3FttyD4GoiwUbCTRMbqMqFAKLo50S1aAIgkFIN
	fJFt+HnZHS3Ye2XZHKMW/NJ9+bU33mMJs+i9nHfTHO6P0HmbcWgUA6wk7s1HRlHLbSVEx1TOpS0
	pr8lmUt/vavpxW9AbF7LFVgIYlCdYBB8=
X-Received: by 2002:a17:907:8687:b0:c48:a838:c16d with SMTP id
 a640c23a62f3a-c4d34c333bdmr171008566b.30.1793961924247; Fri, 06 Nov 2026
 02:45:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106035345.728454-1-icb@fastmail.org>
In-Reply-To: <20261106035345.728454-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 19:45:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9fstqtRHh8+Y1zkr47oq4F4nf99uU2tTuMcP0peXwnCQ@mail.gmail.com>
X-Gm-Features: AclHuK-F7Fk6JKUwAbLJL6bh1AEPNA8rMK8qFFA9dFT4E9PsNSTqxxOOf25b8yc
Message-ID: <CAKYAXd9fstqtRHh8+Y1zkr47oq4F4nf99uU2tTuMcP0peXwnCQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ksmbd: exclude metadata-only opens from sharing checks
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:53=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> ksmbd includes opens that hold no data, execute or delete access in
> sharing checks. Such a metadata-only open without sharing can block
> later reads, writes and deletes. A metadata-only stream open can also
> block deleting the file.
>
> Patch 1 fixes the general sharing check. Patch 2 fixes the stream delete
> check added in v7.2. They are separate so patch 1 can be backported
> without the stream helper. Patch 2 uses the helper patch 1 adds.
>
> This series was developed with LLM assistance.
>
> ---
> Changes in v2:
> - Use disposition-implied access in both sharing checks. This covers
>   Namjae's READ_CONTROL plus FILE_OVERWRITE case and named streams.
> - Keep the requested access on the returned handle.
> - Leave the attribute-only pairing rule and Time Machine AFP_AfpInfo
>   synthesis unchanged.
> - Treat FILE_SUPERSEDE as writing because ksmbd implements it by
>   truncating, although MS-FSA grants DELETE.
>
> This differs from my reply to v1, which proposed changing only the
> truncate path and leaving patch 2 unchanged.
>
> v1: https://lore.kernel.org/linux-cifs/20261104183702.192452-1-icb@fastma=
il.org/
>
> Ian Bridges (2):
>   ksmbd: skip metadata-only opens in sharing checks
>   ksmbd: skip metadata-only stream opens in the delete check
Can you check Sashiko's review comments ?

https://sashiko.dev/#/patchset/20261106035345.728454-1-icb%40fastmail.org

Thanks.
