Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5B408623
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450740; cv=pass; b=kkUlsi2rSMRl+3LfFNSo8cWBbDgFZ2ljQcOvEyz0D5CKmR7Hnx2DRXEB9mapUdZnISVTWwpvp1ZlecpGeOghnFMk3bTTnxlxoV6bopKxpOM4MTCnSpwOV/NACUl8344fJJ+AdZ7JiigM8F/rqQoPnvtGd5Ml6OHzZThjnvSEIBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450740; c=relaxed/simple;
	bh=ctq15q9vuXdtapn+1jvjsL4Fe4jW/9k6nil8aHesrjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zu5WAiJYgjy9yVlJCdEno2WKXIE5gdoZCa42RJAW5vcQxTEMpKo8T6N7o3qIPR+yeLoL1s/6UT1AuyqxaGxkCifGDp6c07FLterarDoLvF9PHm3HRqmL0ivrm8rIQUupI2sXTwqbPbS3PffE2B33NjKG3oDc8cbG6ZBlPlrYxoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTt9GBOJ; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTt9GBOJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so4870158e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789450735; cv=none;
        d=google.com; s=arc-20260327;
        b=jxTmduTiB4+6WbkRyeBUaq1PLgHYnwctsu/d5gYzKv+CHuJR+BuZRxdzWAQrgGH0Q7
         LLXsj2b+eKrcsdpUDtCbnDMmqVTlDgyaSF/mofwTDB0mKj4seTvGVd5t+mtk21jrBnXG
         XXoPKs4P3DvhAh2OdrJ/7MT2bu/4ZMjjBkBbr5FjJ0Piq9k9ogw4KIX8vMcYXuEmHzgN
         qZDrrVXLOJcrQtvQf+1jD+viqqxsB9J9N0+GSgRockYBKP9gqWwF/O3/+W6SAjDZmZrf
         MCGJ0UaDoumMWeDCMsaJmxfPL4FT5evW3lN4Q7lVgURCqPk3ghg/DOd+MwFVnPQxZrje
         z2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jW4iMh872ncBE1163LdNJ4ys+tDD8zaqJqYzr5q/Y+8=;
        fh=EZjEM0n/2dM00YI0QR7C5tKvz5xuUYV5Dvp7BsQYlFc=;
        b=UUz7QhMRTa+FTZPhWWQAdlm7gaERm9EmFNa3u2pwKHJnRURCXrBUuHlGfd77OEkoeV
         vKiQqwugiUqIeEzCmJY56MM/qytJ+IPXGHJLiAajCo0aJQEiq/6utCInCD0+c3zwoW4P
         uB95ZFJnm8YtZJHWpWfizL5M8MDSKjMPWYyKdAWmP6N3zxh4Iwj4wdiK2g/Q8bBDMqOs
         2UzuUcBKLV47M62xVYDrfhzvBXPrU7gPDU3Ib7og6x8R3Jsmm05hy3gC26MnOkHr0vhC
         eLAedVvXwTkYMEgtVVvzDXmP0oVsomtqGG1ABD4zdqev6D4DKYUZV50S6U6uvRshXU+k
         9P1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450735; x=1790055535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jW4iMh872ncBE1163LdNJ4ys+tDD8zaqJqYzr5q/Y+8=;
        b=MTt9GBOJJynuDkjKtncKdNHF1bUTu3PVWVSqTh8ttcRSU2Ro0QPmEkWHjANz5POCYa
         FfurkZv9F05ZrwvxMk9BtNpTofnU1pWpYwT1W/fdopH1CpsBsJDez8B0nu9ovSfaRUe8
         L47KNEI2yBxzY7aXaPSuSPqoXR4fFVNIO9ANKduC8jpsWv9V8jXDU5NR463T/AAL3d3M
         yFzbgzri6f8OlhkANsVcfSlYfWyhcJIvwo41gyL8XrNGztnDWiJD/TC7HAizuTdT9TjK
         J0GCrq0i8OWoYfVaS7c1cNXP/B83UAVZgB3NlLYP82WONGV/mYKmrrUNVHxqgOE6qbwF
         tiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450735; x=1790055535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jW4iMh872ncBE1163LdNJ4ys+tDD8zaqJqYzr5q/Y+8=;
        b=VT8GMzU2WZ35QvuOfITPB3bY0If46+CdCHJj1jzPCbr+4DKnHHUVv3rAnl8GVGlagx
         Br2RtBLq6qYceUdra/wA2PY3QyiMybuGuXNKo1Tk5cN2Y0scjBq+PPz4XXy5cKwwfTan
         t9Pi1xbQLPxl3PFnqWwugfz4Fjv/fUp9Gypvp3QWGtVAyK8Wu69YEFbuI1fmsA5TosL0
         f22QASB7voAUKqCE2CErZ4lKzZz+6znD43FkoqMytXydP2hA2AA9sDyHOtLq7yYp8fZb
         hEc87Oo6JpoGvHKbNqHNZl/jhhNlW4V24No8R7ZMI++i2EY7TYu+U++G4DoxRyCGC1Cz
         AkIw==
