Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187558;
	b=FAdyHqp4uIK7CcrwTMX91CLlgFrFYIdSGbygEDPcEjJUvay+LTQM8M4XwMJqbGEpY0wL
	 JgXOTj9pn3M9OYy1DSkGzIvBTS1C3mN2lVe5+pzi9EFTCCJ0aBMsqtrmsWBuKMhYz65Fg
	 grZWB2yZ+tVu1fDx1f5BckD0nIrHZVTm4T/h6/M24QS8SLwzT8D3DWLVev2XFZb5ZpzsT
	 NFyZ1axmhx1YSBCuFUso0B9QkuLOIa8gXKVQekYmYGsiPaLxcLtRt3NXI85O3AZT0aOfa
	 td522RKfeoG0iyq1miZSZvI3lMlWMHhABTlz2uydWleSqFKL5EBE7n0EmEaP4Nu1rPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187558;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n7EyN63YMbsGSuXorcATqKgLRCoyblrPSFRBEfcKo4s=;
	b=VkZPvwOYuYno0A9rCEe0h7npU3x/yeAkHsqVWBgPzvgG6P57aOdn5Y8CciAYefOtNJO8
	 E6uqjpEnV1KtIKBcH9Cow2YJLE0wL1W69xkUA5gz+BIBkTsIO8XaVu7M8OcDMkA+GR91Q
	 PB3OvqISAtgxfUBXydAX5qd5LAYd+5NO85ucN0v8ybTw1P+nMdzy5qPnzLhcNZCRLJT8s
	 zO8XcDWHEBGFyvvTRrZhlBnXBVt7Vrhi5vt3OlwbVdt+2+zLW4DxGMPRqdTabmEClYbKu
	 9vUAsGEU7WuQ/ifh9tGnJf8Z6qMBhvW08HeHxhiMxingESYA812N1yXfrVaZVWgdgzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JaiWIoBm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JaiWIoBm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBC31F031E0;
	Wed, 28 Oct 2026 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187558;
	bh=n7EyN63YMbsGSuXorcATqKgLRCoyblrPSFRBEfcKo4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JaiWIoBm55p1NwsB+vy+ilIpUD7pwPvzI1ksLV9662wlW7H8On6YGTVC1i0+Xrk84
	 k5W/ilarBdyIN/yCEmIWVB2gmMJRNiRZolia5EG34pbKBnltzQHPVApqo9j5WJgTqH
	 KWRZOdc+BCiaiNjLFcRDdMVXVC9h206K82s4w/d6UMEYkdahRTAIK8U+M2R6g5ZlgL
	 1rCIVXl9OztEjx91lyOhnsiVD0Aq4/aml4oVdS18wwr9XzcO/DaqLMm4VQm0ljLNWH
	 hVnQtTELWGx7ZCnaK+Q8z3vN5iIcaFh0Vxqdw9NIljvI8th3utNplBmYmtvIC/5cDo
	 Ps+l6n6ItFjNg==
Date: Wed, 28 Oct 2026 12:39:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: yaolu@kylinos.cn
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, simona@ffwll.ch, chris@chris-wilson.co.uk, 
	lionel.g.landwerlin@intel.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gem: Reset err for each fence entry
Message-ID: <auHeqGZ-hm2lS7Nk@zenone.zhora.eu>
References: <20261027072832.726435-1-yaolu@kylinos.cn>
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
In-Reply-To: <20261027072832.726435-1-yaolu@kylinos.cn>

Hi Lu,

On Tue, Oct 27, 2026 at 03:28:32PM +0800, yaolu@kylinos.cn wrote:
> From: Lu Yao <yaolu@kylinos.cn>
> 
> If dma_fence_chain_find_seqno() failed once, 'err' will store val in
> the following loop. May causing returns '-EINVAL' even though that
> entry never called dma_fence_chain_find_seqno() at all.
> 
> Fixes: 13149e8bafc4 ("drm/i915: add syncobj timeline support")
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>

pushed to drm-intel-gt-next.

Thanks,
Andi
