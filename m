Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A364DD3D1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618032; cv=pass; b=nUl4w6xLX9wt60GNZFTyiJwwGMwGonAV2Lrpc5MOZHDNz3bE8/5z+ai0whw74p54YrQV5n59Udkronwk2UIniwxANysg9Z/vnM94W3U+LN4gy9sL/gvDwtvG2TSViC4YHMuJ2m2lt/qF8Cs4shYEARfVINyAF07Be/tZGCu2b0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618032; c=relaxed/simple;
	bh=2kNG+wBoo1LXnVxUU7YpNWdNJd2rymZ+d19jEj0AZXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+n7TAx0ZFTjtTOR4f59A3OndQ/rfmftUEGp5nNiqeH1/ctHwTobIxOlEDuiQQewIiG6gIsC4hE36XeaW9XUAMvp5oihQ6WQkNtf/nK5lqVBtSmWcvssYuWrWy9uKhl9gsHUt1g2f/N36xEg3vTzO9kye4kmBJ+IMqZrhcqq9L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FEsBMcKI; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FEsBMcKI"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-804db2d0287so339394a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618029; cv=none;
        d=google.com; s=arc-20260327;
        b=bkVJnQN8yspWZVVmlVnQTFtKRd+mL34EH8qekwyeczBVcbKtmFUghL/bgJjtbTaXAq
         tTjcHs8BurDV3pYVXBUJ13gyLXxDkHklV0ND9SyF/jJ5I5Ye+W+3YkMgDc8UzZAPZ00X
         3+YDgfSfstohtC8U8XBqvB8sfljMZXYx7PjnTnD6tP9TxfQ5EDWmDUCrLzNKPEFoquc3
         vxl0vRzM5wuG+/xWrLqaM79ya9ql5YmVtpk57WWaFZpPuo/WN/1AWDrjmZ2APy792MVC
         ee3IyRrtJAGgA6i0vYombA3h8+K4kHR2uSo2+7tkvziiOpWNfL64vngiaQdxriKrSEOo
         Jxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        fh=dPTlHlzcRYqiLa4idyNLeIjnbb8Ee2fUpqOQqeVzd/E=;
        b=SdsBkeJ1zJCADhGcLf8xJxiwbaNb+tRnNqUauTda2k2Bq4Ay8eZS7TsImEEAefn2wN
         zU+w3vhzcaDKaVkzABICKV/N4NpZl5ooZvAi5g8qFjkpz3pevVcmob2GX7lNOSpTbcqR
         Hcgw6HPeeIrpzRPadDSqGu33MG1CPD95UGK1igjzDhtSNX/n+6bXomOeqlOB7xAlk2PG
         wzYqyp05+M9THH6uMrH5yokmzxbX+upqhHVTu8SeOJt1JBregxGNKmsfswI99isO7ivc
         WsqVIojBO1hrWKB7vC3TVkAu3pbNO3LIm+3ijzqdKgYW8uEKR7q+Wmq+yjrrUGjYpzuP
         QR3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790618029; x=1791222829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        b=FEsBMcKIGfj95sMSo6NPiSGSxjKIY5b2uRvmr2NI0GfUEhege9pHgCandUX1/CE4pQ
         vSeyFstbxNFx3M0wcrOBxGLkDkyY4VjT+2XoVhZODsBtHSPO6yJ9SwO4Vhoz5SZkQgjf
         pMLIbVZf3VjQCsSFzR3okAw2ct6ooi7/rPQ0UDDptK++0lcC8MrnUaGUBfeZBUze6r6/
         SRybZgyNdeHEL/GlqKoO3tZtzgHqcN3gv5OwAWBGENEK5fOblbv+TwAoDI0/w4/ykW/d
         eQ9+EgYzDyZloSMfX5AEIPk3Y3g4MmS/JKbic363fh1xfVCShfZJumyUr+fz0TT7/i0G
         ZMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618029; x=1791222829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxorRVrnA629ZxhkkzbuPJrftY5VCgA7nPzvnQoi4i8=;
        b=enaEzcR07lOawGccZ5lvaRrmyldUDF0SRmkEXZy0sa+/llbuhquqtV1Ni68rpoN9oI
         LFWF3kxMjag2cia7EQTuX7MEjK9JYhL34HqVFiK2FtF/HAR6ozadi3HQ2kVBfn8kZJNL
         Cxl8lfWsIdNmLsa5lbaXM2lzBgYtTGzmQlD02t5vkTsXfSeRDmrzNDfHCAs6q5g+Amjz
         /6CzVwy3pVMxE70ruzkZSCRRF2iB5TNS6/rS898DjCxu7foHoif7e9Mf4ZRSivse/ZBB
         T8OB+Uxs0Ozgopo8XLQPzylN++76ChnY3g9ak+NP9VkJTVQ3/BoQt8cV35c4ur9LAn5H
         8ccg==
X-Forwarded-Encrypted: i=1; AKwUvBxtHEkOFcJgFTdqdgQ7R9gDGceMne5kyeafBDa1QvkxWs19I0Si+AAJzmuLnTgiApKApUNnrwpcTC0Pwkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0J1LYMUK25/5MKiEvw30eNAlaOZV8+uEpNoAiqTJlrtgIIgex
	VUuHh8gJpx9vbpBEjgrJkSNb+NfTUNnah5iU6NsgwWoSh55ccNh1Ck6uQq0xZqyvuLJxTjkoi99
	guQKGrsQe+Fi9cnBsWS1BXIuTwUO9/9brcnT2ei0Rpw==
