Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118381;
	b=p+bl6mZMWQ5Mvhkla9qh/g5MZG4QWbbx9tLZVTsWQvWq3in/qdFXqca0OZDIpuCLOalq
	 lAdaVOGJfmfFIzXSlk+ZCR9wOx3dP62B3D9kKWuaMmvYGiBSHpmI6l/ZZj/50dn05EKCu
	 HSVqlbaWPA8aZ7lyRDDBJn21qS2h8ROKLhOhEDfy0wN/WCKaaK5QSfzCJTSpAbxUy5hiF
	 g9zORNtAS2MLDnUHPepRLWG8qlnqvDPSFsJzXDJguslvMTeE+oexo+vRE25Lt60mSO1gp
	 RPqmaKCzEDtZR47wqpfxE8AOEPHJIs+aqo/Sh8mv/hT1U/5ll46EJFw5Yrqv+yQL6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118381;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=NjIT+Y8vfORvnq9qKmO1xyntIIZgTvvQEK9PX3hmE6Y=;
	b=Jemcd5DPau73INS1EIo2mQeBcojaq2qY/hbsy4g4Tn08XpxN4oSroqi1WCUQqKl2kIrR
	 40GB5pKf1og6TVqfT/G2MFKHb0OTAuHxmnkyRY2qIKcuwXgDFEtDgjTs2x6hS9Wj192L5
	 OzZsi2Ep3p3jlhI/Vse2b+DfFRdOTWFBpgLglEDaNfRoQunac83NTd/YG2+eH5p6VzJMH
	 Bre4e9vDIyfoxDX+YIIsVQctaU/dvQB58wUAJqF+k4t0M9xg1nHMv+2Re5EIILowElDrf
	 4MZuPQaz+5ulFGmA2dTlVEfuPYHGlOwfnc8Sx3++/rYbLNUq86xjjM2MVDFltMDoNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="K/2TL006";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B606606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B606606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K/2TL006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NjIT+Y8vfORvnq9qKmO1xyntIIZgTvvQEK9PX3hmE6Y=; b=K/2TL006XRR+xLAfRk2O4h7Z5j
	no56DdkP8y7FywUFMSjsf4Ki39x1AoXhMmjakT8sjHA/0Pa3B7+TSChcg033H+Z8IKe90smfcvj1f
	WCHz5ZrWejAH8wDBp+CT9p0ZC2lNOS+ufoFFPKQNF1L4c+kMo6DgNAwEE2Bj48rYfBzKjDtk/kVFU
	l7RQ7hZRJCuDrSp4vsIx7ShlSGqU0WpYBokrGAw6L3jMj840z6NzTfe4GfzAuO6HXhDMnHnoqVXmH
	e25aP3YWVLrCGYTLThrB9DkFEhIhgevdANNkpHxb6kBZ10XxtKWwoFiUKQTGbltqL+HbPKspgpFxY
	q2yKA8IQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk07-0000000FDxk-12XZ;
	Tue, 27 Oct 2026 16:26:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 47A8E3014C0; Tue, 27 Oct 2026 17:26:14 +0100 (CET)
Date: Tue, 27 Oct 2026 17:26:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: vrilutza@gmail.com, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Borislav Petkov <bp@suse.de>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] x86/kmsan: Fix CPU entry area metadata lookup
Message-ID: <20261027162614.GB1779021@noisy.programming.kicks-ass.net>
References: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com>
 <20261006-kmsan-serie-v1-1-07fa860ef3de@gmail.com>
 <CAG_fn=X=edvfVtq35i7baEKems+ahRb87LY66xLwGLvW9BLZdg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=X=edvfVtq35i7baEKems+ahRb87LY66xLwGLvW9BLZdg@mail.gmail.com>

On Tue, Oct 27, 2026 at 04:28:36PM +0100, Alexander Potapenko wrote:
> On Tue, Oct 6, 2026 at 8:10 PM Viorel Cernateanu via B4 Relay
> <devnull+vrilutza.gmail.com@kernel.org> wrote:
> >
> > From: Viorel Cernateanu <vrilutza@gmail.com>
> >
> > arch_kmsan_get_meta_or_null() works out which CPU owns an address in the
> > CPU entry area as (addr - CPU_ENTRY_AREA_BASE) / CPU_ENTRY_AREA_SIZE.
> > That is wrong in two ways:
> >
> >  - With KASLR, init_cea_offsets() puts each CPU's area in a random slot,
> >    so the result is a slot number, usually far above NR_CPUS, and
> >    get_cpu_entry_area() reads past the end of __per_cpu_offset[].
> 
> Thanks for noticing this!
> I find the O(n) lookup per each memory access to the cpu_entry_area
> excessive. Could we disable the randomization in
> arch/x86/mm/cpu_entry_area.c
> 
>         if (!kaslr_enabled() || IS_ENABLED(CONFIG_KMSAN)) {
>                 for_each_possible_cpu(i)
>                         per_cpu(_cea_offset, i) = i;
>                 return;
>         }
> 
> (there's a similar precedent for KASAN in arch/x86/include/asm/setup.h already)
> 
> Peter, what do you think?

I suppose that works; KMSAN is a debug kernel per definition and I don't
think we really care all that much about kaslr on debug kernels (I
certainly have it disabled on all my dev boxes because its a pain).
