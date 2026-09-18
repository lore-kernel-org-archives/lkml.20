Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B93B05BA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724474; cv=none; b=bcwMTAMJnU/0gEGvTyld8hKjfWHLROFIr7XalLuaKjvOeQAmdN70J805cEtKmJ9x+iuvJPNuQ6NXuUM/Kq3zZv6PfP3PIS8dsxI1K+OjiOiotK1NDSF0bfpGZd9wT1dzwlBIga6GezqkYf3OE6VhjrOCulqI2gM9VIViT+D0748=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724474; c=relaxed/simple;
	bh=IR4Xs8Dn+IT7ihKZTCedV4W+0dWbX6d3AknpHpe5TcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXHVDmFHfl0jrKQiN9QdkpqGN3s9Y3DfhllnJbpIQtclXpOnhnonmQmW//VaPJJcit+dFGMmdpLrSTFrH0io10Yp1pPTpBkReTy2c59+U3Lysgv41BCkgIospELDhUE+uRL6qlEmlWpU9nNW4jlXVgdxdN3hq0rJmhokIF2q+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LAES7C7q; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LAES7C7q"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso30993266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789724470; x=1790329270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvlc7PQn5Y10Z6hN+pRJdEeRFAR13rFud0pX61FSVmw=;
        b=LAES7C7qMl5J/amuAMRyjF51wxXmaG/zBTQf4XIhAqB25va7yzZKr6pazVM4V8LdxA
         E4xWkb1svpk0pEOQngjihkZl5GmiQnEmoXJRiQSRBvYXISLNoUcbDf7ttBpyHEQmDW+/
         QLUu2LxrV1upj9Uax59SaLVQdt5tJVyzgy0zkiEsxRDcX0QP9WB8lskjPCaQOzRU5OFs
         ATsnY95P3w1hXlPvIVGCe4myZzzQolOVU2dzayIsLriBcAiv6iNIKfprnzteaNhHqc2T
         9bKvELb5xTiDpqfWXTHKAD/UHRUSE2/L2Gzi7+MWg75Og1CEf1/6kb0EyaiuN8uZAJF7
         R85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724470; x=1790329270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvlc7PQn5Y10Z6hN+pRJdEeRFAR13rFud0pX61FSVmw=;
        b=M8aTCzFOjFf15XwY1pvb0YFiUwMxt2Bw7NaKy+OAFn09B/LGT4jl4pMihiJBnAHVM3
         rIx27XYKTWK2dJo3fycHroNIf7FmskpdRXRRhdlfUOUwxrI4fWZwzuCDZs6wtybGZPQb
         MQQyxFr5gC1ffinqI8Addlo9A4RtqUauwlrJuGRN3i6xcjIdYujVOH98HxoWIt9rTZcC
         CgPVovbfxu0OmIP83M1wwyOzADpiouG6FCOsAgs5QLEnLXtx5+iLZszKlTH/+GG68Rzr
         D6trsnQjatbN0V+4VcOj4no/Q+DhM2Ft0f3nXsh5FUSucVi4dHs9O/zkC+AyXWl5ri6k
         JjAQ==
X-Forwarded-Encrypted: i=1; AKwUvByaIxwNNMc5bqPb3G1wposfQ93Mc2vrGns7bWBmMLrD2/GOguR9FlaAJYm7QQsnZQfqJZOCQd9aX0I4lqI=@vger.kernel.org
X-Gm-Message-State: AFuF++kzRa8qjjdVYX1YaK+Dv5iZ7l63XnxT0JSRurZucHQA9HBHbaji
	rN2NyFvWaUmcvxoF23UPa7hKjp7dXZs4jhr7pEmJkxlrx/onzPnXJ5PMNhecZMYRqOU=
X-Gm-Gg: AYBFou3AFpRa6D61hIoxzjbake9/D8CJn81PYGA9E/wTrqIMFxCFquJVbx/TFQpGWyd
	YliQJcrTCzFwE3m5OJC8BIppfT1RRhzDQTOsWETL7rEIi19SzGzCOiiov+hDDO2U9GkzNSnDn5M
	UEEZ3vCnNR7Ga2uu3XWXzDX9BAgJn71FLcOmFxl3+71AFaCDKEhMcObq18aWDKP75PB8G8TEqdn
	MMlTr5WoyLpfTeC9B65DYz3aEpkkDYkIyaR5Flo3JjB45lPnq6srvRP0ndQcICoftnihRUq0TDm
	PZpF+WHMumCHA93Cki5p3cSYMjF8bhhQE7aV1PrUz5idvAFOqg7h7w3GAaEU0AvMZPL2HOdUpJd
	+zHuNwzp2VVuOS6KTkaWOAuXsSiETsbSY4Zzof0VMYFg3AaGzJZpqo9qjKPPYjnyoAGlVzsfnsl
	VMjDAMRqxFxuEmNuSIBx5iQcaTF/n8S6LmNdtuJ8sXvtXoZRC8yK9Ed/5L2GY=
X-Received: by 2002:a17:906:6a13:b0:c29:97e6:284e with SMTP id a640c23a62f3a-c2a165561damr161932166b.13.1789724470414;
        Fri, 18 Sep 2026 02:41:10 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc683csm37937066b.58.2026.09.18.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:41:10 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:41:09 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tao Cui <cui.tao@linux.dev>, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from
 struct mem_cgroup
Message-ID: <aq0HNe5s3zvOnM_I@tiehlicka>
References: <20260916125737.1095414-1-cui.tao@linux.dev>
 <aqxMk6yaiFHeeAAg@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqxMk6yaiFHeeAAg@linux.dev>

On Thu 17-09-26 13:26:40, Shakeel Butt wrote:
> On Wed, Sep 16, 2026 at 08:57:34PM +0800, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > The legacy cgroup v1 memory controller has already been moved out of
> > the shared implementation at the file level (mm/memcontrol-v1.c) and at
> > the Kconfig level (CONFIG_MEMCG_V1, default n since 6.11).  Its
> > per-cgroup state, however, still sits as individual members inside
> > struct mem_cgroup, guarded by #ifdefs.
> > 
> > This series isolates the deprecated implementation from the shared hot
> > structure: all v1-only members are grouped into a dedicated
> > struct mem_cgroup_v1, and every access goes through memcg->v1.X.
> > 
> > With this in place the v1 implementation is self-contained: its
> > interface in mm/memcontrol-v1.c, its state in struct mem_cgroup_v1, and
> > its eventual removal becomes a localized deletion of this struct
> > together with mm/memcontrol-v1.c, instead of unwinding
> > ifdef-scattered members across the shared header.
> 
> Sorry I don't see any benefit of this code churn. The code is already behind
> config. What exactly this code churn is giving us?

The only arguable upside is that this would make it ever so slightly
easier to track v1 specific stuff (once that s@v1@memcg1@ or similar).
I am not convinced this is sufficient to justify the churn either.
-- 
Michal Hocko
SUSE Labs
