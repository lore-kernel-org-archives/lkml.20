Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6F317DFFA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862939; cv=none; b=bC1+2m5se7K72/lN4IHUEMVy2Z7OcoAFeU7gh88Htt25Iwoc/xPkKvlLGnOTu8ykk3XRMenQQgiQmoLg9p2Cu9qtglOqsXdNd9fsqXpxtvMExXu+XFpcbb0j+fAXPlHl+92/MLdTKEs8AgjyI4MAY8Tjk3RRH9TXrqE9FFOQo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862939; c=relaxed/simple;
	bh=Mj6A82xzJu8yBYE0prIJv2YDKCCYc1OG1fWVviOgcKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIyGCXQcH/IgTEtJIAL5813VkEJHbpc6qxRK+AaNxKvvahd1e56lzp1J379EZ8xvQQGDKfVyyPhb4LPl5dfVZ0Tg9KmqVsvrvgi+uIEHOozHrZitG+59gmlslYrtJ8ykaq8DIazrvIqbMzQEFXfWjnBS0Q4DKvnQ76/Tbid3Oq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jTNLEbK/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jTNLEbK/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mj6A82xzJu8yBYE0prIJv2YDKCCYc1OG1fWVviOgcKI=; b=jTNLEbK/+p55UD2qBQKk6JZ6vU
	Jy40YABXM5uX1tdqUD94cCP/gagCCryBs5Jabd1eU3Gn0HO7Y3dPR11uvYiwI/Bk+yK1v1A/xd6ru
	Ah0P4/DWBdgMoimbGn2eCCb1ZT7wpmvqBjHvZtGO7+Gr1O1+eQPZTHppyiGzQMIYoVgwUBj+y0yMc
	EbDbk4duggBG6Qm5vjtWXA1zOxO7McXpiAcFLlOJewV87p/SdSgXzcwXj560qkp1xJRQ3Siv3j4/Z
	FQTaJFYVNEcl3cIxYkPxiaU6q5qUgSwx9md81qOrNM1wpqX238pF+Lvy17BYCD2YeF1Vg6wog3RW9
	41CDAR2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHFy-000000052qC-2ZiB;
	Thu, 01 Oct 2026 13:55:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2E126300578; Thu, 01 Oct 2026 15:55:29 +0200 (CEST)
Date: Thu, 1 Oct 2026 15:55:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com, kprateek.nayak@amd.com, elif.topuz@arm.com,
	sh@gentwo.org
Subject: Re: [PATCH v2 3/5] sched/eevdf: Cap protection when current has the
 shortest slice
Message-ID: <20261001135529.GS2009045@noisy.programming.kicks-ass.net>
References: <20261001134016.3881268-1-christian.loehle@arm.com>
 <20261001134016.3881268-4-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001134016.3881268-4-christian.loehle@arm.com>

On Thu, Oct 01, 2026 at 02:40:14PM +0100, Christian Loehle wrote:
> Changing a task slice preserves its remaining request. With
> PLACE_REL_DEADLINE, the deadline can therefore extend beyond the new
> slice after sched_setattr() reduces it.

Or, the new slice is only effective after the current expires.

Is there a reason we care about this? Changelog didn't mention.
