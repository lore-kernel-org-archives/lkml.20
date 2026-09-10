Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A363364EB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004766; cv=none; b=S16rUq5IFTQ7yBvWAJQ99I+H1iJ/Rl5SJ2wtmnLBOMGe8SAZwnYKMKH3+BWKPQwBBYOxRwPepIIQ7TVQaaM+zKmVf4bL7nJ2IKGHS8s6glLEYXO5CqS2lZ4PDR1a7cWfwut0rUtjcqMf+XXskTCufjeSiOHyPCDAAplKJjpm4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004766; c=relaxed/simple;
	bh=wUNqHbvqKq5YHpl9CaVUD7WsJkr308fj3VgKYgz2mVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVTKlS4ezFHqCc3B2lePSfatax1OrJsDgbPqtQn5PrrT0dNN6tIqVnOB4Jl8mdZi6idOhcwUQthI7JZty5Nz7IoY0QQcLMhrsMepTTQUt/Cq6QsTg6+Pvv+mTp9LQAF6/mCbbEg2syhLlGdW1aMBPtNMDsanshL28SKg6z0CTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 10 Sep 2026 10:45:54 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.126 with ESMTP; 10 Sep 2026 10:45:54 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Thu, 10 Sep 2026 10:45:54 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>, her0gyugyu@gmail.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] mm/swap: skip empty clusters in the swapoff scan
Message-ID: <aqIL0nNT/RF67PIN@yjaykim-PowerEdge-T330>
References: <20260909161552.2335971-1-youngjun.park@lge.com>
 <20260909104939.5203c02695fcfd7a95f4b26c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909104939.5203c02695fcfd7a95f4b26c@linux-foundation.org>

On Wed, Sep 09, 2026 at 10:49:39AM -0700, Andrew Morton wrote:
> On Thu, 10 Sep 2026 01:15:50 +0900 Youngjun Park <youngjun.park@lge.com> wrote:
> 
> > find_next_to_unuse() walks a swap device one offset at a time.  Slot
> > state now lives in a per cluster swap table, so patch 2 dismisses an
> > empty cluster with one counter read instead of SWAPFILE_CLUSTER table
> > reads.
> > 
> > Patch 1 is an unrelated one line comment fix noticed on the way.
> > 
> > A debug test confirmed the skip path runs, and swapoff completed
> > under load with no DEBUG_VM or lockdep splats.
> 
> Please let's try to make the [0/N] words provide a summary of the
> patchset's effects.  The above didn't even tell people that this is a
> swapoff optimization!

Hello Andrew.

I will keep in mind, Thank you for pointing it out.

> I asked an LLM for this summary and we came up with
> 
> :  Speed up swapoff and reduce scanning stalls on large, mostly empty
> :  swap devices by skipping empty clusters.  Reduce swapoff time on a 1
> :  TiB device from 158 ms to 94 ms after filling 128 GiB, and from 392
> :  ms to 73 ms after filling 512 GiB; expect little benefit when
> :  substantial swap data remains.
> 
> Does that sound OK?

Yes, sounds good. summary seems good enough!

Best regards,
Youngjun
