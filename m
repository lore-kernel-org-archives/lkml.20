Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870C3E51EF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768182; cv=none; b=UcpwGQGoG5ulIjsYgKXHpQ/EUrWp5/p2R1d+Tz27IeuWVgpw/gTsFKxuRuuB6UEQhR71hJWGsBv8tIaYGVoapRYVya4PAldXjf0JAOsp4QIVMCp39h02aJXeV+T32iqypAguCU5frtnbSK8P3tWF7ZrGjVv0MMzSsa6bOqE0CRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768182; c=relaxed/simple;
	bh=90lxGUi4HpWlf/EhexuYqneIHbc9brTEUewdQY9aLWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztww1VgYaMwUgFyPdsHnEDk510S/dOK/cq4ucu7/RMeHfbt0h9f9bu6FbUwZX0rLe2PkDh9PHQWgBfltzBr9zFU6OBEHi+l+cnIOTyLYEqNxa6YSnDQ1u6Kz5mfSqMj469ToCDoyYKTdUN+FbN1n++wEj5717WIkQxfh7W5VAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=doswUH1i; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="doswUH1i"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc93e00so7364256d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789768180; x=1790372980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBAPd36PjG3FCsBphgth6vU0KC5q9QsBR+dApbvK9Fg=;
        b=doswUH1ihAk7lFDSqdzKQuYLqZb+JC+z8+eOeNkF7vNFserzPza/sv3+a3swXtG3Ub
         hCaIvl34SHxgSq+YxZNfeUJDCaz5UsIzRfMYKbXh5U7QlGmcIpHf1HmxpuyEd2b5FgL1
         GzR2jMHGMahEHs0nlYrNbVtbdGtrQvNQoF3Br2yDahWjZiszpIe1suaUEfDoNZi46gkF
         eKVBW3SDDjjP+cQUlZm9j8QyEjuz57HjrtLMRXIO8sujjjx1/7hhVrynVkcAAjpyxrsv
         x9HBAJKSU+2ts9dWfEJihpOaEwMc1Dv2xVT+2Hl2bgZp+wohMhemX4H6AXhKBiPeyNjH
         VQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768180; x=1790372980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBAPd36PjG3FCsBphgth6vU0KC5q9QsBR+dApbvK9Fg=;
        b=XnDsnSd+hvC3K5N8mxj7fgt4GUxNwl/F7CP1SjYsFjbCC5PZ/R4QPB3sn2yt+jUWZU
         iJvALtmA8WWracYSw+yesIpqnXPU/wts/1pELNCm2Y2VOurXf96pNxQMWG3YTD0T0Xvv
         4CA/nu5clZ9qMKXfHZ3OM+Pb62GOAmNN5lgtAOBHM17sfHwoz6qmSDZPB86Ztig9StTx
         Dzd0hjrZG9uKHQ7M1GxThvvJhrZpHQcocsZPCmcdiLRAnvPSI0/p1OpHRPSI/yCLwBmb
         Zlh9Qc6moka5AyllD0xsY5cFbbmn5KNvpB4N886Bm4HDBahjCWreATeWZL0ms9TwwqBG
         0kWw==
X-Forwarded-Encrypted: i=1; AKwUvBytJQ1rXot/XXjT/lhuR+d4WB0VIbClSqaEqvHprk41Wyw0H8NcsS8su0XNO4cyqCrQxJnr+502IvPzJlU=@vger.kernel.org
X-Gm-Message-State: AFuF++nPTeKsqx5tAkVVHjE6cM+g6kRZvvOFAIYIXOZDTlW1yQxSsQvh
	JExlb0uM3SGuQwWCE3rS2A3ThQ+mBwGty2PogSua7uh2U7pfwaP3aD7NlqXedMpoWkg=
