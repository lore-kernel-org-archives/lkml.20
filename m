Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BF37268C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933576; cv=pass; b=Kqpt51YDoUjqni3e/k/8464WLf+HfomE4kqoK7d/+QNVDA4Lhdp4FYzvEHsM+KJoEMpcGtg7A9ZqVhdVqBOAZm9NSjx1U+OHt2a8nDWic2BpCl1P+TYTUOkblEYFvLBh1N+tREJu0tpdNzzgk4wv+V/iaTnwA9gGycfyA/KNLRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933576; c=relaxed/simple;
	bh=N2NTpV+h7Rhik6ywVBV50YDpuClPM+YTvP9GFMDQ4pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGRczwI39MoZfphDoBBjmwE5+aEVmWyOmpCvtsoy8iwXlY+qNevZEB/SL9OXN8QltAR8WC4PK+IrD24CrSN7I7UHxAQrK2t/5KZhyD7RpNuuI3FLFLv5a7KeVU/SILqxxHUoeyyTqKn2dA1gPkUHAyISjpcOdEmZAaCfUEttZhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnuYg6bB; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnuYg6bB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so3097399a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788933574; cv=none;
        d=google.com; s=arc-20260327;
        b=fpbhQEydv2EAgE/bqxZ/Kh2Aq0DvSoaX8+JalVZM0Tf4TJl2o8nuz6xsVogV5qOc0L
         25Hqa7zV2FxL2zu5Y//cSvNOSDrOLcOzF/4V9IyU5haQRC7zRlz851TvxncdiNpvJDIJ
         4a7Oc54OmycZQoMGM7UBFGqbs7Ha8DtqvYugidaADRigpuIoysnQV/yMMGANkdbvzbae
         BB6taHmZySamrbSHUdlX/NJU/RJxfEiMYk1cqaZUj+m8Q6rVRz0ArtJ+NpXOrg4Y1Fdk
         W1Tl36XlCiRvWFIt8OZt4FrcL8JALd/ghNBjpNa82dgDFSxo6/x1wl4VXd6cH1LxBwme
         OsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        fh=mXg6PoroiD7pOh7BQwvUVRm3fSSKnidz04avr+YnCTI=;
        b=bKuFYGwAkx/zmHXY+R2ROPlYA0wetgs1hJapbiZUmr1To+8PL5+7neHMI1Cy12nSXe
         syJEGjOXLl7cLYhzfwVam0VGrLOiER96nnwcCzqVfSob9yGbSyvsgafOaWr+/Eg2MNhv
         kWEhkPUvDby1QK3Jza4WUy8kUg0j9jvheg/Lhf0QHPGeuIrX/TXWMaEvHgAk6lS/ZjJm
         X1LRGv/4jp597D6QoZw+Pcbgd9nGBtg5iZFphfjeOCGkzQduFodloYCYXVWBgrR9ga3U
         5phD1SkKMNO8c5JYtypZ/eFPtgqxGcZECbEI3Z41yTJYyB9sKjfEGpI3ITmF4gkseq6n
         3Tdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788933574; x=1789538374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        b=KnuYg6bByDeLZn3Mkm6ov+92mSTCSnSCsDq0+2VqoSFJoWuX7iy/03wP4+Ybk4l1ZI
         R7O/Ae6wLDOycV4v/LHXzIumf0skGXI9XsAwRX5yFlS0ylsoKYO4kx57lOtO8VhnVOww
         mrane5o/I8ef78ljD15QMSWZscAQkf87UsXfH9LB/8+3s30el0RndhjwpFXhDiW6iovr
         KRmNM0PZo+SGgt6+7gR02N17UHVBYknpTwAyRv7arKBNq546RCK18gn/MUd5dZRA/91O
         lebHZvBeHTa8tZkPmV4I0hbnSNrsZxA8TbbhWGyffoTXK9+TaN/v1KtZmpz3GrxkREna
         148Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933574; x=1789538374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        b=L42o3uWIwhV5iEMAmkzgh0vNNMLYz9cvDcTc8Cl0U5naDBMAXwEHzYxpoo+x+tQa11
         lZgfbQ/CxVWONNAOp7OUM6WzqaXDpOljtcPpOz62xCC3sLOCOnRNsCQQz6FMq8CEJdII
         0qMnw9YnpQs0jLHM7xpWb/ObbfngLpb5AFKFV/9oWGL42mBVi0+ujkc902kQ9nCLh3oB
         SwUtHe+pLPEQor5xm2CEYGeNPPFSwQj2ahnx3jtoneVqSN+ydi0WJ1bhIWzNbEoda4p2
         C9M2a3kFrN+oBJvxQ+N/V2WMV7kImrwXM8yeWkzB0QC/EY0R/Fx4p6NZ04gFd0SqLBEF
         voDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6IRJ+KlGvwrAIRQBMC8MEwhaNnhfWttYBxdzBzAO9aM00ndqauDT9lz/gejOBSGv375L1KuVP9kJdhQk=@vger.kernel.org
