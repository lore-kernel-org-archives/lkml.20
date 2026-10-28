Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184765;
	b=owcBpW1/PD8XAMm5NkxdgrIcD2pRktAY6ii2OJKoF7fv22lrQd+8fJRiBTQLS5xLSibd
	 cnApwukrZgaPUH09z0JIG+IU6C4oS7KNUrBf9u7P3P3T0CkQm+1HznQy9/g1nLG/BZov4
	 wH+M8v0A0wJxW9pmGGBfWiKgRDF+vh0li2kHiEykpqqv+N7Kw/4O9qlSCNh5+dJWu5Flk
	 ivMd9i60avba1OCV1dFW8tLBxUc49Nn73ND7r46/lUSs5zejWN0ieeEiS3bD0zYVbjfub
	 WAgVuXnWHwch/tkbiDjh/TPjPgPLNkGIN/23/TL9vk8pnk3AD6PpNFg8A0D/Iwgz1nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184765;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=YLtjeRYYEf5bFjYy54MQbeeJFLBWx7KVEs8c8ZnXFrE=;
	b=WGljRCbgtSIQdrhI1OpLiOpsr5GrVXlPLBhsp3ty7McqwJcW90bDyCS11CmT/H39/Skm
	 wis19LW6w1x63nAeeQK6JU5fC38JC2RuC8yvsr0CpnUdViomkUDF967W0BtKZG3B2FP8G
	 0Sea3ZajJduH8HTHx7jpG2BPEzJ5t4DZpC8OZSD8meAUd26+gkIhJsV/fF2n0tUpOPAZ0
	 Tne5Lv8wlxBv1I4UINxqd1sM83YfyRzxMlo40uUiaFrryhNGZNK5+IwrKEPV39iQQASck
	 eDJ4ETENvEUt59KJ/exeoSp1/VlZCz8VsWZc6TjQBakFScBb28B+Xxgf/nqkeyeEtEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dtoPBo6Q;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dtoPBo6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YLtjeRYYEf5bFjYy54MQbeeJFLBWx7KVEs8c8ZnXFrE=; b=dtoPBo6QMvG9g9T4RmurH3THLY
	qFWzwdBi2lDErilSfZ0WjwMKgCRbS7fFDX4z4xdKsLMjp5DyppRhjTicAoS3qZ7S4IEgN7ZzenGJ0
	i+XfnfG0vWjGoGOUpe52Gwd/wAf3QceDwR7ILq6JE8acNb6AHc/iz39BYBVfIAdTlnvfKQfQLleCx
	94BV6y1EB/lnKSwhNbdBd498gjL/3Fi/73Sl8LeEILFnQtuJRoUY0snHvdP1hC1bCYEsZ56E4p8YR
	8ljezuaf5VndNCJEnEIjZKiMgf/P12+AtbP5lz2fpMksCThwEHO8YeLE4n3DI7SdBoC0e/FMCUXCs
	ndVUkZkw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xM1Gj-002Bh1-16;
	Wed, 28 Oct 2026 10:52:33 +0000
Date: Wed, 28 Oct 2026 03:52:27 -0700
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auHNz09oyGFJPTKg@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bj8kkfwk.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Fri, Oct 23, 2026 at 10:03:47AM +0206, John Ogness wrote:
> *** WARNING: Now we get into my brainstorming, which could be rough. ***
> 
> Rather than a big hammer option, I see this more as a per-console
> configuration (similar to how we want to go with the console loglevels).
> 
> Netconsole is a bit tricky, because it has its own format separate from
> console. This would need to be addressed for the per-console loglevels
> as well. Maybe it should be extended to something like:
> 
> netconsole=[+][r][src-port]@[src-ip]/[<dev>],[tgt-port]@<tgt-ip>/[tgt-macaddr][,options]
> 
> Which would allow things like:
> 
> netconsole=@/,@10.10.0.2/,loglevel:3,unsafe_panic:1

This cannot be per target, given that netconsole has multiple targets
(as remote hosts/IPs), but a single registered console.

As of right now, all targets share the same remote, and would have the
same unsafe_panic priority.

> This would also allow to specify that consoles should _not_
> perform unsafe flushing:
> 
> console=ttyS0,115200,unsafe_panic:0
> 
> And it could be used for ordering, flusing from highest value to lowest:
> 
> netconsole=@/,@10.10.0.2/,unsafe_panic:2 console=ttyS0,115200,unsafe_panic:12
> 
> (First ttyS0 is unsafe-flushed, then the netconsole is unsafe-flushed.)
> 
> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.

How do you plan to use 'unsafe_panic' order exactly?

Thanks,
--breno
