Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5344BD7B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487784; cv=pass; b=p8De4NwiGHtHCzNzeDlvtWospb+umA04VWWzxBAsk++7TB8YO2+GvhWCL72MCF76CnA2UW+e+sPo685NzZY2xC6HCnjExwNewR1RF4OJ2lCevIdCe0C62Y2LCHtexiLnPMiZVdx/eJNfQ5OnKzeAKtR8F/y7s4EAskuh14RZxmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487784; c=relaxed/simple;
	bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4Gd7jR6lJDo0OZjdMX6BVjq5ehMZ9cx3IQcgCvL26xT/YdsOJojumS2CcERX/APLzYiulnKpdr2VxSYiX2rYb81GT6RSb0oS6qmbyqP/y+AFb4fJJmR0T9zsHLn7OI696AogIBfVuCvFIfj2z8aoT86+7vCqlMdx7C8MWgRpyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn6s8tb1; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn6s8tb1"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so27503161fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791487781; cv=none;
        d=google.com; s=arc-20260327;
        b=PQd3qeX3XBZv5f1v2yR8RX4CVUpuyUk57rA9JjWIHPcUa8c5+VdkLXGW3JVI1u1h3h
         Nuj/QeFVzH4U9kYuyLzyu/zhMH5XQIjXJppmnlHte8r3jvScWMBvPQi3qwScqg8YT42Z
         KmwJEVjNmzPX3qaWFIWe6zh1zyTZXfZuGn6iBOcw2F2IsJ+KDWbOb4yU4X7BmbzJPPsn
         /O3UNnfOJUDE4XwWMQ2/pgfdYda+9EbJMC5fQe5ojRQMEeNFDDx5Qk3fxPSkgNZTI/RB
         L1oIErv5OX3FlaNp71dFQ87kcOwMbBfZZwHvNW0BwiTT4Lm4pz1FgLwgKqXHGrVUa1xA
         95OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        fh=Rem8BY9CU0M82wvyW1bGA05XobXOkM/IqADBhyy6POE=;
        b=lm8X5px6uko3l8UhI539VN5I5tPJ30/3+l7tqW01OtCTm5nasH8UPzlh6WWZiKNGVn
         QfjlJkfjXGyw6IYMo13w0rvVRRYytzk2DutnJdBWqhGW19GgdIPJNoCmC7hD+LN43Q9r
         AUZpjeM7x0VRrHvrz3u6QIbOWruSbBWPqhHnpCG+0XwMJBom9KqAR4uPHhBtPLGtpiAt
         GY6I3L6l2cyrq3gBFxy3ftG9pc7u09Jdtnd13JHbolWedIbm2JZQYCS2tDQ/CKen9Hz8
         aSgfZKCy8t0Whhsu5e9i+hSvdBNnKdElX+IH6vEfo85LS3CJlqULa7T+i4qy5TwTGCeZ
         z30w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487781; x=1792092581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        b=Wn6s8tb1eiVxlv5gZBq8iT3KJpGjQLvnTO/AHZIgEXjIZG+Lhz3cBxz9g6pMTSivp0
         wtTeLJOmaAiPJSlSQOd9Ej4zOx0wKZ4ym1gMaPC+5iNC/XwmE9do2x1yWrR0ZsT3WHTh
         w+VsM0qSr/2GWJx1SzOM6Eby6osj7AxkURxNuREKFU3Ova6vf++oZ9+etNFhyam1NALj
         Od2bQ1cx/eFsFP3UDnGod8REDTBpuxc5k3J6frNul3JoTNVqwgWMjVadxVY7lHJthEaH
         ilc/QMDjwZp2s7n7giziRaMUj+76BvUF4Ofor4aLNHTC8T1qC9C6ChFjGbX5KO1AgKQ0
         k8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487781; x=1792092581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        b=w908bkjo2U9efOEDDmpgCE8JgkBS1kiM/2A4DTkJRy+F92CUVKid0zqsM2/gjm05ZV
         hKCdhZbZ2xxpe36Yj5Jq1ZlYLcCu4Fl0a6Jd58ELgZTytu6bdMPf5VSqogBHaVGfLEVP
         rPinrsHuinWk7IOctcqp5YB/4E2/WFL6Nibma8oPD1eSGqNymdafNJoQcoh/67q71lSo
         ZT1DUVKpdb7YCPQRqMWhpy7WKIDDs4GZOt6EzYifItobyWfOdXHfE3jDHWiwpSmhZJY2
         y9uNOO978VpKbSmEr+KOQg88fUrYjeT2VRICz8ooMsX1zKsNAu6N9fhEq15cWknpmbVZ
         JLhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAcf0l0yNT3BCkEgJoHI7uKzFR/pzhniecUZY7x+zttIT5vEYFwxo6HfLIj+PSFxQH5A+o/WAY3CMco5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3EiMqAVREfR7an9qBLAbYkD1gh/DTbnnYM+2BNO06b8GtVTsQ
	WtMovYKAeLguW26yuyYwD9ooFrC0u4/2o6jxH+dbYG7tbMSsw5T+RONx4mBio+mGPbUhK8fguSf
	wbaBbvCrJafPYzdc3RnZSULqkwgo8c0u9cQ==
