Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750777;
	b=5fgTxxIbuGi49SJ045JpporIVasOvDOW2loJTM5hqcRLK4sQW4Cr3Jb469rSz2t0Mq8m
	 MGEMW/tNsDEixMkeD/mi6dAZYxsmiPBxU4QvVTML2NyCcnFXwv+s0iU9PSxEAgNeWKYnZ
	 G80q3itfoA9nDhD+Gxs04GxSE9CbIme1Og7c399EtwhV1Lx/zdoSiS/H7f9VWeX4hj7dd
	 57ahu2ucgK+GxqGCevleU8bZ3/shPcuO2u/hMsnd+KNTz+BU91iFkg9cyoNAb07BqQqGU
	 ubkoZq5+pBvHpwXlxrSGCzPeHP8qbo9VvRUvvamFTQ0ofJhQgLy5tXpELaUDcPF1ltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hHhEEc/sBWWxiX9+vWgeE8ZIOMWEybVXcv9STTAAgxA=;
	b=MSLjxrZzf9cbCDQ50nv1vWysTzaVtrdJBiUtSwYkMBlRVfezX+UU6pSGq87vi77vXGxg
	 ZD5bEbpPuMSZT0fDPqSjf1COesJmd6MbrO7xZfQas/GVX6XdG6auW80CKn87LPo8BsBPy
	 Bq30/lv6RWT/G51iHaHAfGxcAvVSjFJTGyia2e8LGXnBTTfgpN/jLc1w6shrstNVsabzI
	 iQA1BWIGZ32KZ6VmIF4jt14H3rRyKsTRk+s5iELG1HSn9BGjLnpufdWSfa37mnPZdLQ7C
	 SRA3peWa7f9uvkb1F3OTuZkza7vmFop6IVp5nVzh/TDU3tJ9SoT9zZTpbzJqH939yXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UO/BgHf6";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C9E606A335
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C9E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UO/BgHf6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso3666485e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750774; x=1795355574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHhEEc/sBWWxiX9+vWgeE8ZIOMWEybVXcv9STTAAgxA=;
        b=UO/BgHf6rwtnvv8TwI7GccJsD3RHgclLiG6O4tAcmXJrdr44K+zEEm9kynEwD8Ar3+
         I3wGs37VUTg/+YppqQF3czvCkeS4becUC42xez5QxD+e2VcSMJgvACFe0zjvFHlq9bVg
         NmJZQELA9PxbJIvBLVGbk2uVvIQAeAwzB4bXmXr2KmHOCQCFmZ85xRWliE4x4TAc/OKR
         b913wUgrKT0K2xGejCAMaG2dgaH+f7JSI8fPccIRKcTJpQq1HSNCmabjCSZfHH+9yd6F
         AEOsyRHrmW+rfnhH8APuCzDPmqXIuBBATPbNvytVcFZarvwNVwiqsreY9AZLWCOJ9HhF
         QkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750774; x=1795355574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHhEEc/sBWWxiX9+vWgeE8ZIOMWEybVXcv9STTAAgxA=;
        b=IbIibVtAQZjzZC8jh7l8XKwDLyK4sHfsyq4sZUumatj4+ZcpoJyarrrXQnDAJkORLD
         uVBfVcxeKQNJi66ZWFbv6NqYVXAc8VZ++JJhCOUKe/fCiUc9q4cegnk8+JaTo1UF3CAy
         cvV8ib2Z2C5/RRyS2M9o4X9ozdBusl5AxR9jluYBevvQUJKWLqRsYGyVqmPm7KNYBdhY
         YVO+BZKmoUrZvyXiU7YJW1XTLwyUIzDPagNriABe2r0C3HKTkpuZecx8tGGv6ULNMSaO
         zzHDc41v/YIsVVb92Ky5cT54IkWieTYNjadNf5KyWPhfbZJw14by0AMSWlifjv/64dKq
         mdqw==
X-Forwarded-Encrypted: i=1; AL+hErHnSz6UH3PtDwOtsHhU8yNQMsuluNaQ+a6cCjMK/Kmvc5Aws/XkKaGD0ekIKTX4GfmtNzaPQvTN4JdV4m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KSYhjXUiaNmVJ3U52QRU/1qCqSLZKxFblzSdPFrBxhovZxpL9
	MbS6NlVGdLB5OlWpgXnMTOiU6aXfruYEzQ+h02MYeHWv0nhn2EdzYuKM
