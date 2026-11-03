Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793745166;
	b=UFGfGihczFc4n7jJyh6Q7AM/Ihky/ctsv4lDHaaiHmP7CGLOKE+BOyAqvXywEoGpRhWX
	 Qylxfl8Rno2HXXRJJYnNt5DjzBlMewSAptulCCaJ5/FbZi3ajITrIoVU1AWG+7QnEjQTL
	 s+HCL6JIzP0HyUSdX9hTAZyhl3P1CR3MFmLy2l7GBSH2x3aG21pGUSNcmt2pYhjBfLAM5
	 whwmB5SxX76aLuCXJcZhPjNX0LZIEirOp4tS6roJOaDxXCQ1uMToYd6Vi3lOso2/cj21B
	 ZmeM0k4TMVqb61pf51oKtpf7iQc5hNMmYvwUg8Ip46KD7jGHOMKWyk0IpkbunFtYyBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
	b=44oJTzQdn3rFR7Cx9A0Xo0iwDK8oKI5Oumcd8+H4KQzvOeG0NHTycLl2d9v9EhauJ3Nb
	 tndoUOC3Rl1WaaYFg8eImy+Ta0cVpR+u6gLFMK/uaHzQlCBM5SBBgOyvgYLLBrr+9Qbdk
	 tYfiF4cPR/SJmat1ohL9cN4TZG2CYfrkJfkA6BSWOrTIuTaANLJJzRDFYl8NRqI5ZhaLE
	 8e9XwSnuGcNw97obTOknRo1JCuhFl3dBJZ+0dI0UceCz6E3YDt6eZB+C6wBkO92c6xlOQ
	 wgbfNKJt3F5qi9LPo5GzyVD2Ip6Ee8t7s9Z0Z2AgBbTjwzOtwFDeFUjBr7iWy2qz46A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wkm/hJhg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA90606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA90606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkm/hJhg
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso18408e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793745164; cv=none;
        d=google.com; s=arc-20260327;
        b=TZmFzzQDqtUVuZQWV+dz23b/1l4k01PnLUrfvPyQiPW0coZe8xagV1sYhW1W7asj46
         ZHDUnD7SolTWKRohmhRHlglwJNA9GGQXx9W1o8SU2ykE18/Eolt0NKVBCHOdL3pcHMEX
         3lrIyUpPzzaSWqK03Sllt3ZfMjEeh2KumB4N+b57Hm+T9iwIfApplFPofLFpqaeUjbYf
         tADujkrzXJbR4bQyfnpsHgQP7HN3qESAUr+ZGsrou0fpRyjK7+h2UcVdtkZUs0XeOmmy
         PusPPmRKL2CUKE1wep+1ms48e6bsG0OAEGEhhBv0to8owGBxHIX5ntIyLO/dIIISDHck
         1ZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        fh=GwvS26bfC8Egli+Fo5Wc6eHgiTD35O7D0ZahK+rUx3Q=;
        b=rNUULTKQ9/2Dt+xopG+KW2XIJvDtaF/uZ+u+MuqNJUE4qws6APDzcFJbNnXRnOEvvZ
         jQPwgiJ7UaPUNeO7IsAxkqOVuvr/d25tOeAK+/cbL/YlxcPeMTCNEavp09q0t1sW0F0c
         XFwYIywBCb00e5VpEZ/pYbJV/rEGd4p+GQoYjgcifBKu+IloeYlnR6NkfXEnJaD4J74E
         C+u6H14oI8gxBPiAybPSg8ty2WQQ1/q22jsA8lxz1kek04xLaUG3wxAnieqrs8rXQfeW
         giIbcHUQgxBadF/z6d97naD+syte3PXyLQIATdTnCjnq8Wk8+zSc1G+FfwJGLqzYC9Cp
         FVLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745164; x=1794349964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        b=wkm/hJhgHHYiKeuIbn2hcW9SbyAuzZAaXNkQWqvOtnCj4o/Syvp+RuhE1N4s7DzZ05
         +jWLyV8mt9GGQQLSv3q6MF9/lhFJin8ATHUorTn7skkyQ1fNU4kNgCOGXuZ/+dKenOTB
         un2m8HWz1y2ThkpnJGUYvhOuEd61lEve3s2I/lKAfuI1ck7zcJ5iah3cpCYFFgaobRp5
         vf7/TgiwMFDbpVkcA7LlfsE8X6XLxYyAHqe8GDaVMk4PmKehyyo1fENv32fRigMNMToc
         qLbggtwZGlbHZTytf1kdL8Y1g9t642VuesAQWhmqnRtra3l0HvJ1ykhFjT9QL9wxp4lF
         2nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745164; x=1794349964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        b=efqsodgS/3oHdjC9I1oRKEVJUIDq2PLPXjyC6Mp4oNwzAaW9QcJFdrc4MJ3r0aOkIm
         wpbVJi/b3+Zl7K4zWT0wiTNXcp/RllVUzn7icgHav5AmWaA7IMraB8QAgukHiLaV2Uxg
         wynnpUAsuF9GV0+nN7Y9QKzzc35WagOaK+Qi3XCA8ZX89hQfHh11iuudLivTgEdkvs6o
         uTyBdXI+iYehILs875TW3Yw2fIhh7TYsoOmglj6TUOen8NtJNyLUiulcePPt43xx9vJW
         AHOG+cDgoKw2IoCmtFlBpu9gksW5npjcfJP6l1+y/bJ1yXy5adD7GZCR52kKK/zhqKz+
         oJfg==
