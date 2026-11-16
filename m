Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856739;
	b=ao4agmU14IHMSqINoXyg3pJpx3jyLuhbJw3blCN3yWhXMmSVyyZerAHDGczYfU6Mz5Ku
	 zCgmTbTv7JU1TGCGtkoSD26qSjEs4xvi7pKxsLy7F+YUwCQ8baxdsv6EWnQj8glIrpxHW
	 OalX+OItZxgbQr8RVfU78AGBWARVHWQ7i3zQxRD9xshPGzvTMwlAtSdtUajWpaLGHkNBt
	 YDDR3ILOdUxrJR/d1ulkd99oD5i7F1m4eeNkxurJDNEpKMwjIKWNuTxVCjmSaf5XAl5Pn
	 TGN6U9crr4F+TxgKIX+fZo0euuwDDppyGGZzGA2K8cK03OgxHtsv6NTNMOWdNsGyfsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=P+Td53i4gLVL614EDe7ngJcewRkwlZAfzI7C1/wn6i8=;
	b=o3LZn+AEok922+7I2iiRJdr0sJwFXVbX6b6NRtgkLtO3oSPhlP1wN6DQNTpNNtbi2mgv
	 05+nO4YNJsg51B4v851Fa1GIBToXdgs8Xos2hzzfC2RiZVzkx9XX6nSi4ZgoJgA9xXyEi
	 rUyJWvoxTPkaFT3YEZQl5ASMcN+8D7OB8XFc6ZkISLeWbBufXzYBuJ3FhKVRskqL63UDD
	 dqAwKJBZuiMTVX2fTcdvj8AeHWKVqJCFZrFzMeBuuZ/FluBJKxaCH0dLXejvOzia7+9cs
	 BUShzfGELc3Q5CS2hRLbyavEriQVkPCgTf+AZhjtYbPqlG7tkSNws27qzMJtFlys6Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ptwj5T8A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDD0606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDD0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ptwj5T8A
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55be673e029so30401cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794856738; cv=none;
        d=google.com; s=arc-20260327;
        b=Y35HMFQbyagrFO7RslfusOvMRopcxsZuy8VH+16Ma7pNg+Vl6jlbpSwvTJ8co3kL7p
         N1e94u4GMiXObipyogMcLeaAWskCtb91qUCCUkg9z67NcANL6ZZ4JfnMq/IBvhEx2C9K
         2N44/pH2Yuaf0zfVfD7BRGEORKTKNS4FbzyMEfcdmEmn8Xt8p3PVQNBFodGE+zPc5m+/
         +ixQN85NwXW/wYVOMz8JbgXE+Iu2kShoXcRY+ioMbjsAp0jaudfEdmpqkn1S4ZCC3gG/
         MgnS4j5zGA02yr/o/K89erp1unS+VWVHFeBHn/ZonuieOB/BTaME0ozHujK3DYORTVkT
         RSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P+Td53i4gLVL614EDe7ngJcewRkwlZAfzI7C1/wn6i8=;
        fh=YiRNo2LT6NVPn1ToliaPUtuJhcVW2DCMB4E3LOwUC+I=;
        b=DlVU+5kPbp0PvtvLNpm86F0GD2rZfHgtIeG4hOGmYlYVySRbvFOTR304pv+HMdF3e5
         PST4MVlFN/rtxmeBdGkXpKdHApbcw9mfilF0f3kUm2wff6lnphXq8NIRYJExeK8fF9Vm
         Kv7s4QmlxaOICJgjGRy2yjISSZ6k4EvDaPEr7MxaxKjiNrxVK1CUkmRVKk1LGJyYPDP1
         qHmicfw/yYwGwSWk8ZMpha/XnwWO+CSej9LnPEPB5tGDDk51+FHETXzehsQkEL1xKGs/
         4e4iUmg4kmhKN2J594+XEz+FEVpp5NaaDwNKWMmsebdW9qOoqFavhjspeemDCopzUe25
         YVkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794856738; x=1795461538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+Td53i4gLVL614EDe7ngJcewRkwlZAfzI7C1/wn6i8=;
        b=Ptwj5T8A2K5rkWcZIEp3+ufdL54DvuHuh2Phf4+nbzG4fLereFTIkUx/o1lJt7ZVLv
         k5lfh4/XghQQxieOkixIAXcMlAx+mKGoEIMHdvvFwAL9HfGJvOEPIOc+/toAVpeU1Qh3
         mISRTsByLEhBCpog+L6eh/f4nnerCyGnBr/NulkliNZGlEg1npRciErR/GoAehR92fkO
         o9/UNpr6DLjPVVP7Ccf1N3uvv0XzKnuVBgOkUZKw9l+INwAAQL72EO7JurGtSyHbg/Ap
         QPp+O5IIOcE1/LfsEylsdnkq+9LlJ3ckkFR5HTRvTrOFYxjP+q3mcZaAA8TOMQZChkko
         K+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856738; x=1795461538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+Td53i4gLVL614EDe7ngJcewRkwlZAfzI7C1/wn6i8=;
        b=So5RCVFu6Z7JmmTbhXGYrW5hkj/Bz16f8H8r5O/k//z1HXIdJijLky227wqs7tO8qp
         4WuFVzgEHBvM/m9TxS0SbkmqfmPFn6iY3nIjCN8QRc3DuzA3ikUmr6Py8lYl3NjgXyfV
         DEChhTuCbENSv10aArXSuNkESYsF3khqjeBPQ3Q5yR0/6UlVhhcEGDEY6UlpIXc2M1If
         8IyONAUWwXledux+d5CAnbTTCKntEzCxVX0dFdQ5d5ZCnYUSaFgylXtghux7nvrXoRvx
         LkxI8d8ytcvIuhnOCKCPk5s5eFbTvxy3uZy55uKOkQnKwJ2q+5J3ucGbZW/Co4F2cLvt
         epvw==
