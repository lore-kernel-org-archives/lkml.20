Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47035C1AD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889796; cv=pass; b=C2L9YxbFXuWM+KhGBV4ML7lHDUve2SqxAw15+Qr8wJxaggviXtvPDTeEEWroP8blhm/2bOhgnI/jGl+cmNl4FC26o2XJoktmQ07+5OXBXYoM5VrlqARY9f8m14XpQK1yzfLdQUBXZ3FQXuTVW8sdlRe2sL1ewtM/HhM5AILcSOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889796; c=relaxed/simple;
	bh=DLs/KIZ5/ycwSa0SN3niPNJWgFMiQFCmcvqsb0nclfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoADeiiv7Jz0Q4aSS6B6BVpCfYh1Lwt7JyU01QMVaHqi4XaWwRUtykMo6hUD+E4AYBJQkb8F8kXsUg8E/CrMa6Gpi2Rfaa1YpFzfejgcgs5CqkxbbJVLuz07GIf/EpxIXt6rd4a4BxVHhKPsoq8eyGZDXlBk/G/WLc1RYZIehYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TLUBHtM4; arc=pass smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TLUBHtM4"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so999378466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790889792; cv=none;
        d=google.com; s=arc-20260327;
        b=gP7gvmWCBLlUD/scjJRdpwPStrLNcXBh8d4Fk3+mYpsidV293L3pJmmIYMLZ5MIN3e
         eHxYlN+ah1paCKsIYIufLK8oGRZxIJgUAiWnmcvBUkbuWOrneZMk11i21R/MLTfp3XjQ
         N/VUQDl8IVfhrjuQ1JZfFc0MSPa2Q4qg4xF5IVvAeiq4p4/8ydW0JoVVxLhWyjv55278
         b/7pUnsqc5NtEzTnLzwkUZ3XvMepVDdWfZJGpMQ5YDJU7CoEJ07WqidcXnRRe1LRbxTj
         oYLhlM8jHSjrsue0mJbjaiJ+TpKn8oVPHu2xE9Orka+38oeTbHMxtSfQ/ms2HHQxv+0o
         nk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        fh=CAhqSgaJprAm7KsmIDgmtY263kL+tjBA4tuqP6RyWxg=;
        b=Q4YNU9AdIhSfnld3kTLceC2GYGM7H07vEQrJ7eiMXR2foMfFwi9DmeqBcCtSffrRHU
         EjSZQgqT6C/HcwvsDdz5gQ9wRwMf/mFW/j6XULU7v5BsElkJulJHkPSaU0cXHPo/Pens
         jUHIC1FObwoZIz88pYoQ9J17iVdefOo+g1Qk9Ay/JP1V2ma1eFhNgQdZAjWF9csysr5L
         RH59NfsTtX5byvOIvQ1iIk9hiGEGHqq7I0u8fLk1z9lCvnGzOxSoFsXfYQjXFeSCU70x
         +Z/At5lI80LUy+cTFgBk+ptkjAp1P4lpHC0VmCci0+1Fqn+4tgGR59ZOfy5NPeASHWuV
         i6Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790889792; x=1791494592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        b=TLUBHtM4X9DfCuZ+6UdOl6Pymyz9MySlWXhFPcefNzL8k2Gq8fs+jKPTLkk0Sv4vWe
         TUHEzMiqAqdbdFmatWRgOhwKRlrqN207xBYbZ/R19XlEKJoOmFCuj4A/cU3y1wXDGgMb
         Vq7LOg2k2JSXkwHKZuyngZqcsAn14vS5eZtj1w9M5Y6oWQowL7z5wpQJ0PRVR17N4IcW
         ky2ZGWnqpeKVQBri8a3SkK4xTareftW5LaJetdwtXbW37sDgTWqC130B7o+gD4s/FD88
         ak7U3SUgN251Ey66LpsgCLt0xPdEYfovtlK1wb/X2RtE5zpETwrLlpu/CTxnXdsz7clu
         zB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889792; x=1791494592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        b=rYSFFq4R5VLeugErrvts839ffSQawMW2jo4kJNLZ6TXZxly6G4TWCXg3W+G0aVaaB7
         Qv724gSl+l9ktoZx9y5qRJytyuPTUiAxrQooKdK04pcgOQB1t0gjirhm5f6Yu0iPoYfV
         EcHPghicmsXDao6Xhq4NtG5IQVdmGi/d4ggFrakeAUPgr9DhrWmJtOptDhGqDMkqLtSG
         Xel3hCGH/cWHahecgHh/L4tiVhWM6dRJ/Qv9YgIkLDotR4x1uXDfLiT0F2zYVqjOMIPM
         B+Yqjz/BVqyEpdDDOxFfJuHb7II0kt3ufOgQGTEOPsmjbTmXTOyk8l6TOXlP9wNY4DMD
         POYA==
