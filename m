Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793289265;
	b=Q8lUtSbZarSCh9qc7Wvg2m8OcXUyV0fxT704mFjjsoUdCNTMOgz9oXPRr9IyO/mesIhe
	 CVJyUbbzLBYn9nHJX69QVO10vTlrFZp8jqEPtG+U1Jr7e8K2qI0T8pvP4U4atILlSj035
	 PCUZIQvaRMTApMqo5MXZWQEPjh+LSHlvHc1uXK73iPVzdk62DUmpTLiabifdxfUXOwCYM
	 JpiMQx53aguSd8Xl6RVur+B8hfb8r1A/Q3pEEWbJEvon1inmWrDGMqU3F/6KFkmB4WTB3
	 WNzrIeUPbECyRFDYk8PYKgWI6u9AzgKbPoZzIRLARr4xFsqsuaRQiXfrkgdblhBsvaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J0441SvuXNyp+dPH0a7qYaBBZzYNLLrZxDgICCCbycU=;
	b=kaXPkSgRcUiAn5Gl2y4l9bxGThZbvsyQmLhklrzEnpmfp4fEbHQZWHokkKIHuUageA3P
	 QHft/EdUm4GSOhQnFrVysZ+Zw34RAp1m/JiW2xhRkyq3+1SyEMMrV3P70FoXM2f72h/6B
	 CH+fKj8cSWG/6AWp8L9wJsKyjVdWwO3kj4uUPBlrrcxQE/fl54Ph93Zpm29GkFhpRiCIO
	 kfSmQlHzcBfJyzr/y8pBh9Vz7yQ6IQ0bUaI9AjWiIdw8Py2/HdRVkq2UhgXLsLhtnA55s
	 45IFAPEJAyyYIf8OtqyLYQOolJPo0xAZMCs/VXzEi3s+XAVS8uLDrToUFEX8LHGOdVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fEV27xoq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BC60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029BC60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fEV27xoq
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70a66a3e3a6so86326eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793289264; cv=none;
        d=google.com; s=arc-20260327;
        b=QTNmZnz6/rvBXejfhklL77LRbATdod8b8pzpFLCokfF3kBi8SGOnvMai2ULYKITdoN
         Qj2bZnrzCpSX4jhptIatuLWiF+rouBp9jdZI1xy3DyK4OdP6uoDnImN0Dcbvv41ZOLXO
         eGdF6w+q4Y5H/NCu8QLFUJAnSMW+xdh7YyBOm7DAS641T1rWcwK+prrqgZ3UOvZ20uFd
         l+fD0jvA+WbvleJk8O289t8IMQ1Qzp0ArVNi9AAgzIiUxdWzNrFbIJtL0S3dA+rwwBxI
         oJMHEGESVwdb9vWb4HbHYCaSkff4vFJm6WPEmNj3rLiQaYMcRbNS5R1HmSgNVtZ1vlmQ
         JF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0441SvuXNyp+dPH0a7qYaBBZzYNLLrZxDgICCCbycU=;
        fh=gY+gku2APANrW2omQQlykbhgt8+BqYzkUnTr0fZiky8=;
        b=Of5EgYN+8Y7rIBzP3kRvzbTSlbHUQLFSQprV+Is09fbpZngeeJbz0dSYD4aTH7aytm
         O7kd6kTbrVsn7dlw676cbAPrtYifZv4nI0j2YBW8pBCzwMFxUDk5X6EfTBvBqExwGXzz
         N1/gxXLWB0rehivUYka20ojarmT/gvdpyEzH90UbPfBHnjGW1vcmJfFYAbIgSEfrzjbV
         uw79/l3TdW3AuazMzJLSb1+If3OGXvXRx5u8NcFAjKMU5R+xip26ft46CgZxUbQf/mA8
         OYlRuw/vs6d8UTyjCZDKZK/9hylSKGqazy7DY9sXrzfu71lp6lltUc93FLcHnNZzXgld
         q7aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793289264; x=1793894064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0441SvuXNyp+dPH0a7qYaBBZzYNLLrZxDgICCCbycU=;
        b=fEV27xoqw1M9SH398pbtNvixn5ZME9TnAyZczpY9fIe4qYVLaOxtCAhtfyionz6eDN
         KVJEyBCGIjGBir+FrCD6CpLzGVSIeEaSM2KWlMxS4QheoqS5x99uMRxu1Zh4LeZUU88V
         BzNSoRfZrTBji+OINyBurVKifuYV1grPWZzKhCgo8eaaPVsoY1X4Fq8tZmr/5d51Vyu0
         aIy9+p/OeJ4AJyynX1Fo3iVJzTak/APxEzrCKmO7iJygmKExihszmKnYu2p1gTMKtxsQ
         2gOSosw2XXGMJII91DR1zrjDzjaWBxsQ9lKgVUXncdTtrFbK8XJId7AltnY7AIgOTbwo
         8XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289264; x=1793894064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0441SvuXNyp+dPH0a7qYaBBZzYNLLrZxDgICCCbycU=;
        b=CoVn+JC+tEJMmIQnpWWDYFCR5wH7vf2vKsUg6KuS9UMVU83FFSY8wsnjD4MelFIYoy
         ruHZafP0g5B4qU56YtiG78AC9YpXndS11LRrckgk5gDtjR/ziXlY1wP8t2/SqqkL1TRV
         iUIcp5IFiezTU2x3b3gdoHZODlMTxo03qIHcrIrgn3UPhLudQwlbf6gKghtsPe1sbV+I
         qxhm4LMkqOAokW+z4KLvX3dZh7ap2kGh67atAF86nOMT9QCFDErRwUFncUbP+AoUAHbC
         Musy55GhrOWysAy3d67susMTUfMnFBK1ylYHDV59PDTmILQXIgZRCJFxjmBRQXI/vazG
         hG+A==
