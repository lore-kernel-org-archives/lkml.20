Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755873;
	b=h4d1ROqkwof4Aw+MfhVD+YgoiK0e0P9VaaMsHeQr0Mfkazl7ueIVJZ3eJ5A1LHLHv78F
	 AFQ5UM81697bLoFI9j7OAUywp252gc6jMoE5QCUbZyffnLF2/p1ATlOM8x8BpUHbTkKzV
	 EUGpIsGS1BJ1DGaHZS7PZ91tH2g00y+G7SoVpGMZrO08NNHNmw6gLvjbc1bt640rLaUA2
	 V9teCYuVG70scjPf3A1VhgHhzX9tDHtq9MYqJJNpyiiakR5YJ1abbomU/iyTvs2v9AICc
	 7qg+P6aKJEK/QwPpRNXGad+p5ERrlbvLMWl3xjLtEoqC+DpFC6uVgliiftBpCLKbB/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755873;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uILaEjTmikObRymXS62y7PAE1rdhRW8tNvZex54A274=;
	b=v7lWDWV2ifjbAogdXDyevk3J+kpZABXsWbzZHAfAn80dV03uyRaa7p121aDRRJhT3dDO
	 wc64WxvTIHVLNO/ZAqm/MTkjvC6y2oM6QYxHU4QI7lCrJDIrA6IYC9UcKmsJGeKscP7l+
	 OWjmfb/0gwy9ZqnMX4N2OMelNuRy6Tpo6ff4+Bz4GmYwoVs+/V84UovRio88b07OLMHHA
	 JwcYOSg2dEqy3hm4prSBJL+7dzAwWUS4iezWutldUZtQ378zFAMwmcDVjGfu9Q+Iu0yky
	 +69up3lnhLsNs5qNsNLxHbf6yqXHV0eYUUbacojzDas5EpbaBCx5xG+Q7g8MVY4gNOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=W9uku9oX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC6606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=W9uku9oX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24591F000C5;
	Sun, 15 Nov 2026 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794755873;
	bh=uILaEjTmikObRymXS62y7PAE1rdhRW8tNvZex54A274=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W9uku9oXa6C6FjtQGfEhD7DNicrQQRcqbgmLK5Hh+s7px3+loJmcK+S8yT+Oqbl+U
	 cGZjieZxCoM8mI41695GOol36C4ocuiATQRgYAFFiTR1tfgar9x378NlKWz48S5TDn
	 IEtz6mPICx0IrUDFyqd5+x7uET11fxgbhxeGp6Dc=
Date: Sun, 15 Nov 2026 07:17:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Blum <blum@kernel.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Breno Leitao
 <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, Sang-Heon Jeon
 <ekffu200098@gmail.com>, Wilson Felipe Pereira <wfelipe@google.com>, Ryan
 Roberts <ryan.roberts@arm.com>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] init: Combine blacklist entry allocations in
 initcall_blacklist()
Message-Id: <20261115071752.ca50507283d1d4cf94631a91@linux-foundation.org>
In-Reply-To: <20261115142321.96774-4-blum@kernel.org>
References: <20261115142321.96774-3-blum@kernel.org>
	<20261115142321.96774-4-blum@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 15:23:21 +0100 Thorsten Blum <blum@kernel.org> wrote:

> Use a flexible array member for the function name and allocate it
> together with the blacklist entry. This removes the pointer and saves
> one allocation call per blacklist entry.
> 

Looks OK, thanks.

> --- a/init/main.c
> +++ b/init/main.c
> @@ -1266,7 +1267,7 @@ static void __init do_ctors(void)
>  #ifdef CONFIG_KALLSYMS
>  struct blacklist_entry {
>  	struct list_head next;
> -	char *buf;
> +	char buf[];
>  };

We need some care with the flexible arrays.  If some code does a struct
copy:

	struct blacklist_entry bl1 = bl2;

then the old code would have worked but after this change bl1 has
garbage in its buf[].

afaict none of our static checking tools (gcc, clang, smatch, sparse)
will catch this.
