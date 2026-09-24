Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E14B7167
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277798; cv=none; b=aMeMw1CGKcv7sPkTIrQ0gOqsjCfHbMQpdnm7hSKd2H+h6XC5J1SkiyVE6i2Gmrc6uF/t8bGOviuZKhYf8s0G1nIXUaDram8pVd+3skY2fvaWYjvyZ/OE0GupzzS3rA7VVyemwhETuXP4bX24/LuUXTGNnqpDvUHZ73Yyhe35VO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277798; c=relaxed/simple;
	bh=bfuIIbIP+3mH/d/VFBwjHkPfgiDsJGdnJSucpzOuZUU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Moqpfjwp9954X5qdFEkP3lw1g3SyLTHuU/OH2DXpYJHPGg2vrj7DYnbNlNsJ0C7zpOkBO5lyZ99kW9SmM4XcXbgdas5O0jW+7a1+SczXsP6YQt4lbluT6wsSFH+nRZ284EQytkyZk4pe6Q6oCiheAQXfH6HXP6w9zYqtu+SMMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=nJwgU7ic; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="nJwgU7ic"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fded6b087so297005d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790277796; x=1790882596; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAYtf/qmYOIQyOEHHzEvy4AFMJxi24w9tcuwDjVwHA4=;
        b=nJwgU7iceyMrhOcXKnOQrFc7fX78v2D7rcZZX3vjKMw5dFBnIix8+3WerBiaiigOze
         l75e1pTIU1euAFF/mOhYy0E3v8wwIHwsePuqwJLNnK/RZZ+w8qirUOUmm9lcoH4EVQUm
         DzUIlZo1RgLlZV/sMTmZQByzUq5HXgOUseYN6pXJatHFCJCls7SDmSoekH5iWgnnITN9
         V60i5ne80xhexzJZ6X2i3uT9aa6e47shddSCkml4wBuV8igMznJLlDcjM3LYZmpSKc9g
         wzqhmKMfCA8z9o8C9E2q7YUVc4TzLbYpywZd8EyjRbXzctV4ZahiuOSX81q5fP1SPyjc
         1Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277796; x=1790882596;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kAYtf/qmYOIQyOEHHzEvy4AFMJxi24w9tcuwDjVwHA4=;
        b=m6nElAcXham0bOLx0lpSAQA5TIrn3mI+Hps+s90J6KbkUHY1/ECrvEmDEtvPrBX79X
         qR2I0i+KZqSdIdX5UYd8Vl4I9za4PU2ZIjF933rsLzXK3BsuQeqR2QcegfJDahf9mJ40
         s/YMDhqUTMSCCrcboQZVfFjs+KSzZmSaeUyD77JrIRvXetQUOeAsDj8mmj3xSevST/bH
         6kjjD/t5hO/YLR+CXoDaV5+TJRZI+v+Atr200Cl1u4WEBZvXGVcfsGSepokwUK8TNBM/
         0Yhbom12n11I09gYtkK7A3TJ5Eh6/f+QAc5Xo0wkphYhDfZarxlM5TSrLPraTGFuhO3X
         EVGA==
X-Forwarded-Encrypted: i=1; AKwUvBw5aJ3QeyNhKQEMX2bZ7VOaJMxQiu5j5+ypfAvGAyLbB5vejlOhmSJc2v7d0qAbglNzn5JTSjUnXVCRELI=@vger.kernel.org
X-Gm-Message-State: AFuF++l4Yhj5wjqtoxL+qyV/1r7HTYBeqBqQDOvD61huQyPb7g2iO4BH
	E3FXOcfGa+GLyUS173Fpp6kcpnhLITchHM+OIAAaQ5EI7XcMnW4mf87aZtoLOwHITm0=
X-Gm-Gg: AYBFou01ZMtTcuZ2Ib+AYH9FbpRq6nXWo71EOtHjBG0P34rLRe789ovotf/6fAwgE45
	gVpA2k5Qqm2EVo7Yu59QmdSs3YiuT5gnLBqtYvocm/w0F5HbLWWokSj3Sv0wKZB148Le2wAhfpR
	Ye3h4rqLvZUHVsLvqJpL6rVEkrzavgRQOV2ugiRY5/yj006W5XamCR4DDhkCk64+OQMhNrXlnP5
	ofPQiqVW2bhFtG/ScbcR5x2F2rxV3LuKA3YH98I8CKGvSNPxQQ7De877hXRbwZAp89qId5Z66Bf
	lfIg3ZDbgkyX9vflKFxojFndG3swhdSae7qro+FrPBHHpNXxUhfiAZ72tjUKx496A/fL+veRP/m
	Vtf/ETy64dHE41k6RQ4ijr/o0t75WbVfOPyyCY27K4/cTjPr/zWIf4LdOf23vJL5SHySpUOhJZ8
	xYseBr2UGTuoNC1/fZu9NMT0DcBtrjkuMrknqbv5BN7P2U5/gEA55O0lbCvNXljTfsa8Dg/2v6t
	w3PdiLmrNUg9Z9IUKY9ebE2vx/7BdL6Oas4AdO6mHU59cfCK+f1e+YmIVJxE8zo3BdrPeSshHZD
	SKMiFfThnfBdUzOg3vaPE24yS2ts8SBipjjlE5PqyD7z4+lhs9Z9+2665k2f8NmL
