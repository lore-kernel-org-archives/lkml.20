Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397016;
	b=273ejq3l3+TGhi4UiR33+aruVuNuhedQ46Iq+xBXjiDXgrlGtDbM7MjzKTkIlrJSwTAV
	 dnbEcb59FrRiEaHZ7Cm98ylDA1m864yhkm2sz87mFDFIGr9w32WHIukJMbNcXAqmzB7YK
	 YZztsm1DhYIUhXMkz1UfsPVdQYhnOBaFgLxoJnrI9Iws84UU2WXliGZKJIqVq2F3f2C/3
	 TA0vAr4wXNywuAcw3uMT/ypkOTsD0/2IpIPw4NjhySXYyLB1cqSnBKYMXhqW1u7dMvA3j
	 3qMJlFzlymhWeeUfxUxdZ0ge9hAfKzmWPe5wdkdvnCoRDqDz/sqK2tPuRtFy0mHvlGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397016;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=swMse98eNqiMJcwGyFipJhNVyCCyR23IATBp3xslRm8=;
	b=y7jUOEyq5sxncqYVt5tdhLLdRvIfp+sm5lOe4JCAJFsgRHL6n0nDpggR25l47qbJEl2/
	 jsN+V2HarIc+/B9k5jNwDLNqweeNBhId3Ed7ZZCSVb8l1zmJ/qgATXKkaDsnxlLd6EolE
	 8aRdsfgLz5103RQkflyiHyGft6BvHAPLUijBub7rwGaohM4bUEY6wieU9+Ouz6zCD6YCJ
	 Qj58cSHeiMLmIJqe2pi2HqEcVD1/qm+amV2mmPJG2FJdYkFCotK49LR2bjxhdA9gUkFi6
	 rLXmJ2yAA1RHJXW+l2SUIifRRGgYmqNwF9oZAPpozF1KCPSRs0rZPCkVYcxJmna9Imw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GMnpEq10;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34D606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D34D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GMnpEq10
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fEJSAiQwyRf0hWMsSCb3epTBXmZZN1Qcr2L+tTJSz64=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794397013; v=1; x=1795001813;
 b=GMnpEq10QGcPBXEM93OAvnbAIy5beCVgnowsVFE3VCN8fUNaBrroVVqsTzaubVcYfZHgMHS0
 szCx3+jKO2dtZbDN02RyACXrWNdFaSfU5gCkTaf5b8g2+LqmmCNJrwQheGYJ/xKTM3XW8yNRanG
 dPa/eqHnk+5F/nub+0WQoWWM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9124456fdb93fcce;
	Wed, 11 Nov 2026 11:36:53 +0000
X-Mizu-Trace-ID: 9124456fdb93fcce
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 19:36:47 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Message-ID: <avRSHkq_jcNuDg1r@fedora>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
 <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
 <auHcj2G78VkXy-Vz@fedora>
 <auycUvCC2mL_EQ1r@thinkstation>
 <avE01iTQccxQnhl6@fedora>
 <ec39ce6d-e604-48ab-9582-04ff73d13c16@kernel.org>
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
In-Reply-To: <ec39ce6d-e604-48ab-9582-04ff73d13c16@kernel.org>

On Wed, Nov 11, 2026 at 11:30:09AM +0100, Vlastimil Babka (SUSE) wrote:
> On 11/9/26 04:01, Hao Li wrote:
> > On Thu, Nov 05, 2026 at 03:19:01PM +0000, Harry Yoo wrote:
> >> 
> >> > Given that, would it make sense to
> >> > change this line to something like:
> >> > 
> >> > if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END &&
> >> > 	!slab_tiny_enabled)
> >> 
> >> Maybe you could send a patch as it's a separate issue from the patchset?
> > 
> > Sure thing! I'll post it once vbabka's slab_tiny series lands.
> 
> It would be better if the fix preceded the series actually.

Makes sense. I'll send it out shortly.

-- 
Thanks,
Hao
