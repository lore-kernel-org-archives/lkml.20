Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907747;
	b=2LYBcqFdm777MPqYhu+OX9NxpJCa7o8kNHdkDD0qBfcRO1WwAc/mbcA/e1fd4c679HH1
	 4on5+a1pWXGS+H9gCxPoNL6Gnb1CBTcg/kqbZg4C6oX4mh5YlLAE+T7TZXEgQRZWXI4aM
	 mOyGwRRbixiagDpDvHvcqpyo8IRNCOVIqU60Hi7IfrtCDqMtPQBhfss/XtOYMUOsf73vE
	 oHxZp7CdFiFolEh1yaadNd2jHihZExRmC8uOaxCz+iAzrrg1PcADVI7y0R/QKWUEpAebM
	 DqO2Y/sOTL9eL6tBqzuiHlbBdX30cKNJlqGkhcSEtLU4e4szspbXhMGBoz6l6CJgqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=pwh1ZuUgyzVobDFnDosRkpIc8VIXPPyqqOxv+keTtXU=;
	b=lkAAqsUxIFE/EMX6pUOqoFMy5gud610+23Vs87M9krp60eB5GY/vJ4Tbt7lcDcz6BPtA
	 dbkjHJ6NPVJNcBvOkIhtHLpq4mq7k5xVlarYNAN/aUiExO2ko8nntawunatnRay3YkKAx
	 7QRpMn4yhP+XGfCDEdacKB8DSkM4nqaa6uRkbbdBf7uKQIFSc9bc0U4uNxa6RnQy8kL6x
	 3fec40NvbcN6dQaqZ4drtSw1elC/3+kagdxulBlygXpeJD1cgkKd+F3lM6IMdjVOJhoEW
	 Ll28Bp3EIq7IoEJax2qf8efoVyVmerxRyFMOoQ/crQU8uZINIbDVvEq3ythQ8Ga4fJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FSNeyk81;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FSNeyk81
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c6ce60697so87651026d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794907746; x=1795512546; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwh1ZuUgyzVobDFnDosRkpIc8VIXPPyqqOxv+keTtXU=;
        b=FSNeyk81VBZnVas/yOiF9lNcnD5m1NpcmzZmjNKv3Xom86jOMcLH49g5LkZbsH2rF1
         2xGTs5nFc9Sr9/uvd/CUq0sh2A7j8vA7ebxAiLj0h1ywuBJ3uZRIAnkANTaM7D+Gl5tI
         gWL+nfcoHLPgnVUliK1IDmsMFvroaNJQ0lRkZ+PRjSdjU1vNQKo9Fw4+jDGXbY407sX4
         TeDUgMliu3izvBFUfQWIgyUR++KZyK9v3nYhjcXbHDtCqAVFerZZAZcHyaSnIjlwG0ZO
         l8eInFg1GQ7iAJGnVqG0MbAlVCXCTEIpB3VA4bcfH2wVlIXY7aU8DZBVlfJRnlc4gu26
         YnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907746; x=1795512546;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwh1ZuUgyzVobDFnDosRkpIc8VIXPPyqqOxv+keTtXU=;
        b=0smQYbGT3fGemMZDgsa7z98s8MSEaGUP39UCdTObXZfkWgqTa4mjhNugNTCKjvovbg
         7vMk8ufqXphfdD9bhSEq+uuJJGHI2yd73KKAh4V+4Hqe/eESIFcKkvCsoMJs817HvGzC
         x4M6VdUV0ho8yVNorrjzcDdT0naFfO03bu4PiOfkp8o7T5nQLwLScV7/LURSsZ1VjinI
         F4jWWPYniXdc3u8WOyaIpvz3MK/CV17ZE0thzKDQRXSOlYou8yxeAJ3Q9VVALxjHnc+4
         Bf1S4xZWgDiSEvGyF7bPsllFyoYCLEROEfWXBMPQKEaIYON4z14xPewsgbYSC6TMpQMl
         TuQw==
X-Forwarded-Encrypted: i=1; AL+hErHAqK5/0zs4MyqFiVAG7bsR5V8xT+IADPOpOBkVNDNzohTDmjiNJnMeQPibTKnltR7wnh/09f9XsMw8HaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z85z2ZVAqUUA2Dh/VLqaL/b+JQiBVsoDdz8rsGNVqFm5OxUcqHu
	x4e7Kg/gBl3X73oIcOFtPxTtwi64h3Ho9oHSwABrJKXnRLHqdIT7bBqxQcYBYbkvtvQ=
X-Gm-Gg: AYBFou3Jm8CQfLf0c5RAyEt5gZ/R//BoY0BYCXd9XUub6FUVLzrQ/2YwamLq9Jsn4i4
	gtCEDYrk/+1a+QmbNBgvvlR+ksu4EZGXis8ubgyFOluiOCRvEpPsKEJAAMNYytxwO6xokE/kAhD
	dPjkqMUU2kDkZhchMcdsR82X2YsY4YRi+o0ZJKYJrsZjUdqQA0r5eMSXG3o+SqCGBDrWRN8sfBA
	Pz9CKX1xuuyZqXiKzXLtCTpTWLw8GNH6KGGfZLSEDm6SL/9PHKmrkIo8GJacjrer0/x56hzzXeL
	hLSkbLMhspYCEKQSwf/S9z2ZwKZLZk4PsYfq7NGJh4jhiemGugiNvF+/tNWVhVsByn9wvNUCAhV
	l3Pu4E/4Xf8Flrv6iwNL/yRXh7yBuDsg3T0udmccXUyVxM3GN+qr8vdADNUtgqJCPsPuUxaFogc
	xwhKTo0GMw0Pilt0Czi3a6ry2DRox/m3HWgasOf7RjI4n5RvUg+/Y6X2phl0wcN/39yEeYIP56f
	c8ls1t8as0HOdxUZmRbmOpX9c7XhBmN+IUrUzNmrxBlAiiuG/yzljKIopSzZ9NFTgelPgGOUOKR
	cfxm780sng+bGl0b1uemH5aS4+71oRbmRDQtXVowaCcwLVsF+WpxW+IgGLlmG48ShBY3VxdAIm2
	ENytCJdV+8b3GY2gmNOrdzy/5xAQh
X-Received: by 2002:a05:622a:1b91:b0:55c:b331:a9fd with SMTP id d75a77b69052e-55cb331acabmr148011521cf.56.1794907745752;
        Tue, 17 Nov 2026 01:29:05 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d38b2cf5fsm43935171cf.25.2026.11.17.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:29:05 -0800 (PST)
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
Subject: Re: [PATCH v2 2/3] mm/page_alloc: move the kswapd node skip check
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
In-Reply-To: <20261116232346.788145-3-joshua.hahnjy@gmail.com>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-3-joshua.hahnjy@gmail.com>
Date: Tue, 17 Nov 2026 04:29:04 -0500
Message-Id: <179490774466.482102.3857219640524403633.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 15:23 -0800, Joshua Hahn wrote:
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
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

