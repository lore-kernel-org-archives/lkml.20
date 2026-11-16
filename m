Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864714;
	b=sf/aoW73wLflw3xwJExeuqQlTFJ4rr5h/DiXvEuS3v/Pe8ddhTvZIs73tZGO7TSVvM8M
	 zeMBWMf0nxB73ACQ1BtUxQmpkgPaCFh4hOScIMGUP9wqk2rThvkk5XrrhW6m5qsgRgxTp
	 AVBzKctOR+ICQ3rZrG65i3fpytbms7lkCSbeUp11qba0yK8/nmGhzkyQ+wQ7p/HOOwFfk
	 RjdLAx+RnouhaQWgsWEnDwwTmfaZnmfrgiaLUWqTUp2ZFAWoX3UpIqoIa7kU6W3gWDY3A
	 KxjF9Z+prNvuIz+W7ZfS4F3NvMC/K8wGIp762tHLzVzLRFjqR78NVW7GtYuNihmOpcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=7EfRJISn/BExC2Uyfk6fqc34lLJlumeRMbZF5bLNv18=;
	b=4GS0tGEaJrG26/50LP5p+VqtOwwZu7ewWi97+QQxNMGCfljYUV1a1bWGNFGHrM+jsgAb
	 Eoi6gnSINExkaVSTESwvGQnthyQ/4CqNdFmRC6BTu3yU0qeyVdkrV8AZ0zz2SpxJY45hH
	 3vAA0sIVQZsjXyT5bMDkQdiSRXm5RIEGxGRmy/1NQtBWxcDSfvfhBUzHPyyAB+mHriAMV
	 r07Q2so2uvPYKbPZM5fByDOWs3W9+6Xy1nnT9jPPXuMMzptrgOU3cmvmqOOCEP9vKaZ8L
	 lQkNf3gJh7yynjAcaCcS/xKS5PShTf+ETSXm8nMxEzZw5wmYWMAcI/240tvc1k9XKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WttSqXbR;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28121606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28121606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WttSqXbR
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3123380c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794864713; x=1795469513; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EfRJISn/BExC2Uyfk6fqc34lLJlumeRMbZF5bLNv18=;
        b=WttSqXbR3d/JVH6BORH7FZF1n/MydUNz1Vo66MKy4oe9xbJqN1QfLTnsvAO1Vp3K4r
         DA7wg4Lh8Ku0L/h5J7bexkH0xX0KLeMFrO9qr6RxBSE594BE9+w06wfcKZgoAfRb3UB1
         Qotr/Fq2tcsRah0SWNh/qAfY/gcDgQovuBxns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864713; x=1795469513;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EfRJISn/BExC2Uyfk6fqc34lLJlumeRMbZF5bLNv18=;
        b=I1mXXmVHSG0PNf0rZQ2tpcwEoTzyG/MQEd1SGHkslnkowyrLpL6mZFDG4MlYdAcQZB
         rObPargVdPbFEmOTzKfXcTpIVtzcjJRklBPtlW7m/Usw6/06cKkYsfBTf+IPtbVDszvP
         5Kvbd7K8bVEGg8E7NiEprfZtqk9N1Z9EmYea7j6FHgBrH2MCrEgqx2bemOU6vwnKmbyy
         57gKnQt50goCf8WFklQpDDqcfzV621szC8NyGf1WhLhvgaSrhya0MAi29LTUTt1SyohM
         uDWw3yOT6+nU/SDYqN9+5wktwn8CXR5jCgU5pfMdnk6kva7spUvnjilS78FjqRDH5pf2
         YymQ==
X-Forwarded-Encrypted: i=1; AL+hErECsd+W22EA9OqXzL6JZzQDeIo+7NVh+LGzSIriUwGt+DG6e2dkMRrWF813IihVeQYqBe6aaZvq4R/Pr9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jLYPpQPVDvDWNiYAfVP8yPdFnlhtlR7r0NWBx+JhfN/XuI4o0
	N4nWMNldSA34moyg9i0IxO+q/XHmBMQYHDcoLGz0kne+1YjmwH3oFa9dTlCxt1IFGAycpz7q/ou
	FfnbIUOVxdIMU
X-Gm-Gg: AYBFou36Zo+g5n6yaWtGJbD0G0TXcC/RjxqNkxa4Ty1SqwnicpxBi30wRV37Ql2QALE
	p6ez6W6eXFPuedTp7uO/NKHPqVNvc2CFWF/qeWk8Ysg4IKaX85umU3r/jG92PFpOA9C4C6vVp1S
	azRASIHhrbtHlwH8OVumtV8hYOHMsZpnKGy7MnduN9lAqIx7qW6G+38iQHOnscrHFAhDqZhBVAm
	78PV8FmLmBLqgRe36vMZBTJisIrS6+JplqaMPiiLVdpPv1ngY90TWAh4zg1ts8o1AR3akw2g4EP
	vskbcpGATrjaCKB/UW9XgJPtoLKL7f2PmT4G2EgC/QGZBonoo/8xAVWT0COZBta9I++zHIQFZlF
	pRQ+cR3bKcmmHUea7p7CqpbNPGXfdSLE3dFrPxyrA9CYi9XXCcidar6blMn0gfHcL4yoBv08DT9
	xjto1gXXeZ0wXqhwNt1y2K8ucpxrJR9VUbc0OL19i22xCsIhFSLtW8NPMfOSP8Ush4ZPNrVSo4D
	yIPFokcwRwmO3FMzqPWi5kJnX/e0uvLBby6pbLlFj7PArMfaAAK81AJWwXtkg2hwt7Yr+Thah8i
	hXPGvtR2ovV9CpPAyOEKQ6kzEI7/55LH6cjoxK+2shK1Z4rI8B3B8eEavuKDVOdtdMKEUbgisJ0
	zuQaQDlSMlUgErxs7zoR5M4ySMpAdgcu4ELopsI/7XvVWae+6uy2JtZpJjcLlhThLHaz+vDHQhm
	Morb83NwlqjzFsjsQBrxg9lQtFuCd+9GQcQ7btyuqcxL/ijyr/7APB2eHtOzvd6UiVeQ==
X-Received: by 2002:a05:701b:4508:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1b50309fa41mr11275170c88.15.1794864713351;
        Mon, 16 Nov 2026 13:31:53 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm1285217eec.17.2026.11.16.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:31:52 -0800 (PST)
Date: Mon, 16 Nov 2026 13:31:50 -0800
From: Chris Down <chris@chrisdown.name>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] mm/page_alloc: move the kswapd node skip check into a
	helper
In-Reply-To: <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
	<20261113235238.3595412-3-joshua.hahnjy@gmail.com>
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
Message-ID: <avt2RrtFc-G04JiJ@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Joshua,

Joshua Hahn writes:
>+	/* Lockless check, a stale result only affects zone selection */
>+	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
>+		return false;

Not a big deal, but now that the test is the other way round, this reads
backwards against "If kswapd is already active on a node" in the comment
above the function, because waitqueue_active() being true here means
kswapd is asleep on kswapd_wait. Maybe say something like that
kswapd is asleep, so nothing is reclaiming this? It needn't hold the patch
up though.

I've tested that this works well, so either way please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
