Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930352D2CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767746; cv=none; b=Bid0wcM6k3nxQgjhyWkyIPLwR8EuJBy+LjKiVfcNQWnq9uhXZddyh4751snWCNyVLmvFdmL3XfLfkam0eFlndxc8rCwVSD93WiGelqu0DAq5JM0ce45JGrw0uLrb4CRChsXTVF9TQDhYcXdl08Wgm1ouIdVe/IDmkY8Hns2vXvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767746; c=relaxed/simple;
	bh=Y3x/y1csBDuPAeimpplf8TsnbhS8v0T/+hV6HCvmux0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAsElyUsAh+q8ttXvHLgZQkcpHAwaUaaJjMXMPqV9bvnFvu6gRVvuhMr2Ms3msIS2ccRE+ML+77RDaNaVHwTsDFMiRKI/o0ogxkvo9llv7Hfz/0npnUCqd00UDFEfbyNce+KW26dq/I0KEeaaGOhR2dvWBKLl039mSaPJ7I8mGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AVwANV3X; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AVwANV3X"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd8so10455541cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789767743; x=1790372543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRywDyqUWmgr7b+daClWkuC5v3z0QnlFIvvPsPbWZ5Q=;
        b=AVwANV3XefZzIp2achRYHrJnIm2m2B1oEPDGlufAi3JicLHiUjyntNDczdHN+5JAvJ
         +P4ATkKhQsR+9bAdfgdvkzSSOt+ktSscn8/KgjYvMZCk0IAxEzctbKZVh+Qd//gJJRCP
         gzlMOJu2o3c55Pfc/yoYSKIcrHMRacPhHGPdTXkRtJoUexLwJtii5VpyBQFnU02gD936
         ud+2eQRlyKSZkQGrQ4ytFlDlZkWRuUHa5sUZPTXuIlAdMWWYSbHoVRzCSNpZEZUBeEqc
         iYF1g+JwzQWB/prAOR3tmWdCtbkmsTtXTUaPKeSGZxiFszM73uIXp7aP4PGs7HBWkD+a
         tp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767743; x=1790372543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRywDyqUWmgr7b+daClWkuC5v3z0QnlFIvvPsPbWZ5Q=;
        b=iLJpi3T36Z8hupqwwTHa5dQgB3sOOymDdeLxpXcfLu83EMCdaO6WotVCcEUz4J0nqI
         W/PpzPts57JOyejvt1THxlMKgrjwmRP2BI8y3JovF/abeqiY3D66yurNSB+3KGrJd+it
         yAHcF5Ntr9+TUWYQmG4O1lAVO3fh40yNqjtIN190sHEoCCn+MaPAh24L+sbOQFqEr35g
         5EQTJRCr/qyuznURQK9m/OanWDfkPWexbEqlYpv3aOMaTqEii/syxR4jwbwkZTvhL+qB
         h1xbZE7RM1rL/QqMv3XMZ7KoZaPxRkJa9/iuGdPxomA89U/J/unFfkFnaq8mOWQidfsY
         dpwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWbpH+LQ/EfOLvvNXNAYNhk/KgX7ka7GODR6sBUo7FNKICjAJamh+JO2C/TI9w4Zg5rcLQGCagUeK2//U=@vger.kernel.org
X-Gm-Message-State: AFuF++k9av6bodvHgP6OfWB8En5yuvx3aG1njynOfctvcib2kOt/bEZA
	R3yEAzF0YqW41aBIIp/CKT+o3nLd1rQ5ETmiiUBeKKY3GFIgZZ+FPNgStmEir+jjfPc=
