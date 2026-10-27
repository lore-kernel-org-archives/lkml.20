Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117911;
	b=lxUJTvg1UWFnn4a/jwbcGC/MppP9p5SvatVYQzxRChh79d8ntSsQyftb8eaR/73mFf7u
	 qmwPWTPAzI48HvytFdiiEharOJ+qIYrjmnhbgC7UdA7JyHgd8k+8OjpHlfARZYgZWJ5ea
	 eaXGapdP2kFEWHEr9lsnkaiwSKM9Oy+9Tncic+U8RwtI8+TAB4ajcqLXn0/rlpBlQa9yv
	 rKh8ejcpUdhoDdZLsCLJ5l+JT5bBhT7fm/q7Y8GGCLwJ6FAdeqAvXAVpHnG7Dblhxx2JN
	 GQQmLsEiJYDaalX37oLUB4klj3iAmRgRJgzHb2AjpIksYESxaJa+gA8pL6JL5TCiOLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117911;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=F3ebt4ZR9+PHRPPYUmE/qk9dk7OokpQRlKiGbqjEgkM=;
	b=bwWZnQWR2ujS4tZ/PSe0HOfqIPuHam/4PAvAZZkV5ZZv0SOwd+4su8+EYV+wKPMwrE5R
	 7oh3HwTGTkINsBO74lhs9C3AseuAPIx5/E/enl7GJX0LuDWOm5j+ksFJAh8n8f3EjPHHO
	 27A5FF3RNdy9GFUy4kaqa4/ypy7LzRiOMPUYaB1lu68cHqdJUFtT4s7YNzLv6XPc0JEaR
	 iSOuD8ZRbif+eD+wFOIDIlcGGWQcTfNEaI8kj1RzB6KTidqb6DBUnFGtLAPbqwhh9Bbc2
	 frzq/ZlV0kAXKgBZ7HnuyG4q9sgbivj7okS/wtkAN+yfOeEuJ81FZfhXJmhDHbHDseQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=EMTVVkUG;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8578A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=EMTVVkUG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F3ebt4ZR9+PHRPPYUmE/qk9dk7OokpQRlKiGbqjEgkM=; b=EMTVVkUG3MXj1r1iCCgiWqqai1
	TbidQMGn2PewKq+JrT/JLZK+MV7Z4iI93Eiku98koAVIBquU1IP5TPjkqIyvdKVG+K8hJ2+sogP06
	uhdjGvUCZh1eisbK3W1kV/DCim0MqF4jvqQcdnICzt0NXECMQbXQG7/QP+s6CNqguU/d8nIdcCHpf
	dNf93DoeWJ+Q3FT2waoScIVrmXQRFNky6uLIViA0h+/gt/c6I1GQOH4P43E/V14D/srOnDqz8uiSI
	Tc5+euX7QlLjhql/EhXcioqnrfP99tfByBM6In/kkFsvHq5lW8PFnD9jfuIa5FUlUtuKG/2ocCp75
	8mPnCD2A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLjsY-001aDG-1v;
	Tue, 27 Oct 2026 16:18:26 +0000
Date: Tue, 27 Oct 2026 09:18:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v3 1/3] workqueue: Move the initial max_active
 setup into a helper
Message-ID: <auDOqzyG7dn3uvCY@gmail.com>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
 <20261009-wq_final-v3-1-eb0b095b9de3@debian.org>
 <83ad009e5a67b25fd8fc495c046d7f2d@kernel.org>
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
In-Reply-To: <83ad009e5a67b25fd8fc495c046d7f2d@kernel.org>
X-Debian-User: leitao

On Fri, Oct 16, 2026 at 07:21:05AM -1000, Tejun Heo wrote:
> Hello, Breno.
> 
> The following is a Claude-generated review.
> 
> On Fri, Oct 09, 2026 at 05:18:34AM -0700, Breno Leitao wrote:
> > PS: Eventually, wq_init_max_active() and wq_adjust_max_active() can share
> > some code, but, keep this as a simple code movement for now, and then we
> > can come back to it.
> 
> Maybe move this below the "---" so that it stays out of the commit log?

Ack. I will remove it for in the new version, given it brings no benefit
anymore.
