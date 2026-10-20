Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535052;
	b=B8KYtkgrdoLIIXPHuFGIIp3OGqsoE0EDDlgRwlfDBpFT+S+/8tWm1ZcI2lNVHTJOQTjR
	 rAnpoHqh0sue5Xu9gNUHeXjtiHSDJwzGfrkn7lV8ZauPggWLjTMpH5FUfb9xERdRNafB2
	 V+qh/bDLS1g8vHfs7vY3C8BZLQnnULsjHNQSBCaC0/ftSrnUNUvPnV7AU7JUygyafmB4K
	 QG0xO8ltdNSiB1dWB4yG2wWsnlrEebn32/e1IIiK1/8bFSm4tFO7t/Q48bbW4vOxZNZ3G
	 xpYzp2K0mAcuC0J5/QForC2Tdxp5opDifQKw66V0r528Zjr1I9BbpQrgccXz5hiwxsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=JbcL9UJUoZzm8h4f8WZ8/x3EwYH3/2Tgl62Z2dUn4XM=;
	b=Ck9H7pGBmkJi/Ih/dAjMwP5nvmlxNaVeJIWXs1FGBBMiks9Duw/6aH0eNXs84wk6GYsc
	 z3A28DoWLwtNRXxieBNim+6MTRH25tyZE9pC2hNZmDzzvujEhEKqwB93ednQCxQJgHfcM
	 i5dvjxbBah3nInfNz0D8P/diWAFWaeG37VC0N5ndM2VSZUIWtG/CD91NrDEXZi/p9yjx3
	 nuULGerNEBe3NRb7KVx4N49ckEjZLy6bnraHu9puAUK9kto0HjGFDS5W3jeeygMO5CeYU
	 MzE7r+NI7to8bbISPhhopKgJow8x74HeVFKg9ipzqVR8FcKDTqZ1p4U5T5MTQvG0s0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=jfZJtsJI;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC67606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC67606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=jfZJtsJI
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363c8de563so1679661cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792535051; x=1793139851; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JbcL9UJUoZzm8h4f8WZ8/x3EwYH3/2Tgl62Z2dUn4XM=;
        b=jfZJtsJI6UhFNm9iP7XMEQEkC+wJp1pcrSXNbvNCSvALB4MBx/uozTLKdXC+8vCqSV
         DllU8XTLalvH8fkVTnS1YFrC5zG1eYfsjmTKYAW54vZK/grwPTVLBO/Y9vEJVe/8JfzX
         vx/mZsWnZBox19CU4Jn2qvM7auDsN6dTh43F/AthhFEK1xGjmOkj+yR/cROzwZpgPZDZ
         JXSUOZ+SN3oCbKqPY14/XFPRg2x6dBnSYGPbvCTf5TY1O40Ks7QoCtKjUfKplo3eT+l9
         unLwzh3mfWRbg9DerLkUfWYQpnvmT63m51dCZtgYcW+W60oBIPK5rXc2W4ZuwtDRhyEC
         /LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535051; x=1793139851;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbcL9UJUoZzm8h4f8WZ8/x3EwYH3/2Tgl62Z2dUn4XM=;
        b=E6kDnwxgQPTR2dRimfTvwwZQUWh2O6Nnonmbdq2fvfxW6fOJajCw064Jec6w6doTI0
         rcSlE/Hy7wtESGwUhyonj1SYa9R5paZoIV2DwGUL7Uh+yLslWvvrYZ/h5xRW1T1ovmFV
         spyIhbCwHQDVpAM+KXcdOpBrHCXoM0eYc+qyiDpI6X2FmppCVaF+8DnimJc1bFz1XQfO
         rgm/BIXFPDg+nUtv88E7DvrU8ZggeX6eAHI8xIls5KIE7rRzdTcyFTdKjKZMPjbJerF4
         q/YP4IjAsXWCEWsUqRLT4k6W+wR0+fdyl4aAz84M/Zt8z/zSDhC9oU0Cw9gxIOWleYId
         F3jw==
X-Forwarded-Encrypted: i=1; AKwUvBwFP7W0XIhXuulPJd5Xybf7mThMQfQFEpoeQVtB/jr8DyV+ttrg6lIhL9hLTypuNtICnKhXRwQwwm904tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWiwut+TmyONLaS6jborLyoYJ8Bo56PIy53vPg70xj4pxmdflN
	yxyZM5ZecYPGmKgh+B1Cox3tCFMTIjWZ7dGl3ao7hycPdhgBdaOYIjTwmulBh1MTahU=
