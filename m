Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487735;
	b=vaqW9rc2XNCgFM7sUPqs22htHMxBXxMeiXXcw03FGSDQqLav4xfq1tGEga5roVFxihk4
	 qeqkc0XOVsdZl+H0gNESOQQnoRFenaQtEdvusdILoEONkwiu74/KW99YdPaIj7aOFtTBc
	 VLk/U59f/FM/sGzMMQr17Lp1fuXQQ8eVvciDnXpu76yLiTt0/rJokyyPW+bSDXhg4XBq9
	 ++9zuMGtlfNwzSlX5Zyvt6zURWlchzELH96RUji/2MsthfFpnDpXAz+eY2/O4p4KBpR9t
	 hSyRTko6ughx2opEUeUNJd4pfZLY9Ba4k8UXz+GeFjJf/02vcYco2OP0qwjtuGDTr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fpPYP3LwQ7UH65N0IOsMYcszMsGFfM1KkS0iQ4klOAA=;
	b=a2b7Gxq6yTa4GjwChiBAyPMnfnrVM+9S84/msgXWN9ROXSOtaIIaWNSXj4+k9OfFsNT/
	 1y+aE9ZtQzUY7ab2+mM/tUh/RMnCE+SEF/7DkqEfWnhPJ8l2QM6XXVokYMC4aAceqhK0I
	 TahBpwthM3b8XBAS0exKjSQXfKnP6myM/tVxUPMpxARhFMdU2DVFbqBgKenUhIJSW+fqJ
	 49F7L4/pQlPZFyeMCRIEUCOaCBDwinTJ+CnkqxmLZQVANeqgUIjk1do2teIGoATcopaXz
	 LSZx+FZZl2Eh7URQPVe1hetbehGQdt1mDqY3fWYmQy/oZLCLvBQm7d8RxOuw+tKQYfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IFFBVctA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D080606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D080606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IFFBVctA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so49948405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794487733; x=1795092533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpPYP3LwQ7UH65N0IOsMYcszMsGFfM1KkS0iQ4klOAA=;
        b=IFFBVctA9vvTAyP/0s3JWanNwy1/EcxnDhkd8zecNe2Zf+clmKb89wyzJ05R1YSHXV
         LGyoa0dx5KRbjIqfPaeosKW4FG/S/TZ/bOzWAK3XQumO0htQZJfFTt/F2klbSUyWCNaQ
         UF3hx3dzAKtUu0xqzCsfpxy72op0flc9e0fgdTlwX5B2PNNljnzfTa0/Pt/1WbbZVmge
         r8OGw1wv49O1zcCNCHah1dBqI4xROCfQEeTbiMp5bcSXoRt6mPDtJAQRrwLu1ozcKZ/P
         qVAa+0BOCYHl6xriwV51z631YJ8BDLYVDO+Y6ZTTfdCoWZSV4i63QxofQ/Bzjzx/XaHi
         LCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487733; x=1795092533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpPYP3LwQ7UH65N0IOsMYcszMsGFfM1KkS0iQ4klOAA=;
        b=mztOR/jaHDyvhHdSFx8/TlDQj77t7lkjO/W6ywJziTgDlNcD1LVcbwxAn2LwnuZ0fr
         LtHxRVJVpLyQg6FVV5Hd30nk0nHGSA3p8ghvHBEmddS7OMnTS872NZzV9YUX4AaBCcPf
         IKE/GZ3uCuuetzUlIXnU8cTNLnQDGa/LYNCSFnB2iOr/+CoNFnPDsxIGHDDqcMlpWXSA
         GyxJtjEh10F3LrrGqVjQrTMUzPQtVGovJtZJBZ5D+6olwdhSGEhEpkbGnJGS/z9DyLDk
         nyWdWpJ7ICThmqeMZkprclNTQAGYpVnSUHyBbNuCB/4AeNIAGYKQyE/2x+JazBjlPcPD
         dkzQ==
X-Forwarded-Encrypted: i=1; AL+hErESv8WncmNw4Lfd21fYxlNp+jpcvGieS30P3O/Y6LzLlbypfxgROs7KwQwnjn8/qge0PREl3LGxt/rl4Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Xedx/GcnKE3Buw7/KEJF9sL7Dtbn7rj967k2YiN9oqgKruac
	7TRFKhOwNCm9SrJcye1JgpRrx4uurAnAd9ZS32LykywOs+dxP+dux3UnZxLMtPpJw5c=
