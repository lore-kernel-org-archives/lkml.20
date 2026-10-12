Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183B37FF76
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830798; cv=pass; b=Y++wxCaE8FtPhNHZG+yof86TfdenHbEk4lREkesqXUw8TfVZIl+PQSSm0KfR0oxSpKj1QIkO5QhakQIohe9/91wN7H/OogZFBYBkiuHaTh3ZEpiSUOcyVxHb8olA4AYfCB0+NjdYWRm5Ity9TJLw+cti9MNUSpF6J80hHbyQcvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830798; c=relaxed/simple;
	bh=a3W5CdZ/6wIE/bRW9+nvCOM1e43TIRSkm7Yr01UvQqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpqohNmOad9avE785y9Y3ddlG9XEY12SpzqgXlQQqiZYVSBxHO/ov80te7KmWEfC8kE5JsFSKXP3JN7d43IBPKjZFWkun4p3Sxv0mgxDuOtr81pVN3T4fLEZetH7PPYqF9iTlQxo+eAF0dAqAB0SuxNRxTXm9uoTSUsaFUBBwc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spgkQE9w; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spgkQE9w"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso12212025ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791830791; cv=none;
        d=google.com; s=arc-20260327;
        b=FWhe9zi/zBjugkFIOSc+mVRAxvBtQns/iNcvM0s4T5aKrKoXhVqlv5wj04umoEVztq
         P2Nyta2cb1Z1PNInyQweIxPbkj0ubaMy0x3ddAGuLnRpHEqtoveuXXKie0B2vbTHNGin
         NpcsW5g62QrPyTGbqdRRu5KDddJuVD/qj2iS4zyz3HYMnOqwrDTG6oB4epTotSIZruyL
         wZigPDj5rrADjsJtvhRF00ST/YT0Ru6Wk4/nSKqeFSurjv6+waga0n/m6yvCJ6Y8RwUB
         EjD9Uf6x/6qI/hxJL6WDNHbf3yUFXrw6rjx+9GIL0mdZwUgphTNbGkDOv9cYfxB/LXCg
         +Ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGXcf0ARVBkmMwtiaf/S8Kf8sFefK7Cy09KXxnSmvl0=;
        fh=IvJDhn2XbJ55zxf0p/e9A+SWoPpre/ymwh9Q/MPTdCg=;
        b=sxNdg2BZQbZswaSpG/EYNTGLpBRqeGg8w8p1P/iVGmyoLKU/vDtc6HuMbDKT+GUBNB
         Ng5cwf22voppLoW18WhPqYOqW+POpZyGmsgrJ+NRSFnwWXa5+gGxfPEwmcaSulyDhDFq
         JgwNuzCpaoNnoE7DyerSCNf065gYAqj9TQC7mrcq4/JPDmJTRTAzFtoKiCWHAjAphbp4
         zAchDzruLsRUavlIooZ1rJXElyav14zhOdCzdZVjbHfLLevrLqnxOA2OXOiIoQeX9SSA
         yeE7rI3y8M1vojxAY5uF0Do9tCe77pJgIMaLFpAX+hTwU62y+cJU+ZzoajuFp7arzE6g
         1dyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830791; x=1792435591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VGXcf0ARVBkmMwtiaf/S8Kf8sFefK7Cy09KXxnSmvl0=;
        b=spgkQE9wb0q+xwSNLU9pzZedHjSPO3Ffx/G5kFB8Sy7kn45dxTf14V9TauUfLcfklY
         al1eUEzJ6xrbgs9fjPkFI4W6evF4n8d5D/4JeYcbzdvtz+uTqStMwf9UTD+Rr/aMHINM
         LthKImSitl4PoijcfGZptmsAAW7gwiyQEe3CAtTzWdkM6rNzfMNma3Y0ZVq7jVJ9uaeM
         wJayCmZgNs8xRU/nYHJ57Wc6g4G0AJrLPZ3bPDYWgXEcryaV4gMnAuKSrP/HzkhfkJYK
         OHGsxVueMoEzEiXjLL/ZfB5cw7muy2sWn7bfzpJRpEKb4KrMh3bJNYyc3bss4nYnZWjt
         CM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830791; x=1792435591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGXcf0ARVBkmMwtiaf/S8Kf8sFefK7Cy09KXxnSmvl0=;
        b=cQCh+EG6VXtCjnzGl1AZEnaYGVBO72nawaUrkiShFZsUESsz45roqIUFcxQ9psKWOp
         aaoGMZh2M6KsIvBzSGCqXck9mjQ8J+L2AGLHPa6qKW7/JMj9f2J8joKpQTo9a9QqhoDi
         yAU5rEjK1NQak89d4EhKbHtcNtI39j+s/rbc36YZqvWkxEfwP+flp9y4orklJhT4GcG6
         hlD6W4S/T1MhVvnjvo5LabC6Ff1+C4abgU57+K7pHrzAnYP9/Hz7ljttinzsPMt4hIQ8
         442/+XMDuoYcqFuhNhxztrB4UIqv3rziU1E7T6RMjjtaU2PMx5YT3FOB4tRphkZ+zcT4
         6MUQ==
