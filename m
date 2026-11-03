Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731214;
	b=UTbIC3JBxVWJ59dT1bldvcDn/+zVUEt/XC57rGSkkuH+ySZjQGzU4f3+5xNYycc8DUN3
	 G5ZpJSPvuEZ2OWvwcKn+CQWvWuNvwUz7tPgsPdWax62i9dM9uFMcfkT2JnlHXGptPwvtw
	 DBinu+c1xKK7T97XZp1s1pqAX9RD55F5QvUxiX1ZafyrOOQuXuOgcedTdjTzqx8WgQWpf
	 94QI1ELbXtN46Ltmg+zeLqFg0A7OUep6zeLftgMabbHBIfqui3ZF/x6m904pnNDuQXatx
	 7FXaBetUT20AAI0/uU3QX8pqSvsGuhFiWW03goecQU1h/UbrE5cElRPm79vQXk4Ea3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=1LUYnHObY7Q3ByIwXxp+Nywos3UJ2Q6dqziyGEM81xo=;
	b=MIleQLNWNebXUnfclWsiKzbBwCHDsCRFnTr4MgEGHInt3LMSlIWOR3U6IHMP4yuizORT
	 8KNAXPIJ1aDTHD2kWYfThMRbVsTvmwD5p4PqX2slNhmoCgPJpGAEYl7XSVMJcq5YRh/uA
	 7LeFmAWJ8rvy51v93eyit7QX/Mz4OlQNErD2+yCytzFRDyuhFVePfCjz2gyT4uJZ7To5V
	 AkE9r0oKauauIzxbnCBTy0k9uCpjiXJpdJur+Rng5lFRI//JR5Swfa2MuJPWxsBu14pra
	 yDpgdfUOOIoI2cN1yGZOSvGj4eme3LG3UExBbnsBsv2PIzWNVCZ+gfC1k/EHe06R1SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikPjzMCp;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AC606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikPjzMCp
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so2491265a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731213; x=1794336013; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LUYnHObY7Q3ByIwXxp+Nywos3UJ2Q6dqziyGEM81xo=;
        b=ikPjzMCpaDfmG8KPOzOEsJwFM+yQDjU4pRBJOrPrJestD5TluUkSMIg74H4UZxemrM
         OjnAb7uRvPHCTXCTG1bFdZaz1Cfd0Iwkz2UQnW08QY0m9uibKlx7eZHklFGOYx5oL6Mr
         Ejf9pP1RgIBeJQt5PTkbPGsXzG6AHdWAHFCT527MBajkGq/jZRfXVSai0GiYseiTweU3
         B8k5XTKmBtBP7J9WYzD3p0DdIj/redhtrzwLXHD7GnY327miZxMuKkbyzSPELOoV/nLn
         U+j5LhqKkke+ra3hON+8Zodxmcp6cWnmvhoznRKHb8R9xDvb94dsMxJiEm72lRVZSO0L
         Xczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731213; x=1794336013;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LUYnHObY7Q3ByIwXxp+Nywos3UJ2Q6dqziyGEM81xo=;
        b=Zrbp475+rJAK7NwTEktskB498YfNXqWBU+UEHHcDRYr2Lp8Pi6azZKKroWfxRhITlC
         Vf0MijX4mxcN9QUQkwo1Heu1i8kNqqLHD5JWHCpQ4RdSb5pVlu23thpjvFr/aDdze1Ru
         lUAu8Gl8yzx0Vb3YI2v9NSpw0tlYOcMQbIucuuvi3NOKN3z/6wnBOST3b30M5DRO4EgZ
         BRRIAurYQnts6gDkaOsEpoKExnQy1xezPw6VErx1JDVCHvFt21Dn6iEhFoHQaUKggNnl
         OIBH+B0u1ptQqzQYgZiRPxVsp8UL1e88A1jPvqow8rp4iZBwzX/sZ+KpGiJvzZyKil0K
         9hzA==
X-Forwarded-Encrypted: i=1; AKwUvBwaDmjJUdriyxBycv75Sk6Gjcat7G/7Z0Ipv90c7oC/1rOzxX8LRcqehfdI4hZPwRJZoBz6M540giuoMos=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cX+lpd574ZyXLuv/t8Ppl2XoUlKYspJOT9GO8423Nq/ecMbQw
	gtLhIdsfUJOYfyJm2nDwrxt/8OTqAZGkq76xnNXCmFQKvEFJ+hP82gB6/Vsu+w==
