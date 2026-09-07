Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065F411F95
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769430; cv=pass; b=Nls6eujBxm4557WWJuPIOleLN4Oqlf9C/WuPChAuP5h5AjqEfms7qMijOw97M5MuRdfxJWZxCupedtk87/A43FJRnQAm7Q2Ga4cxveKksOptBNLScFvcdyTCAQZnhZ4HzexEhnsNHRdeJYY9xYn9Tkp828W0y5fYWsJp1FIFKlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769430; c=relaxed/simple;
	bh=P73mL+NckPvwm0Z6UFZ/zOQtwW0DTrdvlGKhHJ+Uef8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfrS3RmpXhQw05GIjs/VcG6XGNdHFwNG8rxUYUXcgRIDA2HPSCVse81Aq+hFTXDBZgUhsozv5lFIrIWHQLpiO0sTTPsQBLEaWm4i6h0hh4s3rBaTe13Y9ybzAl1JqHkJUbRQau2T0BCAUbMJ8uUGDLJQE+iXCeiOLoOHMSixCGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSNmaaK1; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSNmaaK1"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66dbce0b639so1945276d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769427; cv=none;
        d=google.com; s=arc-20260327;
        b=i8ocSiOWAzJbeRBnLfankKO/efmN4d0Ts3LWvMWYH+GLwIS2u+R6AOgirFlIcE6fON
         GuqXwndOmFTBnUH29gijla6anZ/5kR0CWBKGwCCenn1RXreEcVXJCyPwkahekii22hQW
         6dCZKQ2emVnR1S5AYuWDT0NhBhrlGPtn+a0mev1vAUnBP2kMjNwuh5BukJuLwVKg1ODZ
         mvSM/MN/yFMYh3XQUhZnRcEW0fRDwvncF1Wzu5kmzVqtStce1AjjcjcC5Yir7qnSYmz/
         Wpiaor74GLs8trLLtkpe31mphl6uxc2zrUPDSPdGQzMeun3PLFktiv+DyFNdXOUlgl5b
         go/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RaztqRxo0uD6ze9i74Ru/vD4EDfdRaHg25tJec+1a0=;
        fh=ODqVBfiF2tLfRVEcPyaRQoFbDL5RGKDAKEt8JHksAU4=;
        b=AaYBiFooNcj/qholpgvSZd/OJoiGot1ZJReY8Jjeq8ECZTlD3o6r/VyLUy/8wb/UpO
         /Cwmnw0SkldpAQutxctWMP/6ifjfkLla5H2ijU98Txo8gfY9u8MNPlK43y0/GRyFiFtG
         lJTnQ8FZrmqpJTOpm1Iyi6sqL1tltIAl42PY1IAEUkX4ZSrGVZnldN4Lghdxe1ligwny
         /cq6FR0o/SVCP5ibo3iy9Hn2tyS9aSvNwLwcYlov8YKOBfGODc781QjdNgNwIdRxSBMj
         Z/T1cu0lzRrOuUh8byi5Tow8rW8eSpe/olkmhoWt9ZZ+3hgqPEKn5X9tLM7moYVvssk+
         rwYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788769427; x=1789374227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1RaztqRxo0uD6ze9i74Ru/vD4EDfdRaHg25tJec+1a0=;
        b=YSNmaaK1uI9IYDuj/JisTR/jCngJDl2aHIP+seKT4edLPBjfkvyjQG4II3yh9gXsXg
         2tSedZeX2VPsk//dedMvlmOxx9bPkKw5cLJn1klRtkfXNzppNC7Q++XZ395+K3vcSwUO
         Tz0Aa47l7zg41gnC7b4TcG1VdgqGX7oyyUgRDkBV1yBOL1oij3gkHhII3QawgujYj70E
         CJxrnkrewWV7dwiSTZ7yo0P2BLOy6YyTqiu6n0JMemginqkyq3zx8KyZns4mpKlyvwMP
         cTzI9XROIMDiWFi86N4KzNwXfEwjS9Mu8lWtgFm+Cujyf8tIkQx/78I/xvtUDJEwFaBh
         a45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769427; x=1789374227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RaztqRxo0uD6ze9i74Ru/vD4EDfdRaHg25tJec+1a0=;
        b=UugegELw30voTaQ6SqcoDGTJ54xOCB29CJ6KDi1ArjX8mL9lokqW7FolQ49xSL+xhc
         1gXqBQ8BRKDghXlYOg8Sw3H4p0bU2C9DrGSqfI6kTOBZNaEoXbi03AJAYEf5TRYoN9qK
         DXR37XR/9H0spd/tu5R7+3eJ4LPXqqQzdaZG51Q5i5dlmfaHAZdPRiQ3ih3DXrrzbQu5
         HHLz2RUr8tSCvfoV9lrsipAzFKi2AztysZwOTe9soP2WSUPHdtw1odIce3WGe2yR15HO
         3qCmBPI/Ypi/zWFbz0PrnnfwbOhHPXSYMkn1o/8Ol17tjaLFrm/TV5zOYTIb4GUqB0J9
         ySRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuL8YpbuWEY7FVh1XanwuZhKRxUsvirhSzVhjHaLFf1bgyO3gjl1Vt4Xd4YIQ8LmgHzviOUs2cp5TEpo0=@vger.kernel.org
