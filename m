Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443008;
	b=GoXFBIZzzfmhr9np8UPksOK2QV4DGyeITA7ogGz9nDiZ62xC3n9mERGoQs5bjoHmw/zQ
	 x1rHsYTID2kS+cJ09+GnN+7defx9Hpiyqt5x9yMpID8fXaOj94G4BmZL2HpS6t1FAoYmn
	 yfq5fT2SPLhkOFflX/ZE6kkjCKKkYfe1Ol4BKAngVd8KLLyBUJSeVLrRNNNR/eqC9S2qN
	 Jn+tyPK91VBn7OkKncgKW1cd7ubAJftmGIDokWDmVn+pM396+1H8uioJ5+lT4b1C8GRWQ
	 FBVTRrigcicQf/sRajB74vn8Z9InKpoiJUbwa/S1sHlv0k0zZvvjc1temlYTmZiBE3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7gFvsNqBDXUT4BnAgicfRx6qITAPLA5lFq/xnuZcz3Q=;
	b=u9IaaLxwriD9GHPv8SqNwQRRu/gMmcxGbmZcAbtMLfjLgex+GU4ssHPqY7t2ukB1e62V
	 iALUk+W/HfXHiV+9tyh30VPW+eBOMEhT1rTCrD4fdEm2KxSqPk26VSWF7SQ62AtOqd/EL
	 wMUleHmQlm8uDyZ4Fia6XzzVer8crX7Rbw5Kt4iK9TnCbKImPSxudiCD5ayVM/GHTCfE5
	 3TmsClwDRT61/dtngkTReTox444LX92Be+hXXD5x5CbC6rFHb2OTBbNuY7D/T/oAWb796
	 x3qc8T07vcSlh2HoiIYIDrKqCyJuWkDhcy3l+AeqLbXlxe1ov+1bql3NDx1fXhWva/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iM/BJw1W";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECDB606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ECDB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iM/BJw1W
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5383c97c8cfso40751cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794443006; cv=none;
        d=google.com; s=arc-20260327;
        b=OmTWZdEPeOd/7EarpuHUq41m83Zsnm2edW3AVq1vq6jVEJaYqXNCqF6rdrtXNJl6OR
         VDKxWnidgddTt9D5TEgMWHaAD9OPLQqliZU0ET/OAHH+wDuZegOYW9h32gEpN0SyzwPu
         FvIgVqGykYgaK1HOIqRFGRBFrlgLnfx+oOxCSrvJzTHHKL0AoHjzbYGNJEeFwoAIq61s
         LXYs59JUdPjMgAhha/ZZCu1+cle4Q2fUpDhzxWpF9N+xsdGhZoXCOAf0lrN/11vwyD0k
         xJx93z+2Yi2BWuN9cN4Z1cP3TvINkrZ3nsozj05j2LnP/Y1uaJSCQXlnbJQhea+URtty
         B2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gFvsNqBDXUT4BnAgicfRx6qITAPLA5lFq/xnuZcz3Q=;
        fh=XYtZDEHHpe4fxtSCdoZRo4l/aGE+yLL5LdVYMJQB0cs=;
        b=MItxBUfGKyVVliiXsZbBN4NJ3fj77A7yoDpMsaH324wpoxbWIPwEgJGHDP6UkQ+GQn
         GgsZJE4TtOisTiNyPAJavA8w68V/w0u4KIOT9c1vEv/cNiZvOc6G2F/OP9SW+9D/Up93
         mVcMOnQeyi1BzSsQ7g1e/eoT3VlQo2th4maWQxJaGMtuT5G63IBX89CQQtzAkUwKo8Yf
         rQet3RejaYCvCBz06lP6TmhDIh5fsR27zyFCDVUPsmK7nz8eiGUlwDYxOVvz5fsEgEJI
         qtp3EuiUy0IqY/vA+HGomb1duWfc5THy4so+YN5/eEUXt9mXy95prssyeReeVYSexR0v
         ngaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794443006; x=1795047806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gFvsNqBDXUT4BnAgicfRx6qITAPLA5lFq/xnuZcz3Q=;
        b=iM/BJw1W0apDQHJdqA/gcDzgg/HDv2K6K+45sPJwUSZqHrp/pEmu3dQyjzySFhC8QN
         imzHnfbbCh5Fkj/94z+CbkrjD/a2eVpMH5ChBrg6crT3nR9dz6OaQ8cwNBkOVqnY0hMz
         7gERY78EDX/dldJiwj8V/ISGBABsezeLprGLCjjiKbk3LL5C5mqnmN3Nq2T0A0MLYVQU
         2l6dOlYeSz4fISJ8SKmh5i1fnXcE4QNtMfbwQAiSJG9xerX5wdE5ZzWU6pGvHcvGgVbi
         jw4GJjlX2bwuyyr+X9CFIRuAHcYIX8GY9czhSqAo4IIdQNRw6mrPUCNwk1AMIEjqCbx8
         OIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443006; x=1795047806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gFvsNqBDXUT4BnAgicfRx6qITAPLA5lFq/xnuZcz3Q=;
        b=wCqvuGeZqEPHunVsUY2MsqdJEVUSj5LJSlHslc46Z3y7+8zIv0p9ujg7QiqPPLf6+4
         TnHenHJa8YNvlbuuvy73LO3H+zvmL68f+0N7B+iC53Up5VfqTF00qP7PGLkp5UWddZpy
         V1AD5ZBXIArZwVUZC/JE1DgOi5b6bX+B1a0UQKJ0PCAounDDUnQZHUyqwZAigu+D2A1L
         bRWTvKecsUXdIMfRIC0ZfKACk6/e9SR6d0cnVRGBGyrwI1jU2W6ecIxkZBj5+A//8NeH
         lTRJ6DHF2x48lRR6Ai0HbOyGQxafz/2Yzh4HbkVWbp9MKt7QfLkaf2MD3b5xVpSl4f4V
         xcng==
