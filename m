Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916817;
	b=s9zJGJb47ctsuRxwMFKkTR+IzkTyeRRIqQlP2MeF/TSIDCd9CTpUz9sogJz0zxdcOtSF
	 EymrOnqCHtxlKJZG42d59TpdPsUZ5/5zoC1JZoeX0jT9nh3+QlQC8rtoJbLVJ9kiBfMuW
	 6utvth6Jl9e6rBbcqHEYM+rR+fYmW62f6eBgQ8Lx2LLfTbQWOg2SQ6XTY0y27lN2N3/oX
	 ioOqoatvZL9DbYFwiuhB3rYu6Srkn9/WDuY1UxX6UQ9v8SmBUkBeAVAm/e0HTZ/dMPr+U
	 98DDqDZ7wmikoiu3I/narNupMwqemx4fXn5wP+a/hAeYOL2+nntSV0d3P+HXOrf1+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916817;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4KVE0mlIb8Pa60CBHZvDD8qqhUD9QNgg/6EGkqm9L1Y=;
	b=jF8qON30+qXglOgKMqsG3rqpfimDPcsTaua4ctUu7NYZUhup7d5vJoDbqxofTYL/KqQI
	 BBhsU84Ush40kqnrUDVEP8Yd+jgjdPpK+uNCSgArmHkBGW0IhuliWjCf0I7WCH8auN8Qu
	 dB0yQA5gbVKiqt1dzhDiPzXbKCo9ykOqodN5Y1qfPOCFHUoQ9zJzcmeb1tXV955r0z1tX
	 AtxSl8I6CNu1bZKUJJWgO8MsR4uItO96pXJAD6LuBNmGY1lazInQjkrwLrz7jKSFpHQYX
	 7IBlj+csuQ3Fwl8cc7L9bqvf6tksRH9l7fO0gH1RZZkn7zUUArzyBqGsIL9uZ8KMZ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="FZL/4bYI";
	arc=none smtp.remote-ip=91.218.175.241
Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CD606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FZL/4bYI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DkefybD1i8xvQ56jyQ09h/HTM19UexBk7u12ksvN4Ok=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793916813; v=1; x=1794521613;
 b=FZL/4bYIYtPOxgYb2t6NdTInSEADFu24zE8bVTWhV8d7DKiaTGawM60fbUJSi3opG7QUYT7r
 5UnBWjhj0KMKMEeoUUIC+NFwUUQIA+EkX4eLPy8KMDb4oSee8lfUntIzswfHl5C7tAwIKFlgRV/
 vpx80WMwdwnvpLm0xvNOTR/c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c3dbcbf73ad53fc4;
	Thu, 05 Nov 2026 22:13:33 +0000
X-Mizu-Trace-ID: c3dbcbf73ad53fc4
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 22:13:30 +0000
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Krystian Kaniewski <krystianmkaniewski@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/filemap: stop fault-around when the walk steps back
Message-ID: <20261105-jf-filemap-v2-akpm-testedby-reply-r1-36ef39856b46@linux.dev>
References: <20261031-jf-mm-filemap-map-pages-lower-bound-v2-1-21029744e589@linux.dev>
 <20261102092750.e53073b2c7b872f9d70c0711@linux-foundation.org>
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
In-Reply-To: <20261102092750.e53073b2c7b872f9d70c0711@linux-foundation.org>

On Mon, 2 Nov 2026 09:27:50 -0800, Andrew Morton wrote:
> Can I add your tested-by to [1]?
> 
> "xarray: fix index jumping backwards in xas_find()".

Yes, please do:

Tested-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>

I ran it under the stress test from my reply to Pedro in this thread.

- Jose
