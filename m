Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868339D3D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953758; cv=pass; b=hVwygIlbWK4/FD/vyEgl9hgEAtGAq+pQRReg7S6gSlqCoGPUqpY3E+2gdX/jJVWy+/xUpsE4n5+3wWeviY8qHM/V5cw3cfCjo2dk0hbipRYw/90bVAEVu9mWpgDuJ30ht3ddOC7N4L0Wa1YkUPbJS8pf7WBVSaewuG87hcWhza4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953758; c=relaxed/simple;
	bh=CjWdBc3B8rENPgmodyu8PmsCBxjFiNzCuXkbldGvm40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewyLXj11USt0QU7OozHFNhSIhOdw3AVdExm9oThd13fmUj7VvNkb1QThoYABICf1cD0mgWibrYbDCUAxzR9PMsX1wKHspfOk4uNZ1crhrksYNwUH7QbVK1UXcd/FeSVfzk+Mjq6gG/2FhqBDwQbU69Bbkptu01Gs3qJiII5C7rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsswAmwq; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsswAmwq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8917c712f32so1671482b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791953757; cv=none;
        d=google.com; s=arc-20260327;
        b=ES/q8g5vPgAvyNEcrrLROnDNkbvm/64mf6q/BgRkpCqtm8ObJ0TnPKhtWOxfVxNWT4
         DYZzHHcGk2pjbshzbH4WSgbJbK0421+Ws2gEn8nsQmR07nuOq7YsWJnZR2rcd68m98BJ
         TGBZO3EzN5yoTVr9yXmPeGknuvLUbhfzwarXESDepr+H/n4BMomEIihUG0c1VGdWkIjp
         MNPOhoSmsb1Rj3A77l17uFDflvWuytXu4VNTvbhABv8F5PIfyVa7QCl9fRcdAwafpwiz
         IgaO7quse1ove1Ia8XzzbtlLl0dj3sm7vZ/rUhk4Be7yetlb9P7Oetp/2WiFtM2rq9EJ
         eg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72b+1LHt9+hdKqPyNvJXnq6JkgqKmPUrz61pnObU+/c=;
        fh=ivAXmrpx7zk+Ad7KQQ4X8ep7DBWe8cANURmP9q/ElXE=;
        b=lEVH34i79bQzmoSkxjYEnfKlQDMyYjvGfE2J9SDirPVisUmPsSm38axBunGKj0tLBv
         ahj1UQybAxbvl2O8V5NroZ5f2TXPAGVnhNeltLc92bGEcnBfiGkRzhdH+EJegEJc3Wpr
         QhIs2GeC1opRm5yCw02M+pafUIvQn5pGPykZY5qPL2hAeSLsUfwWkPi30m/g/Rc/NKDM
         FC1fP8ODXDHF/f5e8ECHnKAQ0cou7UdSqt4fdf8E6KUcA8Wdz3yawjf2Becba06xIpoE
         uf58SVfX78qPkHDamgMjwLDjf6HHZ27PUEhJNb2s4c8IRd8dt3RoR6OKlqpRzTB4Rlj/
         v/xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791953757; x=1792558557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=72b+1LHt9+hdKqPyNvJXnq6JkgqKmPUrz61pnObU+/c=;
        b=QsswAmwq0Up7zBugE779lo1VMa2uwt/3lQ7SCtWtiXVq0gkE57w25B8d3wYOmUhp/2
         0vHo/ZTDnQLOAs/fseScbGDre+nPFFu21dXSFAiOBoXnuxtG9KIchs5dTFWQ70ama1Ca
         hp7ZA8y5fFV3SQ/fDVc91lM46PR+I1Bh8raNce2FD3Zw79KQXNRY1b8RH38KxQomrXvk
         I+qFUYBc7Rqo7q+N/UZEy7IekDkKuWv+V88d2Kz0ROmX45YvuU805dUv4jk/nwwlzXj3
         OKDwi9tXpF0/NAe8y4THS8IMWg9yXu1+gkmsrlyKr568J+AA5F/aN7KN4n+2hEcSb/CD
         whDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791953757; x=1792558557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72b+1LHt9+hdKqPyNvJXnq6JkgqKmPUrz61pnObU+/c=;
        b=quFju7f4Rb0IxcUq7CMGHILRLMWRKBKVtg4CvQ3IbMga9diA1/6bbBvQR64Nrs4/eA
         dU0WhJ0Wt2rEpiWsqirQ4eBTQtaE3lVTz8gPsZn6Mw5DAr7QXgjuFUztAYFAmYO15N7p
         W/ecCTALjxvdZE4ylW6r39LEiv+2pwSk2YOZEYthkT25OC4bKfGRInqlHScmugxzc8p/
         JMk8PrwSWhJldDwsP9vO/Kt/BT3bE3xwZUCG0bFrfTiwA4BD/aaAcGN98WmwTqdMCqVY
         1CJlWDD16CVkvMJYZ/WFMQOGFI5Gzn24FqAu1pPetji7gKJh4aqYIIReK6u5UIu0iECR
         5NIA==
