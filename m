Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B34D36B91F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481609; cv=none; b=udUD2IA44591XQqf2JwBr6iDiMIQUhjDE5ICVwmCDhkoJaytwhOZdJYKtT8MYhI/ykd3rYH05U21OV2knR/AVg8FwreYTUb12NMuoqG+lAFwS6vQoUJMWZHFXTXMcWaaFke03LOl3RalR3dDLfAKTsqem4j2yG49BBtpfH8isoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481609; c=relaxed/simple;
	bh=S2oSKEWrZmH35nMs1h6fNIfHj7zRwTjTkVYroUXO4Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqD2CVLWLVG2TBEQzZcd+Y+FF8KTUpVK/Z7GpUS9hDLCwmRSjaP1u1ugwsXSFk49ccB/0iqV9e9zQAxkAL2NGyAnicypI+9rYxAy6m+SYtOImtLO8lAKgzVMENNYCWOkT4jxK2bBwKYxy95Ga5jk+TvZGoVcTiA5DyaC3A0PgQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dsKreOFR; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dsKreOFR"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104649a5dcso2606366d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789481607; x=1790086407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=So6YxVj9CWW23ILTpr0Fzgp6sAddC6/IZlVCBBvu+Z8=;
        b=dsKreOFRKm1gGZtAsS7bHMl4OGCacUEsgMjVm24v0R3mu+HJZXLDdyPHJPDbWA1R9P
         AP+CliAHoYc+S6BuaGD/dgki7HrDo7gx7aDC3GUj5C4RSfrDFub2UtJohiyErteteg9e
         BoKwmjWljiTE8VgEaSmHMAoBcCh20Q7sfYI0rMkAZigIncrDyVDw15uWfkzp+mBxLghg
         JjmQP6LQZJOoMTJXj/e0Ed3jO3IoMfLX1OpiOeDnjEuNytUYYhmUBYupiaxnOqwCpRK5
         tTzl66KyK2XB88poH1DHHV4JRKqP1ivOgUUy7fRtSHfhzMejadTxQ23cnxftrZikoV+s
         15YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481607; x=1790086407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=So6YxVj9CWW23ILTpr0Fzgp6sAddC6/IZlVCBBvu+Z8=;
        b=fEOR1mnBNEvZSkGrPZ/yFy9P4FsXqg/TBh7WYMEYPuJ0DZaIIoZk/qog4VHVXc0Rlg
         7D+pslFxDAyoeqqjqJSUqc+PJBgYcw/gU2PxRiNoe55QJ/6Jmrdk2hi0h8mlHK5BErxw
         mDs9Gc2vrOpkYJ9n95T7STG6qDZf1RDkjtGBXbndWR3tfX9u+nWsso09IXVGA3Dmz0D2
         zvcE0Y4vINB/7pGhB8fbcujsG3eAM4fHwKQeXy07e9WVYZ0+G7LhXSgGB/MeS11YkWhH
         5gtbA+y6D3C4+0iL/toWqEw8tEj0zcne598YMIt5RooDTHOpQEY+Ea6cOCUisJDAKH9v
         2jXg==
X-Forwarded-Encrypted: i=1; AKwUvByngffzFaEA0ATez9P6fP9M8hbDAYFoG50qveqAmgIDUV7fO3ABeHHrAOL4K3G9C6lCD+fDXfO09xfdDDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lk2ie8BDZhDE6912Pd8ZxVXPBB0nUM0cpjsTnXB+1zXD2JWvhi
	25xoDElQ7PmpIDX1KtR2B166aCiqxv93tTL4n/NZHchavjbGWUubzPZ1CDGEyOeSE2s=
X-Gm-Gg: AYBFou2W3X3NaCGecwxxT4SIriS0FW8kI2p4spq9bqu/vWeM+EmOCBvzp14PuJMakAt
	xELCPfSwkoUJZWrAdi2JiMsdr24UEHttCrqkesOFAVlbfp47/9xY3WA+bYupHGk9FOY447oDazU
	xHeQ0q807+VU2YcXxUKN+4Kq3Y4Du9l0tKqbD2sN/q4Xvyud3cUrcK3FpG/j2QMGiEp4d6IRnOF
	go5X0aHo8T/0J8gZxW+bZw+AC13i8fLFkhyAzM3MYvBb/YCSKd2jRZ9J4YDE5jw59GLp9q8ewSU
	b0AHaXXnhPKKuLgULopSHz9kmACD3CeVrts/jnzQ5r/60VEIxt3SRdxY97KNfcki2IgHO1Hoc0s
	X/XT9AoT0cExbs24IhEyyZBXekr0Mo+eDFFPNVYZI2yqTnldG0jFaGTJmh8HJEhTjVgaHQfTrS+
	FE5WTT3l1mniH/GJurT50kD5fPjZMjqfMqj15LWn2OC7bkalKuz3xBBAZtDcD0OeZMQhO7IZ4Ey
	RKXtrZ29vOzPs426mzz2I16iMCgzcnZQdYM/rh7DuPZRSoEcjOs9BM=
X-Received: by 2002:a05:622a:143:b0:530:fe5e:becf with SMTP id d75a77b69052e-5312622984emr15784801cf.39.1789481606657;
        Tue, 15 Sep 2026 07:13:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4ba156sm127632851cf.19.2026.09.15.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:13:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:13:24 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqlRJbY5mlmjhEzj@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <20260914233209.3fd5a6e848ee82d13e43a301@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914233209.3fd5a6e848ee82d13e43a301@linux-foundation.org>

On Mon, Sep 14, 2026 at 11:32:09PM -0700, Andrew Morton wrote:
> On Sat, 12 Sep 2026 07:08:32 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > MADV_PAGEOUT collects isolated folios on a local list before reclaiming
> > them after the PTE walk.  The reschedule path drops the PTE lock and then
> > restarts the mapping with pte_offset_map_lock().
> > 
> > A concurrent operation can remove or replace the PTE table while the lock
> > is dropped, causing pte_offset_map_lock() to return NULL.  Returning directly
> > in that case bypasses reclaim_pages(), leaving the collected folios off the
> > LRU with elevated references.
> 
> aw man, you got so close then left us hanging.
> 
> So what happened next?  Machine crashed?  Permanent leak?
> 

Permanent leak.

nr_isolated_anon increases reliably and does not decrease when the
process dies.

> > 
> > Fixes: b2f557a21bc8 ("mm/madvise: add cond_resched() in madvise_cold_or_pageout_pte_range()")
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/patchset/20260821150912.183976-1-gourry@gourry.net
> > Cc: <stable@vger.kernel.org>
> 
> #include "Documentation/process/stable-kernel-rules.rst"
> 
> (sorry, getting snarky.  I'm saying this stuff 100x/day at present and
> it just isn't sticking).
> 
> > Assisted-by: LLM
> 
> Can I suggest you update LLM's prompts so it checks that the changelog
> includes userspace-visible runtime effects and so that it checks that
> the patch is approximately compliant with stable-kernel-rules?
> 
> If you do, please share that prompt with me and I'll put it in ~/.signature
> 

I typically (re)write (or at least heavily edit) the messages to ensure I
actually understand what's going on.  I'll update my brainmeats.

I get it though, rather than permanent leak say how to observe said leak
(vmstat or etc). ack :]

~Gregory
