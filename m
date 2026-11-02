Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640787;
	b=YlWEwFEO64/qPIWywTKH/GVJHpnJeUuloA7XaReriFdmKZWWpCU8oTcOvKyg8cUJWUsI
	 7zjoxG5mtfgCxTztJVEsBEN7yGqbXLJh+PTY3MX9xjyRWD6B0dMG2/lkBrK0PynxG+HL8
	 1/Y1Y+H6MI2Oth32A3Of7WN+rSnKUUXQ+EfhJptJjm82EBZT5v2lGO0S00rUtIOBPUHWn
	 sltSODjE7ynWJsQ5+/aUy9yo1/Uw/SJq4GanOUfhFlqru6zL96HFeBZYR66wtvnfMs30b
	 QHTbKl29/tIYBRNkm+PknbXqHM2JuXsbBpo0hd4J7JoDRD4AIBbBG0DeNM1CPS1f0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640787;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=epdlsZktym6bgZ7kYPnBVEf6UOlrLLIvoDDyPEFmjN0=;
	b=03GkvANr+T2zGcAkswatO9S+zywY+GJfzoj3sYa+7CkLR2jKH4v2Q21skkAoQdbPSOrI
	 j9RfUuGIHkdCh21KoaDPbeu34rHyIcQxK2f14r5zq8Pnp3ZhPo5VsV9xo1mWQI16Uqs1o
	 iRicInIaZKHzh4OpqEjMeVR1JZWEa9wr5kClQxRC2JMQYifk8J+oDFd0HP3UwzcJot7WI
	 wUk+DvPPI8eOOZ1rchrhqckc3LN+EyxVm1iTRNXfjIaQET0T49lnXqyt1UkLYncIzon4P
	 650+pj9TlRx1Xz+0kNmBvDLl1fF9b45x4Nmq0EmTwJ//RHHZNfxV1ke6KdWnzLs9+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDuG51Td;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0DC6074A6F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDuG51Td
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7A21F00A2B;
	Mon,  2 Nov 2026 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640786;
	bh=epdlsZktym6bgZ7kYPnBVEf6UOlrLLIvoDDyPEFmjN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JDuG51TdhhM+ltkOKN4vaV7bTeP6uQ/T2WHV5fR3Bxtsj18pfsVJSwzNEErdBfkQo
	 0096wV2dcJDAIhkhhu6zTflttjckEt9KOu7/FA5rs19Ry5AJ+AOVY7kZX5hJo/5XKK
	 QX6vSRTD5P7SeSMx5XPd/JFEHYGtwucaW+mCZiJAm7DbDOaJg5JXb4n+ktKpR2spOp
	 TNpTqNHfZN35fnCuUdZNgh6u8GdO+DJE7TdO/lYiWjQO/MTITMtKFRlZEB2WJT/gPt
	 c+UCGRnJfZhvg5nIeT879/QGgbOttudphDncM/rV5WdJYX6pPuN10r14w0ejIq+xuC
	 dxn37WSkT+1SA==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4F7931980058;
	Mon,  2 Nov 2026 12:32:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 02 Nov 2026 12:33:02 -0500
X-ME-Sender: <xms:SsnoaqzB3Su62LyHncMQ0lnCfOg8771QTcA-bgDligf_JW_6rQ72cg>
    <xme:Ssnoat8UnY5i56wTk40g9Vyb74-qaw0sNLMfqdOt3mZlcBLGgMZ031ExjxSIUNbFw
    Vh6mUyv2-oUIDV1MC28KZB3nkH71VO4SXoPVgFiTHlt9MHkZQoTbfLl>