X-Forwarded-Encrypted: i=1; AKwUvBxE4+j5IZ0mCW2lQM5eT2QCIRg2vEG5xCjA5U1Y7qX7nHnkS3kRaVz20ZwwCKGyOSzjYJTVedpvhtEZLyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8efT5XfHXpy82bFvp0CkNFud3jPB53wiX9U3Ldr5fR+antKu7
	Jl2OM1KkirC1jQSqWwiDo+kMSwyq3dacfzvF6kWT6Pshdmlet4Ot96+Cj9t7YZ3IKESCr31u38A
	77a/SxWTtheKcBxuEPXrITE952wnlhwo=
X-Gm-Gg: AYBFou25aI8tmaqH36QcYy3sNWF86QD0cpUXrvqKzpipI6Ws1qanKQHNh3ENstzq1O4
	5WHUBBnmVLNsZ4QoSejRUR+D0RizbqT4PTmPENEJGXp3LGIh6xqPSm3c7JjPxPgnbcfXHVj0kfK
	9KCcxACNQPstcTT9VNXVveqVAtR2WizZYMceJIt/wPwYFxgOUw77Q6l61//1oIfDQ1cJJ8JYU4l
	xLySgN3ohsRULx8Tte0EtP+XmwI0sfxgfQVnsLd46JuNnri8mWNbzWoG5dCJs2MRVHYvISGLcLf
	xS9DuLJAQ0fayKygb9CiNS3ett4AACQEmypTbgHf6dxelMLUlWz2wbmLU++ieJXlY5oSgGcBAZg
	sB/six6hA7wmqXBs2kTDjClaIhqbJxSwCJ/TnPS+qna1n
X-Received: by 2002:a05:6a00:368e:b0:883:71f6:601 with SMTP id
 d2e1a72fcca58-897c76e3765mr11567880b3a.41.1791953756545; Tue, 13 Oct 2026
 21:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com> <20260829060524.2656620-2-qiwenjie@xiaomi.com>
 <20260829060524.2656620-3-qiwenjie@xiaomi.com> <CACOAw_z1UUG0e+LSGmer_mPv+YcYVcjFiMLZ6RwhmYtmrObKXA@mail.gmail.com>
 <20260901025344.3466776-1-qiwenjie@xiaomi.com> <CACOAw_wnDrd_iQ1GALuYx59Pc3-qJeZbNU1JajsHJ5zMSvabow@mail.gmail.com>
