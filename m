Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832119;
	b=V2hLXPow0WZRpglHRCZeho58/2KFOnolvZxMCXB6e2cmoubdRhquGKwXaAcDGOPHJzNR
	 7nalsxr3VBKprI0fAQMCjETyROXh0U133EuVU+RK0TQnA1Trcg5Gb6fWVZt7Jn31GsWB8
	 ATDl6WzNtW5Jvg5l7Fs0dzTJih/UepqnnhVG37LfEg4SidlSMKu3GVUEeA/Ff/kHBhcLA
	 MAJGpkoBGHIHV7ndlwpbBPAsyMc5FiGapcVuGVjoPqUyO5v9bvwyrFdexj8TTPSN1wJX4
	 iGXkEI1ng1M87EdpVfnEaDd8vzBVAOp5SeYZmsFPqC+j5sdREhlkwWGNh14+aYU5kAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7JJZFX7GjlSxlyM1xt2ZPMCBId8gHLPODjL1RlXKQBc=;
	b=kHuIl1PmwpDWbfhaebyPDpMBdoMY5HKWBgF7YFVTy2zqVeUdEBImDnCW7ny9eUypAoCL
	 2AcmT9drWOlzOC9t1I7Yh2hQ2j6xZOPxdcnet6CjjMbIv9WLuXDYQFgp3mtRLhmC5Jv2p
	 0n48N2nWVOJMeXxFRFz1Q6jTPQ5BTAQAWfZe+VM+gDWOG9TpSUs8isOsapYx+bNjphxOD
	 XO/Rw5ifhB1Tj20wV+EA2QLtTGEnoy9onqyGFw8jf63ZjSnMmXeRPxXMPrv9AT3XHfxkb
	 pYMhLWS4F/2JQ+Cb+QSALF7vshDfnbM9tidBa2TCmBcULcTM889R36BC9PO1XrhP/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFbWW6xx;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD1606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECD1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFbWW6xx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so14478565e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832118; x=1794436918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JJZFX7GjlSxlyM1xt2ZPMCBId8gHLPODjL1RlXKQBc=;
        b=fFbWW6xxpsEYD3oBRYSPO2sNLgd6voHxFWw6v27R9u4eGWHvAoWP028d3VlkW5ygPd
         o6GkD3FEd33GcyZ07604PYcoZhlGTKyi7yTV+yZaP3etjwvjRsXrfxPOwNLEcC/CLi4l
         Y2wbsIk0WLLhjn2NNPIcvBBwlZV7sB3fV4JuG8oEUfVV/SoLzgEv8ZRbuyQqjkhFABkL
         2uDqksTjbc4/Pz7HYCQudk4MYdBrxqB/+jOlKncdPyKaxwEY06P/2uRiX5WUJhlAUsPC
         l3xvkUW1p7Q6CBtjRtHmYNEEYsoLoaNbbRp3/Csi0TcnfFU+Ub69W6XxG6U/kumHoFLd
         RvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832118; x=1794436918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JJZFX7GjlSxlyM1xt2ZPMCBId8gHLPODjL1RlXKQBc=;
        b=PFaireUjD5A5L/gsH3it14qalcYIvGJz9mYr1HK/fU8fpFZXjhSbEcsiXlgKeI42h0
         6ks2p0Km4yyDDFKQ+umjCKkKtOPnQ4wd2RczxOCWnPL9n8i4DIr92lqUCm1HjF/YsLbw
         TReDD1uymBhyK+XPXzRWglBZIwBqA/nnzxp/sgtWhVQPFu3itu5f26gdodnLqDfeb03a
         QonsPWHhUiAWxPR4OhnqKUeid3o1WYkztDpxeh3dccC0kB02ROCgny71mDEU30GLInVN
         vfwbG46EHKDYW8LmzPTVD3pX7y5JPiq2AejX4L7cW5dciWUef+rM/W0X3BLOp7620Rmv
         5d2A==
X-Gm-Message-State: APuU4Z/fYLiYvvvelzp0BGki+y3AmI7zCKZz3Uv/EU4qjQwslt5AT9wr
	Y+NQbR05CU/Rb8scKkk3/zVfhytq+1xFQY2y7zw6uOtiSLT/OQIYSnx5
X-Gm-Gg: AYBFou3U3w0G7t7yfkqWDSlBjWjW+ICWH/EwYZBht6w7Ps1ah9s69W0M2BUTAV9YRFU
	RZGFjNbFYYwvwcBO7WpmX9fofSHKdyA94JNUwvXi2s9+8IUs/E3emplfE8FR64Fu4G4oQ0ExyDC
	3FBGfukzvVTifUQ1G3VWDG13uZbvuya8oJ3dV4uWh28tJVjXwvNnrbI4aGKluoi84XrNJCVx2zx
	PhpoIOQmf2bshZMuLVb1WdMLQ8ix6+mk0plz8t5LHYtmhbnYSCeR4rNbXLlDiYHUPqZ4UoaxeC7
	w9VGQB1B+21bWs0LzR6LWZhxDWIgI7Na0BiXxW3nm8SppywvPBBwIxiubQGad4KnHYwjU9VoTUs
	Q8BLTCqVawhLwawfOeJHOPDUl3jZEei/nbxJmSOxmAsygvad4rvxQ/pJ+yCXEQjynGCf4jSV8oD
	J+qlS6c0TQzqv6R7mwUN2NuT/Md3w6fRyFOMeu8BrKLWkBkac/sV8lQrB+wdv1h5keM2coIPCBk
	HEoijhwc0M0MB7C41E5AOxRsQfjaqUwIZc+dHQC/RwkEiaCZq9is/tAFQMWx7tYeb5SNWgf6SLe
	UzIHXvkQtwUAIW9Bffa0dU4=
X-Received: by 2002:a05:600c:4e50:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4ac16bc461emr393154585e9.7.1793832117676;
        Wed, 04 Nov 2026 14:41:57 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm6018773f8f.37.2026.11.04.14.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:41:57 -0800 (PST)
Message-ID: <d4b5e996-e718-452c-afa9-e9d9e08712c2@gmail.com>
Date: Wed, 4 Nov 2026 23:41:55 +0100
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
Subject: Re: [PATCH] mm: split out memory-failure declarations from internal.h
To: Breno Leitao <leitao@debian.org>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, kernel-team@meta.com
References: <20261104-memory-failure-split-v1-1-3b0a85f0b7e7@debian.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-memory-failure-split-v1-1-3b0a85f0b7e7@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 5:45 PM, Breno Leitao wrote:
> mm/internal.h carries the memory failure declarations, but only seven
> of the 81 .c files that include it use them.
> 
> Move memory failure declarations to a new mm/memory-failure.h and
> include that from those seven files that need them.
> 
> Move the block as is, including take_page_off_buddy(),
> put_page_back_buddy() and page_mapped_in_vma(): they live in
> page_alloc.c and page_vma_mapped.c, but are built only for
> CONFIG_MEMORY_FAILURE and called only from memory-failure.c.
> 
> Keep the declarations private to mm/.
> 
> No functional change.
> 
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/aumt-4kfGGtoXuh-@kernel.org/
> Signed-off-by: Breno Leitao <leitao@debian.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
