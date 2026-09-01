Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1248A2B6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284646; cv=none; b=Gr3rNK7L5hmqQtiuDepF5PUuGFpUPh4IiwLMLZuBMGKxEg9yHffzK6eNR64DL1WLPGQ1mT3MPNPlPi5EfaFXuDUvsaZeBw68hXN7cwnBpCURocSlSRLItw9UcsQ3VkLCooxxP0g4Ac73QyU2r1ZETALNDTW2pEsT0UJUoM86nJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284646; c=relaxed/simple;
	bh=x9leVTYT5tWP6Hyjbj/iH49zRXPHhtRR4RG3tglAeCY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=k7aiLt+Y5bq/Bv0PXKHdDqnJmO5sZ9hb5tTMr0SeviyGeDCHjKGZ3lbT3vknBptkJkAAvT2QPz6s9eU8vEvbo1INkq98eSA08ep+X3Qe/p5CJdpozx3RqiKYKP82f2KQdpcKK8PN3D5beVPRZh+sG8bnpcRotCV/clErQnNwssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zHMg8t1q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zHMg8t1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0201F000E9;
	Tue,  1 Sep 2026 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788284644;
	bh=/wsf9BZQhYqZ8L0Z3IIQZrh7LfWMUHhWunluyqO61Cc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zHMg8t1q1eqDsMIcwfM2YY7Ja4ftyya2BUBhGG6pvRCPNCcZ9Ktv8DVCFUvclrqRE
	 r01hHGT50+C4vQEy+bQvUVsWkI0WAtk6TjYhGAIw5meBui4IzPR/Hi7YP8Pg1vdss6
	 PfIqOke4ytcYo8gLmYFKgRuiU3pR4NjnNtURnqCs=
Date: Tue, 1 Sep 2026 10:44:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Cryolitia PukNgae
 <cryolitia@uniontech.com>
Subject: Re: [PATCH v5 0/5] checkpatch: userspace improvements
Message-Id: <20260901104404.55d26e883e9917548025d3a9@linux-foundation.org>
In-Reply-To: <20260901105642.851234-1-pvorel@suse.cz>
References: <20260901105642.851234-1-pvorel@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 12:56:37 +0200 Petr Vorel <pvorel@suse.cz> wrote:

> Changes v4->v5 (all by sashiko):
> * Explicitly match the directory separator in new entries for
>   is_userspace()
> * Allow --no-userspace to override setup in the config (using undef
>   instead of 0, separate checks in is_userspace())
> * 2 new commits:
>   - checkpatch: Factor out the check for UAPI files
>   - checkpatch: Skip kernel specific checks for userspace

Please prepare a proper [0/N] overview for the series.

Sashiko still has much to say:
	https://lore.kernel.org/lkml/20260810164552.1049483-1-pvorel@suse.cz/

In [4/5] changelog.  What does "DRY" mean?
