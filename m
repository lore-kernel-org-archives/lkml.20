Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973777;
	b=WsZqSQnoKGx60UxtndezasHtp+cIntQMxGRf12hIuCCAXZo4JD0WRrWJvoJ7mRlW7ByB
	 6dMSBhMCpLUrPQrkkBgIYn8g8GYOvXB+zkpf8G2xtiznF0WKQBF0X5U7Ksg6iPnOC5Z37
	 Lp10skSKWivni2NKcaTbmM3HB1X8gE4eaqAn7Ak54ocxSIACkY7tiNotu100ZIf3RjaIK
	 MZSrTPLa6Id0u6uSUuyjcihygjD+JYK6589/ZhvC0EwR1S63SKrnXeMsY3aF0tZCA58Wl
	 eXwexaswxhXZ3TPeZqFcu2Xj/eGG7yS+3S3Y2rD+osgg5CBF8esV6h8z0P2MjDc58Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=;
	b=iz/64FeUZ6SgVRUYscHHFW8mGCrnUC3u9W5D2O0QF2y2bgC/zHYziqt8gjg9GQ8/g76t
	 0G/rIIzv+whUWRzND5o4zrSguthz5IhrP6nMmH52GGhfSD9zwnCDxSPgcG8Kjdx1cE/Tt
	 wKZPSA3GF79cS5kMkwbv8sBPD3OxQCjDLSZAj8PNahFFtvGsbKUHPp4/MjHyUzl/dFhvs
	 EZKM1bnvNR32E/T20KM1Cy49W7Nq4ZzoWfY9LrvluxPYdXFo0GvmGcXsjI+vn6NeDjoQg
	 oDrwPTW7gYJ6VZo4ud/XBhBmbog3aTNZpu38U+7Ic+ICsEPYdoEtXsTyueZeUbw3Imw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ouzDy6FP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F97606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F97606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ouzDy6FP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso34875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793973776; x=1794578576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=;
        b=ouzDy6FPW3tNNwKJxvAodqJrvJ12cwoBT+TJGg1nDZT6yggqkMRLFPgjHUlcLfR34M
         gm8VcADPZyBtg1lzlJC843lqSIHUbPiTpGzt0qQUhtommV73GgEcprHoKuwwPqnZAMSH
         GWd30DzkCIT5VpXYJxpZYUsAVaf/nrX84B54FRRgLsUWl6JuVashRsUrlctLhi8P7kCD
         qZ8ydjF4PNHR4lVPNfiu7fBD0+xwp8Dn4WK5FvfUO28qwMKThcb8BovmGqbB5G2SKG3s
         53UgAflV0ew9CFOX968SP4cPj94GUKaqxkBSg9NEGI4K22wRfUJIml9CbtgK5FeYrT72
         fuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973776; x=1794578576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=;
        b=mj/fxy1ogZ5Al2mnFO3qQdurAztLLmyT128mjWpSTo6YbNo0j2HEtoiDvbXTNsBULI
         aBpeH7NImzop/AomKvXqF+3Jvv3TmpyOiD1x99hmM9GTYLLlA46SiAuGPHKR7OplWk2x
         BrGTmDNbOrfxbcwE+lyIfQT8hB3Eh5nFQaO+yfTcALFoWUtLzYeQSB5c/ZB8GDQAAfKW
         OWS0Y0W4HGSUgHvi+I3Uultt4x6ZZGUssUGRZbHciKF0oFqtSrB4/1nHu3fNfkkTHcdv
         XA0+35qGCFVaaSu7UysRBTvj1CohdmVxUxYz9XpndpX1qCnTJO6VlN4terHn1/x59xV0
         cBpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt6I/vIJtbbS5+37ULsvpI/dDSiiyHMHjBPHJjiE+podtNY3eRIGC3TuTrfIJTr7M8xGzzttiMR7tEhzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8cVEK/ZE0Oo1IT+iF0VhdN76qaaH/L+XxpWHCpVgwpwM5MEnq
	Vep+XibNoPAm/w0PabxGpnr7ZKuV37NLPbvclPYrspltJ72nyuCBnjWvxLmQG7ejyQ==
