Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B31B3B47D2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362384; cv=none; b=MyDGmqSNA5bNinDsNWM58yw+QTlBlfO/nULJR/Mn5BVAODhAYrtHxKEdGMKXL3IfPj5ubJC22v3Q3FyBSziBhnenPxKV+4m6K1Ch2OpuI9KCjGO6hVXhMtnmuOvnZbAEB3y2GSbdZgG1vcuHmNX6OjB6dLv51zilTunK+C8cuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362384; c=relaxed/simple;
	bh=HZ1uS4Ztp/kpaJV81Cqsa1rld1hE4jRS46xc00lJktw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Of54UxbQT7Xx0QTy43Md7ptzKTMBZgLi8XJXhF5luoBirNWPTCvAY0iewWOV96gWs1P2IiTXgziXMQgBwH/c0FsA/N9xUA+au6HDB+IYJCDv1KT7YjJT2MWee7lxyvkCG0mIaGyoyFc+LpT0ppcN3VB08bBChC6VOnsLOp3Zj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=r7wdJO6R; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="r7wdJO6R"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-670fee39d73so1420868d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790362381; x=1790967181; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z69BO/Df6V0dKG3zd2qrXV7G1zoKXPuQSKKdUYUrsL8=;
        b=r7wdJO6R5hu6Af/iA9YfYaIOmM8il7EDgJdCd5K4GTANX/rGxpJyaqAOK4IAeKgVW4
         9Kp0TAq+G9ZD1YDJ/g+JRm5I4Ge3aYYYQeo2DOcBW7uT27T8/aDYPmTllsC6AzG/RZ9P
         mo0LTNKk+D1p7WaIpMqEK9R2myNVHqxJSy4QfpHEiCQ3Z/QV5clQOoxq8wt3VYIF3opL
         YhN954wVqOOssZTx3Hkp2CZVAaxvgRI+MPMrqYhGDzmARMgmBHWnbuRb66prHnk2QrQi
         S/87BUyAa9bnhZBzC2jjuXbHYEhNBobHribu7eD9Z8483t9gfmt2lUXsRpkKyts3LDng
         Dtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362381; x=1790967181;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z69BO/Df6V0dKG3zd2qrXV7G1zoKXPuQSKKdUYUrsL8=;
        b=ryV73WrrbKSRsAJE5b43aa31VS+WlZDvs8BeeIvgcMiVj5IoFqNJaU0OFOgpjWeiT8
         iz0RHmFTSQmeEJRE72OdqvQiH7O6qPiOD3umfGzxBVBAri3uMrlCva+cSpg8QEg3Y7WG
         uvm2yMdEwKKrhG9YgK/905BjndUr3KfUAApfdtIYya4ehneKxYbfJc/jMiW5UmAy7m3G
         cLOH/rb1/FTV3wE4+c6mk896AG5MjZEUdeysQnYXxzp7czhvxMqZqdBCpdW53yGXuwoP
         vHXepLkEiDMWbhdyajV9xuAKmwq0ZyAFf0WmCW4jFC7CZMWNaN1kNamBdBu87h9HmX1Y
         i6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzb43RUoRw/QSSpxcyV7nlHqxiJi2pr+mXrVxaalme49ju7EmIzMrEn/0DVuOSd25l+62jX02d7XR0Ip4s=@vger.kernel.org
X-Gm-Message-State: AFuF++kpItfxVMSDkkKUkTkkEjmnka8K2QET2Dd6iDTS/UuS54lzLu61
	lzycRnfJStBK9RXpfmw9Vx4O1P67qMvCmAmOxSbrZjwFQP0szxhfQTCQqoAVMFkflYI=
X-Gm-Gg: AYBFou003JCP8HVIYA1U5HmMdCp4nq1jUaZaWt8/GUycqwgR+GJ0iNsJ9rQd3BDdKD1
	DzdgtNEmJn3jraXd+VNhrhw7nyq8L8vb/Tzp4MYzCZd5+sWritipQFjF9lQaZbWtAz1xpQ9Tf9I
	RV8X6jz/VIu8sJJ2aqbmdPHlhslDnif9VHFFbaJq+MZILcW/GnjUfB0wCU7Ke4wW/63CptncmVm
	d6Zjezg1QATfD6z9xAqvecrqi4vRZ9t3DmDNA4h5c5CwMOx/IkZQRcTRdbvWmQLNUxUN02h0hX1
	pwpQ3BveqbsKZO/Jdfr9t4feYBMMoq5/ie7AOYTnW6WNsSn4l5D/4llmX+Kb27x1buDK0Kwy+k+
	y8f48nT3mV+LZlWh8cjmZ8cXa+P6YMIX4ILRmePr5BV78u93+aQjv4J8sctjKukrCtjFbz/jxhv
	lCq21wIRmZCFFH5h3m3qQX+ZAci0j8djwUEexvtwj6azmw24UNXYLpnBKENnYG+Q/JC/cAHarQ/
	fnse9zzUd/+CTwR5/jFcKrMrnH91qH2vwabNSI/300+uhdWNwVV85gCkSHEYbgs0w2a3+aGTsOV
	/8Xl0C8HTbzHU0/hymV6vXZdTr5a+H//oWwd6ZkMwH/OF8BvoePfOMPgQPJnuAyH
X-Received: by 2002:a53:e651:0:b0:671:1ad6:5639 with SMTP id 956f58d0204a3-672ed331ccdmr2763979d50.40.1790362381065;
        Fri, 25 Sep 2026 11:53:01 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:2dbc:64a3:86d9:3cfa? ([2600:1700:6476:1430:2dbc:64a3:86d9:3cfa])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740ee940a0sm1268097d50.3.2026.09.25.11.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:53:00 -0700 (PDT)