X-Forwarded-Encrypted: i=1; AKwUvBxdNc3SRBA8GJ3fMnWkCjthlVEUE3OTZwrXvpFhQyDuslD6wQm3KFzt+OoasNKVt/eb8vMJFVVOB0a2kJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL23pM0EcsZ+16jCnz/zvPv/9xHux/Nq907FiADVgVDgsqa5nV
	n8VNcHJeePBz6SYVBCR1D/EkI9StGWfV9ZmFVszZhkkl6YuDPffh72SbZrOV9dpbuL6EPGHwuYR
	8ZavYTYmFRNTsutVwKAgUoxKjV39ipTdtD7jMn4Wy
X-Gm-Gg: AYBFou0nkS1UTFV8T0n4WpcxeUcai9cIdGsHsruzdLdRScUeow6QqhiUv2IqRkxWV2K
	2di2BvX6OtqvyvADMTXOMU2QKQsbRZ/PVkK51S4hPdprLG4pfFhP+305Xm05UfZ9sB1tMrE/dfM
	L4KguZm5CHQu9syLDEuKV+bNn5Q9kHQWOHMuESq0qwOUWi0qQ8I5PgxiLE6ppOE8HLLnwoqlr1m
	vp0Vr+0Tac6nEKS1A+w1iwotwQ6XcVX/emeuOD9HAD5pEnTuvI2ye4y89kxhmWqZBHv1EJXiMPj
	UJwZLEbjJXjCtQDBFVQb55KdZkng3MmKkyuJIQkH4D8sACXtMDRaE5ShQTG15mgmRAx5nElPUsy
	FvweHWsBPw+oKLT6iKNH8
X-Received: by 2002:a17:907:7282:b0:c25:977e:5377 with SMTP id
 a640c23a62f3a-c2e4ad7cbf6mr69097466b.10.1790889791661; Thu, 01 Oct 2026
 14:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001171349.81454-1-ebiggers@kernel.org>
In-Reply-To: <20261001171349.81454-1-ebiggers@kernel.org>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 1 Oct 2026 14:23:00 -0700
X-Gm-Features: AclHuK8XgZOhRUaL3sAt7Iljpz3t_TC6CLjoxsnzy8OUuuVA4aEvXm2un4VWkDk
Message-ID: <CAB=BE-TsYHMdwKbVPmEQZXENL1gVcwUa7Sde=e1wgGuVLKWnEA@mail.gmail.com>
Subject: Re: [PATCH] fsverity: RCU-delay the freeing of struct fsverity_info
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:13=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> __fsverity_get_info() calls rhashtable_lookup_fast(), which just uses
> rcu_read_lock() and doesn't directly synchronize with
> fsverity_remove_info().
>
> For the same inode this isn't a problem: its fsverity_info is removed
> only at inode eviction time or upon failure to enable verity, when the
> inode no longer needs its fsverity_info and it will no longer be
> accessed via that inode.
>
> However, this is broken and can cause a use-after-free for concurrent
> __fsverity_get_info() for *different* inodes.  Those rely on following
> fsverity_info::rhash_head in the rhashtable under rcu_read_lock() only.
> They also use fsverity_info::inode to do the key comparison.
>
> Fix this by RCU-delaying the freeing of 'struct fsverity_info' after
> it's been removed from the rhashtable.
>
> Fixes: f77f281b6118 ("fsverity: use a hashtable to find the fsverity_info=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/verity/fsverity_private.h | 15 ++++++++++++++-
>  fs/verity/open.c             | 13 ++++++++++++-
>  2 files changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Sandeep Dhavale <dhavale@google.com>

Thanks,
Sandeep.
