Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793731088;
	b=SxYJ7E11j21H7f8WUvVcKyX8Vt9ZQmn2JRik+0kRzlsz0CQPGgHDD7qq7yWQI4aBkKww
	 fdhaX/riRTfYsCLGU0EpXJ0KUqVY4a4+vM6NRj/MISNJCYr6CC9QHOtPWkux2nSZHnMYt
	 UIg5eHz5tADCb+2N+rOt0zd2AweaoHqJmPNDW1XwRyZInYUyzUyn7mYQNm1LF4nxEU+NL
	 ETT/scHWWKNtQ3UCx9xec0VDaCO3HKX8ilHxmPpmFryyKEQi6UllMQzF1JXkZg4emloTO
	 xROVMNld4+qP9lX3TkAGrodhxcu4GLrD/NRPVADY99lr7DuR47hkI6oztdFVVrzTTbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
	b=IzXQY/ch27EE5wH/PIWHeGrvWlXqe0+YPFHZBOuJSQsCfvgBS6g4ziZhxfKjG2qdwS+I
	 68Q/O/IJQzLLoE3QqeYOPiNaGdIJCPt5vhwWlvueC9quj1lWP7fXW1Esm9U/u0ipcnAM0
	 w1BLxqJOB/6N2KrptLJb/aqNGYFpOfAU582j2K2gVnVCkF3dUEeyZP8nxiDSsE2thk7Wg
	 SYHjGypN3fnah9z/MXtdEkv3UQ1SBny4p9WZMhvyegaKAUnUkmgbsNFJ6n/rQxdmGfDwt
	 R4RwU2odtdCQwkxdaCvZOtrYh+dKDfGpfnSvRh4A2Lx3vSySTrW9nvMYn1i3RUYXyhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917C606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D917C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2716942e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793731081; cv=none;
        d=google.com; s=arc-20260327;
        b=R3/fj/56ZEhRaFMhlruNHTXMY4XpKHmyn7qYRvYdVBhxPeGiOq981wbTITJEXcN9OE
         uVIpTJFifX5jCJADI2oJJL9sLZaxjlZHg554t2AGuBvWNVmvOJnjI6XKHo1xD42cYe8Z
         SRgzLuCgNXy9CuUaCbQK7S3zqfwQUK5R0aRVcW5T0Fg6CBSAhtZf7/Z7+0WBE2hAgut1
         mg26US86AGQ48LnA4ZhPtuRux/YSsn7pehF2MWs+0k7FAauAazq1zWlXUcN0lG6p/NfB
         8rhzeiujWBVesCvjqnawVcpYY9qhuHye1LcC0IyVl4XS6HUHTDSaC5rnou5ElEpu3t9f
         J48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        fh=iDNh111B3+hBBm70zTVL78NqunBg8ao4Kau9tvHDev4=;
        b=bkVGlRH9M4LGfxe9LgK8Dbqd587IJ1ajoYlxndNis48bLYr4ZLWU/lSDIBPLqGkfDc
         siAKizmoMLiB+Nn1jnnCJbgSo9YiBx0zCksenP6fljtE9a4/2l0xEPfvJm8Cf4Zb/+0v
         8aLl77iF3Yhepm4JD29U2M63KaVTl9TxMx5YSbVFiYoNPvUxdI/YmJRK1JgWxPTSCaU6
         cdFkCahC52X1faBCePgGc7AsIe3ElsinLE/cHAlO+9xnGhWAa5Mv5sM0qRcmhAO6369w
         mHIZyIqyByjX8CpsnY+6Opnp4ZPoijoy8kdiKtWRUT+RqbdCCXGTxh5xkovgBDPibGYf
         5XLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793731081; x=1794335881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=nVCsNw0y6hskrENSBv8EU3amWuYztT8dLT5p7AwDRfBEJgh5KCH4wcnDy1+4F8oz26
         mugE2B8LWKKCR0Y9k2Z98xSLZ5eNvcfR272i+te/45lnsb9AWyAtGJcy3D9bL7ir+f71
         qQpNmsSv7T5esoFkU7QTr7zF74lmigXGg9dzQbwmAGy2M5yd+bQ/6ZIx3r0WugxBJ5RO
         hJm/oKDuQExrJP3FUtAD2VCpRZdYySsqRCW8MbRDOe9JChKA+5WjiMn7EutjmI1dtjC9
         TX6PAuZUUq43suQ5ErDcrLsoaFbkM/WfFXDhbG1erayEtyXYdgmMQ2TL7MALbarBBDH6
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731081; x=1794335881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=MPmxjB/4h05TbI/33BC+gT4+TUdLcyv/TPklcOYMwDP6SisNAClIzwrBDgglyIO1vk
         Af8ZKBsaL2g/To3YWBlVtSG2FA/Ug69WG7yaxO/Si+MB2sPm2uD3TdxbZSUM8q8u0+pA
         Y5dWYfbzDPcIMI26czLSem+HS8PVBcyRg85i3o/25ITXkGF6s7RcUu0Dwg1oiurNLCoR
         8O6LImHs5ZK4WoSen7K1O3UXsZMJmvi8OH8br7CWlC2H7qTkO7aZSyVhyb78pE8wgLWL
         R8vFjm0GQ4/mwQd+bB2sgIDNmBN51/egAt0ydLbo6TyjrIQV/JPe8jakpI2F46qvIZqe
         StnA==
