Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB1538886C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789327590; cv=pass; b=bRBX8QotJ46vEABW+qGLOI2NxjZzTwm1T7cHiudn4iXVtInaHguPqojqhymiQZ01FsuC0GFhJ/kxZ3SQVnfB0tZZD9hrreXgkGO3gRI01OOk9f1+rqtRP/c2DNkM3hobqSRCny8db2/tZrceFiW5KF5o7vUrmqxat+FUoCPKhv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789327590; c=relaxed/simple;
	bh=QREsgIr79KScFcsG/Gnozu2UkRu3V+m1VR0YdJd51lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGsEpa4RM8dwgjVhRqN3SASIlWtj5+WboiKs4EwG771wgiY7jnkPFN/v/LRA3bKGKKPdYmk00MqAu7qdJQj3nkxo2MoSshpRQMhK6tApet3sTPVPAbWDB2k8tET69OJViTNlGQO9LHNb+bkEdljO6W6DzfKlDOrCXysfoV8cUDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBHx43o5; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBHx43o5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so157741cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789327588; cv=none;
        d=google.com; s=arc-20260327;
        b=FA9S78x5VHbowXFSrMjjIxPN25v4WTxHgNNNvcqU4NVtIcJlY6OqanY2ahbiFvY99D
         f8AGHAIBqHn/Xtd9y+Hsu41OdemnyRuR7TgV7+Hv9rq42arDS2xwoczJEs9+yUlq69nf
         IU/MLhCHgxkIeiyMDM8y6FgcbNgyL1QW5h1KXZwE8P1HgnpQi12/1uwxcqcW8Pb2oeY7
         y+C8fVhaUAMh46mMhuHvcZGRq9XgvoNpOslZoOtQmirTyhK1ttB7kUO2eh+4Ww4kz793
         Q+b3mjzIXyorHM1zS8lvGgwbds39ZN3LWA7eeh7s1TCKhXYpjTqf27ehqsct3jdDwPiy
         NurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O3bm4p3XYFyhf+gjUNcp2hdrx1XIlgahhu2l/35xw9w=;
        fh=32H0MCEeW0Zow+Tedl/WAwArTEg5pQJJMuel0MaLKfQ=;
        b=kgg4za+7Ln8dkAS51JN7FrFC1rIpfa9Mn5PL9cZuGBGeQebHBjTd2pnIwlN71FSfHo
         zWliFHqdcl0Ef11L5JZnGKVTTBE86yO4rQ45BMDtfJaBsBv2cjp7M0iFujLlomgIFq6e
         y0s3Sg0rfTNDJdpfvtsSajp7xr8q4JMd3yv47Ec2DeEq5d0fa11ExavWbkAamDu0jQGO
         K/mR6xGiHeYkQOVRs36DuU46uTEBS8jBoyvafZNaDsmGVMD98wxXxtuKQ1/9GO5yLSdC
         qq6x9qReQPMWx9NugGvdYCATU4k19WjP9OQwao/p8V6sCnktfjem6DzlNk6HS+GrC3Ef
         V6GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789327588; x=1789932388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3bm4p3XYFyhf+gjUNcp2hdrx1XIlgahhu2l/35xw9w=;
        b=RBHx43o5//9TSmJHVDt2UCdWZ7NbajomfIQ5OassVqyufJqpsZIO0QpgImy1qcJKYo
         a+41mPRuqV+AhdG3BVTQB4EkI7wtv+TqdZN0gciREBPodf0lHwYWAas1OuBemeSMdP9h
         Ah/34wvZAK3jONm8JPgdvQXZniWjY7arO3QOCBeLoJzXwt7UlGYrfX8o7XjzjTExknMK
         TiM4e9YaTArXXUPD4D0AwlTiJvPwNEvSvqS4m3m+a4QfD3gF+/7FkMYI283+n6YEgHBm
         eSwl2V3z0sNBwRykSgVOzy51+nGBVt8igQiM2gUsHsUANQs/GBJaqYpE5f2knpK7xJ/M
         IjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789327588; x=1789932388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3bm4p3XYFyhf+gjUNcp2hdrx1XIlgahhu2l/35xw9w=;
        b=bdMYBiRGDmAhKANmQb/LU35sI8T7I3U3R729sXoKOIugY8jV1JKEXKBhqJz+ny/bgj
         GNWHKSvb+Pp5O87AUf1xrdD6auQ7Az7ZUDFEgsL1Q8e96fGtqFQ8H3/XsI7V1hA1DykK
         BxSYtCkuqkWKzvC9gvLnhhY2GIVjIdT/csC37b8gCVIxy5Mtwh/W/YTPGrcQTueJSvbO
         3/MMdUgci8rHRIlQ7YPc0RE338llJ1cYjyexj8/SI8pm7frhyZCxM/xKzN4x0aVkdzij
         4cQHiB73ANRXWHYsu+35BuSpbqG34c/jZN0I+s3qaW8tvOe+WP4vqY78nc2rWuSjwepc
         Fq9Q==