X-Gm-Message-State: APuU4Z9qX9y5NI8KO5u4AVmzYMCBFkTNLIb5h7xWr0ISNSI6df9ucWE3
	S0cwm4lDQoWKCtaSz6Xx4UDevc2zV1FZofSOtQnOOei122w2XuqBjwD5+tbFdLuu3Drq4e2L75k
	tu+B23uYefUwI1qCCMcqED+Es8p27g5BQ7nu0plRmpnwIcpkHc4As6mN6lYc=
X-Gm-Gg: AYBFou1vXNdZSruBytrdMclMkPYuwU3BP5syDb0ImZJzHJ8HE7m/VvG32JZ0AQ2ROs/
	TeztBbMzHGZ+NM9kuVgbu9VJtaN0h/u7t6P076h0Xna6AQTc1RqHXqA7AbulKfGHOhHnLYaE9tG
	auPKNM1/IfTfUPInbl8XJwnq1A4XRHfVWmTkV7W7Q2qDCAgR9rb6I/E+ZqgjMFk2B8m4lmpswrt
	cNr7fo9FCpfkWp/dSZxxeBaQ7JGhkIEkgGWd9F/jBSxjfPPtUVumWCUp4KJBw4N4qCfscOw2hke
	GjvL6vfRl5BpcqE+2DoPGrQ/uy+OpL9hs4umTEPebLNnHkE+vAlW6ZkKbvu0n5LjW7U9XdcRCci
	671cAiVxjH9w3HA5C1cvN5PJuHorRZugT5sX3cWxdwmsTtWO4dwmIAqZYsvANJAXJcfO3
X-Received: by 2002:ac8:5cc3:0:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-55d4a2054d9mr1659681cf.10.1794856737600; Mon, 16 Nov 2026
 11:18:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116000534.2303800-1-daeho43@gmail.com>