X-Gm-Gg: AYBFou0TubrTOVvFHZRZ3pbErt6QjrwPRnSsfrD7ry/NVx1tleQWq2S9NVvU7JYbb7r
	xCQsi8/av7t+oWHDwPqfR56bzJZDhG7PfBJmnrqoPjo/tJgjSNY/nN0AeRqzLbLPCwdUco7XURR
	MfTwEohl53UKjwdjZPT714WTzPj5Qu9Ag62mSyOalQbDWtJzcWb1NMaWhimypUGDKI5HwL/+tEY
	tz3fPfuKACgG1lx27xOI7UomtmOioD4jrD/dB6nvUQ7e/eBNZL4pigaRY8ytkMWEyvNzUEFw9q9
	1G7qQ/uZVhb6Y8L15XcrvnnYrS3UI5qobiAncIy+XoA15D8xRvDZ3TESOibAsptgdQfv5J9hlBS
	jNiQtcamRI2Jbmgkuwjn7DD0HR5pKMQb69C6t81gzgaxC6F2sP0blUHxVHt780ipzVJVfxfFU68
	xz2kY1wRL55Ack/nm+mBdF+wR2n5/Vpwc1fvTvoHLwE0i8whKyTAkVmrRczXnpGEbPY8HDctRDt
	FvU0fp6u8AgbUdlevYPL1lRHiH5+JadEaw840ecAi0Awdlf5GMqCmM=
X-Received: by 2002:a05:620a:708d:b0:939:85e4:44dd with SMTP id af79cd13be357-93bdc71fa8cmr573128085a.36.1789768179752;
        Fri, 18 Sep 2026 14:49:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaf3e7bsm43010485a.30.2026.09.18.14.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:49:39 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:49:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, ziy@nvidia.com, Balbir Singh <balbirs@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm: refactor find_next_best_node to
 find_next_best_node_in
Message-ID: <aq2wXTblglrP6F3o@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-2-gourry@gourry.net>
 <a817fe59-8549-4e5d-9ac8-ab5cc9e214f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a817fe59-8549-4e5d-9ac8-ab5cc9e214f7@kernel.org>

On Fri, Sep 18, 2026 at 10:42:12PM +0200, David Hildenbrand (Arm) wrote:
> > diff --git a/mm/internal.h b/mm/internal.h
> > index da14c56fb24e..1519dd21a900 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1133,7 +1133,8 @@ extern int node_reclaim_mode;
> >  
> >  extern unsigned long node_reclaim(struct pglist_data *pgdat,
> >  				  gfp_t gfp_mask, unsigned int order);
> > -extern int find_next_best_node(int node, nodemask_t *used_node_mask);
> > +int find_next_best_node_in(int node, nodemask_t *used_node_mask,
> > +		const nodemask_t *candidates);
> 
> Just curious, for your use case, wouldn't it be enough to pass N_MEMORY?
> 
> Or do we expect to pass other actual node masks that are not derived from
> node_states?
> 

That is the base case today - and in fact that's what's hard-coded
in the current logic.

For the private node series we will pass:

ZONELIST_FALLBACK:  N_MEMORY_GENERAL    /* general purpose nodes */

ZONELIST_PRIVATE:   N_MEMORY            /* All nodes, including private */

ZONELIST_KTEST:     (N_MEMORY_GENERAL ^ N_MEMORY)  /* private only */


the ZONELIST_KTEST is something i'm still working with - but it gives us
fully isolated pgdat structures that allow a KTEST to treat the node
mutations as determinstic and otherwise unreachable by the kernel
(because the kernel outside ktest can't select ZOENLIST_KTEST).


ANYWAY...

I don't expect us to build hundreds of these zonelists - they are
expensive to construct (space-wise), but that's largely because we
haven't needed to optimize it.

But you could imagine having a custom zonelist built on a subset
of N_MEMORY so that you could do like...

for_each_reclaimable_zone(z) {
	/* Reclaim */
}

and hide all this nasty zone business from other components of mm/ that
really don't need all that complexity (at most they want the LRUs).

~Gregory
