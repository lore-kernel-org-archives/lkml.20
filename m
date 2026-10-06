Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7D3B47D2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306310; cv=none; b=n08DuO1sershc0rgAhTdj/Q11etpJ+nK11H0g0EJUJswjHJG6Mjl+dT7txD4v3BD56DkdgFzVuouallv/JHHpClS2t5ycqv3ysJS+xpmJB9BnKcX3NwGCe71NAAqYkKZ283nRP6sJEahuhnQn6VzWfPg3E1FTQ0VlKNR76DQs6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306310; c=relaxed/simple;
	bh=CXrmyavGqEoXE0lp8Dy8kd1+uLfqcnxfNzihisBCqwk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OSgVeR2YGJRrZ8tiy22XWvWNzWayhbrJ28Yz2HH5ILRfuSKpdjl1PRnR+sM08l2PcMrmfRoFTBphzu1oMblbzLRWwLXtdSWFaXibjZVQOJkp60qxEz0KSFz1wZKhCW2XFm0KG/huSuevXsyXTcTQmoLVTdZsWixGI8rzDLYQim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=0OrwUB+/; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="0OrwUB+/"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6776efd4ff1so1119691d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1791306306; x=1791911106; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0u4Wathsr+m6UibNOetzVnu+uLOjm5yqEiMG+7aZSA=;
        b=0OrwUB+/tbx1yrlKfberD/wOKkakwZsBmI9RIm6XZI/IXvs7pgxIS0TyUuvcE1Kd3b
         XQRrhrpL0zwcG+ddik5xWHSaW3W1VSvRj9yQHdHvFnXqkll+UbxRakMxqK9gAQsmI1zN
         NT39FfuCgR32O6GR9SXeUCEZdU66D6qh5+XyhddiOCB9k/B3k/ayxdPG2ZxBSM6jaFED
         ULMgZBeadvbqI/s+XOCtaeufdDXZ8ZqoqMfRRqxS6aEcSaYeeW1+roaVSm8P/ACpP0lK
         zJTj1gT8SNPj9jla0LslBHygCBFwAvhaX+gWA4/ptbFJMot0KifKU7xLnXRkthkxoovv
         BCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306306; x=1791911106;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e0u4Wathsr+m6UibNOetzVnu+uLOjm5yqEiMG+7aZSA=;
        b=jm+nZ/PYTA8dRoWrHgOzrGqLLLAFlEULbLHFCRiCm9R3RLe6ppbnkPFFJtkNaCI42x
         C/WThQ8sNeXebkoqOoWZE80AcOxY0pPYCSI6mk+tWiay2Z1cLoPcEN7+hrk4hiBrbMLe
         FFCcFZK97iYKhzSYEmY67Xxc051xG012bELGOp7dTyadeYcoAlTj0w8U+T5M6WRJTMOy
         5Ty7t5N4B5hd1vf/uD9okTPM9cWrNrHZwztXv6heIgkx+cPVwExjfaoyXt9e4mahpLkD
         oidJYjE7PieGz8neBVnEQBTO0K2K6EZfJnbrtR++CMdvKiap93V7XV+q8Mg0cqH0oHZF
         D5ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBBZTT2wHq/iOt8j1jpHFABtMBibfJoL5Qhez15LXoSlfiBW2K/Ku5cIO83NfWs5EpECKRMBpor5PDr3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa/U6CmYC0zHeWwBSTFPj2Fhz47x041BwovT96NzsAq1CPJ25W
	ZaJjCo4hguTSN61ACHXt9rfFFsWk9Lh4RGl0oooJsZ99WTkWg7cJBCNLwvzTQWwWv1o=
