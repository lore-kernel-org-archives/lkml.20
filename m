Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828752;
	b=xYQpmO9VUstCbVlqIYbCapM0bIwYwdCvFyJQRQYtt0e4THmUhhbrmNDCkHycuTMVS8EZ
	 D4RYpFy0RajdfYnCYiZIAa4nmbY+Br7UtGeCuqRJXnNmGRWNAyGjxdh/lRrDQ3w0it4HQ
	 bQYMWuAwkCcB2q3H5zZ4o1REPpg9TNvDFSS8DWBvGA4pa4rD1CaP09lJHQwzFO54Zl4qi
	 QMeCl55+8wDO/FDWm+veAiZ/Yh0xaIE0ypifVSCLD+cmpTK+q7JRChYJCiToV+ItAGWLS
	 PJcSIxsOU+JGDFgrsfvOpz6+9hNua4ZiO/+CWSmyUo9NF78ulk+Ul+BcMa37P2z7YSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828752;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EeT6kKORp+5IdL68nhIk7h7EYxlyRMPSL0xvT3ad40w=;
	b=OGa5RwWJFt8YWRjMwShM7MVyZGCTSf6n9ali+te7pMulNqPKSOetEHMW025H5a1eUIa9
	 RXgddK97zw2SCCpKmoMQ7RzKJPlTgKhoSBMz9m3eQT+O+ms+ocICFTmHSRBw9MxJXBIHW
	 yCifzB/h3uk8WXZTeS+KFh1rdRSZp9ZR7rTvKmR8NJFPT0WcbDzuqGn5iugNPnf2nis+E
	 mYdFvmMKf35qQOKkKOQAES9ZKuQpN06DxxT3ATUM19XiWDpy6Bawik2702zMFMijw+0uI
	 6qU3ISYN+WZngzWUA8j/0iY80T9bTRyLULUnff9BjiyIhGw0vd4+ADQCP1mK4dc1oKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbXFqPbU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbXFqPbU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895011F000C5;
	Mon, 16 Nov 2026 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828752;
	bh=EeT6kKORp+5IdL68nhIk7h7EYxlyRMPSL0xvT3ad40w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbXFqPbUFgikhQltv9KVm7AYfntXSmMhyP2ptNZ7XZcaUhJWXCq+tBZLpVem/2UJ1
	 Ps98KoKbT6QiMMS4vs/E6KbLop3BvT9sLOwYgLE6LKrjNh794YIBk0rrEhNibL604r
	 TchceIgB0MB0gDC/s4sEaBlSojaX9RnlEklYyVk5tq6jdU3rjMKjyd+XiHOqO8e31Y
	 xuT/VadTJYfLbgQdhO1HlQ1dBpFUPKEjlqeGA73No5yd01PlWCFScX/UMC6Yy0ScWP
	 Oye5nqVSMBt+aPYc6guaDfuqsCl/IPwnmLMJ7ZPWnX9gGH7Z/Va8t+AcocHpaBDV2T
	 W4W7nWGxuVdUA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id DB699198003A;
	Mon, 16 Nov 2026 06:32:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 16 Nov 2026 06:32:30 -0500
X-ME-Sender: <xms:y-n6asylUYQScB8se0cYa3FE6o5crBxcd-JzaBnNcyWX6gyVI66Tng>
    <xme:y-n6ah97JQWHxzDFHgnFdzb7Bt4Ge4G6_TYc-WBONKM7Dl6m7L9584ZQobVUhMPx_
    H0yo1iU9tgqU6qY_3G-HJ0xWUaSZN5aBnUR6PgSBAK0jAcYDKsO_P3M>