In-Reply-To: <20261116000534.2303800-1-daeho43@gmail.com>
From: Daeho Jeong <daehojeong@google.com>
Date: Mon, 16 Nov 2026 11:18:21 -0800
X-Gm-Features: AclHuK-qQ2-LUVPUDC8WbXro110m72c8YZKmMgPHn_9p8GCIathgq-RTR8N6zaA
Message-ID: <CABdZyexiNTnEkbrY0Pzw2ADWMCiwq2dSu521yBmec2+0PGiEnw@mail.gmail.com>
Subject: Re: [PATCH] f2fs: don't skip the inode update for a size grown within
 a block
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:05=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> f2fs_skip_inode_update() lets fsync() skip writing the inode when
> FI_AUTO_RECOVER is set and i_size is block aligned, relying on roll-forwa=
rd
> recovery to recover i_size from the position of the fsynced data block.
> However, do_recover_data() extends i_size only by a block that starts at =
or
> beyond the recovered i_size, so it cannot recover a size that grew within
> the block holding the old size.
>
> For example, on a 4KB block filesystem:
>
>   write(fd, buf, 14KB); fsync(fd);
>   write(fd, buf, 2KB);  fsync(fd);
>   <sudden power-off>
>
>   - the first fsync() writes the inode with i_size 14KB.
>   - the second write() makes i_size 16KB in the same block. If it is in
>     the same timestamp tick as the first one, the timestamps do not chang=
e
>     and the inode is still clean, so FI_AUTO_RECOVER is set.
>   - the block is already allocated, so the second fsync() updates it in
>     place and writes no node. f2fs_skip_inode_update() skips the inode as
>     well, since i_size is block aligned and equals last_disk_size.
>   - recovery finds i_size 14KB in the inode from the first fsync() and ha=
s
>     no block to extend it with, so the last 2KB is lost.
>
> Repeating a 2KB append and fsync() up to 16KB and then shutting down the
> filesystem left 117 of 1200 files with 14KB on a 4KB page kernel, and non=
e
> with this patch.
>
> Set FI_AUTO_RECOVER only if the old i_size is block aligned, and clear it
> otherwise, so that fsync() writes the inode for such a size change.

Please ignore this patch.

I missed that Chao already posted a fix for the same problem:
  [PATCH 1/7] f2fs: fix to persist i_size extended inside last block for fs=
ync
  https://lore.kernel.org/linux-f2fs-devel/20261022125244.2205275-1-chao@ke=
rnel.org/

Sorry for the noise.

Thanks,
Daeho

>
> Fixes: 3a3a5ead7b6d ("f2fs: do not recover i_size if it's valid")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 50a5f845176d..b328e678d295 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3676,8 +3676,9 @@ static inline void f2fs_i_size_write(struct inode *=
inode, loff_t i_size)
>  {
>         bool clean =3D !is_inode_flag_set(inode, FI_DIRTY_INODE);
>         bool recover =3D is_inode_flag_set(inode, FI_AUTO_RECOVER);
> +       loff_t old_size =3D i_size_read(inode);
>
> -       if (i_size_read(inode) =3D=3D i_size)
> +       if (old_size =3D=3D i_size)
>                 return;
>
>         i_size_write(inode, i_size);
> @@ -3686,8 +3687,16 @@ static inline void f2fs_i_size_write(struct inode =
*inode, loff_t i_size)
>                 return;
>
>         f2fs_mark_inode_dirty_sync(inode, true);
> -       if (clean || recover)
> +
> +       /*
> +        * Roll-forward recovery extends i_size only by a block that star=
ts at
> +        * or beyond the recovered i_size, so it cannot recover a size th=
at grew
> +        * within the block holding the old size.
> +        */
> +       if ((clean || recover) && !(old_size & ~PAGE_MASK))
>                 set_inode_flag(inode, FI_AUTO_RECOVER);
> +       else
> +               clear_inode_flag(inode, FI_AUTO_RECOVER);
>  }
>
>  static inline void f2fs_i_depth_write(struct inode *inode, unsigned int =
depth)
>
> base-commit: b9d7379d10d43386b59082da8c9a0b111e054781
> --
> 2.56.0.611.g1030f0b940-goog
>