X-Gm-Message-State: AFuF++lv5datXAM9V6G9ejl4J+puiN9USpL684n/dFiye5DWEPXyjOyd
	1o7jH80E/1s7NwgD/WPTnmPTP40O3DkNOcaQ2qwH7AYWXHR5qWb4V7wjHS10Bmo/2nkqxiu3WK0
	eA5HzHX+Td7me7Y0BW0vKkjrALTRte3Q=
X-Gm-Gg: AYBFou3pHX5XNFEeHVRwwQU1+3QVlgiUtOtgqrwYBTeuq/Cct65m2jRNzlqH2yX35Qj
	TYCNf5k2ng275rZwwXRubyobB3CmDaLy8TDxYfiu1gdbRD4q1RmQEIKqSuoeK3kdr0hJg/yeu7Y
	egCqTjf434hwM9MLMMJlS1nuQaiXMnTnPlJ5DiB3iq1fsrS5Qe6nN5Ved5Qvkr3anPafsRkYJGA
	uPQDMa0oeM8T/A8908tgfl8Oq6SZ92fqxojkmFGF4mSmu/WK6WrHgjMG4qNHaov6/yewfMnA9fK
	gZL52xv9AsQ5Mv7T3GK2SgS7VumvDMEfDua0VdIx68E1
X-Received: by 2002:a05:690e:4010:b0:66f:a8e8:7140 with SMTP id
 956f58d0204a3-66fb58e9544mr5610726d50.5.1788769427506; Mon, 07 Sep 2026
 01:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-nilfs2-dead-code-cleanup-v2-1-fa1ab5b0abd6@gmail.com>
In-Reply-To: <20260907-nilfs2-dead-code-cleanup-v2-1-fa1ab5b0abd6@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 7 Sep 2026 17:23:28 +0900
X-Gm-Features: AcwNN1UL-TBL1zVJ8oYPZu6IdEJ8j9pQrZKvKaogUfV_Im3LoHnPA17DgONGnVE
Message-ID: <CAKFNMo=AHjHpQdzMXtH-TbE-1OFCRmRLaOcSm=87YJYHo2M=EA@mail.gmail.com>
Subject: Re: [PATCH v2] nilfs2: remove '#if 0' code blocks
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:34=E2=80=AFPM Joshua Crofts wrote:
>
> There are two instances of '#if 0' code blocks that are dead code.
> Remove these code blocks.
>
> Additionally, remove a commented out section containing similar code
> as the '#if 0' block and unnecessary brackets around a single-statement
> if per checkpatch rules.
>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> Changes in v2:
> - remove block of commented out code (Ryusuke).

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Viacheslav, could you please apply this directly to your tree for the
next cycle?

Thanks,
Ryusuke Konishi

> ---
>  fs/nilfs2/inode.c | 7 -------
>  fs/nilfs2/super.c | 8 ++------
>  2 files changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 34e6096069ad..778274203f4c 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -342,8 +342,6 @@ struct inode *nilfs_new_inode(struct inode *dir, umod=
e_t mode)
>         ii->i_flags =3D nilfs_mask_flags(
>                 mode, NILFS_I(dir)->i_flags & NILFS_FL_INHERITED);
>
> -       /* ii->i_file_acl =3D 0; */
> -       /* ii->i_dir_acl =3D 0; */
>         ii->i_dir_start_lookup =3D 0;
>         nilfs_set_inode_flags(inode);
>         inode->i_generation =3D get_random_u32();
> @@ -422,11 +420,6 @@ int nilfs_read_inode_common(struct inode *inode,
>
>         inode->i_blocks =3D le64_to_cpu(raw_inode->i_blocks);
>         ii->i_flags =3D le32_to_cpu(raw_inode->i_flags);
> -#if 0
> -       ii->i_file_acl =3D le32_to_cpu(raw_inode->i_file_acl);
> -       ii->i_dir_acl =3D S_ISREG(inode->i_mode) ?
> -               0 : le32_to_cpu(raw_inode->i_dir_acl);
> -#endif
>         ii->i_dir_start_lookup =3D 0;
>         inode->i_generation =3D le32_to_cpu(raw_inode->i_generation);
>
> diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
> index 893a504cb80c..89fa6faa34d2 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -824,13 +824,9 @@ static int nilfs_setup_super(struct super_block *sb,=
 int is_mount)
>         max_mnt_count =3D le16_to_cpu(sbp[0]->s_max_mnt_count);
>         mnt_count =3D le16_to_cpu(sbp[0]->s_mnt_count);
>
> -       if (nilfs->ns_mount_state & NILFS_ERROR_FS) {
> +       if (nilfs->ns_mount_state & NILFS_ERROR_FS)
>                 nilfs_warn(sb, "mounting fs with errors");
> -#if 0
> -       } else if (max_mnt_count >=3D 0 && mnt_count >=3D max_mnt_count) =
{
> -               nilfs_warn(sb, "maximal mount count reached");
> -#endif
> -       }
> +
>         if (!max_mnt_count)
>                 sbp[0]->s_max_mnt_count =3D cpu_to_le16(NILFS_DFL_MAX_MNT=
_COUNT);
>
>
> ---
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
> change-id: 20260905-nilfs2-dead-code-cleanup-cefbe2773172
>
> Best regards,
> --
> Kind regards,
> Joshua Crofts
>