X-Gm-Gg: AYBFou3jcP6hflJFRb/Nwgh7Qab1V3+3nR/nPmkZamg5uOTL79uyzSSYWAyLTz938pU
	h+G53stVKR5LBzILb6Xn+/ZGCsiNDgRSD8WbYFrT3lar/OVS+u34qO/Jv/x7Bt1vaD1BL/LgXwR
	1MVKf+DtSVANunDoqi6uu08OUy6punW8EQhEGMQ7HcrJeJ0i55YYF9TJAhHQ55PP4nghO5k976h
	JhN9XUOewITIFmenZXEdhO7hlcw4JEWZyrq9/4atkzfxBQR9bd8A6ejwd7J9ihJeUDXaqSB4Y3s
	V2wXGGCshc6LJw6BfBbDcKUkCqtwywROAheMu+JjMHoycstKboURSGDHtzKHsN4rN6eLmuOaX36
	KDMQPf7SSfLONZ0ug6ljy7RgoMrOFn1thX27wml4F3T8Fl1BFQFJhgqJnlGsalR77EiPqRH8tne
	MqAZY8DNadTUPBBRuN6j1AhUSgi6fvM44ui+jGpV5KB1kYbVYn3UeQmymzZ+OYgS8A1285nKros
	n6e1N+CSjznO6+DQbzWag2KAN+3aQSIA0WyF9a0CRq7TUKAnUJMkR9A/rX4IO6UFnu0t3cibxnG
	FQUAXz2BbKWjMWXFpQX6tSPODBjE1F8DSrQBpuoPURI=
X-Received: by 2002:a05:600c:190a:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ba0936c8bfmr102512485e9.7.1794487732984;
        Thu, 12 Nov 2026 04:48:52 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251491sm71286495e9.2.2026.11.12.04.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:48:52 -0800 (PST)
Date: Thu, 12 Nov 2026 13:48:51 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
	Balbir Singh <balbirs@nvidia.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>,
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 01/13] mm/mmap: free gathered pages before MMF_OOM_SKIP
Message-ID: <avW1s2wvz1PB0-Ln@tiehlicka>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>
 <avWmfXu39vtp0DM9@tiehlicka>
 <avWsG-zmuniUFio7@gremlin>
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
In-Reply-To: <avWsG-zmuniUFio7@gremlin>

On Thu 12-11-26 12:14:32, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 12, 2026 at 12:43:57PM +0100, Michal Hocko wrote:
> > On Wed 11-11-26 18:13:15, Lorenzo Stoakes (ARM) wrote:
> > > The OOM killer can quickly trigger again after having selected a
> > > victim. That victim might not have freed its memory yet, but its mm will
> > > be marked MMF_OOM_SKIP by this point, so the OOM killer will ignore it.
> > >
> > > This can cause the OOM killer to kill an innocent process when the first
> > > might have freed enough memory to relieve the memory pressure.
> > >
> > > Fix the issue by freeing the memory before marking the mm MMF_OOM_SKIP.
> > >
> > > Note that the task which calls mmput() might not be the victim - if it
> > > took a reference on the mm (e.g. ptrace), it may hold the last reference
> > > and release it when it calls mmput().
> >
> > I do not follow the reasoning here. MMF_OOM_SKIP is called after the
> > address space has been unmapped either by the last mmput or the
> > oom_reaper (or both when they are racing). Now all your patch does is to
> > call tlb_flush_mmu which I suspect is to release batched pages. But why
> > is that needed only for the oom victim and why there was no final flush
> > in unmap_vmas?
> 
> Sorry maybe commit message isn't clear enough. I did have to pare these down
> from really massive ones.
> 
> And yeah tlb_flush_mmu() is about freeing the batches.
> 
> unmap_vmas() doesn't have a final flush, it relies on the caller to figure that
> out, and just batches up.
> 
> And currently tlb_finish_mmu() comes after MMF_OOM_SKIP is set (in
> exit_mmap()), so at that point the memory is unmapped but whatever the last
> batch is isn't freed yet, and the batch can be large (PMDs are single
> entries if I recall correctly for e.g.).

OK, this makes more sense.

> This only matters for the OOM victim, hence reinstating MMF_OOM_VICTIM, which
> made the patch _way_ smaller than the one proposed :)

Should we simply do that flushing unconditionally before setting MMF_OOM_VICTIM
then?
-- 
Michal Hocko
SUSE Labs
