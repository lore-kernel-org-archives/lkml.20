Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2012CDA5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787990473; cv=pass; b=cWrqf6QU0Fa88ETmZEP7ISItC4HN4rLlFwAMUQ4WwPICRPI0cFD1wPoW2Vu+824yjJV6Pg6G6qyx9sHC/8bCsTBuwu+Fj/L+kIKUyt7oIomckMJvXXgvpSQI6GYRMVWj773HLfiWWxDW7d4F13oslWX9GXA+jpnQQY3bIQti0OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787990473; c=relaxed/simple;
	bh=+Un1PSVEzwZuwQSbqCGgZMHBrz6DkTdsTrSollEb4Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=n0Hp7LkctQgkkkfFqIkSn4VesOtgsinEe4kAckuLaxSszggvwc4WX03fwlwJcTRfbod+l3zanX/Wiga4QN3v99Y22HMgVzV8DVHigSonCQpsIwCAMZwLcFOIFDZ3OR9vgh+HK28DBSPo/R7StscLm63MGgtn6excGwAkWwwFG78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGGC2QTa; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGGC2QTa"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2529b3139fso218521866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787990469; cv=none;
        d=google.com; s=arc-20260327;
        b=W0/svTczkZNXlAbe2GVgkNagPwH2pZ/fXUGMgJlhBNqRQdJ6/tD+b+Md77mCG5cb1B
         OyJC7BLk3xxy/6qPNhM3BjP27pdcLI0ADeLtys7/1rxfK9jljlLa/TMDDFnTAND7i5WZ
         5FyubPs4rtSgKGU7N5hUW2WaAVUp5RgCRnYQBRfOY+c3E2QVtMVMTs9hmTmOQZsXRSCe
         NadUR7wIKIdZfqkJkMpjZ+t6ejxMPbTAPj+Pr2LlZC534n4wYBWxnma4AsxXcEzzgD55
         PBS41KWIwVVJncHoqEoWu1YSY6GSbR7TcwzEsRlBXgoe8vvH3gEPAUEwdw/ArvTEzDan
         75JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZMNZaHrbX3x9irvR775Qz9JOHzz1sztAPdfs/Qd+Ng=;
        fh=Q9LkdGR6c2N6GiyijOx3xaN2rf/m0c1GsptzdYo5u/w=;
        b=UdYA89ADa87VODh72BLKWZ0imFaG28cprYVYvz8JMUfq/yQE7g7B/T3OxPlunqXoSD
         sL9q/Gd78GWblco94DWvPGcfWCdN0lmw7oOfEbkqsFgUtiTS8aLTC6eFVq6OCuxizury
         ws3x/gzLtaBazmbaxQFxFMoFknRZqdc8dVFJDw/xwGQWx4+HJG7Tz+0+EPzGAVpxWegY
         rz7gx1+JXDasGRE39K7+JfCSb8MsnHhZAGm1uqpElUqmfdWk1OoS+xzxX5QbksAhdgWD
         +8YISxTOqkf+WsEcrqk0olNp51ZpHRxqKinkL1NZ2nw9eBmKhy2U022qi0CN9olOh1jY
         xx4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787990469; x=1788595269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZMNZaHrbX3x9irvR775Qz9JOHzz1sztAPdfs/Qd+Ng=;
        b=eGGC2QTa9DAJBxg8RMjupHYuab+QbnqqH3+xZCey3OtrgjuDAxNcbtrZBmiRmhe7Bb
         B9PbbnQRvl1ZoZXQNG75Hl2C+rZm7vtkOcz8EEKBTMe7LgsvfjXOXmB4AnWBpb4OAG7P
         VdQddQKEMmOUFdDY6zCqZWaBYNRKcuI/ATCUMhPavGMeO2DHGzILs1Pac7ZMEmceMWgD
         tokLcFeihX8xMdUXeCdRxOQnPBQ8b6f4RV77sNPyvEdPxtqsjL+Kv07Kf3sJAPYNs+j0
         noVDNWvV0RfNaUiCIrH7XeL/3nAMUNKEV8dX3KnKeFFQ1ggjPn975HEaQs2wKDp+7q8+
         24ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787990469; x=1788595269;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZMNZaHrbX3x9irvR775Qz9JOHzz1sztAPdfs/Qd+Ng=;
        b=o0cshINJfc7YkHcFpKRmEznyh2eVwaz6il5pGj9nP2RT8nIWOp+DiaAFApUYeHGqps
         PYOCk6nMhZvI5EjmcZNzYKL3sdl0IrnxK0layvg3RqiD4bkUttgmsXH2rGbXv1oBlObQ
         oUm+R/fgXoRdf69GhaP5/N/zYWmdtZ5Uz9+EP6ZCq30Dw9Ja/fL3AmUDwCyK+zVAIL6Z
         H3ssyBdEVwJlvIcZWW+jXGf8/LVnmyl34TliFRWr4gJBg6TU1tIN6Ihx2WznZgPFv1sk
         7cmpk9cvnmFpk1giPRtG7uffAJfBxXknk0d0fIYqjdByy2HeQfkkfEn5M7q3PQnycyc8
         tVUw==
