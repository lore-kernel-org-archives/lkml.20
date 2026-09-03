Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE04B1469
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453983; cv=none; b=grUp8TYCiFb0HgTys4bB8s57CN+YPftbboz4Z0BfR4TYB9gcUZp06pcNbLQV+bDwryJ6Z8UOKCB5diYaYsCx7nydKiyuwUDpClS98iTziiDfi0wEv2ABiIhnqhHjASC4/S1+WpWSK8DeTh6TzHg4Z6v/j8XqeJtX4hE9WO5EW3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453983; c=relaxed/simple;
	bh=vWECLOHqp76/jcRzgaSPx5jKUBAi0pQ1KiUOsKnqEz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R07ZonaKLMSmoRECJx2aBpLHV/gN3aLex7XDiWiA3Mg1bYSIjf1TNHSLHtO5eIpW5OH5VDP4sJsqzxu7LfvpaOjavF9vGryqM57wMbOuDfb/5b/wx1PggN6J5cILkB+vR9Fzz1SGNiPMMrxVGCd6IgbB7XBbfMkpMsacBbHElg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dUi1+ZQ9; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dUi1+ZQ9"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5276d598b96so1157031cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788453980; x=1789058780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DdNX6dTeBhf9TPydQSxz1SFFzrTi4xL3L0CTsNHdKsU=;
        b=dUi1+ZQ92mhJCDytpQOcDgmBr12Nl+BcF+o/q9HY+qpSA7cd06kIcU9JRQetqPvhlH
         aBAp697M/HM+g+KeKbZ3JYVPfHhkpTWQYZKjXFrzjZK/Pz6BhqacNtXKZx66aLmLmq/s
         yKgCjQOHuJY04ySYB5mZ0hvyKSqzAE/LDrw9V5wAbQZXdogx3PpaD88+jVFFTTPziZJw
         DEfLMxDoWsvXabsTsaGD8t3cDShYP3hfh5J9QPtCaqjLMQNRu6bR5J/pOu1BYSQLRtO1
         TzyFcB+W6OJHP7jAq7/nAmCskOhCQXZSh4D8XfFs/kQhkNzJFjBvaJGDdN21AgA8EBeH
         Qdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453980; x=1789058780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdNX6dTeBhf9TPydQSxz1SFFzrTi4xL3L0CTsNHdKsU=;
        b=FElN5FYj85XvgDMCy73bm8R9IKza9CAg5/UPvwPTda5WTnqF2mYOui2aYwMkORxXI5
         bMEvfm7hrueDMJeAy5pwpyfkc5+UjEu9ezIXfwOMxC63K8RgDkZBQmKkeaMQQ2JOpdMB
         zWiSw2MUXBQwqSNY3Vi/dnkMs6/smH6lw2QpGEYlbFYjMJTio2eUDoqE42ATJ8zsoI11
         T+iOzsd1MXv2ZP/Yp8F8U9tcdNXzbVUYWxyk1xH/YGOP5GLqS5AEqrjbvuae5nRVlowm
         o3bhNukrk0k4jR+toz065YTetLOxDy0knq+GcgzgnhylE0Xajj4Yl4x5UksjCoUmVYZh
         mLOA==
X-Forwarded-Encrypted: i=1; AKwUvBy5cwCqsSuLBFcw5Qo210FlGbdvGRsLYPGoRsLKcY5Hr7iOmE5byEYdeBDKRx0z5rHmjpdiQOD8ILrjEgU=@vger.kernel.org
X-Gm-Message-State: AFuF++luuJMh7njz+vOdo3KiCzdi2JV5ifMZxWu4dUys4ty/tRwLu+8r
	C0laKX7zQfjhDf49OMm1jrm6nDI8ave8j21zMUz9ooj43hSGRb2HiqIEdYrf1NTUH2w=
X-Gm-Gg: AYBFou300FndNY+DBTNbNGO/585l87sDIAlVBNtgGS/iwZuh+V2H5nAK59F+lKfrqPB
	1O0J5Hzw11Y4ykUR0tl9snZbqm/vIs5R0hQThgaCsw2gZdrNUZYjipS5Jw3Dc84mr03ufgqJt5a
	8eD/43psRd/s28is0UhjAe3XYSQYie5nkKad+bIxUGys2hKlaTDu3REwBYOCiCl5fraDvnjNF99
	j9w/e4zWnQVR/Zm2GfZ9X4rPJyMHlieJrWitQIXeGkHKMNI/Rxm3OdYiqouWkH8UMmIIfJGjuph
	bA3w2T05mAK2Z+K3mYBN5tDsgPPFhvLzMzEoruBtd61pObs/0eCgsW1+JejnC7ULT3/JVS89zfz
	UgkT8lq6waGTlxRkUX6G8yNH1ixQ9GYgHafm8wtss2mdZyYXJHaLdqm83pV1mIpT8tMDuxDkzeV
	fQic4I0L+q05ho1Q9SLvTW54s1O79Y2eQUlEj+Sig6HVe8Zr7Sy8oDQRuPP8LoPh8degOvbxOe0
	9N+QD0lEpwzqKWI1KH69Epl9WBSIEzEeR1f83pLQkY3
X-Received: by 2002:ac8:7dc2:0:b0:530:4310:5397 with SMTP id d75a77b69052e-53043105654mr92555931cf.47.1788453979979;
        Thu, 03 Sep 2026 09:46:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8fcsm1072171cf.1.2026.09.03.09.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:46:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:46:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, ziy@nvidia.com
Subject: Re: [PATCH 1/2] mm: refactor find_next_best_node to
 find_next_best_node_in
Message-ID: <apmkUWQqKHAZHMaE@gourry-fedora-PF4VCD3F>
References: <20260902215853.156267-1-gourry@gourry.net>
 <20260902215853.156267-2-gourry@gourry.net>
 <906bae9d-dcf0-463b-ac9d-81ef8cc2cc2f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <906bae9d-dcf0-463b-ac9d-81ef8cc2cc2f@kernel.org>

On Thu, Sep 03, 2026 at 05:15:23PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/2/26 23:58, Gregory Price wrote:
> > find_next_best_node() picks the next-closest node for a fallback list
> > from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
> > which takes an explicit candidates nodemask.
> > 
> > This enables building fallback lists with non-N_MEMORY candidates.
> > 
> > No functional change: every caller still selects from N_MEMORY.
> > 
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> 
> Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> 
> Nit:
> 
> > ---
> >  mm/internal.h     |  6 ++++--
> >  mm/memory-tiers.c |  7 ++++---
> >  mm/page_alloc.c   | 13 ++++++++-----
> >  3 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index e16f1250b25c8..18d041ff5c52c 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1130,7 +1130,8 @@ extern int node_reclaim_mode;
> >  
> >  extern unsigned long node_reclaim(struct pglist_data *pgdat,
> >  				  gfp_t gfp_mask, unsigned int order);
> > -extern int find_next_best_node(int node, nodemask_t *used_node_mask);
> > +extern int find_next_best_node_in(int node, nodemask_t *used_node_mask,
> > +				  const nodemask_t *candidates);
> 
> Drop the extern while touching a line.
> 

ack.
