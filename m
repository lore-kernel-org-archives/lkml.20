Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349443064B5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919958; cv=pass; b=mRGdzIjz7tsQJdL1bsN1luZgIlHqGJ798MaywDyoMIWZ0W/x2jrD8SrapzIzS5mFuB+TN/5deUKRBs+OdNY6jYveR2iKE+OCQGjVYZMjfevpt1m3liM+DSSMOpi85laDVIhx61B9S7dP/fx/kLHZ1f527nKpG7YFK0o4q9ypqxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919958; c=relaxed/simple;
	bh=TfrvM8n2bSaW/0lSNp1OX9xmA0tir/mHzjr3OAurGwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiI8ZFDlA7fFYn4Vxp6fQA0z5rnDSZ96ZLvcUCL0rv9BXlX13gYNJdwV6rb4JN+dYLZhxeetZ9uxhmmXXaC7abO5Ywa2/wsuD4+BLVuLsoRpDHRhf6swQLrHiP9+T2L+cN3dy2NAfhcTjSUIIRR8hc9+EQeKmyK+r84V3/W7lN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfORNXrH; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfORNXrH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so578749f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788919955; cv=none;
        d=google.com; s=arc-20260327;
        b=iQCd8Ot4mTBzmpoyBj6daj8l9iR9DcgKTFKiedY0hwQ74kniWtJVhWHIr/usYA53Eu
         5OKIz5xzaFqNpTPWxCQz08W0VSRQnirBad5UocKVujsY6R+9J6Kc2ak1+3kf7dwOIRLj
         XOltDPw5uD0PJ8cSImnFXcsZP+etQEYATCE94/Kkzp/GiOBZtbib2VYSNleNcytNrBY2
         +e3oeZYRWLL62uLVkWWa9TpSkQfVXUb3eBclvymVNw+Ody5kUyg6zjSd2E93iN9peOSN
         0bCPgdbDdJy2qLtvVQA9uTAnCJqG6smf68y6A8twV08nShliGxngvyj3XdVZ2EE53ufz
         pjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5E+pwQE2jqWQwgSLgy05TkZ6xdQKNmZYdmm5S5Jaxo=;
        fh=GDSgdcXhcSM1o6aNH3Ici1nwh+xGr4yI34I6P41sDwQ=;
        b=onH0yhcNRC7TDI2tm+NbVkhX1mHxRDzlJ5aq9uHUaWki7RfzONOm3x1rer1oUgMKVb
         3sgw96KyJn6Ea9Q5Lt+7XidlgdLdCzlwA+F/F131Zr6xtuiLWgBrKEALYF/JjL7fErNX
         V83SKoBJl1YZ09mMKPr0Keb1sGbCSpkQSciHQWALMA+SdT43thC3Eks7ZF/OqLumBZV3
         Ozdfzb2HqVkGCDZLu4xMtDL9VqMVKBa12RVoRJsvAPiE6fLhqiG34mJmpmpfqwBne5pd
         d53djKNlAETtMjcY9ZeVCVDau5aDhMqNjGXX0OyYdl00xCxpkCixf+w2ST/3YZZAtZLO
         q2sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788919955; x=1789524755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5E+pwQE2jqWQwgSLgy05TkZ6xdQKNmZYdmm5S5Jaxo=;
        b=lfORNXrHt0l8JGCXlRZEqBrY0iuId2zPnTQWsbPvZdPsZm2HGmrFy0JCEqX2m5EIOL
         a/r3JtSss37XEBI/BrIoqWnsNbHKb4j1oyu3fG9TIBKci0cD2LiZmhfPH9aXbaDsVimh
         2ejB6rQVVIsV1EmvE7kSnu0Du0LECE2IvAIH6gFevHg2DTu10DUoPdeZg3Urxs75Bql3
         Lh7K1BW8PojXb55QQnRZ36qN4zqW7ww3aHJeOZn/hF6ywDlodM+5VCj1uIhWuxZC+Yue
         HmE9iiNIg1Ap8gSdnHtxyIQO+7XFx8wUktV/3v7yEaIzfVPsQzUImp/cWK3TOo4fkbFO
         EAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788919955; x=1789524755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5E+pwQE2jqWQwgSLgy05TkZ6xdQKNmZYdmm5S5Jaxo=;
        b=rfkqNRiTe11p8mRu1u/GexySGjZqHzoQHLauDXfEMWkurvEziCrCVym8H6o8gnLfXT
         nN+6JUnMMgdxztYsHIXl5Q6r0PvLkQBLTDpcJx+mO9V6ToWkTePaJvmc4JkzEpDcnvkL
         i74pkp5UxRD+vu1idEqQfGVBYpEh+aWKYbjw9yug2Q2DrXwjRGd8MGrGXL6aMqCgbXnD
         MinDkPyivS+U1NUV51Evknwkok31/CBNr0KnSnsL5RLG5lCiRHPUg2hzMCXzznYUs9DP
         ULyiSKIkQN/Dhqg4gb2/Q3ymcMdyXfzuBHXK2DbjHViOzUnDhaullQiNMfzezw56hdkU
         umrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2FfgbM+ILaJDp8SGRfBxnervuyiaCbAhhql3RktVCtVE15ICH8a9DjQXKMwfQ9vmXdivYNzIcQdHNzcY=@vger.kernel.org