X-ME-Received: <xmr:SsnoauhM5NvIIuqFqqMUlc-89g-bt8XgxUHViYb1YTDQ0jQ3aG2XUt8nYsU>
X-ME-Proxy-Cause: dmFkZTE6fQTv86jMCHXBGciyhn4W+FrbKyLnJx8PbAtZy4PALRsriBTpj/HnQ40J9WaHHk
    Lr2ReFUWNCH5qJLtK2pZUlhwL9yi4sDB4RY1skbJwzjGD8KPbz+HSRvy4vR2qhHnSAcVnw
    endG2YbK23eETUVyqnhbIW0+UTWGaylBbPufprYXoX8qsUDgIwGPBIlgCjEb6bZbBBUP8h
    uIM+PgtyB6djpGMZVRt4NxbvBc/JYsj6evJ2PVFkJ9UN6cq872K7MMfkVkbdidVVzQUwgj
    BGQRqoUsQjuObq2TudnVUJfoXtD+SGg85RuKmhlYArUQwe3x24r0lvahP8r+xdH94fqre+
    CJPu3DW88+cK89yUBDmN8B4qMiGGdySMrWiz/+2mXUnDBOs8llcJ+dt95Db4/KxrwxHsXk
    jKv2dDABu9Prc4ClyM6Golsjmhay247FDMa7gP4dHhymxM5x8Vten7hnVAnjP/2GsTHpes
    NeTy7aRgSePvKBQRPhL60ChMd/+AHJl91X5QpFfXRueDGj4EkQXfdQ6OLeeSJLb+n8f7tf
    4jZDl7ijMUN+MgKCOPyvLIrehdQeLeSclNAM3wwfVLZj8bP0ntZQ3x2yqWHz4oxYgufeSy
    EQ8qW4hEYD3pPUizyUE5ElDXLFnodUec9/C2FFPSQt2BiUxf8teGmLuLTC5Q
X-ME-Proxy: <xmx:SsnoavOz1ps7CWvLYlT_c1potug5wjX5N-zzahU33RGnCp_XhxT22A>
    <xmx:SsnoavlZugqpGK0REVgdq0fDzlQPyBgwBSebIoqifiUY2E9aCc7dow>
    <xmx:SsnoamW6kRMms_IOEXyT5V9JjnIYC-4-Uda4L2gmVlHZWkF1GdwEpg>
    <xmx:Ssnoasb17vt5X0o0YBAOOgCssTblV6Jrc19EH7Qb51A6R7WHwIZldQ>
    <xmx:Ssnoal2G2Q_WUba20ZfiWDMwFltUFxWKpGnqvATrUApasIEJMzZ8NkQ7>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 12:32:58 -0500 (EST)
Date: Mon, 2 Nov 2026 17:32:56 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "peterz@infradead.org" <peterz@infradead.org>, 
	"luto@kernel.org" <luto@kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"andrew+kernel@donnellan.id.au" <andrew+kernel@donnellan.id.au>, "rppt@kernel.org" <rppt@kernel.org>, 
	"pasha.tatashin@soleen.com" <pasha.tatashin@soleen.com>, "kernel-team@meta.com" <kernel-team@meta.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "tj@kernel.org" <tj@kernel.org>, 
	"azpijr@gmail.com" <azpijr@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Message-ID: <aujIo3W5yVZdZaf7@thinkstation>
References: <20261102144001.342837-1-kas@kernel.org>
 <f20b6d4f4e9368885e187e208453f21a9b0a2140.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20b6d4f4e9368885e187e208453f21a9b0a2140.camel@intel.com>

On Mon, Nov 02, 2026 at 04:53:17PM +0000, Edgecombe, Rick P wrote:
> Do you happen to know if this performance impact is relevant at all in the non
> Safe RET case?

Yes, both sides of the comparison are the same kernel with Safe RET on,
with and without the patch.

Without Safe RET (spec_rstack_overflow=off, same two kernels) the call
and return predict fine: branch misses are the same with and without the
patch, and the gain is under 2%, within noise.

> > diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> > index 4a105f283cfb..3352bc6904f3 100644
> > --- a/arch/x86/mm/pgtable.c
> > +++ b/arch/x86/mm/pgtable.c
> > @@ -798,6 +798,7 @@ pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
> >  	return pmd_clear_saveddirty(pmd);
> >  }
> >  
> > +#ifdef CONFIG_DEBUG_VM
> >  void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte)
> >  {
> >  	/*
> > @@ -823,3 +824,4 @@ void arch_check_zapped_pud(struct vm_area_struct *vma,
> > pud_t pud)
> >  	/* See note in arch_check_zapped_pte() */
> >  	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
> > pud_shstk(pud));
> 
> I guess all of these don't need to be the "VM_WARN_" varieties if they are
> compiled out in the other case.

I can do either way. It is functionally equivalent.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
