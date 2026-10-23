Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792718027;
	b=HLx3FqFoajQz5+wCAOiZdicB9SmOwHx8VvyyqrmXBZPpxq0GHV2Uah0RiSg3F1AzR4fX
	 98i3nOrh93RPtaCxqyrM2QXVMoRIPN42s36bbfSIrqiqzbPTBnId0d8Al6ghdVPF/rdVr
	 p3diSjkampwBG+DkFBqxHKQKvmJfzFD1VLn61QpoGjwhVIX3VQC2BCPZxHW50/wcvYQO2
	 vE57CHDyRvUZq+qPS8b/sbESoCKRAu9cPKKG4YLmdV8YtkGQz6UOFSf0hlkJuvC61u5T5
	 Z5CzP6zyWpJmnUc89fOAHm/pDZkkBWHLnHNDjyYhF4216M2Dgzdj59n5q+0U9iZ4ydA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tG1huFZNxVbEJ8XFnOVD6N3fEf7gVxHcg8lll9mK/BQ=;
	b=iVkO4FkBs2skuxHhpBx6Z4nw2nV4Pbf4IGwxjTuNfKHWU5F5I8VIH//WHDvSq1xvmOkU
	 EeGGdiuMV7V9K4KoduYAgKeazHc/R1AZ6LTT3FNf5qOukCfMUzVFrCX9lQCoz6xMJYOzq
	 W+Twzr6vz56TdI5z6e8XBuUT+FYv5xNhw4zXbR0hwijcNqIEwcIv6LH6+Tpeuy9wcI+zB
	 kdt1ADlPudp0NAzUBy5rFSSPo6x1TpRR0ZgB7MSEBr8OQBNdZ5i8rgOXG9NRBGZ8J8ak3
	 6ezOB7WfrFASbV9zTaARxfqD/ghnNcOpQyBOi2e6BlhqGPsYJDCTQ/5mKaCHR3i7Q5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jddypwW7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1ED606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jddypwW7
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so145059f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792718025; cv=none;
        d=google.com; s=arc-20260327;
        b=CkbcdFCsZnJqPXacXBvnzWFEHBRdrqnBx18NJ/TZd0hg3jJKi7dj5hrxcdkWNV/jG0
         XLBRXv5uNSwZOkkbVr3tR4ybcKZRwHmReBB0CcS9KeUPXaPYpacKVVMWBkrzhb92BP9I
         orBgxGjgHYm8YRqNVv39JPQwjRT+5Jieqz49+qYVxpRz4WN44ITrlEfXTEIdsZQjtxL7
         XTroqOtyFqh2XMRCkCUV3cpQQLmFE2ZH8RVajeEPC+hQ6i9KZS6RdBWVVaMWjm5RIx9J
         3I0Ymg8FE4jMv69FeOVi5KE2CxqeIFTui672d2b2u4C3fZ2xWbXgSKeaqkf1NaZBXzyX
         UPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tG1huFZNxVbEJ8XFnOVD6N3fEf7gVxHcg8lll9mK/BQ=;
        fh=R64Q25v++ebj6amVcnjJQU9hnup4SaLzI1iLRGQnuh4=;
        b=jDSS7V6izqT/8N8czTmCrPbTAxqUbN74vFglVIz7218ja6jRNIWdZzCmxuPHvCo5cH
         t+Qkf5WS7TOjL8ibaTy4Hi9ddh4A3uaWqmHGMQkk9R8I7GvjJAIZqGd5Xbfonyl//4q/
         VVDufYMBWijDU6DWRdB39g5e2b2Np4FJXCLDb/eGQQmJRGA6e8Ix9HW7khK7X1Ua/DPp
         ICwEVC8+xBzNLDjgkfk9hW00hOXYGis9yJWcpnTLVHKUII5Lndt4CxB2TrEvuWYp4hN5
         6zMUWqe07KhSJkuVlNUS24c2BBZlcH6eYhfavUh3fepv6cbdy1mTGvZGwrDfH/P63T9B
         WoRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792718025; x=1793322825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG1huFZNxVbEJ8XFnOVD6N3fEf7gVxHcg8lll9mK/BQ=;
        b=jddypwW7JUppD2JCsVIJJhFrqBIKxP5XvFnlAq43nR1XVfMHjgZMwn/lLuua44C1ey
         Qban6YbojUdjUd3LZfTfgiJsiEaEqxPMbpnFR0EdlASZvyUxv2VWoJm5hSwLWBb/pNW6
         WvcDvmfZ1Ph80Z6riulc3F21Tqj/QaiqQcPNLDwSuK8TsA1ZB4sSvi1qFoPOIvpW+xPz
         R5/7+YuVUE3HvQaMaPuEHs3nFv1rI+G0Sd8Ppnmnjc1wdTWcLJavNXwBCMqeAILgyld7
         xvDipUVyeRx/PEypeHCX+zrnjXxg7CqWtm9O+oGhHG64bLKLdpBfvCkCKfF3qY+/bNf9
         58qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792718025; x=1793322825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG1huFZNxVbEJ8XFnOVD6N3fEf7gVxHcg8lll9mK/BQ=;
        b=gSYiTCLSiWc3Vi5bb+uCBUcPEoW+dJ8LoTMdXeaQqMfb+Vi4jjRR2+9IzuQTuZqFEN
         E3LmbOl+WMtQ13rB6VgKCoktY5gwH/lOcotKXJYkGmbC/sq5Shi9QPzixmQ+QOi4vDb6
         3QiMO8VauTon3KMZaQMsu0BgJZ4+iMgv5INv1TOrlJewNHJQXDnU82LDTK9xOENvQEZ0
         eoOk0FgcpJ5IKO72n/fecX4WAukPSzV0Dr+6djmXBm2MQjVJ6t3EuX7zP7ao5dDnbb6c
         7qiFurvpDaihMSx9QvNl5AxsNcMGLV1ajU+lU4jJnZtD6uCMKLZPLbn/A2HCUnw8wi9x
         MKXg==
