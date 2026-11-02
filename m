Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630171;
	b=jBOvl/SkTZYc7q85oXHgAh1WqzhRv34lCPuWRRzFLGk/QLzH5xhE4Cw+tbIUtYn60Yj4
	 ZU79PsqOzhK9NxD3Y8lh73N9/bKoNFHpL+X7Qjxtt04346aV8Vuea6RE/GKCtRh7ppioL
	 N7o/qgrHsfMTjCljc4UwIp9myMQe1XUoMzbIU0jCDRxJ70PuFLvgTOeg2Bf6GsK8hjkBJ
	 XoxmsQ5eepADTlSaFuHwSQkImdyxOtArxFIZ9WAFSuS4uJ7PsCL3AoUTjDdUXJTj8gD8+
	 /KDUYUqcAIhxBOyuaudrmTnJV+BTMpbqimBpS4WX3+F2ZxxRapEtoYhJt6YA3rtrj8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HZghXhMFCJS70WDNqvvmOeWSzO8R24cAAyoTNl/owqg=;
	b=KtZl3/xhuaXU1cCMIRxh3ZuP25qvmxj74DChuNVjQ1JnKC6ybqiTsf6kj8m1qVLqy1Ek
	 UMHOHAkj2tWvBtXEC0TwGSV916wQm/9576T5ShJR8dGoq7q1rKzfKyu2onS2K8gexGqYo
	 ijisXe34WdJBl2fhHrID9kpi0dns1W+o+jFE3Oaij3VEKXNttPkX97irlpUZ+e9RV8njU
	 8XJeYq8OhdKtztx0px75HnSnSWTbXOPVyqLeKBL8BKidl+skshgjjIkz7fELmiftshJiq
	 JBcvYbUju2IwzhMwNep0aM4tx8WN5WbO5yw7xkQZZgvDUFhtScb5UcqizmE5kysdoDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqXqd1lH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40E606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C40E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqXqd1lH
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2901046e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630169; cv=none;
        d=google.com; s=arc-20260327;
        b=j6s/T6vjr4wttKDmealjCJ4FouWcnY6H6uWFnOMbjl/dI05ElNggXuoqe6ann5LRrY
         EybuMvfMEAoHK8e3kLbs7SOikIg2SFaGBlejThbX+LNOLi4bNsWMGsJ1mLMgUzInINFm
         lSivqDdzLEiV3Ec2PvRJHngl0KZNklM5yj/pmZr8+iQpLA+jxTwgxPt8pTrn2wVvMir4
         VRyq48Ok/8RqnVxaweCKsZ84Qpjpyx+hTu9Y0gpHhPloAAcVwhzqNJAo5KGqBW33GwH7
         UlmJ9LAioecC4SKU1J4ztQ8GFqnJiaLXRplHuqx7uuVbyt3MR/BQkY5jlRlntsu4wANA
         OHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HZghXhMFCJS70WDNqvvmOeWSzO8R24cAAyoTNl/owqg=;
        fh=PIXokoWwgPWWDcZUE6/yLPF3JjnhxTgWgbLrP+Tgfw8=;
        b=OkZugifyr6bgRvnPdRtStodRAJCoGifGK5OYmmZAebvOSkLQBLRPycrFsonXx3mM71
         KQ1Ho2NW0v2SMeho9RKVy4BCzCz57yCZk+zx3rJETHE00b0mWUtBl19v4fS+g854nVs3
         r8a0nrcpxRHjGal62YGDn47lW0pbjN2fxzp2+bAYTsxQRly3an4F7fYsSlc1cll5++jU
         eAGdu8ZUEJw8luvKP/RIa6wn7O/V7FVbr+FEEo78+RETlqogtweyu8JSaq0IeuUfFV6W
         TB9m/SVjGCqL4cXo5F9kDxo6xRrfaexujezBizAj6HGBwATgFw/SJtdoXMTeUePKtKhP
         c7iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630169; x=1794234969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZghXhMFCJS70WDNqvvmOeWSzO8R24cAAyoTNl/owqg=;
        b=ZqXqd1lHkyXB3w898qH/EyuKRgPF8azcBo3ws910pWQOSRQxpHTevDPReJeLi/FVDf
         x+Q8yuM2jQHToQ8rLjKQ7qWnGjbk/aWwQTSFufi2EGYaswaRVUBtfjcqlzOJ+ZPJ6cF8
         sB7PEmBPBiisNpFZV+GcDAQYzeKCU+e+AEfy+PJkrMcBOWdBzlVWotauC2d9/iFBh/65
         VlxYbzJHoniNss28lOiqSJMQI+QbNptxnZRBD/LSTZIV38lAFfCB+0A3RVfQLNi1NhYO
         FG7LFih+ylIZMFsh2mz6OCmJkS6wGedHMS6ZHIBdGXkYAohAoRcNvzZ7ewHwUwzJqJ5w
         7kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630169; x=1794234969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZghXhMFCJS70WDNqvvmOeWSzO8R24cAAyoTNl/owqg=;
        b=pEaymp+ztWiVYHG1BByINNTJhb1WmuGeT6Ur8ao2sW5cMKCOkfrETMAHfTZ13u+xkO
         yHh+8c/snF2H6CvEswWvXiGaipXcbdkTIlqFZp2Y1k2H8lY2O1sAT+raW4hkQbKlGVrw
         f40VsI6H05+GLRFQt1FcB2h+TsfQ8iXF0lxwHNniansrMFWyy9o07SN54+ECVX1FdpJf
         XDxqeZcgnSFKbLCMc761CZ1ZaLsDgGA1kHn3OODcwrHgEm1QDfh0p/qAlPrjmCW+w0oB
         547DntwMpkyZma1AgFNUhGgQ9lCSZl+H0DIJQVA/1z37o2qTRa0LunxPTGS51YzP7J2f
         dkcg==
