Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635909;
	b=uT5yBa4hLAI3aaztG1sxR96aww3ey0rHnca+CrrGkJw60MI2nwACw1oXUvsLx0G29wKp
	 p6oixX2iOb9UF0CEjtqFL0IheIEursoMNTz7QXfw6kPLK/+zNlTETlxmdX0641PNIS/8z
	 b+Afs1CObmllKK1ymRukGL/9uiYSZ5o+HxWNDx3x3nNl5a406Ym4Fo3c9qmpZtHqhxzbL
	 xLKBA+37RW6Md4Tn24aZ9/JhRGTw1OqJM5CUMewhmRuFy+QRLsCU7nyj96CuKSCzgpItf
	 B33o1dbZRdvOaZIz1XOB8AdU4HI2Ru7WF4F+JgXbfza9b7Ce0QPoOEJN3TOf4EatmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635909;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I5d5ZKtruZEt0ywZjiSxf1z4dOQhLcvrD29UBSr0ThM=;
	b=ZdW70wA4e9zJq+0cw+NcVfy4C8/kKURGsQcUEqm3XdG5QM6WakQ9mZ70Ys4rrykuSEex
	 4bIgYFP7r2k3adJfpxR0BtgQV3YOq5PuTGi5qtHAowqKojM3mRpLKOwn/hpB81dbtEQbd
	 bm8xECjBUZZK7qzy996XBDXffmqHfwhGt/Gf1hZHrtvAPveb6S1MMvCsGwU3SCD6TvQU2
	 hR5vN3rC0g+gKcGjKYYEHuZGnCF/oYOILqvZ+YeKashgdqd6zRK5+lCB3DHVlmPaWyQ52
	 qDkNrRYaCXb+El3zvMXreBetsinBOZtrYWQ3wUosXEhjrp5hHFgN6YWrXQbzcEUFlSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KFriW5n/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD766081CFC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFriW5n/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2A41F00A22
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635908;
	bh=I5d5ZKtruZEt0ywZjiSxf1z4dOQhLcvrD29UBSr0ThM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KFriW5n/0Y/rHZwPyB+VOn2d70RCIG/unjNHQz0AsJivZLwt916K/h4TBtiHDDaPm
	 4F0EhHWx2t79dKtCLZAqxdxVBNhJymL21FzLneoJHstyBXNiQFmhtPfA2Oc7RoalWX
	 qmbcoN0pX5QkZC7DQaBEh+6cSiAXElyi+GM3BBBW4214NXw36EMet5vElFmASMd8cX
	 TX3spusi+aPWrvl1qiaFUzvzgrXt7dU009ACljjoRoWvXcVgC7+O8gnVeypMc8Q/gY
	 kiZ1g6X14eNNLzjIfsHqO4O5hvmdgi9fviJy6T2xerwbPgZFe3cxE6cOFjKS4m3x5O
	 UsVSGZ7kdNEDw==
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso1889401137.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:11:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByF25X5P4aeZVEkIQggL+q+sREYVIV+Tr6rJ4CuV0tScDcXclRIbm4J9k4ShRcR89M3PI0ssci2J5GJ9l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UGHxNgJTvpLhyf12sh/vfVRlaxTW80XInoF6C+o0VYfH0hXbF
	tAme++9+U6+6kLXxsnrozW5LIfu59QGNUbJHApntdtkKVBu5TFT8a6oUPU/pSGt7zwtrVuoHi6G
	h+w/AkrfhAbNiHS3JwtwjVRGM9EPbcLo=
