Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232930;
	b=lhvSSNO3iMq7FomGYgQJICGTFVBKCz0D8+UCbxpjJ81/NCJ8PchWezjeaVxmzdVHNS7C
	 6SuLlSsCv317jTc9wZQp0yXIr+R6XWhAhyxLnHTIHVhub78exRrMR+Y4sdLYOtYJFbs16
	 l06smTRIAqze3ZJyTH2OyrJbFl+grcQbNOLIyHXFYVJuu101UEeyqglv0PSCpKDHD7/s1
	 R5/iS8IO/pu8sJNsolOo1sql3cgmOQkpgdfTJS/70eMphBcXs8fuYp9XRb1oTULoRuvHQ
	 d0VzWGfnkAECUMHNzcZbLZlwpNoHzdrRiFi1N7xVVuYpMyjGnXUF8nqJLPrtATdaIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232930;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=31ISwiUcoP1nwNnlM+AcNE1UFEe5nZziDgYbUSqlYK0=;
	b=vMlia81m3WWgf4iZX5zyk1DjCJ/cqv3/WjovznhovoRaqjDyQsW125w+zMwUE/pGIQRQ
	 ZJJzlg8cTxU/GAU3gGYBklr2wz6HwJ9xExqlDiynKGh7eoESOSE8zaTpt1zYCHKbvScd6
	 yb8saNcA1srx6ZwxRv6QLL+cW7GnBYov06GsWCpWhYMzR+DiNNBU8hIuCKE8zBHiRdqt1
	 ++bFrXc1LKEZquWQe57QsOCzAikc3XB3q38uyDSOfeC8SXvH9EGowb7+scEW9ur/joy6q
	 p/05bLma1kgoIdZ7l54tG8Bhi+GdJWDVU8u1w0wDWq6m9fR0L9PBWoibhv5ebNmta4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nLXVC7XI;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C5D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nLXVC7XI
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5CE614BF;
	Mon,  9 Nov 2026 06:02:05 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76CC03F632;
	Mon,  9 Nov 2026 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794232928; bh=w9un5PJmooT1yfWMFaaQzUU8OhNkwnbnmZBSdQGnUt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLXVC7XIwT6vpEuK2LRZP1svw0GEjcPNFGmmqHhRpwzotbRQo+5ycs4hK07CKHxQL
	 6R9eRRQ1NlCugddQ2GCkXXcY1pHLJ/yiSdtqva4IrDvKeIIfCjaGoFInwNeNaK6nuU
	 b8g826oaOEWo8Lcm+sywiM3CD/XY1xmWpeLwIdz0=
Date: Mon, 9 Nov 2026 14:02:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, linux-mm@kvack.org,
	baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org,
	xueyuan.chen21@gmail.com, chleroy@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com,
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <20261109140206.GY9176@e132581.arm.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
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
In-Reply-To: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>

On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:

[...]

> > Do we have sufficient ARM review?
> >
> 
> Thanks for picking this up.
> 
> On ARM review: Dev reviewed the earlier revision in detail and
> his suggestions are folded in. Leo Yan tested the large vmap() path
> on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> and others.

I confirmed that my Tested-by tag remains valid on the latest version.
The improvement is consistent with L2D TLB refill reduced from
~16000+ to ~500+ across multiple runs.

Thanks,
Leo