X-Gm-Gg: AYBFou0gM0kXiW1XxreZm4I6sFtqK8RaS4jQoP75cn9FslXiQdc1zm1l6RhyGSNg4mu
	8ykqKp5YqO6PWVOoN+/Sf5xhjv/bE29gSgjJB8ECtUNhvquE7Kd6dQ+g9yqSFp9mmXUPR4Cr7d4
	Y5Hs8FgaIpL/SNFkyYvQTVttdb53psC4k5YOE7l5PReo2vD6avMjd96ktz57UPbsgko+70NXE4I
	iy8wnUD+hn3i33yEo3akK1QDR8sXGuKhdpYN1ASOgIGXvnGXJziIH7cPa6dGQe1pUAOSEvulqMB
	hiYewFUnFwzZdbimxOh5+jxXCjntXOOvo0tuMesA67KhTgx48FW/Bu8zyKN8y/EFRVpqOCd1HNl
	S9NrkDDva1bUlLg==
X-Received: by 2002:a05:651c:15c4:20b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a9c2a6f0d9mr491601fa.19.1791487780457; Thu, 08 Oct 2026
 12:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
 <20260803-alpha-fp-exceptions-v1-3-c99d75608e60@gmail.com>
 <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com> <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
In-Reply-To: <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 15:29:27 -0400
X-Gm-Features: AclHuK-YAox1Xf7NjC5L8Z-SfaibsiX2e4acSu8a9kwaQSKw1rOePouwIqBhWL0
Message-ID: <CAEdQ38EM0FyqYZH6b30oxScZ481dGqnsqu23iePLdx2gCpqzxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] alpha: determine tininess after rounding in the FP emulation
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, dalias@libc.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:13=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi everyone,
>
> Adding Michael, Yoshinori, Rich and Adrian directly, although this
> is an alpha series, patch 3/3 also touches the shared soft-fp code in
> include/math-emu/ (op-common.h, soft-fp.h), which your architectures
> build against too (confirmed by grepping arch/{powerpc,sh,sparc} for
> includes of those headers; parisc/m68k/mips/x86 have their own
> separate math-emu and aren't touched).
> The new _FP_TININESS_AFTER_ROUNDING macro defaults to 0, so the
> intent is no behavioural change on your side. The new guard it adds
> in op-common.h is a regular runtime `if` rather than `#if` though, so
> it still gets compiled against your macro instantiations even if it
> should dead-code-eliminate at -O.
> No action needed if it builds fine for you, just flagging since it's
> tagged for stable. Let us know if it causes any problems, or feel
> free to ack if you're happy with it.
> I've reviewed and tested patch 3/3 on alpha already (Reviewed-by/
> Tested-by posted).
>
> Thanks,
> Magnus

Hello all,

Could a maintainer of this code find time to have a look?

We can take it through the alpha tree, but we'd certainly prefer some
review first.

Thanks,
Matt
