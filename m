Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043C3D6CB0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765356; cv=pass; b=U+m9ebBc8FpDYKaKFD7xffW1oQzfF4+SMZqP5pHjBNYCmEjBR9Eg7VV47AEUREfVTdbLwwCkIWrXLsk6IYNGtcgNWivKUgFK+od7Itq52iVb+gL0Xw1CMzBH0j4JBgkd07l3BgaQaw8SnE6CBGXQEllHl6QISUoAdrAwq15O2Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765356; c=relaxed/simple;
	bh=leHVZXld9eH9iZDPZ6fIXvSuhv4Lo3E5ocYgQ1ebU9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEZQqU57+5fYK92LpXAOJ0aFML9lYDIwwaJjKjuEIRwcnAryLfX0DoRvz+PpVJ/oZZQkxU306ttpqg8APbJuHaOb3Gi/KjlSzboxJuWsjMqZwCkyu2meeRrV0TzLuK5EIblNAq0sFtqDUcQr/w9YiFC27U0MxJwItmLHyPg6CFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=Lq1YwZgP; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="Lq1YwZgP"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1981228f8so26537101fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788765350; cv=none;
        d=google.com; s=arc-20260327;
        b=QlcaL/G93MWzGS7YYspf7/MrWEbKy4fJvN7djJ5bylvNwmokT0LIYtIp03escLAuHf
         22QlhI0LAUOANQVzYpyg50JRxSgaEKqOMnjkSTbsbt0CmhNKKxQAJ4Gzqa5TFkUS6UdF
         CH8wm68QhUUFmsk3f2/40cbhnqSNx4n+dMdZuCO+h7YtzaZ42i93y9IJk46pRWNHUAL0
         oIilWOw7GPF53sPCfD5IqHSO3WEcQNRbhx+/Prgvv2dstMdNcsRIV71lwICxkrUN4LFE
         Tte2U8mHnhJgJ/tJ7jCvvNo2dvF1lGVFpSPUIpwme8NrVr1sv8pWlDeltDICpIt8GgEB
         XfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WWwKXGzFB/6B7wjEdxdxzEcQwrEfUSJ8Wvetx/HvB60=;
        fh=Ihuvj3xp0qFIvBnHZKjOeUoMhtyYo4tbnkuMW3BqoJo=;
        b=Cg3mHkNMtGOR55XGtF9IpSTC8q70l1l9d6ijDIhC4HYHLlKPpZolZRyf8wmdtfsJI8
         P0fXs8ICxrTaCMNmWR5pB+RvagoFGTdiqXC1MdJicClk1PNgxCBXMcuXLXb/6+Dqg4r5
         s00fbelsCOTbfj7071aacHe6vPdDgRmMOTH/d156uE4jRw/r9OD8W2TwVBkTtV7pHo3j
         IKhvJkyCXfN6iVvkcN70HNLZ8i219Ufpyh4Ig288n6F8NGlpV+zmNoIoOgqYIGfFSri4
         DJCSp+8Hk70KzNh76ThXxCv4QoEzSaf0qQ00yIRIEumN8ufjUj72gEsR5s72vhjGcYVN
         JMJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788765350; x=1789370150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWwKXGzFB/6B7wjEdxdxzEcQwrEfUSJ8Wvetx/HvB60=;
        b=Lq1YwZgPqRf+7Pxl9disFZ14dqGl/QPk4Q92znevy1bB4ggHV+vi6ltGVKpRmbXSeY
         Fz6I/psXx6S5j5exsaDwFrnRr65fPKk2efBueXG2RcEiQT4NZtQdhs/RsuTa3m70o1bw
         H6vnT+hB1BCqedp6kAOjo4jEVz3PzJKynHawAZ6gCaqVnyUeX7DxbFseqFq2vkXH2NHm
         avTL/6+q3Icf03UjmNMx6EIPZn/XmdoW+ysI1bpzh3l5PgWUKDvbBdDoTuJpImd2TxrX
         JIexykIu2edhMbyLxJzM3O27zDY6wBqYCTbi76dRReRRMy2mvfsIvB+5IPgUwHLmGhtV
         O28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765350; x=1789370150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWwKXGzFB/6B7wjEdxdxzEcQwrEfUSJ8Wvetx/HvB60=;
        b=e19F45Z3sv2V9IdMBXbW46zijeRx71mvk13hX+N3pGj5Q9TzHemDZ/1wZQtEXrKH54
         kqOrJT/W40E6cKIVg3H2wAEeCNjZamLLGlzl4uhxh8b/H0Ce8ZxRpuYW0Ub8LivzOcC/
         BM61Kcly0GMqDf7r3cSk6iX4XUMdaqYULI5vEhji/cht5+WDCvB7h7i3ArwSregDHvpU
         J29Iy7UNyv/XeYh/X6zc3vD9OQh3GC6SH3anF9plIJauTUW6T3ewoJVqE212ZXHrrd6A
         IoL3giuhILnKiSCrEE29oDBY3cK79HIMfmK78xpsArQ9nu8zia9/2u78NOXarh/XsFXX
         bZBg==
