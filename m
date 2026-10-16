Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C044A483C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155201; cv=pass; b=M+iUZFBB4YHfin/goXeKMiyrE+maW/fHEwfmHzN485RE/9MsXfKpxW2tSWE+4tt1cNiWRGlIaz0S9IvUsFGdwU7Sz1z7svcpHSaUh6m2MxWUZdaX/6eDhbO+VXi54GdJW/q26ypYy0jNEL6rZyH5QZMLskiHpm8pwcSHYKbAODk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155201; c=relaxed/simple;
	bh=w31rwRI4KaAVgWyxDvRdT7RKDgVk/LrpvvXtMujDcwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uT759Rx+LwuVzC4s+hlVVd7/j1YHN7z/8Jx7GRv3axdfGRyMZWzE+/7s/nZkJcY7a66XcCxtwTc8mo8riUueyX7P0VvXetInBQ+fOMNtJH5EzYT02HPI8FTxXu8Avj1sIX2dfjvMaTEpglfsqpQRlpto8/XbHn+x+v8fzY7gGUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CadNtD94; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CadNtD94"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so3746905c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155200; cv=none;
        d=google.com; s=arc-20260327;
        b=fGsEySJDJCQi1IAarUjit9/D6vWSdbHXjnNJaW/a/B586ld+h+TpMu4qf51QeFo0sD
         QWvokRUhEFsuJp1pMwh1ejjZ7d1LcNrOFLYiysAkIEya+w966DSQls2rsjkkrAdfWcjl
         d5xV2QBv+I2ESuUsDmgYcxrQAeGtbXpkx7ToQwWUaB9u0/spofHoFxbsZNUxHquIMEcJ
         d1ZTKzWR22OrvblSHr5XegaG7v6CsRWFkUAlikBJIf1zBoJ2NCNaix1uDDvf06mT5RR3
         8alOgF5j2wWTFZTw26Bc47cepnD0VsKuLW/sEz7kcRsKGHFqThY4e4rnB2T92VkAAdEh
         uRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPfaGV0420qaDB9DFQ7lbSxQyKes9BcBtfe80J3gJ8E=;
        fh=1VZ7eoSW+RA6sxeZHVHvIW53EB9B6IYXfbSzYW+nT7I=;
        b=SPvfJ0S1qO/tiSXho21o958xYg4sjf+ty+Noi3opbULneh1CoPwWgz4dv5bmyp0Kr/
         lixaOVakz++GLcrDtLeuV64MBD4R9J8M8BZ9EqZftnksY1vfh0/wirKhQl18wxRP1IcM
         BzKl7NXIbVXqceKNOn2K3f94wjw0DJ7kJk+I8+eY6ow738TU1Rcd2sq5ND8nvIMDwMV1
         ds8q3Y9ZWhB8Q2CcmOvR7bYqMez30jZowiVLJipd24NPZlOXyxQwmTBOLbBWvkr4fwwO
         B6xdXV+eIiUN0bEe06wjPdXPhvsa6Jph9m/HD9hmmF/uj3AN6A5dUF19sBjcTZxzBfRs
         1fYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792155200; x=1792760000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPfaGV0420qaDB9DFQ7lbSxQyKes9BcBtfe80J3gJ8E=;
        b=CadNtD94+AfBi78dJinora1+Kij06rXaJUU9fn0WZA4cKPjxIxJQufTN8B/xClQEQ2
         3dLycPifddSWXVHwqpDDsFduLMQdk+egif1YX8vCEUNZikGXGf5+WFeu1BLj+Fr19TDi
         raByIWxdmcTeH51RMaE562iQHbdwDDJFkHFd0Lti/OVhMf0zsqLj3tV3TSbTnaaq7I1J
         Z7gD31q6dV+3A5aJ9KRlWv6gCN3ekBRx5foHLo5ILzpHi51Up7IWGaDgEkADEZR+Lz/+
         TDeZH2KQnfaTUNZGbzpspSjz/d8AavobPI+F2SxziZbrKD6C3eHlTFtPgIMa39R9fij4
         LORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155200; x=1792760000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPfaGV0420qaDB9DFQ7lbSxQyKes9BcBtfe80J3gJ8E=;
        b=SltuvYDUVz/CdjYyAuux09C5ap3GpW2JjfAuRtyiZio0uOaBj+yRMTo1fCfJT4LFp7
         8GITgipd1SoMoxNvspFyJ3G4U2sy+0qOIQ2KqEmrdm9fGqzNXJnXzSSTNljueckk56zi
         L3ZfIY2YqWAQRa0/+ygm+brW+dJUA4nlrtENmASOQdDmXlhXMKUopnRuxMoygaez+Ts0
         yUcJvQ64/Oi5yIk27RCmKYz2StOsmoJe6skEap0iqqo5nywXBNUWONLVb/GGh8FBbpV0
         MOjbPt6hRVlE/6t7XiAEdXDt95CKKW8zX3KJWj6ATZZOTS2cd3h1L8UixWw7CFrNzORC
         3JMA==
