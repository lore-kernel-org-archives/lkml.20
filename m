Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794750128;
	b=IFsAuWa7afzqLGspJFuFeGD1+BiIVAN8GjKfuSPlV0Mv3TtPfCxO5oiD2kwZ0mJ25IQf
	 DVHYG5FHdLvMayOz97XJkMXd0fd7voeNNfn6lTtdgURzzUWTa+4yD+pztSMBd01eXDjCu
	 5+OiLxftPYyNwsE4i7X3aIdjAF7cwaK5LP0gXJRo45yxTVzzxaSAE3BflA/iniUvouAuQ
	 W13/AZEpz4+5WVcbk+9MV6LBggCmcfY/HuT35IfdmakuVOykx8NHeInnmAt2I6iTvGo0Z
	 PccmHqvbtDCrT1QPN34M6TBxtQJM+OpvyEI82fcExWOPk+5inG3T5BebWCA1EwuOcNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kXgOszMYn9vK+uSp/j0C+iMdzMuEkTmBUqbfaKTOQBo=;
	b=L18rDmDKZjoBR71p39TkLh3q6qS3dDVQ2OGPe4/v11ECHugIeg2dajw7oTZKKIOSLjmH
	 8BdBL6z78mO707roXWUeLwABZivVyJSB98rc1d5rcPnZPywUbWbM8O3FsPvJGVeCO+IqH
	 p8YHSskSdAARjjOJoNg9Z43Hlv48JRRYWl7vJcfXAccrCjGT13Ocw6XvOSoJo+lpydxeR
	 aSBO7G8ButTg+a7pMTPJgxX4FwFShBXELY8ieV/m7nhFxDplirzpmDxEsOhwhCx9SMh5h
	 6r8EnUXMzv6dJlhpjtJcQcdXxUH+BWvLIG7x16PJ6dhO4vYb6HWKhEgyDLVWgYgga7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7mssDJ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FB606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8FB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7mssDJ3
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db3a48dc6so232866d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794750127; cv=none;
        d=google.com; s=arc-20260327;
        b=T5TFYsNxOGJKb80mdlSGfbet7tdGM/W2wDpdZ7Y+5ae6BxXqQ91zs8cpoj24tkTePF
         ntzu/DKpOyfgSo7ewKrFHlyUCgLyo8Lzdst8NcOLxTjwOuFetERk5Lvm29tnTwsTFEZv
         kHx/TGwmsHy6HEqRvP+BkDqJkneJsVAQt030cPT5VOZ3mP5ILCL7Xix3euULiX3ADGnJ
         P7KSENYxCvQumYhIQvzI89vrJOdSosoQ4D7+W+bSKTittLwjCHHEG4dB/LO+rb7AxZrO
         dhewzw/T3gcoYzmTU0cmf6k1QKVcP3sWvEz2CbEFxiwnfsMkWz+wS6ICSTtUfVpV7PYz
         hpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXgOszMYn9vK+uSp/j0C+iMdzMuEkTmBUqbfaKTOQBo=;
        fh=/sjKCbyhJUHlK5y95+IvysQVIN1335K3oi4phFwJ+s0=;
        b=qpEfFIMnmGDWq5Ot/I/oE3kmIG2xYe7K7ayColGMVTUl4ljogNeYJXDweQG7PMA8e0
         Sley84SNHr2gtW3LLS7GtgljPrgffgoqxw9/GfNsRX7rrbce8tNGQvoXONTj7sgBsqcc
         UBmJndtY0BunjtFeYBkaIUaLUGj7AXzXl/ebSy+F+sqZOg0IbQKAZP5acuQMAn2QNhKA
         Pu0I07UW//ipHSF7jxWRhI1VI0UDKHBucww9Sb7a01uReGUAcBpD1ZEh8B7EHkxumxnI
         4JPoeDOFWQ9CxkwxC+0BVIQUSaKulhIDBxZl/RyG04T1qVOabU6kOSsxzKLSRoe6+3Kd
         h6BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750127; x=1795354927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXgOszMYn9vK+uSp/j0C+iMdzMuEkTmBUqbfaKTOQBo=;
        b=I7mssDJ3NnJGjrjiAlTuGzlQOls7EGpkW/QorZHSD5CdoTPbEedp6w51bSWrnKLllT
         zrkwNYSmYr5TnEHen44G5z20e+6YiR5FR8p/rgYN8WjLtHdY7poQc9lkdS+2ZQWJiX3R
         8JP4zbC+UcSUWur4TKseb7YKCGbibOSXMRskOqmWyAb6mq+8j8XJAvqX0P1PFiVDkQwI
         BzeurOPpDogKjZoUGWKZdSQ8IoyfRJuRefVkO1UlgTja7o38EcqZNXZYSMXe5fK+7D/+
         47evuOMCrS4qiyo6o0328o7ktYU9Iaz9715kqeG5wuZ0F3jT+8UlKS/ivps0AKiaxxOz
         /t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750127; x=1795354927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXgOszMYn9vK+uSp/j0C+iMdzMuEkTmBUqbfaKTOQBo=;
        b=PhaYUZ2LIS8va/aoBfNF3VC5KgBYZ/AoM9JD+7f5qMMPIVkHkXIcbcA7m8FCmjH2hJ
         sqgrldXD7JFWPDz8b7cQr0N+h1Im0jc/my7CKHGlg+ApVPudnXGr6oHZYlbIuV2+Rk8G
         1rtEDMijmMaAEHQo22kKoMiqNp0M8glgp7ydXh23gZ69Wud+Q5YQgB9HXXR7PHZkI4W4
         4VS1Q6lD4PMXg9yooyrV4f2O22EcmpFTOTjBJX3QSZP9bJtvLO7j1zvmdTpezOawZ8QD
         AqTfDfLFbwBe9co9dhlNvoffiX8nksQIdjYz6c1wK2IXtydMwwL3j4qb2r0EtRgpSzTW
         dVlw==