X-Forwarded-Encrypted: i=1; AKwUvByMTF+RS4SqFCs+Lipq0UJ2M4RIKdnGL9NjGpwJvO4fu2Uals0OTFTAHPSGXnaH4FWggorEMTy8Zht+cNg=@vger.kernel.org
X-Gm-Message-State: AFuF++mqnckiJyWADoyfYIIyKbFkPZSqPwV5xE1084yDcRI2/OE/YMqI
	VYlkLE2uFJRVBtcivd3ikz/f/mmHEMfugQKx93VoT+y6M3bv3lnEyOBMC8i/+R/VQUkDN+FAx5y
	+rqK5Sf3beu1dJSW5P/ORmCWYh5g/Cb24MDEIE1t9
X-Gm-Gg: AYBFou0mn2fPxJDIEy4lsvYukx5satd7zhAaEv436ucyd6Qwl6Ya9Hu+mJdw44HNVRU
	67d9jvHqeNIchTRjkJEkxagF7vN66xoTxAjZO4I6ckJAela/sDy4DJcNxdwhJArWnTN2cg7zkKX
	0fGPCWu3PP2XMRFGrbMJHorrtg9weMQ1Xzn0R/QyCp3I3GALBf1PqSNUFSr/IX9iGbEF8k9yuaa
	DfZOA7V32JehPPvWVvYV9SUPaIQ1awJ+eguzKxMWpxMWAwDRB9ElwHyAgUFcBTRn5alloB/+54e
	YnhMSFAkmO4RfYjGiv5uMs6jiTXl8uHHK9s6iuIm0YHtyf4yH6tDbXwFBuQCbx/A
X-Received: by 2002:ac8:7fc7:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-530f8b121dbmr9139921cf.10.1789327587349; Sun, 13 Sep 2026
 12:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911194145.1781926-1-surenb@google.com> <20260912002436.0605a85b912eb8ae406cecf0@linux-foundation.org>
In-Reply-To: <20260912002436.0605a85b912eb8ae406cecf0@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 13 Sep 2026 12:26:16 -0700
X-Gm-Features: AcwNN1VI8o7qgtAf7FpFyYAf_QiJM539hgJGQoLRqGdhk0b6X3b8GUp7lNPBUcA
Message-ID: <CAJuCfpHW24Vh2RSr7qwzV0jmWz7oirrG2F4JPCuBnnk0x09NyA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] read proc/pid/smaps_rollup under per-vma lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@kernel.org, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	xueyuan.chen21@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:24=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Fri, 11 Sep 2026 12:41:38 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > proc/pid/smaps_rollup can be read using the combination of RCU and
> > VMA read locks, similar to proc/pid/{maps|smaps|numa_maps}. RCU is
> > required to safely traverse the VMA tree and VMA lock stabilizes the
> > VMA being processed and the pagetable walk.
> > Note that we have to keep the logic to drop mmap_lock on contention
> > because even when using per-VMA locks we might have to fall back to
> > holding the mmap_lock.
>
> Nice.  Queued, thanks.
>
> The speedups described in [6/7] are significant, although I don't know
> how representative Paul's tests are.  Probably not very.
>
> So I don't know how much improvement our users will be seeing from
> these changes?
>
> And I don't know how much usage smaps_rollup gets in the real world?
>
>
> As I've no doubt you know, Sashiko is saying things.  About these
> patches and about the current code.  Its pre-existing
> clear_soft_dirty_pmd() driveby find looks significant.
>
>         https://sashiko.dev/#/patchset/20260911194145.1781926-1-surenb@go=
ogle.com

Thanks! I'll investigate the preexisting ones and will try to fix the
ones that look real.
