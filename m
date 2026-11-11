Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418786;
	b=5Lqki+uvSgJ/xDLaBIdeX5Rcsg86IkljmSFBLXhwFr9ydUtPP3y8bACrhnxWOqRhNZzt
	 E9E8KJ14Wl8saVWQuFl32J142SJPHcTSAsaiGZJZiQBb+A0szDl7q6U5OxcG9LDVk4UTt
	 V2yRlWa3JMz8dEEdwdlm4u2r88Ba9d8vGCNDoL65m/xmhyX/ZPqRsPcNKfxTp0Znu+Zh0
	 zv6miJCNQxjAIvhuVx+4yR3iynsvXmPEtgAv/zX1SFPN3XXYNdWdIM+DYKJ91xTz1R+tr
	 byqLdjyx+ReGMholNYmnw95Z3RVWDq4X7jLGwzGNAaI/+8dy95Rj5xMTN1GAzSW5JwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k8WdTJwjtLS64rhFGeIkjIRb/IsmmVNj81Iwt/U0SP0=;
	b=HCv5w8Jn2SwQ4mfTPAkXKyU+NPuzedvEU6GBkf7jj94kH/0mYeB8cP945dOr7e+Xuoq3
	 Fn0Ex+0IVdKzlZk3nZi8Fy47phZVFUkKNqSDc5zpmuoZc4HLvp+cQiR+i4KM4dwuOf3Wq
	 WxrujZnk5y0BHiDt9w2zQtS3FGnF7pF/teq8+2SlTbpFqwo0unAPRdn8OYfVMuJ9lujlK
	 A/2kbbQheIxrJ/g8w7bshM3dwih8Nwf/NCYEt/hGuH/cRnxOKXoXl/ueRC7YheVg5NxD7
	 GpCUHic0K98iPlbyLJI3lFeWrpbPoizlo3IYzhn4iJBpIyx3+HC263143LlU6VSbhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xy/BSBO4";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A69606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xy/BSBO4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so31805455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418784; x=1795023584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8WdTJwjtLS64rhFGeIkjIRb/IsmmVNj81Iwt/U0SP0=;
        b=Xy/BSBO4dJxJPiP5GBNM0+ov0e+jyjJfTCrls9PNWt5QY1e/gLMPOXdG1IjaWjHxsg
         YWjAPaDoYkP+5Mg5E5bPlDWYCMh96uWl5bBFdgtD5I1hzLOCfVEltTeY9oRe4Mqw/flr
         JLePD+ZI1tHfTT+MSjx4uPGyNXoKUHRxYEdFqQCxtQTqQOa4hb3vDZPoZ/Y8uGn8/XXu
         8yd56lDtsJmk5547FX6x5d0p0xZYRLBzd4u4m7FZ9pqS9M1TD0jN2kbvGnSNQqaHZCpe
         Y7wIlDqO9NwlFVmB9ZN/iZDPs10Jg6o8qRUd+wNeDmw45L5M+akHe5IHb26WUfPCicQp
         gIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418784; x=1795023584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8WdTJwjtLS64rhFGeIkjIRb/IsmmVNj81Iwt/U0SP0=;
        b=fssSuJs3AH8ej2FsZIdM3WLY+f+jEU26qLzLEo+QC3B5fI4pP2k0uqLyy+4augvA+x
         GDh8IhHGFa1uL+RYJLS7o7HCSpyBXkJqlxGMjiRHGm+1dJ6MfuaSSW5uyEf0OyU5kb20
         ov2CIk2YphOOXrq7apy7AvO6ZL53D4mfXSrvR0B/1j7qdr2LOFEkuqILzOKEagAUtnjU
         PazDrXuPEqBj+McukjMUDRm+wbsWS/OoR82Th8elYF8VAs0Rio/eBirx6g2rm0j+h1Lw
         zf+ew1YoCMHNysdDpypF6Lc+WOgzaLFJv6KQNv4gNyqiwTBNHFueDSk3EAlCp8/08iUM
         70DA==
X-Forwarded-Encrypted: i=1; AL+hErGy7YljWfslhw954OjskLSH+ApBsodBtD7g5tQbLMf5dxBMBC03khUIEWV9nPpMiF0yF51Qz+tyvWUZq/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NdVhzpG6fh84EdjVfyETNCzKW76yoMiNm+7vOZnzSIns5nScT
	QeYfm1Hmbd35hrr/V0gkirAlXpRh1Rnj4/kJbCg2+ew5meCp3gZyorns