X-Forwarded-Encrypted: i=1; AL+hErER6/hPkMJuFFKLVJAbgsrH98U3AQS29e6RX+K2/CRPP49ny4Jz4I/vP0yvIwb04U/S4cvo4oWzLi6riU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RB1UuxHZqach9epjuJs5ZwD0iX95eOohjgFA0FGx3oD52d/Fh
	HA3xtBA4rzdx/yl6H7N71D0cQ3XknP/neaYktuFzZuk3eDTpVVdD/tRvw2PYOM/uEWTkpiIQaHV
	VXsR2KzPA+b/JQ8LtL5YpqRDRmZSCGYA=
X-Gm-Gg: AYBFou3ixkFueyPK+iU3iMfoSZ0PML4efb4yS71Ocmmp+7w6FgsXWzBbnDap+ByX813
	pGtI8u8FtnN6XqEiK3GmeqYAH1/eOMXkIL9Ng/qYWzQBaXsl0umtBvtbA9U3+WA7F54gNvRECyg
	DWGoEMvFIdxRIQ8fC9bH56uYpZ8d8ABP/d6rHODlKNQiIdRJcJvQCSPwHwr3ReWzb3axLQtj3hg
	t96L++HHbYRD8T1LRYJ4IkyOd5ShE5E0Di+onG90QqIMtL6YZL2ekIed8AeuIDfC5sFVGpw+Dx/
	lWipCIXopUW6/vJmrH+9e+H80PMoaq3dxN3vBYLgBSvn3tBrXmc3pFLNwqgKXENigRpcIn1pJFT
	QhmlaGTWAW0X5n4wYPOKXVtAIeZOOdT0yd81YkOhvcwPwtqart2ZnFgYWZq90mfOrR/sSEfxEj2
	4sEVu+cL18wAX1O21LHhRtn+PEuM8R58LTi1+S4Yn72ABnZKSaEDrlYNIlkSkjS3NsMrhMX7nfo
	I2d1PcFg8IhzEmHp1bx085U/ffzOgyh
X-Received: by 2002:a05:690e:191d:b0:678:1568:ff75 with SMTP id
 956f58d0204a3-67d89636822mr3858621d50.38.1794750127402; Sun, 15 Nov 2026
 05:42:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918010558.8210-1-kartikey406@gmail.com>
In-Reply-To: <20260918010558.8210-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:11:55 +0530
X-Gm-Features: AclHuK8jBWUIo96es8EY9xf4B-cOCsZlKh1m9ctTav1JYjSyzaFWf7NxJLRiF6o
Message-ID: <CADhLXY5Z4JVPWfYeKVL_nOOW55hdb-9ZurdBR7TJadhdZh0+Ag@mail.gmail.com>
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

Its been while I am following on this patch. Please let me know the
status of this patch.

It is already reviewed by Jan Kara <jack@suse.cz>
