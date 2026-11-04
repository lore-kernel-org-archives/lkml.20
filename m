Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818513;
	b=a/kaU1gwScv74JtNn6Ox9K7bUjaEPJdQTd4hOZBvrMSyvKcYnk6Ky1HFKJiaYpdBM/qC
	 pGSIzOJ9POhP8UTryh+7kA32m6MQnkURDEmRNzuTGPRVBzyc31bSE7WPX8TYLcRvvJeju
	 FBgVcjx34XHI7eP+Mib69M0i15DfgoY7lh7mo2RMdMvYCBAnnrMFoaDXNOfdyR1GihfZQ
	 DwyzmVjrU8WiVSXyPTyybFObCYvU4hRx8QMNMO4xqDRd6/48y3K85ciGe4REn3RqGgV1+
	 MnmYKehVBATOejLUV3dd9v79mFvzrBLWsXIzuJ4D5xkwoOZN2He1SlOhztzqgkQtynQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
	b=x6IbA4g44KKT+KYMwVAot4UZ/vY1Gln+qZEqDESwVEDKXGQHTV7ITe2nKj4e3TcbnhWM
	 ExYb3ICVMftVEaB2jDhBj57VtqIyIbemb6h38h2C/V8ZLTZJyf6FvgOXyRm8zNjRyMTJB
	 p9jbw6dUeaxpG1ynqMODaoT/kmPilZ+QqfAV/1scubRXSQT6CGlkpZRfLux0KaLdLW/rP
	 2vY2GDWiZ8yceBksTD1g7rZbBg3gHY8ZepceXoEdSgk6WCfgl5pXl8zLSy8iEvW65/clV
	 OPB/WCi3Y87mb3Uw44+gD/DuutsdFVrNfDd/PyFcrLWem1il+yaOAdsIPAWTjYmKk5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FOY01Rl6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219A606EE9F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E219A606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FOY01Rl6
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso348528241.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818512; cv=none;
        d=google.com; s=arc-20260327;
        b=BU2Yiwx5Bk+Ib5mg0cHhcUHbUxaLKWvdZiy8pgR5clOvafvh9u7yK0dYj+i2Grm6Xr
         qes+EsSwr8l5TvauoFiAzEud3tZkmcR4kCWahhAfmaWb3zWZT1D0F4dnOzRWp7/PJ2Yw
         wUuB+Pz68yrm+Yi6gfj76UF8WslwITdAeJVecT4NRJQ3QzlIa72dkSZIB1RxSeqG1Hkb
         c4ZNSKheCqvjqohyjyt1zEVUW4ho6mGf7YuEwWavtW5w2mweanqrAIsVkfdm/oJchtIB
         Jnf/UXJI9YK6hAi7SJpGhS5NvyxVqwnoPU8yAg+oCH+cjai8Vwpv2Hc4NRp8JHuX1iJT
         Av4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        fh=u55pEDmY/Tymj9DY1OywjcfoTvEj2GTbHPkoWRhKehM=;
        b=H/dTquN0TGIxpiU1X3Uu0uSl31EA1C+rFgxE+fU3gZliubUDNyjcxWGG/comGW1RcT
         mcJh10sK3zvmGaVL3hba2B6hJy+RLCq+c6ufl5YPy4NOSnd96G6yeMQc2z8TFFTtXG4d
         xb4kqqcpZlezUfBhgOkP1NpLwYlwjGSUf+W9r9aHyRjVarFhR9WxuQ+C8R6hjeiL2v3j
         tFrexGRQ+YWoZF7FtSP7EUZitCAHLnLBX3b+SfjULB0A4j5R8n6mmt5zZMbcirzP0bAB
         bvsyYtl/jYlR3bb64sy91fJbj8KfILQI60kUgcKh38YfU4rKSYTWjnmR5CfRe8YdAiiO
         nJwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818512; x=1794423312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        b=FOY01Rl6IGDR5WgkOoelYjGCKwSO3TRZWGH7SjR6GWEOQwrvKAnOADQR30W6FjEnrV
         fFHSPmRK8ZKumGIRR9it27hWUiBI6mMf4itJpyvN5mf9OkZLgy6N1qzKCt5GcDV4QLKm
         AsI/bMcZu/pR1RWz7IJ1IZe0h4bJPhGAJ1ga3giXlZs/aE0wJOBnmXWuB+oV3T++G/mn
         WVvlwkAuxPTVcEct8+iH3CDAXX0D7ojxUU9eSKXJfn7IxCzBScMZMQEJew+HOKMQS7dr
         DA6MAcTR1Y6bVNqaIN8osvjxVbAJSTCbZs+iMNNr7KNnxwDoj1u/OT4eXMJma3mH8hg1
         r6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818512; x=1794423312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        b=p564DeMC93+HU4DIFnUJpGw8XQO6TZ6YeHi9MIIk0gYfqla4WboTcZtkQ0Fwq39Pfe
         izKzvOlmzOAmeAiYFilUlAYEX5/csnlCjzMVjjEVZ3C5HLQklYqtU8hxgjhQI6WeyqGO
         27oY4p4AX34mNCCfTGN+jGyFUdfyGo5jM7FXx/l6Al6NxLa3tYh1iwo6DQ3Ut/JoiTz+
         c1tUcXxAiy4pxwKu8nPuQsTeSlqwifoZd6C+3kCdmqQmp/vYkK9n8x3hvkWkWPky1eOM
         3txLFDBq8QX8nk84x+GtrqOoJW5laOMWm8dxYKyopgYWk6c93k48qXC/EoUODwk9CWvh
         qVwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcPo7cVRq5y8W3ZK/rGiGPyN3lYXSBeq6dMYWZ+U2iaVKYCOjmu3zaF43Y6bNe2oDMn9xKRlWTSOjDZpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Et1D4xsFx+2b5oBBJTJAlxaYOSvu7HsU2Goqoj1mm4hwabLb
	DcxfMuEUpc2hMwjdkVPEoBHcp6myP9nFKVaaCwEbSlnEhEoGKw51MJAhVElIUdn0yb9HSa3GW+Q
	aFcP9yjVf/In8OYPBeYGV2K1YTSq9x4c=
