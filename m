Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144848820B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283466; cv=none; b=QD34BR2dlyRKeryzwejPtabsVokzK9//11wusfjfRmcyPX+V0InZQh3McbxkqLussX9e/vinMQTCt8GFsEKa7y1Cc5HlCeKwa1WHeNAPR+Ea88QEoqVNJ8ah0Vtd3Y5G3IyQiRCXMIr7HTn/GUl/TL0JHrezxSAeaEEtNiSODkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283466; c=relaxed/simple;
	bh=mhou2Z+Cb4/pm/72TrS9maay1i3tERNUtWoPc3NOTeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFb0dj1Y1FaFXC6C2O3ICc76F8AcnidOfjUmJW+WlrhVi5+ysTi9Y9Dcg3RIblHvzXrljHIJAsTkjhWmyKvBUPufrE8NlA1RAosCJfDDz1UTcz+Vczjwa+D8Ysf1VkrjiMbSAMi+NSCdRVWmD9DYfrW40x0qXrwmO/PtiF+NQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LA5VUHH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LA5VUHH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B451F000E9;
	Tue,  1 Sep 2026 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283464;
	bh=FNtqw+4cMw2tiBTTuj3vqzwte2JlYbPEDqcQmayzdB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LA5VUHH3CQRbq6TtG7uAOUnltv/nWwvN8V4834MNvXbYRxwSmTotOmWteii8UiQS5
	 QR4fRDprMmPj5OuZI0MppUEPQ57nQvrdsdqpstxXyjI1E00zLmnpLMN9UloL/ZT3FO
	 0XmliimdrLwMGlqsl+hZIsTW4GKZKZZ9EEBZc2x2c4GzLI/e4yKx5tOAffPk/J5ASP
	 x2ZLdYf9X9nf1oK3mVaEG8OLndn+E+5n+OfO8fLsoGCF3JHWDts5Pv/MKpgYoy/yPr
	 NZso7dD+ZtKvquJLdY3TsryJ/fkqf89H3HUSu6B8WDndLzqUjSBpq32qmt4O6UVQE/
	 43dW7Sls5S4Yw==
Date: Tue, 1 Sep 2026 20:24:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apcKQBRCFeF-usK7@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>

On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
> On 31/08/2026 13:32, Mike Rapoport wrote:
> > For large sizes kmalloc falls back to page allocator anyway.
> > 
> > And the doc is out of date unfortunately.
> 
> I think it would be a good idea to update the doc first, and by doing so
> officially change the API. After getting this change approved, it's indeed
> safe to rely on kmalloc() even for larger memory allocations.

The documentation always lags behind the code and "official" API is what
include/linux/slab.h says :)

When I wrote that document, SLAB and SLOB were still around and had
different properties than SLUB for larger allocations.

Still, the documentation update is on it's way upstream:
https://lore.kernel.org/linux-mm/20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org/
 
> Regards,
>    Eli

-- 
Sincerely yours,
Mike.