X-Forwarded-Encrypted: i=1; AKwUvByUUAbkenGm/QYeXSKJJ5GC+5DFGUOlx6KWv3UNOuARenVtJmzTBiJXzrIggHr6ZAjVcdycruEOVriZz70=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxUD1vB7x2XxGHIsVm8KGm8lHjEp+QKDkBFTnnep8vsqoAdjw2
	OROJ6VVWaX7/Lk50UXFTel3CrcgFj3jJbyaI89JcUofizY0RIE+cjXQ8Vzo0CSGM+HZ0r/hxvmC
	xN4xeX5Bqo1Wkt2jVr8qWAn/BVP559ITviSH5
X-Gm-Gg: AYBFou2SSRmv/YW+xXcbMpdTVbRt+09dbxWWTyhAVmdBh7XIA73Gh0J4FcgdXa79Xvw
	yJhJY0aV/Pzscc4jVo4ULbWWHnapyDU8bjd1pXLFLn90/EqZ2P0lIOLENkEi+KTeTznl0XOMAkP
	SJeb3vitXOXv1SalwNu3rAV+RxpX0NKBLenZfuaj/JMSSHNO9vHp8x7+YOLXzlb2GJXGDzCXjxR
	euKc+TbLWoRDi/V8Lg7znB0kwuq9KNJh5cS1V2qgBemYW3qEiKbf+KKm1pHbyL0NGksd3++dJIK
	mPzlDQ1vSqmxErPcvhO4IVBUJH5jak5d6adwozW8e8HlG+ORq6/oXdJVPCMq5e8x6tjgM+OKC1Q
	O7CwewWbWlErsUIl/9SugrtnOPmGPx6ArD+GD2A==
X-Received: by 2002:a5d:5e8b:0:b0:48a:f404:695e with SMTP id
 ffacd0b85a97d-48e385bd508mr813127f8f.50.1792718025240; Thu, 22 Oct 2026
 18:13:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220637.89697-1-breno3011alves@gmail.com>
In-Reply-To: <20261022220637.89697-1-breno3011alves@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 23 Oct 2026 10:13:28 +0900
X-Gm-Features: AclHuK-pRUO26_pnOdG0dntPiPDuOPrxpOIYxFOQTtHB_TJBkclZoTcflgnjzSY
Message-ID: <CAKFNMomoPV87KM94eYMHNz9WG9CuAHOWVEgPbsEBUZi55jhHpg@mail.gmail.com>
Subject: Re: [PATCH] nilfs2: remove two dead '#if 0' blocks
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:06=E2=80=AFAM Breno Rodrigues Alves wrote:
>
> Remove two blocks of code that have been disabled with '#if 0' since
> the initial nilfs2 import:
>
>   - inode.c: the code that would have read i_file_acl and i_dir_acl
>     from the on-disk inode.  nilfs2 has never implemented ACLs, and
>     the i_file_acl/i_dir_acl fields do not exist in struct
>     nilfs_inode_info, so this block has never been compiled.
>
>   - super.c: the classic ext2 "maximal mount count reached" check.
>     nilfs2 reads and rewrites s_max_mnt_count for on-disk
>     compatibility, but the check itself was never enabled.  Removing
>     the disabled branch does not change the on-disk format or the
>     behaviour of the driver.
>
> No functional changes.
>
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
> ---

Hi Breno,

The same patch proposal was previously made and the changes have already
been merged into mainline in the current merge window:

https://lore.kernel.org/all/20260907-nilfs2-dead-code-cleanup-v2-1-fa1ab5b0=
abd6@gmail.com/

Before submitting a patch, please make sure to check the latest mainline
master branch, the linux-next tree, and mailing list history.

Thanks,
Ryusuke Konishi

>  fs/nilfs2/inode.c | 5 -----
>  fs/nilfs2/super.c | 4 ----
>  2 files changed, 9 deletions(-)
>
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 34e609606..c5b0e9f27 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -422,11 +422,6 @@ int nilfs_read_inode_common(struct inode *inode,
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
> index 893a504cb..d0faae49c 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -826,10 +826,6 @@ static int nilfs_setup_super(struct super_block *sb,=
 int is_mount)
>
>         if (nilfs->ns_mount_state & NILFS_ERROR_FS) {
>                 nilfs_warn(sb, "mounting fs with errors");
> -#if 0
> -       } else if (max_mnt_count >=3D 0 && mnt_count >=3D max_mnt_count) =
{
> -               nilfs_warn(sb, "maximal mount count reached");
> -#endif
>         }
>         if (!max_mnt_count)
>                 sbp[0]->s_max_mnt_count =3D cpu_to_le16(NILFS_DFL_MAX_MNT=
_COUNT);
> --
> 2.56.0
>
