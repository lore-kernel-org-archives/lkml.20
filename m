Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A135B63C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978600; cv=pass; b=cn18cI+XKKL+dBJp1+Gohjq5EbhOxj8r1L0pcDpSrn1+kVaWS9Ef3MKSrajAS4jP1v9BCd5inE+0b1LPZDi0+zlvSwHlapLgV4KmROJPPWiFTbgnMb2yb90vii+STmmFdN3Ntg7dBzq+2W0UV0oCniupc9ylQmU6ZNen0dsR8ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978600; c=relaxed/simple;
	bh=D6DRfvYxCcRfM+fDUxunHOyYs/QC9j3cuNqk1/dHOcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d03W1l9URmDKLfxEqXkTim3ILE/6DrtORIAKGSv/c3mzjEkMade6ancl5dW4Yv9yn34UslbBhXmPjbqk1AzNzCYB1tfsjiIfKJk1dQnstw4cgxURu85Izium/A+gMHczQRWXLmyAAAZ276LKgG/3/aRqjxflMxgl3OYxvf2HeJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm3zmTwo; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm3zmTwo"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so18298611fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978596; cv=none;
        d=google.com; s=arc-20260327;
        b=YoXIgV4yoCTAR8kj6RKnKT267V7b0Hde4Gr8BrnMseMAf8oR3TPD8tnT3SJXYgKYe3
         HE3QrGCYgx5dq/9nvT6ZHaPwaj/8cWxMkhM/fj+xo6zNfbTEeKufGcwh1ldwW8rzrD1Q
         w/72dHTB8P3pnNZRHTu5lD/Xpks+MJGb3TFkXEXEFoWswbd3T1tB3lly04rgmZKtWaBu
         xq2XYIT1ZOUBzZe7lGjkEXJu/08ZbrdRpsVWTjDJsvhL0qZy3atUkRMlOjkcAvRZjHsr
         ye9nPqwNMkHtCGJhVNrdBmL1wGm67D6RWavM31l/P0Ys57hZFyg31sL3GNaup7AgAxAs
         aMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHg4F4dbnUs0jRR7Pqqe34J1QjlGC1UbSYllDfPgOOY=;
        fh=CMnnLGVqCXbk9GsjSiRArFuwZ9SnnZZNgUkTxVaNL9Y=;
        b=hW606Zeh6i+/btPdclEJpnGEEMyb7HUGk8twKgGj+cQrxn+ZAo74HapBvkIdp5BiqD
         6E5qQYywrHukju7Qhsp+sHuq3ggy3TtS/RDCIWGn2cpXsuHxQyuLDGBdrn19J52HOw4x
         y59bNc9bNCF47sgee7t+xGz5Rr1whhI9hIgA1X1RG+kAOeJX87zKulM1g3fcuVOCgRim
         nL5IYQR2FqG60gmTdPSd+U5h6H6HAto6wlvv9ePWMf6aY/sdWk+/1vkmjl/pibL5O6Ut
         YqtLCZXocoXM1w+iukrVTzdygDIMVUFM3KKpsCzGIDFSYb6k4L83Occ2Xk652njzOGT+
         axOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978596; x=1790583396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHg4F4dbnUs0jRR7Pqqe34J1QjlGC1UbSYllDfPgOOY=;
        b=Mm3zmTwosn1a8mVO+ePxmmKDtjvZ8yuUriXugbusmVmARTorkXP+Xoy6HkVzdd2mtZ
         kuJejpF5OD4YDkIgJr0jmIMLCJKeNIXcba4lYePhVkgeVA7HJy0v3FT9mqP0POO9JoNG
         uVsunp3u+EXvYIgf+CEVEhWu/dtR1e8WcLOsIgSta5EFKwSUYws2/JcQ+pz8Uw/T0Wpq
         0/BFg0TtLs+8acOsmSiurz9cRcu8y8tNcMWKb9HMHMaydfuFZh6ygj2LkEdoywjbDKyT
         +wjDyx4+sWSudMtgrQ3bACPWIIym5LIinVV2l/3OZxZjz22OAEOADI3eoPOilLugr69K
         03Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978596; x=1790583396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHg4F4dbnUs0jRR7Pqqe34J1QjlGC1UbSYllDfPgOOY=;
        b=aZZEuCejjM9Z4CEi3eMHqs5rHMrqMo12Q5aZRPzyPn4fj0t0myFQMVSxvR2QEcSD7R
         Q1ZzvbgVgqA1hZNohBE5qL4DqIvpkBS4WvbXA+JLDqSjVizxwLoQOWm9wtzyIi299CN4
         uq4YphDdUhul3urwlv8UNR517HDO7RfgWPyOiCKpekxi6V0xZ/bfe3X8Tyep9SJ7LY+W
         jSxE5Rg+emBXaqZFHD/hX5joHC7Z0pyTouWptjhUpeqBID94q8Pau74JpAvzoWx0/YhH
         MJknqL/BYKbcCu/MdK59d7VTae9/PWkZ9yz7evItWlf+l4rlaiI4QPO4DEGNoqcJitvS
         VS/g==