X-Forwarded-Encrypted: i=1; AKwUvBx+9fCqUJv6LU9K5H1SRoWXDK9sqbgaQBcx/1UBYbQucGKTNI4DP2+yGwsFYAj3Ek3ZbagXJYxHPPCYf4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe6PTJw1fjdw0vBs+VSGGVQ2EW165wc0/qOamGhNUbX8BYxZeD
	IgWinMx4/ho+y5uMCQ0+F5JGWjhvgyYoQeIFXFadKiKlykDaDIZeesmINMPppzYKu87QD+SdJyZ
	zkQpEKbznr9TM4ht4VEXw16jLbkNdh48hPbtFI5GOLQ==
X-Gm-Gg: AYBFou2djPsdvg+87TtWR5dn6J55WpOF/r7hF0tjUaiXYh6WHmp9ppmusLCY+0ZSJ1M
	9wCVkIbXGNhJq0LxVNmrgkostx9PeKnn35hr9uGO1Sh0YqUjoWV6gFHyWhdYH5eccXTuyy6BoXp
	Ids1A6cLMauEpXfFAkCWy/88Moo8Zpivj8VCk95PI/fAXhqncwRXfG7XQJi9ZTnPA7T8F66tJ2P
	zPNQA8hpmgoYmpUJWiIgW5pBQd2qcqtQISu+r0Q5B1CuTtMWdqSvdGFW3bWfEam1fTQqs/j9HKJ
	kIr3Nvx54jGxIC5xTYEMgNi7KS3xioZV6ok3RDv+9dFTHHmw+e/SEL/t7WDVuL3FXGfQF8N5QOZ
	DaVZn9XjW5UazbXUG1vdxwuoVz/8z3QoGNXRPKQ==
X-Received: by 2002:a05:687c:646:10b0:4a7:1396:72a with SMTP id
 586e51a60fabf-4a8bb8e2349mr5536503fac.1.1793289263755; Thu, 29 Oct 2026
 08:54:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ae2d5bd.84012103.26b497.074c.GAE@google.com> <20261029073745.324823-1-eadavis@sina.com>
In-Reply-To: <20261029073745.324823-1-eadavis@sina.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 29 Oct 2026 08:54:12 -0700
X-Gm-Features: AclHuK8LFHNXUrjGb0oo4IZd9KIl4s2UKSWkW36VswbAX2fDkzhZ5xHVAXoR1c0
Message-ID: <CADUfDZo9XZvYd0VUW8cMJZWM_BeUHCiVNSeWHegxtNnaWBcg8A@mail.gmail.com>
Subject: Re: [PATCH] block: remove inode lock for buffered write
To: Edward Adam Davis <eadavis@sina.com>
Cc: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com, axboe@kernel.dk, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sunjunchao@bytedance.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:39=E2=80=AFAM Edward Adam Davis <eadavis@sina.co=
m> wrote:
>
> Commit 2fec4fd97cc3 ("block: take i_rwsem for the direct I/O write fallba=
ck")
> added shared inode locking around ordinary buffered writes, but commit
> 1b1be9ea4e34 move the lock to blkdev_buffered_write() and didn't remove t=
he
> shared inode lock in blkdev_write_iter(), potentially hitting:
>
> WARNING: possible recursive locking detected
> --------------------------------------------
> syz.2.64/6167 is trying to acquire lock:
> ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_buf=
fered_write block/fops.c:734 [inline]
> ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_wri=
te_iter+0xd12/0x11d0 block/fops.c:812
>
> but task is already holding lock:
> ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_wri=
te_iter+0xc5e/0x11d0 block/fops.c:811
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&sb->s_type->i_mutex_key#9);
>   lock(&sb->s_type->i_mutex_key#9);
>
>  *** DEADLOCK ***
>
> Call Trace:
>  inode_lock_shared include/linux/fs.h:1039 [inline]
>  blkdev_buffered_write block/fops.c:734 [inline]
>  blkdev_write_iter+0xd12/0x11d0 block/fops.c:812
>
> Let's remove shared inode lock from blkdev_write_iter().
>
> Fixes: 1b1be9ea4e34 ("block: take the inode lock for buffered write fallb=
ack")
> Reported-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D39e465d3f7a1555b0f96
> Tested-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>  block/fops.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/block/fops.c b/block/fops.c
> index 517b96c9d262..375ec2c15926 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -808,9 +808,7 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, =
struct iov_iter *from)
>                         } else {
>                                 ssize_t ret2;
>
> -                               inode_lock_shared(bd_inode);
>                                 ret2 =3D blkdev_buffered_write(iocb, from=
);
> -                               inode_unlock_shared(bd_inode);

Already fixed by
https://lore.kernel.org/linux-block/20261022062513.77372-1-mzx199711@gmail.=
com/

Best,
Caleb

>                                 ret =3D direct_write_fallback(iocb, from,=
 ret,
>                                                             ret2);
>                                 need_sync =3D true;
> --
> 2.43.0
>
>
