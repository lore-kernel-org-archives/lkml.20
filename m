Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793009350;
	b=Kkp3xxDy1wrJQdWFAlO170Dr5sKEy3jJBk0DY7nJE+htyocUq7kzIaHV0Ycgq+O15Bk8
	 0KI85kAu2tvnrRd0mzZ8PvDBYV1HX5rnD2Eo79QyyODmXSS8P/04CxuLmoDAdBmmBSxGv
	 wzctjw55faGZYnn3etjxoRzcuIquERRFG08Z0NOqWgrOhK6Lg41JiRLbSQA1z84ElfNcw
	 AEo8j+/Q2RH6/6QQXKR1qONJwvxQwor07EmFXsSTlsBdupVOYdjcVxY6iIvazFLC5CqJZ
	 DdNaLx45OK/niBIDU70KNR5xRbOjWmgmMsUGmNLOa0oGTnirCrs290QkjCRxcL/JUwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
	b=pm8CabbWs8a+JJBsZ6DJqSwp6+FsuD2/eUlxv3cHxPnlNZEOB5vdi0Afj+lO5NBU4cuf
	 WYox6bXcHb5fNtH/C3tc8bEbIG6nTO4ccamdegkUO0XQ3f90QysZT+6awlrOMte3Apy3r
	 rW22hIhGvL2LWgQi/EuMMqlJNwcT1vqVA1eSZqPiC5t5G8qwr0MaU165wPDN1eC3GFmoB
	 yBbkQiQ1C1N/h4I3aI2Td5tucfWENbS2crmCakQAe6KZ0O09L0CSFvE27Q6vCY9RmCEvl
	 36qukPCKUbOEvJQPSuI7JKoj1f+gtrdJ7VJYcru0DVWjhVpByUAKY9l53PjHsKzO3iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA9FnVWw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA0606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDA0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA9FnVWw
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4806648c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793009348; cv=none;
        d=google.com; s=arc-20260327;
        b=Ls5PQT9dibmEWcc8q/gVhlUS3Te2tXTwx9kZgQ3Ayrues+EOlSh7CeIcFPlVrQoWeM
         K9Lns+dR39rxNNIzW7AWVOq8OMv74vLP8JJ6T6FMLRIOeKcPBisCKd0qqwEm8KQVl6KL
         /vX1YWY04hdHEn/pI2D7ED5Y7LGy9e6bHfttdcbyj7ByvUZynqtBPlBHyQDJWeNADIF6
         iaBFwz1pu+aQkNDMNup1EuAJQx7PV/42/806UF17h/gwpzT3aB6/YsuBofxQ2x/EVHLe
         LWl5i5GqCUVJJXN6w2qCmOxYZYYQBcDO/bFtaxPMoX6kMaWPOuPlSwwhTyoIuBiW//Yc
         gfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        fh=D6M171IP2X4cJCG9GWgKtT+zYMYnlTrId75WJM56HBk=;
        b=p+mwpT5bA1MGUGOf99rdXCoV6T2vt3dpm1cvsdEcbdvQZw6izg0LG2rBAI279dvG+M
         S8yDh8acPFT7V7hOX1fVrDy1ZAjOzM3MlJBqPDZRVl6VV3rzlSoTbNyy2H/mkY6aY1w8
         fqcHYLXlFyduxmtOUSxuIUnwafk0qRgbM8qehlhcBlqM/kf06PmpLN7x/vm+rrMMNnFZ
         jK2LY1bvMlNk56oYYgQjv3+moVqX4VTAAXu1jfSYJDrSnhjQp6f820BD2L5d6pZL+Qnj
         1iHb+VzIOP8MOyZNpmp3jLWIUdF9s50sfSB1IGh6Wk9dpqtZ7wiJkTN0BRIj/WovXee6
         MZ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793009348; x=1793614148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        b=FA9FnVWwCzdWrl5dV9KBXUQ3q/f90Hear2GGjarskzOfwkVUVPV6siYWJQontuDlOi
         Zq3A8r5uPTrQgMDAT19fKl9rXfnAZkHtfh1Po5ZYIQQ71cb402idibkLMf/GrR30/Rhi
         EzyAAdOiqk34LFtcB+e3UUVDZfpbjuwmBiJ0ZOgqbJ1heUfuVzgWYzPL+afcs00qrc4e
         EudXjDayGsbqhrqbu+PajSpOJs5+XabNWAACixIsIksf+LWI7O8YAEc2dVlxwfoe8EiA
         0Xsi9J2mPnHnGU1sM4QuegJ91CNkjHk7SAhv/Tz4XrXHd+EeLNQLSUV8s09z6Ij+V2mO
         KoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009348; x=1793614148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        b=D+1pePMT9M0z7iNoqAssEt2gl3L6cCOr5IkcqZT9rGCYyrP3E0dVbV+mWHwm0ee1vH
         4I0HPdAaRQG6WXoX2nfhKj5VY+bRvvBunZeoGDRYu++lDvaekKMZgiznJbDLRNTVWwQF
         7z/zD/oJI++qvBp2gGCi/4huO97gIXrvpnIkThghhSt9dfKQkDCMSPPdc6Zua89K7ZVm
         aE0AgztgxPcS3gTjyKpZUP86K3wA0/6Feio9Ute+jPrYVWUkbN8bCWnQ+6zGxcbZDvWb
         WEzTAgjsCrWqb2LEYX+O2RIEV027W84OGIRnjpEkndMh9Bt6sqRvg6Me5RFDkOXGTFkb
         /JIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLkHUkt5ZNhCkedouLXtryMBpNyKuzqEp6WBj3x8h4QOMDECCqTh4Ls5sf55J1hwGOFXDohQ3wVe8qp80=@vger.kernel.org
