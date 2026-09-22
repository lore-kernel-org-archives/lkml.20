Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA08343896
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040474; cv=pass; b=IkYgqARWWcWujZLerClNSphlZo67aAyleTaNDsVWZg3Wzp5u2/lpdCIUq8+jAcLZLUgh60V5PEtPjOyzpYSSLbAZJhUmsZG6n3K1ioLHjbkctjhg52DgDrVLcw2NsddYV2r5MeQoisUU5Trisb1N3DwYX0ExVYYfrJQDLSbeDy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040474; c=relaxed/simple;
	bh=4wtfyH2gbDISSQ847svY2Wn+BJSusPMW+7FuPi2R9k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdWN70KasCsWHRyVDOYA2OdN0ZANDHV6mH8+07vvfnAZkjDnBCwEAFRGo2qCBftYG/vFsa5fHS89WLBGhIFriQltXfS1jh74y6DKVhDoGMqrrGDR5pD0sDWpx5MuPzvPnxFjKqsq9dULfSUpsWoh+qeEulrI5uuxwUEaEF29rc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IasKAMqk; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IasKAMqk"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so5495363e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040471; cv=none;
        d=google.com; s=arc-20260327;
        b=blGwlpfhdKjWgoA9QjvfQs+FRw1+s/FK8aeWJqaroUa/0Szn3ILWBeH1CjyEX7pnl4
         0BCowX7tdgZS5wyHXmKEkAcQUXjqSYhW6ZYmq+elRQiMUrvwQKj/RPOecwsAR+dIlxXy
         ZBcxhiw63xhEz5JIjPE61DEwxmBkPZe6TTMT1ilStFJTOQlZPcGXuGbXccgKDz7WA5mu
         +bKXLI9Pm/JIJlSqFbTBfIf2LCa5UFYWlwBycGCVf//vqhhtN4Sg/uMjVdvopP1UEnuL
         TLvkUZsce72jXwIGDh7S0ir7owVOCPziTK858C+Nku2g/STZY59IDyUux1GN8jFJve29
         +20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        fh=3S/rB1aA0rEEAgjg4RNJSshCTThkVFdUD/Tby5vL2Hw=;
        b=aMXhtgziKaJwOnSEUmCuprBs3/RwPXlyek6wj7rSfolE2mv14m5EHl6x6GqyUpYJhu
         alyFgUzSqbeHht/XI9hnS9bd4/NLcIcADeFjxNnv3qV/hZvj5/SjDX4jcZd8JB/HQC3V
         QAXgi74l6BrA5lBqcUatGMEeyZ4tN9DkQvjd78w5r14oIrDi9psjTW8prIi/7smv8gUj
         JKLEL9MUVyX/cW1BFwdcqvAg8d5PRdHKo4YYuwe2jDVIRAFz/dDVIBtG2pPn1nbOmy6k
         xkiyxogWJ90F5Y47IgUdeM0LQuaZv3taXj/Eba2wIabGvXcXI2YtEUGY//pxrpd/qZZl
         Q3uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040471; x=1790645271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        b=IasKAMqkn9YM4UlAP8p8YtTfgQys9ubcJ66ggKw4696L92wDWAam1/+SJyLR5cFndY
         xPh7Nj3dOAJXmYlfUs9/YfF+tJC0nLF8mLB8OjMmvGstKWT2Fj8Fe+aV/qQjEugHVEB3
         CH5Rf+AZTq5nt5CoPvmmwFo1jZ03QAN0as4nwp/DLDVEpYkkYVYBz7D6qB9NNWO8vnsB
         /tnEhC2GeSF/hQf2dy/Z8a6nH8KCspDexZBDeiCtTsVjo3KEbufLdFBJQo36ewqTH4eO
         VoDTAfRfKqPaffVvcFLeIPFkCmOeVhTF9bxFBTWy3xEpqjg18NwGeOhExWIjW9atnJgz
         v5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040471; x=1790645271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        b=qDuKw+zAlrwkIcsUbCzpKT0OPbQ6az/LSjdnQ+yjUHjp98gZvhiWwjgiLz3cDYRytn
         TAisDeR4a+h4eiASGogZEI3Q8zRrKjX+JRfcEnZCsRcjQwiVfs/FTp88WkC92aDF0XEQ
         sGVyZZf5kOGqQHl5xd033yTaUvPeiGLO5f2Q+jEk7ZMvnuQFRYkE54IAYeeGDH6PMdbL
         0cjmlA4g85cyArY1aFPugVfp7f4I0RTgfykPS8ljFNvcN2TrOiDG2lD2U+8TuGWjr77N
         7tqWg1BcMTz9d09vZRre1RiNJOnQOyflZilH+Ck/U0Zg1s970uZ4J5NRHetxhFjneJFl
         usHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN5djmoXv6tZxsB7aKus2qAKJc+z+oTYZMUOK795v1kYpwXj8a/b0Ul1pZXD3OuHqTitEwmR0zNzcKzXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kp1E8eceOmuTJWP7IjZpoY5G7D2STphjnXLWSDIBn7QH6CCIMe
	h3QdWEvLrc1xvZtakJqJmojDl/f9ZT2/fjaS3AEJObzqnHbkIZBO/ME2Bb/+/6EvJZQs/mfdn7A
	Zvr+dX2c3likIj9EKYlAXvn9SdYGUazQ=
