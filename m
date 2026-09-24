Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE73DD508
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219484; cv=pass; b=Htp8Gule/9UFYI6gjoN0qY5naOAKJPm0nUBxZcBiDwlonbAZGpCnxVtBC8cYN+70lfMJBlECoesJb9/ZX28uL0MIjwQeioyj67lJ1RZ4t57JW17cEBZb7KH7Yn82D5myczv/ejRVTfVQbjlkMmt0fHLWXUdn+LYJ8ZwrvrX6QE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219484; c=relaxed/simple;
	bh=2j1C56GM8BFyvZlQYTWpHHylUYR90lKGt/E8S17eoYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfjcASm0gLxTUIuU4ShKXCzXdbZnL4KVJdGYm3MsrOpG/b4jj3Fo/eFyg+ffoZun4Jvs9xb2dxki12/jG8AsBz+Wty2fN5PUMmDt+4ccLu7YPN7j/2vT7+e1T9E/ZIGhk2qH6s7VfJdxaqz0EVJ6yyyUbY+ojPRSmkub79PN+T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfXqSMba; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfXqSMba"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c2613d8157so893830eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790219481; cv=none;
        d=google.com; s=arc-20260327;
        b=J3t7kuhjTdVixPyoxivvBUAtVKklzTnJzDHZCaWRYtn4xxI7+msDOR3Lfpbeado5CZ
         Uct4qfPghRUltbGv7zyUKyG3fHnQWeiluTtFVAc+IObO1dzthS3CvtetmIsVct6A2GSC
         mix7JjN1VgDe8jM98gbZx2J/OkYludSFBJp3VcSIcTzzuyOtX+GZAJg/0frSBT5RrUrH
         dILuZ5dYbo5xA7nUzry3qvpxUMlWzzNFfgAXFj1VbbF0BcIz7sgeKNwyf1NaxkLuymG3
         FGRd2d/AUHXNPJSck0HynILRsSTbO3ZIoB9DzLpTpba4bPEc0n+bSjki98CUbVlJFsqm
         ZWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PAbCNvl+vbwtDCjhKld2y+X8RPnKNQMIOsSC/w3hdyg=;
        fh=kzDUTRI1Ko+02oUu/cI1U+PddX+bNbXyU3RDGYAv5g0=;
        b=ErIx5ON4Tuz7FZxmx+2xLwWa3W/7PoZaW0kESYm+SgeXtNIAy3NIxEXnMVYVFRCzRz
         41WdwuEff9jzAB6W8BF5EaSt2o8Ji+9idWqotFaj172lesHUyEflMcmvtE8aIcl5XGyv
         HEOpwiN5xDxkgjCZcE2qEQMeAbW4SjwQD1Rg3SrGBtLzKb7Nc1q7rD0oNlqew2/uK+qf
         KSW7ruSHMbOuoBCzCdUDgtDn33OLPFK3N32sOKlLexbl++mX7AHNRwY6rs6OxFYdyEld
         d+q9R4h6H0NcFeeHoztdIB209eGS6D/qjY042PH3bmQ0JCaICX4TBGk/qpZPR54wv707
         ErQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219481; x=1790824281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAbCNvl+vbwtDCjhKld2y+X8RPnKNQMIOsSC/w3hdyg=;
        b=TfXqSMba54WY0GY9oG64XNy49goW9EVXAFyjh7WC4AZVqRdm3u/GTi1IwwKPRhyIwL
         LvNzKzpuefIdNAcE62z5F9SREPZvOwQFLtd+xyRcpwzDu6BBtJsVXfyqhXjUQHxDzbXI
         bW9lMHZEuOe8bFseU9nwPOvFyOvgovvTy6Q9Je7hgqollxdXr5opszCr0JgfHIkebxJB
         rZpHGDNe0/0x2tjDPflDwf6txNRVSMtTGFajO7Ef0WXzfi3G+BhEypTfDHeE4ql0i6Cn
         kZcjvC8celmEJQcYXM3xw3qzlXOpynCRP3bssN7aTQ4s0c8ED34hVRVejhNe/Za7yeUU
         4DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219481; x=1790824281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAbCNvl+vbwtDCjhKld2y+X8RPnKNQMIOsSC/w3hdyg=;
        b=iJHT99R6ZKwP1y6uGrPjHy/ptDdrfMRXENU5VBwOfhFmmRw5M/MKOasDnVHDZEhwFO
         nTnnlVCB6W8+mUmlXeTXTlJ/gBlIkERkVb9K3BZ+rqXTc4GrWBlXtxBWY/681jlFL0+S
         eM9JbXnNCrYt3zXJ70QLdz8rwUlKIj2NaatZ34MnjcM7Rd2R+tb6al6W9BfATGyNOK45
         aVvkPkEOQKWHFNu2rxwBNjV4HAtZ4rsu8qj8oDv/kpr9RAENfYa3Jx/k2Tchnib4ITK4
         blM+JHn0ZBccPfjtMCkgEp3a4pChgf7dgVRAXzpNj2dAdVqkRkeAfvgbOqqBFVeKOp3h
         3BDQ==