X-Gm-Gg: AYBFou2syXc3Tgl1KbBaqjOmds4bddPtrtb96VBVuQewZKuosP1lZ7FKTlAod3x1kn3
	jDykemz6ERAhKtiV1Wsns8n0BWJSMmzcbJzozeZhxmYuf1QC9qOFXb2sAUzM5wbklVb6FiesW2+
	QwNT3pttSqv/QX36Ym2vd41R/rUMnEqcNJUnsEVVpAa5QNTPmNfYHagF42kpOeJ8wJeMaav6WZd
	cZj208Ze1C9TBkqwfEvCrYNA9jJKFQ2hLd+3zjPg/yVwm0fr4qDVhAToTvtNBHoAMXpUZzWVoy9
	X0xA4TwOQ9/KbOKyH0Uz4UtiNUxbmm+8SoaOTX1CyiFh1QuE6nBMClT5j8SzsPM1JunHXfCNQzu
	eMyHux08CMNfLqjJ2g821k5IjJFqFO3ERRYPv2JRuIxEKf7rnQw40DmpuMOZbrzDX/RVjlv25Ml
	Pc1S/C4ETpbP9NzABY3ynwrFaNevWxDvJvvucMqzb8vev4aZXlOQByQVq4d1/vCtWTKxepp1Gkk
	aW4SwSrALXL939134JTTTzH9Veqog==
X-Received: by 2002:a05:6102:3c83:b0:7b3:6079:1900 with SMTP id
 ada2fe7eead31-7d0726a03bemr6260355137.37.1793818511776; Wed, 04 Nov 2026
 10:55:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com> <179381842538.488859.11490770653999769834@kernel.org>
In-Reply-To: <179381842538.488859.11490770653999769834@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:55:00 -0700
X-Gm-Features: AclHuK--X9CuBUmjc3vuMAmJzOpEI1xjQqSDf0syF668uw7WASBz7nJRNkp7F_4
Message-ID: <CADvTj4rwKjHXgxUR3XPob0_78POnTin_uaBUnm-9r7JyCfNAXw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: rebuild VLAN priority steering when
 filters change
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Piotr Wejman <piotrwejman90@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 11:53=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

As the commit message states:
No hardware testing was performed.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
