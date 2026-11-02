Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793626091;
	b=hecY+9oiU3uwd6IoHpGpYaShxdC1jSq9nEHal+c4B6a7IZxuYg44UyLhGikRo3gZ+MwS
	 Yb4VXXy99rw7n17SmFdYpuyui6RW8qIWdp1odB34K5BeWbRkNhbGlTGuJ7N/zXu7NmUUW
	 v8uCeENEaH+G6YZhCLxIl+R37kfnGmUyw1HI12WB9hKt04LFaXbMS0BPbJnAQ7Le+uAr7
	 7i121VbOvmoKpXdlUG38uai9yA185KhaUjYcHXZkMA4Z3ukMMTISB8menFL//YG4XnlK+
	 KzoXs9202bztyZ1E270ga2xvahuYGzKnpVYlPy2UZzzS8FPn5UaRb2T58pzpJ88utng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
	b=Ax0oXJ5KsdpI9g/mZ284ZbKcLKfo2PB0+WS3wWuWOs7Q5Zpae+jAUnBwhelDOvEKzGdC
	 sgM9H0Pso1kGHanMcQDPFbwpFW3nLDUZCl6MTl0a9tA1IEKD9p2etaHoOGNK8LPcMSVQD
	 0pi+coviDh+oyEqh/BWWyC1kN8WzLb8w7qpb6JTTdRp75+C+vsSht421KmUXw8keyFNvm
	 257T9p/FK9+j7e2fGccaAltvW4x8E1W4reWCSbn7R3AHUpb+G6M/y/RNKNLeEnwOt3BP6
	 TZDmpB2FGkueiYcsIqevLmVeMVKWTUabWnr+7YH+YAqzYQt9fPWOG1qeHj0yrZVcQdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYS07XxP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C03606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C03606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYS07XxP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4322d310e7so490776766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793626090; cv=none;
        d=google.com; s=arc-20260327;
        b=cM0f3jKf8Rt6vTB+zdoYAHLlpNQoWKcD621MHYZXLUHS+Ru5K5osregO/Ca3POg8P9
         I7YM6TuHu9Q4ayUzFKyKKWmrneFR41URsu8DIa35fl0GSjiQeLo1ND3J167IO+pcSORs
         3wxUe+JY5xn3AluTgqgN9FsZ2zi/OCWHE3EaT7S8JEdaPy9pSH3973fDXVovp5kEAS7E
         IWQ9pvLxh6NbBda3EMhA7T+9JAQJlHcKUsO6qBQwdpvCg2C9zifEaiRZs/e7x+AJOsRf
         i1CRvXsQ1ociB16aWwarIm+0ZVQ7DpOQHkNNUsAPLsqquYluCL3T7kqhXNz5ujQH2SP0
         5rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        fh=slz/sHARPdn6iEfbrU3MF2vPnEvfHIfNHMUu6VN4zE4=;
        b=RzGHuQaWSdGdgWB+L5ZMxvYQDswidD34CGUP9+1tOtd0tn4eMN7YoOCU7zNWNb38VV
         zK0yIyWdKbvyrrnOky9zQy0Ub3Lvf7br+wYT3j604mOD9WtxeQpCMgCrcqiPB5vSqnCF
         nyY+PRTeGTqhQHInllUrqS7NUQS1XN4nMgi6LuloiXUvZSjaJsn8VBqEkwioB/0n0G+u
         IcqVMzqMTZec7dsrz1f7K5aB2STriJp+p9NYgEjIrFbsKqVM7+h8oLKS1nB1HFD5JdeL
         xcWTnpclwUndF4OJOY48BCbunEUfG1UYOUu8XtOa4AW8sYH398HmrwLnByKhqPgv72me
         9Ebw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626090; x=1794230890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        b=eYS07XxP8utYTK8HWQxrIfweY2AEeSo05MdTGi9bbVESvlC58yszyY6JPLobaWZfxc
         imk/gxvuIXAaaTqV46KdtWmW3Q1ueQHZpbb2oWgLi8gNn6uXtkdbIzybF0KYsU5j+ayW
         aKmXNPi+TN8LKEygHmb6+CngLX/IJwGYm57T1XXuB/0Hwxb0BVyeMHl6mO+yjqoQM26r
         QIGMCxuRZeD0eC9omZ6Wonuh4ev5nNkK8FsviHCI0KaI33iz9G45ISt/6jkeihUvAQhw
         AZzS1P60h62yvfPoc/o74f7YuADHPSqe7dJKIFt5i7QNTmMya1RJRdwQUTAclTJTikIQ
         PtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626090; x=1794230890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        b=KPqYCAz1MM265AajOTdBC40RH/rurh6H6+AzThfr/MlH+2PqI/ixfjhIHBVlbUqxFX
         /CoWQCUAvMy1jQA3A8/9fL57veKzJ4+cozucE0VIt/6jfxnkFt970Nk38KTi8xQQ/S9z
         DL95iXQPhfO7hSooXfAe3L97fKz0VIkc5HMUK+owU4ZK2C08t/3FzEtsVeW+v3FA7SZA
         DCxuQn5Mif9KydpQD85AEx3CFaKzhiCzXd4t9oFBpeKXLkBR3M+YAASWhEUKbOp93LiJ
         /flwjYo/EZe/755sgokjJKEcsdZ8frN10FmAEpMyr56DDW3LiFEKtdw2PJcI0M8SmKvY
         kPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3jTMTpNdUzcl6jLhhgT2OQjmIsOKR13ZeykyubzmzTHnhA01t0nfJoWGTeM/lNLdp18atwaxinSFTQjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3M2/N6BEUBecnfYp6p8rU53NYy3gwV0WG+m36zHFYt4J+yvSf
	k18qnuAs/MCq3+O8S8wNHfJpsRjrjaOPoI6SXKic7TvcpKXTHWsbOVjXl9UgmoD+FMF7HZITe5M
	pzwn0U1wfMT8Skp/AHBU5af945PQweC8=
