Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520B4734E2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269129; cv=none; b=kXdf2Lo5UHrPT7zWxCV6wJiaYbC6fKacuUBC8qTA05rQQfzYxIvwwWF0TI+SG2mNAXRNuc3IkRuGF9k7ffHVxmTH/7HblPv+J4gsL7yaZ1V3eRk4QfHwqOmxy3QoXvftE+Nbc+CUtm7KtRpQkU5bzLFl/JtttEi+difUPOEkZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269129; c=relaxed/simple;
	bh=DC0loMVF9Rh+uz5LnHnzC+u/15KHWRhe4j0KkU1Yv0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKBynBE4othb7OKDcnb8vkyOBe7hFsGqH4Jqhzik3AYBy88imJkOj3r7nvZAfMySSpWMSGKBpEM3LBNGmjUmPwF5sBQiy7LKhuITd70naIRCNkhzlUmuVVdZhvQhMOFpIK3g1iPOuxzUqmXJscRIhrm9mwZBfhx9YwMzsEnwOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxUYEHoO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxUYEHoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A41F00ACF;
	Tue,  1 Sep 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269128;
	bh=GjkoT1gxvL78iC9qUQ1DUbeqA6ep6ohbNZ7UjlvHRxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GxUYEHoO00HdfaVkssUElaOpXc26GL7n7K0UP338xb1sdyYbLd9XCMD2Nsz70xrey
	 s2NVkTLmDsADQvfrZa4iSwkBNsCu4231Sv0hpW5T/hctM/NJAv1JQu3rcAn1ZwguLo
	 jWzRBEthdXwCF00I4hvOy3T+1l1dadHNZUdEtClgmnOMQfRnHzbYdn+HkGPlOamQ5Y
	 IsuScwhcCiyjEaVlSINR8ac855kwW5x7txObdP3myKUwYo+nsaQg5IFeJFBQ2LTkHb
	 X4ZruLx3ku3GJXuRBAR4Ef/ZBzIR0BkhbEZkgvYvtHg4N3XpDcH6Q7r79iWB4ghlG2
	 RWWPYXaWisNeA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 986AC198003A;
	Tue,  1 Sep 2026 09:25:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 01 Sep 2026 09:25:26 -0400
X-ME-Sender: <xms:RdKWar45zpB_vsbUR8UzOreKewyA1VITM7TZi-t9bhdGK7JonuK3-g>
    <xme:RdKWaocZaUVLpwM_ztj_c6ehWPCXojyWTp8qF4nCc6ZZaIAgLx_kB7u0OPgjUtwoo
    X9ks_vkUlPv5E_w2uXx70JIBDK_IA0S7960VatVAWsmb7u_sTyz-Fsr>
X-ME-Received: <xmr:RdKWaiEzzq-z7gav2AfzuOrhYtio4g85HQZXGKkP3MpJpAM_3klNZfFjFmY>
X-ME-Proxy-Cause: dmFkZTF/zIups+nPbokX8UKm482kR7kMGorOCvM9dp0+cLB+pCykGtcbZY05LQacwdhnLX
    jfsd5gYa21u1EwH01eFAsZxyGms661mdhfrgQ5daWtupEuHrYChNpKfKzNohEcLtwsd4tz
    2z9yaU1GFL78g5y0O897nRdxoP1JxqCAo+htkT0VOrJFjYw1l0K10KoF5YBznBZws+BTi8
    3A6IjAe5+eYC8A8BZShoPcDSEEvu5HUQZoq/GANPP9XbB2FlqiJVwCsMx1J9I5wfq8HGKY
    QfN34QoBXAMHz2/t0VKchNn7cOmSsX8ro/UDTX1nCcyU4R8ru2TkT2OGrHj4v15kH8zZAx
    eUqN2BRuKS+K7M7M/2NKXl7+6JYQzQfiGWG+WtWaAAPOQIlzJ0PocvWxntXf96Ui0d/NWM
    a5DWgwfgtGMOWIfInxTC2aJVfrDv2057TH8oBrNAvf0sN5H9+SiX/HmKRnZr4cxkf91D5w
    E6k0WKDQNQL3JbuRreO3NpNsimDym8+KhtSky7ZQCLk+zQV7ee38Q5zZnORrhUoiyrSfYn
    5ukvKky/3HsCWcXxxiKzaogbCZ7H9rXD8XmMuYpizQqlV0Lg11QpKHHqm7Xdv0N2t54Fp8
    39UfA3On+TxieASdh7+WEo0ZBveGoWfESQtqZ3JxCleRUPDGmzm4I0y0ABow
X-ME-Proxy: <xmx:RdKWao7K2pDGB1SatppoN-lt_7qNYaEwgQzawFLKSELvFOnrK9SFDA>
    <xmx:RdKWaltaXTJeGvnwuNe-_9vkEo-2QwAU3hqqfeFmPwuxxezlhXJYBg>
    <xmx:RdKWas94V2Y6q7P1oy5S1EgGjNBHmgCzI7axArEXYl9cmDLQnGuU4g>
    <xmx:RdKWavmFmIDSRuyxl4z6Go6Le1JGXnYZA17VHG5a2iFyyRnQMCvReQ>
    <xmx:RdKWasMMQQrQAymUXvvL9YvpPnnYhyFvpdE5wzS3UVoPfpwRjoNEpm78>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:25:24 -0400 (EDT)
Date: Tue, 1 Sep 2026 14:25:23 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/gup_test: prevent overflow in GUP batch
 calculation
Message-ID: <apbSKcI2DQt86ncE@thinkstation>
References: <20260901083452.115365-1-sarthak.sharma@arm.com>
 <20260901083452.115365-2-sarthak.sharma@arm.com>
 <apaqJk91uAN-zD66@thinkstation>
 <f2fb4b62-f96a-4df4-915e-eb7130671515@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2fb4b62-f96a-4df4-915e-eb7130671515@arm.com>

On Tue, Sep 01, 2026 at 04:52:11PM +0530, Sarthak Sharma wrote:
> Hi Kiryl!
> 
> On 9/1/26 4:05 PM, Kiryl Shutsemau wrote:
> > On Tue, Sep 01, 2026 at 02:04:51PM +0530, Sarthak Sharma wrote:
> > What about this:
> > 
> >               nr = min(nr, (end - addr) / PAGE_SIZE);
> >               next = addr + nr * PAGE_SIZE;
> > 
> > Seems to be easier to follow, no?
> 
> Yup, this would be cleaner. Do you want me to respin with this changed?

Let's wait a bit for more feedback.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
