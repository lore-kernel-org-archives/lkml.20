Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FED30ACEE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050859; cv=none; b=p8hkM9HUKAKzXiCcG4VP6cNhGCwbw3sU0pBlA8yplxCc9LHAo7Kuk4A4pCBEE130UH+GlCDh+TDKVc4kJ75CtAlFKKoa0HWH4fvPOaVJS9y6s/j6bkjqsG8zEuipRR9t5ZDpRKas+2WowI0CTahOigpDohAMMpDD0Fky88cIDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050859; c=relaxed/simple;
	bh=TZM1KYX85yBCMfB6pkxSOsIHrKLKOo+AjP2+UyNJ9j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=safH6F21b8ocT+SROjMKYteZ8vLjNXMJ0E3MKz2sqRudZ53XVtlE2Gk/ngQxccnoxUTZICXQ5VOzSU7ouxWndOdsykDp2WLG2IzWqeYzqNKpk1HO9KBCxCbx22ma5YdlyioR3gsQ7BgO3DUKarQWjIKs7CFE+B4YBPA5fh7pi9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaKwNzYQ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaKwNzYQ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so2050911b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790050856; x=1790655656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vw7F89gHzb0bwYi7GFQ9WYKMfHucMYNinHqo/LXrYrc=;
        b=TaKwNzYQC3IV4k5u1R0e6DP13oNkdZC59ofnDcM2oCUXDHaIhYHvlBrnrBifPexisF
         OVSBW2rtCqRzY2/DAomwW5sZzaA3AmkVw3vgMTMoJSPlMaSWfxWArz4jZ6GUXBWdMdUU
         SSv0g8yjGSiz+qzTGsW2XX0ONq9XizjcbGcQWQtIs8WNdQesXyQMVlxiZ8dsjdhihfTE
         qjRDjD0Hvyk744paP7XZrjFwW5aQou5InNmo5T8828oVSPezSpMfF4V3l7gnj995bmKD
         XkW/PTNQp6YlNQErYmaEP9xL1qd5/C4ZJwk41kLAWDGoSUDdA3Mj/k4dwvWZXwLYMwPW
         HnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050856; x=1790655656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vw7F89gHzb0bwYi7GFQ9WYKMfHucMYNinHqo/LXrYrc=;
        b=YAM19CxxSGg2Z0qiVNTcQw8hX4dPD+k3mnVSmiT0ePXaX0jB1FrHqRI/RIpe+svBv3
         HCjbp3qG+OfmLCkvaZ+cxGuXyTxcZS4FGp55S39LFnA1b+roE8Du8PiHYeB26wIpnPDu
         UZg0C4Gb8ML3ywt8XMMPXYsvo8DiTUdDgqKD5j8/pqfsaFiDgLLXjBzHkEeHoo1rYk8s
         g9YvjQIZvmFqSU9Pk/N4QxcDwllosMlLYA2iBCylvbMXzmIWTSvZHHpmUfjBMRjfQvZg
         WZbMONcRjt7FhWsFMCwpOkcjvwIfV+4JR2KRQe7x+CKFJYQ5541CUBKhPTGDD/sXuUwC
         8APQ==
X-Forwarded-Encrypted: i=1; AKwUvByL6vPpJWbI2tplPGbO/bzMnk6o2fw59W1dflGHrtdYogdhvuZqNDOX/chWg3SpML3QrSuAZxD1zSCvzww=@vger.kernel.org
X-Gm-Message-State: AFuF++ltTWtIu6nZTo1ds4NfcquQvUaVsz4gKrKOSCUViE9c/U3fWQJf
	KR20pD5tZfQeSbmPs4ceDJ9UpjrFINSHe5vmjiT+GliclpdBEU5zMYHm