X-Forwarded-Encrypted: i=1; AKwUvBxBFFatkbHkbbAvDY2oQe0AZMJbFJ1ERfWiFE8JKCTiz5/7ix4QYUopuICpm78d6Q6AHeMY3Zy2Bh9HGeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kCNuAHT5JsFoRiEZvwqjF0Ui+T7+1XoxxlJjUVTWWEdGgM5bSF
	IivOH7xdvBKvkg2f7cU0vf8yEhrdYom+diddq2+QHomeqdoMUJeyyjgVHLO94aTiII0IoFqIxNP
	x6Y7uTTpOMBbOtI1ZvBo/Wdy55ylG49w0vgOr3WU=
X-Gm-Gg: AYBFou0ptriGMyfeonbT6NuUj/BUkj1x4CDVn5LTloikBzUCQ85WX45y48o8OXrZzqV
	Q+tKQ4EB7149dEOdw0oCKuwFPiBqXemi4rxI/GUg42cg1dRk0bNwvM8u4VcTGM8s2H2Sh2eD0or
	NFqHGDDzIu2E0TtBKJ1+zSXY5IsffsbgbX7Nr18SkvblqFb3U+tvMQ+1K/tWil0xhNmRr6Balfq
	AHDh+sJzySz26TG8xrmJfld2SGA3GcUC0o5XB3o9/+PdGRbTgW1pfzGmyizR3ODHxopAZGbcwdV
	YKcuMEGr9PeK5CgKZf1I2zddDZInKfFd/+N0hgVmgA0+cDu0p6xv6yHr
X-Received: by 2002:a05:651c:199f:b0:3a5:ba1e:8b08 with SMTP id
 38308e7fff4ca-3a5fbe3743cmr19815651fa.3.1789978596351; Mon, 21 Sep 2026
 01:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <13b330df140a2ee488952b4c7145e261ec884555.camel@dubeyko.com>
 <20260918212153.23651-1-qwe.aldo@gmail.com> <CAKFNMoneRHw=-hsGvzY+Mdktm3+EtodSU2vpNoaXZnheu+VjgQ@mail.gmail.com>
