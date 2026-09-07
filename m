Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936943D4E9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769680; cv=none; b=ZqLLq4VMFQenlvVMF9+lZc2wCRgU09HpuwVZ82kG3D6B5xGphtKrJZHxCvA/2H1oRLNaCGb/MKcg+YW/Dx56LB3ovTlNOOnrwxUZUaPDAqPzqRAY8U9Dux9Pgl6U402A6Hw26mgGMnkH/k+NE0zqID47SBkZ79ysw89rUUT/F04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769680; c=relaxed/simple;
	bh=bd1ZOmzfRNiksu2tSl3817XFi3Z5T/Ia/NPjjGc0zfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4o5s9xyR2CO4DnSlJwayyZFwyq9PWXytbcCV1aqVqQiafErw/V78Ue/IkCWKmmOwRUChpt5RP6w9TPY0YA6TDbZYlfBRkFUTPRnZwa7pM7LxnQNj447p56HYH/wvWWFQ8aW8xI0LgApmDRsQe2a+tuP7cjTfzPx384LIb4jr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c7afda4515so1921392e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769678; x=1789374478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utF5dLMYbyk9S0ybWArep5L2lR1m6zKBr7dnthB2I9w=;
        b=gU3sBQS2Pqmiznhfu0H5cDkwWluFS6bY6escd2ZY9U72MyNc4Jm7njo7+z8/X987Ma
         dC+1hEdU+ZrsNpRn400sHVWfkepxaexwanksa2rKm6oDKQgDTkxI/jOwMeM23t8GFF59
         rmd+EZrYYgcJ2TEykCRhGWc6MSdv+LE1ggT3hKeFHbasUp4eVM57iIya3PCJIwwpC8K8
         lGZUR7IUtkeQAso8km1rs12Syli/J7jwgC53E6yCH7kkn4m+olQkoZQ8NwW8fGkKZRxL
         yrecafRg7eb6+Yj/nv9+xZma25Blp4jqNAgA1DqXSAKP6lFrK99myiHs0RhTg4pJrorB
         t0ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAquId3yuSXhNRkeOD0Gh1Ab58GnaVtMTC8+ZAxNLZ7ZUIHY87vxiND7qSJEXlLiAE7c+sCcfZdEtMW1M=@vger.kernel.org
X-Gm-Message-State: AFuF++nRuGFZ6Ihe/yoQp5NupfHDk25KTrLG3VJDYnfUvp3hk+eNzH7v
	KQ/WQ1vtLw5Q0KQO4Vo/PO7RSlQj1iPxgSplLaKhwhctT3NQbtY1K1PcTBWj8PSL
X-Gm-Gg: AYBFou2/SZsRHY/FI2QwzJvtkGNQeSNN+7bJtcb3FWS2Ah6xKdMIKAQ3Q+UPfCGlQNb
	bS573E24BviFgmixFlQOZPd2LAd/YxuBT/+Soh084xnqYq+ERzj/pTRuQ4tYAmEGJOvox9kzgyV
	pn6PX1BrJHxuUeoPeXvQhZu+prXkq+ytUYqUHCN/Kh/k5FetiYqaUm7tXEVuhDCmSRwGmnwlwhO
	YsX7makYm3b0DCkYXitPqINsBqx02mprRYnk+jKFRa647gVpYmcqDvMSkVzMuNbd26NIc9FTi8F
	VXZh76TZOuRWrRcD8eDdI4me0TXHnbCScou5mmpe8whx2H0If0ueMXqfcR74981hFSguqIuYYCI
	TxgNtWo4S+MBK4kWxOOfghs7gk1edxe4j2J5GjNvWLQNBKHF2w7ntBwQZefcB4BO16fLfk2TNHW
	BCmYqVwsQwFJo9BqxJTe/7/21OP3CGSd7abo2v3GVgottgPoc096eqa0PdfQk7ec833HFaT8wKB
	FABe6w6a8GtCIXIpxNAFlMfZQ==