X-Forwarded-Encrypted: i=1; AKwUvBwGOZBNfNLvDvrT24mGYR+jzgXPUa1c72R7swAYmXoIIV1i8s4cBECzdx9my5ojiAMZ7C6lG3mYzDsPMNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DnCJ5ETWPCvQu1PSipHYzdzZk5jQo0pSrTy7tfdBmWB+SquXy
	hGHQC/HAdEEWlyjs9HHKROTgVrtLZhmlLFed+0Rr7a+6wN3pk7yRzmG2dUQjPwli+Hiu42cTW8o
	aJEop32/k1PM1aBWHVKZJo2Y8VDVuBEc=
X-Gm-Gg: AYBFou0G4dFh4Nc7CEyExpmBN2OTZNkTjLOB+rF7z7+t2LH8XeUPDHjIgp3p+zTGzZs
	OcxeM8PrznDoJb4X+o8WmiqfjiTkwb1XBGms+LJAovSWFB4xXCgJde6XL3XrsudikJ1TKdli+8f
	Mpqwv9Wy2eQkP5BMYEhUERUPlHoeqw3HRhD5SFn+5AyEUtPKnnfXLhmoFH8lAl2mbcWRPv+/uZo
	3HDuYEeZbgidApOXn56OtcHDPITjRW15bvJQlIUCwm7RUdVGFewFZy7eJ2qFfo0yut8DNYtN19U
	Uq6XYukvib/QIP9S4OEEZhnMPH5/5fDaumUYb2rwm34IQi8aJkzcpkgdSKEL6XybkYE2mdbw+Tc
	bOT5/zMcuBxuRE7yLjpe/HqhCpGzEWnOmPOEo
X-Received: by 2002:a05:6512:1111:b0:5be:5209:9f1e with SMTP id
 2adb3069b0e04-5bfd9560832mr3208623e87.19.1793630169203; Mon, 02 Nov 2026
 06:36:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102120929.4077030-1-anilkaushikwireless@gmail.com>
 <179362163558.3286.5335895869912806815@kernel.org> <CAG0Mgm9t=ag05xgP8f0++x0sNG6nOt9zDWbtoKLtgnhnpgm3Dw@mail.gmail.com>
In-Reply-To: <CAG0Mgm9t=ag05xgP8f0++x0sNG6nOt9zDWbtoKLtgnhnpgm3Dw@mail.gmail.com>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Mon, 2 Nov 2026 20:05:57 +0530
X-Gm-Features: AclHuK-Whg2x1OFkVQJyY67gQO23WC_731REREy_bPWfAluMe-tC1psOHzJ0jC4
Message-ID: <CAG0Mgm-O57x8VqpivQQYXxNFrCqsXkQFmZph58wmHQKq6E0m=Q@mail.gmail.com>
Subject: Re: [PATCH net] netlink: Do not call the unbind callback with the
 table locked
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	linux-kernel@vger.kernel.org, stanislaw.gruszka@linux.intel.com, 
	Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry , missed adding Stanislaw and Jiri

Anil

On Mon, Nov 2, 2026 at 6:23=E2=80=AFPM Anil Kaushik
<anilkaushikwireless@gmail.com> wrote:
>
> On Mon, Nov 2, 2026 at 5:43=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by code inspection). If it was triggered please include
> >    the symptoms, like the stack trace or error messages.
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
> >
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.
>
> Found by Sashiko, not seen in production. I triggered the hang in a
> VM, with a test-only msleep() to widen the window. It does not hang
> with this patch.
>
> Regards
> Anil
