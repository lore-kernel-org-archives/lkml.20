Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634696;
	b=PY+Zh7R+KczDNRmrJEUTPKJ0nWHsKMf4XwZBg8a94C1ad07Y7HQQfU/+t4PxQDIxmioC
	 DExwPKrdgbpUBrK1Fv2ktPb5k+GKLNWC62S5iGXC8OTyQpboyH4bbo8ZoctfikbN6O6yf
	 C7kf6+f8o7GKuBZWLJqPtHPjbSgpsKZ8PwAWqaREOvuPX9/N/mwYRRLaCIVGkMTa7/3K+
	 5Od+cKH7Bmw6gMftGjrlQ28+Lw2gymgFFmaicuuviGYggwkXzGXNiQL+jrtb41H3CP26/
	 V55TlPePEGNWS1AVcW4N1tALxzpTJ4ofSl9P0340sbjaGPLM9W+tQv2NO3tvcWM7qOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634696;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C7aFuzdls6CQ3GEmXGxCiI5GUWUf2f2iJx673Dth3g4=;
	b=VkirzknFjohjXZaLKcynvI9KNhrWNR32+afQOwktsjKtIQTQrMMwvzeIcmpDq2k/5ITV
	 pzU69n25WyhrrWIlLCZ2dC86R96L8iFVRSPWVWY8Rk7S6DYnYwDpHvsMEQkK5BFoumqbd
	 gBUP1Og54ae9aJMxXf8rGolzN6+styrmSliXBxsxcJYVlaqYTV5jrh4Ko/r8v0zh94Wgd
	 ifhFkkWYZCVtvjgeWKg4XeuxziB7LWB0uoI7bk4SBYQ+umEWtiWF0Qwga4Ke81D+8nU+p
	 WcpHz9VmFMOFy7NmcpJ/kLZ94kcI+mEczLYJazSlp9rP6mq7IJAu2BmXqEPEFpqTlOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5tizpqR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190D6079906
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5tizpqR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B11F00A16;
	Mon,  2 Nov 2026 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634696;
	bh=C7aFuzdls6CQ3GEmXGxCiI5GUWUf2f2iJx673Dth3g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D5tizpqR4xrHu4YwapRRWNos3EDfp05QjyFOvhcfYBZMDx/eEJa3FN+G1NpWXDX15
	 uj1/oK7+m11dI2BLfIw+WmtcSwWr3MldhBDo871T12+FIR9Vq3f/xaH75RjaqgZGWX
	 DCipWZSkILvvq1mQhLCJm2CXM0oCPy8XJsyu1cNFhxGNCujxRnYN4e7DseYk2e4D9a
	 wJpq2HpFfs5ATTLt28QQeqA9dnbMU1pnGTR3qEQ4G2n0kRKRXXaH037mDMXSwZNYbu
	 T67P+OpWf6h9FbNWNHEjsskh0/1yC86HFdXAgz9aAJZDoYacMPB3SrH724Tj19XkOu
	 kwVKcwDEwCUnw==
Message-ID: <7970b6c9-03ef-439a-862b-dceb444b42ff@kernel.org>
Date: Mon, 2 Nov 2026 09:51:32 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Clamp the ATIF backlight curve to its 99
 points
Content-Language: en-US
To: Hugo Sales <hugo@hsal.es>, alexander.deucher@amd.com,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org
Cc: lijo.lazar@amd.com, harry.wentland@amd.com, alex.hung@amd.com,
 kees@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261031153948.127016-1-hugo@hsal.es>
 <991e63e4-4230-40c0-a18f-6c0103bd225f@kernel.org>
 <1267219663.279946.1793633834409@app.mailbox.org>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <1267219663.279946.1793633834409@app.mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 09:37, Hugo Sales wrote:
> On Mon, Nov 02, 2026, Mario Limonciello wrote:
>> I would like to know though; did you see this in the wild?  If so I'd
>> like to hear more about the system that had it and the system firmware
>> on it.
> 
> No, I haven't seen firmware do this. I found it by reading the code while
> working on a series that does the intermediate calculations for the
> ATIF curve at full precision, which I'll send soon
> 
> Thanks for the review,
> Hugo

Got it thanks.
