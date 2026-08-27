Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5E23D291
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798796; cv=none; b=RvShSTjNA7Jg90qMfB0jAcC/YfqdF8GKSZMChPMUjwo4tm1fdzisIcnMjpK1/QJlMEChgHQnxd7Da6lEx/U9WIAFpdiLL0a3JYO1iZDDYKrtNkXsxEJ3ZYboHrEwgc4tSzOaNS1VLh0w4/qIBaEQbbH4oE4h0K7Qn9SiqOzALvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798796; c=relaxed/simple;
	bh=agRl8+fi/X4whUT2qpYvRoxtucrbgEdbo3vH9FIUKeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svD1mIoy+/E28XBcVc2Th+ZUv9IbbjidxiYe2ekT0QwZQ94LpZFTzVhbUTlPTiGrhSczc3mibLjKRh7oA2LrrnEn67kOmVG7VZurle1PQPthzJufuabpn5kxCEijpLidq3IqqCKFbew7fYSR4FDI8RPuCOwh/SP0kzfHoV49FXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GyzXAUaC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GyzXAUaC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SnmN/ITWTEqibrBh99a+koqJj62t9wI4VWKThuaC6Kc=; b=GyzXAUaC2Li3Oi1eAmaAMssJZX
	1oEfGvZiAyncoV54h2E+o4rGzrcJgaH13hmwlrunxMdEm7LmmKdjVk5VG6vVAH0bpwm331kMGmREN
	Q+9dXAWjGlZWbkojuTMJKD6qr1leruCYWwcUNIv3fVBerc9UuG5mEIQ2dk29ovvAnBjZ2pCJqz6h0
	mByHlqc1kl/blpReyNBSWLC4nhPi0BYhgdMMKle5Quk9SchHW4AGTW4q4v9gw8X/dQxcUs2SiE8aQ
	krIJwk5t2X1CmNh0Xxt6j5D24MxTerDp+ggm9sTOq/tJyJbl4XaBV9qZRQ0k0XYmOa3BD3dBdWIdY
	zz1EKP5g==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQ8K-00000003K13-39Or;
	Thu, 27 Aug 2026 02:46:28 +0000
Date: Wed, 26 Aug 2026 22:46:17 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] maple_tree: Annotate lockless pivot reads for KCSAN
Message-ID: <kpzm3pcwxwnzk5kngcsfcybzst5jtyrdcphd3hcpmoc6dbtswq@atn5yddl23qx>
References: <20260826074430.1139325-1-hui.zhu@linux.dev>
 <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>

On 26/08/26 09:41AM, Andrew Morton wrote:
> On Wed, 26 Aug 2026 15:44:30 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:
> 
> > In RCU mode, replaced maple nodes are marked dead and freed via RCU
> > after the new node has been published.  Arming the RCU free writes
> > node->rcu.next and node->rcu.func, which share storage with
> > pivot[0] and pivot[1] (see struct maple_node), while lockless
> > readers may still walk the dead node.  These stores therefore race
> > with the pivot loads performed by the walkers.
> > 
> > This is harmless: the writer marks the node dead with an smp_wmb()
> > before arming the rcu_head, and the walkers re-check ma_dead_node()
> > after reading the node and restart the walk when the node is dead,
> > so any pivot read that raced with the rcu_head stores is discarded.
> > KCSAN cannot see this protocol and reports the plain accesses, so
> > annotate the lockless pivot reads with data_race() through a new
> > ma_pivot_rcu() helper.
> > 
> > Found by fuzzing on a 6.6 kernel; the race still exists on
> > mainline.  No functional change intended.
> 
> 
> Thanks.  AI review suggests that the patch is correct, but incomplete?
> 
> 	https://sashiko.dev/#/patchset/20260826074430.1139325-1-hui.zhu@linux.dev


Yes, this is literally every read of numerous pivots on any reader that
would need something like this.  Most code is shared with the writer
side, so we'll have data_race() annotation where it is not needed there.

I don't like the name of the function and I don't agree that it is worth
doing, especially half of it.  If you notice ma_ functions take a maple
node as the first argument, but your new function takes an array pointer
in the node.

The from address does not agree with the sign-off on the patch.

I also don't think a benign race needs a Fixes tag?

It might be worth looking at other ways to calm kcsans down such as the
type qualifier __data_racy, or maybe the makefile option.

Thanks,
Liam