X-Forwarded-Encrypted: i=1; AHgh+RrbIKyhAz9e5Lyj2xq0o2ACgbaamMyEBBsFWJNy4nwNcwaBVeAO9IVDIxHN2hem3n0Zrma8s/O3eb9/AHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lscBmr5lUvAtVywrxy7jRhNDhqdkNNlyisY6l6qkDBnpgdBy2C
	QrjUIJfhze/gQKkvPnWIP9ZhBhO96RUyflyyqlAa3M3OTfKCwPDH1YsscFK1yhW7B4XVllE+aR7
	mst4r6X8wPgbiesqj9i1nE6bS3/d12nA=
X-Gm-Gg: AR+sD125zI/4misF/7AkhvlMwEXDziil+Z/oSFRM/5gyoZ/zMLH01XHdSE0HrDttcNd
	MQGNVOSYW/IDU+EDiDiEpg8FS0fo+b+W+EdbJgybJi6L5X6N/p9gOzxLmAbnz3D9rMb2d1zz11Q
	ijNXKZ2suq/bEzw3PhOdedLATsPQMVyTIsTXUC8c/UuWcoWOJaHh07mBU20/cd5t1m3ikUP9JNa
	6D+kJVF3bvMm3D+K8dfFxZqsh0v7XOOR3wxT5Thg70ix0dYTCY4i1UwnHbtKT6WchKOfQX11b7q
	TL2vWU5kzRNGxV+h2g/aySoLxXVT3lVRb1Qq0qlecDJl3oT7PGN3z6b+hY8+VZhuj+WZC/mrQB0
	ikg==
X-Received: by 2002:a17:907:1b07:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2556fe4518mr874417366b.8.1787990469180; Sat, 29 Aug 2026
 01:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <sQDn678D0YppKseC8dIUC0I6uKmzsrOVtoN1@bugs.sh> <apHnwT7aG3Uy4oyC@end>
In-Reply-To: <apHnwT7aG3Uy4oyC@end>
From: Weiming Shi <bestswngs@gmail.com>
Date: Sat, 29 Aug 2026 16:00:32 +0800
X-Gm-Features: AcwNN1WmAxc4O22sjcfQsqpD_4tKHE6t7UnxjBL2Ack78Xz0ssJ7Og5QTr4Zuh8
Message-ID: <CANgPUi0MxMtnx2JcWJtrTB+EwLbYExX9Lmp569Y+F=nkXMgY6w@mail.gmail.com>
Subject: Re: [BUG] drivers/tty: NULL pointer dereference in paste_selection()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, co <co+e5693071d903b832@bugs.sh>, 
	speakup@linux-speakup.org, William Hubbs <w.d.hubbs@gmail.com>, 
	Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Petr Mladek <pmladek@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Oleg Nesterov <oleg@redhat.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Song Liu <song@kernel.org>, 
	Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Samuel Thibault <samuel.thibault@ens-lyon.org> =E4=BA=8E2026=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=85=AD 03:55=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> Thanks for the notice, this is indeed a small timing window between
