Received: from mail-dl2-f39.google.com (mail-dl2-f39.google.com [74.125.229.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8913C1D65
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690445; cv=pass; b=QSzuMyf19xyfiKC63ClC6Cg519OGyTDD1jZdnrjaSpUzMf92IhUIbj+wENC982bqFgCTjB+A3Fxf92RhuU94/GXFqDxOrOuXl2jiMEkgoYZNelAyB5Qen5Cy1Vl8o2rIbdgZyZOMjFuNTyGbKVx65cx2Pb2o6K8aMscwaYKIhR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690445; c=relaxed/simple;
	bh=Wn1QoVgHTJ6cjt9lFMZsBajm92SE7QOLkOx8BbsowoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRuH/AcoapGJdPqd0XWgVdWAzFqUfdMyMMPTVDUelwNz02e2Cb/AIPjqkGNmYG+T1A7hk7wRZp9Q1/LpRe3fLqT7I3VcxCdQr9wU5Fr4xZPcHyGI0yWZkU5lMvPTC6PpMJ+2f1Gmjs9IHx21pNqF81FvRS5g3jgPQkCP1Gt+ST0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y0MKLwJY; arc=pass smtp.client-ip=74.125.229.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y0MKLwJY"
Received: by mail-dl2-f39.google.com with SMTP id a92af1059eb24-1438cb9b3a3so2969980c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790690443; cv=none;
        d=google.com; s=arc-20260327;
        b=dUZycvBZoK33JJtlS5+kuBmRaFlXy6SUwJXIpXtNke9Duz7Xwjnr5TujQQjsxHT/xN
         lpEIgto4HRyf95E70MJySAPUv/XElQPrdGhh+AtjUhD297iFycI5w4dG8/DMHt4Bc6CO
         vMVU51dQnzlU9JN6hRip0vq6AsDbSKYmvPDd15RVoDlFZOGHAXsfTWv7KMSi7/PndqUB
         BgoHoJn9+AIflvQ2DLFyOP2ze46xf8pZo3xm3s6Y5JCdaugNQtAe4o//nXheN9WFLYY3
         QdpO/Uyq+DsRMwd3NMFt/t7gB6UYz+IBU9mCT7cXJ0l63ZPCJ4vTJqZgBU1ikiC4xGQh
         KtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QU+DLzGOXpiAxMnq3rRvyxfpPq19yPNpjrIH/ZG4c7Y=;
        fh=l8JUa0Ycfd0+j0Yie9NkYMDyd8mhKCQYqtvJEeGBaRM=;
        b=l59TQhxADOpV57F2bJADo3n/Z8PbZ+CzDVSaw+JGwBfpdZo0bDBuke+q7pwDzJjnKj
         wUpVeNARhGPd25QGr7mW+b8wDis9wjg5k78qsu4rCWjeiXW9YtR8gQD790L0fIQHTEa2
         1yWvomvaqLRtbVFIiUAPpAwnKE88wyC1Cloc90bSg6fxFWA5xPVGi9xEOPjjdGoVBbwo
         xhSjMkHRLSUbohoxFASjw6tAUt5RH80DKupANCsyFF2b4vA6r3mB7I9r11Q+kCEgrM+Z
         7D2zY33g7oPZkm2xlkgP7Y+HP3E/bULO24IGSz+CbDp0zKuGB8d4rYmUxzBNfArR97C+
         qZ5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790690443; x=1791295243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QU+DLzGOXpiAxMnq3rRvyxfpPq19yPNpjrIH/ZG4c7Y=;
        b=Y0MKLwJYqgEO5rLhQU0l7Vf0foYZk0U5NPeEUJaFd4Usun4vfO5xbIWTOIQeUhBw8v
         EJ5CL+zOiHo6vHGJcO9iNpjYwzhZq79anmIJYg3b/mFIyBBkSLKJb7H2zQ6l0oGSMP1F
         Fxjb4RyCvQwsqt0VmYxtQLj9Yq0J85xPwdchbO2yYQ8nnAugUv6ZK65h0BVGX4dVjTIx
         FRZkEdcWBhDcETv5RNuw/iPVvEtW5oJ3uXBHq56B+NAFXUsx0yDyze42BM3sCtm/2KGb
         0dl9BDxta6ZlQqJm5Gg5giq4EkD1ANpBGEuKxIL+611BqIFvrbmJBn8hJcReZXKAMZ9o
         Z0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690443; x=1791295243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QU+DLzGOXpiAxMnq3rRvyxfpPq19yPNpjrIH/ZG4c7Y=;
        b=jI2y2Nh83WchKJuiTRIigkQaw2SuBJlTVbHzN9UnxseyXzTc1vJrEAinKosMD6o1E7
         LEiNGu+XuGyzNvVAS2I30Ou2bQBmn9Io48rYvedv+wbBiEAZ/Xm6GnjYjolh/H3xD4ei
         LRG4GJO/JeeZldSE8IjAxSSsCcokUbECVaMMReg/eiivIv8daw2eRs9U1FMcG7RgK4Op
         v4u9Jl25Ki5MGFxEtsfKpzw/kdWeATgJFouNQvlZg81MZ3gSV/rw2BA7Gd/y2B11DTnw
         7NPaGNGMuG+kfcG+oADDhKpc84JClrgO3uizUXhljciLSCA4yZW10+kzS7X/kAuClYBZ
         SaKg==
X-Forwarded-Encrypted: i=1; AKwUvBy20nZ3G9W79X85SW6j30NCWBkjf9qur/amc/xBJQ8cNi3buleisCqeNInaYAKKA06/B5OQUdqMoWXVe9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l+kfMO+Uli7Yon/Dd3xLyMEEM+jsMBn61vk/FFhCLRYI8MTGxr
	nU3BPIVlOKNFqPN1RGIobfbtVDErpV4DGRyvOULz3Fx1OX7ESIy2hHP+nTJ1db0vLUo1ZgErc0u
	W+OI6klf+ezTRCztp1d2UrCemhJs85po2QB/SbLTI
X-Gm-Gg: AYBFou3akR3HVi5ULKBw42YB4riZGdzUAvAv21hqXAWScET4PId4woP/bOUy2K6Wf7M
	wjRLD5Z5gVH1950N/e6QhbLuSsrdZ9j+GFz4128T3pxMbb3DBqkBCBcnQ36Ux4aTXW9pYQQmJiy
	bbutSd0Knee1Zk2H66AAWCo47nM8dXaOHfy/KiKh9zt/0hgpmqi4XETlYXNVNJS/Pp4Sg5ZLTbK
	HfjbmdFQzvBewEC6Ck+aWf3gGwMs1QHIb0N8u2/Q200QGsuQGWcn5KgkQww7ke0zpmq32KXCoa/
	e0t+IWvJagsKLavZDeNay7hE5BT2NwxN3QtoaoOdhbR4FjnCjmKjvTOf+jZeAa4VpURMo4G6sFc
	RATK+G9pIGQ==
X-Received: by 2002:a05:701b:4203:10b0:144:e246:a0b5 with SMTP id
 a92af1059eb24-146d077bc5amr12816455c88.40.1790690441906; Tue, 29 Sep 2026
 07:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com> <20260915160207.2952-2-dmytrokoziuk68@gmail.com>
In-Reply-To: <20260915160207.2952-2-dmytrokoziuk68@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 29 Sep 2026 16:00:05 +0200
X-Gm-Features: AclHuK-0nrksZ7YEGRoxYPzzxSAUz-0Dn6NeWJoWfkNhrjPIZe7YkKonvpSq2vA
Message-ID: <CAG_fn=Wx-SPUH+wyTnihtjTKAp+4fF_H8LT-mbyj9kUCe1i1oQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: kmsan: fix ioremap error cleanup
To: Dima Koziuk <dmytrokoziuk68@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:02=E2=80=AFPM Dima Koziuk <dmytrokoziuk68@gmail.c=
om> wrote:
>
> Looking further at kmsan_ioremap_page_range(), I found three cases where
> error cleanup leaks metadata blocks. Fault-injection testing confirmed
> all three:
>
> 1. If the first iteration fails, clean is zero and cleanup is skipped,
>    leaking any allocations that succeeded in that iteration.
>
> 2. If shadow mapping succeeds but origin mapping fails, the shadow
>    pointer has already been cleared. Removing its mapping loses the
>    backing block.
>
> 3. On failures after completed iterations, cleanup removes the earlier
>    metadata mappings without freeing their backing blocks.
>
> The cleanup needed here is the same as for iounmap, so it makes sense to
> reuse kmsan_iounmap_pages(). Track the end of installed mappings with
> mapped_end and advance it after each successful shadow mapping. This
> includes the current shadow block if origin mapping subsequently fails,
> while the PTE walk skips the missing origin mapping.
>
> Run cleanup whenever err is non-zero. Free allocations that have not been
> mapped directly, and use the shared helper to unmap and free the installe=
d
> metadata, including blocks from completed iterations.
>
> Fixes: fdea03e12aa2 ("mm: kmsan: handle alloc failures in kmsan_ioremap_p=
age_range()")
> Signed-off-by: Dima Koziuk <dmytrokoziuk68@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

Note that I'd rework patch 1/2 to use a non-checked version of
vmalloc_to_page() (see the other email)
