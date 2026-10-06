Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD53C3F67
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273573; cv=pass; b=YnhcZb1p8WtCYIJm+b2hztgdVjVUb7KkXPK4b0zTIFDhNMchEjzRrFT6Z5RxZZk5aN0mDeZCNsZsyDKME8XECjIBJRFQfgiOoRSacU+0lnmJOCsNhmCuPpivmKA7mQB1uUj6QZIJMCLGxYEkquwmqeSNT10AaRj42PDAIffgMKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273573; c=relaxed/simple;
	bh=ZU2cQMmasHr1yoJwdZJaMEya/Sh1a70VvSBGFfdNluk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6HK/T0CaiGcGrB8WVogNYKAS+j6iOemM8K8gs/bbcoTLWm54ufIyqyaNhAm0hZ/QFilGmRWfrcYd7a7qbOapmY+FqAY0PFQUeivYlzZ8qjrwoaovDYihnM031Xiaus6qoEJ+vtGgwiq7u0xZu5ZBabW+AHx34+f49V3gEPisAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDM3Uevr; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDM3Uevr"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-888cbacf70eso5084537b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791273571; cv=none;
        d=google.com; s=arc-20260327;
        b=rxMrw3bIGyE41QSow6dl0M1y22Sjoh3R8uR8ODgpoqc6O+5+NSPCJ0sUvI5moaQLdN
         82t+uWiFBVfoumW5ZsGix+xvqnwySanIJko66tAHP92ZYaElhzCpMEsNYlLg1iKyhM68
         F6HA+QfX+tNbwLTNa3y0DQ+G9ofOZP5NJbZ+lo3tbxTg6p1tUoAQ082G2O0VClGghUha
         JQdbXLhIldZt7L0oCo4Ua3D5n0BxVb7C5rYBWuXMDMo75wCr4WILo0yjSj7bGskaitFh
         d6MuBDslpkMSBFsZN/yJ+4ic2bW2CMEj37MdMrkt9HWk646zpwvTLfUOarcGLO+h26BR
         24Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        fh=u4dfzPmsNF576TSYy3gPvvEDqeMtQU3LGltJ2EMzFT0=;
        b=M5z3P7x16+fJlJevfKS8l5M2LHFgwB8YaxLlPFYOeGiOUBBu15L9j4202XLJpWvzdV
         4cNqRTFqzeD2dKU3yMfPNltapWN4kgR8Xfw/Bib6JZ1dG18aHMuUQctoFDCbaaVfSE35
         alkudJnNxKkjUsMDRZ/w/7fFWLjcqonM7vZfj58rxaobfjOqAZPlJ+KHbaPf7tBH+4P4
         8kk6us5oo9KvgIVOmfAeUWpBwbedSpCh0MfyYAwKrN9W0lHuzZb1WHSX4ujPjFVlyAGw
         XaLCzocrz6chu3JVDUE9DiiXUUJ2jUSdAeSJ3OeVZO0lWChnrm+gRkPV5MNdepEw69E7
         pnOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791273571; x=1791878371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        b=IDM3UevruLW8wL5ahJL3Xl395wiGZ332KWncqlqlr8h0sNZ+wh96dxk5Kp8vssP8Mf
         RZUZneqnaBIyUmKxSmDmkngTXRhvEeI/ih0zD6YfiUQJc49LUE+izd6gc2gmHbGBJD0/
         67eoT7HpWnsnM0TkBP109jvTioqtq2gkIS8njCpud8dJbqicChqdMzzU/4L8pBeaH9ch
         VUx7b8CLt3pMwhiefeRdhURXu01lXNjVvAyXZ+60N3mhS3be8x/6RhzgcMS148B9HYHc
         eIfX+xlh3nkfJcyvZWovQoRF/+uxToKVvwh92r2hG5tDHSgLVlAIZRHr+cE2TUvYiydy
         rNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273571; x=1791878371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        b=pDIOG6dqb0NQVaMtFOf80ko81NG6fvBh/u1jone9VXkTekEkFlcU+twNHQHFai2X9U
         jYxg+gf+dthiHwJdtgUhi38Zk/q8kfDXaquygrylHWB8njCUPgcIKPXmm7oYmTPgzfLS
         GVCOjH5tgwOvE0Ihx+/PhfY0nX0rUz3uc6olGHKrF2oe48VUQy9gACRztm27g1xsmw2X
         7iAGhDIh8zniZKwk7sTk+5lfLGPhPuG8PYojuN1tddI9MHWO3aIr0PJUYumImd8n1iFh
         PgYxQoSgOFwcwXsPerAR6iLREd60pzyJ2EqOa3XvBF/iM3k8alpUaeWb6Oz+SIp+WiLo
         O2cQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5s4r01yWrWv09Tote/9H9w6lBdk+m74W/Y9xCiiYP5iZHRR8mm59LGho9fwIF+IgVI0nQEBR084hNMNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBrnXbUv3xrBHYyDh+01t7btGL94BkZ9OIGs9euptGLWxyZfGI
	3p0ftRcl4CMmCjzEpeXSdahkpEskEu4S9VUzPMitqOqKRsjiXIFMWVzOzkFpdmoZzHj2JYlosVO
	WMGZAB/PPBTIc3zTirvgg5FZZnZYH/3k=