X-Gm-Gg: AYBFou3Ypw5TIp7ZGF0lRuRo4IVmcTGk/vv00m5e5TM2xcWOwG1ARXcy3mEJuf6dGU6
	sfIjKqzcyhKLclAPnOyzoDVjMMC79GnZs5ZOdq4xRWwdlFligFXGMdEL2f7t0ak+6rLLlWC3PCk
	/T1ryoVif6gTFbwrqMscXQ0LBSBGEhBowHAra5xcTY/vC1R0wdIo0pNtOK51rkbOkqSfaS7Q0gQ
	NRz86r7AgQTgUbBmr8sIM/dQ1jxEFTUWXy+iBPKz8NV9gIgfy7OcAgvuVBsAWJKhuGeOd1ChT8A
	71YI0nK9GbpIjAfnHCtJEL19iHel9z8n1lLLiV3ZaFA0J2xVqGVwIERu
X-Received: by 2002:a05:6512:159d:b0:5b6:183b:d1ff with SMTP id
 2adb3069b0e04-5b8c1848f71mr3672886e87.38.1790040470714; Mon, 21 Sep 2026
 18:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921091907.1491879-1-zenghongling@kylinos.cn>
In-Reply-To: <20260921091907.1491879-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:27:37 +0900
X-Gm-Features: AclHuK9v0-3G0OKw4yrT0tHq508ZFGF0ZOQDIAhozp-C_3rMkOzvG2J2yrfh04o
Message-ID: <CANFS6bayojT_K-8zGaZrbe_FXtRsjSoq6qTDChN6i0gi8Mh=LA@mail.gmail.com>
Subject: Re: [PATCH v6] ntfs: mount hibernated volumes read-only regardless of errors=
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 6:19, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The hibernation check in load_system_files() only converts the
> superblock to read-only under errors=3Dremount-ro.  With the default
> errors=3Dcontinue (and with errors=3Dpanic), a hibernated volume is
> mounted read-write and the mount-time $LogFile emptying writes to it,
> although a hibernated volume must not be written to at all.
>
> Drop the on_errors term so that a hibernated volume, or a volume whose
> hibernation state cannot be determined, always mounts read-only.
> NVolErrors() is still recorded, so ntfs_reconfigure() keeps refusing
> remounts to read-write, and the $LogFile emptying is skipped by its
> !sb_rdonly() check.
>
> The check itself must not apply the errors=3D policy either: it runs
> before SB_RDONLY is set, and ntfs_lookup_inode_by_name() and ntfs_iget()
> call ntfs_error() internally on corruption or I/O errors, which under
> errors=3Dpanic would panic the machine before the read-only fallback has
> made its decision.  Temporarily substitute errors=3Dremount-ro for
> errors=3Dpanic around the check: nested ntfs_error() calls then fall
> back to read-only, and any read-only transition they trigger is
> preserved even when the error is not propagated to the check's return
> value or recorded in NVolErrors().  This is safe during initial mount,
> before the super block is published.
>
> If the check reports hibernation or fails, set SB_RDONLY and record
> NVolErrors() unconditionally: hibernation safety takes precedence over
> the errors=3D policy.  A volume with errors recorded during the check or
> earlier in the mount, e.g. when loading the LogFile, also stays
> read-only, matching what ntfs_reconfigure() enforces for remounts.
>
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Cc: stable@vger.kernel.org
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Change in v6:
>  - Temporarily substitute errors=3Dremount-ro for errors=3Dpanic during
>    the hibernation check.  ntfs_error() does not always set
>    NVolErrors(), so the v5 restore condition could re-enable write
>    access after a real error.
> ---
>  fs/ntfs/super.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index f4a73e45773d..da2c8f310a7f 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1398,6 +1398,7 @@ static bool load_system_files(struct ntfs_volume *v=
ol)
>         struct ntfs_attr_search_ctx *ctx;
>         struct restart_page_header *rp;
>         int err;
> +       u8 saved_on_errors;
>
>         ntfs_debug("Entering.");
>         /* Get mft mirror inode compare the contents of $MFT and $MFTMirr=
. */
> @@ -1572,8 +1573,19 @@ static bool load_system_files(struct ntfs_volume *=
vol)
>          * NVolErrors() without setting the dirty volume flag and mount
>          * read-only.  This will prevent read-write remounting and it wil=
l also
>          * prevent all writes.
> +        *
> +        * Nested lookup and inode-loading errors must not panic before t=
he
> +        * read-only fallback has run.  Temporarily use errors=3Dremount-=
ro
> +        * instead of errors=3Dpanic, preserving any read-only transition=
 even