X-Forwarded-Encrypted: i=1; AKwUvBw/JMiMiVyldrxFLfG3+pj4zffmaAcEDL4ziaXKgOLsfd+mCVss9wTBPN0oCS+yPDS415I3JAndDKd5qGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z83jhR36lbWVn6n34lYBXIdCv/ttcJIXg9DSwtskl0tGcmqaOdh
	c9pAkvzyAl+5oofvY1AhHhLEQQCtrqe5CM6YrOIkMh7OfIM4NK7Pl4c+ijkihcK7fKA2vlUTg/t
	Nf+qCOSFt8wkES46DxInHG4+ltpXBcjI=
X-Gm-Gg: AYBFou0ciDzodFoqq3jcheS+ZFPF69Qj5GDLixDNwvlz9nxXDBLva+YeOg5thpWrcIw
	UD5MMX6x4DMLN0LcY/ewEVcYspDlmP8oVTc3ZfmdckmBTKCM2Dz6BK2BM3NlWvXbP+6h5rKHyiG
	4ZRWiPit2YSgq4jnEvAMYaunTigXzaD2qNXwp57REGybta+/FqzEXmIjBeeEnPBVtK2LYIp+YBU
	fve7ZwLbqBJ/T8dmHdGE+7uMWHsBfLvkuGt93h7Em8l0udFTGqvyqf3XEfq3ClgE0NL2TuZD4sl
	gu6KoZhd+yj6ed4dmccPFjYqHzMjkfx+HZdP4RgpVR4GoB5DFl9zqLkAU369SgM5XcQyXKncB1s
	gd319jkKi8m6P5RijvKsRhp/QKM1jbgpIyOaNTR4zpeneUkRL8I7qErU=
X-Received: by 2002:a05:6512:130c:b0:5bf:e7d5:c22e with SMTP id
 2adb3069b0e04-5bfe7d5c338mr2656695e87.65.1793745163648; Tue, 03 Nov 2026
 14:32:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
 <2026101402-spotter-stitch-056b@gregkh> <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>
 <2026110322-axis-wispy-1081@gregkh>
In-Reply-To: <2026110322-axis-wispy-1081@gregkh>
From: Rishik <rishik.yechuri.code@gmail.com>
Date: Tue, 3 Nov 2026 16:32:31 -0600
X-Gm-Features: AclHuK8A-NQfFx6x1E94e4VUIEtshK8qcRhPyXPIT8gvbVXDtzDYV2Awe3jTmrA
Message-ID: <CAL4M7k6LGK8Cvn=vVYw2XOmhsYEPre-6Or-bEndyQT8HO1jphA@mail.gmail.com>
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <epicrishik@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just saw that the driver was removed.

On Tue, Nov 3, 2026 at 1:22=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 03, 2026 at 12:21:18PM -0600, Rishik wrote:
> > I forgot to add the assisted-by tag to the series. I wrote the series
> > with some help from claude. Should I resend the series with updated
> > tags?
>
> Please rebase on the latest kernel release and see what happens :)
