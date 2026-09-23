Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34F2BE051
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161818; cv=none; b=UMiHZh32twp07YSq6L9RSCwTtHtFNxuMAvQ4qGSRRSCQ4mtjGorshr6H3WxYIn76Zw0qEMV0UipS+vnDMGUFJso/TQHQaB3Q5haPTEBYjGDlYlThqhTYJJDjt61P4frrr7tZRhL/K6gka+O+kBV5KtJP7tKEFsocDqHNqZpZTLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161818; c=relaxed/simple;
	bh=A/+Sr7tx4D5ZREKYnrRAnL8aFLsHkN0hJrmaBtU7YrY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NJG1xRlCZHSCrzVda1PfHsc764qAx65gFHKdkVsdP4pyutlr/XiLPBxGT8k0vHqokoYMPv7Q5k5YMFLnfyjUirZm4I407qJxEVc5XUIX4LYJZ/HtmdhlELPU8VbG3K57Xw12PXjNzlnmZr/JTku751WIIzrri3TnR2Qz+GNFXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca; spf=pass smtp.mailfrom=dilger.ca; dkim=pass (2048-bit key) header.d=dilger-ca.20251104.gappssmtp.com header.i=@dilger-ca.20251104.gappssmtp.com header.b=mgy7NTI/; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilger-ca.20251104.gappssmtp.com header.i=@dilger-ca.20251104.gappssmtp.com header.b="mgy7NTI/"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so527027a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20251104.gappssmtp.com; s=20251104; t=1790161816; x=1790766616; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z9avEEAnjpEf+bLzxYVfU8riO/8xZqKHcMVkzWtu7O4=;
        b=mgy7NTI/3R1D/3AMop0EXt9y9YxnWS83VYR5w+jlL103Ij8Ux9J6/pMqy1NX9kHZOD
         BmFw4rtEZ2ImFnunwfOPOly/2BwNZU7j8d8BdD6pmw/waKumV4YZDzg2MplRfijSR27J
         9we+PEQPMrUUxuaPUL1h2CJEVTa9TBswXl5c1oMUwXgawturPgJ8e7LDFWFYZcmQsEZX
         1Mh83c2Rdr2/gH9j0L1OdogEKgEvodNMnTfPCce0oVoK3uPV8eJvk3GiifUek6cF1E1h
         usLT6KVoW/djsoQaqzoD+hg/7zCUKajZikNywpWPQXawUrN0p7fP2ekpZartx7MN8mGd
         h9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161816; x=1790766616;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9avEEAnjpEf+bLzxYVfU8riO/8xZqKHcMVkzWtu7O4=;
        b=DzQJtAWEbSgYYGJmCHG6lIHbu5QbRCPB2EMeJx1zfo8kKOroxf8SWKwqhZtaM/aHAb
         yHlSJZDO86cdNn61aC6dVChNMKv/+rzWjexvbWMAbLfXKjnSvxuhkuFH4leeHp3COSp+
         1qT8ctt/7D8y70z+lZl3AjBfVwTJK4SFvNstaMg4n5HV7njDeCd2iGBT2RuoECf4K5vc
         ukS7FC8E6Zuaa2jKDdjFBjAEPybdd4zjY9rhSZyYgdLCZcKWjTWPc1fI+Xg3DSjuOA8g
         ZctwZnQGgIqZ0SM9fI1FHNGv0NwCLxUQzS/hEIP9vhasyO2u0U+BdEZl1eSvqqktmK2D
         iUvg==
X-Forwarded-Encrypted: i=1; AKwUvBz3vYjSCoxO/eDnAguK76koh0guVb1DbdrsLXdwODShgaYB7lh6PBSAlbg9yTb4VQKtfo4noSe9sI+6vCo=@vger.kernel.org
X-Gm-Message-State: AFuF++n295cfdMp9bHuX/m39+ZkBz2Uq6kMi6ejM2T0x7ez8lEE4+hT4
	Wo3ktRB4eA8naAWAw8ay2CthX8K4IRNo3xYtyQnQ1ZnW0nlYvwa2EubgmdMCSi5uY1o4rwHwxNh
	fcGLY
X-Gm-Gg: AYBFou1fOB2Ct43bNFR2rt4T7YDoZkRa9V6qG8hz1+7DB32dLdgMsRuygtg/Lz3EUIR
	G4d2fvZcHEcnKT7JHW4VeTh2KzE+c9YBFR1lNiSF7xCg/TiN+8db3xBpdxDyaFhU/rrPjA52faf
	ucNsEOFKfBMsLCE4eESSPFklUSAhjw9hGxvZPzH/zJVp4QpzBpBZzWHWFqrk2myxyu1/LjTRU8W
	WMSWcgqBAVpCpJSkjPAgs4TBK6umyedPoUKnrrOSVeHZWCA3QS0nYHPb+KDIA5dMthAVVtv6LKv
	099esmHlkE5anCL2jlLHsJPl98Pyj+og4rDBAsycw++6wwBIUxihT7JKPD0dCAuq0shMcnegva8
	E/02Qef4WZT3cxvLKVG5A5kA6nZmOeq+JsNYSBbW8+nVx1WNhDBrmd0cD8O7eudLFYNq6H2dlKF
	2You3r5B8ZmImqO6ZI4ek3qU0c6VhcNwq37KFrh6j8+8JKbH5vdKe0RS1lkbXIrOAmvg1iVa1dv
	3wETuhAtHZZoDvgSIm38rlpLqK5g0BZZMOESlMHv+mrNPHGFzYqfFkLWYe+IqvX
