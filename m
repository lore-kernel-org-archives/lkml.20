Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723826;
	b=y+/MiK3GFmuU1Ij/XWXVFWUe15ByB1lZmTr+BsWctsQ9wuE8WPHIGfnj0MxJTH46+unG
	 Ev72tdO1OGsYOmzvBCUyAgtqk4nJO7L41peRe00Kl/sctRf+MlR74tHSEeEJ8/91jXOwk
	 ditws1PIf4KeEUFgCGDYkSjUveDJTz5RU50yQDwcXkJwCp+08r4jyQ/ngQFLa6Qc9qdU3
	 a1Cce73tiJq5edGz+b7WS8UgJ0bnyAlIWfglQbjvSUHZ1LYuGJJzMW5Lhlc8B2IG813dE
	 aSAsPG67ZvYEnjnCm22IaOr/XUTUWwij+FKBm79cOtHqkKOAY9sn3fu8jCPfQG+VRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=krn8lDXtqxlt9AWAemBmiZCuirpcjXVXflzEA+ocU9AahVVJ362vX/1ykSef9UCKwJ8c
	 MV96bcCJzyGQl27qtaKk/PYwA1V93dvYQUDyym5DG0ApFAQYft8Lup8uIOBIbchl1//lZ
	 Hfx+op4FFIZYg+A4bmUmEFAoEnqi+33KvsM98OrILoyUCjCwog8JPdWLvQ0sEQzfp/hg3
	 pdQQjDAgBkzjW6p2QfZSFnG5Wowc3FzolJxgeokdNu0VxPZg+P018XeKDO+zroaCA4+hp
	 7q2F96d0KulpvXI+LEkqb8mzijQhqCi4vZD5TDIsunQh29KBb+LjmLU3ds2IxKScPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IG2T7Bnt;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C73606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C73606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IG2T7Bnt
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so7121964eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794723825; x=1795328625; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=IG2T7BntzzUTEAUJLRiA7i9f1NZjJSRnAtFfatGBjdJiCJCNz47ij/51iKRGcQX0iC
         gii7HAZLsquTGeFyljA2r4X1SnQdip+R/gSf6CAnuqgCi6U994IltiYMtVbFBf3fj9Cr
         AP57W9Jt9M6zvMaQZSs/rsodN6SFzxv4mBPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723825; x=1795328625;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=ojIdqVHJMM+/5fX3zI3IsBya+NE2U4eUg5XFGZDopdon1TosCqRx4+0zIxxcYYrCkE
         MPT1jmpzBvYtRoq08oYXVUoAberns8WIIz1sf5Ml7uYDByCBjF+vELg7Rqr6NzXryAPu
         8a9WnZdgGHZuhhB+GQPzPYtPfp2I/nd3Uc4Mi5ih4bsQSYMrf+L8F1e8gXdkGD3GhfO4
         PCroOeixjVZQD9TNZSex5M36KDHqA9aJWqZ4xsIdeJQH09NUn/1hyuEw0foMFBXtqe4g
         Vjj6Av7NE4bE9pJjJ52EAZJRiSGeYwp4oRoGl4yU7fUFJPNvNl9WI/9rtyL1UoWQbzXd
         fCrg==
X-Forwarded-Encrypted: i=1; AL+hErG2858dBzGD3FZQl7EWFMxp8HapZ8WAUFqX6/GTCOZyMwSa+fL8sieHy0Q76wkiSv4dSSn+hcbZZJ40Akw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8126rGsGiTxjTH2xmVVX7SOCIjY/N/1kCrCxrgBGqvI5cs/Bbt
	DNy/DtZWLRnuqfnuTv8LsG0DGqFMvnLTVmosOl2fYJuRmBAYcVGpxnYI0LDYtrlohPA=
X-Gm-Gg: AYBFou2EiP6xjtFOHOynvSIOBEvYtYGtRKHnUImzgZLVBY0DTY0TXSFbw1vCnTrxO2v
	WscTJEsKvzLBNjMf2NbaDyM18HPEojrJceuNuWXd9M0+YDTXBsh3jbpdfOwbST6I/wJT8zf5YVS
	DnDa1jDSum/dwzt9nt1jRZkU1T8LQBlBRCMUel6wqsJ23oVjYhu84qYM8kDyMCBRMN47UQ++z5q
	r3nyaU6jl2trUB3BdMzZrFI0z9TjhtsMOwd4HnNK7Cutn5NLsFJWyOZJvCeDJUIDmv4geumAICG
	g68nAqSc60E5yYS4OAherhw0THSJefYKeturlpUj+LmTLu5mZeh6C5BTjXDZIRaHtIu+9ar5yPh
	VOhC40G/nhVEND1Dq1BwqlWc0SDuu3N2tRaiPBk8Dk6RYGAvuwhkVtqHfWRDDtAG7TYlbDAYMo+
	iyceOcAkiE2mbTL5FXPdpFoUhEVwr7yRyLvLtxc4XIreWyjTbwjNc0W3E2OJVXXq9ajQXk2A6H8
	F0/csV65NArUClg1KlvmwY3Y3KPcJ85Wws8W8i60jS7YaJNrg/boNp4yklrT0b8RxniMyuJmBb3
	8xlDgVbXCfCrFmQknVNvUjTZP0SRpZ4Gr3YqrEBLmczif4aR6n4foExHWiD1wJc3gEhEn75d5fS
	EOzervLKy6q/+sw0SMJp9t+Q5lSq1QZpJGBDZ6fWdZsnIlPIE1D6SL+r38ne7AYDGSXykpTi8Au
	LZpa0sP/9aJtKZo1aljF6F01qW8U+wwfRHtC6HX1g17EQqTjquNexYzOCe5vYMfZth
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr4684055eec.33.1794723825291;
        Sat, 14 Nov 2026 22:23:45 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm21719807eec.12.2026.11.14.22.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:23:44 -0800 (PST)
Date: Sat, 14 Nov 2026 22:23:40 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Sang-Heon Jeon <ekffu200098@gmail.com>,
	Mostafa Saleh <smostafa@google.com>, Ketan <ketan.kishore@oss.qualcomm.com>,
	Usama Arif <usama.arif@bytedance.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/3] kmsan: encapsulate per-page metadata access
In-Reply-To: <20261114104150.58424-2-songmuchun@bytedance.com>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
	<20261114104150.58424-2-songmuchun@bytedance.com>
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
Message-ID: <20261114222340.8fe68e5bf755c1f7@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
