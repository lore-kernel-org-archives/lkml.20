Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981A3EFFBD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052119; cv=pass; b=sLoCTRcBqA2i4Tosis1CzGPv0lrga4kCWgpdXjKqJ0Vf6L6gbFM7GbkjSYUedExfYQlR3WnCSE2D0gw2wg37qAmSt7pAbHwEj2eyPZZHdKYf53SZ/cnjftXJ1TWP3DxemGZuyTP4zYCoidB0aaCsuY6kh120Ba9bkPry41TpxAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052119; c=relaxed/simple;
	bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uC0ihbRIWk2xm4XSxlux+LHFE+XmvMeM8LSvPeCUQOwmcYkdSXA7bDGLzqany6iYhoBn2Y/KItwJlS+TdDvZJ09H36daGvy44WSBrU/u9EYhSULE9H90zHsYJtyBLzq4zxmhzf+3JTToXfNtqKlVNz0PAH6Nc6WnnVVb2XruJz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVT3bM4c; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVT3bM4c"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672c2880f58so634415d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790052117; cv=none;
        d=google.com; s=arc-20260327;
        b=SwLDjiTBX2DweJJDXF6Y9yrQMYoMXneM3PdS3keZtcJDjMd8st4ThNx64msa57e51w
         ooq4i3+IC+Hm3glsPo8De9SzNBoAQrCaa+PQodRDs37K2D2U9vP8DuLOHP9JYQHrCbs/
         NI3N4VlhaziO5z8SRrwZAfPXryNHNsS8DHQprP9x18BeLqxanigxysNqJC2uBzkzZ+P8
         1oKucEJ+Vpx24GS79WNvMUwpErM03PH4AoRob6x1KOvDavApOltLxiDgJi2qJSraQfUD
         xjhQSJUcq4yWdkxZ6m2avjgmRJRMwj29ky+gLBgf2uLSWDsLSSTKCHRfJ+Snddkxrjtb
         /aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        fh=EwB4XYmuaotSqmM1WZ7a0lGKIyXwjIycBw+0gvZpDyU=;
        b=notAkc9yDDZA4VrAy6EKphqg9qPj2kxsJoP3AceRnw1m2kuQ/b02p1rm+LQwwjSjp1
         EFoR1eCkfRoZXgl02c5rYuePq0nhzg0z6hBDJstttr6nR5cUfsmowDa5mMPszF1fYNat
         w/Gun2xJj1S1oT8xgAw+p6dPN1/NAESQba6Z+QZjh9BauhZ0nljHmJg4BOqVMvhL1CIf
         vPZ4a5NPJ0E2ssxa/nm9iOTLasi+vQ+jorWY8mgZ59Er9bbeMD8lHtbaUNFT7N6OTwp7
         tZtBVmN8sGAm9iCLiYt74voqofL3IsOtQzu5tiwlTs7t3WM6k5BUCMM2hO0MuZBUjAjn
         YMVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790052117; x=1790656917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        b=XVT3bM4cyq4/9vQHKU6vekdxjffmr+y4AI/uWOTOeFyvpzHUzo01RLZ6NjxDLJjhYm
         CQaPl9xDDSev/7tprplYRPy11yQBBX7p0ppXEfOeFZGoSJsNX5JtWFeycrgxy8kPD2Ax
         sL60BPdMyxA+WtI6yerw73vWTEdepBzWm+Wz5fX6du8nnablfdwWNGWLq8EINx6LmkNQ
         gZOHhVLDslkXWZVlyJZ6qqbbLbPUNy6343vUssy9C5zEhUigyE8hAphpWhGD21oBGyZ6
         vCN2ps78/nLkX0mP7mInfjQleCtQ5MEmkSqSykXaZZO0a0qEAbH0mx4psz4S98NirB85
         mLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052117; x=1790656917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        b=JDdw/O8c29uiaMNDVvg64xT+rNcteuwiJpkxRagewHKp+KKdhWzRUzaa0fM9/fZrrE
         JTQ5zYFIlb/PnOKuFjnt3zfCjxcm+1yMPUL5njIfmOJNFWjfYLjNeZ1zmEwDvssS66UF
         cip22HxX7L974nuucuDJd7q03cmUD6MrhPvIieoryl10UQ65UNMjm8k4qAkg4lCIHyVv
         LAkNm6ll2KFPcBRsPCGJlOFVTh+cqlokYhFNywVFCJ9081zRmfr0Dk822SFiDw9jD5e6
         w2iILDPc0mvDZlMfR36Bnx6L96Am8oqB3aSBFgBIvljbJQOAuksZl/TPDQB/IjYUiA1J
         nQWw==
