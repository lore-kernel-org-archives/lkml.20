Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5F3AC0D9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084356; cv=pass; b=G4EtZBbBU+VJlJvtr/Lo7xg8ygjKy+F5Hy7ebM73CenalM8y+yD0hnzRbzKra0qsauMsvhjhpdGbiKvZryRt9Byc4HJC9h8LqF5II9aIe3o6ldc1PhhBdI9LFO1CQBxX8WJfb/mHeUd5UYotO7iR5xvlipl/fSmbSRsCNF7FNVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084356; c=relaxed/simple;
	bh=gxd9FXzpjEE7MvIjrTJWMqmaXboQI1HI9LnM+PCmHvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea0Ll2MCW06XE9Q6OVC98fuMsFjkJiYyT3fjfYXakWIZWTgnCxPv3po+E7RP/rKUlShZlNNa983acnV1uCSgCKvNH84PfOMfXJBTW+Ny2ntUA6WWhPBfWKzxjJjBVUObppKeNCDAWMrOU9kYuuFidQZOpxhBMmc/nVGdmo9cQCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Jds34Im4; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Jds34Im4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8557c3f270eso283849b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789084352; cv=none;
        d=google.com; s=arc-20260327;
        b=Luu3yJstxnwiGtz59wqSttHnneXgwoE9RFX20RKa+rQoo1vrW7sCjYX7bKRKk2j5nE
         Dr+nJmVGp0wgE8XLkXcnndNDOP251JCnG+eqSQr3FJBn7qDNfajPHr+R7ObG2NFE3bbw
         PCBI7KWExAjxRkZOlZ11kmDe+WrqruuhzHJgKWJ4PNv5ec/VJAzoeYYoytZAYwDIbZHO
         oGOhJ5ssEmJdMP5mEBbTMbAaQ4cGbRmIZOBu/gnqEYxvdpCGxpBc5CcX8qEQCDgRqtEH
         xN4/sC9f6UGoLeq/w7/0W6vE4pl/dOK5ttmjWGeYolTDelbWuat7djYdAstI96vby5hA
         5QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        fh=W0SC5Z69bCJ+OUqBwYg9JcX6MDTXcJIkz75f1rdOhD0=;
        b=lHKCCTXz4+WGnaZcjzBbfG7oAlbA6uv6EHXrsiwTihzY5Opqni11ummXVKRQvkUMgz
         MwadbB/MeHg1RCRwnwA0/msXvVLaPGZkOxfCaYav6z9iCnicZ+bJQ04t4UT3iRBB0VqA
         MWR+P0piliLHNxExIKiTP220qm/J6xAvwTxwSxiEJQ/9n/1an6pHa1SQCXa4m9VHtZRb
         JbT+/2J0udG6Yoh+dtvSsM8bdPew/460Evi7wVHE/sGt8Kj/N7G3QWqxoKxm07RHFi0E
         sN6CxXmlfHSnDXL1HdybMHwPL42t7PtLCE/2bH3nqd4o2Zcfb7XY64X3MoCE0Qoxhtro
         C+zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789084352; x=1789689152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        b=Jds34Im4aCwqXPzNBr4bwci5iYEaCR+kK2U7cCVc6cVYN3BFKCex4HvuSopS3st5jp
         rv0u0TpW47eFpm6qug9+elTAy2QJgSTaHjWm7DWQS5/GE76pJ6N4AuiqYiL5OkWupbEH
         5ewTEaQPp9+nvFyjPB6vxRG2AXyFJFFZ0J901OwZjM1fCYkjtpv8pwFZLFgHTOanxesu
         vL1DjRHQTK9KC6szD6/ZVAcWf4wU1cikSBcGAssBjPwnwNJJrGMxvzNT0k7i5i1tEUK0
         jCXofabmHJ3CMZngxuGxgJnUe/rwPKsbIAB+ydNTcX0zVRf10c8QFB42T/yub/LvUMzB
         894A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084352; x=1789689152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        b=j3ilqlto2fCi/6ncl/KFF1DdATf1qb0YMG7QvZ+cn3xtvKQ9jdet5HtTu5ZiMlHmwK
         sReYFHANKZIhlmKdfewKm/Mnqcu2YuMD1QdsgC/nX53is8qOiwUdXNTMkh2wtOCDRuoZ
         Mtg73CXEIikSyR6g4nwqDDiwTmf8RM4Y+qK2Fz1+Y3ayfSHhAkgEn4Xr8Bp0jCJsvH9i
         iSHeDUdacNqp0Baat9JCkkZkezBSZDdzC6lyz9VKP3Fu/zIIxrGbn5JAQy7sBlkd6Ywc
         5DVnmSSTk2qKfMuArofx3CIAy4eE759ntaYe9MmQYMJJ8btgu3+Lh6ZJr57q56mDZthi
         QQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxL9Lvku4/Un24OwkMnbYZHlwnPc1NDaDwznHTsAIApdsbtDISpla/K8GylqtHC9wEkF+9L8rIim64rN40=@vger.kernel.org
