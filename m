Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF8E3CB54E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024954; cv=pass; b=fvcJBdYW7SWZhL9EAFrZBNz+tw2NNNOMPwuVXqwVNtSzDoX0g1Sdynh3l0HOJe+VyR7jDC8gUaTlGbmCPHhYIIK3mAEK62IunkWxvMwJjsQqlPx5kL2Hb6RPOpKTn2BWhHApDWiqTNrJvlFjAyb/yqE9KmR6nBpjC5PLsir2AMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024954; c=relaxed/simple;
	bh=1nZofC+RTWBHaXob+KVxiso4N205kFcAazDbYywpa0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JH7GCnFeeaJMeo34Ua4LgPLKqjNxb2zLtBDlGQ6SihrmYIOH0YR4tB+FEXE5J44jGxYVpasddU/8ejSGfV2SpohEw657h/8c8tIR30TpAcTjhFWmlLX/ok81xVjrdodQqv4gEDjfUjWVPi8YpLNtpCmPs/G9qtaBGO6AwYbVOj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aojeXwL8; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aojeXwL8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740f2so2792755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024948; cv=none;
        d=google.com; s=arc-20260327;
        b=ktmESjylCkxtF7NyVpeGBNiCDyy/hjVXzX1u70QfL55ggZD4zEqL4monhhwlrR7l2R
         xEDIdALABjKGJs7YrVBwdjETkrrdhLWYXbn0fFK/6Csz2IQqwtXeTrebPfPtHGTa3xyM
         7XoDJbAfSHNN8KZEEEIdQeyQzqg6yiN67ZbeyewLRxsUHiqE4Imt39PegkbHlMttVWHl
         e5d05YCRJl+EUwS3ODHGvCwTwQhe2ei615tifSSX54N1sEAMFe1g7vn6ykR4K4VypEFw
         Z8hpEKvyBitw5wfDXjlVyxaeJ5uN55yWU0RzqVKTgNT+lZa1sUBJ2fCWYWkPKH89WEB8
         AfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5Wu7YrtYFqk2A1LMgO87zFbbXnbSNxs3gHTR4Q+xNo=;
        fh=+2e74AEO1GGuSM3w3/y319kvx6qGb/m2o+53BtPKjqo=;
        b=JhFs4+8ZC9hyfetiJOE6BeHnflAgvgL8VvvlmlBKPZ1YOD1/fBUkWWoetaVugduH/v
         HBDgYfmKmcV29dSYgQW+lay/iL4TgardX2Nu0TT/Hpx9hRk25+Dn0UH7WcAtdr1E/7u0
         3OFZgqg1ppgWkG7KRic4xaIcigYG2jryEDYMtH4mRcjCpOkQ2cJTCqSiSm+agtIXlaZX
         FAND8b2YC28O52IhaDp0iPaLxzzaYmVa/0waowDGir2RU+ZWy3xTjjeWmBfQB5o2T3xG
         49M0jIy2elCEwRL0N4nrwJcBts+rpbOvVWGKEAp4KOWVdELHkMktI18D8+c3Sj1NUVkp
         falA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024948; x=1789629748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5Wu7YrtYFqk2A1LMgO87zFbbXnbSNxs3gHTR4Q+xNo=;
        b=aojeXwL8QXposbOuDxfO1PM5NMDTdK4I/TpIe5TLaFhMnTwdJjQHmq6y20cwz44UDY
         Mltn1BppFc+RF9U4bNNdR7LszjxqoJ/r2VtHEjuaBXUuVTKyUqmNJVaW/IGZ/iDVWBUN
         Gy4R8mxSxoy+Xv92qYpNOTFdj1FYiQmoafZmzPr9jFmStiELjdl3txtz+Nnw6VtD1YEf
         783A5WdlEQQnBqmzFqra18pzr5gcJp3CJhgvsXeBoZ/N2G7SVkMiMfrz4ArJqCznmXZR
         +IvHBmmuONAptK81f91y9vOKeqS0HSf8HomHLs3fxW+ny4T1m4Ntx6E1JAax+VLIVcms
         jjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024948; x=1789629748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5Wu7YrtYFqk2A1LMgO87zFbbXnbSNxs3gHTR4Q+xNo=;
        b=jGBzlWVrCLn+M6aDLg1auNy5jVJpoKdDjCOz8Gm+I3laRfvUbPXIVX8E1R35Ttu2Un
         x3Tq6qDxxMHvVaHo+jKeENK/3xajrv4Q95zgMx8iFQ031YfWQ5/0lRjrE77LgXGXGkpd
         N7sVHylULlSr6Q+qLpqkw9nuuTln2Ash+c4SF7CAzLLEctB3lRJrmLoiz/66q4FjeZlq
         x0QDQyilDzkqG1RQALHnzb7oJRciWUOzDKylLZwKkgWlrNmzBCFqSfzQPt9P3EAuJ8r5
         YDiD52DkSogxwFiJ343kOV3zDPNopdsiQNq0/d0uYxhmzmXo+CkgLMRkfIyC6euEL045
         L6PA==
