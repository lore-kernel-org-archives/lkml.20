Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B73DAAB6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167385; cv=none; b=PPCV5m2RCQg8H9rl/Mz4l9HVYPQOp2aeeps2V1f66Hqvbh55bRy5wKjmLhaUBFRyh+w3u+v1C8hV2etjspHa39UgZeFZnES1P5yLfCh1No2eKwDqKTU/kNoqEDj4fVEroult6gPnGirApQHqvBqM+weCcb9/ilbSVVfWIqrkTV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167385; c=relaxed/simple;
	bh=NQzxN3RdeSfNNKapYyGm/IPsR5F7fvtch0RxWaHdydM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlkwrzreXi/VmVjbSWgzsHQlj3l8JNhrXHfdF/gEgDv6poII9yiHNpvHdmvWAoE5H8cKghu6zCmqnhofjNJ/ilH/BvdEdUxRQyybV1u49S7XvWynCzT0svr5D2K/D8/H/yCuEhzHmywvZyyACSSWHp2KM6NWeSqRS5kZqJ+4VqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WmMpEtxz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WmMpEtxz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482f9309813so2117847f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788167382; x=1788772182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aoEjE8TELGQjXx5xs4Igsq3G0G5VVqVmGoWAazModw8=;
        b=WmMpEtxzhZHxRnsH8+ngDbHTxGffgJFMISul3O+BJgXd+uORanf0Y2OuOYK1AYgMuR
         0HD5hiduf+8BPeh5Ley7RbcNMR52BrsMv4DcNXtDHoTtx9TQEJR7BdIjeTcC0pNtZ3Wp
         I+xaqjTIvWFCjTvjl6/FocrNcrmxzDu4PkV1e3jobP311xAW3NZxF9UOZrosJhw/inRV
         DsxB16WauJUD93wGsB6AUYmzivm0fgHg2Mv6MxLFmCJPcoMkXyRHTd5gC8xN6sNiKRu3
         gU8Ie3N/0EmZbOtODKDH8wVGRONSHF3EE8thFqkjXNcRqIfzEhi/4d6GTbwbCm2PW1qm
         gF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167382; x=1788772182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoEjE8TELGQjXx5xs4Igsq3G0G5VVqVmGoWAazModw8=;
        b=qjlu9o86iF5Yp0aeMT+dD3/y2BDUtL/DbSuC20xtgk+G/Ic43TfH1e0fuNkxiS2lh7
         tbj8VlrWKTi5W8LIbsJFEoq27FziEiEOtTQnV+kuS0le+Qostl/l6LJAeJbf8RVSXjVP
         y7O3yYxDMkxm1J4eryO/Q6Ypq4yh8/TLJl2QjL/k3pJDGUgY43q876fxJEDqsyttJz2q
         ndU8EkCTbkhHCPZSRDwwEz35gJ7dSK/npz5057Xi3Q/yfCdC9lx5d9ADCsX81x6jgcdz
         HW91n86Fn9+czVnqPrbjB3eQsBdjX+x/MtHfdOliCQt+U2/dgm7Ro5jb7deJjo5wrzNL
         k36A==
X-Forwarded-Encrypted: i=1; AKwUvBzZe9Hm2y6J+nmwxr7KqBbucLNyVkh3ID7rlXtrlXyzKAVumazVnQAUS8c4kcTwZq28t6DWhPrQh36w2hs=@vger.kernel.org
X-Gm-Message-State: AFuF++nq6Zy19W6gLikOPhzXsUz6oz4ON1uAncJij1ZM126kK+0SChIg
	789R3Vf9zabYhYZbnlDnpNkR5RADZtGPJvYRlJwJZngXmJVp+rlsFQcEyQ87Hvh3CBc=