Message-ID: <3a15e99669fa36e3456e59920061be03bd7a06b2.camel@dubeyko.com>
Subject: Re: [PATCH v5] hfs: handle extent B-tree write errors
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Davy Felipe <davyfelipe34@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 11:52:58 -0700
In-Reply-To: <20260924231054.2175660-1-davyfelipe34@gmail.com>
References: <9c9fe0c7660ff1cf4fe81bb3b2c907555d8add4e.camel@dubeyko.com>
	 <20260924231054.2175660-1-davyfelipe34@gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-24 at 20:10 -0300, Davy Felipe wrote:
> hfs_brec_insert() may fail while inserting a new extent record, but
> __hfs_ext_write_extent() currently ignores its return value and
> clears
> HFS_FLG_EXT_DIRTY and HFS_FLG_EXT_NEW as if the insertion had
> succeeded.
>=20
> Propagate errors returned by hfs_brec_insert() and only clear the
> extent flags after a successful insertion.
>=20
> When updating an existing extent record, hfs_bnode_write() returns
> void. Validate the extent write parameters before calling it so an
> invalid update is reported as -EIO instead of being treated as
> successful.
>=20
> Use a reusable B-tree node range helper that takes the find data and
> the expected record size. The helper validates the bnode and tree
> pointers, entry offset and entry length, and ensures that the write
> range fits within the node.
>=20
> Negative-path testing in QEMU confirmed that an insertion error is
> propagated to the caller. Testing the existing-record path also
> confirmed that invalid write parameters are rejected before
> HFS_FLG_EXT_DIRTY is cleared.
>=20
> Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
___

> Thanks for the feedback. I updated the helper to take struct
> hfs_find_data and the expected entry size so the bnode/tree,
> entry offset and entry length validation stay in one place.
>=20
> Changes in v5:
> - Pass struct hfs_find_data to hfs_bnode_is_valid_range().
> - Validate the bnode and tree pointers in the helper.
> - Pass the expected entry size and validate fd->entrylength there.
> - Simplify the extent write path to a single validation helper call.
>=20
> ---
> =C2=A0fs/hfs/btree.h=C2=A0 | 19 +++++++++++++++++++
> =C2=A0fs/hfs/extent.c | 10 ++++++++--
> =C2=A02 files changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
> index b4c3f2a31471..ab7a7c65a126 100644
> --- a/fs/hfs/btree.h
> +++ b/fs/hfs/btree.h
> @@ -84,6 +84,25 @@ struct hfs_find_data {
> =C2=A0	int entryoffset, entrylength;
> =C2=A0};

Mostly, I like the patch. But I have some cosmetic remarks for
discussion because I don't want to change the patch without your
consent.=20

> =C2=A0
> +static inline bool hfs_bnode_is_valid_range(struct hfs_find_data

Current name sounds slightly not natural. :) We can consider
is_hfs_bnode_range_valid(). What do you think? Maybe you have something
better in mind?

> *fd, int expected_len)

Do we really need to use integer for expected_len? Why not size_t? Any
particular reason?

> +{
> +	struct hfs_bnode *node;
> +
> +	if (!fd)
> +		return false;
> +
> +	node =3D fd->bnode;
> +	if (!node || !node->tree)
> +		return false;
> +
> +	if (expected_len <=3D 0 || fd->entryoffset < 0 ||

If we have size_t, then we don't need to check that expected_len < 0.

> +	=C2=A0=C2=A0=C2=A0 fd->entrylength !=3D expected_len)

Do we need to check that expected_len =3D=3D 0? Should fd->entrylength !=3D
expected_len be enough?

> +		return false;
> +
> +	return (u64)fd->entryoffset + fd->entrylength <=3D
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->tree->node_size;
> +}
> +
> =C2=A0
> =C2=A0/* btree.c */
> =C2=A0extern struct hfs_btree *hfs_btree_open(struct super_block *sb, u32
> id,
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index f066a99a863b..4d65943d1117 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -121,12 +121,18 @@ static int __hfs_ext_write_extent(struct inode
> *inode, struct hfs_find_data *fd)
> =C2=A0		res =3D hfs_bmap_reserve(fd->tree, fd->tree->depth +
> 1);
> =C2=A0		if (res)
> =C2=A0			return res;
> -		hfs_brec_insert(fd, HFS_I(inode)->cached_extents,
> sizeof(hfs_extent_rec));
> +		res =3D hfs_brec_insert(fd, HFS_I(inode)-
> >cached_extents,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(hfs_extent_rec));
> +		if (res)
> +			return res;
> =C2=A0		HFS_I(inode)->flags &=3D
> ~(HFS_FLG_EXT_DIRTY|HFS_FLG_EXT_NEW);
> =C2=A0	} else {
> =C2=A0		if (res)
> =C2=A0			return res;
> -		hfs_bnode_write(fd->bnode, HFS_I(inode)-
> >cached_extents, fd->entryoffset, fd->entrylength);
> +		if (!hfs_bnode_is_valid_range(fd,
> sizeof(hfs_extent_rec)))
> +			return -EIO;

I am started to guess. Is -EIO correct error code here? It is still
operation in memory and we are checking the correctness of struct
hfs_find_data content. Maybe, we need to consider another error code
here? What's about -ERANGE? What is your preference?

Thanks,
Slava.

> +		hfs_bnode_write(fd->bnode, HFS_I(inode)-
> >cached_extents,
> +				fd->entryoffset, fd->entrylength);
> =C2=A0		HFS_I(inode)->flags &=3D ~HFS_FLG_EXT_DIRTY;
> =C2=A0	}
> =C2=A0	return 0;