X-Received: by 2002:a05:690e:4383:b0:66f:c1be:a64e with SMTP id 956f58d0204a3-672ed4304f2mr1809089d50.64.1790277795682;
        Thu, 24 Sep 2026 12:23:15 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:4935:3bd4:e0b7:fd95? ([2600:1700:6476:1430:4935:3bd4:e0b7:fd95])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740eef1173sm32627d50.8.2026.09.24.12.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:23:15 -0700 (PDT)
Message-ID: <9c9fe0c7660ff1cf4fe81bb3b2c907555d8add4e.camel@dubeyko.com>
Subject: Re: [PATCH v4] hfs: handle extent B-tree write errors
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Davy Felipe <davyfelipe34@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 12:23:12 -0700
In-Reply-To: <20260924001623.1765392-1-davyfelipe34@gmail.com>
References: <c569d5f8ee542e5c86a7e4dee23df99f4ec0becd.camel@dubeyko.com>
	 <20260924001623.1765392-1-davyfelipe34@gmail.com>
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

On Wed, 2026-09-23 at 21:16 -0300, Davy Felipe wrote:
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
> void. Validate the extent record size and use a reusable B-tree node
> range helper to reject invalid write parameters before calling
> hfs_bnode_write(). This prevents an invalid update from being treated
> as successful and avoids clearing HFS_FLG_EXT_DIRTY in that case.
>=20
> Negative-path testing in QEMU confirmed that an insertion error is
> propagated to the caller. Testing the existing-record path also
> confirmed that invalid write parameters are rejected before
> HFS_FLG_EXT_DIRTY is cleared.
>=20
> Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
>=20
> Sorry, I missed your suggestion about factoring the validation into a
> reusable helper in v3. This revision addresses it.
>=20
> Changes in v4:
> - Factor B-tree node range validation into a reusable helper, as
> =C2=A0 suggested by Viacheslav Dubeyko.
> - Keep the extent-record size check local to the extent write path.
> - Preserve the error propagation and validation behavior from v3.
>=20
> ---
> =C2=A0fs/hfs/btree.h=C2=A0 |=C2=A0 7 +++++++
> =C2=A0fs/hfs/extent.c | 12 ++++++++++--
> =C2=A02 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
> index b4c3f2a31471..576412e6901e 100644
> --- a/fs/hfs/btree.h
> +++ b/fs/hfs/btree.h
> @@ -84,6 +84,13 @@ struct hfs_find_data {
> =C2=A0	int entryoffset, entrylength;
> =C2=A0};
> =C2=A0
> +static inline bool hfs_bnode_is_valid_range(struct hfs_bnode *node,
> +					=C2=A0=C2=A0=C2=A0 int off, int len)

You can use struct hfs_find_data *fd. It can make argument list
shorter. We need to find the node before read/write. So, I think we
should have hfs_find_data available.

> +{
> +	return off >=3D 0 && len > 0 &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u64)off + len <=3D node->tree->no=
de_size;

Maybe, it makes sense to check that node->tree pointers are valid?

> +}
> +
> =C2=A0
> =C2=A0/* btree.c */
> =C2=A0extern struct hfs_btree *hfs_btree_open(struct super_block *sb, u32
> id,
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index f066a99a863b..ece782205b47 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -121,12 +121,20 @@ static int __hfs_ext_write_extent(struct inode
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
> +		if (fd->entrylength !=3D sizeof(hfs_extent_rec) ||
> +		=C2=A0=C2=A0=C2=A0 !hfs_bnode_is_valid_range(fd->bnode, fd-
> >entryoffset,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd->entrylength))

I think we can share with hfs_bnode_is_valid_range() expected size
sizeof(hfs_extent_rec) and hfs_bnode_is_valid_range() will be able to
check the fd->entrylength. What do you think?

Thanks,
Slava.

> +			return -EIO;
> +		hfs_bnode_write(fd->bnode, HFS_I(inode)-
> >cached_extents,
> +				fd->entryoffset, fd->entrylength);
> =C2=A0		HFS_I(inode)->flags &=3D ~HFS_FLG_EXT_DIRTY;
> =C2=A0	}
> =C2=A0	return 0;
