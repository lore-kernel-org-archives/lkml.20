Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD06F361651
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271901; cv=none; b=Ik9hPFx8hCIOjcnxQN+U5tib9Q6ah1pcJxE/Z2oMoSTePl3ySuUysnjqiUcAKcRx/z1N+AgpuL2qUs9YztFH6Oj02o7d1M9hIdbNw2WvvPhUb8AMBSZzH5++4IVG5kjK7hsyoXyh0hmCSO1IGFVxOpSuXuhxT/v5xs8w7RmY4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271901; c=relaxed/simple;
	bh=8+R/OeIp1ZVk/DP75Xjsd85p+yJ8w89tCQWny8G0Cs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ot1TkTu/Namv19/pdbH6pfoAtBRATFAY01sOvWesEHqMe+5vsAhsiPeWmOpigN7XG5QYyHnqn7Owrj8jlWFfJQEW2QB6geYoeWNUsLYvUtbvK9yuVBpRLEB/+bn5H7XEVPTiJGjAYFlrX+nhmwqbxM1r5bGlrojccnrELnKffb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhozI6lU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhozI6lU"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f0167e59a3so2723089a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271899; x=1788876699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHkkshZ3PVxOZzqbwKcqNzDLof8u7Tm/vxYAm4UhRQc=;
        b=QhozI6lU2wAuesiwcxU/pDALzIzwY3lMI/ofJQn2yS16RlXDXJkKUyWeKGG/E2+DUf
         FA2qR1SdT33hmBHvUgwmuCj2ZNtfAOVPSRM2H4eoKGBDg23wM7K1d6s5XIzykSSc8ihx
         YaaeMLZuudD7WZ2drZeNp2ZzwLxkejLFDRPeikOTXw7f1HYgSPVQgEqKW1MzuNWFxomV
         jEWJqw5WpToc0C4GKqm9cUyo9gIuPNYCAhxrSmCjEPUd1Lf9+YjU4U57tkRfo9Q89Ymj
         FG+1eaQ5w/WQoh43d+54kwiBPCevmoYG/j/U64htniHa6IxYjSHhnMIOhDjHam8yMldy
         IMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271899; x=1788876699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHkkshZ3PVxOZzqbwKcqNzDLof8u7Tm/vxYAm4UhRQc=;
        b=BDmhnCfr7EdFvYs08WzydU/tuJQyyJQnfaaudmEbx1cnhvrxAOPVFSPMwZS/V16SGr
         ZOFPW/nV8v8A3T2KnMPs+9QleonxO3PIKBQvEl7nNXe8EwIpyMWQrU9lBe7kCcXJuWPG
         UHCbuN+0wC15LSQkywndg2/PXEwOYscYjtdHjtNVz7lus4iLFM2s1aScDteHAj9ZOsWd
         rk44ehryxsgACvBZBMcqzep2srHH1IIlrpftTHnqb9v63pvxDCytlcudG9LH3K/ThC9V
         R5nCsBATkfRKrMt9HCJCFOuke39He7nhkizbihQXaH9eqbinAOtY+J7KWZX+sDdoqGxn
         ki7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro9sYVOrb2vJ3j4Bftgl4JFpzuwF1mmt/LWIXw+Ou3pGb8OdZAbRQ/o8yTpFgE8G2spL/a4kCA44IIj/SU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWHb4ABlsTGVgBdfQkWAPxobVPol3O/93Ofr3GpL7LsNZh0t1D
	SsEazq4pQiwGeJ/YEw9c01xjmKng8pL+phT/mWA78V7u8gwgX+SEXv2V
X-Gm-Gg: AR+sD11CCM9eiLdsLwFgHb7W0sO3yhPwcDX9PKLOvbE95ZKfCrExIOU3e95JHOjI1px
	ibqat3wBvcpK5qo7x82PhA87azeoCga2tE2aQwXFeIKXupp4RVzOC4htmX7FE6rVTWEn5mMNPZQ
	3KBoPwR5zY7EfesM6LwHrKNyQs9mwZq1go4X8Lg+V++ZqbkeRyuo+UzcTBCX8TjpZAeACkWLcZk
	+eTmvFJjT+BGBOMdmhyMW/xpmXwNowMxh0RpNdsUOywBybNDlJQB397Koj4veyQ5Z5s5wKAOUE+
	mj17Xh0vZTNFuu8NCkeYjELTIhUldgjgH5lCQMZI7Hs7VRNE9KdqMK37CA2MWYVgAW3Z2eRp4jC
	aeuO6pHaierexjsNIMXZVpfOfiLD6e2JEM4jU7AdnRONSRLyYkphh+w/ZqWYXqJTZECCmIlz972
	vImclafaunRbel3qys3jRZFh6JlJgwTbwreHhkW5wRRXv/X5+z5iKgjspgI9xldmtJSTQY+s5yM
	5n0gyGVK5KOLw3c1GM=
X-Received: by 2002:a05:6820:160e:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b1c65bfcd0mr34936183eaf.11.1788271898644;
        Tue, 01 Sep 2026 07:11:38 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce359f82sm13402124eaf.14.2026.09.01.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:11:38 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	dev@lankhorst.se,
	mripard@kernel.org,
	nat@pixelcluster.dev,
	tj@kernel.org,
	osalvador@suse.de,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 7/7] mm/memcontrol: add stock to the memsw page_counter
Date: Tue,  1 Sep 2026 07:11:35 -0700
Message-ID: <20260901141136.1871423-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apaZdbM_l3kJIiyK@localhost.localdomain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 11:40:31 +0200 Michal Koutný <mkoutny@suse.com> wrote:

> Hello Joshua.
> 
> On Mon, Aug 31, 2026 at 09:37:51AM -0700, Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> > Before this series, each memcg had one stock shared by all its
> > page_counters (memory + memsw). Now that the memcg stock was folded
> > into the page_counter level, give memsw its own page_counter_stock
> > so that it can benefit from caching charges as well.
> > 
> > Note that while the allocation is conditional on do_memsw_account(),
> > the freeing is not; the freer will only free non-NULL stocks. This
> > matters because do_memsw_account() could have changed in between the
> > allocation and the free.
> 
> (Just a passerby comment, I have no remarks to the overhaul.)

Hi Michal! Thanks for taking a look at the series.

> The change of do_memsw_account() is because of re-attaching the memory
> controller between v1 and v2 trees. That's not so common operation (but
> not ruled out), pre-condition for that is that there's only a single
> online memcg, namely the root memcg. So it needs treatment especially at
> memcg offlining (which is what drain_all_stock() (also) does).

Wow, that's good to know. To be completely honest I dont have much
experience with cgroup v1. I didn't realize it wasn't a "switch whenever
you want" type of operation. Good to know that there is some more
guarding there.

> I don't know how expensive page_counter_drain_stock_async() is going to
> be [1] but the v1 parts here could could be guarded with
> !cgroup_on_dfl(memcg->css.cgroup).

The function itself should be pretty quick. It just frees one CPU's
stock, but the rest is just scheduling a job item.

> Regards,
> Michal
> 
> [1] Now, I see in 5/7 that there's the counter->stock check which should
>     be quick bailout on v2 (maybe quicker than the cgroup_on_dfl()
>     I proposed above).

I'm not entirely sure, it's probably similar : -)
I think they should achieve the same goal, and hopefully it wasn't too
difficult to understand why we don't have the cgroup_on_dfl() there.

Hopefully the rest of the code looks good to you too. Thanks again for
taking a look Michal, I hope you have a great day!
Joshua
