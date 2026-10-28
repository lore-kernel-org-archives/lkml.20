Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192302;
	b=274fvcQqhSN0W7BlikL9lQRfikOpWD5017GL23LDW3pxDXQ7X8DITr8hjTqhebnVMyMY
	 r0I+BeP27dbmil88eXS7UuxbD6TA98UGDV3AaSv+C0iK0JzWE7m32uSOQjYo473VqAnrP
	 xquRgIwFFHZyZ/HBG3cXIudjBalMkMHygLFd9TeDUmYdevCSeOxxI+2jGcYYORvXm10FS
	 q2S4IEuycRDLbgex5zh/7HXeyZ9sr36bTyEL5+HKXF8nr3GuFCIykNnqapxI7U53fohpJ
	 DhqHd+Kv6//c0UUrBPaNEdNdQE+R2Ks6ci01Ux6okXwLvTIS7pT9yXL7TVPN/nKGM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192302;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iXP09owLdg7hATVHqSaJqY6i6epL8PW7s9/R3d4KX90=;
	b=HbNwiIqwp1WjtErNB/re9/A146w0OhbXok4VHYzsioyRqz5R5Zv4bYaO+DoKWJ0VTmNO
	 qJM+knarrb/HPlHoaqq9HlLrMxrFAf32LcTSxiWl13eYpMESn1j+3qJghWdeAvKRFCcNw
	 jvTvi1dbcv8VZwSuZNCKvI6MAftVKRpolWnSOG3Oj+6Vo17Bu35iT2fdsNOL/bm2nSHsb
	 fP2KHbL+xV1/w4YDK01wpZDab+uPs4t+EzZH/tSe+dsJUIli2vzbPAhxm/sb6enxZNBSN
	 BnjOH/c8d8YiC/vjws1qah4x2gm29bAS+AbgcbbeigfTAQgr66n4jmLz9hTRuJ5fNUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMw9vBWY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B42606A325;
	Wed, 28 Oct 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMw9vBWY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256601F01828;
	Wed, 28 Oct 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192301;
	bh=iXP09owLdg7hATVHqSaJqY6i6epL8PW7s9/R3d4KX90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gMw9vBWYeungNCPvsmM8I0lEpRDakT4R3OeAfcy2KhbQ2ePQpy0+u+MU0z1nPw2dp
	 Z1rOKoS03rdLa8ZS9juT1EOjfldfguEgJj2VSAkA5WWsVNgnsx2owXZYcWHOnokx6E
	 VBVBpNl84QwjwDL0wR8U/RSALkuOKSU6gmgz20QpCHZ72sfMXMACd6Flq02aGtQoaF
	 lSwaqb1bcUk0PghM3/D+Aagkdlz3tswOsJVH+nYEjLx9RDl/1QiCxNozEezr+Ac8Cg
	 SNc/clX7BFRxIap6Q6GkQTAypGZBr0XpeKP3WDzbLSMCIMeyGUi42RwZRKbMaNbKK2
	 Ari79aZH/M9zA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 12518198003A;
	Wed, 28 Oct 2026 08:58:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 28 Oct 2026 08:58:18 -0400
X-ME-Sender: <xms:ZfHhajboqn9P0xW85zuAddF0nx8dlDuQUrV58UHPtQhzLeQsMDA4gA>
    <xme:ZfHhakv5j3ouTanGOIjSriPza_df_KyJpB9QzO5YuJlGrXwv9dpajG1s8C5WnWLC_
    O-NxUfTiWqdLdmQy6LLp7VShIr3QqdWHSTXAsU6S4HBLRaTjDjjp-jZ>
X-ME-Received: <xmr:ZfHhakuuFZEXhBnX_oGzdquszg_2jwsx2zTCBVxREgT92m5qC06ro0-D7o0>
X-ME-Proxy-Cause: dmFkZTEF1K52P+kaoE+JlHf2K3zEGis9UvTdecijTo2/OHf4X3NA2RLlSL8l/5NYHn4tY4
    QD3mVKhRVCsogVVGnIRJQ8fh065hN6V7rh05cHd1D3T1Oo9p35G3spAqIogpqrAcWXGb2+
    4OjD2iFBYrk37D/8UhFOtrlL0EnAxrNmuh/eEPHf8B4sMC12AsOTAqn4aC81lF51glNO8i
    yQKytqn+ywGH1kzh7+JYq3/esC0d1GqO4AO3qemMBFJEPRBtvUY96xMCSiwFz7G9wusDfA
    opmuy4GESkD7OWq7IIaD2pYT4TsEnQrhQSb/VkqeZfR/tLHBwfWfS8ohfVSXue6cuq/Zmi
    jv1cOIxgVP1T9tBH4KypCqN4L2fHVypU2jct1/cAteq+LOOum4mt5YzJrj4LcyOJrAEaQq
    nn1SnjzAGu/R82NpBLBYVX44VPvoPpLgyblYX3+KBoZdds0WfExBACoLBTw6Jhg3VaSLCZ
    nMVqcNY47gAQk0oxuy21nOhoCEL1pEHjT1XRxtwhrJt0voPgZkF5WGAm+H+24WW4TKOKie
    C7UPf79Cq8Xwe4vMWfGCF9/szbNkGjhhHTIiTKl7t+RhZrb7Ujq8HxgLlV70Q8+8wF7wDW
    EV4B/ciE5dO79FS9Qw1JZzAlKFtX17zMOh43xKrqWFl9lQkN2Hr/S9II6KdA
