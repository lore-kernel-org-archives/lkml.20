Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793614912;
	b=UFne+KxCog44mYLa1Cau0XA1hlMVSl97cWBqzTFfWi7C+JarQTTCSt7ojZ3f4wWHmJBM
	 ztvp8RFtIlYWGUa91rgwq9xDPRIp54AmiWcWVDKXAaDoWWsUIwrMsuwRlhgHtUhiXpmmc
	 wrbt/sAjA0pc93Gt8qHFE5+BLJe4djESllakVFdFdB91cZK7OzOkoerX2CY37lBNBDhN3
	 cyHHepxi0BcRE0YhGQMdu2jx+geHd7kqE6oEV3GvWx62ENqy662FoOo5SrosXvEsneJ10
	 aKoS4NJPZMkMd7YAY+NxHUOp8QsVXRqaxxI1XgTNxru2WJ/yyNr87A5rqmkOwABqjhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GhU8Q/cJJy3w4lZ9hTju38RhWn1kSAjmp6gv5uLdV8s=;
	b=hOvSmJ26vJQlkzZXI/d+dpWAdmVtSBuMoKlZtlChkBnPFT4txyEvFo5rv6YUZNhlLtgW
	 k3KLJRk3PpiMv+w4+kS+WKHvW05BoeLjrkZt+FoLM2/Go79lFvm7Beo5N7g+2WOPBkaw1
	 H5osQ3XW2/E1SbkZggulsJ4svRWK5lF6wtKKPk0zy0ZxMxFSUpS9XrX8/MVPje2BYMqWa
	 m3BTKK5DE1LzMENtaaALnYo8DMK0yaPeAO5pqsaLnqjol8QzXLEwekAxFbA9GWapmUBBH
	 KTGOflGDcnLnl+8JMII+nCEMDucjFVIUoRqhKypudMq+zCcFjIAdR7PoygN+kPzW7JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5tahd3S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B5606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102B5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5tahd3S
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af173320f9so2508394b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:21:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793614911; cv=none;
        d=google.com; s=arc-20260327;
        b=HaigwVWsZRAPhmxbOPwnPzyAXLv7JkoFxbI21mM39qxrxEoj6Upg8XquaXsmyecJko
         hPXhlBQqYzgqBfRvqMPL+jmVgrF6OiRrRSVH+5YBZ9R0tsqrCgzY2JiE4bHuT7qsK9Eh
         XuYkqTc8IYWh/9ajD9csWiVeyi1JIZncaRPMS0kHm7aO2yJoT9Eg6ZPUl0aXAJYnDfcu
         7USPpflmOmAjXEVMxJ40jpH1gJgTBPGO1VMULD7I+gc0GlAaFyVNMOdsbqxY+/tx98k7
         Vi6zD31dCSUd3+l1YaVDvNk2+lKN9sGuFOa07fjLFaLrPiIkGV106fbpNTEVpBT9eE54
         ieGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhU8Q/cJJy3w4lZ9hTju38RhWn1kSAjmp6gv5uLdV8s=;
        fh=UVVbBLJs03i2ziRL1qWIfjLvzYGYrdIc+HCn/ePvu+8=;
        b=nMrM6kMKFqY7FdwQ4QUa25Mjpds1K81X+8jhwEEGRjTMND+H0rS3F8rCI5+kiReX6F
         3AUsyYBkPfVwLOTaD/xBSCl28Q5MLiFn8HXu5LLnbiI2zCRGYqmzjnNmnaUqunWSZ0qP
         amM+dC8Uem6qH9BW7+sIzbIMLm5Clvn0Vr/cj4f9yoQFPnVrHp7POXMzvmhBEmYGt6T/
         Jo0NnpXNWmpKB31lKoIQACmB4HNs7yTpOrHtDTW4H4qHKPLz+JVG8We4tOIn3yrsOhiz
         oFFB3Ydh1E9v6fbdvRgO3aHdPQJVoYnHs5jO8s0uLfReWeRjM8/NGFY4u4WXouVneR3J
         vvbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614911; x=1794219711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhU8Q/cJJy3w4lZ9hTju38RhWn1kSAjmp6gv5uLdV8s=;
        b=g5tahd3SaKufBJ9hYRm4rEHjocfqSdsJCaWCYRGdcbhLM1GQuP6CIO70pzFRIZ8NyN
         IAONu6afkjQeR6S011BPEA5bga+ooXeyCBu7jOK54b0k9ehP/VXiPBevGI13n0NHPpE7
         AWBi54PjjVsU6jAS/xzbO8ANcerNTLEx11hIIhh6ktN6wlKVXvAJ/Ye3zmqkHtiwv01U
         BDx0QF3AEZUuvAnSrguzJJWXuUstoIGiCyN9i4eVggan40sz+PWjLxgGYTURMsywIZIU
         iIj2oCr2aMejGpgP2rVnlNa7yltDYijV1RNNdAy0yIWkd3RdmeCrHDxwqsR1TJYplrGh
         8sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614911; x=1794219711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhU8Q/cJJy3w4lZ9hTju38RhWn1kSAjmp6gv5uLdV8s=;
        b=cW99F7bv2z7Fx4iI207jcoB11qjkn2cU246KniBIzV/QvdKWiZitLpWT1wp+PNBomG
         sZ3nxkzfSj2mOZMAN4yc44OCV22FLAvrCotlZIzXhmpOiWSq4QR2AFtSrqTUPyMQBUN8
         pdUz0umvHWszoS+IgZ7fh8JuCbG/rQDK2LP0WvpYA3NPvXO6Kf50aUyOsbEaGJdFkRHT
         lxLGtUE5S1Qu86ALlR4GPw4WCGrmKfXOtiklhkKzKK+yL8me6pf8Ma9rzD4SjPcuXc3E
         bpXYzd0Vl7OOZVdbNg6P456qA/igivpEQa6ca+rgcNrqP1cqPdIpsIezodjpZ+mMpzG9
         +40w==
