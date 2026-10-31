Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793422162;
	b=qJ5OV1wnQxZdqj40dtWJsXh3QnwYdbmnsMCrl94d82efsva3A/9zXAOKsOx//LRmxWg6
	 42HYbJG+TBy6LV/pbhG7VUduXaADyS6gWSf4g9cqLYrNI/5MmtknFXKtpfFOaVMsAqkov
	 h084xoGA61Yz5nX5UCGRPRSJxuIy3dk48oN9cEhW69PgFFAy5c263PYapZ6trcHPP6EpL
	 sBpVYIk24GBpHaO8jRB3UUO5N4+WoIlFE/PzcLVa3CqRbgLcfdVNGJvTbYt4BveBFVsq0
	 Xt9ZsqE4X4R9hlKUWwTPbxX54Uad5SIl0HmsjaYweiizyi+SqknigkqVmArEDVGce0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793422162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DFy0aXOcH5qGYelFMWeP0BXiiUrKikgkI3RC4XhUa28=;
	b=Goh3Fr+2MkIjOglCYHuJxcO0yedegxFsGkx/aEjL7KzQ5IfOSbhj9sdUDcaSrYOtwsZT
	 dkpMGo91f2QjmODRTPi2SElcvmtF9xXALKpvAfR52XQgNdIVtpSGyz7P55IjsdNaUE/b6
	 Dtmj0MCBn7uGIPvVwMmhnHD0AFTwRQvnstQHjeT1C2sTfd/mb9ZlbNqEuyIz6QOSbJ0dw
	 7ct5YXEhR9td/B/x9PxCTMf2IxZl3CKFOrr2jhnSKt6ZKEwxSoPRjhb1m1ZkYhd7tmhsj
	 ADuFyumg86QQVeoj2gXzwGRDiurlNdjlv8qKnNGpKzR6PLJHrhCO3dFLT4LAVNA5FBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfBSgSCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.9
Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF53606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF53606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfBSgSCE
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-7c1f5b1dcf4so276321137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793422161; cv=none;
        d=google.com; s=arc-20260327;
        b=nyVROQJXNLIiVExRKaaiF0PaAShHMjNQg9VyNQR4pgXgJTl2uYh15zeweqkyIixm66
         b2DvpdYw7ZrepkoPwZly6ZuC14YzKiOLlW8GJqgdKoPtqP39Dxv04H7IjsFT4dO0plp5
         TZYrNIdgpB5OHgR8GdVEuvPWY54RhFi4PuvvHDaD4ENy+Y4zSfnQ6DVesVKuQTNsgbLv
         wy2y5pQJVhL+S/0equIXZhPQO60/5Cz5T7GFIn6eXBEACE501WfkyBEuuZ/DnIEAysxN
         mnz4mEsqPIvMk/lCaAXOkQBydHfJ4UmZlIAe7E6I3F3ADtNriECdEFxSlO2gk+tDFnsK
         P+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DFy0aXOcH5qGYelFMWeP0BXiiUrKikgkI3RC4XhUa28=;
        fh=mOYdYuC+msNvDTDxiZ83Iaem7sj1J1L42CkeomV3/K8=;
        b=oc448nEPq9m/mFbSvrUgAmiiMATEraa+acA7MQ//YEA5sMl/ji7tWV6UsPOVG43i6y
         IjbdRXx/MfIUPZHugqOcOi8hecQkLLAIkNu9mdg5IiiHJthy6VrogtUsqbHHCqdKTCo4
         Zm/+83gkPEK4A9jZVWJatiOhicofICfqyTQkf615LQJuh5J0X4yhIlN/BLh74zOu5Id+
         8zkq6irgUMvxyiH3iaPmIMi/hc8S/qmjvp5j6Yad63GV4tmdJQYJ4JhSziXp8M3wtlkg
         EQVE21wVtkqAIugDip43RBOTtA2C2hBa1YT+SoGvsPyFtojO/ETJ/4EF8jDdmpgJnOTH
         I0Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793422161; x=1794026961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFy0aXOcH5qGYelFMWeP0BXiiUrKikgkI3RC4XhUa28=;
        b=xfBSgSCEWJzIq7AjGQNCQPuTQvYK9qaFK9vqMVQWIAIMv39PJy/essix3RXjual/6v
         Y8dbuZiPFSm1jVVOKX5CNi8r1q2aBVTe0QdmS9cvpBkLQuZbERj1Ork6wSqcNQbh1wbC
         rzjz6sc7IGnuv3LGlNMD3FOBjyrnRL8ma9bHG+a3/mihH1wtmgYJap54Dol9LO5qFljY
         ENzU8SACdZFhayVjas109bcVz2o/g47bUZ2M14spABocCEBJ00nuckG7kn4YxoCGAXYw
         x+HC1hxg10v1kAz6hB37Yf1/HHCcpDCfoNxTKzY30aMk1V5ze2Sg9djLqmaByVCbtzt3
         hHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793422161; x=1794026961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFy0aXOcH5qGYelFMWeP0BXiiUrKikgkI3RC4XhUa28=;
        b=Jc7jYGRkwFYHplKo34N7bIY9QawuBLQBQxpQk7n71resr3CAePZqgOD88pSV8z2nza
         /FHS/iX+sqrGAyibf1AQIWfrdAg0apiHDd7p3Jas68KjncClqW3bg257/NY9d+sZ8q9O
         wYawp8kDqQNeWBxkicgEJbucL5l4heyxQFquVuz2qItO6Rq/uk/xA4ru9CrtT8ao1cGX
         NDPO++gHmMpR7OlLBtGs2nMsDkeQsqt43PSKqCIIUUo6J4qFgQAC9fFYuWtvzJG32l8B
         rzth4BEebSndnlVAmorVsJq7K4qzfIChiGOPaxWYJzK0bMzq/Jrh/4LlAuLg24GZ2Br5
         tSiA==
