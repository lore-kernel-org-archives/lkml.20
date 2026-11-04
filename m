Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784820;
	b=QxsWMOhz9Nx0pOI1E6+BLYXmbSLV2MRO4zMr2eoMX06lfcxaxiMJdSp5U+MYblxPLKnU
	 +dZy3tng9ghFqHj6WJ/KTj7tyMCr0SgbO5lHIIjVIMFiCv4WaHhtRPYHIDtaLurevxpKc
	 3WoSyTt8drPLHBPDn1S6p9TzhgkHdoI/i4R8xJr6y1NxgXadEdQkX+WScYfuBTthceoth
	 XzC/7E1IRbJjdntBJFBxEuW9CMENMbNcXZ2vL7cSdeJBfGchoP5v8L+N7mtd55FBaqHCb
	 EzAwU2OfwJkhUiRyXBEJsWnbHJliFLfzMQH73+jAfmfP6raDp7+QM2OzQtU+az8GDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784820;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PUV7VlMf0EvvLzp+y5o1NyE7TTufq1+bMSMSc6a2SOE=;
	b=MNtk2PNEqg5QZJIAsWaQEOYJTmvkQvQEbP6ndM3s3sLJo2DhgVY511ijMRNdKc+x03TB
	 ehY9bnjFGPZqnbWty1lHYMVOXWCCYfgtcq9Y8jRyAYwq1OLJPYhngNDxvbiItTMz9XRwy
	 +f4NnlB3WXpHQ0V+WbB5BkUdLbxQm+5plu5CgUhticZ8a49Vhb9lNK7SbinCeMY6sLeBi
	 PDqkRF3TBnM9R53SV9t4js116G5h7C+vn+MYJxBSt0NqmIUDxNctu1kfS3Yvih4vwLLxs
	 Y6cBlUKX4hoC6z2m5RWwwiezNoQyoKdRso9VJV1l41hgxptaykIm8eGkvQCKbLgvLTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j7HCUZ3X;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A07606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A07606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j7HCUZ3X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8dK0Lo7DM1WJ0OGxApcuKa8B214rVf6nLR5cxtZwcuc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793784817; v=1; x=1794389617;
 b=j7HCUZ3XEX9RzkQzuaBsIvF+yJySl9qKAMKcK6gL1KSgkapo9XW5KlnO2KVE0+3NzQjJx9Vv
 hM/+NDR6x5uRVN6nTr7lF88oFSom8RZdc+kRCGptJV5SZP8sMymD/Xvhj/41ubIyEKvqSuWXENN
 gbzx1l+rk+a1H6zAqAw4+6BA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5b91f46f81561111;
	Wed, 04 Nov 2026 09:33:37 +0000
X-Mizu-Trace-ID: 5b91f46f81561111
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 17:33:16 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Justin Iurman <justin.iurman@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Sashiko <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net] ipv6: ioam6: do not modify shared tuninfo eh.nexthdr
Message-ID: <aur73BdyLKNrZAUZ@fedora>
References: <20261104-ipv6_ioam_lock-v1-1-4f24c41b261b@kylinos.cn>
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
In-Reply-To: <20261104-ipv6_ioam_lock-v1-1-4f24c41b261b@kylinos.cn>

On Wed, Nov 04, 2026 at 05:27:23PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> ioam6_do_inline() and ioam6_do_encap() stored the next header into
> the shared ilwt->tuninfo template and then memcpy()ed it into the
> skb. The lwtstate is used from multiple CPUs without locking, so
> another packet can overwrite eh.nexthdr between the store and the
> memcpy.
> 
> The packet can then leave with an HBH nexthdr that does not match its
> payload (e.g. TCP labelled as UDP, or a local packet labelled
> IPPROTO_IPV6). Set nexthdr on the per-packet Hop-by-Hop copy after
> memcpy instead, leave the shared template read-only.
> 
> Fixes: 3edede08ff37 ("ipv6: ioam: Support for IOAM injection with lwtunnels")

This patch should also

Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")

Hangbin