X-Forwarded-Encrypted: i=1; AKwUvBxiGaX0jqTIguhUCjPBFYBB+OJ2rq0sZD/Juq9Jsv5hp5jFXJ2omeqf5Od8msyRPKXVFoqiMGiu1XyOIT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNyXypyyyJ5faqYZ0roSRb45p+3rFEAEqdFhuQBVWwGpeXxESz
	Y1y9y8BYuPlvFBkqgR9pJkbmdBGLQLELxhWoNXPUnoUplm9MEoJ4qFX7WEbm6NUdWoZCPSRN323
	Xbe5Lld7v8JlC/FwHJzvtT99EZNCtqA8=
X-Gm-Gg: AYBFou3L79wyVvHdUxMzR/1z9lUxsKTfk41W3Ff31V9VFUv04dhK+7aj1EnfTIYV9qU
	8lw6gxUBvZnWe+JorcSR2qa9abITPHfbpFSiCQqVKZ0856RSSWJl9i9jM3FLg85WQQNo/0Au+oA
	1+LRh/ftTyL/Hgk+947zj7vKmTmo9Ee6FiI7Oum9/uUH8lzEKQBeF8ECO2MyiCzAmmjuqBYkAm3
	hfVlGiiP4n/1frTnTNZcFHb7h0jOrNfsdZQa+o60BJiumAj6JaeOXRsPgDZFQOq2S4h+dcLvQSH
	/WKw01yM4Ze/rPEJeNENRk5SIwSVPHPxztIX0gN/uAsnq5ODYJB9YNHxPVEM6dy583s681ikyaC
	rGzbdBw/WcsHl+98bzaCd/d+o1f4FoE8qYxuj/jJQknK37TRKe97iwRtLFBTULp89mV3xGSr7
X-Received: by 2002:a05:6808:1997:b0:4d5:295c:a82c with SMTP id
 5614622812f47-5640df07875mr7051521b6e.57.1793614910826; Mon, 02 Nov 2026
 02:21:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102101334.3525485-1-mmyangfl@gmail.com> <179361478774.3286.6135052914469846414@kernel.org>
In-Reply-To: <179361478774.3286.6135052914469846414@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 2 Nov 2026 18:21:13 +0800
X-Gm-Features: AclHuK9EuNRiZdYeao8ildznh5zwU0e3Sd13NbnRuHgwGqK6ee6U4mqlc5fMaGo
Message-ID: <CAAXyoMOTcNS7p9rxH7cLTDJ3Ar_Z44zQTJ3Wp+FGiEBT2ZhhMg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Do not publish partial MIB sample
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:19=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
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

Reported by sashiko
