Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517312;
	b=NS3jgtN0Fzo3A6xVKDCqGAATGtZsmL1uXRXF9X/NYR+S04538C7kQpBiiq/iLz1MQfXw
	 aIJFZbzYLiFjxURwPz4i/a+bF6EeWahhc+IbgOXqvBVqTDCUx8pEpvXuzEbPY85Ol/jFC
	 4ED5FI1RDIxuKMepwhQ9bdJAzgMC2A1K+oRpYf4V2xHNWLXTsQiEIUKy5sdDRLe0/Cabq
	 sB86+Jnmb8Zhbj/YG7QUYak1y/+P3KCBabr0cwbZmVAzbUV/WwPjDPDmUGhypH4eUthl3
	 m/47Ok5bUDdYD0Rb7zeTGGRKChOE6jk/FOovizjoO5utcVJf6gatMmsVN+kOMe/QBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=xd2xn7InKp+SrI7s/BHBhFnK8Dcvi3AeSU04cbSblZ4=;
	b=ja/JNhpCTWsCAGWlffZ007/cRW41GSZte8mNQl/a0pM1tOWQt6S0uZZDOl2P6SzuC8WT
	 tmMk2R9GAJWlhSJaaZNGDjIr16k63Mxy4c3kJAMgycVS1PGXEeB4GopdaA8YP2ZNpzDqQ
	 hdL0B4+ewwKJ/bZgnjvxP52iAW+aLWl69+XY/GxvgrzM8dxx1gKWG2OIhHVPiv/vighin
	 d0bIYEuN57f4uxzGJal0myZ7cTyHKN6n6tgPhDXJly/Z8P5LENUowvCKJGTVstl9T7tes
	 2D9xdf+eSXHkltcH/b5YFwwdAsU6fV+uzh1h1H/b3356tfBUPSN8wlgGZK36inhGl8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=VqsPYUNx;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A70606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=VqsPYUNx
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91befbcad6dso44177176d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792517310; x=1793122110; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xd2xn7InKp+SrI7s/BHBhFnK8Dcvi3AeSU04cbSblZ4=;
        b=VqsPYUNxILRhN2J6f0RkpSt9C41C0GtOBBGNy9lUh30TaoJ8cFmYnc4f7MV8RhbUEg
         fjNikbxz7aba+FIbwa+l7rnSgJNEIiL6EIH59BHD65xXEDP+2saS2bc/9Kppla7eH2QR
         LeqYrpotYAE/qFJMi7bLoTf/UX9YXThgcevkEAuelTTxdmRTq0ylvTmIYshex3BgAOXZ
         O1Dxkk4PBQOqS4SeRTBfT6EAuuYeQ/sJpJ0rmoC4hRvvBQhon0LNYlzYQNSTZYSlI3bI
         T5lLrq0bUcbca3AocUjYu1NJMofNMnrRn1vt6GVLPEQWt2HlcUHgUcWiEif/EQZhl4cL
         VR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517310; x=1793122110;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xd2xn7InKp+SrI7s/BHBhFnK8Dcvi3AeSU04cbSblZ4=;
        b=K5m3hwQyHpm60kmeEjdreTeScmBCsIUAnaImNG96/8KRRGFfin2Wvp129C4vEWbv5J
         vSahrZ8cz7/SZcMsLNzUyrJ7du0t+9wrSP9VWT7m47dcDeEeANaCrl7epz4Y1VXeUa+f
         jtip646PwxATFYkadiEKwzZBwhu822mYv0WUrp3L2/VtiHLedFTwfRP/ZsDgLxGOGueP
         qmCuJonxjJzSbISM46bR94260VCbd2yQCZHsthQZeuWWDUj2sb25GLUndiI36J8WsXEw
         fcEsG2MbNHT8GRMkg38FhGgzuGMkiCTv/ErmBAxfs3JqfNBvqofjgeO9mTyYFST01BwV
         wSyw==
