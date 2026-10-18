Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601946D55C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320726; cv=pass; b=Th74D0MfBHUjYcwv+qBj8NTmex91cJw5AGAg2vChhiM/cJJJZrvON09VjVvBvgpm2FLb4Kg8pPQaNzi4S3kPrmVizl7a0ikOOrNXnExlJcztidUT5HKduoOa0g6Q+CaVXNPrR6TFoftNVOxtY5BhqDYuBhEE9jOWgcYxq3xPpBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320726; c=relaxed/simple;
	bh=FjAmGFb5Z/FtzEUXBBKcleHQV4GQvHQNOycQ/OdknCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzm6IRWu7LzbejoIuhNl82wBKAHouSbTIGym9FDkymwn6QHX2RlkcsQAlQEjnUGJEILKQvq78hUOtdi+A49dIMwztPZFF7g+QEQiG80WrPegfqSXPGARFyJlhXrzVL80lu6F4wjqyNgyVVXhSfmKhRbYM6UpVx9BBeVz153hRtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv5LgVKD; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv5LgVKD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab395abf79so8707827b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320723; cv=none;
        d=google.com; s=arc-20260327;
        b=L/fVTSieGQsXT0MHn5mQrNJdxIpIdZL60JNDmR2NDysEo9TJPLisC9+8kLeqrKCUKv
         9Nc4nbDexaV/gOM0gogc1fGaTWijRlfXFVO5lX+uoJm9FDelMfTnxr/GUKXbjNNpej+j
         FKQChmvDpKuAHgJLeJFv/Qlca+T3qxc3ofJU3L29F8X90wEmT6VpOARThQzkTM1Luyxf
         f2QJkrhTRR1QcgXdeRhypADLxplyyHToCklZhuRS8RddQ1v34uSCCRMMYYGgmCVBEaQf
         TRbJ5X+QWAAtfN3rnu4my3AG9DmPNgpnGT3MqTRubOfWJRiBbomS/E3GfNf0p9med5tA
         HQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=655HfIRnuBnH15jd00A0aRrEFCWU3hKV5ZzM3Eenf08=;
        fh=i+HSXmNug18ydocQZIVP0iz2dpkXcDyjc8wUSSkuaDY=;
        b=Oibi7XCJhiPr3WrMOoR+RHGSq2oU/KQ1bb8AJYL4Za+ygv7nMQqIyIM85ntHuNktNh
         2BIm8pooDhqpjvRGLKf8VnLfGTCbiL/L5nFUUvnMLZL/1b6VphahOdauh2p0QQepOpwo
         6MnAd8f7vsp+D4mV+CZCE07rnafQm0xJvOCx16PDwFdKyxwhJ81j1wPtBXYq0lVsC3Yh
         z9quDi3BSKWM6nCmBIUjyPCbqzWWOr6/HjwoRKrwLCWkrJAePmxHshxA5Wyoyuj0+BJW
         Sf8xQsoeV3ksWjtYAvBJ/QAViIX+ATMuRaf1ZgFy2Hna0T/CYudIreDqoVwpZdR6wRYv
         yx0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320723; x=1792925523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=655HfIRnuBnH15jd00A0aRrEFCWU3hKV5ZzM3Eenf08=;
        b=hv5LgVKD3t6lY0+F9pre/EjVcuMoHDvwyxlB9MQLvT/qCYncpLZkcgAwE3ddqVyPvw
         lmIc5vfKWR7KkBfvqLU5dVjazEv6ZSoPnO/9R07Y8PITVICpyTodHp3JMhqHjhpXvkIf
         iHtoyJLxu1FXrf98FMS/htk7Px8NW0zgmCsJiA2Lv/rtXBuNLPJ6/xKRCh0giTn9cH1M
         exVP3K27I7+HXR+c/oClCDK6W/o8SLEe7NxXqQk/I+tyYX+NlLahn+gw2d64sYkOqjV2
         XGCPcUBmuEp90mbzyCgwPDB9zQKdPMx6Os0tGxmbKA/W+AY/LQ0YgXNKAy/Tqrr77gJ4
         /3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320723; x=1792925523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=655HfIRnuBnH15jd00A0aRrEFCWU3hKV5ZzM3Eenf08=;
        b=CPYXd4PQdBDplWTymMynVNfHTMenF3DX1vme8g4GFPCWr5Ag9tRD/h4XDV31YXGXZ4
         varPHY0eiR6yVDhzAkPSh/DXZqtjejNbTY1e2VI8biBlOby8uYgtl1v+wT6zn+imfV2V
         x165CWHnzMj/O1LSXq75JSl785d+SaYJ/CgULAyfc+d+X6WNw4e6MTxXt3XPIiq2pdBN
         5OOlrag+2bNVgz7vPDDZEnRGjLcve5uEMjMHsgD9uvln6PRcc7FqUwdcXJJgPQXQtQw1
         scLS1MViV4abZtLFovqhf252FKoLBo8EOGCvIOK96/q4eyTyW266CTkIQCWipQLrMQfk
         K1RQ==