X-Gm-Gg: AYBFou14u1OpRhfEAxfxDewzjXLcKoc8G4nc4lnZojY4JjFGSn/a3mQd0v6YVRgDh34
	fHKK/xWOpa6BADueoNMlHVw1vLDRozC2ZW7vNIze9oqnv+ZLUzVd9IHf49iFORsuPxrY8nTbyLA
	1pEzAvQf5x+LbSX9q5t54Yp5duGeC1ulbLGHB2/pdp2Kjj1rAPZocXksxcbvYyA7+9ijViB9BcU
	c7Zc0pJ/Feiaboxr7sIhgiEhhh03Cd6perfknCAQ7Jr6aHYYIAoUh6KPv3DRM2jiZSrGGKntBEC
	A9f1TTKlsXY1B8UOZ1AqnJkFEKbs0biiHTdDcMPUYZ4XhM3I9Lspf0ZOue4T0ehw2GfecxRGId2
	aaCusZOMv9IchX2ZqoyycKRXnlA9OIvY9rrVh0aY=
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c4ca793bcd1mr794308466b.1.1793626089392; Mon, 02 Nov 2026
 05:28:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021085635.3633692-1-r772577952@gmail.com>
In-Reply-To: <20261021085635.3633692-1-r772577952@gmail.com>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Mon, 2 Nov 2026 21:27:28 +0800
X-Gm-Features: AclHuK8kt_THxReORpsQp5Tyrq7frAGmxk4veLrbcHUVI_TWp6z1LJSbwSMGjP0
Message-ID: <CANypQFYcKGJP7BxP-UAiKUXQ2Uw+H06WJY7kkCxuVQ742QbK_Q@mail.gmail.com>
Subject: Re: [PATCH v2] ext4: clear in-inode xattr space before adding the
 first xattr
To: jack@suse.cz, linux-ext4@vger.kernel.org, tytso@mit.edu, 
	adilger.kernel@dilger.ca
Cc: libaokun@linux.alibaba.com, linux-kernel@vger.kernel.org, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, stable@vger.kernel.org, 
	yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiaming Zhang <r772577952@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=B8=89 16:56=E5=86=99=E9=81=93=EF=BC=9A
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
> When EXT4_STATE_XATTR is not set, zero the first 32 bits of the space in
> ext4_xattr_ibody_set() before calling ext4_xattr_set_entry().  These are
> the bits IS_LAST_ENTRY() reads, so the space is treated as empty and the
> walk stops before reading any stale entry.
>
> Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
> Closes: https://lore.kernel.org/lkml/CANypQFZzxTAH=3D4QRRDoqH6VAw1daAq88N=
DWiQKoM7QTOnP40sg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
> ---
> Changes in v2:
> - Zero only the first 32 bits space instead of the whole space.
> - Add a comment above the check.
> - v1: https://lore.kernel.org/lkml/20260916084723.877552-1-r772577952@gma=
il.com/
>
>  fs/ext4/xattr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 5c310747b965..8e1fd26329d3 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -2274,6 +2274,14 @@ int ext4_xattr_ibody_set(handle_t *handle, struct =
inode *inode,
>                 if (IS_ERR(ea_inode))
>                         return PTR_ERR(ea_inode);
>         }
> +
> +       /*
> +        * Make sure xattr space is properly initialized so that
> +        * IS_LAST_ENTRY() returns true for its first entry
> +        */
> +       if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
> +               *(__u32 *)s->first =3D 0;
> +
>         error =3D ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
>                                      false /* is_block */);
>         if (error) {
> --
> 2.43.0
>

Friendly ping, please tell me if any further change is needed.