X-Gm-Message-State: AFuF++lI267bo+gSgckFsbHUH6SadAwp1deZwl9bbDt2XCC7+jq39ErF
	jTeQfALo+ciwZBzuRMeXqafdR3vXT0Sni0GskhvH9xcGGUeynjyyDoDdJTEAGlH00cTH6zB8hwK
	zCkxcAXzuKXOocdOGq62dUOeJWoZcxqmaCbOH
X-Gm-Gg: AYBFou2jp/kOZ9+Y2pzQ7tftmZBKlHSQyGgCLw0+ST/Acw15Ul44tTryGma9QFBv97V
	jSCykgnD5lW7oZA2LoS64iuhS8Xw4zgachW3AzgR3hgvtjmKTqMc6tYgcDcELtdpx+BOPN0yxgU
	CGUeFNBGM8Hs13Ym3Vi4fxtGOtoMlNpXaxwXsRPdY3aN/w0l1nQiT5REgioU+QOqSSiX049IMyk
	fXzlgPHeqTIfxWLxjgI9n8XdMhWkXe1lKRER/FV68Q5cbGSCeP3aOT46d5XsqGXBSaTeDVn7LzW
	XIrqqetiaM1MG6QXjMTMl5YYzzH/LcYmuxCNzd8uOLnPGaVYfNKfbHfufiAkmN1WQcI+SZ4BKAd
	Q106ydx0Ap1oy4mD4n7sojm8=
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3da3a066ef5mr53737139637.19.1788933574031; Tue, 08 Sep 2026
 22:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819182805.4020838-1-jjy600901@snu.ac.kr> <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
In-Reply-To: <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 9 Sep 2026 07:59:21 +0200
X-Gm-Features: AcwNN1WR-tbYe24I3uROA7Svs3FhGJH-BZThyVMmDLp6bN7W006NPhEgpxMl5DI
Message-ID: <CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQCrOPD7mPV6GA@mail.gmail.com>
Subject: Re: [BUG] general protection fault in jffs2_xattr_delete_inode
To: Richard Weinberger <richard@nod.at>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>, David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, eulgyukim@snu.ac.kr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jaeyoung Chung,

*ping*

On Wed, Aug 19, 2026 at 11:03=E2=80=AFPM Richard Weinberger <richard@nod.at=
> wrote:
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Jaeyoung Chung" <jjy600901@snu.ac.kr>
>
> [...]
>
> > RIP: 0010:jffs2_xattr_delete_inode+0x38/0x300 fs/jffs2/xattr.c:602
> > Code: 41 55 41 54 53 48 83 ec 50 48 89 3c 24 48 85 f6 74 2a 49 89 f6 49=
 bd 00 00
> > 00 00 00 fc ff df 48 8d 5e 28 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 =
c0 0f 85
> > 90 02 00 00 83 3b 00 74 14 48 83 c4 50
> > RSP: 0018:ffff888104ad7918 EFLAGS: 00010203
> > RAX: 0c8c8c8c8c8c8c91 RBX: 646464646464648c RCX: 0000000000000001
> > RDX: 0000000000000001 RSI: 6464646464646464 RDI: ffff888108260000
> > RBP: dffffc0000000000 R08: ffff888104ad7987 R09: 1ffff1102095af30
> > R10: dffffc0000000000 R11: ffffed102095af31 R12: 1ffff11022349cfc
> > R13: dffffc0000000000 R14: 6464646464646464 R15: 1ffff11022349ce8
> > FS:  00007863627186c0(0000) GS:ffff88815e8ac000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000786362717f78 CR3: 000000010795c000 CR4: 00000000000006f0
> > Call Trace:
> > <TASK>
> > jffs2_do_clear_inode+0x4d/0x2f0 fs/jffs2/readinode.c:1418
> > evict+0x353/0x700 fs/inode.c:825
> > jffs2_new_inode+0x443/0xce0 fs/jffs2/fs.c:-1
> > jffs2_create+0x87/0x300 fs/jffs2/dir.c:182
> > lookup_open fs/namei.c:4508 [inline]
> > open_last_lookups fs/namei.c:4608 [inline]
> > path_openat+0xe3c/0x29b0 fs/namei.c:4860
> > do_file_open+0x19d/0x360 fs/namei.c:4892
> > do_sys_openat2+0x9a/0x100 fs/open.c:1368
> > do_sys_open fs/open.c:1374 [inline]
> > __do_sys_openat fs/open.c:1390 [inline]
> > __se_sys_openat fs/open.c:1385 [inline]
> > __x64_sys_openat+0xf8/0x130 fs/open.c:1385
> > do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
> > entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x78636301e829
>
> So, the partially created inode is evicted in the create path.
> Does this change help?
>
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index 86ab014a349c..a9906f9e3638 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -57,6 +57,7 @@ static inline void jffs2_init_inode_info(struct jffs2_i=
node_info *f)
>         f->target =3D NULL;
>         f->flags =3D 0;
>         f->usercompr =3D 0;
> +       f->inocache =3D NULL;
>  }

--=20
Thanks,
//richard
