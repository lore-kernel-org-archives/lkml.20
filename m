Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031355;
	b=JO3Oq4j+kKz6stRKUA+oxE2F1lHH2mGz3Podals0lfgsxHrlPJk7mjVIvWujMTVh6Lur
	 N64/+HrdB8VfSAxE91jGQ+sThvL9P2BDPmMaW2tgLxjVjycWOeURGZNAb+ZAMwynwwlRe
	 OjYH9PKO/aNZUIoQ75FMjlzJsW1fwFH5GEFC0T0wHZydFvRhAoDeGOnYVbTRGhx8LlrUb
	 Mzjf3x0kcRFABlqFiHo8I/wGqTfw6cxrGCSemt40AEtTfz8Ub0FS6dQtIPhu79KQnn50m
	 sOJ09kQ2hJBGGFsC7GY+mL2C8oxxqQqVbMZSk3yQsQ/It+o+cVHRQrHC6m9wOsmrjGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=iUlRbV2o3Wff2h6BAUNRD/DjTFCxIX4h0ehdTCN+VE4=;
	b=fmEY2dikZV0el+2PmIYCBWnueeEMjDCHdGzkF8HpJwyIbX9EQc2XOZZMfV/nU8qkusaI
	 Pq+47cPBhF/8UudG/zsTmIAXR5GWsGoSJguvyCdHtbSOkqyTQbicxhhqTL/7Gsf/8NJ7x
	 +sIyK4JeKtVTnFPD9UNDuki6hAHVxSvQNDVi/6fKRxdNivCN7vtqz0xvv8o9OHfMoosF7
	 gkFSsP1hLOtYTgCTETVEn/cIUvC7LLQyTWkEi1+Js4fVoHMwzLUR+cmSTTbt3yXehfB8P
	 2nLY4ZE7M7uX/cqYusKV+2jWNhZG7X+uo8gczNsm2I6XKIm0ahlWoIeh2e3S9RNO9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jRq2+PmN;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B11A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B11A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jRq2+PmN
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c414e5d282eso364472866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793031353; x=1793636153; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iUlRbV2o3Wff2h6BAUNRD/DjTFCxIX4h0ehdTCN+VE4=;
        b=jRq2+PmNH9ZpY/lJjHDFVMTYZK/6acgrn+xPNBtT55n5IpN3BeULrfUyEM2CB73Ic7
         lWKBIAM+SmLr0tlyWBeaU0Hi73QeEdh4YLiGgSQsDtGPnsE5hfeeZ2g4Fom+x24ZPqaS
         fvsvnPcIo8Ay+y4F2WmIaFK/GeqvIftSByXHqLocC++8EuHhwIBqBeJFyChOOak1b8pb
         /pWhRD0qvH6GjeTBL8BLBk8w1b3qHqheLHHL206h17H9742QEkq8U/c0x6lrAyVz5yqH
         rjs4LI7sMIr6ZcxTdX5bD0h2ANWZmSZajtuANhFNK9RHvEOYQvs0rGjmANf7zJgiwwOA
         A/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031353; x=1793636153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iUlRbV2o3Wff2h6BAUNRD/DjTFCxIX4h0ehdTCN+VE4=;
        b=pyH6zPQsN1SfrFlgT8jIM0yWawJWDcNNmA7cDkVOe4TdGN9zM96tAHWwgsgW2GUmxI
         wYvQMy3TY7RkIterFgd2HaoEoY6mGWx/pWLZSm21WtCesaYep2fxYs2FacjNZYbvZQ78
         Sd2SbDKeSgzW/LSD8+74YyE+jMKUSYCSjAKC4+P2oN2XaK0ODzTUZvQzl+tTxQYgkz5V
         Sj5D2Zs6YJHeJMsfulFH7HM7/LMbp8umDTa2HJptH+vjAb2bSeaI9Efqz92ae2npIHCA
         FNXuYexqZBQmNfDRNxgkUV8LPG7hiyRSVREXkitqImnVB+hhAvqdxSQuhjc8L2ght4H+
         5YRg==
