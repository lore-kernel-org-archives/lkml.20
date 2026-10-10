Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BE39478D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622292; cv=pass; b=A0XSwUlTwQPuSgIwIAHFtpAHCrFRUSvicTEIl4PrKqRcWWqqRq5pOCzPoj3qV7E57qN6RJqLqWsomIEgHltRfOblTQ5la82UitIXSEGAZ5IILX80DxtreUEOdeAepuLY1ycLqAC3TjVIXQltwyd4wI+Z6zYGzbSA1+sUqOvQiIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622292; c=relaxed/simple;
	bh=u6d7SFXuP1ZVnuQoZ762H6ZqDSQEKstty+kgOiz1vSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQzXzWaiMDz+ijpLTRKi6qKQ0czaFZSZUy8X6B6JcVV/IRAxBBvZoozZdwonHwEF/8CeKBWgjBQcUY0j2YubEBHDiksGlZwZvKfJ062bFTlZR7k7kFuHbUUUPnZR1eNntFAb2rUbIdAogYloazub0I/70zQDCUkdSl0ZggBjWwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YvwAxthP; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YvwAxthP"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1423a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791622289; cv=none;
        d=google.com; s=arc-20260327;
        b=qkk/0zY+Y4bBsYdXIgIQaypOCGLo6oaI6ptF7u16RiRpJgDTc6bBAlxTSbJYeOITJR
         L66rMNFkFlUHedvgAiwIIimOJtbRvHtJMIU3T8TxwQylKSdY5FQIDau0oOUczYU2i/JE
         4WkQ5H23jy2/9/LZ9lw5mUbKWTolkcc8LoMGvS1smIHtHel7d5ReKIr5a9Hvonng4nU3
         HVsZu9cbfVdMt+wo7OqOq8B/cxVQJNRRucDKbLiQaihu/6cUeZ7Pbv2pfyhEM5HI3fWl
         sHPGsgzNZ5NqHVWwmLtg/IOW3ZFkvU8L7mfD3HLWvbIszL7eaOvNvgciRZFNXrFo/x+4
         sQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qzTr0YbnBfbPj9+5K148QJC7O1RDLZnnS+cEO+oPi8=;
        fh=obewvxyhIQfNiaVLVLo0X9+bKGf26qVzn6bB3i4c2Ck=;
        b=KyqGFGG/Z6ie/dNBLxmgamfFi4eiFgRyhogr9BwE270xOjKc7+FWXpVZjhUh3xSQlv
         ZYT1R0JlrMtV09TCqmtjSga9CJSyAFUZaQglfasxAb7tTvsIMhi80V05upipVLQT/++f
         rbM/33KuZZENjfxbuRVdMEo/cy82BQg3W/U+y2fgPLMnFocn+U6cJqRKfJuQtkqOJ+B1
         32dJHWWyIvoXOZn/LdyjHj2W8xPPZBdbjguBfD8jAvSTY75aHxHn599r+y3Gz21Simyd
         3YZ2F9e6IswLohciImfrSHSY6QJPG+ffJC+IosEr9YfhYUf5UKh5wcPvqV1wzSrgmMxV
         p1yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791622289; x=1792227089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qzTr0YbnBfbPj9+5K148QJC7O1RDLZnnS+cEO+oPi8=;
        b=YvwAxthPJyhOL4eFMPj0oYntTOJvVIk9w6WH9Kt1na3Q8Wgx4rZMnn9dxOU49RjCKr
         CO0sEt9yZ/E7IjKLXwLT5Y83fZ3rqqiMxVfKkAXqAtusxKuuSC3RJxzOHeb3JfGiLciL
         KFXvToowiYRZkcD5JR9G8fThOogDpnD+lPlzyEScANN8zpz4f5jjHswzU7leUSYxVWQP
         yFnsGOluSCCxaSRpXhIqn/dOweHPSCbD1K9BOrQXQnRqGJYKCM1GUaf4cj8TkSN13ayP
         YNc8Yndp9eBUghyyjftch4P6OF/fGHjktFbAfr2FDPxvVSLNB20orh0BWXSJb6kD38Js
         GBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622289; x=1792227089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qzTr0YbnBfbPj9+5K148QJC7O1RDLZnnS+cEO+oPi8=;
        b=yaDOBMyYyLg6yd/CcRa2agWvouJBU2IY06BhRgNRb0d+DcHVx5Ig19CaSTxEh6irXs
         5wJ0jEWCIxw+ZkKZuIUcu/2QbP+vSJ6TQBSL+awEk0leYr+SqPLeV+8cUZMBTeD5aT2O
         Kwq5/FkS58CCFU9Mq1pPe080C9AGy+5QKASv4M6hdNZ4FJ16QV6J2zbL8CrhPddU4e+f
         i1kG/XTELuOtZVGs124V0RfeTDUCIE2SuJ9FUAQR+f8VdC6kakmYPoYFqqk6awcR48Bw
         9TY9Y3RNrLwBDAAQi/tOYZR+iWqK5gXVB9AplcwRu9Cg7UeLyqK7k7Zx5p7uqzUcSn+O
         9hMA==
