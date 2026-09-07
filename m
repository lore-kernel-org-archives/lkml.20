Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE84AA401
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795351; cv=none; b=kSEbVUNV25nuelK1W908XOe5f/e5erWixPzvQVXOn1Vu6AYJUXCNuazVaoHl9awcP8XR/81mET2vxo8iSrPGK7CGwjJvkwo8Emh0d2CWeHaqpt3A6wdVRmbZEqbv2LrNjBxUqTgxhHdaUtnaUhfEsP8S+Ssh7JPydonv8qDDoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795351; c=relaxed/simple;
	bh=bvP6bR2BWq0RN0jmIGBGoi15I2JS8AFyLxiWub03ve8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITzMXxFTqeyk0w2dSwSQGvWestG0dOOFI1GSPwtqACbfHJ9C4UmdNCe+bkjUHZRyjEdfpwCy6CBm/HBkwlmckBHPT5M8LWzrM/BGRSHpVp19NDxfkk1VHk391GfEVI+bNmNjOhHIXnVPqwdmznE7Xhc5871pejPCpSevu4doZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PBgOfLeg; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PBgOfLeg"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92ed3993c1eso203047885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788795346; x=1789400146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5TMs5/9XbMr5XgelOeQD9eKb6gYqPC5LkWTp0niqi4=;
        b=PBgOfLegxEP5xgPNUrawBmFkCPl2l0EClm+je0vPUz5ztrO4n0QRwrxGK42fHVs0Y2
         gQUV2j9Xn6ZWwysXskDO2FwhN8wSzR/0puWEl2ZPXIxu4pFUlTOu5hgK8GcEJIyK7KPJ
         v7uuLW0yMym3FwTSck1nq45CaUAMTW/b7JWLt94HP86wUKODcVaY7nKX5A7pNITJr/VB
         7+WIK2kibE8eviU4bQFnD7C1Fs4e8raNGNARaNCwObm1YSBlt3vZgoWTTAm4XUfZyhTd
         Cum33Mln0I/DHj9ZoOkXxjzs2RlDVbHMqz2MNGoBQQl29knY62G4vhUpC3z0TFp/HYYU
         3I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795346; x=1789400146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5TMs5/9XbMr5XgelOeQD9eKb6gYqPC5LkWTp0niqi4=;
        b=iUoku4dUZBka9D/o61DpX5njUI4tBQT3hQjIxNRmrOpI0VBvboTwXrx0wECmkv0+4M
         NStrndIL/v1MNC4750IuTcnYFHoBZVLMupcYgYHn4Kxeqg1SUZEoOwYO+2JWEgEwNB/n
         CW6jm22TKiOc273g6dW+khb1T0xhdhJAm4AAqRapbDp7ws/rKG+6+BS5ZkjIDF46wJVJ
         s/Z9X/pI0lQGG3USXvFKFuekcZ0czMGI9HsbnukhVil1umFZQjUURP0QjAPJXrIcubhI
         qSFPFej6hvyCyq/txz4paU1/bCuLd2obZX53My40bbP1ml5WWmk97vNhIQ+rY9Fgrbll
         R71A==
X-Gm-Message-State: AFuF++lHU3FkK0DRdZpgAfPByda2gZMf5e8qlzP35S6uwYB9u4u357/6
	vTV63t2LJpWbc7QdJyVV8Vkqv1d0ExT/awHz5ye91SpHE06dr0YD8NRnRy3tR1wlRBZhqF36LqB
	4zBHc
X-Gm-Gg: AYBFou34syP0xBRD+0py9ecpc60m9MoVyhSS1UOgeFlRadzBet9k0e4abwSvl3SO21l
	n/xfDWKmJ/KrxE44Ad/brdElGDLEQfO0ygk0Y0woZTj/FprOmS7n82iWUEnwURDoqmgISrUFSSc
	FXJT0aKf5GUjKVRIZFxYKuGwRCdgVNlrghrf9eILnqy4obyOE3ExYzIJL8jsgYfz+MdEfin7kyh
	xwmWSDIkvQI6vd/K1QibCqQqgjv1RhHH/gtWPtpr1K486udzQMk5yRHZHVt7u7ZsxkBYkRu96Jy
	NVgqTXIrt/CjU/MeNxdQ/eFasRfBQofXMpjbcO/b/l0shezWGocA+gtCwEVmKzCYlaHiQucEttZ
	7YO5J7cM43gFNUBdfFmWrt+j69qBP8Q92Cwn6DGhP46NQfrgqQBWiwF1Dmbjei1Nv8VZThJ4GBs
	8tMa5ntcsBfjgv6NKezYvo4T/TzdDDN33EVF0bNnFRv88afQk1EqDrBtLIKBSHlVFslFAyV7yml
	34OeO6ESyYxtRQ6N8k9DHKKowBC1ZX6GaOO/b5zCsln
X-Received: by 2002:a05:620a:1a06:b0:939:fa7:8df8 with SMTP id af79cd13be357-939803acf3cmr2336507085a.11.1788795346286;
        Mon, 07 Sep 2026 08:35:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399cf10c7dsm485350085a.15.2026.09.07.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:35:45 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:35:43 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, raghavendra.kt@amd.com, shy828301@gmail.com, 
	baolin.wang@linux.alibaba.com, osalvador@suse.de
Subject: Re: [PATCH 2/2] sched/numa: scan read-only file mappings in tiering
 mode
Message-ID: <ap7ZXrxI05xyuNn3@gourry-fedora-PF4VCD3F>
References: <20260904182006.1562449-1-gourry@gourry.net>
 <20260904182006.1562449-3-gourry@gourry.net>
 <apsX_E8GBzfp6lui@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apsX_E8GBzfp6lui@gourry-fedora-PF4VCD3F>

On Fri, Sep 04, 2026 at 03:31:19PM -0400, Gregory Price wrote:
> On Fri, Sep 04, 2026 at 02:20:06PM -0400, Gregory Price wrote:
> > @@ -4302,7 +4316,7 @@ static void task_numa_work(struct callback_head *work)
> >  		 * VMA can cause others to become "permanently unaccessed" if a scan
> >  		 * cycle is consumed entirely by the large VMA.
> >  		 */
> > -		vma->numab_state->slow_only = false;
> > +		vma->numab_state->slow_only = ro_file;
> >  		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
> >  			if (!(sysctl_numa_balancing_mode &
> >  			      NUMA_BALANCING_MEMORY_TIERING)) {
> 
> Sashiko thinks this causes unneeded rescanning, but I don't think it
> does. The cursor prevents it from restarting, and when we loop back
> around reset_ptenuma_scan() bumps the sequence.
> 
> It also had concerns about concurrent scanners and ptl lock contention,
> but mm->numa_next_scan only admits one per scan period.
> 
> Either way on a rewalk the scan hits pte_protnone() and moves on.
> 

On a second look, there are a few issues bundled in with this, and the
change required to handle the concurrent scan + mode=3 (_NORMAL |
_TIERING) requires a bit more complex of a change to fully resolve.

Will push a v2 after some additional testing - but that said the
existing tests still stand.  As-is, any mode with _TIERING set is very
broken at the moment because of the filtering mechanisms.

~Gregory
