Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6F37B012
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060956; cv=pass; b=Qj4GqfN1BEXHxZdjmYuM6v8JQE+7LOajWhIQCuGZA6Y+LlFpAoKhtPVO3jNzPnYHuihGZ7FwtoEQrru7FoPZaEY53YfxYbkjJEfE1m6l82HOBLTmDLBZvtOCj0hz+jkwNGUAuo3pp+ACZamtc9z8z2KAEN39XC+1nDFIfsCuiWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060956; c=relaxed/simple;
	bh=IFR4nKdEOKKYPNJProJ/LoqY8uLWMn1OZMkBxks7z6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjGwUR2zHUxtNKLb5w2EcJDRHDyHFFIbutNO3c2vAzZbtgYgn/Vj6B9IvSJy//11PGlwOALZJtRrcWxbJkuoSDeCuC2mkrgb7nqWLXIN9x2Zi6c82TUkKygzCnqLvjMn+btxygOi6uMX/BOdIH/TpOQxtxDuZqISWVYZCFOK5AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz1rGn7Q; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz1rGn7Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso817995e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789060948; cv=none;
        d=google.com; s=arc-20260327;
        b=GEbZ9zpnhrBS1LDJE4Rfqd2mKVZcFpBOpYYIVhjPsPCCtbxiSABx0uqKrOjlBMaKbe
         guxsj7OKsFQ8YHPj2QNsJrQYV6Onr/to3vYtK82DMWUZNMthJR1S7OF4a+HPhsAYi9yW
         JYAfM+5ZF3A+OMr/J4WID/cllWriFNYhJHnlnXo9er+ct64xDdJyNl6bh2mSyuMNLD6V
         OVYVETGLn+V9LmwV1IA78dla8He+URSKQ/pBjvbl7gSoAYo/Tl3/VA+MyiCHl/zUa249
         O4kpl6LER/tMk46m55HRFkGyzNPqsUBjCqw3eYnVAIQUTZb+zspmefTz5F4cYyxniVHe
         KSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        fh=f5vvuOp16ftQJCJcitV7Vn+1XwLlbDxbtfTGla0ZbTE=;
        b=a5wBlFoYJ6cxBbZA/6jFPEHqnOdrcYBXl4ItUJxYkwo8W9fIHeFyu2amgrR105/T1b
         D1oKKLEfeZGINIYhBD3PN20w+1i5UoCU7vMf4vIkXuowjesXeW3c9jsAGvTJKxkuM1ao
         iilcn0yvVVLqpco9Secy6cFfxOCoQpUDbZZGpjoG6n8Hdx965In3yqgcukQbkbWU7xq3
         Wl9MfEIgXJXyzHN7+NqzQOWJ0he5OOC5G01bObjRI7CXTKDuKbCnrMq0O17BlicSeOKD
         Nk02mCDisSuSb5SHvI6SmG2XTAl2Q5QRZ9A3Y/09KkGIWbEq3A0xGTwVBqKpEG2/+ARo
         G6hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060948; x=1789665748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        b=gz1rGn7QAKE9OEvSMgCuo7Os9QeOAqpxNj6m6AAvr1kLlolE3N/AGiA8Al9aR+nw1L
         s5bD8yrLrlElG4HI+KBRpTsV6DPRlyOvymL2SOROCbRUf1cpjcrZWS3pwtMmLpWAB6Gz
         YP0NPNbzGzdK4DBMUbQc+k7ng+NJT0e5mxWjkQaOr6E4dGrW43mc2QRHTQlAmSE9l1gV
         4FliB+EDN0PYHPkS/BU6MJEiISeZQir7Qzbz1XsR4npgHTZ7Unvp/XhiBoagTNxJ7V5M
         RbaecXs+3i6ZgPu1Fd41m1QqWAklbNU+M8iC1vD5r5JCm9wTmm+bGpw3aLK31pVdwgHP
         QOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060948; x=1789665748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        b=r9ecwFiQ2ACRSdnXNaUlQdT7U44q5pfv5itbWmst/94Fe6mlWXOXCzFv8JLKcHrChp
         /QkvBhhJqdB0DJw2bFMfBxrvwSIlrVbr2VOA208b/ijcBLkBX79SjU3hZ6n53Sd152vl
         8EsCOZIgeb4gJPngLKpjcFk94PKJMAiYbtV8ADNkpwEJRisWzElCdcPFzBlBmXOiWvrH
         FAUdSyR2bLTChVBJyS4snWBp6paruK1lAneuVqCN8l0ckRPHoC9lG0dbStbbSHlle5Nx
         pI4hc7SGC4UeQJQwJ26ufkWgZLJ/RNQ/bYK65S8ahAbEnKVRjzU4H9HXiE0SA/zRfqDD
         rWZw==
