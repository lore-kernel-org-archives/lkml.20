Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAF44212E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769590; cv=pass; b=Hks0ruMeBSmnK5aSSUunK4yMm+H+hW7FLuIntiEfPARv8QN35v024v3yOuPGdGKuETREdTjMyVDzOC9p8WiP65iJOS+8CVLwvP+stvT5B/m4AY0CS+sD32TIjGMmv1vjUApSxniDF41vm6tj73Dph+in8sZd5ZU+mdgnf3PcHF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769590; c=relaxed/simple;
	bh=ipB2854ozcHKVg6XH2YQAsN4u0CkKe6GvPHBMmTx7DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B35QjI8I1DnjECfRsO+hWDbSUbbYI57gi2Nn4QnV739QktfTSSkomVUi6hrDeGyWCVd2AP1U0pCYlKBbzBtkkR06I+8boqddXQ/f8SgSLWL8CAv4xikrD3JA439vraYOa0b3GudqMi0IBZdL2OjGEW8FSjOAAfO3LEyitlp8kFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2xdKXpd; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2xdKXpd"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66dbce0b639so1947053d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769588; cv=none;
        d=google.com; s=arc-20260327;
        b=N9FG9IyuilVmhPJaST1853U2fx3Gnip5zBil1Q7IpSZLg48F0NFwWcUDwTNnYbrLop
         7Ej6gEUKmlePZS30clk4SNc6A2/oHGWw/xK12l9Z+ry+1uL43JUFL3MexYib8zEV4uzd
         5FzqzBqKXmtk2nxX8MrMYolQrisSshh/5es4QE9DrHdxDeJAx29qXZzSGNe2l21azj/d
         meaHXS4pITKCea9tdLL2Et4qP1E7ijkOKoK1ztbEoAzGLzr9hKy9iy5msmkSxl26OA01
         90cTtPs/DL/c3Dv/4Mz9/8uP7JA3kg1TDkH1VbPI02yd/t3Kq1df9b0xr/E84FlT9lo/
         hrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j1TT4cxdSvOqJImR2JyQc+W0dHNOPWNC4ptEp9ACmzM=;
        fh=0yj3J+h46/6UfRGbfayAi4OVYNA08DkM5gmLDWkwovs=;
        b=O5hsL14/UGZvWnsXag1WRQm6bLs7qcb0ZEyIKiGfUTcsj3C52MNVrhERd5dmgvDeKW
         gBw1IeN2UhEw9p2lo/lbacDBFKoMSzfOoPZVoahayf0L3nwmWCVEvBA3fhZo8soIDu9w
         zhle01eVRRc2s5UcaDz+e5vn+G/dgSJ8L1E4X6YgL3IuvO9lFzEA2QqB2anlMA24HTI3
         kYgN2YnwdZ5GseT6QcWAxfY0PfJZyz0evkGm3Qu72YP8sYww1GbtRxoC2+GX5QdA0pxD
         h5KLYWoV3kq5YUYpTr8WlOTSnt2+ARjLO6hi3oicZ23z7WyVANle5+CxO8DM7snUVNXs
         X8VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788769588; x=1789374388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1TT4cxdSvOqJImR2JyQc+W0dHNOPWNC4ptEp9ACmzM=;
        b=e2xdKXpd9hik78bTtsiqCa2H9U7AvFW+OBD3cltEM2r+W2ck9bJ21wmdA79QP+HBcN
         5OIM6WOIOk9vM2ODk4CwVVBeOW64bFuvEYDw2n1n9aqNIGsxRfGyb+zYom+d7vwSJfS6
         zw8ZpSTLF5uo6EP/2gsqMX3vuxKC/yfn0GOV/ANZgay2mpy7TJ8XLPQVTQWEEMS2RYxP
         mowTZjCNAxMgoCsL1iLqeLYL71PSejoxNFCie36/7XdH5w1xxCbK+7Kyh9hin5TrftLg
         9T+AU1EaWgooKY9uHWWpFwyT5LWRT7tqvSWtARpE2eEl0Tj7eAl4a5lDndYV5dsd6t1g
         NI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769588; x=1789374388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1TT4cxdSvOqJImR2JyQc+W0dHNOPWNC4ptEp9ACmzM=;
        b=Jwz3p13XSIA4iLaTA+Pd+KPlpmMIYAHeunyCnntm8Jdg3KjHNeZlzLf0HVInhhDbta
         YoFKs8jngPlGIOI4la/zRIXm0hiQ/GjtjrBpV4BLg6ydKSCnOL5I+J/QwqritVsNjYgD
         Sh779qRlIMi5jKQM/j4qFP0pXctLGjNUTTIqGNj4yGi2A0lhjoJi7CGLhjlHEFBkaVYE
         Qdn6pXQLijSibJAde4Pq+19FY8WM1yoK8Ncqqi1rTrj7EGwOH1JG1xYsChUNkzorLRBX
         oOE1sasiIRtKStiTR+pZ/6HUs0U4T6kuXWQIBy1WD501z2QkY5d1HucZZxBf4Se3vOMw
         AQYA==