X-Gm-Gg: AYBFou2OUtArqFM8BXQRnIi6rqxyT/q7BbnCOEh9qiWWOj3Z4B4d1ZANQ5D5z0egXQQ
	GdNUTjTPPhTmv6R+brWsZhMyabQaKrKuhMe8ajbH8IaQR5W5fQu6pjGPBDYH/1lby8NgNn75XDZ
	fgMlkcd3fHnu61krmSDIVdpiNj3IPC/SBJANsiQ+KjStDZDK7myvv8OiCNFmtl1ZfF44ESKJhc6
	xVEF9O4H+VYrpxkVxgcfWTSL/oIZgJgGc6+nkEs/MgW9b3zeqaD/HILSnQVPRVpgwd+4gh2c+sF
	CdodN78WRzYixK9p7E0erj6xP2kpYGk+Bt28GNkjPPy851YnY+AXkKzuXxHJ976T6cvh+CxGoyz
	jED+H9hxZNP1A89+SDZZsQiPc2ahL1bMuVz+qykCHfMPq4zhSEnGgGJmO20bqombKc6R1M8QcyA
	r9yPReJ29JRCm4nJF47JmIMORFXMskisPB8ov8Te3hmGYfcuIIvIwDqEbTw+MAldgRhjujL8904
	ftR8MsDsszh0ID4OY6u61ZViWWOxXnzI7HaPftXdbgwakjr1VoyVJqMD85h0Smheb/YA2ZvM5OJ
	+B964iFI/AZR0unYfq6s0irKLUj0sJumUgsvFJhhJodK3B/SyjHzHWq+4gvPbNzb1AEb
X-Received: by 2002:a05:600d:82c6:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ba0937fee9mr61515195e9.32.1794418783899;
        Wed, 11 Nov 2026 09:39:43 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4984e26f8e3sm11087731f8f.1.2026.11.11.09.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:39:43 -0800 (PST)
Message-ID: <0dc5be55-48e2-4973-8379-a23a94cea0b5@gmail.com>
Date: Wed, 11 Nov 2026 18:39:42 +0100
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
Subject: Re: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Gregory Price <gourry@gourry.net>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 11:44 PM, Joshua Hahn wrote:
> Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> NUMA restrictions") makes get_page_from_freelist() skip any node with an
> active kswapd on the first pass through the zonelist, so unrestricted
> allocations don't immediately consume the memory kswapd is freeing.
> 
> But kswapd is also woken for high-order requests. With THP defrag set to
> defer, each THP fault that fails on a fragmented node wakes kswapd at
> PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
> the next failed fault, so it stays awake much of the time even on a node
> with plenty of free order-0 memory. This means those order-0 allocations
> get directed elsewhere.
> 
> This was observed on some Meta production workloads running on 2-NUMA
> systems, where processes with a preference for node0 allocations
> continuously allocated order-0 pages on node1, despite node0 having
> hundreds of GB of free memory.
> 
> Only skip a zone with an active kswapd if it is also below kswapd's
> target watermark.
> 
> On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
> and defrag=defer, I ran a process that prefers allocating on node0.
> With a fragmented node0:
> - Before the patch, 68% of pages were served from node0
> - After the patch, 100% of pages were served from node0
> 
> One remaining gap is that since this uses kswapd's own threshold,
> unrestricted allocations can take what kswapd frees above the target
> watermark. The current code already lets such allocations drain from the
> high to the low watermark while kswapd sleeps.
> 
> One potential solution, as hinted by Johannes in the discussion from the
> original fix [1] is to add some kind of fudge factor (for instance,
> wmark_pages + high_wmark_pages - low_wmark_pages).
> 
> But in tests that I ran in a VM where the allocation demand outpaces
> kswapd, about 4% more pages landed on the busy node and kswapd reclaimed
> about 15% more, but kswapd still finished and slept. So let's hold off
> on the fudge factor until it becomes an observable issue in workloads.
> 
> [1] https://lore.kernel.org/linux-mm/20251001164131.GB1597553@cmpxchg.org/
> 
> Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUMA restrictions")
> Suggested-by: Daniel Hodges <hodgesd@meta.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
