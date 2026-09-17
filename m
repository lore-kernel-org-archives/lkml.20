Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074CC5650EB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655467; cv=pass; b=TcOOCpTLRg59w/cAbF1Ke3ItTVdHaW3g6/gM4NQB7dIy6mC1OdkpaRRDBBYrViq9uqgYsp2Q6DBGFe1GymL7IIfFEEsVi7p+BrY7SGkSzDsUclRrp6+rZf7IqQgagEnhv4ggX/IoYlK+WYAFt+t3gB5bjGcC6BBndMxmbcDHEnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655467; c=relaxed/simple;
	bh=9f+78wGlcBOKNtXkR7f5aCpx4x+d4ZjfQVQNRxt8esQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOj5ar5BbhJYtpvw37+pekfB8XxG/yuXKnZOAOpA+J1KOc8eVxy6ZaWTcK1cNLjcglAIRPoicI+kxsHX+4gLIrRKXn/1mnxhUcDsS/OyK7jzOB1qNmdD/1x+vyrL8suagpObMhgr6/k6pat8EDQCBxuhrbtcYmhUfIpHS6IQLCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM1syymo; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM1syymo"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so510794f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655464; cv=none;
        d=google.com; s=arc-20260327;
        b=fUWsYpgNfGUuWFD6DOk4oPVk+mr+pUnDkNYtsIMTREmwporDlvqspwsy1hGXJejWw5
         xygHkEhH5tN1fn/glvE+VZLmgOI8Rjyi7mWDGJA7Djoi6Hguz9ZxFsX45HuD+9u+H/G0
         Yt58Pb6gMeNhfWoxpjmWustvCL/ldg99RdxmUSVc4x6oH+hkg9csGY6Y5UFzOX9aoPdl
         rU7AvjCTjSBucQfXBaqpA2aBNQ8XnpXud2V/KOzVXAiVOecmjkk37EWfw/07UtZHP4w8
         QLqSZsKwhCsxxZ8OFj/3Athdpp6mAvoJ+wOjf1qnoOYfkG9hAwkAo0GOp/YlO7xIN4RQ
         Kqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        fh=9vU9aUVjwlYWitvDz52hVisc8FO1yGOqsk+DqPCRVYU=;
        b=Gz6T3YcbcrvzN2bG6IE6adPyJt6Qpd1rDi1nKwzmGpGTYglBpDyIKaKiK8f9WznMhu
         3xQdqvSwJwZdzirJSdlZfj+lgL3rqZI6OMPPZZGTE8r3j5TP75srQJFN0UUDzE/wEIaz
         usl87bQik24MoxnWd3QCYTe3osCsbPyS7UsG0nUkwqwNOwk3PON8kf+A3LDIIbVWNQSh
         jayTSWf28kzT7gSY80zeXUbyhs3fQl0X+L0zUPX7L4Pso0KaBh+Bc5TmQRkOtlm/Wq08
         qbPcoAKYeDGH2pyB8zVuiEc4hrSBNQwQ1mmG+B9+m9ccBqXZEI+MSbTRAw9IQA+TisKy
         rwtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655464; x=1790260264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        b=FM1syymo12AJ1W8Z6UsRCjeuEmOebn3VL/xFBbaej64az9lCQzK2wB891HjZ19aGgK
         xJL2714fsU5FoEPVXmx/XyqwjTp+m/AWbFGG2JqqBroZL3d/fljv5yOmpfQ0y5RupUfj
         zA/BvAQnEW9Wj/NlJIsvtdgtQrj/MAYq2JxDRGF3ObjGSHt2svFI+aFrWXfMTADktMBL
         6MWw/M+kKQ27KaSBgybTN6YwIFHk0NnWavx0JjNKC/6D9UcPbfiZdXOlWrZYY1SgDoXK
         rd1PrWSWSi2k16qF3DWcqAsKJS4dz2WL+NTSr+A2Kuh3uOar+TWtwTwRpxQfQhJv2LBM
         VSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655464; x=1790260264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        b=2SWSygP1dy1qWsBJZ1EOlonZhX41ASuFB5zVa7yzAR5URM1GicgQWNie3DmC6iEICK
         /MAwm9iS2hXP9vlyO0pKi/TAo7zM5Ti5yivFiO8pNN9+eVyhd1R275ft+QnGIJ1caIQK
         RItV5INKr4Ns4xNhxsBqc1A2CavYHYcLLgCAhw2L+lugZXfabawwI88ntS8uJAKeKlqb
         afMQb0CtL4RlLwcaSNcR9RHDXIUT6jPdybooB63GvjWl4OdAqejqbdb/D3MzI2hh6GY8
         sUJqsLpfL4I16EYvhuTW0k7rsM0HGW25pbomxC+Jl6p194W3zUkxjZcP13huJPvj4uVS
         9+qg==
