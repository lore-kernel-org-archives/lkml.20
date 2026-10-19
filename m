Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433791;
	b=w2qrqx7GZ9qGhBpSZNjgZSNabU2I2UZM6+GOCTUBlLkkk2cVfF1cCJ3//kRfzO66mOQ0
	 6hnqQxIL3qxCMsBEivHxCm11EHGRZ61OGLIaq4OLKDb97fP4saUvY0bC4pBefFbwxg20o
	 HJ1zoJDx3ltqQluH3NspAZpLfGm15O3yhBnU3kubGvg6EgvilnGGDeCtn2SeBLl1z6DOA
	 S7c+9Qh3WQfVhZcd9oo332WJOSfGgAvvzWKJk3nwdFwBQ0XLM9ThncQyEupLjt1IiQnUs
	 bMG7Qk2ryvtkhtIIPZ6M4kWCC6NWPu2RmzofSh+pmwd4y92Xru4gYvTPHZ+qY/6C9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9GcCoJID0P6FXucLCwUTBYqCKowiVzUjNAVvxodr5aw=;
	b=mZXA9XmDnZxuliFGdU+tF/xIaBZaFknd3RV7VXLhriVSCceIQNmeU2W5fFk3LTQCnL4a
	 FKH/YNkr400CzG57ORPn2KCzdI4UJ4tJKVc0Op1gG3j5WCU+ErThK1vYy1DZUcoI9Xas7
	 /OmJrNNPKTLDQ6FFJQJNqMyAYDkdyoNgsluqzk36Y1uDEN3OpKUTkmb9yJuGsb/m9qELO
	 P1Uc3EDji1uW327AUvXkUM5NjadYP8ijl7lcJu9CRp56f+mJcK+NEaFu7egXldOZGnw7Y
	 dfR1GNnEdI0wBaDG5RbRAbmBDwV10YC1DIEGq9H9SWA6tbp8b8kI/BZdtEcWymQH9Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ln1rAIlc;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D39E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ln1rAIlc
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843cf077f10so2320165a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792433790; x=1793038590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GcCoJID0P6FXucLCwUTBYqCKowiVzUjNAVvxodr5aw=;
        b=ln1rAIlcS+Rdfz+l3OaIbQMSGclmDUZLL3CBVbephU6SqE1YSoFrXUAq3LzSj8VX8H
         ElSxtYZOX2qFsInwLCSeiRxuNF7wYZnAcOiDnpd/ptnALS9tC0Z4ridNGhs+jRbgiDRI
         91ibMvgk1ifr98d9AiYZnbDSUqdi8/pOAdJ5k9Vkbz7ycH3m/FCO+L6c+jYlWcT7v7y2
         hpz9MaIYIQXLgi1FMfnMMBhfeNCXVb7QE35QJepz2mFa3K16K5u2ibBHVXA2fXSiv0ZT
         s47oSZABG8cGwh6WzN0gYmEyLz44o4EEHnUxS7KSNhIzxBWP1iHOe1CNNubINwkYiWAc
         jOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433790; x=1793038590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GcCoJID0P6FXucLCwUTBYqCKowiVzUjNAVvxodr5aw=;
        b=lM38+HdcGkm/2M3Pcozfwt7Gka9joTZc4+NGsaD7Yg6mvqeCm7neWMiScxA/EYCEph
         AvXmdOGvobMpAxA+vTb9N7vNizbPRqr1t1+4IX36QB8tyJj3/91gQJXHSFvBaOLuTZLm
         1gkJe3rf32xujgxIVVys5s7YHGYSnUiAQNDxQRvuIfVn+qmOL1pAdQkr+39Ia5ViVnjF
         TfsJlAVDw8YN4dCnlT4ggGfEKIP753/IITcFG5uUuGSYQmiAbeKU9SM8/TYi07CvmxCR
         SNeuN04McqJENn4RWcYmLCRgCIPB7e9MCyxVec1IVwCxOmr+kAlAiTF1Z7ENjlo8wxi0
         Y9yA==
X-Forwarded-Encrypted: i=1; AKwUvBz4AocyZvwV+Mu7M9qQIJZvRPyWQExLvXys+dDospzys59Qsy09Ec32vAPHa+aQCmzqY64/UZ2n5NtbVzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF8BACG3Lok0ZKu0m/ePbC1T8Zdhl5/eUECJB9RUAVv6u1Z4Pl
	VmnfILSgnVX+7pKU1N0egwlvsZJ56EIUb1hrdDI+jzsI2XBDM+FtuRjR