X-Forwarded-Encrypted: i=1; AKwUvBwRFaosCgi+79Oard86ZLc5994URWQsmfZs938QmAo+ZQjVt8HNXA1q8JAzt2PzrIZVXJxKUCHlH7NofNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW35M6d9BQaf2UME0Ti9xWt4nzOPuc22CHKIQWr3nuT3x3qNKR
	RiyiHXQkfCBLityK76mMImeygJIwsPrI74cCBr0C+qWKN6DNVJQPfWAKSs28heZu4ho=
X-Gm-Gg: AYBFou3e6KjNU3V+2XOWhQCeftuKSQ/Y28ESNajzHiObkOyupj9Nf8lsi8gzFZYhWng
	V6IK8zvSl588Sq+ztNyAgmIvOBO/vIrmfROYM5fh8koG82e4bZO7tO7LRSn0Ex77IMp73BAiizj
	vDGLmlIgM9ChS2XMr6LDxJuRk1bgO6yCe0WxSSiCw6lMTeazbCgGmkcL0Utzat7UJAQYMXdppfY
	ABhUgZoRbXqDcGp/gputVUieeHneIQaBjwte1XdKKxFaNtQCYJSEUh5iOhpTjOjkqH5BlpB/7ws
	xUXeeBPr/dVj5mMePmsyWBMfJWHD4lC2lY7AoGV2YkxSXRIKbX4Ghd49x7AKVM+0QePz1DFxqI3
	mU99FWmswWxRTcXwSP/SpEKjIxqC4uW+JHt2F6GPhraiKG7bIV544sfuT2Z5qmyPdBzKjArFBV2
	j+0qBCS8JFETGja0h+HGlN9pmGMkc2bT1HbLJ4j2iig/Ux8l7uQjjPu7Mqh0yQMhEauP/AqfLT/
	3oVXBtswwWHRCGZ0jjbuVtQVL0NiVRT1iizRjqLrY8yb+zDwsrXUFuWlDbeIaEilJjIzFg3XS4j
	rs6Tjzgm8BqbNs7kifYhiChx6Q==
X-Received: by 2002:a17:907:960a:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c46bde4ee68mr825951066b.27.1793031353009;
        Mon, 26 Oct 2026 09:15:53 -0700 (PDT)
