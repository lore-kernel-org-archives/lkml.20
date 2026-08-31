Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB5C55F983
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184083; cv=pass; b=fHypaXiPuWtmG9HBFaPJXMB5J4tWSk0lo6luDAMszAX0ci0RsaoWgVtm584G5G+P01KukxxQc9PQLye24l2Nochp4xES3lmn+DXaSYQNyyLeXDtVhNsXRjFFnA4EKGjE1Z9yj1dfyKQpBLR8qGv0LoP0+pEcRvRW2FzmX6EbmSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184083; c=relaxed/simple;
	bh=6EmNPbgdthlv6HmYz6yjs79CFf+7Dk2QeNRcHQINiD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2n+E36tpsc9NMHj/tNmgxLyNrWKgBaN3Jyn9WKG3EB185+blXtvZzRd8FRO6JWImWTHKhB5ilqjXF2orzLUHSQ0kdzN08o+CEc1PX8jKWCgiLFhVnDdNqIJ0T7zdkomf+Riif31CwAjOOUCVtRf/NkFYSVdGjIE54bgUnoscaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3NnNCrv; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3NnNCrv"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aca0f482e5so2062702eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788184079; cv=none;
        d=google.com; s=arc-20260327;
        b=OU5GIxhBRPd8XjbupysYUwwHJGroA8F7oOtFlnSOyfj44Gho8qHfvlfYg6hGyrRs77
         PVz4UVafnpK7ve4rNgYDDx/M1/QrQmG4mqaLosGp2jYNHhqJt7tEaIJxAYxtT48DEAiB
         jENtbonpK2D+X3Uy3+mppwBzbkFdf88uJGuL3Y/1ic/eQLYpzucp3uvBFoR8CvwCjgIP
         +3wizetat+lBLGVUF3QJjnqg+5aUamhQGWIYaCuIXa98lf22DtnOzIk50M2ufQW7hs0D
         hSbg/QWp+IUoaTKYFm9kbpI/8q/2Q1/hv+OnpWkA2bXSneUOMTMsssw2duPRL8eu6UiI
         v+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dOxHAFAAnCNkFLAXANF8z/KGOYsJeBy4b5mYI3CnXY=;
        fh=kuU2bDpEr0YytZV+WuOXP/kRRgm6sqB1VJfqaB2ytHY=;
        b=C+P9zAT/QMJza9yIGBV1z8G9pCOmS2ei5VwJUZm/pmJzQAnb1VMZfuYvc03T68OPtq
         mAgeTKd4pzkfC6VVwQ5LZeMHSW8XQhRH85al6YJEO2/lcJhvZI+DtmRzc8efHPED3xoL
         qdFhyelUrLMWDbxC9wxTxjARDI0pKO7SRhZtppVSx8TEQgMBcedwLgaiBUzkmXVddar/
         LRlecHa9bCzrEhnndF14105WzbRMOWHa/Wl1pobmqeNjuBXx5GxS+iKP3BdxMjxcfbtp
         Cl+RWNBx03G6puaynjlOB9ubnGHXPTC7Mau9zlTctztQoTUMCZ6CflHkL1fnUvKouU9F
         1wiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184079; x=1788788879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dOxHAFAAnCNkFLAXANF8z/KGOYsJeBy4b5mYI3CnXY=;
        b=O3NnNCrv8fE+NwgENRV1hTWmfNlmYQ04qnTpHeyCr23Fszt14vlRqOb1klG6VGPuIM
         r9JvptzArNTlUaDCIVnBbcOnJlAXLK0rOsOwNyeFRLDTJN7Ixj5DAyrBA3azQthyUG09
         VcYxjs4FbKX9TWSTCJOCoWJWTtMJfd9MGYJwhRIsmikqdUB6MSzZazHPeGV52sYQ89Pm
         rxusbQb1lj8/HjcHXMP8lJuOkl5EAfWJb61G9cesuVJwIP9CvBzcA2zdtsNX3eN60f7m
         BQ3xS2p/vG3UzbWx86PniiA04tVscsBreLzSJx5XMZRV/X0UoLfGYgGEz/jz90bICLKP
         NMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184079; x=1788788879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dOxHAFAAnCNkFLAXANF8z/KGOYsJeBy4b5mYI3CnXY=;
        b=TtA90P+mklgAgn+CqLsFb++/HNTh8pKD/QSXvs9WmF+HPyU1Mi1cNA//CNakA72xuL
         T8YGBvWQftEoqr6ARuAE8/19jruTZ/O5AURBKMV9wR93z0IIPXMyVARfBaRsnoYDWi+4
         cBr4aFrmHwBeaEey5QdmJvRRz3yVEMze+rQHMV0y06gRvLGEzI72FfJKQId7cclN+6Ah
         rZVilqnGdg1rxPmJVtE+9wimeAjyUn2lBsYGZEhbOB+ObF0bVHvD8UxGC24bwbloQlJC
         Ielvf8UtE9p6wXbTmllGSUkEIecMI6CBs0qHmgYYMynTKLlE0VqXjvC+xCTaKCqOUKmE
         JMBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq68WFwJaJfw8vqcH45vGHSHmM46gJmHYpahogTD4qUfm5q588tArtQR4eR1m6gEm1YiXi23Y1Xn3zEyqc=@vger.kernel.org