X-Forwarded-Encrypted: i=1; AKwUvByb5H3GO72W7CX31FsGDbUMHBmxiPVmWlN7VrEOYpp6Xb5EHAwOosDmSQUZXYPXze8JejC+2o5tDb1+M4A=@vger.kernel.org
X-Gm-Message-State: AFuF++l8XgUjQMo9Bod1czKJaahvoSMr4fUFZryntCop+F/DADlKgOB/
	MiB7ARFi3MQxmVFjeyzTgemT7edXYfg/u7zGpWjFP99Hzbh7X/bVatd68EyQL2VmU0DvV+tOiWd
	7hF1kWp05vnySAY0BxgJGO34wLL0OdUtJfb4gfN4kkR8=
X-Gm-Gg: AYBFou1/5cICObsg/Uw30U5Js/pt9DpjboYasAFLyeNvrcB02OjTGwi8jz/0qM0vdD/
	DohPxYlujflyOMBLd7sI6imJfdksmJiARLGYBGmADDsR746Yt5czPquy4xk2SsKrdxCYrthC9OQ
	jZGZIqOtYGihzVtDMZbhqZvbLNO25ChtDrDRfHcemaAtTjBSe0tOS6pfdGC/25hzTidGvOmXQ30
	Exx7Lmv3vpCu43+RJAewZkMwZCpBqR+/3v2hUHvnL76opC5ShCoQVho7eCs+54zCD+4aa2+GaXa
	vZ09cO4Z4m8LdZxXPdo7zyJxI1B/f+ssi5hWPbxxOn06R9p2tGpo7/q8EBRCbuKNo8TlnFKQjvY
	=
X-Received: by 2002:a2e:a98e:0:b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a371bdb9ecmr21466191fa.14.1788765349741; Mon, 07 Sep 2026
 00:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cdc628415cf10721480a51ce14837f846ec778c2.1788248601.git.zihanx@nebusec.ai>
 <178875495405.219967.5594821749566554418@kernel.org> <CAANe3eRBOQud=bMgLnPbD_yUYUkJtT=GBqtY+GR0ZtU0_kbzhg@mail.gmail.com>
 <CANn89iLn+Xi9cEphy3nR4bGnFCownrWa9rTZ=AnijArDFo2O7Q@mail.gmail.com>
In-Reply-To: <CANn89iLn+Xi9cEphy3nR4bGnFCownrWa9rTZ=AnijArDFo2O7Q@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 7 Sep 2026 15:15:37 +0800
X-Gm-Features: AcwNN1VAmgJsxlkj9OvW4LjLVIy_57TEsN_AWLvPrdkLDxAVfSNlHuWjRZ_THxg
Message-ID: <CAANe3eR=sQeTRNuewiqo0ZFwS6fk=HtxvT6TMGhq8F5Pqdxovg@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 3:06=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
>
> > - bind cursor UAF / dangling tb2: valid
> > - unconditional sock_hold() on unpublished TIME_WAIT: valid
> > - clearing s_num on cursor mismatch: valid
> > - lockless cursor-membership checks: valid as a concern
> > - commit message overstating bind/ehash fill-under-lock: valid
> > - missing note that MPTCP needs the follow-up patch: valid as a
> >   backport note
> > - endless re-scan of the same bucket head: not valid as a
> >   guaranteed livelock; duplicate output after a rejected cursor
> >   is valid
>
> I just saw your patch today. This is absolutely insane.
>
> Please limit the complexity of a filter to something reasonable.
> Absolutely no sane user is using a very complex filter.
>
> Same for UDP.

Thanks for the feedback.

We will drop the dump-cursor rewrite.

A follow-up can cap inet_diag bytecode complexity in
inet_diag_bc_audit() so TCP, UDP and MPTCP dumps share the same limit.

Please let me know if that is the direction you want.
