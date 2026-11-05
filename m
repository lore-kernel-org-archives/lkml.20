Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793913921;
	b=chW7B+nqDi46SJsO0uDUOj1gkyw9OH+h0KpDuAQftyScZYgnTVKDyPsBNfKp6O20eNA3
	 1lanogdP5iCwxqWFLd8gHY7ZbYhnwpokpBfU7T31alJNQRqxSa7DP4oFqMPi0dVJqnEOW
	 T3+O6LB+BqRztpniPKz/0yvFcNmT29r1ULgyb6lbwr5Wj3Z2cDDQinFxAOsAMnZv8xp+M
	 rI3vCwltW9lb6xjz3ZRr4k+FTy3KuM703DnETtnvo/ldnoS/BwOPRBMPpPZFtVeJjvetl
	 cliDP1+O/FTYNwNzTbLkYWpyblrAm8y1Ur8uALZM+G0hiRsFHEizZhfgHwmQJyAuv7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7IgY4oSwJmunrObC+s4jlkajaBgT8VZrvasnO3k+eC0=;
	b=blg6knu510++MYPI9HYDx2/dLX7o719uuNa/ewwPWRmB3/a82KAdiwj/99htaTD78kEZ
	 X+qQu4flcBwIAe5qz/nvWexGpM+SJr4ZbC/DVL4kfo85a5krMSTzdfjsnlvmup0MPDjqI
	 hGh62S9uCVJBdJu8eEaPLhve5gLUmz+jNV5dkLdk6OraEr1sLzng4K8s4A0NzXysO/ZyH
	 E8+jw8XDHXUArOFwuudPV4NBHJIZ5cYi4RcwjUgpXZgXLQO/pPIQIr9SXxwFomVro3Wfh
	 iGelIFppcCOrdCzogTJPkx7M7K91ktqFqWmWJ1fDftpf5rmAlW5yD66eKUgu4X33mrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGLIoJXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04F606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C04F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGLIoJXh
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so86161cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793913920; cv=none;
        d=google.com; s=arc-20260327;
        b=jQxRb7uKTWn8fVruMmcZrK6L0h6Lxc7vB9YvSmMYJrU2u89gXD2V8gLJmlnuA9qOuZ
         lP7OlseKp121QfyVl1wfy17BTToVrDp4q5I/61W2OIlzX6YwyqRdUzPDBNgVejdGOBoe
         WpHmgUoWncY8WCKfmfnEakbv1x5pykrxl/LxOWFyQnNQhhPFviGwiNsu+X0VrQ+xfbRn
         Cf6hmELDQehEFd8RXP9C+G3z0DLCkY3by1eBxnOeEVeZX9BPnh7j0keITMFXOlKxDGMl
         ei5khYPuMQwuvMoIP2CAk1LctS1V/Ib+DHLpivF+hgQautaeJ1zU2wQMjsfIHHDelyMM
         ORZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7IgY4oSwJmunrObC+s4jlkajaBgT8VZrvasnO3k+eC0=;
        fh=ZFbx6QZcLsVHFpR3EFV+5Xc32zb/f/j+H/y4Id0aQoM=;
        b=EKugLmUTKKZ9TIDAAKOwLWrSFCh+az8jq1Jr9LlfaFXyH8Q18VwhlwZjxSu2qlZ2A9
         sv3JHyPFQ7PTtgYvCIJotujZA30+muJbhsdn51k7Qni9fTvmp+0N/dWGgTqAQ4QOJDXp
         bBPOWWfd46khhzVymwq15u917z0xipGsudabVqraJy/9SgjEQ1pxyPJmVQOwdmZ6JuJB
         CoYNB7noIl7Ud/bVVNVyOewHACGswsDZqpgAYDeIAuCy1+GOzJnYJb40hWZm82PshPx4
         2amNpt5f9QPhprMFHktTAMi0BNEn/OSrn+1dUEghnH+hBcLJ2FaHXbWLSkvdO7w/xA9K
         Q/5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793913920; x=1794518720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7IgY4oSwJmunrObC+s4jlkajaBgT8VZrvasnO3k+eC0=;
        b=WGLIoJXhRcmdGEb0n3pms2EfI2CQ8It7v7QuZGcE+MZKrW3D+lGvxsvxvhkSHP/mbo
         bk6/AlouKi4J0jyyhi404w3EBpkEBI5LS8cpBgAwiGgGzIbrFdjTCqeHQxEY+hjXfCJS
         H5/2JtTpRC3KdZ4bSc1LjlagJ4tdfVk7GzXeZAVnuYXHovSBJ0SWAgz8WUZEZ0q4QeYP
         0RhLlfU9PoAGlZPJ1B4d0e7EG+vokwVzYffDLVbl1dva39eXcC8d0JMgldFCP+sWIBfl
         NotKlyKVj4jdcQZsPcjO97JAgOxpjGJLQX05nKgzg+riL050Vf92EK83U7lJYfAwjlN7
         JYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913920; x=1794518720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7IgY4oSwJmunrObC+s4jlkajaBgT8VZrvasnO3k+eC0=;
        b=wqZ6sbmkFsept7b8r9bTW+nLWtqT2ji494QQ2Y0Y6ZRMLKKPP+HxqgSvbuxkrrpw0Z
         yqUyB0MdSqO+Utbl2xk1FdEoUgRDjWyD7ffHHGFQ9J07emPOECh5/z9xnOcRMm4k45+7
         W7/K/reA5LM8+b9UjGIPprWOnpcjMUITfqoomOFQS0t1bN+SIIxpE7ApB4Gi+8e7oHHP
         uvnfX34Zq2iWw36EV/OifGVDIuaKsC+mQB3srRWAu0urURdKXuNykjItS4BjVTiTEcXE
         WTwMrzb8FexBTnNihZZBlZadqaOyecH/CxGGYs4wCtOFT5JpduD50+tThfvkwClKNSPs
         e4rQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0RWSwbRnLUqSXLfhqgZlmHQV/F8AvoUPL7KU/hRR8yOaB9VIsoGGQPXRWX19EfJNhRGuSIkJnT0c6HKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZOqAhw1hyDBb0lhsscKpYqzCLJrDkOpDSqHktamhQfpZ0uqeD
	7TNSoH+TvmbW57Hs8CfYfAQuT1T3tKzmfQ89SPejg26d8ih1O0DZgdi5o2GpN01YSHxHOBBjOjQ
	lcU5Hjrr85j+aiAKSMDuuF9KvhyT8bC9wtjTsQk5O
