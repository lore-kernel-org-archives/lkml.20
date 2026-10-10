Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9BE3290A6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791605898; cv=pass; b=VWMgPQt4HiWmXnyVuTQiUbCr6K91ZbtA3u7q3FZs821hFu3O0OnZ5b9TWxH/4c4w1WvXtyWGJ8+UvpliwIcNUWi8V8JU8bkaCdmBya/s7MrVpO6YmIkFCy+aCmDaltX7R4JzFN1XPhdRxuyYX4X/NamEjqJXGcel5QG13PydIS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791605898; c=relaxed/simple;
	bh=KYy6VegmlTUaxOe7PFlSpF96TjgUY4FSEQt4j5zRT20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEIwIxi9iTnVilJomhPAuXuDEJ5O7TZQhqYa4AK1kCNox3vqHdJ7pDMO7Pp3HzRL+xUvNdUuhfTtf90RknqY+Jv6HdMTzVOZlY7eWJINhuYnNbxi6P1hbWxaJYCt1fakHLZ+LTja2FbcklwWJ6HwygGt5i5NTPnt59Ka9oNNNk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxwPN3z2; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxwPN3z2"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so304767eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791605895; cv=none;
        d=google.com; s=arc-20260327;
        b=ncNCLqvmDECB5BsIjA3wOxZXeZf6uEugCfbHN+3G9BM13j16/I0WI0cn3mTasZ5ZxP
         jaPG0IjrhXGMEGbkg7PC+zw0G2EGVoXmqJ0Uu9fcApIYMVh5MOVqv5vpBZhUEcfotIYK
         md4hzQk6M3P6B6drjVbpga9BsgrAuY8B4GEe+2miWCL5Kp4Wd5FWJQ8Fj77VtxsC8QAn
         XRrQjfFkj9wwAjka+bUD1cK7qS9o9E7LSSkNvY1rzKzmM+dkUzn9f5F766MiWzrcdxUO
         QF2aGUU9fglJhADiHTG+XN5oqh+YCjHzlS2MW+fjovlcbWzsIICJAkrxXIt86vdazzyK
         zaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ew33P9923AzoJpuAktLckP37GCcxC9qHFUOjrnQW1Ik=;
        fh=HHByedXzQyz2gAJ2j3Uqc4Ypg5IyVKOopoZTPeyBNeU=;
        b=D6P+AGrhgHW5hhYvNk9SIjN8n/a/R0LhoBGb1+Ml3GuundRH07WjNkwlKVwFg7njra
         +NFv7I1AmohxAOV/GbiG2iv9oqVDNC97gpWKdNMDT/S9ecBF+j424emXgTvhQy6yXcuc
         oN090rHAi96i1BR4fajv0tgJ/hRxxPzzWnTZKNu16bltIspFcl2COpxAbYXEH9N3+aUD
         KRzRCLL4U3F8Jc0SgFGXNWBChVTR9oKgrQ/i5xDc9bvmo+Qn9VVa9NrtMKQIy+z5VFRd
         hFgn9ELXq+HAIHEFwW3vUxRsXM5NnHAYso8KnyFcCjaDUwejCm3/r2W3W30at2j6cgX9
         +OiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791605895; x=1792210695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ew33P9923AzoJpuAktLckP37GCcxC9qHFUOjrnQW1Ik=;
        b=OxwPN3z2Qz8oUwvwhqV8qNluN4gvU/XIaloMEhRouQnKBX5awGvC1nhoxLjPFyIQ7u
         DV3EiJm9Ieqo4hI0bJ/MF6sbCni4DbDsLnE7s8oAWWXxzD4FXfhyk3JfNMA0vvJuRUQn
         DbjnHf5C5cI67mieFz1E36SjXNwSYq5u9iby+wu9S54Op6T1sIn54U8o4l/dEiqW7UuQ
         nGgOsf1drkrgL0CRVP1/ZgUY0Gkbe6zGIyk3wWzdCVQbL4jkQn7FH3nI7Nf6NTBrQTNf
         YdmDsbc1lfhFlsFBEObW4MODgwE+CAj0WcyV2RadszbAc0Hbd7I7rAL6D2R1x6b5CFTf
         8j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791605895; x=1792210695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ew33P9923AzoJpuAktLckP37GCcxC9qHFUOjrnQW1Ik=;
        b=UlcgbvcDPS4+2kQBVxBzmgTNuIy6v0QK5ZMBKwGNIbW8UBNHvPdJauCA+dGKIJpMAS
         Gr0XEqQGnfa33gsvgOWobfiSDdBc/BO6mwxIaocqVCC4hsqvpYgNtOzPWTmNxiycl+Hq
         0csIw0UwxOCpZmXjsudov4qce59iO9nWnsWYov8MtLlIg1OGkCd8Tamnkb73yU1A9kST
         O0pfHfCyChUTseGFuva9voCcPadXQTAjWrX1RTlKw4a/lVumtQlvAv4THN1XkoEddXQZ
         yC/NX3hPGOlkEmSQos3Th/V9Dbbo4j3tDWxB5vCTivyycJCF/IyrfMngtM9eRiUxfD59
         JcSg==
