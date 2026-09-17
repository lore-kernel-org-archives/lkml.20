Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC35187E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663169; cv=none; b=jZPruAs6rwjPELUSuFwbuR65DFeY7Z3sTSe0sSGVw+IbuFUj6vYXRtMIYMV4CQks9ekGeP6aRyuRCsxZXWJTYz5c8LSCeLtEkKMP5+xNmOogysDKsOmj3ADf5Zx5IW2ZpzoOBJDCyufL69JXYJVIK3JARIzAFjVqkNAYq6FRBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663169; c=relaxed/simple;
	bh=IJxxGucmX+S/ianmDruEL9wFhGfEfpxOR36b/1+SnPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCNMLih050444Ofam+vMEtvQkpSORgDXZ3hr65FBj2j1Y/kuwQNQGKbPY9l4aVVailQI/pPE6aAA0VQJwXG3YGD+VB6n6hTXg+TAa4hN0F96uCv2hXE4G6vnTYbsiipGdNW11zAdzEB8K4wCs+xXNoYVtyeoqOoG+lb0UkVZpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rhcMJPet; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rhcMJPet"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc71so9033331cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789663165; x=1790267965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KAunQ0cM3aakk3XhlasjaszZbs3F0O3wQSsFDCWQw2s=;
        b=rhcMJPetUieV0UG48w/mx8aXY1yuTaDOh9glAiHtyR+VOF/TYIi9LaUSceWwqy7rjD
         fXYm1Un1VMNSpbhSs2iLDjZcNp8zqbQBGhaL4uN19Zow98iZNIgrQspFdGzeeiPIkRBi
         gaPZTTUDLvWh3R1Xhrqlo3t/1Q8Jt9WVPok8VRtYsqcGe9il+SXenl3AYrmvVWecpXPG
         b+/27ARTY3zVMzNP5RZl2SnJ6RO9BIC57pTNQcjGl32KTIc1x7Ae2JNgG/uc2/WSlxPX
         41e56/y9yNty+tSqDg+/+ZSbtQUE6A0dZvGKJo6tDF0+p5RhNAQyB01CpYUJt1gYQ/BO
         SLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663165; x=1790267965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAunQ0cM3aakk3XhlasjaszZbs3F0O3wQSsFDCWQw2s=;
        b=r0zC4gQLbMTjRa7DGa5yp/elwZBJMi0DKObGWOHQvEl4Kvz8rATRXLsJlUcbOYo772
         RHOjiAe8cm2BXbJd49D2AzRnSqMYcjMf47rda3R7f6g+nZtgYjAuQgjoftgM3j6sBOFP
         uSI9RXTGnnZ2hA/F1zYk3+ju+iZ0fMMCbU2kQv5DHuBLwOjMIZrYPXZacg0yrm8vXVaE
         SEDeBHlnZ9ucSkeEuZA3xxrDS1qVvX75SgkIqIILmf7Zh9v4hLIW5R3OBaZ0JmenSajB
         WFcOpkmOCgfBnus1IuHqDh4wf4CbE/qWSjc03cIE9WBSQCMaAjk9YBkttUN3dfUGNjLS
         sjhQ==
X-Forwarded-Encrypted: i=1; AKwUvByTGDVRe+AgMi5APCQsvoaAjTrPiwmFn3i40NowtuSj04STjSIYvXZxPyCg7HPTC0hlEyEAQTa6g2G2AII=@vger.kernel.org
X-Gm-Message-State: AFuF++lwsJni2ocCSzO/Yj9vbuKUrK4/eHeJgpj1t8yqh0wqVHLwsnCj
	jWKZRngiHcY7jELN3olc9szBVE2vtQyTMfN4ZkSIP88AuDmQJ+tuAXEyKGa7gQfXCo0=
X-Gm-Gg: AYBFou0HLJxexoAKlWTNSHvh+SlPGC2PpGki1nYpG6n0FiRFBDXf4rdHBtCGoUtTcaP
	YCBvMhrxBxjl5q6+pjkhMuilUYIvC2waMdZa7CkGboArZVTpPs6UIhavX7EdFoMmJbejBTJlfeN
	tcEqpvyZaU1n4Csd15Q60mNVDmKy8LcYkOMWWgyraADZCQiNF/k59pj2MqXfswY+OikADyQAGoO
	HePewfRyVetT1DIZYSJZtHV+cB/1sx2F8ggt1jiKOMOTUid1DptKTarH7m79S/gXMiOOFy59Vnp
	M+z91PVER4U58aAJhCEF/43HkIIGDxlYDDC1ZviWYmDD4olAU6Ys+lKC5Wg7rOo2ScUN6M/V7MM
	RYk3fkeSdViTgl+xh7XPfGkW47+GN2p5UHWvye6qBGAdmjl8ZcKRDc2bRvDvYb1+iYH6KqQLoWx
	2UozrEf3oj+9CFTs8N1+CKoAD3pBp/JDmAeE0nfQvc0AiOWMrHQilGekTXxMDjxBPOJeEMukqoz
	v/vk4E2ZJut5h3tGDsRCpu3iggEUCfK/jysp9aX5hk505yHQ0KD7ls=
X-Received: by 2002:a05:622a:1f99:b0:530:dcc7:aeda with SMTP id d75a77b69052e-5327eeab4e6mr112125271cf.40.1789663165269;
        Thu, 17 Sep 2026 09:39:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204ad36sm53765271cf.18.2026.09.17.09.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:39:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:39:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm: allow shared folios to be promoted to a fast
 tier
Message-ID: <aqwUxQRwbhfGgg1J@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-3-gourry@gourry.net>
 <20260917160827.GN4121339@noisy.programming.kicks-ass.net>
 <aqwSBkeP-Df2GBLa@gourry-fedora-PF4VCD3F>
 <20260917162324.GP4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917162324.GP4121339@noisy.programming.kicks-ass.net>

On Thu, Sep 17, 2026 at 06:23:24PM +0200, Peter Zijlstra wrote:
> > Would be nice to just have the hardware report what's hot (and how hot)
> > rather than depending on a software-heuristic like deriving hotness
> > from a page fault.
> 
> Yeah, there is/was this patch-set from AMD that uses their IBS counters
> for this, but 'ab'-using the performance counters for this also has ick.
> PMU data isn't ideal either. Mostly they generate a ton of data that
> needs to be analyzed as well. Its not clear cut and easy.
> 
> I'm not sure there's been proposals for better hardware support.

In the CXL Spec there's a "CXL Hot-range Monitoring Unit" mechanism that
will report the N hottest regions of the device.

Not sure we actually need this for the CPU-tiers. LRU already does a
decent job of recording coldness.

I think bandwidth data provides the missing glue between the two.

I've been a proponent of just using bandwidth data to drive *when* to
promote, and let the devices dictate *what* to promote.

https://lore.kernel.org/all/aPJ7qe_2xznFSUMZ@gourry-fedora-PF4VCD3F/

e.g. if the top-tier looks under-utilized in terms of bandwidth, get
some chunk of hot data from below and see if it shifts the needle.
If so, repeat until numbers stabilize or the top tier reaches
saturation - otherwise chill out.

</food for thought | ramblings>

~Gregory