X-Forwarded-Encrypted: i=1; AKwUvBxyJUloZLkCV9bTCMBfWSsypHoRUJlBivENlFDQtp0q9vRuu2EqKvRKW+oAFSMVWnLwmxfuUt5M/oWwNFI=@vger.kernel.org
X-Gm-Message-State: AFuF++mUurZer4OxWFNHuYmgsvHxLJDwbUHb+COpOQG1vRUrr4q/N78V
	+SmPIDC7DLVdyyH9ekjFz+shdht+29x1FAKwg34zxi7RZ9ZFUSH2jHhEFZPREFRqAT4LtXdHYPI
	Hh5EhXaLlsYjsGJ2PuavFNICCoSYqrhs=
X-Gm-Gg: AYBFou2bAYquAX/M60xrwy4zrFA6VL32v+YpI/y8Hwt70OmnTkt+ywT81637JAHcbdn
	uaJSsm0N6PKQXt18JTNQILJt8+/Iaj0kfL2MGP5FVTRMYCG2WOv+NQSscNVQGlsasLKSuz1loGA
	lTVWzWE5r9pzVOK1tiIAu0YBW436vCcIpGD8I+kPs0cuVgDfWDqDqa7B4Wq8/e2XVPv1l3PK50z
	SK59ZxCUWzwGeSn3MNsGb/bHLa1DK12kP1M2lNg0dW3nnCKU5clJQdfOrc0zeIkHg6jE4Dmy1PH
	beGtlUcRNcTYXOcfvYxLwXvxvE/GxCKCu3skaHbpbaoQkKIzhDM/HxIo3XXFHJSFeolhHtdhIiq
	aUS/E6ROfBWch
X-Received: by 2002:a05:6512:1151:b0:5b6:1a7c:59e7 with SMTP id
 2adb3069b0e04-5b8ae6af924mr1316575e87.65.1789450734927; Mon, 14 Sep 2026
 22:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914083741.146689-1-zenghongling@kylinos.cn> <20260914083741.146689-7-zenghongling@kylinos.cn>