X-Forwarded-Encrypted: i=1; AKwUvBzHV/QcimWtBMPb19kO822X4vONh0SHFQfiRIKLN7oMo0QF980G+L0WaqqdW+72SezPZnMFt2vv3NmfkAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNqFny/IAoGkOpASYA8q13NBx4Rrt0Z6Pg+f76FfgQR2eVvxJK
	RRbQr6oXlP7yEspNrUVAQ9RxUDsWTaP+IrI5u9h3U8ILHvlygEt+YKDI6TSsq07GG1TT9lgSv4h
	vwfKGnzCJmLjhkgu/SI8oobNaDtLQbZo=
X-Gm-Gg: AYBFou0k8Xe2+BF6i4eK/6obx4eU1S8BMKwTfqj+sniKEY8ZnCCAhNdtogU+eFbRh4d
	rJs9lt8rAT0L62jwR20OuAWtySjWAszTEwdrNFbJPJL9zjqWVWOBw2U2NBIH4qFrqJKtQHj4Lwx
	PI7peCQ7c4e/S+VogZ03Z3F3upvoIbYA3CY18MriOv+qTwSuM72WkVWUdYkgOxg6sTsphVMGB7g
	hDW8L6Zwf4mhldC7CpPe1SrLjD/VMU/cb7aoYNqGr9PIVjSVMyoKhb7vKFSMfmtDUCSvY1+yLOv
	LjxhjQagEhm9d68nMaVJdqszdAP9mKcWo+Ka4iv9AfPLkiispYuQ35I+xj6MpAG5ToYGUCCudCp
	AKqXpzjEdOHgePUY48ZnHUyW71kQ5TMXYIcbyIr3ruFYHgAi7I8faAQ0=
X-Received: by 2002:a05:6820:984:b0:6e2:3d8b:a01c with SMTP id
 006d021491bc7-6ef0e9dc2d0mr2797147eaf.19.1791605895411; Fri, 09 Oct 2026
 21:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-bug-block-elevator-init-quiesce-v1-1-5c85fa0ec59b@gmail.com>
In-Reply-To: <20261001-bug-block-elevator-init-quiesce-v1-1-5c85fa0ec59b@gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 9 Oct 2026 23:18:04 -0500
X-Gm-Features: AclHuK_aaavcIOhZXQjbCJpj_zTwHfB7pXCx3pPddER2n9m6mNEdfh2htsXEqCI
Message-ID: <CACVXFVNVC4cBuL6gFMMo+FktZnXdy18YJ-Wu81NqNfW7E4_6WA@mail.gmail.com>
Subject: Re: [PATCH] block: don't quiesce the queue when setting the default elevator
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>, 
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:12=E2=80=AFPM Qiliang Yuan <odys.yuan@gmail.com>=
 wrote:
>
> elevator_set_default() runs from blk_register_queue() while the disk is
> still being added: the block device is not visible yet and uevents are
> suppressed, so no file system I/O can be issued. elevator_change()
> freezes the queue and cancels the dispatch work before switching, which
> is enough to drain dispatch activity from passthrough requests, as the
> comment in elevator_change() already states.
>
> elevator_switch() still quiesces the queue unconditionally, though, so
> every disk added with a default elevator waits for an RCU grace period.
> Commit 245a489e81e1 ("block: avoid to quiesce queue in
> elevator_init_mq") had removed this wait from the default elevator
> setup, and it came back when that setup was folded into
> elevator_change().
>
> The wait is paid in full by callers that add disks one at a time. ublk
> adds the disk of a single-queue device from START_DEV, which takes 7.7ms
> at p50 in a 16 vCPU KVM guest, most of it in blk_mq_quiesce_queue()
> called from elevator_set_default().
>
> Skip quiescing in elevator_switch() when setting the default elevator.
>
> ublk null target, 1000 single-queue devices created one by one:
>
>                      before      after
>   START_DEV p50      7.74ms     0.68ms
>   START_DEV p99     14.61ms     1.32ms
>   devices/s             114        971
>
> Fixes: 1e44bedbc921 ("block: unifying elevator change")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  block/elevator.c | 7 +++++--
>  block/elevator.h | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/block/elevator.c b/block/elevator.c
> index 2161b6eea680c..da9ba70ac9321 100644
> --- a/block/elevator.c
> +++ b/block/elevator.c
> @@ -573,7 +573,8 @@ static int elevator_switch(struct request_queue *q, s=
truct elv_change_ctx *ctx)
>                         return -EINVAL;
>         }
>
> -       blk_mq_quiesce_queue(q);
> +       if (!ctx->no_quiesce)
> +               blk_mq_quiesce_queue(q);
>
>         if (q->elevator) {
>                 ctx->old =3D q->elevator;
> @@ -594,7 +595,8 @@ static int elevator_switch(struct request_queue *q, s=
truct elv_change_ctx *ctx)
>         blk_add_trace_msg(q, "elv switch: %s", ctx->name);
>
>  out_unfreeze:
> -       blk_mq_unquiesce_queue(q);
> +       if (!ctx->no_quiesce)
> +               blk_mq_unquiesce_queue(q);
>
>         if (ret) {
>                 pr_warn("elv: switch to \"%s\" failed, falling back to \"=
none\"\n",
> @@ -731,6 +733,7 @@ void elevator_set_default(struct request_queue *q)
>         struct elv_change_ctx ctx =3D {
>                 .name =3D "mq-deadline",
>                 .no_uevent =3D true,
> +               .no_quiesce =3D true,
>         };
>         int err;

Looks good given elevator_set_default() is only called on new added disk,

Reviewed-by: Ming Lei <tom.leiming@gmail.com>



Thanks,
Ming Lei