X-Forwarded-Encrypted: i=1; AKwUvBwvGGSsEpkBfzqTci5eXQ176SR+y17Cr2tvvws+zUNckcAMOJK0XsVcLtktvilkqO91Mh8Ghjz2jxvXq/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ovvCx9oVtLDVP5pyeh6uZ9KI143emc1GFskZiI2JC8c2cgyUD
	HLI72KlD1IgUZqboD8AFQBkTsvkXmWlX+l0eJhAz3jogBSlrVhW3yDOK1x/phiQdrZ//sTO3Dzr
	SwKg7rAfU3NG+tWC7Mm2tgrOb4fWTTnTXkWKNaHcK2FLx8Z0Ftd4=
X-Gm-Gg: AYBFou1E6t3cwFV9QIdEu4CYfgaNAPVJVTR5PbGTyM41JW+ZMj9ERjG4QeanYW7fBID
	Ieugvcs2kdSI8FwjiUKvU36K9TrO7DPe2l74sxQIu5t1HtfLMrA5fanupXaXjVqbHTmNEI40YCs
	CHWWGmVJlS+8dSsvxyvlIjwz4bxnkRmJml0h06W5KShbj+pURFkJryVcRKp2y6aFw/kQWPWx/XR
	QijnRdt2U9oU4XDdfnjhLFDbMkdoJ+3EGSPVDu0G2LdaPHi2jikoQnQUaz5vN364jIHAFebzm+z
	au2kJjkxHvFWwJpPxrSZMlyq5uJmH7/EIN404IyW/Gs0QHUnsQC0tSQF9U9Cfd/3u97uaULHtcx
	GeI2QqpEGF3LiIIHwP33TzeVpBAoG05UdxQ==
X-Received: by 2002:a05:6512:3ca7:b0:5bc:e8b0:5652 with SMTP id
 2adb3069b0e04-5bfd9589099mr5147409e87.63.1793731080985; Tue, 03 Nov 2026
 10:38:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <auM32mOlBLu6ZUlt@google.com>
In-Reply-To: <auM32mOlBLu6ZUlt@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 3 Nov 2026 10:37:48 -0800
X-Gm-Features: AclHuK_sfbKF658HbwyCTsOToNn9cXs0qzXn8uaPUG4vxi_nXA5hXmjvbt4jwHQ
Message-ID: <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:

> >
> > Why should the task's cap masks affect this?  *Maybe* cap_bset makes
> > sense, but I'm struggling a bit to see why cap_permitted and
> > cap_effective should matter.
>
> Sorry, the phrasing here may have been misleading. Just to clarify:
> none of the creating task's capability sets (cap_bset, cap_permitted
> or cap_effective) are used to restrict the new user namespace.
>
> When I wrote "reusing the existing task cap_bset, cap_permitted and
> cap_effective sets on namespace entry", I was contrasting this with
> the prior series from 2024 [1], which proposed adding a 6th per-thread
> capability set to struct cred.
>
> In this series, when a task creates or enters a user namespace, we
> simply initialize its new cred->cap_{bset,permitted,effective} in
> that namespace to user_ns->cap_bset instead of CAP_FULL_SET.
>

Okay, this makes *more* sense, but I think it's too weak.

I have a sort-of goal of having the creation of unprivileged
namespaces be allowed in most contexts by default, *even in Docker*
(which would involve the Docker team changing their default seccomp
rules, but that bridge can be crossed later).  (In furtherance of this
goal, I fixed an ancient bug in newuidmap that gets us quite a bit
closer a couple weeks ago.)

But tying this mitigation to a parent userns means that it's
completely unusable in the single-deep case.

I do have a question about this whole scheme, though: are we talking
*just* about CAP_NET_ADMIN?  That is, is there any other bit that has
anywhere near enough security relevance to make this kind of thing
worthwhile?  Because if it's really just a single bit control, maybe
we can come up with a nicer scheme.

--=20
Andy Lutomirski
AMA Capital Management, LLC
