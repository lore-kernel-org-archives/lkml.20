Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426574;
	b=TFuUYqFijDfX/LGZp74tLmonKIv1r1U6yOOuIuQR248D804On8kC+/yQrToeFrG9Ga6u
	 TYMdiB+kNggkOvX+K04794oY6zIRGz48QtsMiY3+WclZLAZnrFE+8Z8Gqwdx1Z5wg0oe3
	 IRBS3S31piwX7D0h5+Vm6BiL8rvqey83Z9bWtmyO6y68DAUlmdoDNE74Ta7bs3C/+PSTb
	 oYd5xg4Qo97JCG3Ep2xBOOZKNTanp4JoisQksxJqd0IrKPwkpHHOOAxZhBMvgslSAuAKw
	 gRu9Y63ihPXbgqOSMkmn52jyIjDnZAJICxFOi9fQ5uXFIqdct6NRdt1kCnUpIcdo89A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426574;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gVc6YM8M5IAHsgG4XamDTanrt4p9Rvguj7WxgEd5KeQ=;
	b=emQhJTCAoR03yj31KHX0FZLt/WyiSXhL4cN3lphY78xY96D5gvzuk3U98YPMX0yp/jj3
	 OHVFV/8btTtp235CMH7uBx0SXUFO83CRb+EJnFrpjzuJyw79t9XYjwaGvQySCYyaeQ3LV
	 OaK7iRVrhQ8l2at5TBy3rmfH4/J0/69mDdZrFHQUTIB3sQPH8YGm+7xqeKnmkw5wr4fNx
	 mb5XzjK0bVLnkI51ZWgt2BcGk9ChONJL0V0QGFvguCw/vREvYzugtUuygyhy/jc7p5sf7
	 6iRTD37FcxV5e23wZkhLorSQJlqZsAgxY0TJkFSFbX2uLybq6Jkh2odNriwTMWjeBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0SI+Ake;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B31606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0SI+Ake
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0471F00A05;
	Wed, 11 Nov 2026 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426574;
	bh=gVc6YM8M5IAHsgG4XamDTanrt4p9Rvguj7WxgEd5KeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M0SI+AkeHm22cD0JzK3aNdbi/6O+eZ8wy+QqXCYm4TqU5s4W0Je9tbqNcHf1Diq+w
	 /4qWAcKQTuTtcX7h5OtfiwwpnMHe8cFm2Zso4I6qNuJHt0N+2PTgGV+TaVOsDULE+R
	 /8eTOpGepsFqYb0eRx4vaVlYVKBORfpKRUmPxl0JWqbeOVFu75NLyWszQdrEOWOKNJ
	 e+wzIDvVl/DFLxc1x5PngH8ZoiQn0XDzfse2BeaaCh1dGglfOTUlydb7VJwWS4HS8U
	 wSQ2Y3zjyTnV+L6sX6/NdqvGbcvdmHgeB3kT92d0YC1KQ9LVDxdpIdrlcIXXadqa2Y
	 O0ZiVL1W5lF1g==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id D8164198003A;
	Wed, 11 Nov 2026 14:49:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 11 Nov 2026 14:49:31 -0500
X-ME-Sender: <xms:x8b0asLLHLpPYXr9uSwDpgfI2VhUaWLEDu2DPUd2kMwCXhNHDfK98w>
    <xme:x8b0aqkenIL07D2mznlyle-qTJlZYLapb1udmcB3z__LHytYYEDy1n-84bR3FZVtV
    P-bBuR4-SpShMd3aIFwr6Z0As9QlBzII7o8f-acSYJX9pu0OyKB88ms>
X-ME-Received: <xmr:x8b0aj1rPbFagLhK8QpcWu9e1gegKpofGHhSUV9WHylbRqmqwwoykWXNQQg>
X-ME-Proxy-Cause: dmFkZTEdupPFVg3GK2wZR+bhvzM7lmON/H/kDh6eMRSZDwCb3j3MA/z6XpUq9kN9AFvMyS
    zgxK6eXvhIO/RlMkjFBwb6NDEhcxkQGM+ACP2GZ/sgZgNDe6+uGo6DY8cKIOoSXxTC7CzQ
    STnAxo1I132FTLSmWThy9YNRnudLY9EDMrsciu+IGf2CIyse2jIL7gv5MVc80vDitFJ4U+
    mJa+1MgYj2BRB9R4oUsbobDR/aJklmz1wsXV6ESw+/XNvzptwzM9MY/mDWBfhH3chRy0QJ
    y5U0sNSuNj1EezXb2QP44Q5Lkgpa6wR3t6023acNG9sJppH9oxwxd9eR591GcP2ppb1lH2
    9S2G4kR3wtXvNPsWspIA/0Gd/QUWrd1DVm0HKb0D5bu2hcxrOSzvi3/rTYfdsZTfkRpmmQ
    ezRHgRTtaXq25k0YNRxgHo7tv+NcwNnTKQJl/eLtG3FTo9aDwj95rA6naYiyotToUXuIRO
    gaW5SPyZ3wu1koL57+YZGq3K6TVfBhDja32VftjmcnB5Hk9UaDGAuM1c/Y11dPYh5Ax/CQ
    ofQjaluRH5K84DYLxfT6/EyFe0PJ3Tr8rtDbFnUcKraJd/EXdwJRER1axDZmeVoE08ZeWf
    1EYf5iUDuodS6fzd0eEafO7mRGK62lmyyrmRDkWafHh/YcasbXTWAC55psmw