> +        * if an error is not propagated to the check's return value or
> +        * recorded in NVolErrors().  This is safe during initial mount,
> +        * before the super block is published.
>          */
> +       saved_on_errors =3D vol->on_errors;
> +       if (saved_on_errors =3D=3D ON_ERRORS_PANIC)
> +               vol->on_errors =3D ON_ERRORS_REMOUNT_RO;
>         err =3D check_windows_hibernation_status(vol);
> +       vol->on_errors =3D saved_on_errors;
>         if (unlikely(err)) {
>                 static const char *es1a =3D "Failed to determine if Windo=
ws is hibernated";
>                 static const char *es1b =3D "Windows is hibernated";
> @@ -1581,12 +1593,15 @@ static bool load_system_files(struct ntfs_volume =
*vol)
>                 const char *es1;
>
>                 es1 =3D err < 0 ? es1a : es1b;
> -               /* If a read-write mount, convert it to a read-only mount=
. */
> -               if (!sb_rdonly(sb) && vol->on_errors =3D=3D ON_ERRORS_REM=
OUNT_RO) {
> -                       sb->s_flags |=3D SB_RDONLY;
> -                       ntfs_error(sb, "%s.  Mounting read-only%s", es1, =
es2);
> -               }
> +               /* Hibernation safety takes precedence over the errors=3D=
 policy. */
> +               sb->s_flags |=3D SB_RDONLY;
>                 NVolSetErrors(vol);
> +               ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> +       } else if (!sb_rdonly(sb) && NVolErrors(vol)) {
> +               /* Match the read-write remount restriction for recorded =
errors. */
> +               sb->s_flags |=3D SB_RDONLY;
> +               ntfs_error(sb,
> +                          "Errors were recorded during mount.  Mounting =
read-only.  Run chkdsk.");
>         }
>
>         /* If (still) a read-write mount, empty the logfile. */
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
