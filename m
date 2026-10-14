Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A24EF155;
	Wed, 14 Oct 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973823; cv=none; b=tix3VW0nt1uq3+1bqw8XGcoldkoIy1NmTvPOzF3Vch60yB7cFVsdKvn/pkfl2AK5f5dx8lmbG0vg329EKNNfOoIZZDVZsr6q8OrGFomyUIzsyRu1rokwW0+9GRx3YfQWSdkua3LrfQQG6Q3oqezE20/bqTZhj+al5I9E6Efqwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973823; c=relaxed/simple;
	bh=SHefqczO8ycMBjOoN4qYF7MgcPfHD2fIkz7huaIc/+Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=g4NFRSHwnMXgra2do22ti6q/Fk9gEqHQOcMZNcZhOtwj/Cj8JbnadjapJRLZL2LLYyImvA9YtMXX3NTVXj68hNF+8W0HqRY+mbRertyTH4Ii42CNjnQ6R7gMPoax071lVgkZEe/wLUXUI8SbMD50mXpA4rzp+e46oxVnO8MIFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=miYv6V/e; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="miYv6V/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject; bh=SHefqczO8ycMBjO
	oN4qYF7MgcPfHD2fIkz7huaIc/+Q=; b=miYv6V/e/9Xne43RHMZAc2HTRLrNZo4
	JdW5fqnF5ip0hnJUv08viVpu683REcty3cVGXLF2i6WAXC2Rs8Q14km6Gt33sp22
	b1qIZqbt1qngP5+cMhzoWSpoIjwhORsOxZn8FyNZl+v/8oir9Q4lhYhmzsEROe5j
	/F2HmoUTeukw=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3l7OYWc9qhFJFEg--.56415S2;
	Wed, 14 Oct 2026 18:29:45 +0800 (CST)
Date: Wed, 14 Oct 2026 19:29:44 +0900
Message-ID: <6f065062104bf7fd0f928ade44b8ec8c@163.com>
From: Hui Su <sh_def@163.com>
To: elver@google.com,
	dvyukov@google.com
Cc: kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] kcsan: add targeted watchpoint sampling
In-Reply-To: <20261014095238.2132580-1-sh_def@163.com>
References: <20261014095238.2132580-1-sh_def@163.com>
X-CM-TRANSID:_____wD3l7OYWc9qhFJFEg--.56415S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1rCrWrtw15Zw18Xry8Grg_yoW3trbE9w
	1DGF1xGryrWa1UKFn7Kr1ftr40k348Aa4rJF48ta9FkFySyw18JFs3KFn0ywn7Xw48AFWU
	Ga93JayqgrW3XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUvtC3UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RkLamrPWZl8ygAA3C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Apologies, the individual patches were accidentally sent as separate
top-level messages instead of being threaded under this cover letter.

I won't resend the series to avoid duplicates. For convenience, the
individual patches are:

[1/4] kcsan: add targeted watchpoint matching
https://lore.kernel.org/all/20261014095238.2132580-2-sh_def@163.com/

[2/4] kcsan: add debugfs target control
https://lore.kernel.org/all/20261014095238.2132580-3-sh_def@163.com/

[3/4] kcsan: add targeted watchpoint selftest
https://lore.kernel.org/all/20261014095238.2132580-4-sh_def@163.com/

[4/4] docs: kcsan: document targeted watchpoint sampling
https://lore.kernel.org/all/20261014095238.2132580-5-sh_def@163.com/

I'll make sure the next revision is properly threaded.

