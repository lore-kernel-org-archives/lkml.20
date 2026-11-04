Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825793;
	b=Tm9PwF9UkjA5ln58HaiQ3xZ9VE1IDMlMqDewqsfR0fAhrqBI99k3BEe478Im87RX/4LG
	 wGxUDHy1RqWnajNAhI+oOfUuaotW2okPdo7ThNzGjWUZopAs2HH2JaTW792HOlACpc753
	 SJnDUqAZnAD9ayAJEGUEP47lliY4YzZvyCudkEleMXnHwKilQbSEMyiHq80g70gZIGdJg
	 jEQUNElVgr4QvGBjyjVJQw4iEXbqihPEHcHqx3Yc3xXigfmejOXrvnwZk7bV1pyARixhw
	 V3/GY7QCbY88VtP/0OcXI16McUVbZ2nckUB7bRTReFtZ5LW0pSxsrDA3CuwObBG+Ndg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825793;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=r9IWTbinFgSI8L8vSkLCZ6LMICNrRt0MnbRpvugkNWM=;
	b=h0VrWwgoTG0bPlqfjqyHY51jrY1KmWf9hAGsCry4OPwDPdq0jOq5hWLIrsnlg3fPLb/f
	 JvcbrBYAXS2Cg9IO8GOWzdsNsJo0eK5+/ojPni2yOCuBw0K5ogSPfoxY3RahX/qvKt0Lq
	 TcFqOLdbBjZaz1pwX7KA3kN189009O4msd/m0edxn6z3s4PUmPUWpZSJ6dJDBsHrjXD0W
	 ZtmRpG6OVcuPHVk+C3oh0JUcGUjZKEP2/52F+nksWLK3k7MAO3NLVozS5Oh+yTxkKKaPl
	 DYgetH8sDQq369SAies8ykA2u6uEDIqDO6gD70PMLACCY+GIPSt6K6tMixJOeay9CSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=3Ha+DR6u;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C59609C04E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C59609C04E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=3Ha+DR6u
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 6D85C308;
	Wed,  4 Nov 2026 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 6D85C308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1793825790; bh=r9IWTbinFgSI8L8vSkLCZ6LMICNrRt0MnbRpvugkNWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=3Ha+DR6ulnNA5oSJkf06/5lnacjzXpGvMLUSK7XyaK9lrUD/ZJrSgJ9vgaE0AhDZa
	 4YZzgBNBIJXoHUH0cdKHLU0n9Ckepu0yKq2n/9nHlPUFV/g+BLbgRVQz43uwkyRUCz
	 l+8TDGokejleDAG7r2cYBZ1zcFFzm+v8HgwgQKUw=
Date: Wed, 4 Nov 2026 12:56:30 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: Christian Brauner <brauner@kernel.org>, 
    Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, 
    gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, 
    gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org, 
    natalie.klaus@runtimeverification.com, willy@infradead.org, 
    linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
    tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, 
    ejratl@gmail.com, corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
In-Reply-To: <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
Message-ID: <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2026, Paul E. McKenney wrote:

> > Thoughts? Would it be worth setting up a mailing list?
> 
> We do have (low-traffic) lkmm@lists.linux.dev, though that was intended to
> be specific to the Linux kernel memory model and its formal-verification
> tooling.

That's a possibility. Would the mm folk there would want to keep it domain-focused?


-- 
James Morris
<jmorris@namei.org>

