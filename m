Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6978509EF3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746306; cv=pass; b=XvZQUhtGLICOhv9o5NH4CJstR087lNE1koag8n3aWhtF8ZIuXnFzG6ghNNHbCVRHz/85rGdSIeZFFTO5e8DlUckTOpgIXmJUhlIlwEfRb3WzBM936HhF6K389iRVR8wEURve19niXaAQ3dD8rW94wE+ctjZUyCsG6GmTTAKyouQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746306; c=relaxed/simple;
	bh=0/1+4lJRG/Hkv6PdUL67hZJoHTNmoGhPPghynZYaz+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouGG8wiF+5kMtkkz8NBfVmXWkwRcsflvwhjJ2CrUIa3BZqdWUNjwDlzN+hiezU/uRXwq5deMsb514BKzQPSa2d5rKIB1YLFNMbvWERkjFiJ93cOF3MdF3SVDEek+1rnLYxbyrORdFkBylDoogZBTpI1erLlaSgicklILcgNAEwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN9c9dUC; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN9c9dUC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1144649e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789746302; cv=none;
        d=google.com; s=arc-20260327;
        b=rSFgbMpfxf7XALVl4euViOdDtWXrW2VP/3e/OPgnT6dqNmWs5xZEPM8t+OSFjO8nvA
         ZNA37sW7Gm0I0qqwL5WohqfO59gklnv/n1RONGrMO6a5WXjp+N1Kmrvgwsaw4ZP8Muc1
         MDTgEiS21ySvehUdCQEMzaAej3/9UPo4TVr7fTXt87gg/PNy+hD3+DbZ8VJjikjVZPYq
         div0fSogPqsxKlK9LqYbymYFPKnR2I/1o4+cacXsuHzId0morz2UuxZHw2rEduaaPehO
         K7N5b6rjc2L+C/mE8trmA3XbEPyhseHCgxP6AV06UoZ1Filkhm9nEVUflc6J3MqXYRqg
         uKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M849De+JfrPs8EHvjdLAqoSNF4UdGYALe/nW+DKp+kQ=;
        fh=SFJSdLFlQrPRnt0C5YkkYXcBd1qrKB68E1ARRYdqGW0=;
        b=b3DyQrwxxGrRV9friZNX0QormNQIgALNJbzXvvRI4OPj877EoUqfHVph/FJUJcxEZ1
         eNKYTmwM3LVWENy7h9XGfPn45biQy+Bh5yoFjfTmZ09kViqEzJp8fdEq3+a+8VNz/zGM
         tslSxxp3y2h6OkZxPwBl09bGvqJUtQH8K3aKMaCWbNCqFpHAA6bkpHGIGKlxKdBHyzml
         Xl32mPZK7CLZbBpLI2A3JvY1UvkhcvWPEvwoc4SS8Ob1HRudRA6jO4bTzcWvoQ3qUVvB
         ftmVQ+MF3GL9lpExncEGOyGviX/9Q+cwTfGZrzwoG2nO1CebBtJXUeC8qXqgQK4JF6o5
         SVsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746302; x=1790351102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M849De+JfrPs8EHvjdLAqoSNF4UdGYALe/nW+DKp+kQ=;
        b=rN9c9dUCTI9ToiFMxQfilOfTl96zquqW8mheYkG2SBFD7lbxkBzwUiyptMGlJYr5U3
         hOTpxqHWkGu6GVbkCibvwak9iwAWO7gq6B7kWV5NIl5FVGwiQ6jPwuD34zlL81DITyNb
         kQ/vY4zhzgWfVi0feesRv6Sfx2QSN/rbf/HSRL38PUPVzdkF0LaR+3GCj+g2ksycVDJ2
         lKfghT/rrlEccuToZDjTkliZDRSObjT/JjS+9axFdJlmuKTilw4RshGlfahJBykIHZZQ
         fjQ9DLzW2yzyoqPGhBThGf5n0rgst44yI2JbymtBEiG9Xk4biJCMXtOw5+UF/Hqbpi29
         c8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746302; x=1790351102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M849De+JfrPs8EHvjdLAqoSNF4UdGYALe/nW+DKp+kQ=;
        b=tVclAsk4Du0J/HBFZYGTc0xm7R7QKPXfpMyodfLijkCr0KTIq9BQj1tsVSDRXkvuiv
         lhKF5qWooff/CQKhlJYtsL4dRn/JH83ld4A8mSyyNsH9yr6otTjU8OYQudZWM3oRb7xX
         iYb98N5VY4G2emBFmdzo3QBmVoF6cIGKw9gVOnf7/UUszOxC5pfJwCY+4Xl7rr2hMelc
         /62ZikIiYhbIWG47mYYpvRV1tyC93MCNfFc6cDFVibBHYN2LXx2JubeMpRvVpZke9fnh
         r3+YbGZ8+fIYg3ZA8rMXgolDYwW0C5i1vEgjX2lQ0UjmSjn7XraliJmhP8y4o7uYhCAr
         5MyA==
