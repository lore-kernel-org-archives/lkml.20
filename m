Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981078;
	b=ZGMzGfg0o9dzrRyA+0WJHHARnpk0ffWgYZ9ObHm0rDq/6Azj6X/whtS9pqoyShf5Bgvj
	 wbJ4yM7dvcBAv4AWzlPno71a7v8U9G1V5wBm7NQd+IvbhankYBW3rSL5J2wd40US1NzAF
	 Lzs2QaD3twS37Dfyvhl5aEOaqjRM69yuCRiaQo4L7reAZUfrYNmlCMOVU/QLf/Rgk5lLG
	 2toyW5Yy8cdxEmqthhFjNf9A3msCsUkiak4LFlCs8sXIrllGnLod7mamnpNlm4IQ0qY19
	 75PeFa+Mqz7VgR0oICa/+Tjg6d/PWs0Sbi99qUf72FBktwbihrZrFzc6ANofe/mq3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ge/zVN4OrHH3glz23GfvxcZb8aPxUfChE7sml4cA/3M=;
	b=uN5wC85LdYQva64Bat7P/0AIPjDjAJ62RnB9/CM26gA8GDXA70renP47zSTiLirB36Je
	 dL6rShl3gd74gh5UEnal5I6K43f9L/vRBJE5rvvV5khSk7/R5keJgnx6J3CYlMinKkFAP
	 mLXFWpnRwAh8XantFGOFfAi12XfWV9hYIdUtg1IOzjcB31v9ayi6AHsND3VbHnRBn0AAA
	 pbO0OwLRcNG360GGYn6SnE9XbHZ+PYojd7eCz5Xfv5nD/RT673SMqfviuGUfa1pm/iAqF
	 e07N21Nop0KuUR1V35Jv+2tVvO9RzTQAjOkYga9OjmHT4zzTodaZQkbT4qxwbmwzEuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwlZhK+Z;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwlZhK+Z
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677af43eed4so840147d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981077; x=1794585877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge/zVN4OrHH3glz23GfvxcZb8aPxUfChE7sml4cA/3M=;
        b=mwlZhK+ZL829RIhOfr9q8RWjBuE9ixnQb2MpSEejb1eo43g7mWzraSiirF2/88BOEK
         Ij4J6DdvV3DZQYn8y3ym8EYvO5B1jdMbrJw2Tc+5g7A3a05BOGtoawP1b+40DFQo1VSB
         2GoKH2+tW6+AGRWiMhAGO9qB2TMaOqJib/lgOJUwrnlYDjwgbQarVTyRJTbvs8CN5W7V
         hcMmf+1/m9BSGIJhHwHfxdfNxrfGk8OQ6pcKFPlGqfqBzwxBu0CXEq6TNec0ad/qB9ld
         thM71YxuAeGT82AMcxzMRr1d81bWu+i7u45spQbglXe9TCzdic2bs5xVHA4HD0EIxS7N
         jycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981077; x=1794585877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge/zVN4OrHH3glz23GfvxcZb8aPxUfChE7sml4cA/3M=;
        b=bXIuwqNcb1tE6Lkf42US0yyFqgvQZpyaEaFYCiGsuCNpIpjtzPZW2Fj8ldaxU+8Xoc
         8NCw4lZBNzw3Si/fiNbYN9MVVimMy8jaBLoKogjNlc978Q0dYFZKfeAOa33yp+6Gp15K
         bVzLIdzXMfeR5WPmsjLmkk3raQn+ex2vEKWvp3u2H3WYIa1R3w0uyHmePscGlRdoQwuf
         3rbf8QjrM9CTdy2uggQ1jJGUamTnK5rfRFpVVvl8kPqXjMUBvVnoBq6k43tHy1+nushX
         rnwU9U+1cUBWZZPagedrj6y7Wsqvi1VTS/0KCCM17fFpX+K1IS89vvRZntY0KB2M5Ro6
         lYVw==
