Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0044607E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628393; cv=none; b=oupTQUR6eOKzjnwtvYnE/TDWbM1l1vYBvO4coH0fNu8SAMd/ZA4OWbEUwJe1Qv0RebjgqMiSbZ7Q5oxW/8ACM5EY6VLHdHJpRrvIY0F3TkB/DUKH8abY1p0ELTEALclOddM11g7sKh4brcTeNFE3WZQhPeDI1GU7e5nHtbNtASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628393; c=relaxed/simple;
	bh=l9ouYTKAsdBiyG8C4/DkIAiedWBtqdMcVbG7UtEnuYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E460EV4wlgR5T62qwVipNcjcFE+XQ4rLhT2WKqVusWdPR0Bc5ltr34VPyO4oISvP+Pu9usNOB82J3FTH8U0uPBclx4Hhyh9fRa7jwOwRFBXzEcoaUQ+mAPkNEhkQSchFFpuHulSqFqPGj/1XBRL6D7qm4KpRDwckEC5cEk7w5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BzM7bAqO; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BzM7bAqO"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so3588971cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789628389; x=1790233189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKGEnw/rGHEkMgptaV8n9ekSmooVW4BhmhAnYjj/TSI=;
        b=BzM7bAqOKiNtuFqdaJOiK4P60cmejgKbUQqfpkOG9T9Q6EvNSXQrS/ganlIuxW6Y5P
         dQl/NhmkzS1Yx/cJerTcPi1I/wmu+B8gOin9RlE0yl+nAKaf8oLniQkN+PP589rwS1BH
         40daoaaL6vheHw/uGLTgmrVkdYi0+g7goR1QEH1aPmQay11ar8vD9D4SJUKqBLiWNXBy
         T+W1S2vwjz+ZCJm9ACu1Ux0Wvqrqe9zb51Mkq4Oih1sYXNx/vpSA9u3LO4U3bhR41VCn
         e1cFw0C9bEE9wrGfd3+E+KeSXCUtMuXMopZyzGD3efht33Qt+vxCZu/ZWovM3NEKfLLZ
         mBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628389; x=1790233189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKGEnw/rGHEkMgptaV8n9ekSmooVW4BhmhAnYjj/TSI=;
        b=v3spLWTaYvrko2/nL4VAWhy7oH+hrcV7Mp0L6h3egFF43uo0FrVT6Ujypp6I4N/IWH
         BtJcJoaR1dENjH0UMfY6Yc8Nl6QHmnxdAdRT6/vACxcy0RUR3piCWzIie8CXjpC9zGcD
         mdciDW4/6BSLwSqEkYgoRrnU8bZAVKBIabTMJApoT2OmRdbSbuiq2jbBdd8MWHM3We8n
         B2swI0zjnY4cFeAyKHNqtOW6ByO7WMRUR4uSEEaseJmbn3UQ9T5Zbomy+QuWOuCNZjJc
         lOat5nl/0GvCwN/De9/KFB9hbwu6la2HmMHeHWm/2Se1hlGaTdkItnWtD5E0XLntxcaE
         +rIw==
X-Forwarded-Encrypted: i=1; AKwUvBzN37VRWYtAnRPcmj7ZiBW3m8vkvBqVQLLVBJzFi6Xp3p6q0+kRUQ/wjrz0y2Z2ljsn5f4e1sxrrHn8WmM=@vger.kernel.org
X-Gm-Message-State: AFuF++mHPKMP9pIT5CLF+iZ/MZ9WwvtunbUEMWC0n38K79XO3qWXXbLk
	JVKD/3K7kT9qS5E/llhY7xv1v9KzTLkk8Q5MpYhCQ7p01WszWz9b4otkXhadflK9ofk=
X-Gm-Gg: AYBFou1VT84I+0cu6Td2OTyO/WGYyJUd07iVv6+PqFzPMuzBh+X9Yeyn95XVIAVW5iK
	XzHfFQL6sndfmfHlePG2n0Q6Gpc0koE0G9QRCVJ1dAGgpZuK4y7HkFDL00WQQDDbSXqRLyLv0Kl
	Z5/AWH3GC/amlYhaupm3LIMDOh1lMn783uLk3GXZ9MwdUlV7Y5DVW7JfSn6rAOobKByWhyi6hQ5
	DAvZxsfEsdvQDPYpbVvuTL++/lHF8u6pKpycv3JxpW24Utu18oRFmPFkqrmDt/SKRvXZVCnmIh1
	8rky71HXKdnWC4eRV/qiQYh4SpAr4zSG4+B1jTbghGwcmOkcYBIfEChPd7nF/FevCnpzHez/tRD
	S3xqLz3myFJUnfEIUwmpI/zTPlia1VkeTMjtpu7rB9hdrsPoy7wrumOMhRvQ7wz4X4V4lKRSzDK
	fT6fYS/sh8KZyEkc2wsft5EeweA0hGnP0oVtJyQELVA15CGbui28i7cpJUze0b9ywuUwmmuLfFv
	Cohlcy861+y8IQ2cUwYvE0CLp5FWPZwO2AYzGY1dQU/6dHWnkbCvOQ=
X-Received: by 2002:a05:622a:1388:b0:530:ea12:caad with SMTP id d75a77b69052e-5327f1622e2mr94436001cf.50.1789628389177;
        Wed, 16 Sep 2026 23:59:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326200b8d1sm41492531cf.12.2026.09.16.23.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:59:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 02:59:46 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com
Subject: Re: [PATCH v2 0/4] sched/numa: stop VMA scan filters from gating
 promotion
Message-ID: <aquOLzXGdLmyBaIT@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260916223525.65ae1628b1457a716efc298f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916223525.65ae1628b1457a716efc298f@linux-foundation.org>

On Wed, Sep 16, 2026 at 10:35:25PM -0700, Andrew Morton wrote:
> On Thu, 10 Sep 2026 20:18:22 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > 
> > Functional observation:
> >   A 20 GB hash table VMA that previously remained entirely on CXL was
> >   split evenly between DRAM and CXL after the changes - and tier
> >   residency tracked hotness.  This was previously affected by the
> >   stavation issue caused by the "unaccessed VMA" filter.
> 
> This seems very significant?
> 
> Why cc:stable and Fixes:?  Is this something which ran at these sorts
> of speeds before the offending commits?
> 

It's actually that the changes functionally broke numa balancing to the
point that it just became completely ineffective for very common use
cases.

We only didn't notice because another bug:
https://lore.kernel.org/all/20260629163337.1264881-1-hannes@cmpxchg.org/

hid almost all these issues from being apparent on large workloads
(which was differently horrendous - that bug made ~70-90% of some
 database workload memory ineligible for tiering)

Once the shmem fix went in, all the starvation and filtering issues
become more apparent when the bandwidth numbers stopped making sense
(see above).

Basically numa balancing has been broken since 2022/2023, and anyone
who has done any testing with it since then has been working off of
bad data (incomplete VMA coverage).

~Gregory