X-Gm-Message-State: AFq9FYL9mGSVriZv6Ezo94w+0IUAs5xiKDh6StPwf5643Rb/vxzbTmsC
	hHpeAoF/nTHE8PRHd770Cc14QnNMadNRL9QYp0Se5vOpbrKMgaueDPKhaUdNzfG3O0rXhyD1tIo
	5Nx8whV0jgWPZ/oS8ZsUYyQsE/6IPQJPocw==
X-Gm-Gg: AYBFou03kA5wEvYK4y3vL5AWOCcNAjol0TOSgIXQ64sywnH3guCiQiNUmQFQS3TvSGv
	64ptSFe5ASmX1gMB4IlezSf8o2TmsUjLdctaYb+RdV1vYa2YtfPGQq4+Zbqy+nWShTDGbYg1GD9
	3UfTvuxhCCecOeKKZW1N5QfbppUKi0YewLqQJmVm30ZZ+gz9ZknePpcWBfebHzPaFRzCXHsuwH3
	LETIJpGNoftkpkcTZSo3AYwbDaWwoKx9x1xH/mpsPOeFfxAg6HxbyErQbHtHHcIVK2ILz9a6RF8
	ddz1drZCrBuUXjg16iietKgV1T2Xi9NGOJiHQuDKu/wK77klddlGMtiXITslpqYCgj2H9JqcBWl
	z9qaPuRrMnNs+mW0JE2jnqra1Kxuq3emuV8hkMDXDwic=
X-Received: by 2002:a17:903:38c8:b0:2d8:d4cd:dc8f with SMTP id
 d9443c01a7336-2e842ab8115mr85849255ad.18.1791830791163; Mon, 12 Oct 2026
 11:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001180758.2099491-1-daeho43@gmail.com>
In-Reply-To: <20261001180758.2099491-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 12 Oct 2026 11:46:15 -0700
X-Gm-Features: AclHuK_AXzsOGRQGRcR2-gxwOApKYz3H5Nd1BDK7klATbk90vU191GFnNtuBy8o
Message-ID: <CACOAw_z6eVFMg8qGzCXkbGk_Jxa6Wv1JBjaq2Tf12qE9LbJgmA@mail.gmail.com>
Subject: Re: [PATCH] fsck.f2fs: enable fix_on when CP_RESIZEFS_FLAG is set in
 auto-fix mode
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:08=E2=80=AFAM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> Commit 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online
> resize due to SPO") added logic in sanity_check_ckpt() to recalculate
> and fix user_block_count when CP_RESIZEFS_FLAG is set after a sudden
> power-off during online resize.
>
> However, sanity_check_ckpt() calls f2fs_should_proceed() and checks
> c.fix_on before repairing user_block_count, while f2fs_should_proceed()
> did not check CP_RESIZEFS_FLAG when setting c.fix_on in auto_fix (-a) or
> preen (-p) mode. As a result, running 'fsck.f2fs -a' after an SPO during
> online shrink leaves c.fix_on unset and fails to repair the checkpoint.
>
> Check CP_RESIZEFS_FLAG in f2fs_should_proceed() so that auto-fix and
> preen modes properly enable c.fix_on and recover the filesystem.
>
> Fixes: 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online res=
ize due to SPO")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fsck/mount.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 2fd8e1c..8479ed1 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -1515,6 +1515,7 @@ static int f2fs_should_proceed(struct f2fs_super_bl=
ock *sb, u32 flag)
>         if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
>                 if (flag & CP_FSCK_FLAG ||
>                         flag & CP_DISABLED_FLAG ||
> +                       flag & CP_RESIZEFS_FLAG ||
>                         flag & CP_QUOTA_NEED_FSCK_FLAG ||
>                         c.invalid_sb & SB_NEED_FIX ||
>                         (exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
> --

Kindly ping this.

Thanks,

> 2.56.0.rc1.315.gc6ed9934b7-goog
>