X-Received: by 2002:a05:6102:3e85:b0:7cc:306:d3ab with SMTP id
 ada2fe7eead31-7d07277bbc5mr4589315137.5.1793635907979; Mon, 02 Nov 2026
 08:11:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
 <20261030-b4-btrfs-data-integrity-v1-3-f4d4196731e6@toxicpanda.com>
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-3-f4d4196731e6@toxicpanda.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Mon, 2 Nov 2026 16:11:11 +0000
X-Gmail-Original-Message-ID: <CAL3q7H5cn+ObFp5qV4To71bd41730=WOyM_bEyyynwXxawadKQ@mail.gmail.com>
X-Gm-Features: AclHuK9xstgTUtJd74nP3ErwhDZfmrHJjx3xFiD3uLWyWarWLc6vq0PYsqYnAUM
Message-ID: <CAL3q7H5cn+ObFp5qV4To71bd41730=WOyM_bEyyynwXxawadKQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] btrfs: make fsync wait after pre-submission errors
To: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
	Qu Wenruo <wqu@suse.com>, Boris Burkov <boris@bur.io>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:39=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> Commit f13e01b89daf ("btrfs: ensure fast fsync waits for ordered extents
> after a write failure") made btrfs_finish_ordered_extent() set
> BTRFS_INODE_COW_WRITE_ERROR in the inode when a COW write fails. The flag
> makes the next fast fsync wait for the completion of the ordered extents,
> which is where the extent maps that point to unwritten extents are
> dropped. Otherwise the fsync logs file extent items for them, which is a
> corruption if the log is replayed.
>
> As the comment there says, this is also needed for errors that happen
> before a bio is submitted. But for buffered writes those don't go through
> btrfs_finish_ordered_extent(). When running delalloc fails for a folio
> that already got ordered extents, or a block can't be submitted,
> writepage_delalloc(), submit_write_sector(), extent_write_locked_range()
> and btrfs_cleanup_ordered_extents() call btrfs_mark_ordered_io_finished()=
,
> which marks the ordered extent with BTRFS_ORDERED_IOERR and queues its
> completion without setting the flag:
>
>   writeback (or a first fsync)             fsync
>
>   writepage_delalloc()
>     cow_file_range() for range A
>       creates extent map and ordered
>       extent
>     cow_file_range() for range B fails
>     btrfs_mark_ordered_io_finished(A)
>       queues the completion
>                                            no dirty folios, no writeback
>                                            flag is not set, does not wait
>                                            btrfs_log_changed_extents()
>                                              logs the extent map of A
>                                            btrfs_sync_log()
>   btrfs_finish_one_ordered()
>     drops the extent map
>     frees the reserved extent
>
> If the error was already reported, for example to a previous fsync that
> triggered the writeback, this fsync even returns success. After a power
> failure, replaying the log replaces data that was durable before with the
> unwritten extent, for which there are no checksums:
>
>   BTRFS warning: csum hole found for disk bytenr range [14434304, 1443840=
0)
>   BTRFS warning: csum failed root 5 ino 267 off 0 csum 0x8941f998 expecte=
d
>   csum 0x00000000 mirror 1
>
> Both functions share can_finish_ordered_extent(), so set the flag there.

The idea seems good to me, but as Qu pointed out, sashiko has a valid point=
.
The writeback bit is cleared before we set the _COW_WRITE_ERROR flag,
so a concurrent fsync may not see the flag since it does not have to
wait for writeback,
but that also happens before this patch.

Thanks.


>
> Fixes: f13e01b89daf ("btrfs: ensure fast fsync waits for ordered extents =
after a write failure")
> CC: stable@vger.kernel.org # 6.10+
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  fs/btrfs/ordered-data.c | 62 ++++++++++++++++++++++++-------------------=
------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
> index df74c75d6c29..6543e99055f2 100644
> --- a/fs/btrfs/ordered-data.c
> +++ b/fs/btrfs/ordered-data.c
> @@ -401,6 +401,37 @@ static bool can_finish_ordered_extent(struct btrfs_o=
rdered_extent *ordered,
>         if (!uptodate)
>                 btrfs_mark_ordered_extent_error(ordered);
>
> +       /*
> +        * If this is a COW write it means we created new extent maps for=
 the
> +        * range and they point to unwritten locations if we got an error=
 either
> +        * before submitting a bio or during IO.
> +        *
> +        * We have marked the ordered extent with BTRFS_ORDERED_IOERR, an=
d we
> +        * are queuing its completion once all its IO is done. During com=
pletion,
> +        * at btrfs_finish_one_ordered(), we will drop the extent maps fo=
r the
> +        * unwritten extents.
> +        *
> +        * However because completion runs in a work queue we can end up =
having
> +        * a fast fsync running before that. In the case of direct IO, on=
ce we
> +        * unlock the inode the fsync might start, and we queue the compl=
etion
> +        * before unlocking the inode. In the case of buffered IO when wr=
iteback
> +        * finishes (end_bbio_data_write()) we queue the completion, so i=
f the
> +        * writeback was triggered by a fast fsync, the fsync might start
> +        * logging before ordered extent completion runs in the work queu=
e.
> +        *
> +        * The fast fsync will log file extent items based on the extent =
maps it
> +        * finds, so if by the time it collects extent maps the ordered e=
xtent
> +        * completion didn't happen yet, it will log file extent items th=
at
> +        * point to unwritten extents, resulting in a corruption if a cra=
sh
> +        * happens and the log tree is replayed. Note that a fast fsync d=
oes not
> +        * wait for completion of ordered extents in order to reduce late=
ncy.
> +        *
> +        * Set a flag in the inode so that the next fast fsync will wait =
for
> +        * ordered extents to complete before starting to log.
> +        */
> +       if (!uptodate && !test_bit(BTRFS_ORDERED_NOCOW, &ordered->flags))
> +               set_bit(BTRFS_INODE_COW_WRITE_ERROR, &inode->runtime_flag=
s);
> +
>         if (ordered->bytes_left)
>                 return false;
>
> @@ -436,37 +467,6 @@ void btrfs_finish_ordered_extent(struct btrfs_ordere=
d_extent *ordered,
>                                         uptodate);
>         spin_unlock(&inode->ordered_tree_lock);
>
> -       /*
> -        * If this is a COW write it means we created new extent maps for=
 the
> -        * range and they point to unwritten locations if we got an error=
 either
> -        * before submitting a bio or during IO.
> -        *
> -        * We have marked the ordered extent with BTRFS_ORDERED_IOERR, an=
d we
> -        * are queuing its completion below. During completion, at
> -        * btrfs_finish_one_ordered(), we will drop the extent maps for t=
he
> -        * unwritten extents.
> -        *
> -        * However because completion runs in a work queue we can end up =
having
> -        * a fast fsync running before that. In the case of direct IO, on=
ce we
> -        * unlock the inode the fsync might start, and we queue the compl=
etion
> -        * before unlocking the inode. In the case of buffered IO when wr=
iteback
> -        * finishes (end_bbio_data_write()) we queue the completion, so i=
f the
> -        * writeback was triggered by a fast fsync, the fsync might start
> -        * logging before ordered extent completion runs in the work queu=
e.
> -        *
> -        * The fast fsync will log file extent items based on the extent =
maps it
> -        * finds, so if by the time it collects extent maps the ordered e=
xtent
> -        * completion didn't happen yet, it will log file extent items th=
at
> -        * point to unwritten extents, resulting in a corruption if a cra=
sh
> -        * happens and the log tree is replayed. Note that a fast fsync d=
oes not
> -        * wait for completion of ordered extents in order to reduce late=
ncy.
> -        *
> -        * Set a flag in the inode so that the next fast fsync will wait =
for
> -        * ordered extents to complete before starting to log.
> -        */
> -       if (!uptodate && !test_bit(BTRFS_ORDERED_NOCOW, &ordered->flags))
> -               set_bit(BTRFS_INODE_COW_WRITE_ERROR, &inode->runtime_flag=
s);
> -
>         if (ret)
>                 btrfs_queue_ordered_fn(ordered);
>  }
>
> --
> 2.55.0
>
>
