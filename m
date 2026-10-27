Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133572;
	b=nlX3/EtxLRU4pTfcdav6TO68PARUK3Ojn78R28nafzHhjPHS3i6xjl9Jhq7Du9A766ZX
	 2KVPDhEuhyGh+q7V1QozrQ4yBTvgiHSdK1Vn0B1bau6UyzDP5XrvUI5U10AZazb2fF2YI
	 7RtJcv7MBzMDCaXI/7f0DmshOPUgAo11fnHSWfGFdukL/TPfU4UdPsDBcgST848I0ZXJ3
	 FUmLDBAXo8ktqbMZvDaeDk1ptljLTSobIqv5Y/RoyQvJIfA4ds7ushEbk+yzy9nzeiOfW
	 tEGNWvtp97XyV4Oh2DoEUK3PmXJw+F3SVoZsetkjAhNNs1k2/KKIx//pKlPUg0f5E8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133572;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
	b=TMq11zSYjtdtBdSAIlgmHxhomWzQBAouXfebwfL0mwbscD0e4A2VDJb+7keeNvaEtKRu
	 XSTi9eDydcdqaXis6fanrX2E7O/XLJ2GCzXtxmgePtq70K6Lmj4EKcCAkozjnjkv9lPx1
	 Bk58p1CEvgslqmz2xGNWSA1PHHtVaS2YQb0mjGgb3HpIFLP4eF/QD/RPcmKfIs+JJeUFw
	 ccFis770xLTXH+AbYPSYJl1w3w1mOPPXuOnx7q56Iki4R2uXcm7F5ZnhEVgacTwmN1noZ
	 vxpRiam/65Mf9iVtBHXfyFAKQJwdq4GJO+KQmM0/bJfgqv6xs/6uaXH5e3WInwxtIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=akK1+Pw6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Yud68Rxl;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49254606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49254606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=akK1+Pw6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Yud68Rxl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793133571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
	b=akK1+Pw6QAhpkcxtlACExkkdPBQa023n24AZ7US++Mz705Iu3vo+9YZJZPKDWtQNE98RpT
	4mhHalLOuPoBzFxX0fsOK0RJr1ZFmQmYctf9yuxGMPltIChuWxw0KoapX9NRCDVqsSkpe/
	B+g+McnWvhefWkzsq9iounxCS9miPkw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-DSUT5Za0MpeINgBBySNapg-1; Tue, 27 Oct 2026 16:39:29 -0400
X-MC-Unique: DSUT5Za0MpeINgBBySNapg-1
X-Mimecast-MFC-AGG-ID: DSUT5Za0MpeINgBBySNapg_1793133569
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48afcecb035so75039f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793133569; x=1793738369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
        b=Yud68RxltWRXbksRawyGLsb9m5yTw4huJO/PzLPdrZpZctGkEvhppeJwqJ1JGyIm2Y
         8Zkx48VRjl7Q1u2T6tsOshUrqQdMMtvOGB4Val+ifVU1cOckruygN4ufvG167mQzDrke
         O/sy/P3XZBT8Dnhtri/JXdmEDPuucApXrpaDPhRZCf854Yie7+wdS48Z5/S0uyJDKcxW
         0MG00dCFI/HI5RNTGpubqNEhxNj/fJWw68UHmZEeu9ybIjU8U1ACH7lSC2NoetKvZdvG
         pNYa4LXIZlklsE7YxLzOl+d+3Rm047m45KLnZnxn9WfYe4f9FAeIpOqkp80iXke3MKYD
         Iz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133569; x=1793738369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
        b=K7pMAn7huhSmkGgeJQ6CAM7LiakVKIpSGGYpZlMhlLltdfCG6tS+iYJriUO1jzBZ7d
         SyEKBETDgxXRs/A/x+oTC4aW2VYTmIf1yg84V4aDobHIPEwMvFrT9USZPf/71QD1Q3iH
         wAgA9Si0UWMTKSDmL5uvy0HLyvsEsrpLSsU70hC7huNp82uSQC6oI7r2RGPNnHg2s0ly
         wh1sA4eUebqEQ4Xxn2e1aKx1PgNwvxEcP68wZxgdyWetavPmWRapXAu5SSRTkA0Gv/Sf
         5C34vZe1MuAfdvH26PfhW1o+9y0whOUAsI1AQn7m+FFbcJNyNGMdBB9pfNHzB5ph8QLk
         im1w==
