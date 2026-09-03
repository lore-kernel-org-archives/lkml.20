Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF542A7A8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431724; cv=pass; b=Ta0ROeNKmBN3iYIqOzipGZosMn2QJefwWSQ8oLGxaKgXgzr2QBnCz7T0FYDOHGdBpSUDiWBvlvmB9ujbQd+bjuAYzb65TnM1i6uipbCKH0CNUi1R/N77x42UigdbgBpTDEfktGirgoZWQgqhcyxoO5I78hKUCv7m1ur17WtqLqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431724; c=relaxed/simple;
	bh=/zyYtEZmFhhQgOsgXNLJ+e0A/ltm9fi9IENg+VYRnRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olW1tXcpWQ4GilAwiNkfwykx+lu8o9muEU0hTIK8aqwFb+rWrBakh8H3UzzQMYBICRPsqPW/6dibvo3iG9URmrFOIM6krfUQS0yQJaOD3wHjXWHa35/+wtbAkh8FjgAHg2jsaDqCeWw4WyayE/WlLJ4q2Y/hxMkBFRWM6BPNcrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lE/ZWT5v; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lE/ZWT5v"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2322191a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788431712; cv=none;
        d=google.com; s=arc-20260327;
        b=PTVbcktg6pBqTRxf31oph5VRcu6f96JsC1L4QxEYyNc16op1GrHvyVVe+3h08GSFGL
         YtnwTcsbw2Wlb3TMDABRClXSBgTGydgVTkVQVxE7zLMNDDtxrvXDhPkAB6QZr7GVbbWF
         t9EeV2gF2tI2dS0Q5oFpYgb6nE4bLyN3f6HoM+ZgvqgZLJbj8NVxtCqGaBmbAVNTL2MY
         ByFScpiz+q5OCK/TtDsYPk00ysy4TZ5myR3Gg4blj4CAdSDSOZ6DcsSvgotfh4DQkQ+z
         hXgTmJFWoUUrm2gwORy7I4iZfU+pxtiFpsfWQb7HQ3uR04vxbK0z044iNhc5HPiwaRTN
         y9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A1wiUzfIxqJZYxMHbVMwIllXO/kuz3RAjcv5fqZ/QkY=;
        fh=Z5ne2N+VC6cuZqK1dymMqW8LPRSFpD5lq+Acqdf07nk=;
        b=nYlUTYqLwAO++g7DFyS5zGqcHQkXxkbzcUR24vf6zZ3RncX7TcLupfavKjyfD1FJMM
         fVMBhuvQNtesP6f1GtxOfl3odteQfSfbURFrjRkNaWbA2oYcrgOD0t30ZJkUW4ZeYMib
         9nZUgMjlEaPzLrN+H6qVCF9009posT9Wj2YqBEeAO+uMptB8Uscq1tVho7FfQmwy2tz1
         /IV4V5/w629Wa2OPZPkZvPJdXStM+CwDKDxGsxrtW6mSFoEHpcxXiiwgVQtFxaRGB4bR
         PEYe0m/PwDt8V8c/hbWATcKT3nzG3bCoyAYOlZ8Vu/w8Za0BZXh8KiSX9bEXvQQWB8EL
         wE3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788431712; x=1789036512; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1wiUzfIxqJZYxMHbVMwIllXO/kuz3RAjcv5fqZ/QkY=;
        b=lE/ZWT5vVhGhIftgyHocZbvleVWCk6i8HMIpDwRkqRHYL2WYH4ywyqPSkj8CCVZrEo
         qM6ZAjznBnVQsfHyIKm9r4maGVGzZLcXsKUX7Fhmoh2HSXJIc24PLWQRsJxXcknuPrT+
         krvl/QQQuFF+mA+BnnRgMA9OR/HbpkR6WIWHOPcFs4Mq9PPOQLNsbWL1snwKuuiNLDpw
         PO4W/Phcd/vuevy3m7l/mRhQwBGXrZeHrK+P9fcOr2eRMjFHm7rODhcBoeTaiKG6D2g1
         o/CBPQuJcaxhNMCi+JSyj/2RTqTam9akqVkwRUBUxu3dh7QHimyL4fSpwo1Xl6fBfc15
         Noyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431712; x=1789036512;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A1wiUzfIxqJZYxMHbVMwIllXO/kuz3RAjcv5fqZ/QkY=;
        b=ORgiGy6s23HfRp+u/XZYwKMsaGvPDgOhTA2E8F9aD8FQPr8kdrgPZYuQB5EPCMQOLJ
         FY298apOy2TDHG6xelWoOAokUi2nNZdgyMM9qXC4llYRgRXxjub+p7r7IOPioro9rSMM
         XQWU7CMQJWwIGwx7XpLGKy6M6mYJRP4QKqiMqHYEuWihfZ0MXkw3kFSGZyxNYOPc45bs
         0Fe1UiyDAH8xPUFMSkoZktT1vVsdkYhKVlhvlbkYFn3t2nXDAHmlYPmvCwbl8/tJvB5N
         /fXQ+BabRhGev8fGGyMGVbXRrCthVdvmwsdxfKLIo6tbvSIhC+fsL0jTSssC6yuHLQFe
         bcng==
X-Forwarded-Encrypted: i=1; AKwUvBybhc53O6aMt1dYdUXZp8fBfo2a4N1lOZunfTGRpxQOa82k/RXK3qXcH3h9cR1D3AkTlNKszyVSuyHnV0I=@vger.kernel.org
X-Gm-Message-State: AFuF++lAWCbQ4+8CrX9322zWixx7FZosseF3/jnSk90rTQ1TiAtDcoIo
	ws6EdU4HrIZ5MHne+F/OYkw6sOsB+yWwvTvA8r9R5tIyvF5UgdIsjriUZ+TPRpVBg2bvX8+kHbx
	DbQivZJp3EiTMn0wv2iXH9+dr+ZqZOnY4hS43hgJckQ46Kjey44AJ403bFeg=
