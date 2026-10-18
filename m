Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB533556D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336536; cv=none; b=a9CZUkKiocRWezPNNa6DSOhhXH2k7s0Zbocp1DuRJsY9O95DhkU+0Ivx9TDCXWmWa9VviFnvZsQ3qheoFBmc/lFvUBjJyqR2hGUv8ldETj5POjPo1vDLoxXrqVSMwkZgCJ8vS3KvjA3d4ETOW/qy0Jfcn1GUwFO1QUQzh8zSVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336536; c=relaxed/simple;
	bh=RSsKlFfZf9v/F/aCkNinj7ZBsiPnVp8AbDJeBvg5SsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgPOCTCpAjgrOKdRfuWVa4V0Qf6yf+oHLyy/y1dY9AFGQrF6NDtDPM2hg9izk/pjXUZAN3esEpA6ji/Z0Ig2NC7LUzdkYrco35kswzbMsam8kN+60V5jRKsyMNqU2i3aqLVHt0EUc0cffAkQVMB4kVvBtWdBS5KMQ/4MEN87S0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg/pB2aB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg/pB2aB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772461F000C4;
	Sun, 18 Oct 2026 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792336534;
	bh=u4ZdaKOa4IeEE7Qn1NSkxriefna/c4NwZmzjW2wTlb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kg/pB2aBSXSjXYjNeMCoZ1GtVRuNUlE0AybD39s3I0MES0EpyGEaud12EwzwIqEZt
	 MaRWAs11SZZhTk2Pn4tgBmXWodV3GLeW3gFjey8oF0/CD7W72LEuq59u69DKTB5wrF
	 VmJijJesqYSLQglhZeqb4mx3J1lAv2AWX1PxsKEAyMjXwH6Y58WNNbWvYxln+WYX1Q
	 zmQRQi1NhhE3YUM2g67DySqbUnhCep7MR5c332ZOFFD2+7IdGbcyHt83OHWFYm9Thq
	 nd2ney8UF4dMvpdGBO17asuKl7gUy4vbFhrCsEy99JGX54ZIM2GX0FQfnxS0raiuTk
	 4I2YAqMvK3IwQ==
Date: Sun, 18 Oct 2026 16:15:32 +0100
From: Harry Yoo <harry@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nickolai@csail.mit.edu, rientjes@google.com, 
	roman.gushchin@linux.dev, vbabka@kernel.org, vitaly.vul@partner.samsung.com
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <atTh-yyVIPQ-zNWJ@thinkstation>
References: <atJBK6hWYh2AqXwK@thinkstation>
 <20261018150152.1464225-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018150152.1464225-1-vitaly.wool@konsulko.se>

On Sun, Oct 18, 2026 at 05:01:52PM +0200, Vitaly Wool wrote:
> > [+Cc Christoph Hellwig and Vitaly Wool ]
> 
> Thanks for CC'ing me on this.

No problem.

> How about we take my patch [1] instead since
> it isn't prone to this bug and is a nice optimization to the existing
> mempool_resize() at the same time?

It is not a good idea to squeeze a bug fix and an optimization
into one patch.

> [1] https://lore.kernel.org/linux-mm/20261013091408.1231786-1-vitaly.wool@konsulko.se/
> 
> ~Vitaly
> 

-- 
Cheers,
Harry / Hyeonggon