X-Gm-Message-State: AFuF++lTaX4txD+dL+hytjnL/uCrlHksaJ3SftxANC8O8JSVUUjBI9rd
	d6a1TAfzvY5yn/YgEPjEcWOIgNggnkTwiILCoxT32uoOcoskyoBiok4POXYuRmEGYHU+IM71+mh
	B+zrWWtybz2lIb0BQKVZRV7pQlWA7PUE=
X-Gm-Gg: AR+sD10J/YAmDqRHRe8G2lt5+yV+FZVDOwXvGAcc3CQE5+oDFspzRdJEKDODuINqE7X
	fYO56VjptKRlmgVNxxA6S39ozhGtrczJThp5bf5zJz1dIBmePc2pwwhfHjOiXnmIi9OQJTybwLE
	Zt4qHi08HMzZR1Bwfv5/mEpNJy3hcasjIgetJvRvr/j1xZ0SlMqGIiHfhHy2qCBU0Oyqey1vi/Q
	FS8JYTZA85pa0exA8ongp7jdt3LLI8kdDJnlZ5/DPyVlwBbbfqV9o0BzSYcgGUzIGkAZEqyBtUG
	hU6eHC46D/1mlmrQd7V+p5y87VQx2B1qw8ot/Rg77j3ym15YMelNJ4Yl
X-Received: by 2002:a05:6820:26a:b0:6ae:c68b:3a7 with SMTP id
 006d021491bc7-6b1c6753623mr18493696eaf.16.1788184078901; Mon, 31 Aug 2026
 06:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829213256.51527-1-kmehltretter@gmail.com> <20260829213256.51527-3-kmehltretter@gmail.com>
In-Reply-To: <20260829213256.51527-3-kmehltretter@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 31 Aug 2026 09:47:47 -0400
X-Gm-Features: AcwNN1W99CqXWvenoG8rROnmu5fRwQuT08OeAJUbXEa2X-h97G_VigU5iiBhoYc
Message-ID: <CAEjxPJ6TRV5CZyuMHatON021ptwzfhsniVKER-vE6ASh0qhpRQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] selinux: recheck intermediate backing files on mprotect
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Baokun Li <libaokun@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 5:33=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> mprotect() can be used to bypass the SELinux checks that mmap() performs
> against the intermediate layers of a stacked filesystem.
>
> mmap() checks every backing layer as the request descends through the
> stack.  mprotect() only has the lowest backing file in vma->vm_file, so i=
t
> rechecks the top-level user and the lowest mounter, but skips the mounter=
s
> of every layer in between.  With two nested overlayfs mounts and a policy
> denying mounter_t -> middle_file_t:file { execute }, a direct
> mmap(PROT_EXEC) is denied:
>
>   avc:  denied  { execute } for  pid=3D71 comm=3D"nested_exec"
>     path=3D"/payload" dev=3D"overlay" ino=3D9
>     scontext=3Duser_u:base_r:mounter_t
>     tcontext=3Duser_u:object_r:middle_file_t tclass=3Dfile permissive=3D0
>
> while mmap(PROT_NONE) followed by mprotect(PROT_EXEC) succeeds.
>
> Preserve each intermediate path, mounter SID and file-description SID in
> the backing-file security blob, copying the saved entries when another
> backing layer is opened.  Allocate the array only for nested backing file=
s,
> and release it and the path references in the backing_file_free hook.
>
> During mprotect(), recheck fd { use } and the requested inode permissions
> for every saved mounter, and include the intermediate layers in the execm=
od
> checks.  Policy for nested stacking may then need to grant intermediate
> mounters what a direct mmap() already requires, and execmod on intermedia=
te
> labels for binaries using text relocations.
>
> Tested on arm64 QEMU with a small BusyBox initramfs and a purpose-built
> SELinux policy, on a mainline tree containing
> commit f2381b546e7e ("fs: fix user path of nested backing files").
>
> Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() access=
 checks")
> Cc: <stable@vger.kernel.org>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