X-Gm-Gg: AYBFou0oeRAVtXFyHeJn7RCkJXU9X7GxIwviBR/rGnT3zIcu/OR5qG1QAqqFW09Z2ew
	SSfdjNwsc3774vC7oZ60IoflSOR9AFqIwRnAdxzP3zEYzhtc2Ou35C7od0CQ/z8C3ae6odvEoip
	TKLhWh4fRefEy03WeuWWhjJHMHZkIbrqxK4BlAdO8NSzuS/K2D0q7P++7QPJtRhxG6Qx5aV5SYO
	7hmoNKw4yN2i6v0Lxy7M5KI8I9j5YXTdYZoGnLAComu6KEH8Naj6/qzom41F7Q4QE/+lqGOdNaa
	JSogVMh1W0kOsPnPKTQ7krwGLp83gnALg2yyNNgXBDOXKL29raN9UMERl2tpoN90+z016SJbu8t
	5A4+fVX6KAadGdMDNGLA8poe/6x7KA9E0kf7dFKr6aTp25u0gxY2LXhJmFwI3bbNhvLDiv0gbe1
	gxyxSVP3TQSFdMqGjeMyyjHEHemLkhXWQaRI9ah+j5MV+Dku1WAWyIH/ixyOVuGHZYmS5i317uV
	XZa1F5FZycjKIm9SiUk8m8RC9fVdA==
X-Received: by 2002:a05:6820:4b8e:b0:6bd:bf80:9796 with SMTP id 006d021491bc7-6ca9be50072mr13917974eaf.41.1790050856466;
        Mon, 21 Sep 2026 21:20:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e394ac61sm881122a34.1.2026.09.21.21.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:20:55 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: Hongfu Li <hongfu.li@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/memcg: migrate per-node hugetlb lruvec stat together with hugetlb folio
Date: Mon, 21 Sep 2026 21:20:53 -0700
Message-ID: <20260922042054.3264663-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arIAyyjYcCKHFmyD@localhost.localdomain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 06:15:07 +0200 "Oscar Salvador (SUSE)" <osalvador@kernel.org> wrote:

> On Mon, Sep 21, 2026 at 05:12:35PM +0800, Hongfu Li wrote:
> > From: Hongfu Li <lihongfu@kylinos.cn>
> > 
> > memory.numa_stat exposes per-node hugetlb counters from per-node lruvec
> > stats. These stats are accounted against folio_nid(): incremented on
> > the folio's node when handed to a user, decremented when the folio is
> > returned to the pool.
> > 
> > During hugetlb folio migration, mem_cgroup_migrate() moves the charge
> > to the new folio and drops the memcg data of the old one, so the free
> > of the old folio right after the migration skips the memcg per-node
> > lruvec decrement. The hugetlb count stays attributed to the old node
> > for the rest of the life of the charge, while the target folio gets no
> > increment on the new node; its later free decrements a counter that
> > was never incremented.
> > 
> > Migrate the per-node lruvec accounting alongside migration. Global
> > memcg totals remain balanced because they track resource consumption,
> > not node placement.
> > 
> > Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> 
> For the fix itself:
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> question below:
> 
> > ---
> >  mm/memcontrol.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 1460cba53588..9c96ebd5436f 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -5598,6 +5598,34 @@ void mem_cgroup_replace_folio(struct folio *old, struct folio *new)
> >  	rcu_read_unlock();
> >  }
> >  
> > +#ifdef CONFIG_HUGETLB_PAGE
> > +static void move_hugetlb_lruvec_stat(struct obj_cgroup *objcg,
> > +				     struct folio *old, struct folio *new)
> > +{
> > +	long nr_pages = folio_nr_pages(old);
> > +	struct mem_cgroup *memcg;
> > +	int old_nid = folio_nid(old);
> > +	int new_nid = folio_nid(new);
> > +
> > +	if (old_nid == new_nid)
> > +		return;
> > +
> > +	rcu_read_lock();
> > +	memcg = obj_cgroup_memcg(objcg);
> > +	mod_memcg_lruvec_state(mem_cgroup_lruvec(memcg, NODE_DATA(old_nid)),
> > +			       NR_HUGETLB, -nr_pages);
> > +	mod_memcg_lruvec_state(mem_cgroup_lruvec(memcg, NODE_DATA(new_nid)),
> > +			       NR_HUGETLB, nr_pages);
> > +	rcu_read_unlock();
> 
> Why do we need the whole thing to be embraced by rcu?

Hi Oscar,

I believe it's because now getting the memcg from the objcg requires
an RCU lock to make sure it doesn't get removed while we work on the
memcg. I think this is since Qi Zheng's "Eliminate Dying Memory
Cgroup" series.

Joshua
