Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE53418361
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766905; cv=pass; b=F4Y4e9VQGKbqP/vEHX1WZflwx6O6OlMeeKr9dvhit+sPHeeZM0wRIBrZqcK0jhwuCVNq/30MPTqlKCuMtSk7qt+zSTVapnjy7sR4aS5MQeQReHfbt0nYAj1s15R1jIDHKZM9CYr2PTDNWRlu5aLvWz1gOsDovHDiMnJ9C4e7RNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766905; c=relaxed/simple;
	bh=QKjvgmeZzGEaOpz3gNTV5TQ4+j80gPA1r1+NsciZfkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIAOnX64UW/HhGZ57CZOdfTPcVHMO6yQGTyVWyxMTXiVK1LaSlagL3yO1BScqAxBMh3JKBDngmYignvvUVEhTpyb+I7BnH8gGfBtDPLaBVpSYYQXZD2i/Y84bPwImQzPGdlT0kGNb41FhxgzQ2EYA7E6AbvlsS33VM1uH8yRgQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=tE1VOsdn; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="tE1VOsdn"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ca300db70so24431741fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788766901; cv=none;
        d=google.com; s=arc-20260327;
        b=gA5whaJbG9I2ccEnRCbV4CYgaT1ANhuDVNWskoHQFAurEG1Kxelj3NnnuvgvfYtT8c
         pV90yeIHF8FIqpco0VcX1kcUtP52AsPaMjX4EP901ypm8/w2FuwlTdneEzzW6BIQ8sHz
         pObgSGVMnfujGNrBmIefk03hs7ZAA392/+HledEF3zrx67ueK/3eH8fXx6CpQs5+Xn6v
         1dWJ+mh3ufLZyW5OrQsq45zLdIy0ptfpPyinEPWDPFvRd/ehRl0au5qcUYrXe1amAvAW
         FeSa79jK/LPeicrXhOokhNa2gj7V93yCFw6SmBUgAMJfxXQ0eTwmjkxsdmHEfiLhVDRQ
         DqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BH9WMir8rF2hqn5Htua6dfyRLLaHMRp/CMdHgEBBKQA=;
        fh=k7jJFqM2bfoFeIiCEE2wYvrq7o0xg5K5tDHDY74b8DU=;
        b=kQ9BjjExq3R1hXkDf7GTchxoF9iNY2NcbWkcLyJqzsM39LOiw8ZUEnkujCmNMBUl/0
         yZJhnyqTlj2BGPys1SwNq5kGJIkCEMa+mve1gDYAwcvss1Wp16AgVTz/+9lM2OhCcHsy
         XCskFEUzIWumBt4sPvCoaPKZlAOGk3zaFNfML/Pq+Wskl0e2L9wSoYyllXgfhjyQs+5k
         dAjxcWYZn/TymgktMpt6eSJkNSGf1OLIw1rOmmShlTHSc9sjsgu8AGAzfwpj44/WvXTa
         9qgP8OvBhWpDaTmDioxE/mHucHKETq4opgL7Ecm561tLRlu/gGSUmyqVG5NyAe10XUro
         S83A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788766901; x=1789371701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH9WMir8rF2hqn5Htua6dfyRLLaHMRp/CMdHgEBBKQA=;
        b=tE1VOsdn0HBsn78ZbWEqbsgTuwQ3F1SMSe/52v0opUisM8ohTsP2QouD/nMe+q9U6B
         GTAtfx07P5cLiUH4o9Cb9Rj8D4kSvIxxWBvqFrEt2s+sQ//fQuaQueokxj8yK4J5iFJL
         2+4iZUo/7XZ2Eqvao+FuRRrEShLphXqC9w33yyweTMm0SoF9lNQUXW1/QU/BmfzCIfD+
         T4Bcta3UBDR1ELd3CARFsvVuc7DDZW2BwJ3Q5PHGsUbQYI/lhmGuZE6urcaKRkD4QMOo
         p9OxDdk5I300G/QQcUzGC649IEgk9t25h0behUz5PTiaqut1lZ4OSZCseTI05LEq8w0v
         xiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766901; x=1789371701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH9WMir8rF2hqn5Htua6dfyRLLaHMRp/CMdHgEBBKQA=;
        b=XzeTJEyVfHflfNsQkJ0H08qXfo4GpyCyWHDtLdSFDVHfAqChlV7+uWZXUIuVlzCJRf
         RL9N/osbosPsQeOE9Tx3g8N6vTLdy8qP5UoEDIh68geKDVU8l//DvOJNobTA4DEgYA0V
         Pg17H4JOFzp7JNvjtABEXKtjwVg7RPPt5bkJcQNPaSObEv2Qdzn3j1jtH6PMJlayMxkW
         3U6t2Ebs+vjdRlTgKuivHDhTmO2FQw5eAz1Y9U6Ela4FoCGFWR3r+9rZas5CUm7OIgju
         C/3scVrbLdg/5PcELQtpKhv1id9YebTlc2Uk+/SKAC/nABvwj7J0flt2/SVhpFxqCoAO
         869g==
