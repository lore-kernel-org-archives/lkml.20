Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6823F0A9B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910027; cv=none; b=NCVpVzEOjYLdeN6ig2b1xsvkUM095NHOv3qoPMbbcXsz7yMGfBTF52Fv6G4T0fA8mTtBdj8xomDmt6EF97ON2T04WEslZ5fqilK8yjPSJ0HeY6ORTZILXc3O4OxTop9L9sKwmG1OjwC5r5ybfDS2ntOgkWHolXZvGR4a3ybeqEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910027; c=relaxed/simple;
	bh=0J6s6DEj/h1b/sMJa/RbX95Z6KaY0eFw+8095K+zx7w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaDYX1sSap2XG+Upn1fOqPZfMoqjlaI5xtL9ypNcspbIDiEM8Ea2bHBDJF15A8kmxn3MMf8qeHqWsaFvTM84a6tpCpLw/dHSZfBhbX+S1/QIui5SJSDjX8LlSjFpDdJ2V2jA3gpGtMkx+EBc5SlwkE8NzmOOgaN5xw3zacT+wkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjRccx6d; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRccx6d"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso2979534e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910023; x=1792514823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7ehum626aRdlGmi7yPsx5ujCWqhQvPjIn6TPtUOXnM=;
        b=sjRccx6dk9wUR+fW+kIJSoaYmzQvufanOB614vPsqOni6yrPwmwd+5lAhJ13Jdeeyn
         db9bGImkl+RBDe3xvJCEiSIKP/HaOXr6ArJobT+lYPL6aZuoEaVzJFyzkk/geh70KIbA
         soOdekoWBb21TkwcHBYX5qulQun7FP0zHcOnKSvFJ1XKqgVNf0iuSfRXoe2KQJ7UzWF5
         3abx0t0/nP2dKVUmxL2Da1TSElCOz5UkyiUXbVmU/c6Aeyaj3ccuMuK6I9KZJQ8pQJNi
         oyC3FlY8Fjde03goAen2od35wClgXSs7PEnHiJFJBDcaG1oUjg8L2DQsu4/DNmzUCWYD
         tN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910023; x=1792514823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7ehum626aRdlGmi7yPsx5ujCWqhQvPjIn6TPtUOXnM=;
        b=A6FGzgoHISp2FVoI/bSyd08fAKHwOPw65Ye43cO/QAX6ykJndeXlujmK5Ly0gbvANg
         e36PYi7gXIIft4KOBG054kcbOHT59QwUJZF0CSChXwK+/2tcQFMC2kjiqNqq5LsPcn+7
         svm36CTLrh72nPtKSzv1LTuhAe89JU/OogTx83NhLcWcrYBOuwnClQNUTHMFluFwWd9X
         cNPO6s6jASImpV+G8AYmK072Z+iXBAiuG5tEyXnVD/9JXV0/Z0EVDl04BV4iLFt03RPs
         V0nOd4Dfu/JToVsecnb7J0gBo55cMn8/M50vViyDiDX77X4wvf9uuwffNVvdeNZ6w/Ge
         SXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi62n2v0jjrWaRvVymLNpkoyQHRGcnr822drRzffjqf8vXiIPoN0QfnoxpyWgF53p1hY9TqOjGJ5u3/BU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb4DvC3F35Dgylbc504lltHx4jAYpjAEzjeoeq+wY4H9Kyk4FL
	m8qCSCNCgUIqKGZX1vXsIGdSRnFfz1rbbCSXNwFfZvmeOAfa0vqSf3g0