X-Gm-Gg: AYBFou0lV4AZMhJFn6nJe8ulvOboytkeg+CxYhN/uR8gSc5gnL3LZ9Uux3aY8K5aaKV
	xjWGaD+7Rr+iHkSGmztZaPensQ+y9J4YAUQ3Uw6+FYfKmCsZDcWUDlurh9TOATVSSc0rE7dKB+m
	bC+oKE9ltmjZlBWGkDIcu4kBVLD56ocmzsBIAhXzTW7E/sRr2NoxtyB5hkCOfiq/cZAaroAJS4M
	XMBKJ28nFh9DUoCuN4FARlnktLYbvcFkW7WfJ+yTAsfF0ko6LtPTm4QbbNWEG53usrU0jjjN7y5
	L8dvpFoUdNm74yg/cELG5AXDS5IzhbzrpBjWr4rcPDTmamJco2/qVTh6PhwfDYe9VMfPUQu+kHq
	aBcMNNDufJB4Mhg7lA5woBbU5RBSwkYy86Rbkc6jPDlgcyEuc1jr89zJZeUbnKdVeWrVav49np9
	RSLVmkXcSXba/Lssq2CpcBd8o56wpqMpGHtOGWEpn0x2hti8ABq5ktSw1ANYq2Tr2ikWQHKnw5A
	j/GERJ+8g4UodAwFilDGMm8yb3VpY9R2++VQrJsll6yru7xv7HluXdhwmR78VjTg4TlfneojeEg
	b8PY4dW80TmQIiuJzSyh+Rs/lslRex+AX9XFtFP95NFPrwU=
X-Received: by 2002:a05:600c:8a17:10b0:4aa:7270:60f with SMTP id 5b1f17b1804b1-4b743f9f46fmr464815e9.1.1793973775119;
        Fri, 06 Nov 2026 06:02:55 -0800 (PST)
Received: from google.com ([35.189.193.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609b1sm3724515f8f.8.2026.11.06.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:54 -0800 (PST)
Date: Fri, 6 Nov 2026 14:02:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: xuheng@cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
Message-ID: <au3eALuLVKZ1WXhp@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
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
In-Reply-To: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>

On Fri, Nov 06, 2026 at 11:31:57AM +0000, Fuad Tabba wrote:
> Hi Xuheng,
> 
> On Thu, 05 Nov 2026 22:59:48 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> > hyp_early_alloc_contig() and hyp_pool_init() both take a page count as
> > an unsigned int and compute the size in bytes as nr_pages << PAGE_SHIFT
> > in 32 bits.  For 4 GiB or more (nr_pages >= 2^20 with 4 KiB pages) the
> > shift overflows.
> 
> Mostafa (Cc'd) posted a fix for the same truncation in July [1],
> widening the parameters to unsigned long instead. Would you be OK
> picking up his patch for v3, keeping him as the author and your
> description and tags?
> 

I was preparing v3 anyway, I can post it today.

Thanks,
Mostafa

> > Two of the regions that pKVM carves out at boot are sized from the
> > amount of memory: hyp_s1_pgtable_pages() for the hyp page tables (hpool)
> > and host_s2_pgtable_pages() for the host stage-2 pool both provision
> > page-granular tables for all of memory, about one page per 2 MiB of
> > RAM, so they reach 4 GiB on a machine with about 2 TiB of RAM.  Arm
> > systems of that size exist, for example AWS Graviton4 x8g.metal-48xl
> > instances (3 TiB) and Ampere Altra Max servers (up to 4 TiB per
> > socket).
> 
> Could you also list the hyp vmemmap here? It's sized the same way and
> overflows at 2 TiB too.
> 
> > On such a machine, divide_memory_pool() gets a truncated hyp page-table
> > region from hyp_early_alloc_contig(), so the host stage-2 region and the
> > FF-A proxy pages that follow it start inside the range that hpool will
> > own.  hyp_pool_init() then attaches all nr_pages pages of each pool to
> > its free lists, so hpool and host_s2_pool share pages and the same page
> > can be handed out twice, for example as a hyp stage-1 table and as a
> > host stage-2 table.  hyp_pool_init() also derives range_end and
> > max_order from the truncated size, so most of each pool is treated as
> > external order-0 pages; on a host whose IPA size makes the host stage-2
> > PGD a multi-page allocation (for example a 42-bit PARange), that
> > allocation fails and host_s2_zalloc_pages_exact() uses the NULL result.
> 
> Could you describe here what actually happens? I think pKVM init fails
> before any page is handed out twice. Just below 2 TiB, hyp_pool_init()
> for host_s2_pool hits the BUG_ON() in hyp_set_page_refcounted() on
> hpool's page-table pages, and from 2 TiB up hyp_back_vmemmap() zeroes
> the new hyp page tables while they're being built.
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260715150125.2798116-1-smostafa@google.com/
