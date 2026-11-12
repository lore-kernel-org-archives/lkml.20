Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492738;
	b=F3+K9MJzSeovSWRYtP+PQSW/dKqbQuj/zVOjPLlvO5c6ucmBeHwKD8lnh1t1SyEvSU1V
	 JeaHYNdRGDqV8utS69P0hnIjMB36CHHyR1X7aO1FBBZvrmxFhgVkTNhmVqp/HybuOE453
	 FVgFgS6BJkUI8le/a8TsaFzNtXCbHcGFPhoUmJBWpwEp95LHIW1gTjrOYQFmbPmSmJfrR
	 xHRkPOYxXTB4EkV4kfOVpSrE9xbaR48Uh/o9IsgekcEWBwwHVTa8gLCg/KfYgzZ3dsYid
	 kV+lEUmumx4qPymO4aPm8dmuTLSYFHBo9P6wym6vlJcsllq+kZPGq0ppL7b5DbMMRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uM02Fg1gjU3NBZSPcxHW5Rd4yGFYmOd1Ea0CS7gM/Ms=;
	b=dfjme5xCaAaKM+RS/hEmRiejNUjJDuaRVTUzMpn55X5t2NS8jTgIAcMqMdcUP+hVLB1j
	 RSquS6Bas57CyKd9avkeL0+1eGK+W5+s5blyVPLNvJcBieHPGJyCHi3WBkBJoMir9YuxH
	 PCnb/2uwzT2NSpMppEZn1TfBKzWPWey/xDtvBaum0GoETc+1tf/cKL8kxirqqYzujSTBj
	 q/A/T5nZbiEzJc5oeXyBcDDVbwCNDEGVW0AYdGYxGXuh4QL1UTa5/bRsVhVaBTPZIk4Re
	 YsNe1WuQCJzaivTd48E5dmnL26qIvxqF4C5ezmEEuL3fNpE3tAVnz5KRoXCDNvjX7HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gAM4oD6u;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6128606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6128606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gAM4oD6u
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so30456655e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794492736; x=1795097536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uM02Fg1gjU3NBZSPcxHW5Rd4yGFYmOd1Ea0CS7gM/Ms=;
        b=gAM4oD6uTHicKnz9f6XcRMaEiose74RSU+22HtrUNTVYwp1z4E+0jsTVXhaopMJhuT
         pjs4A65NOnqmzswNjZyNhEselwzTsfg+DahHBo3oXTJoc0kQ/aoomF0w/MnekRyv/0cV
         CCxrtZxViKMXI3LNnyKnDxqhPmzivgpxsBCnS8d2L74xih/EW5CodlRtaM23ZtLqYkXv
         m/OAVrSVnx/aSsd3jAruqfNVGYJvlp8Un5NBSNi4cFxU0OV6uxzoDBD8L5S66G7WMZob
         8Gfo1jphMoQx20P3Qs6ZvBIsuaBUWw7P099WzOZENsx5TTGTQt3eXcWPUOrCWT/0c/pO
         p2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492736; x=1795097536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM02Fg1gjU3NBZSPcxHW5Rd4yGFYmOd1Ea0CS7gM/Ms=;
        b=LsgyzIrVNQri5TddvCffBCZrBXdY54lLDMqhBb7QjbOXrS555zuQ4H4oGE+Syd/K/C
         JWBa4v8Jqd790pRYn4+0C2SY62PkIu0Juu3m6EvFfFxTit9NpGxOGHWcuDvZU6x2WrNd
         3tMUisplApdn4xqMVUjwG42L4X6u5lN3FjhwlDZzIGk3eC53A5mfxM/IaDJp/Y2JIfuL
         /xl6WUBZsNpVYhnyyW0ReGJUYrK4l8y1kNTDG757hUvVXULGaKkBIyJHkgUdhqzGF3Yl
         jZhN83OvDGeomkxEiipa3Sojr6ZBkY7tomse9wxT6kir+l9yg71wToZNPN76gSvCf4q9
         ERZw==
X-Forwarded-Encrypted: i=1; AL+hErFHUQY0OTJjpssXnbT2bFAce9tJfzHsO7ZW+2Vk28AGURDktwIZwtTfY+3ByUsUMpRU86eRkP63su4Bq38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tn/IbpVmKitiEOqVSI9bmz9q27gsmxQx2iTupoWKRIrF3spPc
	WbChBLOynG7OEKYMN+zhI4Eh3tdeak64v0KwF5K0ihIfG7Bevx/l5BIp03Ebru74+BQ=
X-Gm-Gg: AYBFou2keqWImDlVbqxrw2TVs5Y6LJs+ukjgXNGdpRJj9mXIl/5O7EcR6X2LPnzCEPG
	xTpPjkycyuGwxoPnFmX/z9jI25BGE1m0ivF4NwluUBuWJ1WM0ks7zf6cqWtGs6FT4qwv97cOnV7
	3gFQtE0OiBVkqKZsWEpCA5dw70a8bhldUoOajqL+oF8VKbsjZN3+S6iXzFl08e6HuAAI8d0ROFt
	J5d6PF983k/uqSAECJ7scKgAi7+ElQsYFYdhBw2okq3PuOWUBYYb3Sbv1AfrQatGhCoTmzUWo6R
	AtbervYStdJpD2qwoRoWHxw1TkThm9u3pHn0FxdCYjDRQ/dMz4HhQoehKLqlJ5t8m5IuzPM+mFh
	GisQxKr5l536teBbFRQcrvn40Doa4FC2EIEphdZrvBZ4VxyLapB6mnQwE7j5AlyBGqP5ZXaQJ25
	E8uIo3WEPUZzaCUaIBkJpPNeEBSrNau+25NnjlSX8kr0SFwzIhBt7CekuqmqCaiHOeaXt/gl+Ip
	t9Oju7UItAy25s6a43mTTwOCotNbuIVu0eyHt45rvOHOuuxp7iy/hacNG3qkwJDehZ4jHf5glnN
	giS4lnLeZCjFSeuDosjKQPyjT9M0vVSyvN4CdNHs8LWJ
X-Received: by 2002:a05:600c:8b31:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4ba0938e3aamr97570525e9.23.1794492736131;
        Thu, 12 Nov 2026 06:12:16 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2776casm105702275e9.14.2026.11.12.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:12:15 -0800 (PST)
Date: Thu, 12 Nov 2026 15:12:15 +0100
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
Message-ID: <avXJPw17fWvLtCO8@tiehlicka>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>
 <avWmfXu39vtp0DM9@tiehlicka>
 <avWsG-zmuniUFio7@gremlin>
 <avW1s2wvz1PB0-Ln@tiehlicka>
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
In-Reply-To: <avW1s2wvz1PB0-Ln@tiehlicka>

On Thu 12-11-26 13:48:53, Michal Hocko wrote:
> > This only matters for the OOM victim, hence reinstating MMF_OOM_VICTIM, which
> > made the patch _way_ smaller than the one proposed :)
> 
> Should we simply do that flushing unconditionally before setting MMF_OOM_VICTIM
> then?

Sorry, I was caught in calls and didn't get much time to think about
this.  I have only now found some time to look into that and to do the
above we would need to make tlb_batch_list_free visible and conditional.
Which is a bit of undertaking, not anything major but still kind of
ugly. So your solution seems better in the end.

Please clarify the changelog wording to be really about this and with
that
Acked-by: Michal Hocko <mnhocko@suse.com

Thanks!
-- 
Michal Hocko
SUSE Labs