X-Gm-Gg: AYBFou2hTH2ksVPMURvw801uYkZQdVd0hxNrprV6quEk0AlKvFytb0pgkwmgJqmtmhg
	sMW6lLNLI6urUd6OgUb6U+j1tr76DZWLlLxleBZv2I7ITrIakGNDtxLwN/r5bdg7Mc+v6l5xuxo
	B6a12N3lkdaNVa6dpfJqNU0cDti2meGGFZohMMI/gd1iuRSNEOxXfvuqoLs5lTdqlBE9iwmP8EA
	sBvxWSVPPMNp0bg9Kt61e1Kt2F0pm4WUl0gGQCQroEO2n+rXRfWDvfKZUv0q2n6Xae/GIcMURZs
	SiDMQdn7usfnnoVCAKy5ima4sHHIF5Co9VdPBsTzYbDvVYb3SfY28DSelGsO2Vf0NWuf/oTjS4B
	LiScgCewmhIXU9pkGMBaf+KtME2PvurekVY0Q8dOesXacFQvKEgo+YGKoSityE0K9IoF9RRpyiZ
	nTIOVF4pF6n7bIpe0fvVfSRCXPavtbnhtNVSrYsDS/TlTQaZJxSGdn9lctoBxLptEuz3zG2R3l+
	RUP+1Mhwo8Ndd+n+Z76RoDt4/ZGZvonl6U=
X-Received: by 2002:a05:6512:2243:b0:5b8:f202:7749 with SMTP id 2adb3069b0e04-5bcde8dec4fmr4962852e87.59.1791910023287;
        Tue, 13 Oct 2026 09:47:03 -0700 (PDT)
Received: from pc636 (host-95-203-22-87.mobileonline.telia.com. [95.203.22.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d85b40sm52801e87.50.2026.10.13.09.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:47:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 13 Oct 2026 18:47:00 +0200
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>
Cc: Hao Ge <hao.ge@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/4] powerpc: drop redundant unmaps of failed vmap
 mappings
Message-ID: <as5ghOejcvM5zDOa@pc636>
References: <20261009063619.112313-1-hao.ge@linux.dev>
 <20261009063619.112313-4-hao.ge@linux.dev>
 <CAJuCfpHjX+_AvwgqV3XB_QQuorvnegvd_YjQ85JZWfSk-ckUHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHjX+_AvwgqV3XB_QQuorvnegvd_YjQ85JZWfSk-ckUHA@mail.gmail.com>

On Tue, Oct 13, 2026 at 03:23:41PM +0400, Suren Baghdasaryan wrote:
> On Fri, Oct 9, 2026 at 10:36 AM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > vmap_page_range() and ioremap_page_range() clear the PTEs they
> > installed when they fail, so the vunmap_range() in remap_isa_base()
> > and ioremap_phb() has nothing left to remove.
> >
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> 
> 
> > ---
> >  arch/powerpc/kernel/isa-bridge.c | 5 ++---
> >  arch/powerpc/kernel/pci_64.c     | 4 +---
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
> > index 5c064485197a..93029d85e6ea 100644
> > --- a/arch/powerpc/kernel/isa-bridge.c
> > +++ b/arch/powerpc/kernel/isa-bridge.c
> > @@ -46,9 +46,8 @@ static void remap_isa_base(phys_addr_t pa, unsigned long size)
> >         WARN_ON_ONCE(size & ~PAGE_MASK);
> >
> >         if (slab_is_available()) {
> > -               if (vmap_page_range(ISA_IO_BASE, ISA_IO_BASE + size, pa,
> > -                                   pgprot_noncached(PAGE_KERNEL)))
> > -                       vunmap_range(ISA_IO_BASE, ISA_IO_BASE + size);
> > +               vmap_page_range(ISA_IO_BASE, ISA_IO_BASE + size, pa,
> > +                               pgprot_noncached(PAGE_KERNEL));
> >         } else {
> >                 early_ioremap_range(ISA_IO_BASE, pa, size,
> >                                 pgprot_noncached(PAGE_KERNEL));
> > diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> > index e27342ef128b..f74269636d5e 100644
> > --- a/arch/powerpc/kernel/pci_64.c
> > +++ b/arch/powerpc/kernel/pci_64.c
> > @@ -139,10 +139,8 @@ void __iomem *ioremap_phb(phys_addr_t paddr, unsigned long size)
> >
> >         addr = (unsigned long)area->addr;
> >         if (ioremap_page_range(addr, addr + size, paddr,
> > -                       pgprot_noncached(PAGE_KERNEL))) {
> > -               vunmap_range(addr, addr + size);
> > +                       pgprot_noncached(PAGE_KERNEL)))
> >                 return NULL;
> > -       }
> >
> >         return (void __iomem *)addr;
> >  }
> > --
> > 2.25.1
> >
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
