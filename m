Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F6392C5A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105096; cv=none; b=gxOZjQFrzKvbpg1i0WkBvuS/4bQp6Fnvr4TXZEcvAHyoLTCgN5Wejb7AOIOtYofL4jLjBSjwtCo3KsN54QAh87NhMVfV2cuGdxsjmNd2UnWZOgYeoN6WLnLKQW8+2Ut0KrlB6KCKbgpqv9h7VmlHUS9YUvyxxRNkz76TWzhRlS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105096; c=relaxed/simple;
	bh=tLluc74BtFIEXZif5R7YprcAZbnZaygcxvkypf+brYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+JLb/3kjZmwgpdRs8TtCIAS1nFAgGrNLUbgIhErl4eRjBuKQLmEnAq0pWdqNgNzKVQInJMSDSqEc+Z1TSV3opjMZf24XEGMcOvzKiG6GfC5X/WAV2cZ6IExK/q8V9pkrpGS/yB2ZOnYgNyb30Xxvl8tsE72zyoxa2yXTY9NjGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=u0hE2LBQ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="u0hE2LBQ"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so47914485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789105093; x=1789709893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqqJPfwVD9qfgrw5ni2b4uR4Rq24ucUxHntuj8sDFZk=;
        b=u0hE2LBQ/cyURpJcZkewr26SY0f8LtuE8jNVpIAaTw7kWRcBopGqGUd/ykVH2RXjza
         QHxTm96RE4+GyfBEitrLXdQiR9CXEL1vj/66jdRMNzwKlMVjm5Nk5KEh9RVI+rKAmcBu
         LTel6S7Krr3HWSAGUfaQ64rZxOF3RWtckVsKjwsIwnRd4ZhB0vDpKsJ+uBYCkHL5NuWF
         BmLIKQ2A50I+9pcM21y4TVDgwLXa8jHC50GXmpDJdDDoMkoFdePQUSsBXP8m7cg4OXkF
         8ev+0ZVRpvvcIERgRxiDDA56Tq7iSSddomoKV9T97AkidypvaKAxhg2XAWNIPUOpNLve
         wmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105093; x=1789709893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqqJPfwVD9qfgrw5ni2b4uR4Rq24ucUxHntuj8sDFZk=;
        b=SIvVrisLvw9zRYFKboTI7ObxxEc2yaO9Hr6V2HcorJUsR8pQnVKzMBed9NaG4L+lY/
         uKBsOA0H82n+2qhqAN5AYBNiByxne7sqjbdDyqOe3vS3ALmLt4yWsJtSL6zYaMMs/Atp
         Do8HHkkNZFK9rOqCqQ4ldMQiP459MOUyF7sen5UsP3AO11kr8vHHWUzW4ajgp6+OYJDM
         8Oi3mG4IMmsHyfVxGV0f4/8VCfkN2LQ2dF/XE2+VE5hrGIgVnk55pK66E9Z0bHch2nDm
         6iMiplQGSuuDGnlR/uWDrlGuCaeO51vMAbZfCS4O6JKv7/Cq3QSm4WrbZ69z+byUsNRA
         IPEQ==
X-Gm-Message-State: AFuF++mQd6ZWrmxdKoWfOhw09iRBwWJ9NWEuTTiTj3O5z9/L2+Xjn8cx
	CARfZvympvz0TuXIfxytRgpEJKXiKFNTe2v1TsL1IhBcK1gKr7puW4loDOQuUbhKTsw=
X-Gm-Gg: AYBFou19BCfohs1+hIwZcv+0WXKB63nD4V6SbLRHGSfcMRKbNt6zr3VgdmqzWFdH1St
	IKzEyWtbZbTKQpU8+fkKA7PWTWD+nVmttaXb49LUewrMTMNuIAZIp9FYNHFMdAXj1KFJfeQ3WQJ
	Nx1Wxal8FpdHl7gsQbxBYqpXBdLPu3ASJJ1hRZQRgC+3E8+kz9ngKul55FnO7suE3fyGUXMKTzf
	CmVY8nHUoJQG8mJio+LziSltOiFNJJ/hpvH2nPRT6NLY7FmRRKg77lvAhTxsjSfn6C26msz3NpH
	JdrqCk0RTjCz9+K4ZijNF2y/tpz7f8RB+gjDFuJldVl/gLN1vCkKUosytfjog2DML+SNnlWx5Yg
	E8fY9g0DG/ZVM451gTLUg8pKMohfwXM/RRgwNJ2K4yTVvinAfKXl6SmGCAQsSBNfd31FzGWHe5x
	RPZlL5oupO5kDbB7c+d/3fSxsXhs4VSzScD7FBL6q6jG+0rSC4BkMaHmZnSg8XlsYbKqtgLTY1M
	UkTANaRig3Kl3Xc5di5znJbm18TxhFJbTnbfX+LknyqNGqGv+cb7lit
X-Received: by 2002:a05:620a:4688:b0:939:a9d4:50b7 with SMTP id af79cd13be357-939ea177661mr311177385a.26.1789105093018;
        Thu, 10 Sep 2026 22:38:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f184f5sm163816985a.15.2026.09.10.22.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:38:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 01:38:10 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, osalvador@suse.de, 
	hannes@cmpxchg.org, raghavendra.kt@amd.com
Subject: Re: [PATCH v2 0/4] sched/numa: stop VMA scan filters from gating
 promotion
Message-ID: <aqOR7TY5YtIadMAK@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911001826.2109390-1-gourry@gourry.net>

On Thu, Sep 10, 2026 at 08:18:22PM -0400, Gregory Price wrote:
> NUMA balancing uses hinting faults for both task placement and memory-tier
> promotion. Several filters designed to avoid unproductive socket-placement
> faults can also prevent promotion.
> 

sashiko notes - remaining notes appear to be false positives.

patch 2: "... bounce horizontally between slow tiers" <- nonsense
patch 3 and 4: it's existing code extracted into a helper, using the
               same checks we're already using.  If we want it updated,
               that can come in a separate patch.

note: this work has some backport conflicts, but tiered numa balancing
has effectively been broken multiple times since 2022 and 2023 due to
these filtering mechanisms.

~Gregory
