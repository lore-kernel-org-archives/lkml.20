Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2943801B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536821; cv=none; b=TMm+eH1TirZ3ln8ZIclaW34IUVWNvap3dPn/2lULGgQwA1Lj+mgeiRU6pSUs6QG4RSXuQlJcr4Xjo/ff5p0CLV3+xxvPg8OBNboLGP3qpWV6JpONxpWY6XlRugqrAI7/iBipzRlfZrJRSp6CKlwbM8azcIPmRRLu0I8rjorpZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536821; c=relaxed/simple;
	bh=Dsi+PgjO41x2VtjYExfHIy0tp/9a5bzvYlJ6M6e6TFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU0Bgm4HcxE1jQvCozbVtEp89UyLqBfZzMc6vmmxg/HxaC2Dvr7JM1MMvEeX7sP56OTTYJRi3CitVWfUzEIp+0ZIoE09C7mXgPiQi1EX1tBBbW1Rmh1YXpb8I6KPQZ+3jrsrCjbm4HQNwjmZWbYwcPFqQTsgAlkxAlcrq4L5sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwONTkPh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwONTkPh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso6352355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536818; x=1791141618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCahJ3O+tXX0CfGzclDhULcHGoByJJvACQgWnDRt+Os=;
        b=MwONTkPhRbVr2zKDbdRn8p0CqyWMV4+R2B737dgSDbjBs8C16mXw4RZE39jHm57gSI
         4LPCUebCeTI4ngHVuF/QGCfBM/CwE79njXVVMyMrTIneBB5dLeZGxChiNHElvYdJKdgb
         iHgjSpCZyWFJYCIZGEJcRV4esW5SbnRH5a50EzK946sOvoXND+ge8wwqIF+1AHOaNxrB
         jGqrniW2Dv8n/oDHYvJHwwafHVZoU1ZRTS3Dr2ehhjcYXmrPo/ObWaL0G2U4qLo9W+0h
         QNHFgEM+LpOVzIS2JWdaDh3lxD9otZnOZJ6nMtiwHfa+vlnHjIm58a/VmgsMEz3VY4sX
         4QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536818; x=1791141618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCahJ3O+tXX0CfGzclDhULcHGoByJJvACQgWnDRt+Os=;
        b=J3Gffrdzcnzyf/tkm/omdSwxlaOlM7e2YYFx5EUKYE1/mOs++7PgeuEez2oB0UHbDg
         O+LSSGBtRzmzBDQBXQqLhs/E0otz9SvT1V4PGFMKIFGkReuoOv2mscOiDl3ouyevzKns
         ocSpnctgVppZstHNCgBfUbiThOCIh+27KHJIAOrEvIXpgtTFPsZmoc4vlaD4ByVgC1VV
         vVBHTT4uC78AAZ7u5VmZn56LhvuSEB0qhIiFsQiq8glCiPYFGIm6ihhO+CMnLHSaO8Zs
         OHo5s8M3Y8FaKEbC0KQsm5/K30tUz8QjxQ8LVI9rTv4H34CPn+E8wiD6jSkzasUPdIP2
         a5ug==
X-Forwarded-Encrypted: i=1; AKwUvBxmoBZl5t8ZF/NT/GWkaLJIS6HeHnMGr2Q2eozzSzKSyS5uKlcKzBjM01oOGTxuhqk3a62vpXeaoemvN/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kR/bjL8Td0qqODzrfAXa4+nph6uvd9l/yJSfB7P6uuvjxUORQx
	FSWwlOEHj88wwt+BRVYoK3cCf4ZnVTPyCJTxWP6v8kBYaHlvKbtjJI8y
X-Gm-Gg: AYBFou2gUE/ckI7QnjkB+ObXSpkGqO3Hjoq2Svh/fi2M67Bz/xBU279XqDrP6C59RUg
	Ad16BQhzwLusLWJCbbLCfiHNT0szvyGI2U9Sv6S+POOVejdGB/Ys9UDHeGMtTWxpezYnjadoyCU
	Wj3OeQiEL9p66RuFtaFDgrcXOnpAP4qbN+zQpZqICOnxdn34ED7lcfLU9wskWTcDBWuHAQkCc76
	20D4cQ5wYcJuoBDfQ1xDSQizIa1wVJG7DuTWpIndtfTLnNa+dFvxA65e5w/aGN4Qu7zg3XZ6znR
	T+JBzUzE+nkCANMqpPgoQnfd4bc8O9npf6V/A9rGlnecxPbmV5Kaxp0GpugNzGpM6FCXC8qf8WG
	NJFdEQyMKu8yFVd1yHZfjrSe8E+CWe8HjQHMk6PlSs6p3e3g+OIq2kAGCfJN7GgSKEtpYIDsM2H
	O3/kO3rzzpIFjYLMUwKlHsq8HT0mpSdfJ13HEvUhI6Ep0o2MX9+M+DUv0XNXYyzgomL6cNeb/Ut
	KU6mUwBUkOWWfLiBfFjoLz/oSuGuPzuEJv/P5C/6lHBqvppUOxD3Z8Hg2c=
X-Received: by 2002:a05:600c:4f89:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fe66c80c8mr198488725e9.2.1790536818014;
        Sun, 27 Sep 2026 12:20:18 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm117774805e9.14.2026.09.27.12.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:20:17 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	brendan.jackman@linux.dev,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	hannes@cmpxchg.org,
	jan.kiszka@siemens.com,
	kasong@tencent.com,
	kbingham@kernel.org,
	liam@infradead.org,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	rafael@kernel.org,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	surenb@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	yuanchu@google.com,
	ziy@nvidia.com,
	David Carlier <devnexen@gmail.com>,
	devel@lists.crash-utility.osci.io
Subject: Re: [PATCH v2 10/13] mm/sparse: remove SECTION_MARKED_PRESENT
Date: Sun, 27 Sep 2026 20:20:13 +0100
Message-ID: <20260927192013.144672-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921-b4-sparsemem_cleanups-v2-10-54d81d65e125@kernel.org>
References: <20260921-b4-sparsemem_cleanups-v2-10-54d81d65e125@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 09:59:02PM +0200, David Hildenbrand (Arm) wrote:
>  enum {
> -	SECTION_MARKED_PRESENT_BIT,
>  	SECTION_HAS_MEM_MAP_BIT,
>  	SECTION_IS_ONLINE_BIT,
>  	SECTION_IS_EARLY_BIT,

Hi David,

It seems dropping SECTION_MARKED_PRESENT_BIT shifts the other section flags down
one bit. crash hardcodes SECTION_HAS_MEM_MAP as (1UL << 1) in
pfn_to_map(), so it now tests SECTION_IS_ONLINE: offline and
ZONE_DEVICE sections no longer resolve to a struct page. makedumpfile
only checks bit 0 and is fine.

Keep bit 0 reserved, or export the bits via vmcoreinfo?

Cheers.
