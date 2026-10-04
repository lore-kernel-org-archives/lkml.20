Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96521199920
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116561; cv=pass; b=lLx/j3TonS2uJ6wQfowSBoOSv8eqHYBLyaZWsIOMj6/b5DotN8pfJU1nI17TOAGq2KgiMDRt0BxfuIpvrN61MEGYNtfmGk8lH+tMtxkrkgEYKz+gkbVQorh1JIXcTv+4jXpX8bxNPkDIilou3dqzQcuCqIDn03FN2szyrqWEWR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116561; c=relaxed/simple;
	bh=x+uHHtoltat7u8MXTqDYPaAi9h39HOLYBDpqzqJ1pOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQMQSaobqhyYr1NpsndoKK1sv6w/yTfF+xBLbovlXqAObTBnp4BH5E9Pg9DPxlOaZUWWofL4rPSi6PcSotw7M2Z8F8oUyWYRih2yAjWpZueU4ywBLeFS+dBpilBQ6lv3MImWFcYOiRjVph/sMwwC6TIhsoxvIWq9LJld2z2Py6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh5mfiaD; arc=pass smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh5mfiaD"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93d9310b207so81233385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791116559; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDCwps3fLOrc1vzOnJZ2MvtUcNFvGVWRw7hzBI0N5lc4R3tVZwk7FSnt4NwEZopZHe
         tQEuHPS8kLXhfJL+T8fn0sx7xudt9ZCi44CgU5NPkmsxfBqBZEv9faNUNmfXtMHrqVV2
         4F9Di5HIXYDjlrHA7b84XvD2tBbdA/Wq/vctC9LBM0u2Ui1cP58TspVBGFTAGrqiljMa
         xm4Ar3mEBUPyALiaUd0JxUgjrCQjx3PT8HFLHgDjsmLXhtjEbSPYl1hmwGum0//GnCfR
         v68BBdNevzvoimXq8bVe1BWJjilYe3VExRGmvSLaV+UNslTIG+cI83rSDKg+bYInEqET
         KE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        fh=XjRYihseJjZgHFJUaNir1EbFyJDU8Ga3sz/BgddYsyE=;
        b=h9xX9GnRjjnj+kedzyMYp1rbgIs1qvwZgm69B5CjO+/AVixZSpj3/GFCLjTDWciAHL
         7x83WPj86X41+LAEiFNOM0AopMKb56GGM5JlYnDW7wEgZy+UzCYJxZoMkwOjo8ulmDEs
         Ax4yNjr8Lx+piCzS73GHp+csgegv6cDZmdZ7Fvx+IwVZ4O5Th91t9MQ/S9USOw0+yJvQ
         1vBeMWevW9rRU1Sw0UwKsgOuFpTC9xTLFiRUN56Q0ZW3TJrrTUsV2EZ0yVlrbw0pKx6k
         5s8Ku2i2LKCMa5zKHaGYWzYuoIGlra8QcfXockTwrwy6x9NWD9g+R2mwjVkYXXkAo0aD
         NEtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116559; x=1791721359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        b=Qh5mfiaDcqtxEX/KZtpynwRFQmrG0zBJEOeNnEuCR+t7DZE9LVGpj+1eNNH94tJRkx
         RXXjm/abYMuhx4nKtovXx/zyOEEtr3v+Udc8WAi0NhdbBvE/la+ekTzNDsuUXcCWNPs5
         da0LXPOYhYSJCiDzaBwpZgi/aPi2rF8tIR/rwajwxUUO5EnrLxIt5DLfhIR2TzkbMs5p
         u1DFyPhproPqhclvIwelV7LrtQ1/SS8WWKOPYGsRbo9YcN6LFh5GcYaiSxRyK5gVpPu4
         EEppiKX5d4bauzbOYsYgiXOdBCXyw9WHxz2mSQ38IuQAWnSQHdw5MQLc8+ajuS36WYRI
         iHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116559; x=1791721359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        b=o9iZiK3Tph+brCcfBTNJaBmWbU2gIJvbivdifYSUCgJEKI8ZWSj9EkfRnrprOcKZw0
         TC7RK7wk5nsufWqSaJZLJt8wnn8HT37bTDix7jf24G8Atja7hJToLcUucV3MQ9mnIUVy
         v2Zz5ckmyE+9WNvZOnAWJPPsNtdjY1Q6lO+/WL9TFN+OKnYe9fy74sDmC5gg1DuzTCZN
         xkiVJ+jn+3NZEpcDCUNcTmvDMsMmGD5fLRXB3K8V3cwn8QDgXyYbi/plQo3vrcvxL2mN
         P664xeNfBTaE0ZxdSyGV9tV1Xu0H3sKWkvnT0l9l1Uf+aCynaibui98eiOPmmr3FG9Fp
         i/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDOhIJ8aUNBGpWAyoz68RZcVygqhFmgtf8nnY70SVFsJiKrbl/khYN3K9O45A73npmJYmnwxhYifkhkcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nI469Knn5+Za+I/KC0xxPG/7DT8YHqGehf5Y1bi7LuEFHDFHyo
	zr5274ddJ/4tR9bDIF2ouonsZr+N2+OQ+URT4r1pmYnM0AktH8Kj0iDdDW6W8p5a1ysVIZcqBMw
	xPTY+WpsQlAnBxVf0/U3+6y/2cIre9Hg=
