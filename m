Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794742998;
	b=2wLo+XyZmcgxeDtpYc2MGQZrCIcrUioPB+rjdE4ZgRtPsvTfSYn9VMTmlHCoG+BWGumu
	 mLsl7jyDp61FdVlv5fKW2sf6YN2dAOi1bdQHx8OySscBHMW3DwyvCPOMcXhs68ahY9YMY
	 PBno1KEDBgVDwgz7uawEn3gNToetxePJisxRz4hTx0uP2sLIg5AKOEhM5ScnJKI5Jp19p
	 WeIVMqNo5s8xLHUUcMHdOdI+7KtQwxzd0QliPzKycHKPIzbcoFu7pzfOTF+rTEg9NH1EC
	 1OeWcZJFJhiWfMCUyEmNVnOw7bxJBCBOnQHpqAUyG5BeTqYBfDsMB3aknDZ/d77gBnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
	b=FWmm10G1NtE1k7euu25ra8XenUde2DHa4vout/fwvs8jrNQXXQPWZHXF+kvFxVU5UCxP
	 SRe/o0BTc9begYEBQu8sTcpjB1JtY1O5/KsP/5CFDYIK40kKtJ/UMi+2/GqjlU9Mhkbwm
	 zIeeweltrvEvsPAZvSHRaTCsnWgf+WrR3ZVpoZdWMg9BKyEzT59qLQ2iJMiMQaF2Zx3jx
	 gB0YEmhCL3ABZmXaAEeXOrKdYNp1DfUG+MsNB+M1Pyz5FbXF1cYqw2D90z1BVm6bYAzVP
	 omA9Fivkhcm3jqjFZp7SbGtvOprxPFEUcHoFoyCrbfZrNdKEEaE3KW7F1ReaYE/Pjsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgMq15ZT;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1C606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A1C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgMq15ZT
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d30639709so376848966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794742996; cv=none;
        d=google.com; s=arc-20260327;
        b=JvVf0WAx6mINr0ftTS9LeEsgV4YTJkywdJLoeaIz7+XKoCVmJ2VoCPLgYOYWJMnsFR
         E0iWbMm6hc4Cr6d1alnixt8XqXwEjkbdRAz9o6BbxMkA+E9CRohnFB/NkZgboC6U2hXD
         k0DSx0iG/F2KbA61y7sTsVAn7v2w1qTQjd+Au1VBlQLNs1WYaHVKUBJN8iFO2xUdWaMc
         1nWkPgsL84pnlyg4/V9JXEL4UEctyvNl5lhNtb3i5/QtsQtf+DEogTv2FS1WSM5isM6A
         m6MoEC/xoNvDwCw1mL8DgO7eEbE570LT3akfNnwv1PzvDhfQSBy9qv7FSYfE4kKN66xM
         LPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        fh=R+dCx5Bvpn4BTXRLjqYATNuyaFYLbTaXvRA0bDpct3Y=;
        b=bCIkmLhQ7366bj3hUXnBAyZoVgJvGa3YwM/7IucIoP4xnX9BSrNH1AdKNCmRXe1liX
         V+5UKAE5+43rsb+s/mKXMndjMa/2I1dzzWrnQrNGvwmpvGOiQJwV9Ze6SDKxuGYqsN9D
         rwZUgCFMSBT8z28a9n0a+Ms2ZGHz9bMMAbxBra7/vURrXtNyVZwVYs48Z36Pi8YkqJV/
         VBRa4yDpFtaJMoa04/RMyGmK5GVZNA94Fhi2fY7uwfSrDV3avoZjlko12Gl3XvR0F/CO
         wfbnwE0aG8enW48t9931U5LRmkEfsFZsQJX0Eim7gMVOgloG17wlNHmUfpDXv79RGs3J
         yL9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794742996; x=1795347796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        b=NgMq15ZTWXW4+TO4lims5QvJ843nwsfQ1lMyAIl5Oxdu0N1VHHby8kgomJHx+RQYdw
         eXieXjUW1jyH4u2GK/nxeM784opwix3HC1Z9JhAawLtrUBs4Xnd9H88hiG5j0GQOZ0Fz
         E5wpEcw4UpqSiNVjEkqNROa+yPrLBc8afMvhqLlhtGN9IXklieU/8LjvdeZO8TrsWmQ4
         pUuFMnyIXm1u9iAXpOP2Wn8WpH+B0wC59byObJELDhndZAdKHQtRuR21fbPoji/shbs0
         /rf9Kc4xS6lmkXOVu9ffW15FwNhYvQx2THr5xGX/jujM0uE2NkhVH9+N8UM3cybYyqxI
         Lxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794742996; x=1795347796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjPej5w11WbikcynHTF6kveEbA3S0oHjvCfUZQriRUU=;
        b=mxlcxQpkYg7g8c5E1iQN9oApE5sydVQj5QSzS4zUxiOXIGlqaSWRZcWQaqZFBTlVkn
         COzgnSgQoLwzHDf94mhZRGqvoFrq/UhjrRs3syO2LbywvI+6KmwAdK9obqVIfltp2ss5
         9g3w5Yxg7jfhCVOAT01mg+cSvMxLlOlFrQ+0ASqo6QjDoStEgvlTei1vZbEhXrXiBTT6
         hr1ewWKjGj+iLCLEN3/CHyq97ciSI0Hpc9Vd5y5Bk+EJHCryqsXqXgwJlPiFZyOQUZU9
         qWHvexsHoXwejQBj2H06bwGxcSH8PX27pTWBga+GQu2SCkAHXJr5TAfLX6BHnU0o28Ku
         4IBQ==
