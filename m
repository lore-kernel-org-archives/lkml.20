Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992812;
	b=cUdU1DU4hxNa5HVrvEvRlcFyIj1LYilCTqXJgYYivMJsdyF8WoEUhWYJTxTXxfQ2T6n8
	 X/FVh1dirDaAcW4jxigxk6kXigveWOh8vLzM/VrB3/RrxSTMFjIFT1+hU1zPqHrr+duVL
	 PFcvsOKDo4fAsobnyty7jhDv4iw2Jt3xIM4SwAYzXEagiLtj0dmVGgs8bchtI0qb7jkzz
	 kAM3UwP0nLG/ss5DP9Sedf4JIsJAriGxqecrWk/ymIFqR4EKQVgRKIHEo0iInvTUKreNK
	 oC6qaAJ2Xu/J6e0KDSZcA8L/iCgq4Nita9SEeFjNzo8PqDN2Trs9V8OPGvh82wSG7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992812;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=pEAEJxoLAEus6zmW3dpfKZD8s8n4W3sDL6tYI9x9R6E=;
	b=h4qhF6j2XaQxnZISGx9xq8nvABAlba6dQ9k/DyNPqKP2Dw+DTXasjOZ4eNwpumIkUfeO
	 xjc+jiq7+71hXCzldzUFQ2K9FxJs5ZqVKp5jZzyjFuACLLtxzDEY9nRpcB6ZR+Z58PDM9
	 IdcJGtM0KdMDEqU4gsdgPPcf7siAE7DlduPUFb6PNuUxMpAte0uP7wqadpHBzCrz0K2sz
	 E5V9My75HYK9eAJFSNEz0e2wdIpGub3arPNhBCQxdNOWSEnE6GfYBDNpe54+58RqeSe8k
	 4dYiOdm+s1SBq3vVwM9ewcPrbI7Ps+yqlalu1cbvEJ+M2iXHY+LRsOwLdHfEUxk+4jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=bjXjnmkl;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E1A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E1A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=bjXjnmkl
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 93A27318;
	Fri,  6 Nov 2026 19:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 93A27318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1793992809; bh=pEAEJxoLAEus6zmW3dpfKZD8s8n4W3sDL6tYI9x9R6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bjXjnmklbR4/P2bM5WqHsVt6lrwrIzYla6WttG+YMXJYyxp+XrbT8Awa6XY1KBcVY
	 coZ12P6XJL0UVxQAo33bhbLXkSdXJbdfOlzckYQrXf6wtUuAVe+m2lBVSE61vMnkEI
	 WJPyDbh1cEpNOF7wEe72AWGdRECsFfel68y9ierM=
Date: Fri, 6 Nov 2026 11:20:09 -0800 (PST)
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
In-Reply-To: <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
Message-ID: <fcadb228-c6ac-d97d-8f9d-0b05f44f112@namei.org>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop> <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org> <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
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

From Chris @ LF:

> Hi all,
>
> This list is now operational
>
> address: formal@lists.linux.dev
> archive: https://lore.kernel.org/formal/
>
> any issues or queries, please reach out to helpdesk@kernel.org
>
> Chris Hoy Poy
> Senior Systems Engineer
> Core Projects
> The Linux Foundation
> Perth, Western Australia (GMT:+8)


-- 
James Morris
<jmorris@namei.org>