X-Received: by 2002:a17:90b:3806:b0:3a0:4146:2955 with SMTP id 98e67ed59e1d1-3a07e693c71mr1949123a91.61.1790161815923;
        Wed, 23 Sep 2026 04:10:15 -0700 (PDT)
Received: from smtpclient.apple (S01068c763f81ca4b.cg.shawcable.net. [24.64.171.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db882a5sm4644779a91.1.2026.09.23.04.10.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:10:15 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] ext4: clear in-inode xattr space before adding the first
 xattr
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <20260916084723.877552-1-r772577952@gmail.com>
Date: Wed, 23 Sep 2026 05:10:03 -0600
Cc: linux-ext4@vger.kernel.org,
 tytso@mit.edu,
 jack@suse.cz,
 libaokun@linux.alibaba.com,
 linux-kernel@vger.kernel.org,
 ojaswin@linux.ibm.com,
 ritesh.list@gmail.com,
 syzkaller@googlegroups.com,
 yi.zhang@huawei.com,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <50CE75D5-930B-4DD6-B0DF-7B956EBA0A62@dilger.ca>
References: <CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com>
 <20260916084723.877552-1-r772577952@gmail.com>
To: Jiaming Zhang <r772577952@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

On Sep 16, 2026, at 02:47, Jiaming Zhang <r772577952@gmail.com> wrote:
>=20
> An inode can hold extended attributes in the space that follows its =
extra
> fields, whose size is given by i_extra_isize.  When ext4 loads an =
inode,
> ext4_iget_extra_inode() validates that space only if it starts with =
the
> xattr magic, and only then sets EXT4_STATE_XATTR.  Without the magic, =
the
> space is treated as empty and is not checked.
>=20
> ext4_xattr_ibody_set() passes the space to ext4_xattr_set_entry() =
whether
> or not EXT4_STATE_XATTR is set.  ext4_xattr_set_entry() walks the =
entries
> there to find min_offs, the lowest value offset.  That offset decides
> whether the new value fits and where the value is copied:
>=20
> free =3D min_offs - ((void *)last - s->base) - sizeof(__u32);
> ...
> void *val =3D s->base + min_offs - new_size;
>=20
> A crafted image can leave non-zero bytes in that space without the =
magic
> where ext4 looks for it, for example by shrinking i_extra_isize.  =
Those
> bytes are parsed as entries, and an entry that claims an in-inode =
value at
> offset 0 sets min_offs to 0.  Because free is a size_t, the =
subtraction
> then wraps around to a huge value, and the free space check passes =
although
> the value does not fit.  The value is copied new_size bytes before the
> start of the space, over the inode's own fields and, for a large =
value, the
> memory in front of the inode.
>=20
> On a kernel without KASAN, the copy corrupts memory: it overwrites the
> inode's own fields and, for a large value, also the memory in front of =
the
> inode.  The bytes and their length are decided by the setxattr() =
caller.
> Nothing is freed and reused here, so the use-after-free in the report =
only
> reflects where the write happened to land.
>=20
> Triggering this issue requires mounting a crafted image, which needs
> CAP_SYS_ADMIN or automounting of removable media; after that, any
> setxattr() on the file reaches this path.  The issue was found by =
fuzzing
> and has not been seen in production; a reproducer is available in the
> linked report.
>=20
> Clear the space in ext4_xattr_ibody_set() before calling
> ext4_xattr_set_entry() when EXT4_STATE_XATTR is not set, so that the =
walk
> starts from the empty entry list.
>=20
> Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
> Closes: =
https://lore.kernel.org/lkml/CANypQFZzxTAH=3D4QRRDoqH6VAw1daAq88NDWiQKoM7Q=
TOnP40sg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude Code:claude-opus-5
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>

Looks good to me.

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/ext4/xattr.c | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 5c310747b965..2e5f39b710bd 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -2274,6 +2274,10 @@ int ext4_xattr_ibody_set(handle_t *handle, =
struct inode *inode,
>  		if (IS_ERR(ea_inode))
>  			return PTR_ERR(ea_inode);
>  	}
> +
> +	if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
> +		memset(s->first, 0, s->end - (void *)s->first);
> +
>  	error =3D ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
>  				     false /* is_block */);
>  	if (error) {
> --=20
> 2.43.0
>=20


Cheers, Andreas





