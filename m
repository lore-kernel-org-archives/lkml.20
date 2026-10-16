Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B337C112
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139545; cv=none; b=HF99/hU72NHIGluXE46maGrfJhgxwl7PpwK1mH8HbSmTDaRYeDj4YWufyC4PrD3XWn/zfjnBDC0KuPhLLDZ2VMvNbRh2u7K4G7aOb1WfzrK3XQlrvVwJRUbPeozqaL+r6ymtIuIQpTD3iSNIwq/6Ds6fhnH5iJ6wqo+KvmJXdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139545; c=relaxed/simple;
	bh=Z0knyNoyrHUCFuffs2H/t39yJ/mOtyuS1kwQgEsHC74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hv6WVvjUnx/MctZntkZ46g86cCYfoG/Y73sMGJP2+FK2iM7Bu2JDgZ522Fi1Qa5ntEl6aH0xy/8RUjqep6K4aWSZjbzNDLwjMj8N0gNlwOscAOBAXPPGn9ajgL0PxxFNlB1uOVQ3K23mD6xS56wC0Vts4Y3kv2bYJgB7zD4lHig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KnUu8XTZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=95CZcwQ2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KnUu8XTZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="95CZcwQ2"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792139541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0knyNoyrHUCFuffs2H/t39yJ/mOtyuS1kwQgEsHC74=;
	b=KnUu8XTZRdq8NbzqavIzWYLKwagmY5oJY3miK4BGsS6aBc7imVHGCM00QPAi3ygOcsyY/T
	ntn23I/HYuDdQ9peLQf6h0oP0wX0AsOyH4U7j2fyAgnM1LtGuuOQ7KZ1Uo/V/uMLw/roXr
	g70hQA4bntIkpPLcDLcVTY9hA88VXAAId2DXLLQgRfpMbiPgYOCTEZPdEocpDQREmgCLJ1
	yntgZ1x9yjrAYIp6XeuI6FknKykuvI7DYcKO198hccEEloKq1NQIjSqibVkjmxnwLJrOmd
	el0EMk92f0M0ffYNb8O18jYYvD35/zgcfoDhBpOZZO8gNZg6UUzxlRFVhIe/EA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792139541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0knyNoyrHUCFuffs2H/t39yJ/mOtyuS1kwQgEsHC74=;
	b=95CZcwQ2pn/EpknwiDTM0yLyOESuR0oCpjCJV6MIg6/bceDUnbbFYuu7zV6SzIaVGQeoxi
	dMnmsYpF/YSE8iDw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
In-Reply-To: <179213417712.1857356.6461669805362228910.b4-review@b4>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
 <179213417712.1857356.6461669805362228910.b4-review@b4>
Date: Fri, 16 Oct 2026 10:32:20 +0200
Message-ID: <87v7723v1n.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> Thanks for the fix. Looks good but needs to be rebased (apologies for
> the delay on the review).

It's already upstreamed ;)
d585018a9258efed01514bae369ab3d4f21e7b1a

Nam