X-Gm-Gg: AYBFou0c/As6qWeOZIzScAnXDsmnkKy+t4K56ChW6jFh4dKffRvOPBYrmJ6rED0TzuK
	KS/jmDF1PmO9qSplI1EB61+b2okMpeq/VIX1II/01jCsRkAY0BRJ625+8sBCGHptTlieQB+xKfr
	xCyQzlEiVme02lAxXB23vczx53vBPDunebU75OHAv7CDyhQESJAlcZUiOfpJsZcRwBCkOL5Flro
	e+2JnE1rj9qwaBeKXT+OmW9UmSWCDLNSSOpv0Ta4zzmGdkEZB3/uHxqrx4gb9u0IcMwKQiq72Je
	/GQBnKqICFWx5n1q9GRbEN7ePMCGq8YyklmlD6rK5tZbpO08f1kva9GvUlWNRsqKD008
X-Received: by 2002:a05:620a:43a5:b0:936:df48:d507 with SMTP id
 af79cd13be357-93ce94ed6e2mr1355623985a.18.1791116559566; Sun, 04 Oct 2026
 05:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004120526.2728564-1-zxyan0222@gmail.com> <179111571610.1402591.377888819234151971@kernel.org>
In-Reply-To: <179111571610.1402591.377888819234151971@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Sun, 4 Oct 2026 20:22:27 +0800
X-Gm-Features: AclHuK9jrfPfFj8M3GL_Owa_kw9zKNkIad5XcOnkNjdlIpwCoWA_TR7BFvZBUXw
Message-ID: <CAP7veTLPuO6QfS89b0VuKSBYDmQkgQtPO94KEhVtjNTNLoYNdQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: netdev-bot+sinfo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	maxime.chevallier@bootlin.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 8:08=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
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

- How discovered: Patch 1 and Patch 2 were found by code inspection
  during review.  Patch 3 was found during development testing on a
  local DWXGMAC2 board: the PTP clock advertised the aux snapshot
  channels and PTP_EXTTS_REQUEST succeeded, but no PTP_CLOCK_EXTTS
  event ever arrived - inspection then showed the XGMAC hwif pointed
  at the generic stmmac_ptp ops, which read the dwmac4 offset instead
  of the XGMAC register.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>

- Actually triggered: the EXTTS failure of Patch 3 was hit on real
  hardware as described above.  The races fixed by Patch 1 and the
  OOB index of Patch 2 were found by inspection and have not been
  observed in isolation.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>

- Tested on: local DWXGMAC2 hardware (not Agilex5), for the Patch EXTTS
  issue and basic PTP operation. Agilex5 has not been tested locally.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