X-Forwarded-Encrypted: i=1; AKwUvBzaHkyCqNEP3XNp9F0Me4+gNEfqrSq31njvibEp7WsVOZSsHOL1vy6h92UfyuepfFia9zO4OUw5CzUmPns=@vger.kernel.org
X-Gm-Message-State: AFuF++leCBNCi9aXEMR/uf6HTZPnfygWQVeNYck7JKzHK8J1b4Bqg19Z
	OF5EOVsoBUimV+fSuTuB3KyyTkIYuZXx+RucMOQnyfii0bH4AE7s56gWx13JusZuOjrtKoO5mSa
	mVyqDNLMiKwovynxN61333LA0sH8mX5k=
X-Gm-Gg: AYBFou0tt/yp1teg14in1CoI1e3e+PtFvrl3Rol8uOGcgV0gPWZeM1uMl9EqChadf8H
	9d1NV33KwFKHGI14T0sc0x9zWvoakXyvt1W/XROW9tMdizZvsqDbCsCsJuhnXbnnyEzIqFDH0b7
	HgkcJ5hkZ89WcVGVKcnkoDPcjVL7OpJBKqiiybthHLWYXF9GfLMC2Nx2+t9YRBwo93wq9wz7Vqs
	P2Ll81hZSf7I/Y5NZclz5utuVHOJYMDTKDD9cxgbVWBGCULwjIRkvUnRwCk5kXLu2kLq8oU7PYX
	TXp3wdFdSzRyVxiDUd7kndsGWBYI2lqgcvIL0XHaivG3H3Arxn97umSc
X-Received: by 2002:a05:600c:6289:b0:49d:1da4:511b with SMTP id
 5b1f17b1804b1-49d27670d04mr22165515e9.1.1789024947960; Thu, 10 Sep 2026
 00:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910022258.3308187-1-chao@kernel.org>
In-Reply-To: <20260910022258.3308187-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 10 Sep 2026 15:22:14 +0800
X-Gm-Features: AcwNN1VIotxYcfepBaV4DRS_s_5RX8jAe5pbtNh52LTKDkYSGXp9aQO81YuJ_Jc
Message-ID: <CAHJ8P3Kah8NTiSMsXdb1PF9yA59UE+MZTg8MkcYcH4OrVQVjQw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to handle race between
 truncate and writeback
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 10:24=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> fsstress reports a kernel BUG in f2fs_truncate_partial_cluster():
>
> kernel BUG at fs/f2fs/compress.c:1238!
> RIP: 0010:f2fs_truncate_partial_cluster+0x292/0x2a0
> Call Trace:
>  <TASK>
>  f2fs_truncate+0xf6/0x210
>  f2fs_setattr+0x6b7/0x770
>  notify_change+0x33b/0x520
>  do_truncate+0xc2/0xf0
>  vfs_truncate+0x153/0x1d0
>  ksys_truncate+0x78/0xd0
>  __x64_sys_truncate+0x16/0x20
>  do_syscall_64+0xbe/0x540
>
> The root cause is that Thread A (truncate) and Thread B (background
> writeback or fsync) can race as follows:
>
> Thread A                             Thread B
> - f2fs_setattr
>  - f2fs_truncate
>   - f2fs_truncate_blocks
>    - f2fs_truncate_partial_cluster
>     - f2fs_is_compressed_cluster
>       return 1
>                                      - f2fs_write_cache_pages
>                                       - f2fs_write_multi_pages
>                                        - f2fs_write_raw_pages
>                                         - f2fs_write_single_data_page
>                                           dn.data_blkaddr !=3D COMPRESS_A=
DDR
>                                           (cluster converted to normal)
>     - f2fs_prepare_compress_overwrite
>      - f2fs_is_compressed_cluster
>        return 0
>      - return 0
>     - f2fs_bug_on(sbi, err =3D=3D 0): BUG!
>
> Writeback path does not acquire i_gc_rwsem or filemap_invalidate_lock.
> When a compressed cluster fails compression during writeback, it is
> overwritten with raw data blocks. If Thread A checked
> f2fs_is_compressed_cluster() before the conversion, but calls
> f2fs_prepare_compress_overwrite() after the conversion,
> f2fs_prepare_compress_overwrite() returns 0 because the cluster is no
> longer a compressed cluster.
>
> To fix this, remove the f2fs_bug_on() and retry checking the cluster stat=
us
> when f2fs_prepare_compress_overwrite() returns 0, so that it can fall bac=
k
> to f2fs_do_truncate_blocks() to handle it as a normal cluster.
>
> Cc: stable@kernel.org
> Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inod=
e")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index ce88092d9ce2..e1cc7185428e 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1222,6 +1222,7 @@ int f2fs_truncate_partial_cluster(struct inode *ino=
de, u64 from, bool lock)
>         int i;
>         int err;
>
> +repeat:
>         err =3D f2fs_is_compressed_cluster(inode, start_idx);
>         if (err < 0)
>                 return err;
> @@ -1233,11 +1234,10 @@ int f2fs_truncate_partial_cluster(struct inode *i=
node, u64 from, bool lock)
>         /* truncate compressed cluster */
>         err =3D f2fs_prepare_compress_overwrite(inode, &pagep,
>                                                 start_idx, &fsdata);
> +       if (err =3D=3D 0)
> +               goto repeat;
Hi Chao,
 some comments here will be easier to understand=EF=BC=9F
other LGTM
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
>
> -       /* should not be a normal cluster */
> -       f2fs_bug_on(F2FS_I_SB(inode), err =3D=3D 0);
> -
> -       if (err <=3D 0)
> +       if (err < 0)
>                 return err;
>
>         rpages =3D fsdata;
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
