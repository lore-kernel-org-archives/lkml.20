Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793174368;
	b=XlG/RL/MQla85sK6WIEkpmlw4xGfuSEdzlG9Y8e2Rt5buz3cn8jn+B0ivoDmGHUbj9qL
	 1gS5kzXxEPSV8FjsbvQ1oXcAcmJq3Aea/C4UbnBka8eRXyvWSh3gLJcfmOALMqk1HJ5DM
	 is1OrpGLooRuNLOaN3UaPy15oKL/xRnfa2Rr7Amr98x8Ka+WYJhCjUcfZuGoaUVtCYz6e
	 8P3x+UAk1qQ9qDkDatdckf0zvxVxR8ydiW2Au+SSMuAjFUpTvOQ+tRAEAUGvThZH5dkio
	 1KfAxBadWmKaZFii4QngUaywKeE61k1f6ki7rQ8ym0iTSHnJO1BoqSYnrDyU1ojaWUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=msuWLQXGOh6jOPZD6wriEwJopuzDt21S4GJ/FY65JWQ=;
	b=gZopoh3CkeXuLZBE/zVEctz1hDL3s2KgkJI+Zgs0YnhE9v1Lxobd9mhLRsSLlnc63D7P
	 w3fmtDGUJQchtibrJpSdpppRUXxMIvFClR0b57mjmxPUowSZJuCWRGz9WAop4+kFTWjZ4
	 hHGr3tCgXtFYiuvbhqc6EpWbEx716N+FgNyE0koA/1S1Pcbc1KrLSF8mSgKvCy+ARD8Pv
	 rYooJOhyza7GKe2wRJjgOVidE/8AZEnxLNVxKvPalWg2kIU9O7Vb27QTBC1nbISWpqSsn
	 CKHKflEo0dyXfrblJ2unSo6uKYjqyQx5e6jDcYH5J+uZ2ANaEAGVH40yTcrikMKOjuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B88606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B88606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-55651e7de9bso443343b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793174357; cv=none;
        d=google.com; s=arc-20260327;
        b=KH3BKxn1iDmdIxeuyYqMWewqxWrLITGuBgEc9HjRdneSMySBse/ZrQXEyl8JpQGJQy
         Xw2N+CZN4RxAuJX9JY3GRsIqekxzBy0wWw/iA1aP1mJgfEk81jpGMc8G6w0tly1do0Zq
         /WRhKl9//UMEAkCr8Ne/fKjwSd0jphODBD+f7DxlgJNuOYPst/r+X/t2tAlR27VoIY9b
         8SdzP9UeKFz30zyEUUMGW7YW8rKGLLvs1WnxoWa8M0rHwqf5qbMd4vf6zrOqIClSHFSk
         v0/XGYnLF77hFYrkc69Y3SV9W3dt2g2deq/u5KoYgDy5bb+DChAjYCy5XLtSZhAP75pV
         FqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=msuWLQXGOh6jOPZD6wriEwJopuzDt21S4GJ/FY65JWQ=;
        fh=/cbbn+fgMeQTZ4zNq2Xax1OUza1miIan/YrpNlycU90=;
        b=SIJDjgF8fi4JihxBpPtqrsDfMH58vMFA41FSJECQhnstKNLqBEB8ftvjh9ScYS/TQ5
         2fCSCOI1OdojaKUdQzPaK98IThw+j+dKUdjv3zPIJCkdSjsX9liC/p/kUYuuNqDVx7xO
         is3Ex4pk8TWgb8Gfsd7RLzZmViUmh8vaWIQL3tTbRKbvdJdUGvP+lmkvbrq4u/3gjTRo
         lRAMLMH4XT3myWmg/rThINut+hKmCdWIrJ93oeEnWtuqLkbBBKKD8ShB2oV3kz3kcb2E
         5/WTLxGU0N90iS/j2Nz/4hb7/a2OBjz3gou7OrRVcwIIs8vGFliCUQK/L9dxeVN6b/aA
         fPug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793174357; x=1793779157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msuWLQXGOh6jOPZD6wriEwJopuzDt21S4GJ/FY65JWQ=;
        b=R9NvQxMhaGhFSUqcgGV+fpdOYOsi0VJ4fJecDZOPzbqfdBUXTqicx8p9/Z3VNJUQHl
         be6O1vD3lYeJnMBMA3L7kgc5anYmZKKgt2pJPOF7RwBIDgeXeRvVqm94utgRAYIMLINQ
         Zy+dIt4pus1n7dPcVrza8X2MdOCtjEing1GhsKnNosmGRJhBEE4yOQFlbURFFsGzriwE
         4lbklRvdh9wrKadvH3hAT8PEzVWesaZBjBwd3fcKgN2xnZoy2VQg6HS3WbXnxV/J+AD0
         tBmXYnaPp6KrVhEdPnJ6+J79QS4chTEdTlI0cCRYLUfwuv9yh8sEAV73ZraWG7gZ8Npg
         +RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174357; x=1793779157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msuWLQXGOh6jOPZD6wriEwJopuzDt21S4GJ/FY65JWQ=;
        b=InfI8S4ucEEm0+NnrnIu1YgmQNeuD39C1eZtF66Xd2+HaaDlJPPACHb/s3Q8OSoQfL
         ybPDAOyL5sOkb+9rZKwDcm6o3l0uvwVIoCs9PxUeRgAZBTz5aQzp/qANaADd74o2vlWp
         B3DFPYMPxidoilJJ7sd0+0t85d7IZme5teKchzdhzBQRUAXlI6CCnfz//kZwPBoMm9HO
         BJSoxQFwyYNsUE708/qMZeaDsXATBRfrAOUipKdUrjFlc8js+uAZ0MfPgdKVIpwbqL5R
         A9yCkpQPIaHNbdbYdpT9yohbWrbuhUtUNGd2IF5WMqVVE+LR0PCEtuHq/rHptuj3Qc74
         gsLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz//j6IpECOuedbSxkBKkaM42hjaGB6tpspY3eMRp2296bSC+ZVoKG6gPyDENvUH+dQOINDOfmXA1MIG+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrQNdztG1WMi4xsR3Cf3eAT0YDf0C7todl/W1G0eb3IG7XuO3j
	BfVQIyZ1/OiwAE7Ydjp6CmqqU4c1O5zVzmund7gEUov4Pnx8rBx+9FGZ0s8vw1DRSK2sAYgIVYt
	vVNn8kKg+zP3ibBAAJ9Py/AiK/25SAV8=