X-Gm-Gg: AYBFou21LL7QxlyazgVpjIJg9KpT9w/exf8n9/tz9SbTudwpWi20+Xp6EUjbpZpwlMk
	v23KHJ45byrJ893gA7MBo4U2cAu/qNscMpwUB1LfSB8ENEL/lA4zM1HTVsydNKNWOYwhrcPsEGV
	yeuZBpy+f9LazAtcw53c2Ye4W3x+iRNwWAQpVnOltxxufR9ylsBIaHkiwmKqau8Rc2mK3rmbG2g
	6vQPqpklaS7IYcV5RtTnYnv7/HAW41XviQrl81P/gTzP387YwYmSxWHK9hKWzJNCdKK6ksdMgy6
	wPKhNDqd+tjgMpuFQCWe4LEQ893oVM1PnilMzDTKoDPAvVMRNEeLZj9ahouVfX//5cLwkK34wGe
	KAYj6/Sk/JFG0248O1d7UM2dXG9nfDPUS16A9f2gmGPrtbqXFASRnnnj5IAg/yIWPNdghPaBLtU
	wftHKAM/PFe5x9nQtxjrTFs009KV4mwInc68NrlqCR8nZ6oNGiTtg=
X-Received: by 2002:a05:690e:1407:b0:677:b426:5072 with SMTP id
 956f58d0204a3-678fcd9a7f6mr260069d50.47.1791273570848; Tue, 06 Oct 2026
 00:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005203930.246598-1-rosenp@gmail.com>
In-Reply-To: <20261005203930.246598-1-rosenp@gmail.com>
From: Kjetil Oftedal <oftedal@gmail.com>
Date: Tue, 6 Oct 2026 09:59:19 +0200
X-Gm-Features: AclHuK8uZPRVB-V-7veiRIMf2yGygSpvVmN2QjDCYDa6UJqn_IrMh2dWc_mXHWU
Message-ID: <CALMQjD-udSokCKS07VFWauBQzac5BTPJqbORhskxgddsuX1vLw@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Rosen Penev <rosenp@gmail.com>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 22:41, Rosen Penev <rosenp@gmail.com> wrote:
>
> A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
>
>   mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
>   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>
> sparc64 defines p4d_page() as NULL, on the assumption that it is only
> used by stubbed out hugetlb gup code. Generic code now uses it in
> vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> used in pointer arithmetic, which clang diagnoses even though the
> branch is unreachable on sparc64.
>

Has this been reported as a bug to the clang project?
As it throwing an error on a rather obviously unreachable branch.


Best regards,
Kjetil Oftedal
