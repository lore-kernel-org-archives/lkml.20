Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441584028C4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456899; cv=pass; b=m5yAzJm4lbLm4ktOugMLa7dGksZqICjGvIdhmCn4fFsRxyBl87/V9bgScwQDB9RmHBP7L085ZaYwfh6KZYPBegJAmd/Yt+xgmQ8s9cd2maBAdaReFyb1nmUU2+ZNfUp1+ckR3dB633OjDjQ+a/qIn82QS0oL/AZnhCGZirDk208=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456899; c=relaxed/simple;
	bh=B9D9nkqnvXNFHSQVP2bm3NFHJ383vXnuevpuXGgUI8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI4RWuZzTO8/wBwYpqbM0alk5oNROSaRjkzDO2o+xNpjJS2NdHFF6BzRM5Q6teLwFVSJy9xsnyRLaJscQKzKi1JWJgh70tx4psK8kNZv5FeN0oeQCu3qGhpl2G5G3R2iNa6Y5j75HNe7/cO2xNQ+vWaPLm8Gc960KWWcQKE2zYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YnRtbn3F; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YnRtbn3F"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b38048d0c1so8366b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788456896; cv=none;
        d=google.com; s=arc-20260327;
        b=Sxi5YynATWtv11PsI7l5CUSJfOrcFA6iMluNTRFrhgONXSprxOCjHmBBZtE8f+/b+0
         x+dL1bW2UQF3xIbXh6HFyJVKIWqDIQQWkL6aE7GRfmpSJEdWC1OYBo55I5B4tfHXr7zf
         FL36lK+0ewTKQIkcgAJenDDdZg2+GSxiJH1gK3dk8S0Df4cSBsbPezWqV/BlSzN3CwkI
         ZtYW8lRD+ahrd/UUuYGmqxFZwdKNyFtrIwRrc7++IZfwnLfsbHuiMn4JkiZGcSfSdJz7
         BA8J8CNWZ6d9C1xtvtXAfWpkOg/qC+9iyOxaTN+BLp2GKZTfaF52Xjb9FdBVE+28WJKn
         MRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        fh=WCFeEYCUa92SwZVzudyeVnT3+NtUcQ4NtinwirAaWTo=;
        b=s7M3d3Ov5n7b3Z7WrLUDFKrpqfq3JallsLvBPmyS4QzEoItF7fAhaF8Jgr0uADmh8K
         L3su+2J4EuXbl2N1tk78LjTCIlc/IdTroVsn2MaFu2SRenufv09oUq73aLpE4ptw8OVE
         vwa7uqy1zTafgQ9PGxgaLrnds/oZmxYJfB62mJ9WDefd+MZpa3m54a8HwFKkeTDDaERA
         6g0+EhEZAwIyCTSDY0u0qoeRcp5Cc9Ck9EaYrRNUEItDXLaSAvuXoL3MUEdzWFky/kFP
         UMzfnvFD8TlvdztnFVxxUHM1SENl0Ai+jwS8PavsQodr/R6TlW0xIkWJAtQWqMhBySf3
         sXhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788456896; x=1789061696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        b=YnRtbn3FqkEDew5AzNRRJhmWvAZjKlSR84zzZti7ZEOVCxkhho7DbCyrG3zxAP6kQK
         oysxkt7VjOeVhQuEJ7WHoR92tGH8avHd0sDstvl1qHcf4OWnb1j+Cs8mMBZp/yFVyLYd
         6vTpi6YqyknNqZDORDHTCZ7Y6sdos5OpiboduROiAxZq14Nk3FGcu2jWJMNK7rotU4Gg
         CQYjqphl0iLhHRoExpTwI2rMwzrctYBtrxSdJJdd+HEBfgVL50/aUQBpOg5aHf+fU2eH
         mPUQ6Ja0bjAcBQBzHhorQDyrqdttbxdgs7+qtjNOAoDrgJwbJ/eTrTR6UetggWyMBAQE
         rt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456896; x=1789061696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        b=IAysVX18bRqsEw0OFJB9QagQWpBcutBGJ5Y9IRNSt5YMXY74Z0L+2Cz9o2iX5hBHtK
         6NujRNAztXvYhqiTX/ykWF56NxtIQcgqD6djVsgE7U7PSBIQVjNxsllE5bAjrt4v8wDg
         WvfvHGBodfLQIMI1KEyQoW/JK30Uyr43gOXStIWhSu7nenTWsr+r3D2KCnN2rf4Lre5Y
         n8oB6a0RRxGZG0xfEMzbpTSGABgxAe8Gwf026q5nP9L66/NRoin6hGL1/FPRee8MtJ2l
         p9X5ETFEnOpYNOcKn0bkTbtE/G6VJRLw92A61dXQHaejY2eYrkYLQynxIMag7z7ljgXM
         gdAg==
X-Forwarded-Encrypted: i=1; AKwUvBzhh2Z+ma4siLksg56eAMLTJT/22Zcf/JBxYGXCBQtthSgy9cVCiuHyHwpGuKxd45IbC3635QoNd0JT0ow=@vger.kernel.org
X-Gm-Message-State: AFuF++mgglykSrrY/X5SLDLfOpb9DCU7PMM27c6T5giattCbGM3WG7ZX
	e6vYnpTAcJpPnaU8JhLv4dvfx1jmtSLLcbs95uEmcFVuRCT2M5JhbJyvQxg79gyqeENAZJdbunH
	Omdw1LcHCfVtiopO1N+CWWR4ZDrjvB8GbjI6mHpGouQ==