X-Forwarded-Encrypted: i=1; AKwUvBxLHG5UIssA5Vv1CgIwvlcyf1pv/8TN7ib/AuZSfDZa+f+qtcCuHAatTWueBIoBXHPrT57DkSpOUau0CnE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwXnH9R1B9mKYwC7qhLs0DhagHeVfZbyRR1GzFNfJKcf50gou1
	9B3AOPEep/WmrO+PcsAaXg4txGxfXkVSl+c8YzjbPtbARlMVYN3jJHIbyKjzDoeLWg/nDhUJIeR
	L5wJbSBHqca4WPO15KlB34p3I9p9R/g8=
X-Gm-Gg: AYBFou11RX20QhM6cRLgR+0ZIEsvlqyG7WJxvqLbksZmQPyfansClS3jbk8Km1/f5XW
	+vqi1b1ryU7ohy+T920nhYo3P4vvMxFS0OXQ8WobN2tEXAJV9sjA/hDbvGLHlAbQkda79P1OB0I
	qDlCGKZpuyUOJdLOZZVstAbU1V0nXTX34B3g8wZz+eQxncyvwyxUxx0zsVqhkKP18QA7/vAiRJG
	Ra8gIgBd4awYV/8qJkRclnAPyqz7WiGpWVCK1MdvYBEaAfY7Cw3q/sJYxcl3V36MGrBd1AFWl13
	zmIshcSIv0Eyvk8LW+IBg6swNc4blcbQIaMvBKdn27eMQ8kiVepylg12
X-Received: by 2002:a05:6512:3da8:b0:5b6:1a80:865b with SMTP id
 2adb3069b0e04-5b8c198d00cmr959162e87.66.1789746302161; Fri, 18 Sep 2026
 08:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915111351.2726334-1-qwe.aldo@gmail.com>
In-Reply-To: <20260915111351.2726334-1-qwe.aldo@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sat, 19 Sep 2026 00:44:45 +0900
X-Gm-Features: AcwNN1X8ej3rRCLkfczv2RVOrS0_dkKqsBj2-sWdfA8x3U0GxRBrhWL40nsH-Ls
Message-ID: <CAKFNMo=0hDANOd+DxxvKA=RNbiG-zygkWh6EUC6Vr2MYe4npLQ@mail.gmail.com>
Subject: Re: [PATCH] nilfs2: validate file block counts during recovery
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:14=E2=80=AFPM Aldo Ariel Panzardo wrote:
>
> nilfs_scan_dsync_log() trusts the block counts in each on-disk file
> information entry. If fi_ndatablk is greater than fi_nblocks, the data
> block loop can consume excessive summary entries and the later subtractio=
n
> used to derive the number of node blocks underflows.
>
> Reject inconsistent file information entries before consuming their block
> information.
>
> Fixes: 0f3e1c7f23f8 ("nilfs2: recovery functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
>  fs/nilfs2/recovery.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/fs/nilfs2/recovery.c b/fs/nilfs2/recovery.c
> index 4d5a6aa521..6e4e0cf4cc 100644
> --- a/fs/nilfs2/recovery.c
> +++ b/fs/nilfs2/recovery.c
> @@ -322,6 +322,7 @@ static void nilfs_skip_summary_info(struct the_nilfs =
*nilfs,
>   *
>   * Return: 0 on success, or one of the following negative error codes on
>   * failure:
> + * * %-EINVAL  - Invalid block counts in a file information entry.
>   * * %-EIO     - I/O error.
>   * * %-ENOMEM  - Insufficient memory available.
>   */
> @@ -359,6 +360,10 @@ static int nilfs_scan_dsync_log(struct the_nilfs *ni=
lfs, sector_t start_blocknr,
>                 ino =3D le64_to_cpu(finfo->fi_ino);
>                 nblocks =3D le32_to_cpu(finfo->fi_nblocks);
>                 ndatablk =3D le32_to_cpu(finfo->fi_ndatablk);
> +               if (ndatablk > nblocks) {
> +                       err =3D -EINVAL;
> +                       goto out;
> +               }
>                 nnodeblk =3D nblocks - ndatablk;
>
>                 while (ndatablk-- > 0) {
> --
> 2.43.0

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hi Viacheslav,

Please apply this v1 patch instead of the v2 patch.

This function is called as part of mount operations.  When format
errors are detected during superblock reading or log scanning at mount
time, returning -EINVAL rather than -EIO is in line with the mount
system call behavior, so the v1 implementation is the correct one.

Also, please replace the 'Cc: stable' tag with the following tag, as
with the previous patch:

Cc: stable+noautosel@kernel.org # Non-fatal bug fix; defer backport
until a real issue is reported

I actually ran a test where a pseudo underflow of the nnodeblk
variable occurred, but no issues that compromise system stability
happened.

Even if nnodeblk becomes a large value, long-duration block device
scanning does not occur; it simply skips the position and abandons
roll-forward recovery midway.  Since the mount normally succeeds, if
anything, this silent failure is the issue.

However, this is based on the assumption that the file system image
was intentionally tampered with (anything goes) with root privileges,
including log checksums.  Therefore, as long as it does not break the
system, I do not believe it meets the stable kernel rules for
backporting.

Thanks,
Ryusuke Konishi
