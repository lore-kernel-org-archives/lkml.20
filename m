Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765036C9C0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976182; cv=none; b=KzSEvDcNWI+AfUJcUDu8UocGsvgMoFpQHkP5ey2CwA7y18do/cwUlYIDrqNhAbMVIIe+kyUqMOFVAfP1UzUZeVfdQ5UQSJnItXW/FlBg1GMiTNjkFME2RSqcIiXdaAVfrmwvX8hyck0wyx9ey/F71SlIW+nt754cDTGWDUbPcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976182; c=relaxed/simple;
	bh=hnDjJOlJWi1cy3WaNJ4sOYOXAoKsVqv7FZArgx6RKxM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nIRFmw6+YIMiYp85faHOkjJz6t03aR3zyHWRn9BKOvO4T3pnPlFddt58SRyvOJDXrqTGS7VwmKoFn2kKpeR+IoK/Zq4vDfww0V0Bti35UkgtCqdGtipAwxh65D7T6h7G/DiW/vp6865raP6EnnrYjxjQK1mIQ9Rx1+LlNQ8fB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bEJ25p44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bEJ25p44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4C01F000FF;
	Wed,  9 Sep 2026 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788976180;
	bh=xMFr2pRrz4NizZpYlauR0A2ajuMYpA9flP2EenlgMtg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bEJ25p44SexVsQl7zqgMU25xKTQUuw+NitGL8u3/G2PvC5JIz5916GmDjwDOSHENL
	 U9eSqIO9ctB6EGOS/YBh/0p6bBvBJOPVtGCzZhXOEp1AHonBa318jyx77Byweb3nNO
	 RFmy9gcW+3H3YD6a09ojeqj3kscTifU8gkWQy6wA=
Date: Wed, 9 Sep 2026 10:49:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Youngjun Park <youngjun.park@lge.com>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 her0gyugyu@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] mm/swap: skip empty clusters in the swapoff scan
Message-Id: <20260909104939.5203c02695fcfd7a95f4b26c@linux-foundation.org>
In-Reply-To: <20260909161552.2335971-1-youngjun.park@lge.com>
References: <20260909161552.2335971-1-youngjun.park@lge.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 01:15:50 +0900 Youngjun Park <youngjun.park@lge.com> wrote:

> find_next_to_unuse() walks a swap device one offset at a time.  Slot
> state now lives in a per cluster swap table, so patch 2 dismisses an
> empty cluster with one counter read instead of SWAPFILE_CLUSTER table
> reads.
> 
> Patch 1 is an unrelated one line comment fix noticed on the way.
> 
> A debug test confirmed the skip path runs, and swapoff completed
> under load with no DEBUG_VM or lockdep splats.

Please let's try to make the [0/N] words provide a summary of the
patchset's effects.  The above didn't even tell people that this is a
swapoff optimization!

I asked an LLM for this summary and we came up with

:  Speed up swapoff and reduce scanning stalls on large, mostly empty
:  swap devices by skipping empty clusters.  Reduce swapoff time on a 1
:  TiB device from 158 ms to 94 ms after filling 128 GiB, and from 392
:  ms to 73 ms after filling 512 GiB; expect little benefit when
:  substantial swap data remains.

Does that sound OK?
