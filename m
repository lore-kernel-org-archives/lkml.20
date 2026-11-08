Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104105;
	b=PoHS6KLuwVbjosomUFtb2bs2/nhftOLnktkZQgEiY7Kc7YN8j+a2+GFqsxGR/se2Xgxd
	 4ASgoj1royCucR/l2vwgTCpsSFxfPqQvkJim0UwTbUhDSiwiducdc1vG3b6ld4zGtOmuQ
	 s/nXML3w8LJSwrvM0nf1In17PlBbtoT1+NtlONe0V6gZvkilS4hSY4wZcjzuODCA5u5eh
	 LQ1KOsM5s6YEGECZp2MedeX+pDlp95HLmOXgAiSULOPzboAhqvFKjYGXpzDkL/HMZ8/X2
	 YX9zZ8WjqOGEwXNSCHvWxWOqYJpzwIyvZe6GBIQ2Z9kEgX1DLq/US7lhZLOKU8sDRhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104105;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BfU5/83XMXk0vM+uXaProIt+1jhnjU7VuIvTMIQ6YKo=;
	b=Hx10txkpPon9A+jfRYytGliVZ4WmbQIdKRBojYIInQ1f3DJD38AE1976TnRxaU1TVJIX
	 H6V6IfFOJcZ7iWNFi1XB6csSvmopMjS0naiXvyLUXeXpOSHByL4Zl9QPu910xgbHDBSaK
	 w/fDICeoLPMoRLHx9iK23HG1nqY9uBSJ0WfLUdEUYDA6RMr5g8FlrlbqS5v3uRJmBJR+x
	 twFv/yP7Pop8zPJ8L23+hUdNdhIvxvB/jWod3SV03tDrY1NU+TA9aeigoH7eqBy6i/hHh
	 C+gpfrGHEveX5xF2OxsvF7tIt1FP7ZNLFNhzMr1UbAuyjOka6lRi7P2s2YsG9f0KUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkGfn0Ql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD1606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkGfn0Ql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE871F008A1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794104104;
	bh=BfU5/83XMXk0vM+uXaProIt+1jhnjU7VuIvTMIQ6YKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VkGfn0QlyZsvuucMwnPKKPtM23/4pXeYbSBLCzaeUn+g6J3TB9+xIcxnmz3HTfOG5
	 zxrHP9IBxjRBVngIT1et/p4zLOZ7JTPWK0FC3s9aWJO+BnzAudY+OHn/2afLIjbmKk
	 N7/eHR4w4yqjQny3PVf+CVJhxIuGcFO8+2BCys8SkKhUbNBFc2+V7BHi/V6nRlq7+s
	 Z0NWCFCL83YFXdPBOxdvxoolMvgc84MOxk9UE9PNM2wL+d86rllvVhuVFqcKQMe11z
	 /7bNt4jOwBjVR36W9Za+cTm6YGQ9RkXUwh7QV6BDW/RhMAE+h4dMD8GSqgu9Dtg3vy
	 Bn8s7MqRGUu4w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so134972a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:15:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzqSMMJlfILHm3KaxIo6SgoqkTIyhS6fc0FHw+hDiFwLIoX6xtNWgeujrvXL7+y3/nfhFrAd3rHGzjlRyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9plDr108IwL7Dlck4IvDEDFb8w6VeAhAE9646Z/QdThwXUS9jx
	gb7MoRNjrx6OztZ553IpRkhL/2nwwN9k7b4wt8AUQ7k+ve8plTmhR89SxZDrxdz0foryjx28mvw
	swnbOwzDg7RZAsPjBWFcNXlXTDQ85p+Y=
X-Received: by 2002:a17:907:72d6:b0:c40:560a:461 with SMTP id
 a640c23a62f3a-c4d6d7d2fb0mr28458866b.33.1794104102530; Sat, 07 Nov 2026
 18:15:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
 <20261107192836.3908453-1-wahidzk0091@gmail.com>
In-Reply-To: <20261107192836.3908453-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 8 Nov 2026 11:14:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8LEoxzxZWO4ZMPTdLyGmKttOCuM-Snz23w7G=v_pj8mw@mail.gmail.com>
X-Gm-Features: AclHuK8IVXVsA_GIlZwkq86xN9S60haSS0KaSG4vU7bO7a-vVlnBg7_8thvU9sE
Message-ID: <CAKYAXd8LEoxzxZWO4ZMPTdLyGmKttOCuM-Snz23w7G=v_pj8mw@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: open a named $DATA stream by name when making
 room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:28=E2=80=AFAM Wahid Khan <wahidzk0091@gmail.com> w=
rote:
>
> When an attribute has to grow and the mft record is full,
> ntfs_resident_attr_resize() walks the other resident attributes and
> converts them to non-resident ones. For $DATA it always opens the
> unnamed data inode of the base inode, even if the attribute found is a
> named stream:
>
>   tvi =3D ntfs_iget(sb, base_ni->mft_no);
>   ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);
>
> value_len is the length of the stream, so it does not match the
> attribute that ntfs_attr_make_non_resident() looks up for the unnamed
> inode, and the WARN_ON() on entry fires:
>
>   WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
>    ntfs_resident_attr_resize
>    ntfs_attr_expand_locked
>    ntfs_expand_for_write
>    ntfs_file_write_iter
>    vfs_write
>
> With debug output the values were attr_size 13 (unnamed $DATA) and
> data_size 550 (named stream) for the same mft record.
>
> It does not need a damaged volume. A file with an alternate data stream
> whose record has no room left is enough. The fuzzer found it through a
> single changed byte in a file name of an image from mkntfs, which made
> a write grow a resident attribute in such a record.
>
> Use ntfs_attr_iget() with the name of the attribute for a named $DATA
> stream, as is already done for the other attribute types in this loop,
> and keep ntfs_iget() for the unnamed one.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
> ---
> v3: open a named $DATA stream with ntfs_attr_iget(), as suggested, instea=
d
>     of skipping it (v2). Same change as v1 of this patch.
>
>  fs/ntfs/attrib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index ce7c1b524180..c92d1b06afc3 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4933,7 +4933,7 @@ static int ntfs_resident_attr_resize(struct ntfs_in=
ode *attr_ni, const s64 newsi
>                 if (a->type =3D=3D AT_DATA && !value_len)
>                         continue;
>
> -               if (a->type =3D=3D AT_DATA)
> +               if (a->type =3D=3D AT_DATA && !a->name_length)
>                         tvi =3D ntfs_iget(sb, base_ni->mft_no);
>                 else
>                         tvi =3D ntfs_attr_iget(VFS_I(base_ni), a->type,
This can still deadlock with a concurrent read of the named stream ?

Thread A: grow unnamed $DATA          Thread B: read named $DATA
--------------------------------
-----------------------------
hold unnamed inode i_rwsem               hold named inode i_rwsem
hold base mrec_lock                             hold named stream folio 0

ntfs_attr_iget(..., stream_name, ...)
ntfs_attr_make_non_resident()
wait for named stream folio 0                wait for base mrec_lock

Thanks.