> switching VT and pasting text. In practice only root can trigger this,
> so this is not a security issue, but I will add a NULL check to avoid
> it.
>
> With regards,
> Samuel
>


Hello Samuel,

Thanks for looking into this.

One correction: this is triggerable without root. I reproduced it on
Debian 13.6 with espeakup enabled, from a tty1 session with:

  uid=3D1000(tester) gid=3D1000(tester)
  CapEff: 0000000000000000

The process called VT_ACTIVATE on its controlling tty, which is allowed
without CAP_SYS_TTY_CONFIG. Switching to VT8, which had no getty in this
setup, left vc->port.tty NULL. Pressing the Speakup paste key then
reliably triggered the NULL dereference in paste_selection(); no race
was needed.

The Speakup setup was an administrative system configuration step, but
the triggering console user was unprivileged. Whether console access is
considered a security boundary is a separate question.

I look forward to your patch and would be happy to test it.

Best regards,
Weiming Shi

> co, le jeu. 27 ao=C3=BBt 2026 12:42:57 +0000, a ecrit:
> > We found a bug reachable in:
> >
> >     path    drivers/tty/vt/selection.c` (fault site), `drivers/accessib=
ility/speakup/main.c` + `drivers/accessibility/speakup
> >     crash   NULL pointer dereference in paste_selection()
> >     commit  f5098b6bae76 ("Linux 7.2-rc5")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you patch the bug based on our artifacts, a tag would be
> >     appreciated:
> >
> > Reported-by: co+e5693071d903b832@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an LLM-generated root-cause analysis and a candidate
> >     patch. The patch passes an A/B test: the same reproducer panics the
> >     unpatched kernel and runs clean on the patched one. Neither has had
> >     human review, so both still require validation before you send or
> >     apply them. Available on:
> >
> >         patch.diff  https://bugs.sh/b/e5693071d903b832/patch.diff
> >         report.md   https://bugs.sh/b/e5693071d903b832/report.md
> >
> >     This is an open science project. The code and the full set of PoCs
> >     are not public at this moment, as we intend to disclose our finding=
s
> >     in an ethical way.
> >
> >     Happy to test patches. Complaints and suggestions about our work
> >     are welcome at:
> >
> >         cedalion@bugs.sh
> >
> > =3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     Reproduced on  f5098b6bae76 ("Linux 7.2-rc5")
> >     VM setup       https://bugs.sh/b/e5693071d903b832/run.sh
> >     config         https://bugs.sh/b/e5693071d903b832/config.gz
> >     poc            https://bugs.sh/b/e5693071d903b832/repro.c
> >
> > =3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000044: 0000 [#1] SMP KASAN NOPTI
> > KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
> > CPU: 1 UID: 0 PID: 49 Comm: kworker/1:1 Not tainted 7.2.0-rc5 #10 PREEM=
PTLAZY
> > Workqueue: events __speakup_paste_selection
> > RIP: 0010:paste_selection (drivers/tty/vt/selection.c:393)
> > Call Trace:
> > __speakup_paste_selection (drivers/accessibility/speakup/selection.c:11=
2)
> > process_one_work (kernel/workqueue.c:3322)
> > worker_thread (kernel/workqueue.c:3405 kernel/workqueue.c:3486)
> > kthread (kernel/kthread.c:436)
> > ret_from_fork (arch/x86/kernel/process.c:158)
> > ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> > Kernel panic - not syncing: Fatal exception
> >
> >
> > ---
> > The report format is based on syzbot bug report.
> >
> > This report is generated by a bot. It may contain errors.
> > See https://github.com/n132/cedalion for more information.
> >
> > For any issue with this report, reach out to cedalion@bugs.sh
> >
> > If the report is already addressed, let us know by replying with:
> > #co fix: <commit hash>
> >
> > If the report is a duplicate of another one, reply with:
> > #co dup: <lore link>
> >
> > If you want to undo deduplication, reply with:
> > #co undup
> >
> >
>
> --
> Samuel
> <c> hiri, le cri ici, c des marrants
> <c> j'ai un rep ".uglyhackdirectorywithoutacls" ds mon home
>  -+- #ens-mim en stage -+-
>
