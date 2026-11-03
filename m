Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742874;
	b=wBWDODV/TMPxf7MbYosGiKQT9t3UZELRyDLw84teGWHfJDqqf6BGnoammtpJDIKZJM6c
	 4305ph2UBYxQ/VrYDOnXrEzGi8NkDGctafn1tPh17tcpXWI/eq0M+jPlG/YzZz7u097Q6
	 mcyfG8xN983WZqxsF0a6+Kv9Xqc8epj+JTqnrrDwtokzsUk5Dga3oTZz22ipmD7nK2Eke
	 2iQeg08wkqoN34Es4OLH1iU2jczsKBNZswLjej9J4fQEXRsdn4M/h/WfmKZn6GWSjuaQM
	 NfpJTNvb9A89foZc+IV2ydb2WxJ6J3Q2S5tzxMnvDkiLsWVIHs8zFbx3DxXSWbxL65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742874;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pNIYfgovfeYUTnUWQVAULaUQM12WfGegAeKvV0ijU6k=;
	b=kin8U4JDoY+cJuUgukAzHfp6sQadJkxorZmcwuwTzrzqO2SvMQiM/mDuGzcM72A5ssFg
	 L0qNw6qeCAE0IfwTuT4rgHP/gzuCBF8XppV77vt3rHgKsI7NKmllkKudal8vnRQ4n9ta0
	 yexnetlXrNCfpay+kmZ7v5QxiNyN9WR0g+2ABkRN2JRVKnjo4lP0cxv13v+rscINl6+Xl
	 IDnnG5mR5sCiGqbjAMHbHEFKmym88F8K9yDiulbE3f9RYRF4vbOIjdG3m5JgHx4nqNIPC
	 scEZNTq/TwqsFRNMM+rKBxrPlI019fFN00nZ+hPpkBBs+oP9bu7FhpuyAnD3N0v6Mcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="jfGbh/HO";
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B6606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfGbh/HO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lzvO4MZjJaBVQmlohMoJ2wbpUm50n891PebbguUdryA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793742870; v=1; x=1794347670;
 b=jfGbh/HOsOxsUSry2IPwFxi6NWyrWkFH+e42+sVp/RFdXSh06V1SmbSthalzB3AIH8ca9D66
 vF9TykAblu8zQ2IAx8XCnn3bFD/jvEMWy2QIL/pPdATwExO3oGsf314SYjMFfA4ha1s0Ml1Lo0L
 srd6w/fYsWxBAeHqu3MyTPE4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 608ed53c19633f31;
	Tue, 03 Nov 2026 21:54:30 +0000
X-Mizu-Trace-ID: 608ed53c19633f31
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Zi Yan" <ziy@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	"Baoquan He" <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	"Nico Pache" <nico.pache@linux.dev>,
	"Liam R.Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	"Vlastimil Babka" <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	"Thomas Gleixner" <tglx@kernel.org>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: Re: [PATCH v8 07/30] x86: mm: add PMD swap-exclusive helpers
Date: Tue,  3 Nov 2026 13:54:22 -0800
Message-ID: <20261103215423.104469-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLX6HZQ71WVN.1AIA7V63XWARY@nvidia.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 16:14:52 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> > Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
> > swap round-trip, which makes PG_anon_exclusive have to survive in a swap
> > PMD and not just in a swap PTE.
> >
> > x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reuse
> > _PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
> > for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
> > not select ARCH_HAS_PMD_SOFTLEAVES; assert that, because an exclusive swap
> > PMD would otherwise be pmd_present().
> >
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: x86@kernel.org
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > ---
> >  arch/x86/include/asm/pgtable.h | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> > index d551120a7c889..c35dfa6ceda05 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -1525,6 +1525,26 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> >  	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
> >  }
> >  
> > +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
> > +/* 32-bit aliases this to _PAGE_PSE, making an exclusive swap PMD present. */
> 
> Is it better to say? Since the above comment sounds like 32-bit
> specific, but the actual constraint is about not being _PAGE_PSE.
> 
> _PAGE_SWP_EXCLUSIVE cannot be _PAGE_PSE, otherwise making an exclusive
> swap PMD present.

Updated the comment to:

/*
 * _PAGE_SWP_EXCLUSIVE must not alias _PAGE_PSE, which would make an
 * exclusive swap PMD present.
 */

which I think is clearer.

> 
> > +static_assert(_PAGE_SWP_EXCLUSIVE != _PAGE_PSE);
> > +
> > +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
> > +{
> > +	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> > +}
> > +
> > +static inline bool pmd_swp_exclusive(pmd_t pmd)
> > +{
> > +	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
> > +}
> > +
> > +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
> > +{
> > +	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >  static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> >  {
> 
> Otherwise, LGTM.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks for the review! And apologies for the late reply, I was away.

> 
> 
> -- 
> Best Regards,
> Yan, Zi
> 
> 