X-Gm-Gg: AYBFou1+tU5Lvpa8Bpy+pJcWq4AUi9GZ/2tNgi+cWsU/Oooycvuv5kDfJkNgqCXs9lm
	I3+Qc8pk6N7kJB6rK71Y9QJ4DNmwh3sT6+k16gx6AWQrGLppHuIILsezHL8HHc4esp5kS3TNeF1
	cKjK+LUk9IqCLTMw45E0DsGncKm2OmEypsg3S0pK2vk6ZyT/xUgN5DLrLtlrS+d4rbYqOeoJbkL
	Q+8oVEW7BNlJD0E+aCeoxR12OI/vFlQXOVyk1E5G3HvzhnHFUf6gyXN0DMKOt0Alcqi/qdpvWbK
	svU/lZn7OM9D+FI+e+r58aWDvxy0wSAWNqZAQObxeigu+2gotDbZ8KGk7QXcTlxSngBKcO8yCGa
	+NEwAPcyakd4j8Hu421gPqTjRk2BtKehXIvOmNWSiNI/9XnbZaEQBhZvFdMqomnOM0M/rXK0qjP
	pgjg0uSw3J4/J01Lfl9oOYQIBSde6hZzQRYoo6KLcUBzRQ2Ere9+yk/kSlzhQbmfUtEjzYhGeT7
	Gg2mC9y7JkvrHd1TlScl19WI+TE9+jluBPyx3Y4TZtkX71xL75IYO3Z6k5VsMwbVg==
X-Received: by 2002:a05:622a:6094:b0:531:11ac:23d8 with SMTP id d75a77b69052e-5329e444f66mr69085321cf.49.1789767743500;
        Fri, 18 Sep 2026 14:42:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae750944sm6431301cf.25.2026.09.18.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:42:23 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:42:20 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"ljs@kernel.org" <ljs@kernel.org>, "liam@infradead.org" <liam@infradead.org>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>, "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>, 
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"bsegall@google.com" <bsegall@google.com>, "mgorman@suse.de" <mgorman@suse.de>, 
	"vschneid@redhat.com" <vschneid@redhat.com>, "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>, 
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, "nico.pache@linux.dev" <nico.pache@linux.dev>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"baohua@kernel.org" <baohua@kernel.org>, "lance.yang@linux.dev" <lance.yang@linux.dev>, 
	"usama.arif@linux.dev" <usama.arif@linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"matthew.brost@intel.com" <matthew.brost@intel.com>, "joshua.hahnjy@gmail.com" <joshua.hahnjy@gmail.com>, 
	"rakie.kim@sk.com" <rakie.kim@sk.com>, "byungchul@sk.com" <byungchul@sk.com>, 
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"osalvador@suse.de" <osalvador@suse.de>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"raghavendra.kt@amd.com" <raghavendra.kt@amd.com>
Subject: Re: [PATCH v2 0/4] sched/numa: stop VMA scan filters from gating
 promotion
Message-ID: <aq2s9R9I-Y9D3tx_@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <DLIQQNUL2RTD.IGN8MYHYMW1E@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLIQQNUL2RTD.IGN8MYHYMW1E@nvidia.com>

On Fri, Sep 18, 2026 at 04:56:34PM -0400, Zi Yan wrote:
> >
> > Tested on a host with 768GB/256GB DRAM/CXL.
> > Ran 2 ~430GB database workloads with large (>300GB) shmem VMAs.
> 
> Do you just launch them without any additional NUMA control or NUMA
> policy configuration, like using numactl? Just want to understand the
> scope of the issue and how well the fixes are tested. It might be good
> to have a list of expected behaviors for people/AI to check against.
>

We found these issues while testing fairness controls with Joshua's
tiered memcg limits patches [1].

We were seeing very lopsided bandwidth utilization between tiers.

When dropped all the memcg extensions and tested these patches by
themselves, we found that numa balancing was completely broken -
starting with Johannes' shmem fix [2].

Otherwise - No other numa controls are used on these workloads.
  - no numactl
  - no mbind()/set_mempolicy()
  - no cpuset.mems
  - etc

These fixes impact the fault-injecting side (spraying PROT_NONE),
not the fault-handling side. So mempolicy and cpuset doesn't really
come into the picture.

It's more of an internal-consistency issue for numab itself.

~Gregory

[1] https://lore.kernel.org/all/20260807202059.2620949-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/all/20260629163337.1264881-1-hannes@cmpxchg.org/