X-Gm-Gg: AYBFou1MPXbhaA1aWu0uIFv9w6YAZq/MJ9gBEzxuLeOl7CvjW8vfPSvZ/eXT69wUFAE
	KjeMZF110YxoNeX/QYVjeCpoO6jCqwVRW/SApeztl/i6y4g+gfg+a+07dLfk9BYPjvWUbjSZQNj
	+nOPILTroMnKsbwBGyyw9sfRPJIGQgxsNWkRqaYY0YjigDlNCXVNZuWpAFUkqUodPuUSwkuf73G
	cL4A136658RHbVaqhNQZHKhewoo/79JTVLLJyCrNxPI8rRWk2GWMKNbsj/+fMv45M9iKfv1gdI1
	Swc3FdWLVB594fxB5X45dasuQ+HtXcc1xlS5Z/Juk7cDYz2B+sm5yO7QJcynTXbRw5KnRNm7E+O
	P
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id
 98e67ed59e1d1-39aee285570mr19268361a91.25.1788431711616; Thu, 03 Sep 2026
 03:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811160336.782342-1-timday@thelustrecollective.com>
 <xiymqvu5la6h63umrp6upnzbl3xjjcacuyxg76xp4labnrioyj@xowfpjlhfrzh> <20260903072759.GA1750084@ax162>
In-Reply-To: <20260903072759.GA1750084@ax162>
From: Marco Elver <elver@google.com>
Date: Thu, 3 Sep 2026 12:34:34 +0200
X-Gm-Features: AcwNN1UBcaXn6RBIaclwnjVOGuTZ1dRp4jV_o2Hi5QwVrPsWTxTE-agnX7TT9dM
Message-ID: <CANpmjNNWiX51UU064+P823sDX42=O6ChSHrUux1aNqLj60mfUg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Support Clang context analysis for ext2
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, Jan Kara <jack@suse.com>, Theodore Tso <tytso@mit.edu>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 09:28, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Aug 18, 2026 at 11:58:20AM +0200, Jan Kara wrote:
> > On Tue 11-08-26 12:03:28, Timothy Day wrote:
> > > This description is mostly copied from v1:
> > >
> > > This series adds annotations for Clang's context analysis to ext2.
> > > Clang context analysis was recently added in a series by Marco
> > > Elver [1]. This allows the compiler to validate different
> > > locking patterns at compile time.
> > >
> > > This series enables context analysis, fixes pre-existing warnings,
> > > and adds new annotations. It is inspired by similar series in the
> > > block layer (NVMe host driver, for example [2]).
> > >
> > > I'm starting with ext2 since it's smaller and simpler compared to
> > > ext4/btrfs/etc. After ext2, I'd be interested in converting the
> > > other filesystems and infrastructure code in fs/. I think the ultimate
> > > goal would be to enable this by default across all of fs/.
> > >
> > > The series was built and tested with Clang 23 with
> > > CONFIG_WARN_CONTEXT_ANALYSIS enabled. I based on 7.2-rc7.
> >
> > Thanks for the patches! They look good to me. Once the merge window is over
> > I'll queue them to my tree. The only thing I'm not fully sure is how much I
> > like the spinlock_init scoped guards - they looked quite confusing to me at
> > the first sight (as much as I understand the convenience, conceptually how
> > can initialization of a global lock be scoped?). I'll sleep over it, maybe
> > I'll change them to just spinlock_init() + scoped_guard for the lock itself
> > or maybe I'll get used to them. Anyway, no action on your side needed :).
>
> This series is now in -next, where I see the following warnings (or errors with
> CONFIG_WERROR=y / W=e) with various configurations, such as ARCH=arm
> allmodconfig, when building with LLVM 23.1.0
>
>   fs/ext2/xattr.c:825:6: error: rw_semaphore 'EXT2_I().xattr_sem' is not held on every path through here [-Werror,-Wthread-safety-analysis]
>     825 |         if (WARN_ON_ONCE(!down_write_trylock(&EXT2_I(inode)->xattr_sem)))
>         |             ^
>   include/asm-generic/bug.h:180:2: note: expanded from macro 'WARN_ON_ONCE'
>     180 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
>         |         ^
>   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
>      30 |                 if (__ONCE_LITE_IF(__ret_do_once))                      \
>         |                     ^
>   include/linux/once_lite.h:23:3: note: expanded from macro '__ONCE_LITE_IF'
>      23 |                 unlikely(__ret_once);                                   \
>         |                 ^
>   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                         ^
>   fs/ext2/xattr.c:825:20: note: rw_semaphore acquired here
>     825 |         if (WARN_ON_ONCE(!down_write_trylock(&EXT2_I(inode)->xattr_sem)))
>         |                           ^

This one can be fixed with (should also be a bit more efficient):
https://lore.kernel.org/all/20260903101843.3462767-1-elver@google.com/

>   fs/ext2/super.c:1149:3: error: calling function 'ext2_rsv_window_add' requires holding spinlock 'EXT2_SB(sb).s_rsv_window_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1149 |                 ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
>         |                 ^
>   fs/ext2/super.c:1149:3: note: found near match '_res->s_rsv_window_lock'

sbi was just allocated, and EXT2_SB(sb) and sbi are pointing to the
same object (unless I misread the code), but the compiler can't tell
since aliases can't be tracked through non-local objects. So that
scoped_guard could just become:

  scoped_guard(spinlock, &EXT2_SB(sb)->s_rsv_window_lock) {
  ...

But I'll leave that to Jan and Tim.

Thanks,
-- Marco