X-ME-Received: <xmr:y-n6ahz3JT2PjepyCEOl-Ucmuj3gyH6hJbT7WjJknPmawVxpRCcBfE4mwXw>
X-ME-Proxy-Cause: dmFkZTFXHyoiJGy6ZheZQtG51M2OBrJvqTYDsP4f8xxpys1dt6NQaTyvvweOFtaEPik+vQ
    yr6QXvtB0HIxI8n7fKDLJ5RqRzNhxnYwuzh50Veq5YzqTxIMGFfTg4wL65iADIy5+4Ta4+
    DgS4IEG70qfReP94PChc72OASrq0cCdmmY7HSQ5K1Yb2pepzb/nuNjO/jtrWTZNNv1JgYs
    5XF9G+BJdbdG54i7naOBq2tCTyaeCgfoiARkjD09pR24EsfVX4MMlTdJiSxdUEoPaZ+ekE
    cbsS+wBXRRz0NCLLwDKp1nBESbFkVfQbFgysIXEWVZy6FOndR6Utv+79EZN8a65+cvmXSK
    ul7Zenz6zPBX9yFoIiEhzOlNqTBfqMomqEwbX8+IUkTplOirjz2bdnXlSqjPbeqPtxCqE0
    wX8/t5VrNrb33g56kerRgG0GKQKrhBUNRbrWv8BhOnZIi21PKoPSlQ3YsP9ZhNIkpv9WsB
    9EQSjiQTIlNnMSkgQc9Q2C0CrlOmO0hDU+9S6g8TiJpZvsu/xGbJb+7iCE7r/YmsiLQKIW
    IeL75mQKMbPuq0Hs0eas7lo/ZPZimvE0cGET3Z1n1Zt7tqkHxGJXwyMzIxQhT91rsQAQTo
    fmcNQHUlJHwq62FdoJiwbJoy7MJHzE3EaVg7wiEjMDlXXNyelmnb+WR+DXXw
X-ME-Proxy: <xmx:y-n6aqVUbJTX42ukVJWrl__eKiHs6DnypN7yPXptDUOk8RQo3PNJTQ>
    <xmx:y-n6akaltKjsO5miz18UsGU2PK2iuJBuJUaFsBsorVG3BoF_8RozwA>
    <xmx:y-n6avTB0VJckj_hauQx4Ypj9wcGNfJwP5fIutoOFOphWTUfkIZ_9g>
    <xmx:y-n6asTTWHNor-VGA7cBy0Gnl2apYej2fgSZmSrnQGglA1T6itjG0w>
    <xmx:y-n6aq35dAN-tbw1UCtITSkQ6ceyuz_jMbkXJvk-yjOUu27Z3r_dmZht>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 06:32:26 -0500 (EST)
Date: Mon, 16 Nov 2026 11:32:25 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Mel Gorman <mgorman@techsingularity.net>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] mm/compaction: sample empty pageblocks again from a
 random offset
Message-ID: <avroysmflhyRZ42p@shutemov.name>
References: <20261104101747.2485913-1-kas@kernel.org>
 <28a340e0-76f5-416f-a74e-f74f4a2c2d36@arm.com>
 <d92f9b62-5d2a-44af-908a-ef80fc8e1766@kernel.org>
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
In-Reply-To: <d92f9b62-5d2a-44af-908a-ef80fc8e1766@kernel.org>

On Mon, Nov 16, 2026 at 09:38:29AM +0100, Vlastimil Babka (SUSE) wrote:
> > IOW I think the probability this patch is going to have a downside is
> > more than that of upside.
> 
> Agreed. This seems to all be based on a hypothetical scenario, only
> constructed artificially to demonstrate it. A real-life motivation is needed.

Fair enough, let's drop it.

It is not entirely made up, though.

I stepped on it while testing another series. A fragmentation stress
test gave bimodal results: no direct reclaim in most runs and hundreds
to thousands of allocstalls in others.

It was confusing and looked like a regression in that series.

It took a bisection to find that the only thing that mattered was where
the free pages fell relative to the stride grid. The test in the
changelog was built after that, to show it on purpose.

The workload is very artificial, but the fix looked simple enough to
post.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