X-Gm-Message-State: AFuF++kNb9T6NqcOIavYmi9z7x/dnqYZmCzmRD5XZ0BBkYu5+9P5r776
	w8ztq+g1ls6SWMOhd0mw9fPDBmFqoMUd3lwa9L2Dqjm70emC5CdrqTq4KQSCJiUuayest0PeXtZ
	Pp9vFx8+sLawfVdvV25q3T51p1Ge4Yfwpqw9TB+7vVOpkm01sG3N2BoF4
X-Gm-Gg: AYBFou1DurM7+cCsCMBUBGSiFMo3WSZ2oydRJVZhcV93DbTtmphQNMN8dKm9j73+T9r
	8MeOo16BVenpu7mYve+ZOAlps3hRaPC9/cffVHAOqTi4A1DTRTIB33QNqFLVwXpI5bDiVnaJoBH
	BxKDr8FMBN9M2wAWtM3MafkVLDpERmCa/bSAI/8t6VmY3P9zF+9EmG+LDGROY3bELRmFCqHi6IQ
	0p2MRyroAHKVyU5ZhrMXXaAW9P9cT1PHU3PE059YHxYN4qDzulleesJN21mRXKPxAh7WO7sdmMz
	FmUfNop9khFEkkIkntjPoma4hfsizjzuQL71/nhVOeMkIMAkW1p+lFMRuSv0EJS7bC6FdVuIXGJ
	nC8QxTSNUD9p05dyUPPBTOQ==
X-Received: by 2002:a05:6a00:aa07:b0:85f:b00b:8760 with SMTP id
 d2e1a72fcca58-86b30f13aecmr2172804b3a.5.1789084351986; Thu, 10 Sep 2026
 16:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu> <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
In-Reply-To: <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Thu, 10 Sep 2026 16:52:20 -0700
X-Gm-Features: AcwNN1Wt4X8PS2HRrjI9CWe-1228S10-2EjcXULM81Hw8G_R71GCSrBJ2wPt8_A
Message-ID: <CAPpSM+Qd=yEc=NsuK_fE12KHH+qnYvvHLFUs6fvcw0SsfP8tcQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:22=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> > runs out of pages.  Over io-uring the amount copied is not bounded by t=
he
> > payload buffer the server registered, so an unprivileged user can drain
> > the iterator and panic the host - mount a FUSE filesystem with small
> > payload buffers, then setxattr() a larger value:
> >
> >   kernel BUG at fs/fuse/dev.c:1064!
> >   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >   CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
> >   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
> >   Call Trace:
> >    <TASK>
> >    fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
> >    fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
> >    fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c=
:1057)
> >    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
> >    tctx_task_work_run (io_uring/tw.c:96)
> >    tctx_task_work (io_uring/tw.c:133)
> >    task_work_run (kernel/task_work.c:233)
> >    io_run_task_work (io_uring/tw.h:84)
> >    io_cqring_wait (io_uring/wait.c:278)
> >    __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
> >    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
> >    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >    </TASK>
> >
> > The reply path can drain it the same way, via the server-supplied
> > payload_sz in fuse_uring_copy_from_ring().
> >
> > An exhausted iterator is recoverable, so return -EIO.  All three
>
> super nit: imo, the reason for returning -EIO is unrelated to an
> iterator being recoverable.

You are right.  Also added the comment you suggested on the -EIO mapping.
Both Reviewed-by tags are kept in v8:

https://lore.kernel.org/fuse-devel/20260910235110.3922068-1-xmei5@asu.edu/T=
/#t

Thanks for the reviews, and for steering this to a much simpler fix.
Xiang

>
> > fuse_copy_fill() callers already propagate the error.
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Cc: stable@vger.kernel.org
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Suggested-by: Joanne Koong <joannelkoong@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
>
> Thanks for your patience with iterating on this fix!
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> Thanks,
> Joanne
>
> > ---
> >  fs/fuse/dev.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 4fec31fc0b84..4148e4488d77 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -1061,7 +1061,8 @@ static int fuse_copy_fill(struct fuse_copy_state =
*cs)
> >                 err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE,=
 1, &off);
> >                 if (err < 0)
> >                         return err;
> > -               BUG_ON(!err);
> > +               if (!err)
> > +                       return -EIO;
> >                 cs->len =3D err;
> >                 cs->offset =3D off;
> >                 cs->pg =3D page;
> > --
> > 2.43.0
> >