X-ME-Proxy: <xmx:x8b0as8r9hmV9-rllvO-t9W7mqDVo1hVlvPS2-iC6U70Gss9wTIiGQ>
    <xmx:x8b0amy95D9K4WfMPUW_Mst5o41jiuy7O38IVKV0QfTgG97LvQiXTA>
    <xmx:x8b0aihkxcjWPXzq7khm-8R0inbu85QvxS_DuG6pVnBo_x-2nwjR_w>
    <xmx:x8b0ahNIFlM4LySNmQR9QDrxQC_zmPDZWsDxcapk7bSeaLMiaHy1ZA>
    <xmx:x8b0aganL4N1jqjRssI3B8_DwA4_oj-AQV7nrMh0J_eWvqwD2X9ht8Vs>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 14:49:26 -0500 (EST)
Date: Wed, 11 Nov 2026 19:49:25 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows
 the migratetype
Message-ID: <avTEezDIsJBhsPmi@thinkstation>
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-2-kas@kernel.org>
 <auynaZkzdzL6Aeyo@thinkstation>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auynaZkzdzL6Aeyo@thinkstation>

On Thu, Nov 05, 2026 at 05:06:39PM +0000, Harry Yoo wrote:
> On Mon, Nov 02, 2026 at 09:39:34AM +0000, Kiryl Shutsemau (Meta) wrote:
> > The high-order check in __zone_watermark_ok() accepts a free page of any
> > migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
> > only take a page of its own migratetype or claim a whole free block, so
> > the check can pass when the allocation cannot succeed.
> > 
> > Telling those apart needs the request's migratetype, but not every check
> > wants them told apart.  A check whether an allocation can be served now
> > has to count only the pages it can take.
> >
> > A check whether there is enough free memory counts every migratetype:
> > kswapd and kcompactd balancing a zone, order-0 thresholds, the
> > slowpath's forecast whether reclaim and compaction can still make
> > progress.  Reclaim and compaction work across migratetypes to free whole
> > pageblocks.
> 
> nit: perhaps we could make the changelog above bit more concise.
> 
> I think the necessary bit here is "With defrag_mode, allocations cannot
> steal a page from pageblocks of other migrate type, thus
> __zone_watermark_ok() needs to take that into account."


It is ALLOC_NOFRAGMENT, not defrag_mode: Normal zone allocations get it
on the first attempt when DMA32 is populated, with defrag_mode off. And
such an allocation can still claim a whole free pageblock of another
migratetype.

But fair, it can be shorter. A tighter version is below; it also says
why kcompactd passes MIGRATE_MOVABLE.

> nit: maybe let's set cc.migratetype and pass it?

The value is not read there: __zone_watermark_ok_mt() uses the
migratetype only under ALLOC_NOFRAGMENT, and kcompactd never passes it.
kcompactd_node_suitable() makes the same call and has no compact_control
to take it from.

Thanks for the review.

The new changelog:

	The high-order check in __zone_watermark_ok() accepts a free page of any
	migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
	only take a page of its own migratetype or claim a whole free block, so
	the check can pass when the allocation cannot succeed.

	Only a check whether one allocation can be served now should count just
	the pages it can take.  A check whether a zone has enough free memory
	serves no single allocation and counts every migratetype: reclaim and
	compaction free whole pageblocks across migratetypes.

	Add __zone_watermark_ok_mt(), which takes the migratetype, for the first
	kind:

	  - the allocator fast path, zone_watermark_fast();
	  - its recheck after node reclaim in get_page_from_freelist();
	  - compaction's up-front check, compaction_suit_allocation_order().

	__zone_watermark_ok() wraps it for the second kind.  kcompactd shares
	compaction_suit_allocation_order() with direct compaction and passes
	MIGRATE_MOVABLE, which is not read without ALLOC_NOFRAGMENT.

	Declare both in mm/internal.h: nothing outside mm uses them.

	Nothing reads the migratetype yet: no functional change.  Preparation for
	making the high-order check honour ALLOC_NOFRAGMENT.

Looks good?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