In-Reply-To: <CACOAw_wnDrd_iQ1GALuYx59Pc3-qJeZbNU1JajsHJ5zMSvabow@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Oct 2026 21:55:42 -0700
X-Gm-Features: AclHuK_crll8FUHdLlNNloeiQF3l22usDO_LM1nZ5NybgUyewYvKqc9W-b88SdA
Message-ID: <CACOAw_xV4J8r6exS3ZdTA1aY_bjQ+PFL5LVn4ymLanxqHGqLGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: daehojeong@google.com, jaegeuk@kernel.org, chao@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 8:58=E2=80=AFAM Daeho Jeong <daeho43@gmail.com> wrot=
e:
>
> On Mon, Aug 31, 2026 at 7:53=E2=80=AFPM Wenjie Qi <qwjhust@gmail.com> wro=
te:
> >
> > Hi Daeho,
> >
> > The second check is intentional. The first check is only an early
> > validation before mnt_want_write_file(), but mnt_want_write_file() does
> > not hold sb->s_umount. A concurrent remount can therefore change
> > resizable_tail_secno before freeze_super() obtains the exclusive
> > superblock lock.
> >
> > A test-only hook pauses resize after the early check and before
> > mnt_want_write_file(), allowing a concurrent remount to change
> > resizable_tail_secno before resize continues. Starting with 506 section=
s
> > and tail=3D1, the single-check version let a remount change the tail to
> > 128 and incorrectly returned success. With the second check, resize
> > returned -EINVAL and preserved 506 sections with
> > pinned_area_max_secno=3D378.
> >
> > The first check is the fast path for invalid requests, while the second
> > check validates the final geometry after freezing the filesystem and
> > taking the resize locks. Both checks are needed.
> >
> > Thanks,
> > Wenjie
>
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
>
> Thanks,

Hi Wenjie,

Thinking about the actual use case of resizable_tail_secno a bit more,
I realized there is a semantic issue with keeping resizable_tail_secno
unchanged after shrinking the filesystem.

The purpose of resizable_tail_secno=3DN is to reserve N sections at the
tail of the filesystem ([MAIN_SECS - N, MAIN_SECS)) as an unpinned area
so that those tail sections can be shrunk later via F2FS_IOC_RESIZE_FS,
while keeping the pinned area boundary fixed at (MAIN_SECS - N).

For example, suppose a 30 GiB filesystem (15,360 sections) is mounted
with resizable_tail_secno=3D10240 (20 GiB reserved at the tail for
shrinking), so pinned_area_max_secno is 5,120 (the first 10 GiB).

With the current patch, F2FS_OPTION(sbi).resizable_tail_secno is kept at
10,240 after resize, which causes two problems:

1. Shrinking the tail eats into the pinned area instead of consuming the
   reserved tail:
   If we shrink the filesystem by 64 sections (128 MiB), MAIN_SECS
   becomes 15,296, and f2fs_adjust_pinned_area_boundary() recalculates:
     pinned_area_max_secno =3D 15,296 - 10,240 =3D 5,056
   Even though we only shrunk 64 sections from the unpinned tail, the
   pinned area boundary shrinks from 5,120 to 5,056.

2. We can never shrink the full reserved tail (or even part of it if
   secs + resizable_tail_secno >=3D MAIN_SECS):
   In the example above, if we try to shrink all 20 GiB (10,240 sections)
   or even 10 GiB (5,120 sections) of the reserved tail,
   f2fs_resize_tail_invalid() rejects the resize with -EINVAL because
   secs + resizable_tail_secno >=3D MAIN_SECS (10,240 + 10,240 >=3D 15,360)=
.

When the filesystem is shrunk by `secs` sections from the tail, the
reserved tail itself is what is being consumed. So instead of keeping
resizable_tail_secno fixed, we should deduct the shrunk sections from
F2FS_OPTION(sbi).resizable_tail_secno (or clamp it to 0 if secs >=3D
resizable_tail_secno, and restore the old value on checkpoint failure
rollback) before calling f2fs_adjust_pinned_area_boundary(sbi).

That way:
- While shrinking within the reserved tail (secs <=3D resizable_tail_secno)=
,
  resizable_tail_secno decreases by `secs` and pinned_area_max_secno
  (MAIN_SECS - resizable_tail_secno) remains unchanged at 5,120.
- Once the entire reserved tail is shrunk (secs =3D=3D resizable_tail_secno=
),
  resizable_tail_secno becomes 0 and pinned_area_max_secno equals the
  new MAIN_SECS (5,120).
- If someone shrinks beyond resizable_tail_secno (or when
  resizable_tail_secno is 0), resizable_tail_secno becomes 0 and
  pinned_area_max_secno is clamped to the new MAIN_SECS without
  underflowing.

Could you update the patch to adjust resizable_tail_secno accordingly?

Thanks,
