Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872216;
	b=2KEMvbUKKqVfGd/1x48lu+FARkioCnTwJHYk7+YOlLnqaYR6aDyPhWIeibChKvqpXSX6
	 Xu1m8ZzYjlDMIwpL4T3SanSlzsE0O3xxm9v0G8BxND6xAlrWKWku9xeXC/DkDi/xZIsRq
	 t5HFrEcAC613JTvqqAw0ipGhe90OertP3TLgDF5qqFDo7i1kNHB8xrCPSdW8mmJx4GoQV
	 VorbMHsXutSl+2J8KovuXG0r0Noz56Ono3b8CzqI9P/un2Xb37TZugCVetaDj4wLquAUp
	 oIxyj8JoG9btN4vtF3bO5XvLUPBJaax9ZfcqXGkU6qT2/dHyZvJngoVGaYmwkoFh0cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=4BpAS/bcGUHjh9IAA6MS7m2MaBa7QH4c9MTUiHX6xyg=;
	b=S3T026ustk3PH5Al3dDNqHltdAWi4hARFw8XbGTZp70Dy/zBM0OehjjeRhvjgOtU/9yX
	 UM3uRJgOU3VqdGjxq0X6g2f18ZgqA6HYs+tpfvCTGZ9bZ8jOFfSAKms4ZDFkXXEbz7WdN
	 MceamaRS6Lkz+pgx0KhM0+VixovPAhBtI4BQoqmXdOrlN1oOIh1gOq/bjMn5KBezDhjG8
	 65BIzBwf13+Mhg8JPO8lwBWoFPLA2khZbg8JfYrgn1SHKcr9v1sJVdbGJZ2qzGd5lbRJS
	 67wr7rx++otqCpi58ic+syt493mx1EwWkNMvwEZEJQ4v7ThL2fwHaWykb2J2NeUx9QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="b/WMEW/n";
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D0606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b/WMEW/n
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53669f7b518so53009831cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794872215; x=1795477015; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4BpAS/bcGUHjh9IAA6MS7m2MaBa7QH4c9MTUiHX6xyg=;
        b=b/WMEW/nNNYTzeyXxsy1FVTSD1/hAuRiF/mhGp6YkWeKmoXc+HAaWyU13MQCSulMJD
         GeVLaDgA/B2fmZAnmD20I6kTn9h251qnqTb77KVfnFaNDHm4Z57Kv1UatsFBJHMBNDpy
         +E4jpXqxMK3OiwUuuCcBiSXD94lQO29SDYUrJwVtaXsYWh7vTQ7ARJiy9XVWlKpIGX0k
         cXrlGvlCcFskX2sTul+7H9c7muUJcnIHCTNqgklktzeR9xm7RfTU00/OhUFNdW7uh+FF
         jxuaZFOX6gRBVqpTFcY3TqRbwtLgSwzAgTIyjpqlaBW42lieoN4j9n9Z5ktTK84wp/ko
         qtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872215; x=1795477015;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BpAS/bcGUHjh9IAA6MS7m2MaBa7QH4c9MTUiHX6xyg=;
        b=AGOpVkhiBiCUjRW0mgfoa8/yK4xoN6gKGR25Oq9HLXqLxPF4rhVuuhYWB7lK7yzn1z
         qoVEJnuCtxV8VW6/E9gQQxgiOjkUp2qmEjrD3ITbEvJm0MOZ4eStY4h6pmjGt82n79Oh
         LQD0LRwJSjXoKT2DXcmhFfADpbYd8170NJ/aoemWj0P3fwysCdpHQ/PMvy5N3/jj8DBT
         qjnt+XwpmRAIIy4B1iAKq1Ee88U0xo2ycv6OmCjLswC3NMA+INfEpZJTXJXLvxNV8QOA
         3vECwvvCNxpKmJCOWLdL1OrXyjar2ZuD7objxqDF+KgRSMSChVVzt5HY7FMj2o7p5wb+
         NdBA==
X-Forwarded-Encrypted: i=1; AL+hErFBKsZjR/jyTq348sb8aQeluHYsxgXJjQVB6xnOxdwEX/Fz3vcodPfFdGQoVgwcEEF/qPNfyrtr3T8+g9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hn0prHYwhjNINkAHfldsejcmCB4aW9vkDCvue+3k72GY/WHc4
	SXf/S0G9WdK3gn7AlH0xB83lRERsTfWL35PEBiEPxhEh95pFSErHQPEFttuaqexRkF8=
X-Gm-Gg: AYBFou35G3y+1uti1S3HPaf56cJwp6DLXZW7N5L944yTo1QN2Mr3FzvAB+jCi+ZYZ6S
	aCWY9g8LyakycLLmS7SuEQlZn5eKc6w5OXyiKeyfcn1hpjsdpcOslwaxYuYd9xolHqxFZ0pZYs/
	QYVcVRR8FvDe4tI/C7Y+b4ebYSzleb00O11/IJ6aQahLmslP8p2BvAqfZ4bkN8FsiXGNb6X6hxT
	Hxd3AulrMo97kTyq6HU6rtD1e8Ha/lS9X9u0TELHyQfYWt8POGE1quTjLEfPvw4uJvdCgYbhtk6
	sAkVsmVZe+QnZABF/XIV/SWy5Q4yr6/oUhjjWSR6QGiLc7ASRL7eWgfnGTwtW74ybYq3jAj5eXI
	9TRBv7Ze8q9tUgqLbkFEuGFo11kEqYO5YvB0/B894Yrx+6PzW9XtyYaMc4IIoX5tCcBuRwkG3y3
	kBb38XNRo4+tmMKl1/3MJGPUrYE6t6xV2PufA9mYbArvtRp051RQDKYdKYEMdAdJphg6S2zTeUw
	724ThoGxCXksmafszXYX5c9lMk4IguzgkUW6yyfb8xfDhbSOQYTLBZ97bLJ24r70BOFud/+VN1L
	vpbzC4z8D+2WV7kd+2Z9GC2HUIepTd9J4UjPAgdp82VQrx9UOIlF0/TZFSVuzPM3L2kKIJ+8cwN
	8dFnMPA8=
X-Received: by 2002:a05:622a:124b:b0:536:9140:e2be with SMTP id d75a77b69052e-55ac948cc41mr185864421cf.74.1794872215394;
        Mon, 16 Nov 2026 15:36:55 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920ee3ccf23sm26929356d6.7.2026.11.16.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:36:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] mm/page_alloc: move the kswapd node skip check
 into a helper
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
Date: Mon, 16 Nov 2026 18:36:54 -0500
Message-Id: <179487221437.482102.6995971224578926980.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 15:52 -0800, Joshua Hahn wrote:
> get_page_from_freelist() checks many conditions for each zone, often
> with a big comment block explaining the conditions.
> 
> Move the kswapd check and its comment into should_skip_kswapd_zone() to
> make the zone iteration cleaner to read.
> 
> While moving this, also resolve a checkpatch warning which complains of
> a waitqueue_active() call with no corresponding comment explaining why
> the lockless use is OK in this case.
> 
> No functional change intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Nice

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