Received: from localhost ([37.30.48.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea39fsm337365166b.29.2026.10.26.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:15:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:15:51 +0100
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com, jfs-discussion@lists.sourceforge.net, 
	Dave Kleikamp <shaggy@kernel.org>, kees@kernel.org, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev, yun.zhou@windriver.com
Subject: Re: [PATCH] jfs: validate dmap start before block allocation
Message-ID: <ye5pikbxc5yhetpoydhwymv7uf6p3ulk474s5cu5vw56vaimh3@ezfc6jlqds7a>
References: <b63dd8ae-464b-40d7-bbb8-031cfdc90909@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b63dd8ae-464b-40d7-bbb8-031cfdc90909@mail.kernel.org>

Gentle ping on this JFS patch. Is there anything you would like changed
before it can be queued?

Kind Regards / Mit freundlichen Gr=C3=BC=C3=9Fen
BART CHRONOWSKI

On Wed, Sep 30, 2026 at 10:25:08AM +0000, syzbot wrote:
> From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
>=20
> A corrupted JFS filesystem image can cause a state where the block
> allocation map (bmap) and the dmap pages are out of sync. Specifically,
> dbAllocNear() and dbAllocDmapLev() derive the returned block number from
> on-disk dp->start, which can cause duplicate allocation if dp->start does
> not match the selected dmap boundary. In this scenario, the allocator
> returns a block number that is already in use (e.g., as an inode table
> block or metadata) while marking a completely different block as allocate=
d.
> When a thread later attempts to lock this duplicate block (for example,
> during a directory btree split), txLock() detects a metapage conflict
> because the block is already locked for another purpose, triggering a
> kernel BUG:
>=20
> kernel BUG at fs/jfs/jfs_txnmgr.c:836!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> RIP: 0010:txLock+0x1cc3/0x1d10 fs/jfs/jfs_txnmgr.c:836
> Call Trace:
>  <TASK>
>  dtSplitRoot+0x38d/0x18a0 fs/jfs/jfs_dtree.c:1924
>  dtSplitUp fs/jfs/jfs_dtree.c:990 [inline]
>  dtInsert+0xeb2/0x5890 fs/jfs/jfs_dtree.c:868
>  jfs_create+0x730/0xae0 fs/jfs/namei.c:138
> ...
>=20
> Validation of dp->start against the expected dmap boundary in dbAlloc() a=
nd
> the single-dmap path of dbAllocCtl() prevents inconsistent allocation.
> Rejecting a mismatched start with -EIO prevents duplicate allocations
> before txLock() is reached. Additionally, preserve the existing independe=
nt
> geometry check (dp->tree.budmin < 0) in dbAllocCtl(). Both a mismatched
> start and a negative budmin will now fail with -EIO early, preventing
> corrupted dmap structures from causing duplicate allocations and subseque=
nt
> transaction lock crashes.
>=20
> Assisted-by: Gemini:gemini-3.8-flash syzbot
> Reported-by: syzbot+a843f6ae2130a987d63b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Da843f6ae2130a987d63b
> Link: https://syzkaller.appspot.com/ai_job?id=3D922ceb61-4be2-4af9-b2fe-9=
977a2549134
> Signed-off-by: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
>=20
> ---
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index a841cf21d..9bdbc55d8 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -98,6 +98,9 @@ static int blkstol2(s64 nb);
>  static int cntlz(u32 value);
>  static int cnttz(u32 word);
> =20
> +static bool db_validate_dmap(struct super_block *sb, const struct dmap *=
dp,
> +			     s64 expected_start);
> +
>  static int dbAllocDmapBU(struct bmap * bmp, struct dmap * dp, s64 blkno,
>  			 int nblocks);
>  static int dbInitDmap(struct dmap * dp, s64 blkno, int nblocks);
> @@ -886,6 +889,12 @@ int dbAlloc(struct inode *ip, s64 hint, s64 nblocks,=
 s64 * results)
> =20
>  		dp =3D (struct dmap *) mp->data;
> =20
> +		if (!db_validate_dmap(ip->i_sb, dp,
> +				      blkno & ~(s64)(BPERDMAP - 1))) {
> +			release_metapage(mp);
> +			goto read_unlock;
> +		}
> +
>  		/* first, try to satisfy the allocation request with the
>  		 * blocks beginning at the hint.
>  		 */
> @@ -1902,7 +1911,9 @@ dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb=
, s64 blkno, s64 * results)
>  			return -EIO;
>  		dp =3D (struct dmap *) mp->data;
> =20
> -		if (dp->tree.budmin < 0) {
> +		if (dp->tree.budmin < 0 ||
> +		    !db_validate_dmap(bmp->db_ipbmap->i_sb, dp,
> +				      blkno & ~(s64)(BPERDMAP - 1))) {
>  			release_metapage(mp);
>  			return -EIO;
>  		}
> @@ -2134,6 +2145,18 @@ static int dbAllocDmap(struct bmap * bmp, struct d=
map * dp, s64 blkno,
>  	return (rc);
>  }
> =20
> +static bool db_validate_dmap(struct super_block *sb, const struct dmap *=
dp,
> +			     s64 expected_start)
> +{
> +	if (le64_to_cpu(dp->start) !=3D expected_start) {
> +		jfs_error(sb, "corrupt dmap page: start %lld expected %lld\n",
> +			  (long long)le64_to_cpu(dp->start),
> +			  (long long)expected_start);
> +		return false;
> +	}
> +
> +	return true;
> +}
> =20
>  /*
>   * NAME:	dbFreeDmap()
>=20
>=20
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> --=20
> See https://goo.gle/syzbot-ai-patches for information about AI-generated =
patches.
> The person who has signed off on the patch is responsible for
> addressing comments.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