X-Gm-Gg: AYBFou27aICrFtCH3V0/7UhobrP+J9baphgC1DUNSzhytpHgy/srf7oZCCDDZREvcrW
	YUeFoNw5KX+saCxEzy1bnmsIqg+cnipK9FmjpuopP9zVhzkx5OxobU9wLFFZZYO4sBNdLtGKbmu
	e2mhMWVOOFXrmyzFB2lh6ZxlckaFwETLfEba1Q9BKTdsQXBiQXFgTC59O4pSCgQ/N7lz8B8mDgy
	Q76awJbBsfbAC84YLDWWvEqHmDnddR/scOaPP4NuOK5BrdzPG06ZkjNyWrbfgeG0hn2WkcI0fWt
	TKBdbKH1DJdvYnzkntqiBEYARz6AbBhh4Ny/Gpx/y78oAGS8PRdgvwU8FWP7y4+6Oc8=
X-Received: by 2002:a05:6870:f10e:b0:447:4cf0:eb19 with SMTP id
 586e51a60fabf-4930bb82a4amr15095600fac.4.1790618029099; Mon, 28 Sep 2026
 10:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com> <20260928-b4-ublk-cancel-stop-v1-3-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-3-4a4360232a46@toxicpanda.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 28 Sep 2026 10:53:38 -0700
X-Gm-Features: AclHuK9nxEm2zBDwrnuiv4JMUs_01csR-Wh_9mfwxHD7EKXDa_-x71ypJIIn4T0
Message-ID: <CADUfDZqDZEM4=uw+By6RnxvLqXbc-iPf8RCUQtQB5_Z_Di84Aw@mail.gmail.com>
Subject: Re: [PATCH 3/9] ublk: publish io->cmd under io->lock in the commit paths
To: Josef Bacik <josef@toxicpanda.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:03=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> io->cmd shares its storage with io->req. FETCH, COMMIT_AND_FETCH and
> NEED_GET_DATA switch the io from one to the other in
> ublk_fill_io_cmd() without a lock of their own. That was fine as long
> as everything else looking at io->cmd ran under the uring_lock of the
> same ring, which is the case for the io_uring cancel callback.
>
> ublk_cancel_cmd() is also called from the control path, from
> ublk_cancel_dev() with IO_URING_F_UNLOCKED, and the next patches add
> more such callers which run while the server still commits requests.
> Nothing orders their reads of io->flags and io->cmd against
> ublk_fill_io_cmd() then. A reader can find UBLK_IO_FLAG_ACTIVE set and
> still pick up the request pointer from the union.
>
> The batch commit path calls ublk_fill_io_cmd() under io->lock already.
> Do the same in the other three callers, so that io->lock covers every
> switch of the union to a command. io->lock is per io and only taken by
> the task which commits that io, so the fast path gains an uncontended
> lock in a cacheline it writes anyway.
>
> ublk_batch_prep_io() calls __ublk_fetch() with io->lock held, which
> makes the order io->lock, then ubq->cancel_lock.
>
> The readers move under io->lock in the next patch.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  drivers/block/ublk_drv.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 50c99b28ef21..17a33539f271 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -3169,6 +3169,9 @@ ublk_fill_io_cmd(struct ublk_io *io, struct io_urin=
g_cmd *cmd)
>  {
>         struct request *req =3D io->req;
>
> +       /* io->cmd shares its storage with io->req, switch them under io-=
>lock */
> +       lockdep_assert_held(&io->lock);
> +
>         io->cmd =3D cmd;
>         io->flags |=3D UBLK_IO_FLAG_ACTIVE;
>         /* now this cmd slot is owned by ublk driver */
> @@ -3338,8 +3341,11 @@ static int ublk_fetch(struct io_uring_cmd *cmd, st=
ruct ublk_device *ub,
>          */
>         mutex_lock(&ub->mutex);
>         ret =3D ublk_validate_io_buf(ub, cmd, &auto_buf);
> -       if (!ret)
> +       if (!ret) {
> +               ublk_io_lock(io);
>                 ret =3D __ublk_fetch(cmd, ub, io, q_id);
> +               ublk_io_unlock(io);
> +       }
>         if (!ret) {
>                 ublk_apply_io_buf(ub, io, cmd, buf_addr, &auto_buf, NULL)=
;
>                 ublk_mark_io_ready(ub, q_id);
> @@ -3496,7 +3502,9 @@ static int ublk_ch_uring_cmd_local(struct io_uring_=
cmd *cmd,
>                 if (ret)
>                         goto out;
>                 io->res =3D result;
> +               ublk_io_lock(io);
>                 req =3D ublk_fill_io_cmd(io, cmd);
> +               ublk_io_unlock(io);

Taking a spinlock for every ublk I/O completion will be very
expensive. Is it not possible all paths calling ublk_cancel_dev() to
wait for all tags to go idle?

Best,
Caleb

>                 ublk_apply_io_buf(ub, io, cmd, addr, &auto_buf, &buf_idx)=
;
>                 if (buf_idx !=3D UBLK_INVALID_BUF_IDX)
>                         io_buffer_unregister(cmd, buf_idx, issue_flags);
> @@ -3514,7 +3522,9 @@ static int ublk_ch_uring_cmd_local(struct io_uring_=
cmd *cmd,
>                  * uring_cmd active first and prepare for handling new re=
queued
>                  * request
>                  */
> +               ublk_io_lock(io);
>                 req =3D ublk_fill_io_cmd(io, cmd);
> +               ublk_io_unlock(io);
>                 io->buf.addr =3D addr;
>                 if (likely(ublk_get_data(ubq, io, req))) {
>                         __ublk_prep_compl_io_cmd(io, req);
>
> --
> 2.55.0
>