X-Forwarded-Encrypted: i=1; AL+hErHnVzHtMyCGcIFUdz8oeNQB3qDfg6ErL/HAdQIKmOtkaZdDZaViXJW3Au9u44aJkn6GlRJsUoXLNwzo0Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c8F/odXHp+gHsEHJb5ReZRtsUgI+2ZVO81VQ7ZRAA/8fn0BD9
	p5SDsRB9hXoi6pSOqTH5AObBW4jOX6C6LD52u7Y4kmpr73NYEkV8m74TMOgNFBo4eJ92uIvLvM2
	J5rW0tFVptNyVzOt8qbmd5tdetIfrP+UycZCRcQjw
X-Gm-Gg: AYBFou24tV47wyTHGS8bn9z9fE/csy1+mdDeGWE8gun71Y1/oXhkd5gqDGs8YJIaqZ8
	4Z/E09LLs99Shualx8wv5+9zWb8qvkpeTXlOrhGundYn8crHiZAkCq6diVsbn+m7APjouIk6WKz
	ibslhYy6wkQ5Z5MXK4bIs+w/afaNNzuZ2RqjCiEo8QQV9vvA1kt3kEm0ynbhkUNgnBREat0s8ZP
	KrEQZRTJBvaB3Id+DOgJ5yy3Tsn8+iunzLId7nqiM7681FLRXMFhSK4ztzQ4EQA4bXWKRyDZLwv
	2Dpv7G3+0BRJlVyZZf8rxOiup4SD6O/fII0Nf0o0VCwaubI6qqECT1vtmbk4WNpxeE8axXuybE2
	Lp//kI75CVq43rT6WU4/xH2txpnCMY8+SRFMXiPT7x/Qc4rcl6soasJ7VPxr3jfgGyLFe/Idecb
	nnj0iqN21C+11+DvO69WiIj7e+qQ==
X-Received: by 2002:a05:622a:a15:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55990ed99a3mr5033851cf.14.1794442963091; Wed, 11 Nov 2026
 16:22:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-6-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-6-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 00:22:32 +0000
X-Gm-Features: AclHuK_CzL4RP99FDahiZaf4bltPjfDSR925sbwaiHf5mOE6wBtoi0bQgJsZ6U4
Message-ID: <CAJuCfpHWe6gB7rYvTrW=ufqPtFtquGW_u2v1yV_9uuXtnn-KbA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] mm/vmalloc: BUG_ON() on an unaligned range in __vunmap_range_noflush()
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> The PTE loop of the unmap path stops only at addr =3D=3D end.  With an
> unaligned end addr never lands on end, so the loop walks past the
> range and keeps clearing.  With an unaligned start the loop begins
> in the page containing start, which extends below the range.  Either
> way the unmap clears the mappings adjacent to the range, and that is
> nearly impossible to debug afterwards.
>
> vmap only installs page-aligned, page-granular mappings, so an
> unaligned unmap request is never a legitimate teardown, and there is
> no way to tell which pages the caller meant.  Check addr and end at
> the entry of __vunmap_range_noflush() and bug out before any PTE is
> cleared.
>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 86fbb1d2b27a..0565cbfe325c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -518,6 +518,8 @@ void __vunmap_range_noflush(unsigned long start, unsi=
gned long end)
>         pgtbl_mod_mask mask =3D 0;
>
>         BUG_ON(addr >=3D end);
> +       BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));

Again, not pretty but I don't see a better way that does not involve
adding early exit checks to all its users.

> +
>         pgd =3D pgd_offset_k(addr);
>         do {
>                 next =3D pgd_addr_end(addr, end);
> --
> 2.25.1
>