X-ME-Proxy: <xmx:ZfHhaj0EhgGzTyF7Yn2aM8yxgEvznp9jb4uYCCrDAFrBzhBBKtffzQ>
    <xmx:ZfHhahPXpaTkmiO79erz_RGECyWxQToXTev2-Z1GsHgjK-rat3m_Fg>
    <xmx:ZfHhao632dMkB5mr72t3RGVOIqHYAG96rb0k8K83Fe7lZGj6ltCV_g>
    <xmx:ZfHhaobOiMP2b_fAnFaGtdoPLkBX11hiSEE3wepMgYIb_qDVNDsK1A>
    <xmx:ZfHhauLIDQzXGC63U1sLUWFciB7G7jQvDGTpzAnQYCpAy_6B3FAkXMnk>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 08:58:12 -0400 (EDT)
Date: Wed, 28 Oct 2026 12:58:11 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <auHxIORufMbldrBr@thinkstation>
References: <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
 <auDkbDlgSZxqlk2G@thinkstation>
 <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
 <20261028080635.GD2668804@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028080635.GD2668804@noisy.programming.kicks-ass.net>

On Wed, Oct 28, 2026 at 09:06:35AM +0100, Peter Zijlstra wrote:
> On Wed, Oct 28, 2026 at 10:38:22AM +0800, Muchun Song wrote:
> > 
> > 
> > On 2026/10/28 01:51, Kiryl Shutsemau wrote:
> > > On Tue, Oct 27, 2026 at 10:03:54PM +0800, Muchun Song wrote:
> > > > Therefore, I am kind of leaning towards removing the RO protection
> > > > and restoring RW permissions to solve the race.
> > > Okay, what about this:
> > > 
> > >  From e23ab850837b53cc79d57d58f1cfb4266e745c3d Mon Sep 17 00:00:00 2001
> > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > Date: Tue, 27 Oct 2026 17:23:47 +0000
> > > Subject: [PATCH] mm/hugetlb_vmemmap: map the shared tail page writable
> > > 
> > > page_ref_add_unless_zero() reads the refcount and then updates it with
> > > a cmpxchg.  A lockless get, such as a page cache lookup or a PFN
> > > scanner, can read a non-zero refcount from a page that is then freed
> > > and reused as a hugetlb tail page.  If HVO remaps its struct page to
> > > the shared tail page in between, the cmpxchg writes to read-only
> > > vmemmap:
> > > 
> > >      CPU0 (lockless get)               CPU1
> > >      c = atomic_read(&page->_refcount)
> > >                                        page freed
> > >                                        page allocated as a hugetlb tail
> > >                                        HVO remaps the struct page RO
> > >      try_cmpxchg(&page->_refcount, &c, c + 1)
> > >        -> write fault on read-only vmemmap
> > > 
> > > The refcount is zero by then and the compare fails, but LOCK CMPXCHG on
> > > x86 writes anyway.  The kernel oopses when hugetlb pages are allocated
> > 
> > Is this an X86-specific issue? If not, I suggest a more generic
> > description.
> 
> AFAICT most architectures that implement single compare-and-swap
> instructions are affected, with the possible exception of s390.
> 
> That is, sparc, arm64-lse, riscv-Zacas, loonarch-amocas, openrisc (and
> ia64 for those people keeping the out-of-tree port alive) all require
> write protection to begin cmpxchg.
> 
> All the LL/SC architectures should be fine, they'll never get to the SC
> part.

Only architectures with HVO matter here: x86-64, riscv and loongarch.
arm64 has had it disabled since 060a2c92d1b6.

riscv and loongarch implement atomic_fetch_add_unless() with LL/SC only,
no CAS variant, so they see the zero at the load. That leaves x86.

I will make the commit message arch-agnostic anyway.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
