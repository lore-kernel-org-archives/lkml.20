Received: from out-zbxj-a75.jellyfish.systems (out-zbxj-a75.jellyfish.systems [198.54.127.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC44AA41B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861345; cv=none; b=fxOe4tADGDExf18w+VA5hAlyMXbhbVLKPNcs9CrglDhT03pLn8V3kreGrBLnBxxsnVTfwoSpu5yqVsZ7I9SEI92OAq88jEvAo4isT7M9OOQ3g9M/CE+ozhm/f04WPYziE3pIpZ+5wS/NX2TpH4ZW4JICQqBkoiV4JSBapnOMT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861345; c=relaxed/simple;
	bh=hWGFkYcxEIlLaqPllDwjUUW2jFww0HewQT0w18/ydMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQon7PAZmWFPW7YWZm6vwq+OnCTVPFT+PeFQhf03ruCnllMsf69+qh2bE7wX3RwvDZ7iqfOpeYbkkKjXCQAHTCZ1y7dhXiKeIEHEcAPBLV99/Js82k1J0wivSC3eefESWSuJ9uPrvBN5VIaV2nv1R9YqfvxdkrTGuU2QZamTzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=nIGz0OfO; arc=none smtp.client-ip=198.54.127.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="nIGz0OfO"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK7P1Plwz2xLJ;
	Tue, 08 Sep 2026 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861334;
	bh=hWGFkYcxEIlLaqPllDwjUUW2jFww0HewQT0w18/ydMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nIGz0OfOV3SNCEMiAGIXJXLmcg+yjDoGGUT4qvi1zY6IHV3T1pkIq0a8iVsZbVHqj
	 wvzXgql0cZ6A+YKEZvxjCtJDXs1JVsfavFJ4rlTUte2YWJyGX3huaCyxuyLxTYKqKG
	 7UDQgw5fvDTn52U2oQeGOsKwnYkf2n8mj3DOa0le612/jPYh2FuaO9FF6FXqycziXw
	 a1v+HOvoDPemb1Pkjv5ZIR7LiWBCb+bDYsO0gWIczfkV38e3c7vrBsQBZmdmUH3XzH
	 l+I/YTIPss3cEEI8e5Xkopbthy0C1ky1uhtGQ1SvNGDsePb5uOHUSYJfBhoeULIhTl
	 PNSEe1dMf9LZw==
From: Tianyi Chen <hi@tychen.cc>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hi@tychen.cc
Subject: Re: [PATCH] tools/testing/vma: cover hole filling through __mmap_region()
Date: Tue,  8 Sep 2026 17:55:16 +0800
Message-ID: <178886112560.138404.17928228712742724255.vma-review-reply@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ap5pmX-RddQ-c90O@gremlin>
References: <20260906144100.849288-1-hi@tychen.cc> <ap5pmX-RddQ-c90O@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Thanks for the detailed review.

I have rebased onto mm-unstable and incorporated the requested naming,
comments, const qualifiers and simplifications, while retaining the new
/dev/zero test. All 29 VMA tests pass with ASan and UBSan enabled.

The revised v2 patch is here:
https://lore.kernel.org/r/178886112560.138404.17741948638665342936.vma-v2@tychen.cc

Thanks,
Tianyi
