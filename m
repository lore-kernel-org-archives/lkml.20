Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F60647668A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153603; cv=pass; b=n+WZ/Gss2QyAqjNi5HmUYr65BOg0JGvuvSihe/awQi7aXfcFdam5u7AfHtPheFfJU6XXwkSjslvMgxx0PbkDPOsUvgBBkrLcYNpAirNhek+49iiUJuWGd17qjKt8ZverLyzyMg0qHhFEo1PtbRq++WNKdjjF8MUat+gAJEzR7s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153603; c=relaxed/simple;
	bh=sd73B+0fv4kFWg1/BIpMIx0XVt6pOSOqH8NxgJdLnhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ok61P6gBzT6IMD9J3e2b9bf85m4BWmgELBEhSfjnDtxZ5tfiiltyAPNVnqedwC4EV1ICL0QrgqzsZMlwlNhgRoK/7mXq0U9OLbmBwp1nTDcmG/x+2ALpvjOkDo49nKlAv2YCNNMCXAv4vXm5lA0TQur7PGDjl8m4LsAsK7PK9kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MesPcnv+; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MesPcnv+"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so92390166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153592; cv=none;
        d=google.com; s=arc-20260327;
        b=JdKYZTkazjxvnEnHgNnOYhBIA3YPPk2hqeAUTHVF7DTPU80F0UT+PhOkfA1RAyP6D6
         DJKLkr3FgyBrDIE1cQnQXKjPKhb+jjC1bUeXfpApilU6W0xaXLYaNSiPvStQ0LYKUP1j
         Ky2+fxJiiULf1cnRjYw9Sa4W+bSD6pHVKqaxpnReWj+7xZgyx+l3iiyxbgCLa/6CDsvQ
         DASI/nWl+NN8s1z/btIr7FpwIGSiFVgyFOfTwatShgh2Fj5gmotQgLkLtb+MYPZv4m+i
         gqr1CIVKtCy6k9352c8Ug3xGbnOp6TuXMyIjbAr0WgcKlIx/Pwn1Af9XkP3UCHiPfPyr
         j/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        fh=ioY5WHbxDqD5Os4ubRdPBhAwEzFdDm+pXfn50kDXLRc=;
        b=VOoAVN0R5UMR3C6Mu5QcmvTZgkduZ3lMciinI7TZz3vGr63eecYX/v59Bcv2kWW26I
         Bxon8z4Z7eOA4tViqR4KBgXoMu8KMMEGSKo1XpU8edcZ4xgtPdlDcKSv+Uk4BMyPMJFs
         0VSlvbhCnWiUD9X36LxncH2ufvrmJ6zZA3YHqdpVrFP+qHbMezIy4X5V1Vh+JFHb3NZ/
         7aVgoO+ezjk841EEPOuUDbJZuTLfGxUEswOHBki5qsbXy3Mh0YK8aq15VKd1f43ZU5Hb
         J3U5BVqu7LS5+paPXPeRL59gOqKu7PStJPA0TSR3CegHGGWgQVNS2PhxWovo/f6f2Vgh
         8T/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153592; x=1790758392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        b=MesPcnv+Gj0HST6wUepYrtVQ5V4Hcj+RKx783JSHfmhvNmhigGefBfytwDZ4SSH4pl
         neb9bZcSGdYsWqrIOuOmI/9+U153HF6RXp/QJEKPtK8uM3x/fL43PRx+5cRrqgju5fjA
         cMJY7Vy9YdqldLljYwKj1EecmIZL0XLRiMsoL+wj+VYPM4PI51nOOu8ERG9YOs6qBvwq
         myuaC0myKfaBPQm9iLkYjY9XrKAJGSu4Z2q1AOpjLNTswm39CaXZ4/tcScubYNYLq7/D
         fsMGw0eK8kBXxF3FcA69rs6NN3IhAbdKpQxe1wDoTrY5EUi4Vy2iR4nPA1fwIKTDoLXQ
         RE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153592; x=1790758392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        b=PhM8CF78pSsvbT0uHDNQwcY8LxdCHTqBaXxn/j9oNyIOjNASscUVRwkVXm8936Xr18
         BmMD7aA7dKLEe3Ar3cGx4T0DGmYy1y4hTaWtVkiK5MztMXNnpNL3Mihb3fcHgd0Nfv4h
         U825lnfEkrLc9N011fNl+ftqfmK2uhCw1U6SAwfi6tJKRQ+HfAWSA1EpKbqAhWhhWy90
         EGLoc0XoG7LOLMSHDkuBcE6zId+n63zuORGOFRlESaMxzA1PD0eaThE6Y/5Jn07Usw5G
         jsRvfWDyMr0yQRJLuaK7mF+vANayW3i/BZfv+BzyoPZTwSa9I06mLpeUJs/36E7jHLya
         cuVg==
X-Forwarded-Encrypted: i=1; AKwUvBwV3jBD1RQQffNHYaDGthDhrLJgLzulVcgp754RyjpXYyvfnudmcNONATqB0uIz/kzQ76FG61ZgJSI44NY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+2T8goMz6ySc22CvL520j/6xBDAz1vMVLCYeb8OpN+tz9zW6S
	melMGcfcKa9y2Tz+R4/Skgg3f1LSWx8nTXDG1c3A0ci84h8vf1cFg2NI4T4wPxhnPL4BdWRPTfX
	bPlQiEJG0MIXRimrZw92x0FdDceCPeoM=