X-Forwarded-Encrypted: i=1; AKwUvBwL+Duo1NZ8hvkjtBe3HzIT3ZkvWEM586wcWaEUVbZM/7W5euaeJTi6pQQKWLelF6A618aHXPQsHeTGY0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7HvEOMNErMTg7IxmJGTqgL1dWNpz9TiTEXfFU/HvHyjWedEeI
	bnV9FS7mKGvL5pzcG65kercldIgnbRr+uYd6vAxKu+RZ3ffukbdduOIrljmeQofgzT+1gNvuKzq
	F/JUlbzvJut3Oj+AKsEEOiJJeQPr4LcBrdOhCwElTJoW6a/YRISOWh9Pu1ZY50yOrBw==
X-Gm-Gg: AYBFou3c11jlPp0ckAE0dJyrGThDqXMFok1UFuZHv06rAWWHpNlpP7sP2qubVdXTt+b
	fokGe3aaSki9bswagTEnSElWDXX8YbVoUimfpQe+x0SXU9acISwec9EJkFN6aKhEXg4RTi1wfFB
	1SFWMs5OrV4GsyPcLvCBy7O/Lkbjr7bbnliC7jq80bMrI+4uGgq6PbB7erufTSOdj5z+nhFbghX
	Ui4Tj2L+VhiRlUrf3CpJQLDWkxkL55cy8EctmnkjByP86WYwZRDsdkxHY6D/Nin7Fu9nTEVqW/B
	BO8kRmCNJcWOUdgpcOHY9NcazIu7G2de3azwrSuDS3Kabdtgu0JcV/1ub/nTk32ANMI=
X-Received: by 2002:a05:6000:60f:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e5d28705fmr1693112f8f.1.1793133568610;
        Tue, 27 Oct 2026 13:39:28 -0700 (PDT)
X-Received: by 2002:a05:6000:60f:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e5d28705fmr1693005f8f.1.1793133567964;
        Tue, 27 Oct 2026 13:39:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm24553225f8f.53.2026.10.27.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:39:24 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:39:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	virtualization@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sidharth Telang <sidtelang@google.com>,
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Jacky Li <jackyli@google.com>,
	Steve Rutherford <srutherford@google.com>,
	David Skidmore <davidskidmore@google.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
Message-ID: <20261027163814-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027051245-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <20261027051245-mutt-send-email-mst@kernel.org>

On Tue, Oct 27, 2026 at 06:29:35AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> > This series enables virtio-balloon free page reporting and memory balloon
> > inflation/deflation in Confidential Computing (CoCo) guests, starting
> > with architectural hooks implemented for AMD SEV variants, in order to
> > support dynamic CoCo guest resizing.
> > 
> > Today, memory ballooning and free page reporting are essentially unusable
> > in CoCo guests due to three main roadblocks:
> 
> 
> For me, the bigger question is not whether we can, but whether we
> should. Considerations I would like to see addressed:
> 
> Security, e.g.: does knowing which memory is free leak information from
> the guest? If no, why not?
> Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.
> 
> correctness, e.g.:  Linux has init on free (and default on windows), if
> initialized pages are dropped and host can not be trusted, they have to be
> re-initialized. Is this handled? I don't see it in code.
> 
> Also, performance, e.g.: How much does this re-initialization cost?
> 
> Management: it was simple with balloon off unconditionally.
> Now we are in murkier waters with various features offering
> various performance/security tradeoffs.
> What if some guests want the tradeoffs but others don't?
> 
> Documentation: for all of the above.
> 
> -- 
> MST

And to give this a bit more perspective, I present:

commit ab676b7d6fbf4b294bf198fb27ade5b0e865c7ce
Author: Kiryl Shutsemau <kas@kernel.org>
Date:   Mon Mar 9 23:11:12 2015 +0200

    pagemap: do not leak physical addresses to non-privileged userspace
    
    As pointed by recent post[1] on exploiting DRAM physical imperfection,
    /proc/PID/pagemap exposes sensitive information which can be used to do
    attacks.
    
    This disallows anybody without CAP_SYS_ADMIN to read the pagemap.
    
    [1] http://googleprojectzero.blogspot.com/2015/03/exploiting-dram-rowhammer-bug-to-gain.html
    
    [ Eventually we might want to do anything more finegrained, but for now
      this is the simple model.   - Linus ]
    
    Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
    Acked-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
    Acked-by: Andy Lutomirski <luto@amacapital.net>
    Cc: Pavel Emelyanov <xemul@parallels.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Mark Seaborn <mseaborn@chromium.org>
    Cc: stable@vger.kernel.org
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


Leaking phys addresses to unpriveleged entities might not be wise.

-- 
MST