X-Gm-Message-State: AFq9FYILivVERdn4YotGKhCOjG0HZp1rat48H1j+CnG+apbvGDEs2xx6
	VCPA5X8MJy/RObg469HxAEAqz6g+zgGctbYZiURRb8URUt6ssIJUmwJ/zcW3pkg0+P4rWWDE8sF
	voCyj+mBsqqDcTBPD4nOoyEZ/ydU0KNtSOX5O1wbg
X-Gm-Gg: AYBFou2HyoDpBs6grQ/VJ4U7Iq82I2sH9nUkPCljzp48jEL5s9wqTxaAMQtvmLUN0h5
	5mjzQvfT2ijN2jXEs8HhDjXzSUJNWnULgtvZdeukCKORtGFkBaTw1exggD8EvfN56awWvzqqE/a
	03nTwPxjE2w9RqfjZteHaKHS3kG8JBPwqPyUyPZZSNmsYqYW/QamRJLXcdZv4Z3c2X8aW44/P7l
	vzXySxN76e3t4W3IIE5Q35FAZSqzDtjAYmeyjxgRP/sgFHjniZ6AKLz1VfnExHwPfIX/cWBhMK6
	YFjxfNOZ2i57F+4WN2392oDCXSk8kwb2A5cCtWpDp1YbpOT/qoEahmOT4Mgz3B013bzJFK7bT9Y
	AU3+ANcyPK8oNJIoLiSjWgRhXGWAypeaSNQv9P5FQXKiwC+TKS9i7bQMEtsY+ru32dJ9q
X-Received: by 2002:a05:701b:230e:b0:18c:640f:7f48 with SMTP id
 a92af1059eb24-19936b56ab7mr8768054c88.44.1793009347392; Mon, 26 Oct 2026
 03:09:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