X-Gm-Gg: AYBFou1XoG+HaYezbUsRNrzAgq2Rj3IgDVXZo+T2jRno+rte4IlNj++xvftkN6mik0q
	d+FW5W3wiFHoZJsZDHMU8j/0E+tZupCtmMvoXBDGTXoSJur4qtfXDotiy+dxiRrk6jlpjpMKDH4
	KuvDugMqVhreuEwJIZbSQa+eNXBxyjMcELgqZkbzkwCW0zZzJG9LvbegYGQSBnBYkiElOMVvR+O
	jE4z6Catr2NudLT/X+lXnaKgdk2dyxV4JIpmsQCSd3zicAx1EjZmUjY+Ipob6ME1vSdzJ60mEdA
	lfD2UME9RiF+Fp+vjwDRYIzFyxbVDiABes5YV25x2t4X+PKCsKiEx2RiA39j8dRiurcg
X-Received: by 2002:a17:907:972a:b0:c29:f5d8:9c7b with SMTP id
 a640c23a62f3a-c2aadcc89c2mr161328266b.42.1790153591027; Wed, 23 Sep 2026
 01:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com>
 <20260916084723.877552-1-r772577952@gmail.com>
In-Reply-To: <20260916084723.877552-1-r772577952@gmail.com>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Wed, 23 Sep 2026 16:52:32 +0800
X-Gm-Features: AcwNN1UMfSu8IzUIQZOKw71fWeU3uvzM62Ysf-NXrGIr3kl704yBCqU3vyMQB5A
Message-ID: <CANypQFaFf4mGrr_pLRyPgKCTDX-0vCd0nnwHenwn1xxQSa5X0w@mail.gmail.com>
Subject: Re: [PATCH] ext4: clear in-inode xattr space before adding the first xattr
To: linux-ext4@vger.kernel.org, tytso@mit.edu
Cc: adilger.kernel@dilger.ca, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	syzkaller@googlegroups.com, yi.zhang@huawei.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiaming Zhang <r772577952@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 16:47=E5=86=99=E9=81=93=EF=BC=9A
>
> An inode can hold extended attributes in the space that follows its extra
> fields, whose size is given by i_extra_isize.  When ext4 loads an inode,
> ext4_iget_extra_inode() validates that space only if it starts with the
> xattr magic, and only then sets EXT4_STATE_XATTR.  Without the magic, the
> space is treated as empty and is not checked.
>
> ext4_xattr_ibody_set() passes the space to ext4_xattr_set_entry() whether
> or not EXT4_STATE_XATTR is set.  ext4_xattr_set_entry() walks the entries
> there to find min_offs, the lowest value offset.  That offset decides
> whether the new value fits and where the value is copied:
>
>         free =3D min_offs - ((void *)last - s->base) - sizeof(__u32);
>         ...
>         void *val =3D s->base + min_offs - new_size;
>
> A crafted image can leave non-zero bytes in that space without the magic
> where ext4 looks for it, for example by shrinking i_extra_isize.  Those
> bytes are parsed as entries, and an entry that claims an in-inode value a=
t
> offset 0 sets min_offs to 0.  Because free is a size_t, the subtraction
> then wraps around to a huge value, and the free space check passes althou=
gh
> the value does not fit.  The value is copied new_size bytes before the
> start of the space, over the inode's own fields and, for a large value, t=
he
> memory in front of the inode.
>
> On a kernel without KASAN, the copy corrupts memory: it overwrites the
> inode's own fields and, for a large value, also the memory in front of th=
e
> inode.  The bytes and their length are decided by the setxattr() caller.
> Nothing is freed and reused here, so the use-after-free in the report onl=
y
> reflects where the write happened to land.
>
> Triggering this issue requires mounting a crafted image, which needs
> CAP_SYS_ADMIN or automounting of removable media; after that, any
> setxattr() on the file reaches this path.  The issue was found by fuzzing
> and has not been seen in production; a reproducer is available in the
> linked report.
>
> Clear the space in ext4_xattr_ibody_set() before calling
> ext4_xattr_set_entry() when EXT4_STATE_XATTR is not set, so that the walk
> starts from the empty entry list.
>
> Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
> Closes: https://lore.kernel.org/lkml/CANypQFZzxTAH=3D4QRRDoqH6VAw1daAq88N=
DWiQKoM7QTOnP40sg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude Code:claude-opus-5
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
> ---
>  fs/ext4/xattr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 5c310747b965..2e5f39b710bd 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -2274,6 +2274,10 @@ int ext4_xattr_ibody_set(handle_t *handle, struct =
inode *inode,
>                 if (IS_ERR(ea_inode))
>                         return PTR_ERR(ea_inode);
>         }
> +
> +       if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
> +               memset(s->first, 0, s->end - (void *)s->first);
> +
>         error =3D ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
>                                      false /* is_block */);
>         if (error) {
> --
> 2.43.0
>

Friendly ping, please tell me if any further change is needed.
