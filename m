Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833968;
	b=OPkDdWXgsRpQkKq+Pp9TbwvmnvKJV/MJ4iz+JdryXgdSejk/MWDKinZlzSDwdHYd8If1
	 QXQEaUQmQLO2A72SI8DyP2kBTxUMdotj335clhveK6ahCpNcq0LzWEFZ8xJbh6xVwd8EG
	 bw5Sd33qPlA7GyBvFH3lciSHykgN9VI/NJysBuD+hPyewQmBotS5qAaE29RsIfa/5e832
	 sEw11D8uh21USrbO0pDHZHfCBKPCnnlRTMRLJB2xFGBuDCi593cm4bh+aGXRuyAUiyQ0N
	 sCRjPV0tZmnLmOqJgoA13ZuHbNmDfmGpB+xY7iAsyuiNdG1mksjsGx0KVeXlf3Ik9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833968;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S8+ywaCuxwURWPp9vITK42485CIUGSC5lym6cLndajk=;
	b=1PxzIksupXaaF3LM1D6PQt2FgHicSqtQ5om+9UJwsmi8PUcuvVFGLBJfddL5jhCsXpAi
	 8ukj30HP5gGbt84HMaT83eCRkWtnATuqI2I5ToWkt94cE24+pYSAiNKhomlCn1YaIbWXk
	 imCmEAat0xDpYJUTV5vkfawPJGHvEka3crz887J6mJI6rsuS72KZprVqGv82f4qWE7NFb
	 Ot792OQr4DloSJb+fw/Kh+Cg6FFxMZ6F0Uz/tBydX6SqE2p80vr9m/HtmktWTY5AnnyCP
	 z9UGENn/Nq0lPQf8zJ4ATVh+z7mrURkf7UKoKEytc5ZmH+s4kox02a7en/XoPjJFHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N8C2gB0w;
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C4606D804
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683C4606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N8C2gB0w
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S8+ywaCuxwURWPp9vITK42485CIUGSC5lym6cLndajk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793833965; v=1; x=1794438765;
 b=N8C2gB0wmhjMhk6mOX9K5o4dj0GnGNV8/EtSP09Ps3eASMY0aalPiV+aUMFtqwPrH4XWTwUg
 39Mi5bISSMrSbjqzS0qfu43dFhjDGis1MphF1EtDo9KYkOIisTczq4PFFRPPWXIlTiiCMbTyQ1k
 YYsvNXztVhwgcGQ6CLzbTse0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc1373684b9d3203;
	Wed, 04 Nov 2026 23:12:45 +0000
X-Mizu-Trace-ID: bc1373684b9d3203
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 23:12:41 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/filemap: stop fault-around when the walk steps back
Message-ID: <20261104-jf-filemap-v2-pedro-reply-r2-74c87c6fbcf@linux.dev>
References: <20261031-jf-mm-filemap-map-pages-lower-bound-v2-1-21029744e589@linux.dev>
 <aunPI5eOUOAEUa8d@pedro-suse.tail5790ac.ts.net>
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
In-Reply-To: <aunPI5eOUOAEUa8d@pedro-suse.tail5790ac.ts.net>

On Tue, Nov 03, 2026 at 12:12:58PM +0000, Pedro Falcato wrote:
> I'm not sure I understand. xas_find() was fixed. Is there any other case where
> this loop can step backwards?
>
> If not, I don't think this should be Cc: stable, and should probably be a WARN_ON().
> As it's a hardening patch and not an actual bugfix.

Yes, there is at least one more case. It triggers when a read fault
starts a lookup inside a large folio while a hole punch removes that
folio and a write puts part of it back. A stress test I wrote for the
race still made the fault-around walk step back with Krystian's
xas_find() fix applied. It happened in every run with an artificial
delay in the lookup and in 2 out of 40 runs without one. Some of those
step backs left a page mapped before the start of the mapping, and the
kernel reported it as a bad rss-counter when the process exited. With
this patch applied none did.

A WARN_ON() doesn't fit because ordinary operations racing with a fault
can reach this. So I recommend keeping the Fixes and stable tags as
David suggested on v1.

- Jose