In-Reply-To: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
From: Marco Elver <elver@google.com>
Date: Mon, 26 Oct 2026 11:08:30 +0100
X-Gm-Features: AclHuK-_bb8psGiBbD_JTWNAC_hBLtM-Cc7GOo20LnSEwgov2hxqFzjQ2_-lDFU
Message-ID: <CANpmjNODG_MBuSJvRkzUjwWqeD=hSQLWtHkre8=9Z6-3ZmTKEA@mail.gmail.com>
Subject: Re: [PATCH v2] ext2: Make sbi an proper alias for EXT2_SB(sb) in ext2_fill_super()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Kara <jack@suse.com>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 23:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> A recent LLVM change to fix parsing and validating __guarded_by on
> structure members [1] reveals a couple of warnings in ext2_fill_super()
> from the annotations added by commit 023051c2d0f1 ("ext2: mark
> s_mount_state as guarded by s_lock") and commit c23746524faf ("ext2:
> annotate s_rsv_window_root as requiring s_rsv_window_lock"):
>
>   fs/ext2/super.c:1040:7: error: writing variable 's_mount_state' requires holding spinlock '_res->s_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1040 |         sbi->s_mount_state = le16_to_cpu(es->s_state);
>         |              ^
>   fs/ext2/super.c:1040:7: note: found near match 'EXT2_SB(sb).s_lock'
>   fs/ext2/super.c:1138:8: error: writing variable 's_rsv_window_root' requires holding spinlock '_res->s_rsv_window_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1138 |                 sbi->s_rsv_window_root = RB_ROOT;
>         |                      ^
>   fs/ext2/super.c:1138:8: note: found near match 'EXT2_SB(sb).s_rsv_window_lock'
>
> Context analysis does very minimal alias detection [2], so it is not
> able to figure out that sbi == sb->s_fs_info == EXT2_SB(sb). The only

Right, though function-local aliases are resolved. We just aren't able
to figure out aliases that propagate through non-local variables.

> reason there were no warnings before the above LLVM change is because
> the annotation was not parsed and verified correctly.
>
> Rework the allocation and assignment of sbi to have a direct assignment
> of EXT2_SB(sb) to sbi so that the analysis knows that sbi and
> EXT2_SB(sb) refer to the same object, clearing up the warnings.
>
> Fixes: 9708538ba204 ("ext2: enable context analysis support for ext2 filesystem")
> Link: https://github.com/llvm/llvm-project/commit/217e229a1f32785fccdd3b3f51429f0d309dea45 [1]
> Link: https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#no-alias-analysis [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

Additional note: This was uncovered by an unstable Clang 24
(unreleased) change, which was meant to make the analysis more precise
[1], yet stumbled over this. This change is needed to prepare for
Clang 24.

Thanks!

> ---
> Changes in v2:
> - Fix allocation size (Sashiko). I thought that I checked that they
>   were equivalent but I guess not :/
> - Link to v1: https://patch.msgid.link/20261023-ext2-fix-context-analysis-clang-24-v1-1-2b35c33cd0fa@kernel.org
> ---
>  fs/ext2/super.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index fb217ef2d69f..bde5b433776c 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -883,17 +883,18 @@ static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
>         __le32 features;
>         int err;
>
> -       sbi = kzalloc_obj(*sbi);
> -       if (!sbi)
> +       sb->s_fs_info = kzalloc_obj(*sbi);
> +       if (!sb->s_fs_info)
>                 return -ENOMEM;
> +       sbi = EXT2_SB(sb);
>
>         sbi->s_blockgroup_lock =
>                 kzalloc_obj(struct blockgroup_lock);
>         if (!sbi->s_blockgroup_lock) {
> -               kfree(sbi);
> +               kfree(sb->s_fs_info);
> +               sb->s_fs_info = NULL;
>                 return -ENOMEM;
>         }
> -       sb->s_fs_info = sbi;
>         sbi->s_sb_block = sb_block;
>
>         guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
>
> ---
> base-commit: 782654a3e9c4065dea2e9f10539899d348b7a1fc
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261023-ext2-fix-context-analysis-clang-24-504b5dd53038
>
> Best regards,
> --
> Cheers,
> Nathan
>