X-Forwarded-Encrypted: i=1; AKwUvBy3kARVaN5wBks3J0HBmU02PYc4wugb9yu0iplsa/QwuOB9gidCJkK+s4N0tWUv7V35+tl0SO5ZBh6ZQeo=@vger.kernel.org
X-Gm-Message-State: AFuF++k62OxtCIwM56YY2o/fBuCWZCGndpftif7FfECHIKmS9REpzq/C
	8fvJUMLxve5E0FqyfFFLek4J1guJXPl2OarIWNRUzqXLTy4EURJg7ealflKrcfIXl8FIaIX6g+S
	5lSH07pYJR4lV/Sl26/COALh0IE2lPEo=
X-Gm-Gg: AYBFou37b5hDdbR1cZxYRRi4aEtRbSkySv1WpQCksz2DSMbxBIfqfVj5RFarMuLQ3mg
	wGuX/J71RGs5dbR6CiUO+QKkjcAn0QDi3hP3WCZLXJBOQCWDHZMBgokGRmHLk9Pv86k9iHOd43s
	Dnk4i7FGoD0iBnEeRoMBwWr7JdUjNQEU5SBpFxQ3yEd/ZzqU78+ih9vMOCXr0blfAOS1xF6BhEM
	c43iJjv5+Pnk+gzh851/H1DBOgpuVTQjiHJ2WQveTQiFQZUyBDlVyDEeLRlxC10SZfAc4Mr80Dd
	5tSNbL8LpeDjAICzkTQq3SxO+dP/Uf4B6lbcs7DnlB86HuDw3lJzDZjdRhD3crl0mTg=
X-Received: by 2002:a05:6000:26d2:b0:487:cd:f1ad with SMTP id
 ffacd0b85a97d-4870d03f013mr9657861f8f.45.1789655463783; Thu, 17 Sep 2026
 07:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org> <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
In-Reply-To: <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 17 Sep 2026 22:30:54 +0800
X-Gm-Features: AcwNN1VjxeYLM2KzGJsJYtKrFkqVeJG4mjk-7CUC4wBfKBcPA0GlNQxygqiRut8
Message-ID: <CAHKocdGWem4xW=vZ03maqtHaRLReYmAWkh0rAj63AW7e1+MjPw@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sept 2026 at 21:56, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 14:17, Christophe Leroy (CS GROUP) a =C3=A9crit :
> > Hi,
> >

Hi Christophe,

Thanks for reviewing,

> > Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> >> From: Wen Jiang <jiangwen6@xiaomi.com>
> >>
> >> This patchset accelerates ioremap, vmalloc, and vmap when the memory i=
s
> >> physically fully or partially contiguous. Two techniques are used:
> >>
> >> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
> >>     segments
> >> 2. Use batched mappings wherever possible in both vmalloc and ARM64
> >>     layers
> >>
> >> Besides accelerating the mapping path, this also enables large
> >> mappings (PMD and cont-PTE) for vmap, which are currently not
> >> supported.
> >
> > This series doesn't apply. I tried to apply it on top of v7.2, v7.3-rc3
> > and next-20260916
> >
> > Can you tell how to apply it ?
>
>
> Finaly I was able to apply it on top of v7.1
>

Yes. This series was based on v7.1. I'll rebase it onto the mainline
in the next version.
> Christophe