In-Reply-To: <20260914083741.146689-7-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 15 Sep 2026 14:38:41 +0900
X-Gm-Features: AcwNN1X9ywn0xoGclv5EIhEmjFjX494HRAMx0y0nTSehdk26qA0e1w3tcGtoOgc
Message-ID: <CANFS6baYPAN8WS+5Fh8gSr-0iFraaKE2KTft6oFZPP+m3A_RZw@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] ntfs: check the dirty-state commit on remount and unmount
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, Baolin Liu <liubaolin@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:37, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The remount-to-read-only path commits the updated volume flags with
> ntfs_commit_inode(), a void wrapper around __ntfs_write_inode(), and
> ignores the blkdev_issue_flush() return value, so a failed commit or
> flush is reported as success.  Once the remount has succeeded no
> persistence point is ever reached again: ntfs_put_super() skips
> read-only superblocks and the VFS never syncs one, so fail the
> remount unless the commit and the flush succeed.  The superblock
> then stays read-write and ntfs_put_super() retries the persistence
> at unmount.  The errors=3Dremount-ro downgrade does not go through
> ntfs_reconfigure() and is unchanged.
>
> A zero-return commit is not trusted blindly: write_mft_record()
> redirties the record on allocation failure and reports success, so
> the $Volume inode is required to be clean afterwards.
>
> ntfs_put_super() discards the same commit error.  Call
> __ntfs_write_inode() there with the same dirty re-check and warn on
> failure, as put_super() cannot return an error.  The commit is
> skipped when the dirty-state sync itself failed, as that could write
> back an inconsistent flag state; a record left dirty by an earlier
> update is still committed at evict time.
>
> NVolErrors() is deliberately not used to detect the failure: it is
> sticky for the lifetime of the mount, so it cannot distinguish a
> fresh commit failure from errors recorded before the remount.
>
> Hibernated volumes: ntfs_sync_volume_dirty_state() is a no-op for
> them and never dirties the $Volume inode on such a mount, since the
> on-disk flags are already dirty and ntfs_set_volume_flags() has
> nothing to change.  The commit only runs if something dirtied the
> inode independently, as before this patch; mounting hibernated
> volumes read-only removes even that.
>
> Reported-by: Baolin Liu <liubaolin@kylinos.cn>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/super.c | 76 +++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 22 deletions(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 463050ae1b0e..0228d7429596 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -268,6 +268,7 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  {
>         struct super_block *sb =3D fc->root->d_sb;
>         struct ntfs_volume *vol =3D NTFS_SB(sb);
> +       int err;
>
>         ntfs_debug("Entering with remount");
>


The initial sync_filesystem() call in this function  still ignores
the return value.

And the emergency remount(SB_FORCE) does not drain writers
that are already in progress. This function can commit the
clean flag while a writer is still modifying metadata.

It seems fine not to clear the flag for SB_FORCE.

> @@ -324,14 +325,39 @@ static int ntfs_reconfigure(struct fs_context *fc)
>                  * and ntfs_put_super() skips them, so the only remaining
>                  * write would be the evict-time commit at unmount, which
>                  * a crash never reaches.  An error recorded only after
> -                * the remount is still never persisted.
> +                * the remount is still never persisted; a failed commit
> +                * or flush fails the remount, leaving the superblock
> +                * read-write so ntfs_put_super() retries at unmount.
>                  */
> -               if (ntfs_sync_volume_dirty_state(vol)) {
> +               err =3D ntfs_sync_volume_dirty_state(vol);
> +               if (err) {
>                         ntfs_warning(sb,
>                                 "Failed to update dirty bit in volume inf=
ormation flags.  Run chkdsk.");
> -               } else if (NInoDirty(NTFS_I(vol->vol_ino))) {
> -                       ntfs_commit_inode(vol->vol_ino);
> -                       blkdev_issue_flush(sb->s_bdev);
> +                       return err;
> +               }
> +               if (NInoDirty(NTFS_I(vol->vol_ino))) {
> +                       /* ntfs_commit_inode() would discard the error. *=
/
> +                       err =3D __ntfs_write_inode(vol->vol_ino, 1);
> +                       if (err) {
> +                               ntfs_warning(sb,
> +                                       "Failed to commit volume informat=
ion flags.  Run chkdsk.");
> +                               return err;
> +                       }
> +                       /*
> +                        * write_mft_record() redirties the record on
> +                        * -ENOMEM and still reports success.
> +                        */
> +                       if (NInoDirty(NTFS_I(vol->vol_ino))) {
> +                               ntfs_warning(sb,
> +                                       "Volume information flags remain =
dirty after commit.  Run chkdsk.");
> +                               return -EIO;
> +                       }
> +                       err =3D blkdev_issue_flush(sb->s_bdev);
> +                       if (err) {
> +                               ntfs_warning(sb,
> +                                       "Failed to flush volume informati=
on flags.  Run chkdsk.");
> +                               return err;
> +                       }
>                 }
>         }
>
> @@ -1876,26 +1902,32 @@ static void ntfs_put_super(struct super_block *sb=
)
>                 if (ntfs_sync_volume_dirty_state(vol)) {
>                         ntfs_warning(sb,
>                                 "Failed to sync dirty bit in volume infor=
mation flags.  Run chkdsk.");
> -               } else if (NVolErrors(vol)) {
> +               } else {
>                         /*
> -                        * The dirty bit is on disk now; only warn when t=
he
> -                        * sync actually succeeded, or this message would
> -                        * contradict the one above.
> +                        * __ntfs_write_inode(), not the void
> +                        * ntfs_commit_inode() wrapper: the error can onl=
y
> +                        * be warned about here.  The mirror inode is onl=
y
> +                        * released below: writing the $Volume record (mf=
t
> +                        * record number 3, below vol->mftmirr_size) mirr=
ors
> +                        * it through ntfs_sync_mft_mirror(), which fails
> +                        * with -EIO once vol->mftmirr_ino is gone.
>                          */
> -                       ntfs_warning(sb,
> -                               "Volume has errors.  Leaving volume marke=
d dirty.  Run chkdsk.");
> +                       if (__ntfs_write_inode(vol->vol_ino, 1)) {
> +                               ntfs_warning(sb,
> +                                       "Failed to commit volume informat=
ion flags.  Run chkdsk.");
> +                       } else if (NInoDirty(NTFS_I(vol->vol_ino))) {
> +                               ntfs_warning(sb,
> +                                       "Volume information flags remain =
dirty after commit.  Run chkdsk.");
> +                       } else if (NVolErrors(vol)) {
> +                               /*
> +                                * Only warn once the commit has succeede=
d,
> +                                * or this could contradict a failure
> +                                * reported above.
> +                                */
> +                               ntfs_warning(sb,
> +                                       "Volume has errors.  Leaving volu=
me marked dirty.  Run chkdsk.");
> +                       }
>                 }
> -               /*
> -                * Commits the updated volume flags if they were written.
> -                * The mft mirror must still be around for this: the
> -                * $Volume record (mft record number 3, below
> -                * vol->mftmirr_size) is mirrored by write_mft_record()
> -                * through ntfs_sync_mft_mirror(), which fails with -EIO
> -                * and leaves the mirror stale once vol->mftmirr_ino is
> -                * gone, so the mirror inode is only released after this
> -                * commit.
> -                */
> -               ntfs_commit_inode(vol->vol_ino);
>         }
>
>         /*
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
