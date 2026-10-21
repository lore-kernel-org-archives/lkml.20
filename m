Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792614966;
	b=0ea+aAaoRGOnoWsCBGHvsSRqOqUI17xeVHbuDyfufVEu1MPdTs9UT0uABth7K04Qg26Z
	 RmJxBE13O6PhDPFpGfHFXFwKSn8hRuzF42DlxUz25EEskPsDwqAQTFqHEG+acSVj+wXa4
	 GtfqWa1OWNUvFz4mvRc+pykltjOCp31mWaxdhI+UYlFkJiqE3OUnSM/gJy7Jjp4aArzRj
	 QOf1rzZQdsRYRFifKvtQxmOjQKSMcSTXDlBAB6BckJvJ/Ifhpnk/som3WNCarnOJrxewZ
	 3yjFJ/PYxm2XtdJkzOi0zYLl0w0v94ZWoJaAhLnHQkkbmVk45oCo/geDxhxLAq3mfTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oy4zjwK75VgDvDbhZpZwtwVldXeZthwDfbAOOHS22Sg=;
	b=P7pe3AmSN/2Efdpq9KT5fmnmWF9P4tqreapDEDUIf1Vh8W9tjSW7aUuTTkBjAPlxNWpF
	 7qZxURlLn7PgQdGMTLVFyUByDgR8JB1r1ikhkieAc6gxPILz0ZR1f3UIjj6063fGepD+g
	 Tk60Txo2L5PG7Ldqmmw39WeXJGMWWUL4JFxGecjVT10O65WSGqJZbnhXACVq8R7V4H+nQ
	 HtJwU1vLGxj/hEuz04jMnN05A5xp0pDCd+DFeMe5qFIFzsCK71hDCM6VtAmSwexAj2MPP
	 sDWz6RHhVV8HoxtYBiaf9mARVdroESQ4lN2wZdTnauKgmwFQok1S/juez0nb6P6AFJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b="ndeD/gk6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C6606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12C6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=ndeD/gk6
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c78660542so746325241.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792614965; cv=none;
        d=google.com; s=arc-20260327;
        b=bKicWchaq6doJF6ldqcecHgj4zoinVA2uLFdMVFCsNCPiM8ECi6pNaMkPT+mADgCBa
         55KQSqsNenFjtBWDjmghE6O14n+2jZdlPbPQFLwDRjpjDKNFpbGRmXT4s28RWzUeoMnF
         xegUoYbjIdNt2aBQ1GB3Ugi0Kar/33dv+0NA68xUYTXeToFzXX//NzoDntryO/kax5Ye
         wQyt2RZiyvRq6X14bQeAqY4boHPC6Xk8T04dyXxbx6fJgdNo2snCvC4q+hXGz/T7xQi2
         rEQ8wEgQlAXMeLZaVegWNeMjFSQnqh3KATO8fwfTPS+Wgp6oI0LPduy2MgDSz0+cyo9R
         T0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oy4zjwK75VgDvDbhZpZwtwVldXeZthwDfbAOOHS22Sg=;
        fh=Ezf6TVKsSf59Z/u7znxdhmNBehO1dS+lmObJ0uQlj7s=;
        b=hqwKkDoX9Ek5+bCk5DDfJYoh8z8TstCOEIWL4T2gsWHTNppAJYrJLBtsUjCwXF+Cv7
         5dJ35bSkT0Y8jv2h04C5Q4S/fLHssOCrgGaQhdJdBNX5+C4AeiLuASp/j/nk0fg80UY1
         9uETdziPYh3DuE03U9kXE4R3znAWRs6asbwFDoDw4Stq2fTkP2RsShTrzZMI4f8IJ9dK
         AT8xugYM4NmvEpRk+B1EvriOtwYqbx4WnfyYFMfB9ewbfP3ZCjjz4uiuwMog3HC/wrw+
         I8HaIZ95qdy0EizhGNUUI/GgIlgCw8FaCDlzOSq3ApEFfsUb0BUKQWkuSKoq30SaH2ek
         lXMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792614965; x=1793219765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oy4zjwK75VgDvDbhZpZwtwVldXeZthwDfbAOOHS22Sg=;
        b=ndeD/gk61dUIGTsi+ssDmR7jaxWuv3m7jEmQb9UXXK5zKQEtE5i5wjS9+f/L+y0+1U
         H+ewZIqp11oA/XagIfpYv8RNVRRc6g47DXR9C6ir8/r9j5csgn7XRcoTE5EuQI8BJYVH
         A0sHMw42pdvCn2koHeDAwzgpsfdUMl1xI0ubf1ItPepuBFK+wW7ifvUdek60qvWZ+9mO
         b8RFbB7d6VYduRC/U5mIPbCKHz/6o7+X+kJbE0AdfZo2HBN8i0e/u97UM+/91FkZThyx
         jqbvTStU1g68+mMLpU1/axo4UBUVklNSOzAv1Es1sm3ewIVZj+Ke8VJQWqYeS0MhnyJI
         AnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614965; x=1793219765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oy4zjwK75VgDvDbhZpZwtwVldXeZthwDfbAOOHS22Sg=;
        b=VGB91fVOp+NFNrOV9JAhzbDIPo97j4QPBxAnHV6fy3ziGNbs/C/aGWHmrxSWjWgjeD
         XsjcIA2lcT3wo2OYTor5tP5ip1KjMWcIuIz8P1RWEimtpbQ1Eh7c73RdHKgUm1dSNpUC
         mlunEuIN9/w8w7TIe1HikMt4IbXYD+DYGpEoYdaDMAgGmDf+Gfi0snaj+xXpz8qDrl4W
         tn0O8Gmuh/HP+jwNwRZdDNBVhxgXScDIDWBccVNSIC4DL+389Vnd1wTEmPhaak0f3Q8J
         ayWkZB7Tbuj6S3SqyboASn5AL20cGHFNaVkmQ9+egKq9beKBRCEPd3SdBr01KHRQxIgO
         rOig==