X-Forwarded-Encrypted: i=1; AKwUvBym85pSWyczD+eT5lRhD7DTC3OUMX9S6opkds3Ytv0ZPKoaLJm8NWnZHwpMH4B6De6i0Uk1adTrHtoezC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYItl/8LX3pvWeCVqmZwIExms0ZYOUXVI4Zry6VauMmJTCyPy8vh
	IxciBZDoRhOOafLgCDokhgIhErLAvEJq/AH0GqGhJFwm67JzN0CzUA2XXrsuDsiifC8kvBC5Bk0
	1x7NssTO2CIUTvpcN+7eEY2wtKes8MA==
X-Gm-Gg: AYBFou212dtXS3Sltow+c9zSte7awSS6o1u2zx+TMV8XhTkPI2Fbsz6mSeCUcwBi+aW
	rf9Yw+WA3Hsp1GXl1fx0pS0fDc7DvnY5pDOtPeqk1+6XuleaX0aZ4dc/hP4IfPn4/IKrXyJua4o
	1YePJXkwQQ+q6sH/4jZVR8n3cOkAcsmgOTDia80/GFx8BdIbSHly8OtcOcYF8cpAr8Ebl1SH0T2
	QFkpi5c/TfSVmModC/Lyply6yNxxTs4s6kWum7xsCBhBaXY54fOhnXYi/0pm7zOvj11tUpMZ1qB
	Y5WdLqB0ODvfdhz87dIGmFFbwgLLF7mgN79NgwF/OM3ld4Ly7vQ+EGXT+VKsptpl9f4fVkyKnnr
	XkaVwPU4ex1ARWM9wb97lp6t4FOuom3JlNpH2U/KLJoEeSUh3lLhEyth6fkPe/+U5pyLR
X-Received: by 2002:a05:6102:5106:b0:7c1:e804:3c91 with SMTP id
 ada2fe7eead31-7d072c398bdmr1240318137.8.1793422160846; Fri, 30 Oct 2026
 21:49:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030173930.40948-1-permissiontogallop@gmail.com> <auTfZL8RjQqT8uiW@kernel.org>
In-Reply-To: <auTfZL8RjQqT8uiW@kernel.org>
From: Gallop Permission <permissiontogallop@gmail.com>
Date: Sat, 31 Oct 2026 10:10:36 +0530
X-Gm-Features: AclHuK-FdSUYVJnYySxi8P-Zi8EKZ3CeyjPrglCec33fiP5ieEc_Yb5Fdpv6Yas
Message-ID: <CAMdFwLH_cg_=cLaL-j2B_0kzAEof89r13=cYR--hgeLxC7Bubw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: request_key: enforce keyring restrictions on
 constructed keys
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jarkko

1. you asked: What does "key becoming positive" mean here broken down?
    Here key becoming positive=E2=80=9D means the transition from
KEY_IS_UNINSTANTIATED to KEY_IS_POSITIVE
    after the type=E2=80=99s instantiate() succeeded and the payload is pre=
sent.

2. And on the second para
    For an unrestricted destination, construct_alloc_key() still
pre-links the under-construction key,
    so concurrent request_key() calls for the same type/description
find it and wait instead of
    starting another helper. That visibility is what deduplicates construct=
ion.

    For a restricted destination, the patch skips that provisional
link until the key has been
    constructed and checked. A concurrent request for the same key may
therefore fail to find
    the in-progress key and start a second helper. The keyring still
holds at most one link for
    a given type/description; each result is offered through
key_link(), and only a key accepted by
    the restriction is cached. This is a duplicate-work tradeoff, not
duplicate links in the keyring.

    KEY_ALLOC_BYPASS_RESTRICTION callers are excluded from the deferral,
    they keep the existing provisional-link behavior and bypass the
restriction check as before.

3. the rationale for the code change will be to stop an un priviledge
actor with write access to
a restricted keyring from bypassing the restriction checks.

As for the points raised by sashiko ai (concerning
potential outer-search bypasses in request_key_and_link)
im going to need some more time to verify them and fold any necessary
fixes for v2.

Best regards,
Anvik


On Fri, 30 Oct 2026 at 23:48, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Fri, Oct 30, 2026 at 11:09:30PM +0530, Anvik Loitongbam wrote:
> > construct_alloc_key() pre-links a newly allocated key into the destinat=
ion
> > keyring with __key_link(), bypassing __key_link_check_restriction(). If
> > the request-key helper instantiates the key with ringid 0 (or any keyri=
ng
> > other than the restricted destination), the key becomes positive while =
the
> > provisional link in a restricted keyring remains, so the restriction ne=
ver
> > sees the payload, potentially resulting in a policy violation, where a
> > user with write access can inject keys which are restricted on the rest=
ricted
> > keyring.
>
> What does "key becoming positive" mean here broken down?
>
> Also I have really hard time on reading the second paragrah as it is,
> let me count, over five lines long. I honestly cannot say that I
> understood what I read. I tried it three times.
>
> If you understand your fix, you should be able to nail it.
>
> >
> > Restricted destinations lose the provisional-link deduplication while t=
he
> > key is being constructed. Callers that pass
> > KEY_ALLOC_BYPASS_RESTRICTION keep the existing provisional-link behavio=
r.
>
> The second paragraph should be reformatted and there is no rationale
> or descriptio for the code change.
>
> Br, Jarkko