In-Reply-To: <CAKFNMoneRHw=-hsGvzY+Mdktm3+EtodSU2vpNoaXZnheu+VjgQ@mail.gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 21 Sep 2026 17:16:18 +0900
X-Gm-Features: AcwNN1WwxAMKnzF-5FQ6dVTd1yEQiTnVJxiKOF9pPoF6TlvX_ggfBDydnl-UtF0
Message-ID: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>
Subject: Re: [PATCH v3] nilfs2: fix checkpoint root lifetime on sysfs errors
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:47=E2=80=AFPM Ryusuke Konishi wrote:
>
> On Sat, Sep 19, 2026 at 6:22=E2=80=AFAM Aldo Ariel Panzardo wrote:
> >
> > Hi Slava,
> >
> > No, wait_for_completion() without a timeout is intentional here.
> >
> > The kobject subsystem guarantees that the release callback will
> > eventually run -- CONFIG_DEBUG_KOBJECT_RELEASE only defers it, it
> > never drops it. So the wait is bounded in practice.
> >
> > If we used wait_for_completion_killable_timeout() and the timeout
> > fired (or a signal arrived) before the release callback ran, we
> > would kfree() the root while the kobject release is still pending.
> > When the callback finally runs it would access freed memory -- a
> > use-after-free.
> >
> > wait_for_completion_killable() (without timeout) has the same
> > problem: if the wait is interrupted by a fatal signal, we cannot
> > safely free the container because the release callback may still
> > reference it.
> >
> > The unconditional wait_for_completion() is the only safe choice
> > when the caller must free the container of an embedded kobject.
> > This is the same pattern used by other subsystems (e.g.,
> > blk_mq_tag_set, configfs subsystems).
> >
> > Aldo
>
> Hi Aldo,
>
> Thank you for the patch.
>
> However, in my view, introducing a mutex for synchronization (either
> by replacing the spinlock or adding a mutex alongside it) is
> unnecessary and suboptimal.
>
> nilfs_sysfs_create_snapshot_group() performs memory allocations and
> sysfs node creation, which can sleep.  Holding 'ns_cptree_lock' across
> this operation causes concurrent read-only callers like
> nilfs_lookup_root() to block unnecessarily on a lock that originally
> protected a very fast, in-memory rbtree lookup.
>
> Note that checkpoint and snapshot mounts themselves are serialized by
> 'nilfs->ns_snapshot_mount_mutex', so strict mutual exclusion between
> concurrent insertions is not required; we only need to eliminate the
> race against nilfs_lookup_root().
>
> Instead of converting 'ns_cptree_lock' to a mutex, I think it would be
> cleaner to keep 'ns_cptree_lock' as a spinlock and structure the
> creation flow so that new is fully initialized and registered with
> sysfs *before* acquiring the spinlock:
>
> 1. Allocate new and initialize the basic fields required for sysfs
> creation (cno, nilfs, etc.).
> 2. Call nilfs_sysfs_create_snapshot_group(new) *before* taking the lock.
>     - On error, wait_for_completion(&new->snapshot_kobj_unregister),
>       kfree(new), and return NULL.
> 3. If sysfs creation succeeds, acquire spin_lock(&nilfs->ns_cptree_lock),
>    link new into ns_cptree, and drop the spinlock.
>
> In nilfs_put_root(), we can keep refcount_dec_and_lock() with the
> spinlock, erase the node from the tree, drop the spinlock, delete the
> sysfs group, wait for completion, and free root.
>
> Could you please update the patch to keep 'ns_cptree_lock' as a
> spinlock and complete sysfs registration before inserting the root
> into ns_cptree?
>
> I think this approach should work, but please let me know if I've
> missed anything.
>
> Thanks,
> Ryusuke Konishi

Hi Aldo,

On second thought, regarding
wait_for_completion(&root->snapshot_kobj_unregister),
wouldn't it be even cleaner to keep it inside the sysfs helper
functions instead of exposing it in the cptree functions?

Specifically:

- Inside nilfs_sysfs_create_snapshot_group():
  Call wait_for_completion(&root->snapshot_kobj_unregister) directly in its
  error path after kobject_put().

- Inside nilfs_sysfs_delete_snapshot_group():
  Call wait_for_completion(&root->snapshot_kobj_unregister) after kobject_p=
ut().

This way, the completion logic is nicely encapsulated within the sysfs
subsystem, so nilfs_find_or_create_root() and nilfs_put_root() don't
need to manage the internal completion state explicitly they can
simply call the sysfs functions and perform kfree() when needed.

What do you think?

Thanks,
Ryusuke Konishi