X-Forwarded-Encrypted: i=1; AKwUvBweicbGxRjb4S+3Ov+ym+4SrIS7rVqQgR7zcO2Rz4PL8dixHeSw/oFQiyD6RWurTSXNOBni+WyGcY2vJ7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7J64I7PuTSsdtDdm2NrT0sgluZ7eFLT6iSG8yYLboZGCqpsqo
	ujmfkjrPhHUL1NxQVQUqLFAadXwwzrgD5/yBtkenCKZPm/+0ZhnHotLfxq7JZOk5Nf8buLU6vi9
	kwcbZrh4rYJ6Ce31L0wMczoYPYM2zfSkbTHLJTAAThQ==
X-Gm-Gg: AYBFou1zeGP7ln9Ah0jYJ9TTvbi3vd+H7IcA2dsPyOv9/8llBHb1w4oxVprkRcK0AB5
	QD9bsT/MW0LeoxB6vLamwENBd1J3tF2hFIkl/nDbAybqYawg/BqpQoorUtdbjDqUON506XXjmLB
	cvmittPDWJl41irQ/RyJJHlBc1lqR3QEutN+v7b4nzEuvrcbGUdwDtH9pPEDjA7gZM0IxBRycha
	+h/QZezQhp21BfcpR+RSZxZkHkPdrDfi+2HRoUDtuW1SB+AHeJxZXJPPqacWxT8vGuh+FWCN1/E
	bR/S87lxRQgzGTfRE9fi8z4MzDr9+GY1E9bCARym8CVqECUUNZXnAQ9qKvlI7H0+3H9NHJrf/hU
	98Q/+q8jUouO8P7tBqkRBk6u2pAuW5/AyykqqxmvsyQYHMuw2Xijmwng02MglnL+LOscoufYyJj
	fGvD7gPUsUlHH1lnE7/2xCI5FUOeONkE+jdvFUyqWwfm02La1FIY7CqyX//hx5+yXVUu2XndTJf
	q36dpS/KOkAFNXYz4Y4Tcw41ZPmIMP3mPeGdOfimkoTfUA7
X-Received: by 2002:a05:6102:2c81:b0:7cc:32ce:4c5e with SMTP id
 ada2fe7eead31-7cc92697b15mr1554069137.16.1792614964729; Wed, 21 Oct 2026
 13:36:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020214500.972308-1-rjethwani@purestorage.com> <179253294887.3290.487147499123330924@kernel.org>
In-Reply-To: <179253294887.3290.487147499123330924@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Wed, 21 Oct 2026 13:35:53 -0700
X-Gm-Features: AclHuK-06qlNphl58sn3XBv3twfkYeXTvJ37ATa60uY5jUtBM_A9R8-5LVb5nMI
Message-ID: <CAKaoeS31KH2vkRdxxXE31UNbJMwYJ6mU8P7z3CuinyHmgY0M5Q@mail.gmail.com>
Subject: Re: [PATCH net v2] tls: keep TX and RX hardware offload on the same device
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Boris Pismenny <borisp@mellanox.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:49=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This issue was discovered during code review and subsequently reproduced
on hardware using mlx5 and TLS 1.2 AES-GCM-128.

Changing the route between TX and RX setup installed the second direction
on a different device. Driver traces showed successful adds on both devices=
,
but both deletes at socket close targeted the first device, leaving an orph=
aned
context on the second. Both setup orders reproduced the leak,
even though all current core TLS context counters returned to zero.
No crash was observed.

With the fix, the same tests correctly fall back to software for the second
direction and leave no orphaned hardware context.
