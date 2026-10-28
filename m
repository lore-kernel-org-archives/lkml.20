Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194919;
	b=pDZLNuow7YmK+lGKie4+XnwEOnjNsNjPbAYahGL38Tk8bH56EOZPdbbMLbX4HwkuL28l
	 UiDt7AWf02C1H+p9PkDIG1anoA+D5WOxbNdV6Yqu8lUk06CkpWfbu0A2km9AqhVcBJt+e
	 eryl3BQppr5hdjY4vs2MsbFj1fHchIR2pwfyQKrk6gLRmgOAlrO8uP77ySgc2/MPi1IFj
	 azb1VqkswRXDLL9aaiyjQbop7sgC5qnnU5hBL4D3q3AuxmXapkrPJyO5MgUMHi87xlAV+
	 MLeuitWzAtMOVVh9RB/O3DkDF5IIRd1wjf1fSKNAPZqd7Db4qYAAgHgoanulFWBNBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=1mZLWc84btDXl0MHk8lbS2Z2QDCAWwzGK7CzWjzphtY=;
	b=2T+GJIQuuBafEr4kTXuRdKmTxUcTgYXKzG4dhOVrGffYKfTT+YouzGkNx+u19XmiCKDc
	 pCA45DGTp+YX4uRqMsVnnOe0/KbZRD97mBBcR7sfz4gFSarAA1u/G2s8b8vUHTn63/O8z
	 OHFwCJ4Jte3eBRv2BzXSTJkqz9qnGz8/JY3cB8ejnH1eLT5hT39Ojza/5y8aBOKB70bcM
	 5k4c0b+glcfqMN1xS+Y/bhGMLoeo7rkwsgu5W45i5kmcdzgV5lHYvfl4eaB8DrcOGj1eS
	 okUxXxBPhNN8WY18bSSY0SxfcDIzYXEAc7yNv+FqMytFbgma2Qtj0qwp06wN1spHYkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=MULD2iT9;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA82606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA82606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=MULD2iT9
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-535179e995bso10363331cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793194917; x=1793799717; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mZLWc84btDXl0MHk8lbS2Z2QDCAWwzGK7CzWjzphtY=;
        b=MULD2iT9vqKXxE4Bobb4BC1FqAXTg3Gac46Ovpts/VEGnwZEnZpfuDiU5ZL8Lrv+iT
         QmGT8o7KY1DdnPLq5TtIHC5FHSk4X/MgzfPVlZtpUafCc7tVjL9WqaZWwI1msn0BsZr1
         o4s1aPJHaa+4VgKQF9JLCaFX/8FGDpyn7IU/yftUj/obLa/bW29vNsjD1MtqaG50COD/
         s5p5ay4a89S7pWulkPrRwE2/LqIpe0skRIAz7wOaIkHTqTamkNRRC59He1VIAe7GLIcq
         i7QWK9vHeH8x/bkSicmubBW4We5p95MfOL/zLRHHkoVLwLdomC1dOm1pewKuH1juBCl7
         8vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194917; x=1793799717;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mZLWc84btDXl0MHk8lbS2Z2QDCAWwzGK7CzWjzphtY=;
        b=2Uj/XwNN0B4suoR+eCqRUv0Quti2ZbIHznJ35dKuWmwGKSLNHasjGjsgdPbgolyin0
         7o0TNT0dpq7J/Ik2NinoSIYiXoqiLkAb5/swXn+Crt3coVZtsfloGul4VaHyen8myKI+
         XS9k5rkfyv+5SXYEnUutsonSJpE6MItwXdr8bHkn9uT9E0zHVnB6ZoPAr4Gv4g3D/24G
         NGMrhJOwpDgz/pYfDpUbgMy0VY5Rnef9GHYjhmTfq7bZVJxynJm6uqPK1fVVjWlsnH/i
         P2lQ2RPCaszFdM6MT+J3KOHsV50r0tKTga8HlfLGPqYjRu/SDamXU11sg/isEYUym0Zx
         IqjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxOqplU3dU+W4/6n8GjQHHMYw/1xR9WDaSXHrdU3/LQVKH17jp1fr1DIQs8cP+/MD/GAQzdtLA4l34pAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcG26S52mR0OL+TdMzDgkJsb1HPIk9WjIsxwhzv7Hs1/WPr9II
	U4eYijYYmtp1sTw4yv4s/OTj0xEmuKyyO30BTMxXBd8Lc0fwLkdjmqGBncMYzC/b74U=