X-Gm-Gg: AYBFou3ZjIGBwRCX5wDLuz5tcj3GJ2VqiBa9f2HSsPBPkEir/w8youu1zUF44wqs06C
	xWa56fn3LmjrOB2frnlCam3jjTZcr46PfREuaLwiHXffkECuyVS1lvp+wb/yDv0LGT6ARkZ7KD3
	G+ZUM2dKea++rRhBj0neHlGdT2Gb52TLIurY+osZ9vkacu/nvrqPDmiz8brAlAhLCrMZdPE/lAH
	b44dbvLtMgn5XZc1e8u+mLc6kbv8fExw6lhkzgDkaw50d/pv9ICC5C7TX1mj5xiXsGlLIZZrH78
	L3x+JdAso9Pt4rCMLIAID0gnY612iYdMTd+t6OupcofV
X-Received: by 2002:a05:6808:30a6:b0:4b5:8402:958d with SMTP id
 5614622812f47-4b6bfbcfc9amr6567061b6e.5.1788456895883; Thu, 03 Sep 2026
 10:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com>
 <20260902225708.2379840-2-csander@purestorage.com> <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
In-Reply-To: <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 3 Sep 2026 10:34:43 -0700
X-Gm-Features: AcwNN1W9WnICv9pGfNodLq9yLwaSICnIyXjRpvwIb40wmKIKgI6KwpbmnVrMA7k
Message-ID: <CADUfDZqFLMS08wq0bJWQwKpJL5k9ty1bruVFQFcV6juFVB-9AQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Ming Lei <tom.leiming@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:02=E2=80=AFPM Ming Lei <tom.leiming@gmail.com> wro=
te:
>
> On Wed, Sep 2, 2026 at 6:05=E2=80=AFPM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
> > io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
> > __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
> > CQE-size-agnostic, with 3 fewer arguments.
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
> >  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
> >  2 files changed, 35 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.=
h
> > index 331dcbefe72f..67f2ef700c43 100644
> > --- a/include/linux/io_uring/cmd.h
> > +++ b/include/linux/io_uring/cmd.h
> > @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_c=
md *ioucmd,
> >                                   const struct iovec __user *uvec,
> >                                   size_t uvec_segs,
> >                                   int ddir, struct iov_iter *iter,
> >                                   unsigned issue_flags);
> >
> > +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
> > +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);
> > +
> >  /*
> >   * Completes the request, i.e. posts an io_uring CQE and deallocates @=
ioucmd
> >   * and the corresponding io_uring request.
> >   *
> >   * Note: the caller should never hard code @issue_flags and is only al=
lowed
> >   * to pass the mask provided by the core io_uring code.
> >   */
> > -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
> > -                        unsigned issue_flags, bool is_cqe32);
> > +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
> >
> >  void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
> >                             io_req_tw_func_t task_work_cb,
> >                             unsigned flags);
> >
> > @@ -105,12 +107,19 @@ static inline int io_uring_cmd_import_fixed_vec(s=
truct io_uring_cmd *ioucmd,
> >                                                 int ddir, struct iov_it=
er *iter,
> >                                                 unsigned issue_flags)
> >  {
> >         return -EOPNOTSUPP;
> >  }
> > -static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 r=
et,
> > -               u64 ret2, unsigned issue_flags, bool is_cqe32)
> > +static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 =
ret)
> > +{
> > +}
> > +static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s3=
2 ret,
> > +                                         u64 res2)
> > +{
> > +}
> > +static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
> > +                                      unsigned issue_flags)
> >  {
> >  }
> >  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *iouc=
md,
> >                             io_req_tw_func_t task_work_cb, unsigned fla=
gs)
> >  {
> > @@ -171,17 +180,19 @@ static inline void *io_uring_cmd_ctx_handle(struc=
t io_uring_cmd *cmd)
> >  }
> >
> >  static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 =
ret,
> >                                      unsigned issue_flags)
> >  {
> > -       return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
> > +       io_uring_cmd_set_res(ioucmd, ret);
> > +       __io_uring_cmd_done(ioucmd, issue_flags);
> >  }
> >
> >  static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s3=
2 ret,
> >                                        u64 res2, unsigned issue_flags)
> >  {
> > -       return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true=
);
> > +       io_uring_cmd_set_res32(ioucmd, ret, res2);
> > +       __io_uring_cmd_done(ioucmd, issue_flags);
> >  }
> >
> >  int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *=
rq,
> >                             void (*release)(void *), unsigned int index=
,
> >                             unsigned int issue_flags);
> > diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> > index 726a659f38c3..917b32a921e6 100644
> > --- a/io_uring/uring_cmd.c
> > +++ b/io_uring/uring_cmd.c
> > @@ -136,40 +136,43 @@ void __io_uring_cmd_do_in_task(struct io_uring_cm=
d *ioucmd,
> >         req->io_task_work.func =3D task_work_cb;
> >         __io_req_task_work_add(req, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
> >
> > -static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
> > -                                         u64 extra1, u64 extra2)
> > +void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
> >  {
> > -       req->big_cqe.extra1 =3D extra1;
> > -       req->big_cqe.extra2 =3D extra2;
> > +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> > +
> > +       if (ret < 0)
> > +               req_set_fail(req);
> > +       io_req_set_res(req, ret, 0);
> >  }
> > +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res);
> > +
> > +void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res=
2)
> > +{
> > +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> > +
> > +       if (ret < 0)
> > +               req_set_fail(req);
> > +       io_req_set_res32(req, ret, 0, res2, 0);
> > +}
> > +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res32);
>
> Both the two helpers can be inline, can't they?

I also wanted to do that, but req_set_*() are defined in
io_uring/io_uring.h, an io_uring-private header, whereas
include/linux/io_uring/cmd.h is a public header. Perhaps the inline
functions could be moved to include/linux/io_uring_types.h or
include/linux/io_uring.h. If not, I think we'll have to rely on LTO to
inline these calls. I'd be curious to hear Jens's thoughts.

Best,
Caleb
