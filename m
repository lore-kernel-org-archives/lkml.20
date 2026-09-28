Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21D2DB7BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559274; cv=none; b=oi+nfSB7bPNUIAQ2NI9Qc6dMWLnpZIdgyMkOBavGjVDOCGOFabXdMF7rVztdOcZ1XPtzBuRJkpQ0PYUcpZcW/msnAaDJ6JrLPNS9HuCncKUvWM6DEH/GTxKZN3XFb3tC/FIIiyHiXwItYfFCnID+nIMn3jcLU+HB4uKHwCBaPDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559274; c=relaxed/simple;
	bh=HtDnyr/juEB3G1c1urS4f9LZZ2YiuyN8/uYT42pc12E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHO2KsQyWz1QuwbF+FQj+A4iP59bjA5J4iesJGFKR0hlD2tqH4DT4HRZlCyXPC2BRQ0Wq/bxWQDjXfp6koA//NAx22F4/3sud+usud/V/T/cIt+QPf42/mzJ9Z+qU1LR/W0aj6UJsb7JQnw2IyXtUeNJD2eNzR1o393qVhLh5jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u6ejsSAU; arc=none smtp.client-ip=95.215.58.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u6ejsSAU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HtDnyr/juEB3G1c1urS4f9LZZ2YiuyN8/uYT42pc12E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790559270; v=1; x=1791164070;
 b=u6ejsSAUErUX+XC5r//LkwjYeh06mSDOYH6g7PJiSsKT6t+odf3SgMKEJxD/lb3/W3spQbjH
 Df8EiYmQWrvJI9zwHJxATfiWQwM7LGQhODJLKcfHasybSjLqhpGEJvzj9c5O8TgK8FYUZmC5HZN
 fmbxhaLRsvMvW25XjJNc5iOs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ed4aa777c3fb1996;
	Mon, 28 Sep 2026 01:34:29 +0000
X-Mizu-Trace-ID: ed4aa777c3fb1996
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 09:34:26 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <arnDuwI94lgTr7rm@MiWiFi-R3L-srv>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
 <arTwYTK22Wm0u3BC@parmesan.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arTwYTK22Wm0u3BC@parmesan.int.kasm.eu>

On 09/24/26 at 12:00pm, Klara Modin wrote:
> On 2026-09-16 18:19:07 +0800, Baoquan He wrote:
> > xswap is a swap device with no backing storage. Swapped-out pages live                                
> > in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,                                 
> > and the area is grown and shrunk on demand as swap usage changes.                                     
> >                                                                                                       
> > The problem being solved is the static size of compressed swap. Both   
> > zram and zswap need the size fixed in advance, and neither gives memory 
> > back when the workload shrinks. The solution should be a device whose
> > size can scale up/down as per usage. xswap does that by mapping the
> > metadata lazily instead of reserving it for the whole range.
> > 
> > Design   
> > ------                           
> > - si->cluster_info[] stays a plain array. Access is still
> >   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no 
> >   RCU discipline, no tear-down state machine, no NULL return.              
> > - Only an initial chunk is mapped at creation. The rest of the address     
> >   space is reserved, not allocated, so an idle device costs nothing.
> > - Growth is driven by allocation. When no free cluster is left and the       
> >   address space has room, the next chunk is mapped and added to the free  
> >   list. No userspace involvement.
> > - Shrink is driven by frees. The free tail is scanned, and whole chunks
> >   are unmapped once the mapped range is at most half in use and several
> >   chunks can go. One chunk is left mapped as slack, so the next                                       
> >   allocation does not map it straight back. A ceiling lowered below the                               
> >   mapped range skips the half-in-use rule and is enforced at once.
> > 
> 
> > Size
> > ----
> > A device starts at 1xRAM, rounded down to the cluster. That costs
> > nothing, because the mapping is lazy. The underlying address space is
> > 2xRAM. An optional per-device cap,
> > /sys/kernel/mm/xswap/type<N>/limit, lets an admin lower the ceiling;
> > the excess is unmapped right away. Grow and shrink both work without
> > it. Creating a device requires zswap.
> 
> So I can't set an xswap device to more than twice the RAM? I suppose I
> could create multiple xswap devices, but it would get tedious fast on
> systems which have a different amount of memory. Is there a particular
> reason for this limit? I think I could create an arbitrarily large xswap
> device with your previous version which needed the specially crafted
> swapfile (with only the header).

The 2xRAM setting was derived based on the current system condition.
Assume we take zstd which has the highest compression ration, the
compressed memory accounts for about 30%. So I set a max value 2xRAM
based on my own limited knowledge. I will fix that in v4, let user
decide.

And yes, in earlier verison, Jonhannes disliked the ghost swap file, so
I take a file-less sysfs interface way instead.

> 
> As I wrote in the other thread, I would rather not have to set a limit
> at all, or at least have a limit I'm sure I won't reach.

I got it, it will be changed in v4.

Thanks a lot for your careful reviewing and testing.

Thanks
Baoquan