X-Gm-Message-State: AFuF++lJc+V4wmxqvbIRlOyK3wKB05pNskRpa8bDhU+O6Vw1wT+5CVMY
	tT1Mz7T0VnJ7PqGVy34rhhB6o/WVMAYx1+FqwfPR+olMvaPSPWn2NON6/ck/9qquMOQDXGYq+3u
	oeX26yR9s/M9IkoA626uQd+w35VHiNjocHg==
X-Gm-Gg: AYBFou0GEajnfTE2S1WsL5flFeUXy32OEXzmq+rQ8AdQVnyLVZrX9TZR4n2bfjwUPj9
	DJP91Dsy3gXyb8kuPp6Pk8SvSfgTvq8raFLb/G35eosi3ZaswYh+KFWIzspfoHVrrKJidxQYrFt
	fCqfzMJ2wrFEm95118WOL0c3g2sbRzytyScg82svhcjiSUiar/oyvwDf89NVACklvRqjvR5wvJj
	+Q3Nqhf5EL3J+LROpPsVCltmZt7fF+35kUrMMjKW3rKZ7LNI17yxaMi37YEjEMj4pNVl+EoTehe
	lYwAIjACqAS0fls+LKnwqfuMdmxSTYlp0LIfn2b4zXf8WlNPsNFJsMA0
X-Received: by 2002:adf:e181:0:b0:485:ac0a:e11 with SMTP id
 ffacd0b85a97d-485ac0a0f9amr2042121f8f.0.1788919955411; Tue, 08 Sep 2026
 19:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824131729.3694378-1-chao@kernel.org> <CAHJ8P3+KBs1cQnDPsfpHOyjxNA+JNQ5DPCbrF_JqTLcmoyzB1w@mail.gmail.com>
 <c5d29b31-e764-4782-9639-be84b1b2bfc2@kernel.org>
In-Reply-To: <c5d29b31-e764-4782-9639-be84b1b2bfc2@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 9 Sep 2026 10:12:24 +0800
X-Gm-Features: AcwNN1XnP1pvNvot5K4bOpvCxDbaOt_96Kg8CNF6EYisuXeTE1UXjzTVfxL3__M
Message-ID: <CAHJ8P3K2fxeyiq_icgq365DhdO8=DpB3PFOt7yQyvRpbqUOCfQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=889=E6=97=A5=E5=91=
=A8=E4=B8=89 10:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On 9/9/26 09:12, Zhiguo Niu wrote:
> > Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> > =E4=BA=8E2026=E5=B9=B48=E6=9C=8824=E6=97=A5=E5=91=A8=E4=B8=80 21:19=E5=
=86=99=E9=81=93=EF=BC=9A
> >>
> >> There is potential deadloop in race condition:
> >>
> >> Thread A                                Thread B
> >> - fsync
> >>  - f2fs_do_sync_file
> >>   - f2fs_fsync_node_pages
> >>    - last_fsync_dnode
> >>     - folio_get(last_folio)
> >>                                         - f2fs_setattr
> >>                                          - f2fs_truncate
> >>                                           - f2fs_truncate_blocks
> >>                                            - f2fs_do_truncate_blocks
> >>                                             - f2fs_truncate_inode_bloc=
ks
> >>                                              - truncate_dnode
> >>                                               - truncate_node
> >>                                                - invalidate_mapping_pa=
ges
> >>                                                 - folio->mapping =3D N=
ULL
> >>    - is_node_folio alwasy return false
> >>    - atomic && !marked is always true,
> >>      then goto retry
> >>
> >> Cc: stable@kernel.org
> >> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/node.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >> index 968e5ed38816..86c2e67e43b6 100644
> >> --- a/fs/f2fs/node.c
> >> +++ b/fs/f2fs/node.c
> >> @@ -2016,6 +2016,11 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *=
sbi, struct inode *inode,
> >>                 f2fs_debug(sbi, "Retry to write fsync mark: ino=3D%u, =
idx=3D%lx",
> >>                            ino, last_folio->index);
> >>                 folio_lock(last_folio);
> >> +               if (unlikely(!is_node_folio(last_folio))) {
> > Hi Chao,
> > is_node_folio->NODE_MAPPING(F2FS_F_SB(folio))->F2FS_M_SB(folio->mapppin=
g)->F2FS_I_SB(mapping->host)
> > if mapping=3D=3DNULL, panic will occur here?
> > just like  commit msg in  mai: "f2fs: parameterize node helpers and mac=
ros"
>
> Hi Zhiguo,
>
> Ah, seems we need to revert ("f2fs: introduce is_{meta,node}_folio") whic=
h
> introduce this bug? IIUC.
Hi Chao,
seems yes,  we can use sbi directly.
thanks=EF=BC=81
>
> Thanks,
>
> > thanks=EF=BC=81
> >
> >> +                       f2fs_folio_put(last_folio, true);
> >> +                       ret =3D -EAGAIN;
> >> +                       goto out;
> >> +               }
> >>                 f2fs_folio_wait_writeback(last_folio, NODE, true, true=
);
> >>                 folio_mark_dirty(last_folio);
> >>                 folio_unlock(last_folio);
> >> --
> >> 2.49.0
> >>
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>