X-Forwarded-Encrypted: i=1; AL+hErHL7JuqgHk4KuYxpIrJIq3FcLcGkI6WXFOKDxF10aeVrnTAH+1Izl9ateNels2nVWNxaa0USEDli3BMuNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NwnqzxxHc+VVqFQnaT//mjmzOyHgY7LitJZgfhBj4aKf2YbOp
	iCS9Ikqcsv5hBRsfrFaHeSPgmD03ngzb7R+00Comt9nQG7UrZRy7/WGI5d+B631PccTRU00gLUs
	P1Q4IkQXqJ6eweQskiupixdrwh+ZkmYU=
X-Gm-Gg: AYBFou1DMfjFrnCEwBZja710eRVJs9mg6jFx9VvOc4Oaoe/KDy3vC7yk9IHY3TMlXzT
	TFS2nS9Zi1MQOjlUQhmpxRLKSHGz8wf+G6UagYdDH3Nubh4v6ZDYOVtD9ShVgoKSsBN04EgEs+t
	VyOfdVBcaNLkHxc9q8+d8uQOjp62gR5J06c+dYVZjcraIxSuE0bzqxqLvJtzZEe4hwOSZOvADog
	pbHXjxqvCcVoTQ2rQhBD8RqqWAdOorYEMNMWC39DXpmSDKHP9RHtqXfMTQXzWdU1PScsORUV91K
	/q8WBp/GxZuQ/Foc59/c+e8vPQm4y9YtBtJtexrSA4qE2jvlFTAACKbO8+M84EcErrEg5iSFuqj
	acSUCazgqM0oSxBGj4Ieq5vvMqswX6W4pw4yBOg==
X-Received: by 2002:a17:907:c13:b0:c42:e6c8:e494 with SMTP id
 a640c23a62f3a-c5096547278mr574061066b.37.1794742995902; Sun, 15 Nov 2026
 03:43:15 -0800 (PST)
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
Date: Sun, 15 Nov 2026 19:42:39 +0800
X-Gm-Features: AclHuK90wWzGoA4H29cy11pmb1JHH3C1yF5Eojyo_HIgeidC5_U6uD5eFeRWITg
Message-ID: <CANypQFYkEkoxA4vJzGd_TzoqV+_TA1nk6-ResYvG7PZ80221WQ@mail.gmail.com>
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
