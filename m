Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429900;
	b=o+1tGLTi5nvKAGgmlhmuZfRvkRuIHKTuvgcQ3u7X4Y8moLMyb/EwZwSbXS7+JfDrisUW
	 +RbdNtl2DnWLwl4qlMaZgSrdDUArRMdIuGoSYNScsPj6e9IfTkqaKbSHgXKLz2yuFwBIe
	 2OzJgd/3gtzyBSLIp2yEAau2hQy1tueDU5Vo1FGpeRex7AesHM2Ul/K8w7KX3XLrs0XmX
	 NojUFVtqoW/CB/5PsgLeeOVKmKr5fAG+ZARi/2xKus/89uuVageGLbkhEf83mWulaDqG/
	 3nBufmgyBk0vCRZJxdVv0AQU07yPyTStP1t8XmT/R2b+raDVZhPAo3J9q7C6wrP5/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429900;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References;
	bh=YetlC2DWrTczo/ff9ftzwmRiksXgWppu1i+EPuNzzb4=;
	b=1Nkr7IRGLi/Ap8dHK5bUIBHqSK1uSFPJzeguF+Ho/s7AWJ2mHAH694qU8VZV+3I2VC3O
	 LkxvtrsHfRboRy/YAfpgtB5tnFVvutYW+EUqglaDWJs0Q7wixvZ8oHwZYU5V58CBwI049
	 J4roncGhd73V4R6DsbY5b0qshfU8DoahqLq3PnvUOdMIQOx6rCs2VlMMeE9szFUda8sVQ
	 LCikCD53Oxm6fM37MurArJXBkTJ3vBqRGd23K5kplvLriIM8cX/exl5D/r47ni6623fQj
	 27XmcZdGiPLW9pj3lFeEkk8BPEuxXvIOukxviWYaADM65fmCsXeSk5OmS5iWc7geBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlXZido4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91AD606A322;
	Mon, 19 Oct 2026 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlXZido4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2651F000C4;
	Mon, 19 Oct 2026 17:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429899;
	bh=YetlC2DWrTczo/ff9ftzwmRiksXgWppu1i+EPuNzzb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YlXZido4oeGqEoNTsCfSLUQPrcias3BpVYyLDJrCoED7b7Hjc28hjYp5dz/xPQ1O6
	 nq79pLrIBdYcavs5MDOFjOd00/YUUnGlnhn1WMGKVqpRYHvj72tTMS/NhiQpjNuk6J
	 WqepAXFxM5GQXtCWrRYWBT0DFnj/dn4zqQJo/I8mW6q+DKf1fiebF7/3n3007On0K/
	 UHMWi+k1umvNhLt2ML1tQ/aFIA1IN26GXjz56PlV7Hqu79X+cquI8HucQVh+N4Wr57
	 7zmKpo6VTfskyv1w2+mbWy/VlWXPLD0t+Inm8DqC8I7iV1nRB18sVTitldQYvrBP2Q
	 FWFlElIGe0fuw==
Date: Mon, 19 Oct 2026 07:11:38 -1000
Message-ID: <803525ea614f78908df69335e909f748@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>, Kuba Piecuch <jpiecuch@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sched-ext tree with the origin tree
In-Reply-To: <atZM-tXvYuR1bE3z@sirena.co.uk>
References: <atZM-tXvYuR1bE3z@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello, Mark.

This one is also already resolved in sched_ext/for-next by a5ba5c61951d
("sched_ext: Merge branch 'for-7.3-fixes' into for-7.4"), which applies
the rename where scx_reenq_reject() now lives in ext.c. The sched-ext
side of your diff matches for-next as of Oct 9 (a8acb152ff95), from
before that merge. The current for-next (24c453aa8598) merges cleanly
into mainline.

Thanks.

-- 
tejun