X-Forwarded-Encrypted: i=1; AKwUvBy636lqMQFXG4V2aaX4fuL/OrSYQoh0qHiEQbcxTmogbqRmSiwDxfUN3SizS96x6CN3knTa/g1yPnDBEkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdZSEyZgSel+PjuGKtk8hanbfU+1Dk+mPlZKswzC3m3hSAl2AT
	2LHuTtti13JAiL628/jlcA9i/XhgXOxuUcg2C2OY3JkPoM6zHTT9bJeoiuTcu5/QUIbmiqGXaQA
	kUDK3sUrI8uz2IHfc0ZRSF8Pt6tGRRWY=
X-Gm-Gg: AYBFou3hFYdZiLfLfCZ33fgvXi/hFWhxADIdxRoUwvhS7rj7Uji6I7qouzzPpHcX3ug
	hzZy1Ldx5CVYOWq33S4Xw2Tsky/zNssRQE4st2kWJhWuN/GCGWOT2A/OCd8Rx/F5mRE/IUlK9NR
	v+z4l+Xs0UKUIKzpquF4UcgrMcvj1ZHxcZc0YIschvkEc9iQ/2gwS6GjeHU57lq13XFuxwKk8AM
	6s2uCE7MB2CTgNlSPK6nSK9ot1US8LfH/fLA+QB/JVWvu/ILWMHQVCA9CvzaxCYYbT1SD+mr1RN
	3lGtrFpEPE6hZSLi9QrdCd/9xj/vFYBMGImueh8syDFdYb1VV1y3ZRhWNIu5CqFBrnWZZn8UAOv
	8rwdwqMcBUT19XXLZ1hRrern5fnXSm0rXeJDWJ62lLLDj
X-Received: by 2002:a05:690c:e20d:10b0:8b0:a587:9447 with SMTP id
 00721157ae682-8b0f21c2da3mr12611097b3.38.1792320722695; Sun, 18 Oct 2026
 03:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918010558.8210-1-kartikey406@gmail.com>
In-Reply-To: <20260918010558.8210-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:21:50 +0530
X-Gm-Features: AclHuK8aVnC8gzsDYmPb8OAIpyj3q95lgZlFST7HT3zcvet7GCGaej0KDEehlUE
Message-ID: <CADhLXY6zY5ntkQwephgK3HZAg=xGMGaiY1kywu_58FuNgkUDrw@mail.gmail.com>
Subject: Re: [PATCH] ext4: add bounds check for e_value_offs in ext4_read_inline_data
To: tytso@mit.edu, adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, 
	jack@suse.cz, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	yi.zhang@huawei.com
Cc: boyu.mt@taobao.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:36=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> ext4_read_inline_data() reads the location of an inline data xattr
> value directly from entry->e_value_offs without validating it against
> the actual bounds of the inode's xattr area. A corrupted filesystem
> image can set e_value_offs to an out-of-range value, causing the
> subsequent memcpy() to read from an address far outside the inode
> buffer, including memory that has already been freed and reused for
> something else. This mirrors the check already performed in
> ext4_xattr_ibody_get(), which is missing here.
>
> Add a bounds check on the computed source pointer against the end of
> the inode's xattr area before the memcpy, and reject the read with
> -EFSCORRUPTED if it would go out of bounds.
>
> Fixes: 67cf5b09a46f ("ext4: add the basic function for inline data suppor=
t")
> Reported-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D085a394c92518a04fd09
> Tested-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/ext4/inline.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> index ceee69a66482..2e60ab3e0db5 100644
> --- a/fs/ext4/inline.c
> +++ b/fs/ext4/inline.c
> @@ -187,6 +187,8 @@ static int ext4_read_inline_data(struct inode *inode,=
 void *buffer,
>         struct ext4_xattr_ibody_header *header;
>         int cp_len =3D 0;
>         struct ext4_inode *raw_inode;
> +       void *end, *p;
> +       u16 offset;
>
>         if (!len)
>                 return 0;
> @@ -205,13 +207,21 @@ static int ext4_read_inline_data(struct inode *inod=
e, void *buffer,
>                 goto out;
>
>         header =3D IHDR(inode, raw_inode);
> +       end =3D ITAIL(inode, raw_inode);
>         entry =3D (struct ext4_xattr_entry *)((void *)raw_inode +
>                                             EXT4_I(inode)->i_inline_off);
>         len =3D min_t(unsigned int, len,
>                     (unsigned int)le32_to_cpu(entry->e_value_size));
>
> -       memcpy(buffer,
> -              (void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs),=
 len);
> +       offset =3D le16_to_cpu(entry->e_value_offs);
> +       p =3D (void *)IFIRST(header) + offset;
> +
> +       if (unlikely(p + len > end)) {
> +               EXT4_ERROR_INODE(inode, "corrupt inline xattr entry");
> +               return -EFSCORRUPTED;
> +       }
> +
> +       memcpy(buffer, p, len);
>         cp_len +=3D len;
>
>  out:
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.
It is already  Reviewed-by: Jan Kara <jack@suse.cz>

Thanks

Deepanshu
