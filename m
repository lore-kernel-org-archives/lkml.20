Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750401;
	b=o5dgHS9G2oUhSGkNP+B15KPg32FTMJoTLrzB/QmEPbAdRGS3nRrB0twB4sC3bcXnykMq
	 bRaykK39U9Dtqw3bCObFmtKIX2G8AiRUo6R48jIiUT65QINGHa2toVZOM4GTN6Lg4EcGh
	 DPvMkFxX1dRqNQQeaw/GOCb8MvK/gSnhVKlOhmL7wy3UUc8MAPpIBWwtXvPCH3GcHLa5b
	 QmrTa+I7fB9Tt+/ytw4UW61AolOKBxxWa5uPsGo0jvV0SnVsBmoxRpVIP8+7HkJUQKcit
	 O5yt8sIvGQRA25hyEB9FXp4gDjDBwT/4sQ1e+n4dW3kQEKgaoN6mu6pTn96EnbH4Zng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750401;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:Message-ID:MIME-Version:Content-Type;
	bh=5ATE2yOKOGosqztjcDkKOQnRfc8HCctD0ggQ5fWEyCU=;
	b=29jx4pUfng01xfkpQl+mVDHKn/I5yvxGW2a14xfJddcK5pMywwbkJz+5BuWsK7OHqsEj
	 S0asyuhZt6JT6lK9A6B4uQVhfDyxkCLc+J+GFgB7zzBnl1MEskCS7f49CgKUGjh7GvflL
	 hV6zZzZtu9e87+jqvdROc3m3Yfh8xMAMQ65V98ws8I6x9pE9aqkJ7+SQU73D7v2Uqq/Op
	 yaIJhakRWG+A18p+0e6mhG3SvtxUqnVpTjFcoOrAydWxU4eyMArLBy4gI1xTV5P1JV0BN
	 4ad06jbdbAfW2gyV5zF/lT8BmJ8UJM/wuScoXP40MTr0wJ0pYc5g6DINtehBonb/VYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=lc85+kVR;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=lc85+kVR
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 77EFB30A;
	Tue,  3 Nov 2026 23:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 77EFB30A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1793750392; bh=5ATE2yOKOGosqztjcDkKOQnRfc8HCctD0ggQ5fWEyCU=;
	h=Date:From:To:cc:Subject:From;
	b=lc85+kVR3wIurMgfagfD0AGZHdlIGrWAhT9dKV9jWAT0Bvws1syg0vy+69Bq2zhNj
	 pgQli0hPDW0lWFRiAhwfb8xXwb3oEyWJ92YDuZ5pDq6Q+rcS12PaoVUM87Wni52sUl
	 r6ZY6RgquUnspV+iFDu7WA+LrSb9+WCw+egJEWrU=
Date: Tue, 3 Nov 2026 15:59:52 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: Christian Brauner <brauner@kernel.org>, 
    Julia Lawall <julia.lawall@inria.fr>
cc: Greg KH <greg@kroah.com>, gmonaco@redhat.com, ojeda@kernel.org, 
    aliceryhl@google.com, gary@garyguo.net, namcao@linutronix.de, 
    sashal@kernel.org, natalie.klaus@runtimeverification.com, 
    willy@infradead.org, paulmck@kernel.org, corinnt@google.com, 
    stewart@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    Paul Moore <paul@paul-moore.com>, tytso@mit.edu, 
    keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr
Subject: Kernel formal methods mailing list?
Message-ID: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
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

Hi Folks,

I've tried to include folk who are known to be working on formal 
verification for the Linux kernel. Apologies if I've missed anyone and 
please forward as appropriate.

Several Linux kernel developers & researchers have been experimenting 
with formal methods in recent times, I think largely due to the potential 
of LLMs to lower some of the costs and barriers to entry.

Examples I'm aware of include a presentation by Corinn Tiffany at LPC on 
her work with XArray [1], and Christian Brauner's linux-formal repo [2].

I've been experimenting with formal verification as part of a hypervisor 
research project [3] (which is admittedly not the kernel).

I'm interested in learning from what others are doing in this area, and 
sharing potentially useful findings, especially in terms of identifying 
_practical_ approaches for verification of low-level systems code.

I suspect there's a lot that can be done on smaller scale, well-defined 
projects, by developers who don't necessarily have specific expertise in 
formal methods, but have deep expertise in the target subsystem.

Thoughts? Would it be worth setting up a mailing list?


[1] https://lpc.events/event/20/contributions/2540/
[2] https://github.com/brauner/linux-formal
[3] https://github.com/orgs/beryllium-project/repositories (WIP review snapshot)


-- 
James Morris
<jmorris@namei.org>