X-Received: by 2002:a05:6122:6092:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5c7ed3a5771mr9396065e0c.3.1788769677540;
        Mon, 07 Sep 2026 01:27:57 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm7623917e0c.5.2026.09.07.01.27.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:27:56 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-745497ac8fcso666735137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:27:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMS11RAn9mhfJBZZz5cLA5j+ypDWCyF7LPWZoLDZv6If28pkrgY+ABE545DIGHiNhIPvkR7+1mbWg4m2g=@vger.kernel.org
X-Received: by 2002:a05:6102:2d03:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-78a4a67cb74mr6809332137.2.1788769675108; Mon, 07 Sep 2026
 01:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh> <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
 <CAPpSM+TXw-BGgpdZtx-bH5GEQvzYHxj_wDkdPfUT3Tcn=mtmEw@mail.gmail.com>
In-Reply-To: <CAPpSM+TXw-BGgpdZtx-bH5GEQvzYHxj_wDkdPfUT3Tcn=mtmEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 10:27:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5Zux92WES0REoejf5FO2h9KgRDCcLbN-A_kyJyRTxCg@mail.gmail.com>
X-Gm-Features: AcwNN1WIo7mZnWwKa-D0voA6hoQPT3vMh6LOKhf3kqZvob9B3oZdbUigh3yaAR0
Message-ID: <CAMuHMdW5Zux92WES0REoejf5FO2h9KgRDCcLbN-A_kyJyRTxCg@mail.gmail.com>
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
To: Xiang Mei <xmei5@asu.edu>
Cc: co <co+5e2bcf11e7027510@bugs.sh>, Vincent Mailhol <mailhol@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, =?UTF-8?Q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>, 
	Oleg Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, cedalion@bugs.sh, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiang,

On Mon, 7 Sept 2026 at 00:19, Xiang Mei <xmei5@asu.edu> wrote:
> On Sat, Sep 5, 2026 at 7:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, 4 Sept 2026 at 23:17, co <co+5e2bcf11e7027510@bugs.sh> wrote:
> > > We found a bug reachable in:
> > >
> > >     path    drivers/net/can/usb/peak_usb
> > >     crash   out-of-bounds in pcan_usb_decode_buf()
> > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > >
> > > Config, environment, the sanitizer report and a C reproducer follow.
> > >
> > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >     If you patch the bug based on our artifacts, a tag would be
> > >     appreciated:
> > >
> > > Reported-by: co+5e2bcf11e7027510@bugs.sh
> > >
> > >     Everything in this mail is validated by the reproducer below.
> > >
> > >     We also hold an LLM-generated root-cause analysis and a candidate
> > >     patch. The patch passes an A/B test: the same reproducer panics t=
he
> > >     unpatched kernel and runs clean on the patched one. Neither has h=
ad
> > >     human review, so both still require validation before you send or
> > >     apply them. Available on:
> > >
> > >         patch.diff  https://bugs.sh/b/5e2bcf11e7027510/patch.diff
> > >         report.md   https://bugs.sh/b/5e2bcf11e7027510/report.md
> > >
> > >     This is an open science project. The code and the full set of PoC=
s
> > >     are not public at this moment, as we intend to disclose our findi=
ngs
> > >     in an ethical way.
> > >
> > >     Happy to test patches. Complaints and suggestions about our work
> > >     are welcome at:
> > >
> > >         cedalion@bugs.sh
> >
> > Please read Documentation/process/submitting-patches.rst, especially
> > https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/process/su=
bmitting-patches.rst#L928
>
> I checked the document and the related files, and I apologize for our
> mistake. This email should not have been sent to you, as our system
> failed to identify the correct maintainers for this submodule.

Thank you!

> We have fixed the issue. Thank you for bringing it to our attention.
> If you meant other issues, please let us know.

There are other issues, like not sending patches inline, so they
cannot be reviewed easily.
Thanks again!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