X-Forwarded-Encrypted: i=1; AKwUvBz2bXfDAi1NTiNZQKfTv2XeZ2DZPozgYn8R685pao+POsllJ/DCrXhJ+D9PcwmIeaY+7dxN08KJ5AwNYOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG4+J93zWH+JU0mO8UP7XvJJpWaGaT2gnl9HCtcXn01L5eSTZd
	lpNVAqh1OivamFvNedkpxowezuetIFOaR5hoakbi+/ab96mRnbZtGE177LledhJC9fI=
X-Gm-Gg: AYBFou2UfMoC6Y64yyk2Hj+/PvkvWZg3T+hF4Mqo7tWVJhUDbWWvesELvj1ZWLIqPmx
	+9qnFlkVx24HW+WWIcoEWZTiZV/0mi9F4bGCMvXh4PtzbyZhme1E9fHtVvBToPKtx+dxiwwHatV
	ucbwV9Izce3WZt4xoK147P4g+4qQbxW9Ollf4aZW7RfqsFwzzYa4uWESoE6d5SyftSYZfy+MDyG
	tikhEASHIl7Ai+Lork/hr2o5Eo1awILxLi4UchzHGpo30Qd45hEQnjipdenk74Q4lZ2DR5aV0MY
	TR7DzaSTTvmLQWO1yFOHELnMwGmaePKUz1AqHy4Su/WhqjyaMMSpjlRqtH2SQqw6VldnnM0/QTt
	di7s+zMkG1900bAwcajOF3oTRuYCiV1fe4b8Ryfuf/s8cd72mS1hvLdFkeYVd7UA6WCeHCH2k1f
	F5lKgJuuA40wWdd6mp0LERl2hRRGx08p8r0BLHFH4LpyX8ihDYXAuy3NAXbSccbCRkKiA6yc27h
	yokwCGSlLt8QrLsfFzX/AXz6S6Bif7OkVvA+1LN51h0Wu3hJKbiwSB8
X-Received: by 2002:a05:620a:44c3:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93f29df45b9mr1944842885a.75.1792517310522;
        Tue, 20 Oct 2026 10:28:30 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b72cfdsm3288526d6.12.2026.10.20.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:28:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/vma: avoid broken uffd merge on mremap
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Peter Xu <peterx@redhat.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261020-uffd-remap-fix-v1-1-0f34fc181f0a@kernel.org>
References: <20261020-uffd-remap-fix-v1-1-0f34fc181f0a@kernel.org>
Date: Tue, 20 Oct 2026 13:27:36 -0400
Message-Id: <179251725685.2936366.12518786742522387392.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 15:55 +0100, Lorenzo Stoakes (ARM) wrote:
> Userfaultfd often causes unexpected interactions within mm, and does so at
> the intersection of uffd, mremap() and VMA merging.
> 
> When an mremap of a VMA occurs, copy_vma_and_data() calls
> mremap_userfaultfd_prep() to notify uffd of this.
> 
> However, mremap_userfaultfd_prep() simply drops the UFFD context for the
> VMA if the user did not register it for remap, i.e. didn't specify the
> UFFD_FEATURE_EVENT_REMAP flag.
> 
> This is OK for the VMA itself, as upon page table move, move_ptes() clears
> UFFD page table flags, using vma_has_uffd_without_event_remap() to
> determine whether to do so.
> 
> However, this doesn't account for merging with adjacent VMAs, whose page
> tables won't have received this treatment, and thus latent UFFD markers
> will be left around.
> 
> Worse, it'll break UFFD for any VMAs it is merged with. This is very
> surprising behaviour for a user, who will then simply not receive UFFD
> events for VMAs they ought to.
> 
> Resolve the issue by explicitly checking for this case via
> vma_has_uffd_without_event_remap() in vma_merge_copied_range(), the merge
> function explicitly designated for mremap() operations.
> 
> Also update the userland VMA tests accordingly.
> 
> Reported-by: shaos <shawnq1@163.com>
> Closes: https://lore.kernel.org/all/20261020110748.959870-1-shawnq1@163.com/
> Fixes: 3cfd22be0ad6 ("userfaultfd: clear flag if remap event not enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
