Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D1B4BE430
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979347; cv=none; b=kdis3JJ94RItvdw6PDYny1yQrgDp29faPqGysVrOlMkUg5cBTgW0MnNJCdGy623jj1kgwSsRZzkoUocqdhn21vVcULGobJFcwi7qZEvN3difMQ60LBSi3+KWkyRPGkNB3p9EpFMpmCxBCN0ywlW154MGF3OSRztOHRk33vb+uWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979347; c=relaxed/simple;
	bh=td5gTRAXqu/5yJjm1JgdFJ7KR8oy9c66MFnQhWV0nhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EM+SZIWo0y9NErHdbOblSlQTsvJaaEZz6wgBFRf01wAH/qQBG0/R1Bc8I6uC3+8ey5YhrRQ4QEZ5aHPeI7r/3HAcSSv71xzqgxbZ2XhpSUp1Vs6qqdYC6vdQlrtb87srP+fY6ihvHqq/oHNd7PRigY+TJg0/gL9bSvliWw1AIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SKv2Q1zF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JUoygaOR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SKv2Q1zF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JUoygaOR"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791979343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=td5gTRAXqu/5yJjm1JgdFJ7KR8oy9c66MFnQhWV0nhw=;
	b=SKv2Q1zFxyEM5qebHSzw2NykzgaDY05bQ/AKhWa1VqICOYHlQ6QgHLeKas3ibHfD6NRIv6
	lnLULyz4XE9VSafwYvRK69J80BOsC5pInUMynsQgYFWvuFBtSeLgGnRb8Ylqc4d/iDs84G
	8Bw9sigLI6yCKBS6QOQTJ2a2ZMfGDl6gz0zN6EEjZ3Cb0q1OfRtBhrJX5BYLUyW4DH0J9k
	ASLFj5xzc0LW5WJe8UL30yEhbaOIdWBstxaZNYPP/JleRWTK/52F/3tBwgja1aUVElfAYQ
	jrAna7egkFnN8pP5Eaf4YJ4ooOfy7dutybJDIVLggn+Acal4BpOw5AC9seGHyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791979343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=td5gTRAXqu/5yJjm1JgdFJ7KR8oy9c66MFnQhWV0nhw=;
	b=JUoygaORWgwe2dxD3kvvVDr+HOadxzE/EFbZlvJx7RhbvFU1bMuLw7BzAhl62q3y63plMv
	qWKZ2tp79C/PPPDQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Chris Down <chris@chrisdown.name>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] MAINTAINERS: Make John PRINTK co-maintainer
In-Reply-To: <20261014115029.203908-1-pmladek@suse.com>
References: <20261014115029.203908-1-pmladek@suse.com>
Date: Wed, 14 Oct 2026 14:08:22 +0206
Message-ID: <87a4ogxzg1.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-14, Petr Mladek <pmladek@suse.com> wrote:
> John is author of the huge rework of the printk subsystem. He has a deep
> understanding of the code and great awareness of the various user
> expectations. He is willing to step into the maintainer role which
> will be a great help.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

To show my approval...

Reviewed-by: John Ogness <john.ogness@linutronix.de>