X-Forwarded-Encrypted: i=1; AL+hErFBOsepzWDlcp2YXQU3O3sSllxY5dBJdC4jnxzKiEHMib74qp9hsoV+sfXr/KyWXoafHq+0c3qVh26tnXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z895F+abYiTbti3TBd76z+AkcRuLwcra2eaU4FtwBnR7KXMnl15
	ttd/vzxqNDkf7NgRnAaxL3rpxwFy3fXO5Ml7jP6fLn0+9DTgZjNhf3ly
X-Gm-Gg: AYBFou3hnOmrDyCk72pDh697CzNyCPV7ykeyBWyhYzU1Zo0CtDzXanDunCpMUAs9uRb
	1JCMslkJYb34xNKUtPTjZkjyzErhYLFn+fiGF0IsYjCaCEti7+cmgYMLJsvxFNfRrF3cl0g0M73
	20dgpi35GvbHk83WUJT7FW4X60bJLy6Y3VqWgTj8jQT2ijm4BwQiMJjsxqBUosfJ6x9QFzrM3Bd
	Wsu/BwPO4UHmgNZZKN4Vh4t3lPffu4IHniTl252lFv/kRfAqpPs34coRLl9eGITJ9TlvpkJYbhh
	zYNPokX/ONZWm9GqO08A4Yv61MpRQhBd311DqQ9QYOFcu3mTkWjzpRI82CRFQJe3aze5y9Z3VOF
	RFdk6vc1vFgcaIGaGHDbI7s4W8z3yZ2eDeSNpb0JRgWjvlQv1AO7qCa3TmyqKclC2XbOP7kYVYd
	CPFediV8S7eUPR2oUUIbPNd721odcELDaS2CxXJ6BCUBgXgOZk6Apo77RhPR+JsfU1318pIY0GX
	x5JzbcaY6lEiHXZMCuqHfNLIBrg+ABHXDxuQuaRjk/EIjHTsmv9KHS5ZNdr4xeobptfZOTVdZ82
	gWK0Z0hl7X487rZc6Q1tJExIU1J9j9kE4jBpZJEoqgruq3UeWJpqesjkGeO4j7g9kzk+zGBft/I
	qRzOJYF6hG5UHHbtOwg7TfKDmRe/VTtV+xx1s2Q==
X-Received: by 2002:a05:690e:228b:b0:679:a650:a083 with SMTP id 956f58d0204a3-67c1428a29fmr1291761d50.21.1793981076502;
        Fri, 06 Nov 2026 08:04:36 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:1a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f770cc6sm21382727b3.9.2026.11.06.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:04:34 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	brauner@kernel.org,
	chrisl@kernel.org,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	ljs@kernel.org,
	mhocko@kernel.org,
	nphamcs@gmail.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	weixugc@google.com,
	willy@infradead.org,
	youngjun.park@lge.com,
	yuanchu@google.com
Cc: stable@vger.kernel.org,
	ryncsn@gmail.com
Subject: [PATCH 0/2] mm: fix swapcache writeout and cluster table publication
Date: Fri,  6 Nov 2026 08:04:30 -0800
Message-ID: <20261106160432.2552507-1-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko's review of the vswap series uncovered two bugs in existing swap
code: reclaim skips swapcache folios without anon mappings, and cluster
tables can be published while allocator locks are dropped.

Allow swapcache folios through pageout() and keep cluster tables private
until the allocator locks are reacquired. The second patch completes
Kairui Song's locking sketch.

Nhat Pham (2):
  mm: vmscan: allow writeout of swapcache folios without anon mappings
  mm/swap: publish cluster tables after reacquiring allocator locks

 mm/swapfile.c | 106 +++++++++++++++++++++++++++++++++++---------------
 mm/vmscan.c   |   3 +-
 2 files changed, 76 insertions(+), 33 deletions(-)


base-commit: 32959c9a49d24faffb39413322ef80014f88dd16