X-Forwarded-Encrypted: i=1; AKwUvBzvj+Dyku+oxs1NsW89aRpW2BaXY8+gwyev/MBnOQDXazWXM55kVlFhROPFgoPHwiykiAUfjc+ZNOY1XCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7coWcYNRuVl6kzdJKS+soDH2lqNOTt2w3PGHhYWwzGohxaxNM
	CAnmGpmk5cqyybV/fja/2+QQDtYzILWwMDRAUlpdUhdywGPyUKZR6dt8mBP9uEkEsd+0x+vJ5CV
	EgFmN4nFaE7mvM0U2xHUcERAu7TlC+C8tNuURf8Be
X-Gm-Gg: AYBFou1gqy59+J8m2/ImmAD3iaZLQmRYNJFPP2kyuOlnRb9OvUPusge/1J+WM0/5kB3
	+BpGvIzL4BaPNqV2+B0Z9Gx0a4RgO7pyTb+vysVUEfSobPgJWoQUN+lk7IUUVbz1+zq0u7K0QKV
	OuyfXNKo2fEi/ZUvX5UiRABU9lgm3moTgXUAjN1XtHXeqzF8ac+CKQFMPpmPXJV8Us8XNUW5sEJ
	JhBfk9gpm5k0RSFCjqAeEcZnJ4Aw9mWUPBE24Cp6Ba2lS/c8dB6X0lbXAvgJ2qc7nyO4Ycew7FO
	TGkQrg4ClTIoRwLFle8PLwRs/aK0s3md/hmTZ3vZwYqf/7lcP1z/LA==
X-Received: by 2002:a05:6402:c4ce:10b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6b19883993fmr15040a12.2.1791622288658; Sat, 10 Oct 2026
 01:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010083935.3274178-1-almasrymina@google.com> <179162194176.2527009.17837283221529280785@kernel.org>
In-Reply-To: <179162194176.2527009.17837283221529280785@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 10 Oct 2026 01:51:17 -0700
X-Gm-Features: AclHuK_yiP687Fitsz3qcW8jp5keSTQlvPwHmngAicI8BRA9_47JLCvvHXQHfsY
Message-ID: <CAHS8izO=MW1Hy0k0yjm4HbJ0P9F5_oOQieLvFA5T4SzBDdDP1w@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/6] net: unify symmetric netmem and page_pool refcounting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	Ayush Sawal <ayush.sawal@chelsio.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Simon Horman <horms@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Michael Grzeschik <mgr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Petr Machata <petrm@nvidia.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Jakub Raczynski <j.raczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:45=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
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
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I was reminded what I complicated mess skb frag accounting currently
is when I looked at this patch:

[1] https://lore.kernel.org/netdev/xfrm-iptfs-pp_ref_count-underflow-v4-1-9=
12fa72106f0@secunet.com/


And saw that the author was trying to write their own skb frag helper
inside the driver because core didn't provide one that made sense :/
code inspection + LLM written tests for accounting confirmed the
issues. I worked with the LLM to fix the discovered issues. Not hit in
production or reproduced organically. Only code inspection and
artificial tests.

--=20
Thanks,
Mina