X-Gm-Gg: AYBFou0v9qpvZ5qSKN1TexOOkViQDrL+BzK9esRakNpHB33GcIOWUoHgLvROxgTR0Yt
	RmBIss3W6mBtxxzzr4iJteMoWTZNg53AZCFMxWCNhYL8VG4KtgyayuA7WGsvTQwCesjHF0DICJn
	O15GELmGNAaBA1SD8NKwslzKL6h9nIYmrrggMzYc9KQRFv9heNbDK8bUbHkVELOUrATn27rQLjZ
	kQuH+MpTHNfaQgV4Ix3J4Nt34ByVp1+kv/udzGfAfSRR+eDFI4BvHIIej6F0cFqtA/mqE+onQeU
	mHWSSPzneNO5zeBReeTIMy+LmXmEcjqUxN+lKQrDAfkt9Fkq4nem0oOB4+rdTMOLWSgG/ymlgHO
	vzVDzD2bqOV/enjgljAvDATbAmJ8KHIVhZ5uO3wg43sHxYhB4oHCHP7fGNDXjUdT7bLBFoOGUpJ
	fT9+vhlRGZX4R8wU6eAo1rYxTX4xWowSBZTER81vtWVkjfvzYIj0M7biMG6iYTEqChjG9BTTs7H
	ul0kE1hw89tRxY1AbHOUkxueoiUJmbW6IdXLMDp6YHQrYk=
X-Received: by 2002:ac8:5cc1:0:b0:535:f9dd:ce3b with SMTP id d75a77b69052e-5369bb816b4mr3355061cf.69.1792535050831;
        Tue, 20 Oct 2026 15:24:10 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b3d2c9sm6239981cf.14.2026.10.20.15.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:24:09 -0700 (PDT)
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
Subject: Re: [PATCH v2 2/5] mm/page_alloc: validate zonelist slots against
 concurrent rebuilds
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, 
 mgorman@techsingularity.net, jiang.liu@huawei.com, Bessel.Wang@huawei.com, 
 stable@vger.kernel.org
In-Reply-To: <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>
References: <20261019172346.3344005-1-gourry@gourry.net>
 <20261019172346.3344005-3-gourry@gourry.net>
 <45ef34c7-eea5-4813-b54f-3e34675697b5@kernel.org>
Date: Tue, 20 Oct 2026 18:24:07 -0400
Message-Id: <179253504789.1514232.10853151353341082033.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 17:22 +0200, Vlastimil Babka (SUSE) wrote:
> On 10/19/26 19:23, Gregory Price (Meta) wrote:
> > Onlining the first block of a zone rebuilds every zonelist in place,
> > shifting the slots after the new zone. An in-flight walk can use a
> > zone it previously filtered. e.g.:
> >   - a GFP_KERNEL request can land in ZONE_MOVABLE,
> >   - a node not in the nodemask can have its zones selected.
> > 
> > With kprobes holding the walk across the online, I was able to get this
> > zone/node misplacement to happen consistently across hotplug events.
> > 
> > The iterator approves a slot by its zone index and node, and the
> > allocator then loads the zone pointer from the slot again:
> > 
> >   CPU 0                             CPU 1
> >   first_zones_zonelist(nodemask {1})
> >     slot 0 (NORMAL1) approved
> >                                     online_pages()
> >                                       build_all_zonelists()
> >                                         [NORMAL1, NORMAL2, ...]
> >                                         -> [MOVABLE1, NORMAL1, ...]
> >   get_page_from_freelist()
> >     zone = zonelist_zone(slot 0)    /* MOVABLE1 */
> 
> Since the zonelist_zone_valid() checks you're adding happen before the
> "zone = zonelist_zone(slot 0)" part, I don't understand how they can be
> helping here. Aren't we just reapproving slot 0 when CPU 1 can mess it up
> between that reapproval and load? Am I missing something?
> 
> Furthermore, since we have the zonelist_update_seq anyway, wouldn't it be
> better to use it to avoid these kinds of races rather than the more tricky
> way of relying on what exact updates in what order can derail the allocator
> side and trying to protect against those specifically?
> 

This does end up cleaner.  I'm going to reorder the series a bit and use
the zonelist seq count to make it a bit cleaner.

I also just noticed that the same issue is present in hugetlb (because
of course it is) so i'll probably append it there.

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
