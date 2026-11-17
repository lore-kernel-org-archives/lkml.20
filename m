Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907767;
	b=w3Y0xvGOwCWszJrmx0j0H3teYgxp4cTBxS+lG8dAsd5vB5AbG0CM6xT99ZYTpGVyUE+k
	 nXgQNFZFAUJrn1uLX+zxj4IqYMxbhoisln7b7ZxkLjpcsqWxeKiGh+UoBA8msE9TgWAra
	 kWw0zNltfxh31wan/gZzqI6JT8/+TTUJr/fx4SOzf06TA2s5eM0sLuuPhZUfvupeYBjI0
	 QNZNNL4txXnIguKS5qNZk0Nu1nsHBHFz15Wr47n5md+7aatlFM0dfokyJ0uGfdTAL2DlR
	 lKEPu6lxRVg6ISIja5Ac0uwe5AiyuAYNgKBIGD1W8fXO/sf9FdQpAU3xr6hETJAsmvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=CEocy8Dp0tBhMjAcDxR6vmj47rY/webAelS6aeHWYi4=;
	b=DKh12q92e2bZXVKfdXv6I6ho86hC5Cz5qeHMjl+OeNLoRdrzaCho5oK+6L/AIG/PEvIU
	 J5CZ7nOJZkhhM4fQO6V8mJhdNizNMQWS6uwA0utgXSuN44lDboVvOJS1a9Wa6/EURz02Y
	 vlTzfkOcKJ1EXqG1mCnxQYVppQJ7R3xcYLbaMX2y8qIPZ6oi6qb/NiBG2BlWYB5MC6aa/
	 JlCZwg+tVqzb8gmsakr+ygJWsid+XhRtN1oPezl2hlR5Ezr940D6aZr9mVECuBr/UZME6
	 t0QdaNj2Q21eJ1+XpMNvhQSCtVM7SsRjZT1a5spIfJ7GdFw50zIdACcTn2mKLJzLR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=i9PHZZky;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D894606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D894606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=i9PHZZky
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94960131b30so299968485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794907766; x=1795512566; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CEocy8Dp0tBhMjAcDxR6vmj47rY/webAelS6aeHWYi4=;
        b=i9PHZZkyuI+xAPf8hJIdqrELD5xsU3r8VsXLuVoTaTCgMIc73cUYCqODHxuGComFG7
         kJty3Z/RsQcdVQdQl2GqtxPSU7VNZkPZA7S/XT8HrPEvqIfYz31Cck5pq3uolgJKb/Py
         mXY053R5EJgHttTo0Lf5m31K4Y4Kwt8V70lE/98sf+EOc4RFH//AyT5eIghoC69pxc05
         TtUR9xIDOvZ1tNpLD3zzc2sy/7JIEZa2sQ/yMKIkJYoxEkTqMv3UF6KFN8OrZeAN3erH
         zeZu0okKsjDOf340jqaDvxadH0mRkOSv/N6BHM+2hUcJ/w/QlWDGlWvy56lYTo5UnCTW
         dG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907766; x=1795512566;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEocy8Dp0tBhMjAcDxR6vmj47rY/webAelS6aeHWYi4=;
        b=TElFHyqbKw2jZ32pxByRWpDbepnG7Dth5g7QU0KwhbMic5gPQJSBbGEJnfGRH2+HV+
         aEnwA3wQQgmAt82kkC9W7W9C+l6BeXBUARqelF+jwr01A8PLLeMWi1XwRTUbatxLwuJO
         TnHXIDjIT75ssPCP0+7jbs47qMIus55uRBHh2Kc5yPFTrIOAe6c0LNsRZSoBoPLqv9mf
         WaSN0R1XgdQUADmyZqxepdUmAzpKhiY1hE3Kmphp0iRgl4oagk3vPRtckFuJJcEdezwH
         S9eALadULMJXbex8SNoUnN4lhTxuvuBnvVgEq4Hv9kEx7dcccoQDn571WaCde4Gjaf6r
         c1FA==
X-Forwarded-Encrypted: i=1; AL+hErEsK3WHfW5wb7Sx93pZWR+qbXzrIA/s9rIRvHhXJlkPFchY0ErF/ndpcp8yNsAFWmrNvfkKTU6s/D5+t9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H41sJpiQkfs6zgCaW9rxH7GgF9gaHpw1kPgVu+N6cTQFWg7v/
	sNt5EHKcOFOng6KMf09texun93qMIC9BCXY2xDUA3afOS8SWJSGgRilKyyDTRH9DSnA=
X-Gm-Gg: AYBFou0NGn6gJ49j6E1lHKxeMECEAGTZU2k7RjH5eld2uGian+El83BIYb/H8LG2bj0
	lvrtdxDVGvPi1et3FuJl3u6U1QDCeDnd7HGUZ6rFa9qe5bsibH50HSM5GKEwkdnoxky8PGpi0gy
	sGCgqwL5wxdUXQHiB8nX/4uXTUE8A2SmihrIL+1FoUFO5k1lFPxv9STlnJvTIRsM9NmKq0ek52g
	dN2SpyaueTpy7N1m7m+kpJOh8A/PgpK3Iy6Po5SxTymZthY8S88uLdBTM75SbzwjbKjNUjBgL8d
	TmqiteqW1Av8B/Wcch0Q6byKz/DD71EEZK2HIZHRmtVyFYdFM64SRZ91Hst0BeYZQGx0kQOfA1E
	zLF/aloslSK0KtB46TSh4rFfV/wdajz830YbZXy/8+A9nPQHqR4fePugltX+UhJaVRkubSePCHG
	lUSdZsn4Go+Z6qqh+w7qS66mhLD8aJ9tINt08Pk6kFlvAM7lunyQtqmCyKdvFAc1bQ2uDr6JQ+h
	4FH9t8Or/pvDs8hIsQd4e8J8/tG+TXWC5zRcZ7aPH5xGkVAmoa6D5dNN/8+VOG5VvI4Xw0Eniud
	+10QZLnhdCPM5BzjcgrqwHWUVPJCVR6WEOAT3t4SkWceaBzq65FpfrGwUv7o6LD1urjMjZmoU8g
	f2b2Tkhc=
X-Received: by 2002:a05:620a:1b9c:b0:949:3302:1d9f with SMTP id af79cd13be357-9494bb92d8fmr2018520785a.78.1794907766395;
        Tue, 17 Nov 2026 01:29:26 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm1045873785a.18.2026.11.17.01.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:29:25 -0800 (PST)
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
Subject: Re: [PATCH v2 3/3] mm/vmscan: consolidate promo vs. high watermark
 checks
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
In-Reply-To: <20261116232346.788145-4-joshua.hahnjy@gmail.com>
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-4-joshua.hahnjy@gmail.com>
Date: Tue, 17 Nov 2026 04:29:24 -0500
Message-Id: <179490776479.482102.15273104703914268640.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 15:23 -0800, Joshua Hahn wrote:
> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
> 
> Consolidate the pattern into a helper function. While at it, remove the
> include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> dependency on sysctl_numa_balancing_mode has been abstracted into
> vmscan code.
> 
> No functional changes intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