X-Gm-Gg: AYBFou2YYaR/ltLezIjxxz7VmOn8+ZonhRm8mFuCHozDyWNLfTrV3PjI4xLyGwvvmqI
	YeRsrfQcWg3HxfWdWotPTOpQTzgRrmsf4jtYjgLxHgtDSqF4rYTABTrC7ZsQZB87khSnTV67Rrr
	8ZDyZFG85wVBIQIiyD4X7ogNfQUG4Izv8lyit5ohDR4NEparMzKgl1pyVy4JlrGs9+UaidQE3cJ
	YXJ+XQ3zWspKn3GsF/WqQpmJnH930LB9yGe7AdaJ/cvlNlawdPNO9W6CRfdxXNoFTpvQvDTqgHU
	4B6acm1TxrSpnjgndLA4efdE9beF4+Yr1Kjng8R81GqYFnrkbxygeIVTnaoWcmHaZxB8LEQcp3y
	+JexfC4kVO4BDEDREDzHjMcxb+QGMTjFyFALsusBJ0N/mulCdB/aVWlpIhRIbHrzx3bt1uaNDbX
	e+0jSjyeVJ56FO1vtH+MzrCZiHbANzHYaflW4DFuSOsJVNEMBiwvaEqXFnlIEaVer3oxn+W6b7j
	K5xukls/dB+DBDQX56K6xJxI2165jko6wUT3OHkn3j+1cKLHQekjNTr1e+V0e0oYQt84cMbVmFg
	SfxhbDJNRLHEsmzJq5LihkT7WSwNC7LpKoQybxUirLN72b39STd7Ik5v72jBq6zcaJBB0CKQmXO
	zdA5zDXOAuc8U5oNRPEKf2VJaQf0y6M7Zrw==
X-Received: by 2002:a17:90b:3e83:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3ae89855ccbmr11961848a91.65.1793731212415;
        Tue, 03 Nov 2026 10:40:12 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d70a60sm58552a91.1.2026.11.03.10.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:40:10 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 18:40:09 +0000
Message-Id: <DMLSN9VHK0P3.2A97046A4YXGY@gmail.com>
Cc: <kernel-team@meta.com>, <cgroups@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH for-next-fixes v2 4/5] mm/slab: fix a deadlock in
 memcg_alloc_abort_single()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Muchun Song" <muchun.song@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Hao
 Li" <hao.li@linux.dev>, "Christoph Lameter" <cl@gentwo.org>, "David
 Rientjes" <rientjes@google.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>
In-Reply-To: <20261103-kmalloc-nolock-fixes-v2-4-19167cfe4779@kernel.org>
References: <20261103-kmalloc-nolock-fixes-v2-0-19167cfe4779@kernel.org> <20261103-kmalloc-nolock-fixes-v2-4-19167cfe4779@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 06:47 AM Harry Yoo (Meta) <harry@kernel.org> wrote:
>  	if (likely(size == 1)) {
> -		memcg_alloc_abort_single(s, *p);
> +		bool allow_spin = alloc_flags_allow_spinning(ac->alloc_flags);
> +
> +		memcg_alloc_abort_single(s, *p, allow_spin);
>  		*p = NULL;
>  	} else {
>  		kmem_cache_free_bulk(s, size, p);

can we call kfree_nolock(*p) here when spinning is not allowed ?
Karl's patch did that. You replied that memcg_slab_free_hook() should
not see an object that is not charged:
https://lore.kernel.org/all/asaAwg1KeZoEYd4K@thinkpad/
It's fine. __memcg_slab_free_hook() skips an object with objcg == NULL.
The else branch relies on that. kmem_cache_free_bulk() also gets
the objects that are not charged yet.

> +	if (likely(allow_spin))
>  		__slab_free(s, slab, object, object, 1, _RET_IP_);
> +	else
> +		defer_free(s, object);

That's an irq_work interrupt per failed charge.
kfree_nolock() tries free_to_pcs() first. It calls defer_free() only
when that fails.

Then no need for allow_spin in memcg_alloc_abort_single(),
and the fix doesn't depend on patch 2.

Something like this (compile tested only):

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c..fb92b48 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2551,7 +2551,10 @@ bool memcg_slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags,
 		return true;

 	if (likely(size == 1)) {
-		memcg_alloc_abort_single(s, *p);
+		if (likely(alloc_flags_allow_spinning(ac->alloc_flags)))
+			memcg_alloc_abort_single(s, *p);
+		else
+			kfree_nolock(*p);
 		*p = NULL;
 	} else {
 		kmem_cache_free_bulk(s, size, p);
