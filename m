Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559945;
	b=y5lanpclZG0MXSMrh+wAB6aAHf43zJnW94GAkXftfzUzJE539/Q2N+DDgaVW6FdtruNf
	 OfOcbrUQp0nuLM4pGost+Wuhk8hj/EsvEDtKAnZnxdyEzKZDaqUNCmjZiDexSy3ao7X6V
	 ygEsjPyVO6Z02yDRSAHXiKF28yUjPEY3vHf7Tw5KJwR2mSRhwz+UDV1BFRJf9ChPVGTEN
	 Kgs/n2sBMeDUllqRITYJDfPL3TE3tp1RwrrR4RgEUyWFTwzevAw8UZw7kpC3XVyej1E+t
	 UXq7qapNHuCOyfFFxYQbUtWq2Q2MmPXH2Dz3uQRuzs3zAXvB8NzPFGh+GOpd1tubihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
	b=Pn2aQCCmlJEUUdtiMZNV2/r78gJGt0Z1pUJI2NsF24+bQa5WWhEu0c3zyw9wUTXbxo+z
	 0vBLPCIJAQXm3RtkinjnjLvmVkK0cQtzb+q3GWbStUDcyc0EDxEXbOS4KslNRwixREui3
	 9Q47lfqYDWvbXvqkMEa+Y5QN8pZjVGj2IhpD692W4pNwBTgR0vYLedQ7m0iWz57kTQBIi
	 /dW8GeVRozr9q84EpMF2isgwSW1BebygDW/RAXVkDHXCXLeM/fJqS3+L04/sHZEvbMu3o
	 oOgZ1xGA6nG3m0fAp/Vj3yo3+00hWsf/7tw+hZJ1UqdRUWO2Xuxuz65BvTRRxHyanaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O8X3S6sy;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D50606B342
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D50606B342
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O8X3S6sy
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e98798cbddso5729515ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559945; x=1795164745; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
        b=O8X3S6syhCVWEmK/y18DRmSh2jQdYWheWlQ71KHRscZ8aeplgfQxyAKE7u1N//3Ldl
         E2y1zEk0rsic2g9snxMDHaNdDwQ4rZvAsvfE/wjiUJJwY5ErnbFbOmq2HtfdLZTKhtCo
         vi25f5Lo+4mSsRe7z+QSfxIGK+A3M5hsA0ws8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559945; x=1795164745;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
        b=KJ2aZecKXYFsvRddjR+fKRZ3mGar6kifjDJZn5FnFV+6fAyVHg0iy/ujsqoLsRICTR
         g0TbI+XpyEyaC1iAWuM5FOuyrZ8BZhzZzviVJwpONt53oXe6qlYYU9jiUxVlE4FZqGq3
         OKzjbwHi/mnUoaxqXHucPYgPFgx0miSn5XR/rAq8ZrqrENVUuSmrtbJ//lZZ6ozBZPSr
         1G3CKufeKUUE755LX55sPQ2VMw3MeLazCa2MaV8NXZIkadoHNZbRXOFfCODYCRbryzek
         dHRwp1mcCN7KgyKUcwf5FDZYf0SD/2OSfq02nXxyB+qtqtLSEL+FGuahGX25+hxXXzHJ
         1iXQ==
X-Forwarded-Encrypted: i=1; AL+hErGBkZcBggy1wtjAxMnHz/qDbwLmq3wUTz/3Abd/v8D5C7H5zCH5M6JVkwebpMGu/Sf2OtxhoJ0i3lGXfTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oBAEtnpG+qB47sIjs6jbsPZ2DtV0gLsYtXOGYw7Pog7YIWhvz
	aMbD52WWd7YidXNYFiL866qHD7Cgxerh5VdkllOlRt4rVAM6lahUpXHiZRUhxHMkGWqLFobJaXr
	q0k7d3b1PsMDDGwA=
X-Gm-Gg: AYBFou2lLJsWLJudV8pLS6Xu/KiL2nPce9P6CMRiW01VCHrQ+seTlcEdqEsbTGjaAkO
	E+aiYPs3bRGYNYuS53cMeq4iVZZWcaSzd5ueVHiwQqQQHP3H2ayRCuHgh2S1sBCXF/SwJgzykQz
	0RoGZb9brXkOQvDJyLHDCVq/5RPB4ySnMUlDbB9e7EIgP/9loXZ/DXxI6GlGhR5e5LHoPTEuLSZ
	IuhO86uJ43aOWaOutMcO9c2DX7oCn8VDNx2GqJuOJ74irE7eNr598CdKD5uMVM3YnTMgrAHVeY+
	iW9i8LJ/Q5BeqhPtqC8VQSG2Oivh1zvGobh1LCglvmz0AbYW8CoZ6vfHVJyrrB+NDz0WTxYT27a
	fdioe2zv/lRPe73RxaX6dBXVJOQV4SeiUFHxa9piOUE+PDzOh9ZvQbmXO+N/UDNPMaOjnmKRyMz
	z2EMqNYutUNivcffRvtKFWTLQ7RmnSyRueFGwqIPgNuOOLhr90ZZYy2ujdIf8d5UnQyDmXzPA2o
	k+CUtdkorJo28vk+SveaQnrLyPB6smlloTNhcM302XL6P+5naamD/BRAm23hHWxjWT1SsitTuzU
	CNtTKJ6PnVwXgKlvw0/U1EdXT5MpVCibItmAthYUVSfS/jAOE2TGCazdtqdno0eU00+C88gNZrU
	NfrRiodB7XzRp0tj3pjKJGw1NtqCbFRW9dxMJTv+cJV5GsX2wBGkHWEN2Dqnh0CnDp+vt6/QVHX
	0eNdNz/vuuf6BpxnDZJrN2SbSM2fX8I+YgfJhhlRIUb9OO6WSciM0NKcHkzKg=
X-Received: by 2002:a17:903:8cd:b0:2e9:5714:608b with SMTP id d9443c01a7336-2ee0df40edemr17713825ad.34.1794559944843;
        Fri, 13 Nov 2026 00:52:24 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b472sm6940845ad.19.2026.11.13.00.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:24 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:19 -0800
From: Chris Down <chris@chrisdown.name>
To: Harry Yoo <harry@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
In-Reply-To: <aud4gPOUzvHtLYnJ@thinkstation>
References: <cover.1793253633.git.chris@chrisdown.name> <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name> <202610302115.8C7AD110@keescook> <aud4gPOUzvHtLYnJ@thinkstation>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005219.f954ab03e886b1c3@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Harry,

Harry Yoo writes:
>A gentle ping to Kees to hear his thoughts on having a bit more
>coarse grained boot parameter e.g.) `slab_hardening=` to specify
>how much performance/memory is worth sacrificing for enhanced security.

For what it's worth, I'd still prefer to keep slab_buckets= and
kmalloc_partition= as they are. Each one maps onto one config option and
one cost that you can reason about on its own (about 1 MiB vs 18 MiB in
your numbers). If we want slab_hardening= as well, it seems easy enough
to add later on top, as a way to set the defaults for the individual
parameters. So I don't think it needs to block this.

I'd like to hear what Kees and Marco think too, though.

Thanks!

Chris