X-Gm-Gg: AYBFou1X5K0qwBlFg8upmdphtfWZ1t7ZM0+cJb9krxMt1zQWMtcqmBCy9fj91l0BVHt
	+K/AVxa9ufayzKkwLgfYfmDQbs+TI/w7oqvRlw5oVzUR/WkQGi0weoakNmuH55wlhtGXOwayF71
	7cdp4SjDHZttnvBs6IxF6NKLROzUUFyuenGPhBxeYghgLoUpRc2xP6mgv6+S+JuOq7HIl/hBZXn
	8IZkWHZRo6YyCPgSglZJJL/JSr4I64KirnsxeXIRFuMDsnm7L6Z0bejtd94IRP4CcFmHrUGXo+b
	7k4qTdRQ9SeJyPYrDHMSZVoE/v9to/Wgxhtb4amPTtLHYibRuFw+rdi07RIF+fuIhDUIGajT/Jq
	3ZPmEaCSWG1g6cYdKYJ1wZ148gmbGaVCArYBhXoYllh6PnxiHU+zivWVNo6nyI3/2/UV96Qi+97
	jH3cUwQR9l8fMA5WIYPQb4oz7UJbXulW5+qLh6e9UQUyceS1IN2YYOycw6UxUJz4H+yq0+q4kcU
	WpbBmfmpcg1rkVjecl0GDoBTXR/IYjcCYfOJDVP0QfL/8jKEGyAM3lyZMRTHjAGHE5WLiifDFar
	+Lb3+nGSpdwtmueLspW+UXm2JgW8vOiJozS9a4dbiQqKMm0xgJUNEmU0hbR5vL0J
X-Received: by 2002:a05:600c:3495:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb6848d5bemr63685725e9.26.1794750773556;
        Sun, 15 Nov 2026 05:52:53 -0800 (PST)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm16845848f8f.58.2026.11.15.05.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:52:52 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C15B2DC048B; Sun, 15 Nov 2026 14:52:51 +0100 (CET)
Date: Sun, 15 Nov 2026 14:52:51 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] x86/mm/pat: don't warn about W^X violations before
 mark_rodata_ro()
Message-ID: <avm5M41etA_85FbA@eldamar.lan>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-5-791adb8d6670@kernel.org>
 <avYzmyX5eR814o5L@eldamar.lan>
 <avlQSfsHJoU6_BwY@kernel.org>
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
In-Reply-To: <avlQSfsHJoU6_BwY@kernel.org>

Hi Mike,

On Sun, Nov 15, 2026 at 08:25:13AM +0200, Mike Rapoport wrote:
> Hi Salvatore,
> 
> On Thu, Nov 12, 2026 at 10:46:03PM +0100, Salvatore Bonaccorso wrote:
> > Hi Mike,
> > 
> > On Thu, Nov 12, 2026 at 06:31:10PM +0200, Mike Rapoport (Microsoft) wrote:
> > > The kernel text is mapped RWX until mark_rodata_ro(), so W^X violations
> > > that verify_rwx() detects before that can be false positives.
> > > 
> > > CHECK_WX is enabled by default with STRICT_KERNEL_RWX and it reports
> > > mappings that remain W+X after mark_rodata_ro().
> > > 
> > > Drop the warning about W^X violations before mark_rodata_ro().
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  arch/x86/mm/pat/set_memory.c | 18 ++++++------------
> > >  1 file changed, 6 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > > index a1bea16a3c3bb..a674433850dc9 100644
> > > --- a/arch/x86/mm/pat/set_memory.c
> > > +++ b/arch/x86/mm/pat/set_memory.c
> > > @@ -718,21 +718,15 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
> > >  	if (!rw || nx)
> > >  		return new;
> > >  
> > > -	end = start + npg * PAGE_SIZE - 1;
> > > -
> > >  	/*
> > > -	 * If the kernel text is still RWX, gently complain, this could be a
> > > -	 * false positive.
> > > -	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
> > > -	 * the warning can be removed completely.
> > > +	 * The kernel text is RWX until mark_rodata_ro() and the entire kernel
> > > +	 * page table is verified after the text is protected, so there is no
> > > +	 * need to warn.
> > >  	 */
> > > -	if (!kernel_set_to_readonly) {
> > > -		pr_warn_once("CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> > > -		  (unsigned long long)pgprot_val(old),
> > > -		  (unsigned long long)pgprot_val(new),
> > > -		  start, end, pfn);
> > > +	if (!kernel_set_to_readonly)
> > >  		return new;
> > > -	}
> > > +
> > > +	end = start + npg * PAGE_SIZE - 1;
> > >  
> > >  	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> > >  		  (unsigned long long)pgprot_val(old),
> > > 
> > > -- 
> > > 2.53.0
> > 
> > Does this need to carry a 
> > 
> > Fixes: ea6fd393cb9e ("x86/mm/pat: Use pr_warn() for early W^X warnings")
> 
> No, that commit actually relaxes how W^X violations are reported during
> early boot.
> 
> And this patch removes the warning only because there is an earlier commit
> that forces the check of W^X consistency that was optional previously.

yes, please take my apologies for the noise here (you have already
probably quite too much).

Regards,
Salvatore