X-Gm-Gg: AYBFou3MoHhBmufDlaFReUxvd/HbBtwvWu+xQZxmXcafjpmw7Gsq5rqL01WN38r2h42
	bYssJMGxLWwcZbcdKvol2oL76zjXitmSmdEQKUJumtBDMLmwgRSEuET0mnitvdtb2nuaKtHbcrX
	zG0DCha2JIYB8YyNvnxldFV5QKJ+lmyJNjO8dqT0kcSsfDG3AGKJbOS+FS4UvStc5QBRqiL3E2q
	wXwZEK6SqarXcwasHwqjrCGcrqQXJAv7f8FGtVDYTivubO5TYLbYi7qdveGk5LCXPbtV+wy9mj6
	W+B0xDe8LN9tou+tNmSTqFEDm4MTRTdWfs4+sxPsfasUZt9lR1Zjc1eCIvnxaPO9OUga1NE0m9V
	lgzDvJ7AfA7ZPLP1sV/acJ+M4k6Ci/omMRTmbYUd/tHxuSLpWJVrQEa+U2w76a7Q3LUZp6b19WL
	vpHtdx4fPARL3WGwffqZXJzFBHlMFyJQHAZIG6jSTFnP6BbnooGe0vwjk/w5yZd+JF0FawRWvw/
	f0DLRSqkaMO
X-Received: by 2002:a05:6000:288c:b0:484:3bb9:25ca with SMTP id ffacd0b85a97d-4843bb92758mr8741566f8f.12.1788167381881;
        Mon, 31 Aug 2026 02:09:41 -0700 (PDT)
Received: from localhost (109-81-17-247.rct.o2.cz. [109.81.17.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28492sm20835619f8f.31.2026.08.31.02.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:09:41 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:09:40 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <ye.liu@linux.dev>, Ye Liu <liuye@kylinos.cn>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/oom_kill, proc: replace magic number 1000 with
 OOM_SCORE_ADJ_MAX
Message-ID: <apVE1A1pI4Ad6Ts5@tiehlicka>
References: <20260811033609.3992348-1-ye.liu@linux.dev>
 <20260829201310.648ed330984b91b1c135d8a3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829201310.648ed330984b91b1c135d8a3@linux-foundation.org>

On Sat 29-08-26 20:13:10, Andrew Morton wrote:
> On Tue, 11 Aug 2026 11:36:08 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> 
> > From: Ye Liu <liuye@kylinos.cn>
> > 
> > In oom_badness() and proc_oom_score(), the oom_score_adj normalization
> > uses a hardcoded 1000, which is the value of OOM_SCORE_ADJ_MAX defined
> > in include/uapi/linux/oom.h.  Other code in the kernel (e.g.
> > fs/proc/base.c oom_adj handling) already uses OOM_SCORE_ADJ_MAX for
> > the same purpose.
> > 
> > Replace the magic number with the macro for consistency and
> > readability.  No functional change.
> > 
> > ...
> >
> > --- a/fs/proc/base.c
> > +++ b/fs/proc/base.c
> > @@ -594,7 +594,8 @@ static int proc_oom_score(struct seq_file *m, struct pid_namespace *ns,
> >  	 * exporting for a long time so userspace might depend on it.
> >  	 */
> >  	if (badness != LONG_MIN)
> > -		points = (1000 + badness * 1000 / (long)totalpages) * 2 / 3;
> > +		points = (OOM_SCORE_ADJ_MAX +
> > +			  badness * OOM_SCORE_ADJ_MAX / (long)totalpages) * 2 / 3;
> >  
> >  	seq_printf(m, "%lu\n", points);
> >  
> > diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> > index 5f372f6e26fa..08bff7a55db8 100644
> > --- a/mm/oom_kill.c
> > +++ b/mm/oom_kill.c
> > @@ -230,7 +230,7 @@ long oom_badness(struct task_struct *p, unsigned long totalpages)
> >  	task_unlock(p);
> >  
> >  	/* Normalize to oom_score_adj units */
> > -	adj *= totalpages / 1000;
> > +	adj *= totalpages / OOM_SCORE_ADJ_MAX;
> >  	points += adj;
> >  
> >  	return points;
> 
> AI review suggests that this is a misinterpretation of "1000"?
> 
> 	https://sashiko.dev/#/patchset/20260811033609.3992348-1-ye.liu@linux.dev

Sashiko is trying to be clever and it is simply wrong here. The scaling
fact is indeed the same as the OOM_SCORE_ADJ_MAX.

-- 
Michal Hocko
SUSE Labs
