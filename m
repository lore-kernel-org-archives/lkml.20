Received: from mta0.migadu.com (out-30.mta0.migadu.com [91.218.175.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1527A47F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943393; cv=none; b=UavXasyoeITxwkQV58En0er/6DZ7Mw6PiyRAHBI5BS8WEmTQj2jBG3tiOfZsnZJCJMlAgmS2Bf5iNFAnE+mHqI2lqFLhPURPYr7IioXMISL2dTmhhrQgtkb5U7M9tvSdX6P0TYKOytHasANWzfuJI3vnK785ji3eHesjT3BF4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943393; c=relaxed/simple;
	bh=COHTECr9DeZAX32asUSS//tsR/rFjizcv3IDQHcOnVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9H40XAfI57QswpuAeumI+xYXgUzv54a7fSMCkSlMm5Ehr1cE3UeLoIYNCWD8ykucNMUVSho6qGLGAERXNluOnu8nlAYr41cj5zMiAF4WdFToE7nZlmGF0DZjL5Wo2Z2nf6TLUnwbrg8GhhmdbZu9FLA3t8k/eazBMygDXGRAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D27vTXo3; arc=none smtp.client-ip=91.218.175.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D27vTXo3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=COHTECr9DeZAX32asUSS//tsR/rFjizcv3IDQHcOnVU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787943387; v=1; x=1788548187;
 b=D27vTXo3I0zVioIGEzXP/NUMSyfjk1F4R4aR0+9ZYgDw0uMHkZStrpg7uYiW5cRvwUe+S76I
 hyoH9wic34ZB3zA93DHOo2Vce6FS5/8uE/cmrdNzTzPMGtESVYVkD4dNMGCvde6t+RVHYm+/Vv8
 S2A5dhriYmOBzgzrngMH4Jew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3b004b6420231b8;
	Fri, 28 Aug 2026 18:56:26 +0000
X-Mizu-Trace-ID: b3b004b6420231b8
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 11:56:25 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH v2] mm/memcontrol: fix stuck FLUSHING_CACHED_CHARGE bit
 on isolated cpus
Message-ID: <apHZti_C5udMRh2i@linux.dev>
References: <20260828135036.7d44361f@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828135036.7d44361f@fangorn>

On Fri, Aug 28, 2026 at 01:50:36PM -0400, Rik van Riel wrote:
> When drain_all_stock() sets FLUSHING_CACHED_CHARGE before checking
> isolation, schedule_drain_work() can drop the work in a separate RCU
> critical section, and housekeeping_update()'s synchronize_rcu() can race
> that second check, leaving the flag set.
> 
> drain_local_stock() only clears the bit for work that ran, so the flag
> remains set and the stock is never drained again.
> 
> Have schedule_drain_work() return whether the work was queued, and clear
> FLUSHING_CACHED_CHARGE in drain_all_stock() when the remote CPU is
> isolated, so future drains can retry.
> 
> Fixes: 6a792697a53a ("memcg: do not drain charge pcp caches on remote isolated cpus")
> Cc: stable@vger.kernel.org
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: Rik van Riel <riel@surriel.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>

