Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3B3C9EE8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166832; cv=none; b=hNip6xhVaeykYxYE2/pjHcXvJ9j/Zoo0wjFzLbaPaqE+oMiC7KU5rOlntjsEB3lU9iTzhN33Ju5vmUZ3zqGDHiDYav2Zx4oi5YzQeA4+HclcLvIrXCn4hNRACuKGw9w4Lj5Q28ZkpVsOfUmbH16sXJdv/DPOYRfZlxPR9vj2ZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166832; c=relaxed/simple;
	bh=vMN3y0CsRooIBF5EkmEM09TPBTNhzaR1W+xJiHiFbBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSAQ9I3Jg1D+t17IbccTVuWNFTABp7V7Ji+4v5J237elny+go/aaS3FedpWacvLwEWaoVe3xl6ToJxR4DkjCgDLhWSooY4GZX9g3xT4vZqKXRvg7/zUZ9/uQJcUAbc84Htef7FMPhGQcIdj/oeDDA0ddKR+x6sGxu0QZI/a/DAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBSlpBM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBSlpBM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F961F00A3F;
	Mon, 31 Aug 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166830;
	bh=yiaBSXJBi6rfRQ1EXaWCLbqzNjxGYuKOofbpERx7Asc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBSlpBM3qQxhUTKpgQKzFxHcBOB3+VaCkWi2TkVH59ldtGZ6DaywHXLYSMFvkxW5h
	 s0FaChHAjiDMokRv+gbYrBPSsgUHkdIDHBsXjiGELSSUa+03c/RdGm6SuBOAPxgb/u
	 Gu1VIaxg52dXPVM4e2NMQAT+BVJe/09WFSfhgyRQsCoEYdMjgVCFCLHNfRhrowhpht
	 Ja+RwLpavHGeAt1aK0yP5F9p/alvMpCJKOI4SI60NPaj9dNU6gYcPBL4aO2mE0EXia
	 jP6t9uHVh7VGnHFAgf+aKMHDgyFNAyZbHOesd3u1wTr9hlQ4Y2s278YDg8G9kix9qK
	 XHgxEkW5OPiYw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 9AB9C198006A;
	Mon, 31 Aug 2026 05:00:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 31 Aug 2026 05:00:28 -0400
X-ME-Sender: <xms:q0KVarTWUxIZ-YWiiUoa8AByKpiLKZjp7Rw3brnMNmduI3pGyD7wmA>
    <xme:q0KVakotM0EIn90XkxjBctLYg4kU1s0oOv5u_rzNHDx-_h9feQiZSiE6zVBQZBKub
    AUM_1Me4OslDjJzmBVilufJAe9bUDU38-L_2vfGhvrzHx_FJMGoJ6Ya>
X-ME-Received: <xmr:q0KVagMkZl0wZZXm9ow_MQpIqlNkZ_--RvNJs6IqNuyuJaWsZW5fuu7_JHA>
X-ME-Proxy-Cause: dmFkZTE6YXZFw3+0yBIahT0x1LPBTlLLZPuxttiyblyXs72KxZl0B/BdM8FboR3uFZpmnj
    xQjPg3csHt7ujcK8dNJIqYh0ts58hJ27jINv/WvCff/ceCLegfw0ekUkhN0Xag1WcHlrEi
    XjGEUmBOGvkdEr0kVyPiy1UVa82lgKtzW4NP7lsBEe4ogL3vqpHZ3Fv54q6YS5VNUlyrCT
    5pWONisK57Ybw+poo99Z/e5+3wFsmLtp9D/Mv9oJlSUw+9xU1wc2ITnPrahkDyId3JU8cT
    57WcXuuDVCUYqvpV23ZTmp5iaRSmxn+0kh8QOySmsMdwPOTbmphSj6tw2OMFgIdAxEiEIt
    9WaRQYkdn1zu572C4N57kMR8/8AihkhnnYo5NyYV4lZ+JY9FnkDkmBEW13YRymx6pYs5c8
    lbPBE5IntykebJBMsz8z5TODA2suqDR7IAtoaoTr1uLJeNQ6NWKd87ewOMOEN6gynDekCY
    NIxwjNvXubdAqKil5v8RFGa2cVFUS9szwHmbCnBYrKoPgqMNalPP+QX+HphwiIJ5Aamu84
    tS6JdfrAm5by+W8VIWNxJbgsU426PVeuN0N9YlTSjhcYdtypltSRlcH20Cv+8QcS29WUsp
    D74YDxXYqQvzOOOMG9sq4vr2O0XFLaXwqStH7TkyVu6whkaW3SuOb1kp6RWg
X-ME-Proxy: <xmx:q0KVaiyP7WlFpjRyGeY2IVByRrV6xzUN3QtHIi_QX6baM-yknjYQnQ>
    <xmx:q0KVasy73Ywue5nTMPzyNQW8Vb-G6p1k4UKXGuu_IWQyzmjnqN8yww>
    <xmx:q0KVarJZLq_dIaItqI6zd2oWeZnL6ufX8D6WfqYLg5zHhPC91ESxVg>
    <xmx:q0KVaoho0BiCc39jyRLy316DOVxXJP6AspKmjcru7SgwqxcxzRoiGw>
    <xmx:q0KVasPvBexZMqfnKx5GGaziSCPs0nui2LO2V2plksQvuz2_B78inLAQ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 05:00:26 -0400 (EDT)
Date: Mon, 31 Aug 2026 10:00:25 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup_test: report actual pinned bytes
Message-ID: <apVCWCn8pXrR7Wrv@thinkstation>
References: <20260831064808.77768-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831064808.77768-1-sarthak.sharma@arm.com>

On Mon, Aug 31, 2026 at 12:18:08PM +0530, Sarthak Sharma wrote:
> __gup_test_ioctl() advances addr to the end of the current batch before
> checking if GUP pinned the entire requested batch. If GUP pins more than
> 0 pages but less that the requested batch size, addr still advances by

s/that/than/

> the requested batch size.
> 
> The next iteration detects the partial pinning and breaks out of the loop.
> Again gup->size is calculated using addr - gup->addr, so it also includes
> the unpinned pages of the requested batch.
> 
> Calculate gup->size using the actual number of pages pinned multiplied
> by PAGE_SIZE.
> 
> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