X-Gm-Gg: AYBFou2ogXUmjA5ey6rI+1KQxAkNnxJ0bc3+ikGbd/tpeO1aG2k4vBTBzvIQS6Z2+P/
	q9KKJqinH2fkj4pLFmGTD1ngbrBtUZJ01WrfR4YqcMqpYeW2wYsSRAqzIeTHK9ryN899CJkePSe
	8vBNrfBwj0Z0fcBJximcb8/0WjT7J2sdEraWHD5jQpEa7w/MCAXgEO2r5OLigTZYQ33G89s4SZd
	p+9z6OoIKBY7qW0cmyg2wEkwPbmmCu0E1N6+nQHnBo/4jwwnpKf0F4ae0yZo1mq/yZ6IMpSpb7W
	MiZM73uJoAmkI1rD80KSVmmDjh56VNzxYDvDCX4E4JrnG/rFroS/EnhICtG3Q5SVXnRmKOg8eM2
	XaQtC+K57zAQh5/meAQxU/xXDLYoSR53TToH3Vydixu/ydUfgaSrgJIAgi0YKQ1T5+/fclQ==
X-Received: by 2002:a05:6808:2229:b0:4c3:6d56:77c2 with SMTP id
 5614622812f47-56382d8e3b4mr1018296b6e.41.1793174357044; Wed, 28 Oct 2026
 00:59:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026230300.1108190-1-mmyangfl@gmail.com> <179305591469.3327.15926756079213213876@kernel.org>
In-Reply-To: <179305591469.3327.15926756079213213876@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 28 Oct 2026 15:58:39 +0800
X-Gm-Features: AclHuK9cEbASpRdFT7CBMyjhIOqfOiryiWSEaf3aWW8MiKpQ5g6wl8MbD5qJiSU
Message-ID: <CAAXyoMPaA3UH=pWaDN0OHKaHDqdFXhnm67GN1b7m295=pqwrTA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: dsa: motorcomm: Isolate all ports during chip setup
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:05=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
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

HW Tested.