X-Forwarded-Encrypted: i=1; AKwUvBwAuMTx3jV02nk5vCjqdojmq9kCRYM/EcfFN/xF65XxX2DpKRc4wd+AyBYGZI+ns4fxLpqUeaiLwqyAEkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnEKz52ToYiFX25KUp5bvtW04fpiMyuJfhOwsvML3q6N7CIBw9
	KHbOybnrB+JideO7F1ca9/CCWA98xGg+uI6Js48Kql6cw2Wy4VqwIimjr04GzyRhc7s54g655ST
	cBAxOSN10bfyg+XfxpChmtsXm3vC8IHBNVrhHXE2c
X-Gm-Gg: AYBFou3e4X/yuh833WRm6gPCLBW7i1b4r/2aYJtRLEgtKscz/rt8DuoWnO3sWpVjnIB
	5YHEEwVCQLXQs2eT688GhhMfmaZgmvj2Vq3rKU7IXL7MU3VEUnUnaVNyKzz9Lym4sawBMekC4sF
	D0VxrZrgasaODAezGtNN5qsaYyd8P5rfYQ4mdG7f/G55P1bQ2GviU+y3VFgOnYSWSRwFgR4bR3D
	VZrf+fEsADaGUOVZJDXPtPOhq982dpUrGriI7Oi46SnYzKjuyXYVDAmxwv+wNPhwUPdM0Ukgspf
	m11kCVZ+gwmJzmz1fcYeVKjAu6nvL+Dj6KjXiX7jBxscItAMivNPBJf6FKqjqFOv3P3M609AIDC
	opm8srr/0eg==
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id
 a92af1059eb24-16a64ba421cmr27941452c88.35.1792155198962; Fri, 16 Oct 2026
 05:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002200508.546-1-dmytrokoziuk68@gmail.com> <20261002141223.1ab39d5cd2d65b02dce8ab85@linux-foundation.org>
In-Reply-To: <20261002141223.1ab39d5cd2d65b02dce8ab85@linux-foundation.org>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 16 Oct 2026 14:52:42 +0200
X-Gm-Features: AclHuK9Opz0egXeT67wcM1R2TZ-xVIqktmKiQmiUb6_1wVAI0Op1Uc5FEcoAWQ8
Message-ID: <CAG_fn=Uvbk_758njtMR0KOpKNOT5=pwCjLvPU3M_x8ob9Fx8Xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: kmsan: fix iounmap metadata teardown
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dima Koziuk <dmytrokoziuk68@gmail.com>, elver@google.com, dvyukov@google.com, 
	urezki@gmail.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:12=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri,  2 Oct 2026 23:05:07 +0300 Dima Koziuk <dmytrokoziuk68@gmail.com>=
 wrote:
>
> > kmsan_vmalloc_to_page_or_null() rejects addresses outside the regular
> > vmalloc and module ranges, including the shadow and origin addresses
> > passed by its callers. As a result, iounmap does not free the metadata
> > backing pages. Also, the first iteration of the teardown loop
> > unmaps the entire metadata range, preventing subsequent iterations from
> > finding their pages even if the address lookup is fixed.
> >
> > Factor the page-table walk out of vmalloc_to_page() into
> > __vmalloc_to_page(), keeping the address check in the public wrapper.
> > Use the unchecked helper in kmsan_vmalloc_to_page_or_null() and check
> > for NULL before converting the returned page to a PFN. Mark
> > __vmalloc_to_page() as __always_inline to avoid an additional function
> > call in vmalloc_to_page().
> >
> > Move metadata teardown into kmsan_iounmap_pages(). Free the backing
> > blocks while their mappings are still available, then unmap each
> > metadata range once and flush its TLB entries.
>
> Thanks, I'll queue these for test and further review.
>
> Could people please offer opinions on whether we should backport
> one/both into -stable kernels?
>

This bug is quite old, and it only causes leaks in a KMSAN build. So
stable backports are probably not needed.