X-Forwarded-Encrypted: i=1; AKwUvBx6xMbnml4wwlhoF+vAkGUhRoliiyIb/Bz8EuzJxEmS5owUOKjDkhOxjWmeIC7JGWN1HuxNWMMmGQeewb0=@vger.kernel.org
X-Gm-Message-State: AFuF++le2h8QSHRk8jjna0DHEcvAjQYMJGnbKnB3Dxsm81zqvf9COaDT
	+yKYvTEauqen/9iwGgbyEX/DDJC4j0bwffwEctE8H/OknMeSbwbNxzpavnRbzFjRr8G1qKdj/1e
	rvUeWf9L5IzFAo3A67Q73HG62B/WxASFm0Dpo7rS7VZw=
X-Gm-Gg: AYBFou1gcy6rcY1LTwPP5aWXzDZOCZEF73JZ3TdDBRmt8+1/hugsCdZLg4xa8SsiWe7
	m/pJehk4kSzoYoDeh23O1VZppF6h3Eux8BQiKskC24bKhqhOIeElAjEzh4aIdvX7sMpYz+WeY5O
	V+88x1nFmuI/DRXdFVo5yV/ExY0jcRZQVJ3Z5KMa7rk++ACYRhG41AxvBf84t1heggMpslGenqw
	n1pWQqyjCR/B4Iq4uv9nc/xzQu9WHs1agNIWnFTvnXGL997XdWmgXyfn1mPs4v+HBl0q9BLMn2A
	IhOcmnxDDofBlav6OppiI4Sho6S2xQt5H8T/ITA11z3B/SSMFAaFCGqytL9IxYHzSCh5P9jg5po
	=
X-Received: by 2002:a05:651c:15c1:20b0:3a2:fda9:34fd with SMTP id
 38308e7fff4ca-3a371bb4496mr14915881fa.9.1788766901322; Mon, 07 Sep 2026
 00:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cdc628415cf10721480a51ce14837f846ec778c2.1788248601.git.zihanx@nebusec.ai>
 <178875495405.219967.5594821749566554418@kernel.org> <CAANe3eRBOQud=bMgLnPbD_yUYUkJtT=GBqtY+GR0ZtU0_kbzhg@mail.gmail.com>
 <CANn89iLn+Xi9cEphy3nR4bGnFCownrWa9rTZ=AnijArDFo2O7Q@mail.gmail.com> <CAANe3eR=sQeTRNuewiqo0ZFwS6fk=HtxvT6TMGhq8F5Pqdxovg@mail.gmail.com>
In-Reply-To: <CAANe3eR=sQeTRNuewiqo0ZFwS6fk=HtxvT6TMGhq8F5Pqdxovg@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 7 Sep 2026 15:41:27 +0800
X-Gm-Features: AcwNN1VzGJxnqabKgTDT5QXQvwkk_pkpIGT7iWj3PbbALy5PgIuN8fmhJFOeJSY
Message-ID: <CAANe3eSbySUA=RreUvFxBaE4xFp5Ob1uapgFn86UYO4J8WuXzA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: diag: bound bucket lock hold in tcp_diag_dump()
To: Eric Dumazet <edumazet@google.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mptcp@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	kuniyu@google.com, matttbe@kernel.org, martineau@kernel.org, 
	geliang@kernel.org, gnault@redhat.com, fw@strlen.de, stable@vger.kernel.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:15=E2=80=AFPM zihan xi <zihanx@nebusec.ai> wrote:
>
> On Mon, Sep 7, 2026 at 3:06=E2=80=AFPM Eric Dumazet <edumazet@google.com>=
 wrote:
> >
> > > - bind cursor UAF / dangling tb2: valid
> > > - unconditional sock_hold() on unpublished TIME_WAIT: valid
> > > - clearing s_num on cursor mismatch: valid
> > > - lockless cursor-membership checks: valid as a concern
> > > - commit message overstating bind/ehash fill-under-lock: valid
> > > - missing note that MPTCP needs the follow-up patch: valid as a
> > >   backport note
> > > - endless re-scan of the same bucket head: not valid as a
> > >   guaranteed livelock; duplicate output after a rejected cursor
> > >   is valid
> >
> > I just saw your patch today. This is absolutely insane.
> >
> > Please limit the complexity of a filter to something reasonable.
> > Absolutely no sane user is using a very complex filter.
> >
> > Same for UDP.
>
> Thanks for the feedback.
>
> We will drop the dump-cursor rewrite.
>
> A follow-up can cap inet_diag bytecode complexity in
> inet_diag_bc_audit() so TCP, UDP and MPTCP dumps share the same limit.
>
> Please let me know if that is the direction you want.

To be clear, this series is dropped. I will send the bytecode cap
as a new series.