X-Forwarded-Encrypted: i=1; AKwUvByyxZvTX2IQNTNCtRSzkXzGQ5nwldTa3N0jQY7iIugsw3nKk4I1Sa2QeHj242EvsrrPtUh5XGLQYZ6R7iU=@vger.kernel.org
X-Gm-Message-State: AFuF++kgV73gy+nS14KnxVgfmXcDD89UVcpsP6jlnQL4sDQdT3EjJPNv
	8LEJaf2luiYLyCjcLRnQTRjpmSWYN3P9vWi2rtOs5LmTSFAo46oaV4onqxemFQLqQINidNdUEcX
	FV5SjrvW/a781+rWiGlpsSiGAWUbyn2o=
X-Gm-Gg: AYBFou1aOlD9gaO5ZwCeZ4QmZ+5nsi86xqmJNZfiiphbTvNv7l5V8SROLbQrCBrbtql
	01J7sqKY1iSGql/J2zVSiHfsLgk+FTR8+b/Kq8uzLzL4GaRGUn+MPEcWGRAM7pZz8MwQWSfEyLo
	FHzq8PCpZEomlWBzV8LCnjATtrwO8jpZTVv2rHRbNPwh50cJo/XGSMFu2Ow/bcTL/dnhXbEwkXd
	asNzZ0sLol5jsAeAp7ZEQIncP1UM+mI3jXHSCiFnwNosAB3wY91Jyz1dhOLwdLQX6RAD1AiWocR
	K2N1ktmy1+PgEZLQ1RJeBvelpEOLLJd+8POTUSSVDRLm6dzBjBqS+GV/jIgCQkjyRHkxWDAjrbJ
	i8Z7oxJXvy353wmzELNGfWh7i2p8eElyeIJjSyA==
X-Received: by 2002:a05:600d:8646:20b0:49d:1fd8:b874 with SMTP id
 5b1f17b1804b1-49e619c079cmr485295e9.19.1789060947517; Thu, 10 Sep 2026
 10:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu>
In-Reply-To: <20260910022442.3594649-1-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 10 Sep 2026 10:22:14 -0700
X-Gm-Features: AcwNN1ViYMaLgvTSlyD77nmlLTiqiJ9NADONiy9rDk9d6ocZ1sATbKbnTXWESp0
Message-ID: <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> runs out of pages.  Over io-uring the amount copied is not bounded by the
> payload buffer the server registered, so an unprivileged user can drain
> the iterator and panic the host - mount a FUSE filesystem with small
> payload buffers, then setxattr() a larger value:
>
>   kernel BUG at fs/fuse/dev.c:1064!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
>   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
>   Call Trace:
>    <TASK>
>    fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
>    fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
>    fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c:1=
057)
>    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
>    tctx_task_work_run (io_uring/tw.c:96)
>    tctx_task_work (io_uring/tw.c:133)
>    task_work_run (kernel/task_work.c:233)
>    io_run_task_work (io_uring/tw.h:84)
>    io_cqring_wait (io_uring/wait.c:278)
>    __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>
> The reply path can drain it the same way, via the server-supplied
> payload_sz in fuse_uring_copy_from_ring().
>
> An exhausted iterator is recoverable, so return -EIO.  All three

super nit: imo, the reason for returning -EIO is unrelated to an
iterator being recoverable.

> fuse_copy_fill() callers already propagate the error.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Suggested-by: Joanne Koong <joannelkoong@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Thanks for your patience with iterating on this fix!

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne

> ---
>  fs/fuse/dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 4fec31fc0b84..4148e4488d77 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1061,7 +1061,8 @@ static int fuse_copy_fill(struct fuse_copy_state *c=
s)
>                 err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1=
, &off);
>                 if (err < 0)
>                         return err;
> -               BUG_ON(!err);
> +               if (!err)
> +                       return -EIO;
>                 cs->len =3D err;
>                 cs->offset =3D off;
>                 cs->pg =3D page;
> --
> 2.43.0
>