X-Gm-Gg: AYBFou29y9HUXdHzmZUv3X7YIImwPAR1YkmgclsXG54vgGr4jSrM818CEEyXUQ7/nBb
	CN5+N88CA79z23HNYVldgXtVDgJe0tXUvjgnXMOMY4nmenAtvDhLV7iybsc065anxNu32hp5L1d
	FzazGM9OeMlPsMNFFwkgxSkAoqVbF1dn4DHdgvRjaGJDJtOK3MvN9rMOZYYtj4Dhsxl1llogBiV
	QpYuQfhBGTakQNc0/W6ZumLpJgvqVgV8d3xJiFUAY+vrgfWk0/hO4KuvCcNlzXOLoAS4Gfm18+b
	MSlouQ96Ksv1wQHPoX8M2YJn8ih/lhr7a0s2QZDW8OGDGyk5DAEGJ3ouRHT0p/f9ad97M4Rh7Aa
	QWmUrHM4N3jrinqajxPQhzugu5cY98zKZ10Oc+Q==
X-Received: by 2002:a05:622a:4118:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-54e18ff2e12mr4497211cf.2.1793913919805; Thu, 05 Nov 2026
 13:25:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-set_huge_pmd_uptodate-v1-1-a78d8a1b7117@kernel.org> <DMNJSQDUACRI.HXKF5B6GSQOX@nvidia.com>
In-Reply-To: <DMNJSQDUACRI.HXKF5B6GSQOX@nvidia.com>
From: "Zach O'Keefe" <zokeefe@google.com>
Date: Thu, 5 Nov 2026 13:24:42 -0800
X-Gm-Features: AclHuK_cW9BDiSPs8h6BDqPFpxUXOylylNhDy7qGq0VHRrxqPWf2FvEDLTBnfxI
Message-ID: <CAAa6QmSF0bkATC6kNO0B1ydFtDi=OEYJJ5eH4zEakxjJ9z7ZqA@mail.gmail.com>
Subject: Re: [PATCH] mm/khugepaged: don't map folios that are not uptodate in MADV_COLLAPSE
To: Zi Yan <ziy@nvidia.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Hugh Dickins <hughd@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:09=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On Thu Nov 5, 2026 at 1:16 PM EST, David Hildenbrand (Arm) wrote:
> > madvise(MADV_COLLAPSE) can map PMD-sized pagecache folios that are not
> > uptodate. For example, shmem fallocate() can put such folios into the
> > page cache.
> >
> > collapse_file() already refuses to proceed with folios that are not
> > uptodate. Let's just do the same in try_collapse_pte_mapped_thp() and s=
kip
> > such folios, leaving handling to the page faults.
> >
> > Note that collapse_file() effectively clears shmem folios through
> > shmem_get_folio(); let's keep this fix simple and simply let the page
> > fault path deal with that.
> >
> > Fixes: 34488399fa08 ("mm/madvise: add file and shmem support to MADV_CO=
LLAPSE")
> > Reported-by: Chris Mason <mason@kernel.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > ---
> > Once reviewed, I will pick this up in a timely manner.
> > ---
> >  mm/khugepaged.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> Makes sense.
>
> Acked-by: Zi Yan <ziy@nvidia.com>

Ah, good catch..

Agree with Hugh that the "pte_mapped" naming is a bit of a misnomer,
though it was how I was thinking of things at the time.

Thanks David / Chris.

Reviewed-by: Zach O'Keefe <zokeefe@google.com>


> --
> Best Regards,
> Yan, Zi
>