X-Gm-Gg: AYBFou2Nat+wvjGeliqIVYB8PViTjHfN9JnzyocY0sBB8/WD5EdRsTFoZLI8Op8R9Oq
	6aF0HlSfTWZ6iTzt48Y9b4NPF2HgYh2KekSzz+5X2zXZyE0O/R8aH1+qOxV7pwa9FBc0rvt6NWO
	6BqbkPDTLdkeJFxZG5/YnckX/J3+Jh1u65lWjWn3FB0N4AuyDUaX5bno11jOEr46ruOlUrLDVMY
	jzgC4m33ifN6Fi/KftVQCT9qqnbLH0JOWixLpuzPBmIRUZ2wfpxRnFmqn+DEhRDL7BT2q/DYk0i
	5f0KmpHp1bSHKg3oKr9gxoxhTINXmvB9nPx+HPtjgLrMcW5qpTedMSvlNfTKbT2pGNMwdUPSahT
	AcpjRoSLK5wgRwI5DJnoIBUgXj4js65yKVt20nJ0kNRtiKtc6TuBDTydl7XEfevOSt8E/lKJ8Vd
	o5eRmfoBMbTh65JFgdM8cfLSdvttXhC9FoUqqRFW1oItMWN8EMnGeER1P5mmCRs4BhThF7hOsA4
	1zuEQuRzBOz4uOyw8WEBpndFLf4wiLqVp98lWP+/rAgcCzXBtjfvsFRNGTENaKjqaS75V52BosF
	zgzDO4IFqgrJBFNT1b8lxtVXMcxx1DmVYkV+HX1HlUA9LmN4oHCw7x+eKISN7m3Z
X-Received: by 2002:a05:690e:4892:10b0:677:f374:1764 with SMTP id 956f58d0204a3-678fce5c7f9mr813594d50.45.1791306306216;
        Tue, 06 Oct 2026 10:05:06 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:77a3:713a:7918:9ef4? ([2600:1700:6476:1430:77a3:713a:7918:9ef4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1baf25bsm4823686d50.14.2026.10.06.10.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:05:04 -0700 (PDT)
Message-ID: <ddd05008d8007dbd56268d484d77c1e25260e6d6.camel@dubeyko.com>
Subject: Re: [PATCH] nilfs2: fix link count underflow when removing
 corrupted directory
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>, LKML
	 <linux-kernel@vger.kernel.org>, 
	syzbot+c388db0347b7fc88fa7a@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Date: Tue, 06 Oct 2026 10:05:02 -0700
In-Reply-To: <20261006090311.47123-1-konishi.ryusuke@gmail.com>
References: <20261006090311.47123-1-konishi.ryusuke@gmail.com>
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

On Tue, 2026-10-06 at 17:48 +0900, Ryusuke Konishi wrote:
> When removing an empty directory with a corrupted link count (e.g.,
> i_nlink is 1 due to filesystem corruption), nilfs_rmdir() calls
> drop_nlink() via nilfs_do_unlink() and then calls drop_nlink() again
> on the directory inode.=C2=A0 This second call causes an underflow of
> i_nlink, triggering a kernel WARNING in drop_nlink().
>=20
> Fix this issue by using clear_nlink() instead of drop_nlink() to
> finalize the link count reset for the target directory in
> nilfs_rmdir().
> Additionally, log a warning message when i_nlink is not 2 before
> removing an empty directory to notify about the link count
> inconsistency.
>=20
> Reported-by: syzbot+c388db0347b7fc88fa7a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc388db0347b7fc88fa7a
> Fixes: d25006523d0b ("nilfs2: pathname operations")
> Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
> ---
> Hi Viacheslav,
>=20
> Please apply this for the next cycle.
>=20
> This fixes a link count underflow during rmdir on a directory with a
> corrupted link count (an issue recently reported by syzbot).
>=20
> Thanks,
> Ryusuke Konishi
>=20
> =C2=A0fs/nilfs2/namei.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
> index e037e0c6e31a..d326bb1acb11 100644
> --- a/fs/nilfs2/namei.c
> +++ b/fs/nilfs2/namei.c
> @@ -341,10 +341,16 @@ static int nilfs_rmdir(struct inode *dir,
> struct dentry *dentry)
> =C2=A0
> =C2=A0	err =3D -ENOTEMPTY;
> =C2=A0	if (nilfs_empty_dir(inode)) {
> +		if (unlikely(inode->i_nlink !=3D 2))
> +			nilfs_warn(dir->i_sb,
> +				"inconsistent empty directory link
> count %u (ino=3D%llu)",
> +				inode->i_nlink,
> +				(unsigned long long)inode->i_ino);
> +
> =C2=A0		err =3D nilfs_do_unlink(dir, dentry);
> =C2=A0		if (!err) {
> =C2=A0			inode->i_size =3D 0;
> -			drop_nlink(inode);
> +			clear_nlink(inode);
> =C2=A0			nilfs_mark_inode_dirty(inode);
> =C2=A0			drop_nlink(dir);
> =C2=A0			nilfs_mark_inode_dirty(dir);

Applied.

Thanks,
Slava.