X-Gm-Gg: AYBFou0nD1NSVIL8thOuJXvP2G8mtKdH13vgGZsYlMMJAcxTSFCNhsL6dDOer4f+7ze
	Xg22nb7YN8CzgyG54shZFRcJR2AKmN2sdnZYeQUfUSE4jQSc3F6Dvcn13sHzIcPAz8xOOaGBOtK
	bOjFjHvZerrzJ534TO6G5VhV0Yxs4M74nfLxPVL0K4S+/SpzKhqcUnGI2qyCLJ5KOabV/LgpQSs
	JtV8oWQu+NceE0LD9GxQ2hAiHg+ZalHHpvKyqypVx+uFsL3hsvaQy/t4CDaJr7YvnAbIfR4jAFv
	Xli0O9B8Eb0XkKyXmPv8duwwmMcbnysWCsCLpQ+Qmrm8+nelnWn5kIR43S0rKo5wpFll3L3BYMc
	aLPPTpEi5dBwfo9NKLdgMDfOl9VBHHq+eljVr6gBbYTaIZpjpRid4DRd0PntIOVg6ABVoB4sHor
	KZnavklcX7joivaXnIs/4fvUGgRtnqTFuWVfmeso35xR56oOf8QMPQ2bQNHBzHwqaq1zdtn2GV+
	8AMSoX2Ae8jTDnBrqau0uEy5Lj4Pg==
X-Received: by 2002:a05:6830:64cb:b0:843:8982:9532 with SMTP id 46e09a7af769-84500b76ebamr7325422a34.28.1792433789721;
        Mon, 19 Oct 2026 11:16:29 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:43::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-848e7d444e3sm3722002a34.25.2026.10.19.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:16:29 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/percpu: clean up callers of pcpu_obj_full_size()
Date: Mon, 19 Oct 2026 11:16:27 -0700
Message-ID: <20261019181628.2113224-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atZWW7V0MI--HOke@thinkstation>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 18:49:26 +0100 Harry Yoo <harry@kernel.org> wrote:

> On Mon, Oct 19, 2026 at 09:28:02AM -0700, Joshua Hahn wrote:
> > The size of a pcpu allocation can be interpreted in two ways:
> > 1. The size of the allocation attributable to a single CPU.
> > 2. The total size of the allocation across all CPUs, including the
> >    allocation overhead (for obj_cgroup membership).
> > 
> > In most accounting paths for percpu memory, we need the second
> > definition (total size). Make this more obvious by coalescing the
> > callers of pcpu_obj_full_size().
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/percpu.c | 39 +++++++++++++++++++--------------------
> >  1 file changed, 19 insertions(+), 20 deletions(-)
> > 
> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index d7883507dc151..76848e096caee 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -1623,7 +1623,7 @@ static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
> >  	if (!objcg || obj_cgroup_is_root(objcg))
> >  		return true;
> >  
> > -	if (obj_cgroup_charge(objcg, gfp, pcpu_obj_full_size(size)))
> > +	if (obj_cgroup_charge(objcg, gfp, size))
> >  		return false;
> >  
> >  	*objcgp = objcg;
> > @@ -1642,11 +1642,10 @@ static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
> >  		chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = objcg;
> >  
> >  		rcu_read_lock();
> > -		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
> > -				pcpu_obj_full_size(size));
> > +		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B, size);
> >  		rcu_read_unlock();
> >  	} else {
> > -		obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
> > +		obj_cgroup_uncharge(objcg, size);
> >  	}
> >  }
> >  
> > @@ -1662,11 +1661,10 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
> 
> Perhaps it's better to rename 'size' parameter to 'full_size' in those
> memcg hooks to make it clear it's expecting total size?

Hi Harry, thanks for the review! That sounds very reasonable to me.
I'll spin up a v2 to make this change.

> Otherwise LGTM!
> Thanks for cleaning this up.
> 
> And it might be beyond the scope of this patch, but I think
> trace_percpu_alloc_percpu_fail() should take full_size instead of size.

Hmm, I'm not sure. The trace event for percpu_alloc_percpu actually
tracks both size and bytes_alloc separately, but percpu_alloc_percpu_fail
only tracks the "size" paramter. I think it might be a bit confusing to
have the percpu_alloc_percpu_{, fail} have diferent meanings for the
"size" parameter.

Perhaps the right approach here is to add a new field "bytes_alloc"
to trace_percpu_alloc_percpu_fail so that we get full parity with
trace_percpu_alloc_percpu?

( Actually I think we don't even really want size, what we really care
  about to me it would seem is the size of the allocation request that
  failed but alas... it may be too late to change the meaning of the
  field )

wdyt?

Thanks again Harry, have an awesome day : -D

> Wdyt?
> 
> -- 
> Cheers,
> Harry / Hyeonggon