X-Forwarded-Encrypted: i=1; AKwUvByrlsKen2m8abr3I8Wkiuw895kz0m5O6yWYi7egxkkIklUKMdx0tQerGlxq/9xm/LymfPAEU/NVthBCIPo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCxytPtgCP3XfILItAA6tuV8MN+b+UDaiXOZxx2PQW1KcnnAgs
	+IcSu5rGtp8RRysumGf47xILSwfb7yTvLJuAjje+7luiZhn3pRhcVBJuPXCGWfQOiV1YcIY94BK
	lj0QuN4oYvvWrFTQDByPzbMxMRJk7MG03tWrh
X-Gm-Gg: AYBFou0V+jMF4vhnfot7T+KPf8Bs039e+XJm++8K1mGg5ZNcW06p22f8Nf6R5ccb7VM
	eGeLJWY6FeTW04u6PuaW4oe2xO/l074Uq7QyKCLxDEmtLl0XPYuPfSV+av0DUdt83b6FYAL/3Yr
	uMdcDnwukiuHodr/ZMVwKU8lNJjkZLU5DhIPAXVYPp4Ly1JgvMVc8Id63cIjKYil+0g4BXCYn6k
	QqQgczPCXctziY2tuOdAOQtHrFVimVB3zSXhMOG3Kmm0mhlW5XMQI8YjbyQhQHlh+9I2VTrZTAc
	Yapj74IeWjwx5dDqm5iPxiJ1gzB6SguYuzfa6lt7/rkaxOVJ8RXfp4HBcMYq1CV/FvPvHfkRh5q
	y8DEcV4sXobmGfVIrmvwY21B1KHRQSnNGU1qRi5t1Dv3LAQ3cGBUTE1w=
X-Received: by 2002:a05:6820:3092:b0:6c9:83aa:6fbd with SMTP id
 006d021491bc7-6d4416aaba1mr1152652eaf.66.1790219481377; Wed, 23 Sep 2026
 20:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179010105967.8478.2344875677216734809@proton.me>
In-Reply-To: <179010105967.8478.2344875677216734809@proton.me>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 23 Sep 2026 22:11:10 -0500
X-Gm-Features: AclHuK_hx_9XpVaJnWKId8Vpv3AIeuVNOuhwsC5qOUuULKOEPF9dmpRXHbPPP8c
Message-ID: <CACVXFVNi5E2Anxs5-EwevS+srqv2_D0bp3NJJv_hzM6pBNBWeA@mail.gmail.com>
Subject: Re: [PATCH] ublk: hold RCU read lock in ublk_try_buf_match()
To: Paolo Bertinetti <paolobertinetti200f4@proton.me>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b48868c46e62c1c4cb2c@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:17=E2=80=AFPM Paolo Bertinetti
<paolobertinetti200f4@proton.me> wrote:
>
> syzbot reports a lockdep splat when I/O is dispatched to a ublk device
> with UBLK_F_SHMEM_ZC enabled:
>
>   WARNING: suspicious RCU usage
>   lib/maple_tree.c:720 suspicious rcu_dereference_check() usage!
>   ...
>   Call Trace:
>    mas_root lib/maple_tree.c:720 [inline]
>    mas_start+0x3cc/0x640 lib/maple_tree.c:1250
>    mas_state_walk lib/maple_tree.c:3006 [inline]
>    mas_walk+0x1db/0x490 lib/maple_tree.c:4458
>    ublk_try_buf_match drivers/block/ublk_drv.c:5639 [inline]
>    ublk_init_iod+0x5d2/0x1120 drivers/block/ublk_drv.c:521
>    ublk_dispatch_req+0x97/0x9c0 drivers/block/ublk_drv.c:1776
>    tctx_task_work_run+0x73d/0xa80 io_uring/tw.c:96
>
> ublk_try_buf_match() calls mas_walk() on the buffer tree without
> holding the RCU read lock or the tree lock. Writers are already
> excluded because ublk_lock_buf_tree() freezes the queue, so there is
> no real race, but maple tree readers must still hold one of the two.
>
> Take the RCU read lock around the walk.
>
> Fixes: 4d4a512a1f87 ("ublk: add PFN-based buffer matching in I/O path")
> Reported-by: syzbot+b48868c46e62c1c4cb2c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db48868c46e62c1c4cb2c
> Assisted-by: LLM
> Signed-off-by: Paolo Bertinetti <paolobertinetti200f4@proton.me>
> ---
> syzbot tested this patch [1]: the RCU splat is gone, but the reproducer
> then hits the already open "WARNING in io_wq_put_and_exit (2)" [2],
> which syzbot has been reporting since May on kernels without this change.
>
> [1] https://lore.kernel.org/all/6ab1eabe.71f81b7d.15fa6d.003b.GAE@google.=
com/
> [2] https://syzkaller.appspot.com/bug?extid=3Db0d54b9e81de55179e47
>
>  drivers/block/ublk_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 66eb55e71..7a64745e1 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -5628,6 +5628,8 @@ static bool ublk_try_buf_match(struct ublk_device *=
ub,
>         unsigned long expected_offset =3D 0;
>         bool first =3D true;
>
> +       guard(rcu)();
> +

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks
Ming Lei