X-Forwarded-Encrypted: i=1; AKwUvBz26nKWDEbMxbwPkFBx2MIMUi2CamTAFn1imgedeaqvkxWQVZD7q13ZTTbHDUrYz4CIwqkVOJuhInB2tHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ll2OS/mYBJ1EdANFEQ58Q4DJnwHYi+3bpGh4wh2jmcrbIUuu6S
	6Td2wUnXlBAOUTdY0w9DfDCKs4YDXDJyyWNJ5fJoidOPrVyUnCwcFHhfUGRR6Sc1QJ+zcocLMFT
	MgtV91riIt25wXONwxytsTVn8UPv6sUg=
X-Gm-Gg: AYBFou3lrm3eDAaKYB98I+nPioDLWFCG0LNvB9XPiSB4LzHMZG+Ym/S9cRJ3KTNapI/
	9iAJnZIwqheBalnsMdPF6nyN+fh/nCFaLshPT8YZMlaCvGHclojKIrIZYL3GgBIZ5sSJPcec/Fr
	HSsiIOz3poYdhgNGYVYDU2+ajR0S5YZVE7c4pCquctmQAzy3cHcrgvl2qkHx20Q1cw4oHj1RXpD
	tVFilRenNGva5j4gKGm7Npfotbsbcpe5K60TLMGzuq6yK7PgMzy6+dlgaI3XCwujS25q5dTzkJ9
	81kyzp86j5RuKscj4iRuFSlqp8QFM2HylAwjiFCaewfEwsFBHVuBZie22qz+eSsKKkas0dJA5Aq
	ItQ6UiDeXa7d5/xe0ASY7x0sgjBimioUMIhS51B6QNwkJ
X-Received: by 2002:a05:690e:b4b:b0:672:a4a6:298c with SMTP id
 956f58d0204a3-672a4a62b60mr3004078d50.6.1790052116810; Mon, 21 Sep 2026
 21:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com> <202609211605.9F15E5B1@keescook>
In-Reply-To: <202609211605.9F15E5B1@keescook>
From: jim.cromie@gmail.com
Date: Mon, 21 Sep 2026 22:41:30 -0600
X-Gm-Features: AcwNN1Utyycyg5fZYcTu3CM11pNZpX7emt-G0eshr0PTJzFXqlmzavs0XJTRWL8
Message-ID: <CAJfuBxyYYpk44BEV3vig2Aeo3yn1mNDL9wVA+G4y1z8BP4aeRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] kallsyms: Accelerate symbol name lookups by ~19x
To: Kees Cook <kees@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:07=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Sep 19, 2026 at 09:58:54PM -0600, Jim Cromie wrote:
> > Memory footprint: +573 KiB .rodata for kallsyms_names_offsets (191k
> > symbols * 3 bytes on x86_64 defconfig), minus ~2 KiB from dropping
> > kallsyms_markers[].
>
> The speed-up is impressive, but I have to say 500KB is not exactly
> trivial. It's not _huge_, but it's not small. Is the rate of symbol
> lookups in the kernel high enough to justify this loss of memory?
>

IIUC the use is quite lumpy.
so a dynamic allocation could solve all the problems.
1- 32 bit table, since 24 bit fiddling is silly on table thats freed soon.
2- can do David Laights stride-2 thing almost for free
3 - 0 bytes rodata
4 - no conflict with Lorenzo's patchset - no touches to scripts/kallsyms.c

It could be batch-loaded and freed, w fallback to existing slow search.
or left around till OOM
I will play with this.


> --
> Kees Cook
