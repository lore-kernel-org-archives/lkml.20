Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1A9257AF8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295498; cv=none; b=rQS5xYmc0SJvGmw41IvXZ2uqTRGHDNqQFTgQ1wsgAyv9CwCQX/JUjEuqtceJzQx/Bgl/6+6VgT7qu+x215FZVLwcmZEY0ZTSu+Eycv5g+mCl7dVmS5zt5OQ+JD3V0n7O/0qdc2DHqRl9fTiq9w2bsVk1i0SF0Vy1jna6wmAZnzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295498; c=relaxed/simple;
	bh=iZJ5bk7vRn2xe9aU5KW9nN7+y0cemowWIrEwhcSMcCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f10nNjXbW7asxC16VBJ6ydDuAwKJJcRdcBQ7T3AnvBw7/OKAo4VaY6Qm/JLCCiUCXiZ3Q9QY2phFeCLYtDYk2Q4KiAcnwO6UMhKa985x4ae2OV5XMH6V3/PGJng/adIeROKjsE8vkjY88GVcd2TH4gs3RyreNcj0Sl7O1duL8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=nauQ8D5P; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="nauQ8D5P"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66f883abfdcso493269d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788295494; x=1788900294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EH/NfLg4aACwiLJhYAQ0D2cKDfAytCBjkGxmccPidO8=;
        b=nauQ8D5PipIlHo75UwPMiRgAeV/Ix6/XCPF3FfoSgzM5ydpOJWpeB4rH4kTTj8JbVp
         uxK/NrtQWpTzyIAXBybIeeCdWxqg9HhNl3Old+gPHQ4xhN0zhku4MltMNuEQ4fMzucl/
         DWjtnC61dQU/n8JZHApa4U1Ek6Ml0A08cveMC5JBwev2RHhizw+1M+N5+0eN4SrbTpg1
         mERhK3xlxSGG9t7uDMWBXB9WjhEdMHnKssdxfHuflni+fADowJXBb9eLgQXJaoYZZcLN
         S7ZRV6vKGONpDVNGrw+cicxv0nzggLO9rlRT6cq/pX5Kivsfj5RkTIqVtASgzSZ/rx8F
         nndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295494; x=1788900294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EH/NfLg4aACwiLJhYAQ0D2cKDfAytCBjkGxmccPidO8=;
        b=SWQn/tRrDD5L2Ge8TdsPp7Qn9AqM+QqQYkpuBjSSIwDhScXVKqFNQhrnBbgYLTcllj
         DJEtFcorRwxrtec+Km2kE8RYoP3w+EURrL3ZK5eXC8whu4o7XPISHaUGq5zyC5btXik7
         jbcrUbr8ZkZQeEFod9YUe1oTfPT7ADDMV/GBaIq1YC2T0MyJOmVhGE2nh2Od7GGGcI0p
         T/VBtVhjUDaATmpXE/r7+mfN+SRL1RXnuGTnwuLKIpH8Uk1bvkuOIaKWZZRGZAOm3qVE
         9DNfgKp8dV2LnPp1whfrWIPQmBgqGP3SzyLs0vNn+i2hEfxiElklo6+j2ZNPpx8Vwh/C
         kxOg==
X-Forwarded-Encrypted: i=1; AKwUvBwyNmc/qmVYwnPV3YZeOvP32g9YLYpMDDjCNuZvehP4G0OeOsZBGSoCFwpuCgCvH8YUYEUIjt4q4d3P248=@vger.kernel.org
X-Gm-Message-State: AFuF++m2dJtBgC+2RpUPAs0+cqY7ak8ockvGpeQLlPgy2/Zs8cjigZHj
	hZNGsn6TD/HhIgmVkr6lOVNrLeZS4prtQoc7feWr37cKBJQQ9lCRcczPkM7D7qkHKdY=
X-Gm-Gg: AYBFou2w9y7DaEk8ZKwFgD0IYQrUtB31Gebl05v6oF2A9sxGY+nSgh/dQmP+Se5syAR
	ZsFDPCrjp5gocvmVZrU/CB3x3pRjLG69BMkfCmRzYYxLFw+gUPtqzPqFfNSEa484zVDsQYr02Hb
	xb7vfY5noThEITqJXUIyYqBk/YEx1HTJ2j50tEHP5l76i7eGA/d8PMGBd40gU/jF0wk+e8BH3Ld
	hUp0KxvDr0WAzVP5N7jiFjuBQyRLjIFPxkzsLG0gGCN0LUAHS935MylD5Nl/vdEntMIYslifjqR
	wfKTthVUOw1IBFX2Ud8rQHnuWCBtZTGDwJ5EVyqq95KIrglzRnKYwGZwu2Uj9BcUrvElCdwDX5l
	0mxDmylYHuy5lqmUDySHZ+KmXYr47+Q64UWZ6i2Mf2Kq13R210VLHkXj5tI05AkhCTSvU5CW1uh
	UBUuCJMaXrFLvDFGZCQStMjjlbzL+dO+a4xtfpnrjyiO5GAxUP/jtREY30Cu/A
X-Received: by 2002:a53:a484:0:b0:66c:e472:c792 with SMTP id 956f58d0204a3-66f988480bbmr298480d50.31.1788295494303;
        Tue, 01 Sep 2026 13:44:54 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656dddsm432178d50.10.2026.09.01.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:44:53 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:44:49 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260901204449.GK3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901190123.3511535-1-noren@nvidia.com>

On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> heuristic to help keep pageblocks free and reduce fragmentation for THP
> allocations.

We've had problems with compaction before when min_free_kbytes was too
small on large machines. Competing free space scanners do a lot of
work only to fight over a very small set of possible target pages.

So I'm a bit uneasy that you didn't include any benchmark numbers with
this that prove basic functionality on larger hosts isn't regressed.

> The recommendation scales poorly with larger base page sizes. With the
> default arm64 pageblock sizes, the contribution per eligible zone
> before applying the existing cap of 5% of low memory is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone

I question whether pageblocks need to be 512M on those machines to
begin with. After this patch, you're still asking the page allocator
to optimize grouping such that 512M pages can be allocated at
runtime. Only now you took away part of the mechanism to do so.

If you're using 512M THPs, I would kind of assume it's on machines
with a memory size where 5.5G for defrag purposes isn't devastating.

And if you're not, it would make more sense to lower the pageblock
size to the mTHP size you're actually using. And that would fix the
"excessive" min_free_kbytes issue as well.

> The automatic min_free_kbytes increase predates proactive compaction
> and many subsequent changes to compaction. Given those changes,
> increasing min_free_kbytes for THP by default is no longer clearly
> justified.

That's pretty handwavy. How would these changes specifically eliminate
the need for compaction scratch space and allocator fallback options
to stave off fragmentation during placement?