X-Forwarded-Encrypted: i=1; AKwUvBwJx8fzlZAwlQvzoTb0pf1JhIcVwAZ2LvzxbjwAig/bya/WQbbTKDm59UGZKARI4Q98Ok2N3kVzt7BvyAo=@vger.kernel.org
X-Gm-Message-State: AFuF++nbXYZ4wvNpJB+xIeGP0g0POSZIxuG5h9TvTB9vgQ6E7vW+0sUY
	QzXpH8iFp2u4jjTPiRg8gMJ2cJOSZU6ldthjJ5Xne/yvUQTvuVxmRDAs52p7CnnkRJB14/jZjY4
	V8lkJvMuvkBCLbuyqn4aTVnEn+K0MNzw=
X-Gm-Gg: AYBFou3uGEDhmI9/rwvWI+yrRd8IglTyRtpwTnMvIRxPE6H4WHJB8VSNwr9jAbYFFWp
	ZeioQkUyoWRV3/T0wjypZ2/SKnQgVQ/yLTpvV6lnHqgeSir4H7DlDo1ee/5H2ptnnEb5ry6Yut8
	uhqRBIZwy6PEXhImHggHpHeOdbHrk6vpcw0H3wRyNdWX4ZV0hbjvn3x0D/FeDIFfn4+Hc4fc/C2
	MLJzJ4Mg47qJD9bPezpTcNQ2H+Qc6XsUX2eNRakqkPDFj8jATIYsD8fI8oMKwIr36lJiWkmxI8w
	YY0LBtPOfoZDjAu6BozIl1sx62qsnZt7rpA6OO49KFdt
X-Received: by 2002:a05:690e:1381:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-66fd093c2bdmr1628991d50.17.1788769588341; Mon, 07 Sep 2026
 01:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062427.11910-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907062427.11910-1-hemanth.selam@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 7 Sep 2026 17:26:10 +0900
X-Gm-Features: AcwNN1WG1Jj532-ZoTPWGvuaNMs2YmLY0fK-SGK5p_IrGQI1YE8Zkqlj9v1k3Mo
Message-ID: <CAKFNMok3MaD+fRcG6VbBRND3gZa+APt_jV63KtQzXzpX6vdCCw@mail.gmail.com>
Subject: Re: [PATCH] nilfs2: fix typos in comments
To: Viacheslav Dubeyko <slava@dubeyko.com>, Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:24=E2=80=AFPM Hemanth Selam wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hemanth Selam, thank you for the patch.

Viacheslav, could you please add this to the queue for the next cycle as we=
ll?

Thanks,
Ryusuke Konishi

>  fs/nilfs2/sufile.c | 2 +-
>  fs/nilfs2/super.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/nilfs2/sufile.c b/fs/nilfs2/sufile.c
> index eceedca02697..6918be6fce2e 100644
> --- a/fs/nilfs2/sufile.c
> +++ b/fs/nilfs2/sufile.c
> @@ -1050,7 +1050,7 @@ ssize_t nilfs_sufile_set_suinfo(struct inode *sufil=
e, void *buf,
>   * len:                number of Bytes to trim from start
>   * minlen:     minimum extent length in Bytes
>   *
> - * Decription: nilfs_sufile_trim_fs goes through all segments containing=
 bytes
> + * Description: nilfs_sufile_trim_fs goes through all segments containin=
g bytes
>   * from start to start+len. start is rounded up to the next block bounda=
ry
>   * and start+len is rounded down. For each clean segment blkdev_issue_di=
scard
>   * function is invoked.
> diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
> index 893a504cb80c..65f44ff6779e 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -654,7 +654,7 @@ static int nilfs_statfs(struct dentry *dentry, struct=
 kstatfs *buf)
>                         /*
>                          * If nilfs_palloc_count_max_entries() returns
>                          * -ERANGE error code then we simply treat
> -                        * curent inodes count as maximum possible and
> +                        * current inodes count as maximum possible and
>                          * zero as free inodes value.
>                          */
>                         nmaxinodes =3D atomic64_read(&root->inodes_count)=
;
> --
> 2.48.1
>