X-Gm-Gg: AYBFou2zjBZfHxTEWCihA0w9KE76WuA/2mls0A2FMMB5Fw7jmx66HrI6kQql2WQKKGU
	Uwe9PxiBk/47V1+1P6OIdmV7nvSGNxBzta2mQuCLsnavIE5PvZ/hiq5vVrnpViJvffuYJx0pNvR
	CHG5vI8W24kSalzbXQcexxidv37buwbWaGYbHSHnQEP2YlcEuQViZdyzfVE1w/t24ruVFJI8KOj
	EPPm4tIeIG4aAKpZfvBopLg+2czoAMlBkENh8QMutLeDQl/nP8CPwqqVQHRhSIpm1uv/dRmlnxH
	kBBcHU3+VYs+S/nNNZBSTRkWbtt0T9Oh4DvsxUyJXBYOXz8UFdlzYEnklwd9UU4VkLVhhRdqrbR
	J6w+usJw+xkPb9qTDoejEzqyWRnzpcNWYvAR8q5w52PKeFG9tcPqwenII8UrZJAjtwb5hctkB9I
	+8KvKfyJ+kiZkXCGan9+lhViIhqBIQ7TKqGpLaB/rOuC6gxWcChdDWjoV+o4rrJ/VktfYrKJ6Wh
	pOFzIBweugINqJZ+d5bOI0YZYy5suArP5OgAV47IkBdVDG+kD7LWzQHxYcbLETF7AvO0NRc3+ea
	iiHUo+WqaWM1bcMm+Hne8eP7Ac9GgthXCvJ4HVwpxoRlWtTVjbIU030TM+3BV9KuTolLMn86JK4
	g
X-Received: by 2002:ac8:59cd:0:b0:535:52c:a2d6 with SMTP id d75a77b69052e-53fc919dd94mr39416861cf.3.1793194917292;
        Wed, 28 Oct 2026 06:41:57 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c96375sm132097726d6.33.2026.10.28.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:41:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/8] mm: fix allocator races with memory hotplug
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, kernel-team@meta.com, 
 akpm@linux-foundation.org, mhocko@suse.com, rientjes@google.com, 
 shakeel.butt@linux.dev, rostedt@goodmis.org, mhiramat@kernel.org, 
 mathieu.desnoyers@efficios.com, muchun.song@linux.dev, osalvador@suse.de, 
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
 ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
 mgorman@techsingularity.net, anshuman.khandual@arm.com, 
 Bessel.Wang@huawei.com, jiang.liu@huawei.com
In-Reply-To: <5e980194-d892-4b68-80fe-612c910c29d7@kernel.org>
References: <20261021023940.1940971-1-gourry@gourry.net>
 <5e980194-d892-4b68-80fe-612c910c29d7@kernel.org>
Date: Wed, 28 Oct 2026 09:41:55 -0400
Message-Id: <179319491540.2032926.7199366288730313291.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 09:37 +0100, David Hildenbrand (Arm) wrote:
> On 10/21/26 04:39, Gregory Price (Meta) wrote:
> > Eight fixes for allocator paths that can act on state another CPU is
> > updating: zonelists rebuilt by memory hotplug, and the pagesets of a
> > zone that offlining empties.
> > 
> > I've packaged these together because they're all related to hotplug.
> > 
> > *** Backport note - Patches 5-7 build on patch 1: without it, their
> >     retry is compiled out when CONFIG_MEMORY_HOTREMOVE=n.
> > 
> > Most of these race conditions stem from zonelists being re-ordered
> > in-place at runtime during hotplug.  The result is a mixture of failed
> > allocations, NULL dereferences, incorrect placement (GFP_KERNEL in
> > ZONE_MOVABLE), node misplacement, or incorrectly allowing hugetlb /
> > contig allocations on a node/zone otherwise not eligible.
> > 
> > Most of these are incredibly narrow race conditions, but since the most
> > likely impacted machines are VMs with memory hotplug, the narrow
> > condition can more easily occur when a vCPU takes a long interrupt / VM
> > exit of some kind.  I've made all of these race conditions
> > deterministics with a kprobe reproduction module described below.
> 
> What's the status of this? "memory hotplug" caught my attention, but then then
> is all page_alloc material :)
> 

I have a v4 with the requested tweaks and some performance analysis,
though i think there is some overlap with the other Fixes: series.

I can send it out and if it helps i can pull together a report on
overlap between the different Fixes: series.

~Gregory

-- 
~Gregory

