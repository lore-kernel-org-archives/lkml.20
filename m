Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615085;
	b=u+4kPHVQ62IV9Xd3nQflUX09AFO4wsyi+FuMIINgO2pKOYF9A5lwonn3p0aPZHxR7fCL
	 e65GmP6jkynK4KJ4sRo9LvAuNC7yDth4XrViuxgMF3csuiHKA/nQHVfvf7L8/bVdXkqo3
	 UYqbczmV708CfIV2BdkfdgJW0dPhh+mJUPaV/zMJUiMolefX98wQzBw9LKisSHeM5G2AL
	 7479fT/haULfQHlBPqbbUpQekhVxzOWIaClIoRyLY1+As/8WNLUo/FuSNa1Jd/lW7E787
	 jJCsNL0FCaQWZz4JUzViapOaTgV9BubMrt768scN5ctDQug0z5avlH9XfqAxBvidONA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
	b=jSBnFRUcm9Wc6XdvK8jX4uNPNEILq3ZJpQNBmnXB2LH45dNJEw9A+Q6IKQmH+a/X95gM
	 rJOkaalRQeW5xrDxV3UiRCsaSTOcnN64+HNGPOY4KALqTcpI05Clz2jCSw7nRYgXT+myj
	 SstyUfcSzCOcIkGIrbhKOosPxSaLhLh3VaAko9Pp0s5U9AwqjRwuIQOz7UcMe3aYxiK6J
	 8bhcXhYwUX23MAPp5q2epz+q3R/tg8EVEngo1ZjOwzTwFmZEYAGZyytrRi6Ifj0+b95mU
	 6kWpVLejMeNkgJySdmDWkgn8P5+wHYhHX4P1iaT5XbD4yY70lNHWZnGVPfUsUh63KpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=P9B7WV3t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F12F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F12F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=P9B7WV3t
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso788975e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792615084; cv=none;
        d=google.com; s=arc-20260327;
        b=JeldWFzRVZXVyacD6SYtE0YemcvJ1wRA19uUg3O4sRu3Je4YS5s3d+oIhMCTHwf7QG
         zdVj8d1r8jPNKtN5v6gdfdgxCbyLLGIUkouX1dvWOTm/0++SNJIz6vY7Xdo7NYsMBB+Y
         +CrQsj+LgUABIEMnQ5KEtdFqEq1e74tB3aHB6ZUcISqF/ipM4IWgHh8XNHfkOcHIaAtE
         QBa+wesGXz3Iwx9E+9QuoTF9PfdILR1cKm+m//wk2RV5afDJfsEYerS2i03Ty05AJ+SK
         q+LChcIwPygeoyAMdg5LUK6+jEZX/wHop6jnIg4Q5KM6BHxxuPvFLEGIaJjvanAgJuIW
         dnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        fh=uu9Zge4rNn6EnoMO2FHHcfWyKSHjDQTzyzvqgt18xLY=;
        b=ADll6+wMJdQFGBn4hZgxTFrc8dECEeR4EMpTAlGBiHCCe171GUCYleR50qDIU1/10r
         K2pPBbEf2jH86sLTsMC+JQn7XAVLAtsF0yqLoWQQi/vjVkWeY4xsImr3sJvRo2gvtkcG
         LBXM0WCWK8tg45jJZhs2wVoF0kxm4zy7UbYjHeKL1UNzC+96gkbrzuD3y2a8l7J7mxPw
         mGlHtEFyHgz1KWHpZsyze4JcZOP7pB2np4l0HFZU4jBQx4MBZN/QHSxCIPds9f6i2otK
         rJkJj6bR1eWz/VFQnV+Q+BGLdaTV1DyUUEBHyfTLUcEufYfRGhPRThdoSP94P2yUfxfl
         ebwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792615084; x=1793219884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        b=P9B7WV3tW+qvrq5niXivgO31cu4Owz6HdP3qvP+Iwr/St9Zhpihd1UVKv+q2HbFj1o
         2KWmaSXK0QaAHoNdAwIIRsPz4An2G9/nDSg2IlVf5cQZAmw7TfFudNyeJNrf6CtXqC7B
         Kr0JszlArIOVBLh844PiJshSg6I+azbo6+0CuT9pAbeb6+KWyCsGhbAhGhXRi3AiGtYZ
         bQzc5pHMLExJ6B4wz+rEIoOOdAmR15HAlt+ng57ZsbQPn1iNOX5QlzfOIYJwhR+v0ojU
         7sGH1pIpj1N+7+iJhZOY+cwnIDbFU/ImANQcJyfrv5tfuEQJ6KOHc7LithudHDZayozG
         7AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615084; x=1793219884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        b=Qg6qbtiSPpPdlUDb9PdVu/ebJK6/lc5HneZiRJjNx9RgKxp13gxIoHsC4Y5RdaNwBr
         JXgPctPZJqNEjvomHoH2Wi324r1GbBHhpWX5AgNjltfhrq3TRl/LSBr0gCXrUW/FDpaz
         ChHqf9k7A9GWAbUD8Rrt3ymqdmjfC+w7enYreZ2bS1WAK+j0r7ywq6m+AJwneWK+eZL4
         nvt6rCdmMaz8cedAO5FsVVmxQQMlbaaRWG9H9k3McrNLFTnZEW/zSC03hHljFT1NCYpd
         hPgbFON54WXKhMVPDWl0VbePDsWDx9VU44oNZLVKzDOkb7dD2nF0EPKgw+D4cMhdn0O8
         9UPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPosB6khV/+b77yHv0BQ1KG4bd+HiPwhuQ6me0l8BBrcT59dDLG0MNRoBIeOfc6ZR6llVgBpZl35ZNxrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ7KKDiIfKqd9FVRRzORgUSveAYCG1MEeD04Jp48gJvJXl2H+8
	hBNRl+yHEttoAUZrQvCUtbxZkJuIhcQLstY3o4jHE9qRYNBD0PZuP4Kstt50Jl0nF5DVGWQTQCy
	rDU70Xh6/0l3tiy52g5Ewz4yvdbuVkPy19x+NJwbrfQ==
X-Gm-Gg: AYBFou3mo3PZVVwbxsEBoCG6NIUsTTB1v79Y1z4N21cxz5uBJpue3wsh7Znzdm4suqz
	yxoSBM2MvFa6ltiNlmZ/PkhBJ8N1Im1D/UlFhUVyRSJouATu7IKSWPzkP2k5Nv3C8wHK9DIeT6e
	u4MV/uz0REXL3BTJ8aGhpteLvO7C+mf+P+QrkwfavmH1z6yt1CYbhI2+sAyD0WOsyIFyqVKlVkf
	+i2uV2DLRlTCh2bcjlgyhulmDtCiavePgj6p/7JrXKEPlq6RgLZPwpHfai8bDisFN/DabbPLOSL
	Q8WzBsBTvbwWXFG+gKlTe0+Y4b7FO+NYNHRzUKJy3/roU0SNZn95acXC9UgPKbObQ3wse9cOGU7
	AXbPQpL8qzrmyiHVF804inJzIF2UTl0P9w8a9bK/kyICFfEpX9UBMJ4201SeFpv++3jb8NzUGyM
	KERNnioxz6NKF1211Q4Yf6WKdprT9o38VMTzJ6yNbFC0BxhzFxGU7IUHeae1kaYe7s04cHSVMY+
	zcPGPXQM8CYZJTHZTacRak+Cg==
X-Received: by 2002:a05:6102:850f:20b0:7cc:3eb0:6ea0 with SMTP id
 ada2fe7eead31-7cc93ac38e4mr702006137.22.1792615083930; Wed, 21 Oct 2026
 13:38:03 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 13:37:52 -0700
X-Gm-Features: AclHuK-ZhRkgIdv5yYGGMnFPJ0d_TUAMLJF9EVSU41qM5LLHoLsovdDN6fqrV4g
Message-ID: <CAKaoeS3iWOm6Oy7V9VZChyQuOBYB33EzbQLgt50E3jj-tMzCbQ@mail.gmail.com>
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

This issue was discovered during code review and subsequently
reproduced on hardware using mlx5 and TLS 1.2 AES-GCM-128.

Changing the route between TX and RX setup installed the second
direction on a different device. Driver traces showed successful adds
on both devices, but both deletes at socket close targeted the first
device, leaving an orphaned context on the second. Both setup orders
reproduced the leak, even though all current core TLS context counters
returned to zero. No crash was observed.

With the fix, the same tests correctly fall back to software for the
second direction and leave no orphaned hardware context.
