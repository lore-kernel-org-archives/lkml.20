Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886252;
	b=30Gd6XXAT54lBq1EOLoDf9yEn8MYT9xBu3ZqDQ09YBPxK+dLPh0zberP3Ww/O/BtiYVT
	 R5qxSx3jNrgjhHkKVvYll/gcpcc3NYHPC/BK7oR9k3fVleD7SKpBEqNRlzndR2XFbgL1E
	 bFC9zwK2FbDy4yN7aUvVTiOqTGZpqWYHXEcYDmwXi9K4YSSFBBIGWilS9NldT0Lq/WgJ6
	 d+EkfMdm1wJoolSTdIG2DTsjt9c7ZJSjKRo0a/8oBIxNFZ4fjKlaEJgwnclcojFkbVSRo
	 L4ZFMrAiwF+zxJF/Zuf7W5k+rZ1yuw9SA5sJk+e4VuZZsXkHkiTyOy3Z7QmMaL2ZB4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886252;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nMx+qKZMdTW9xm6I5WXQUxc3B5nxfYJ70c+GdQuGnWw=;
	b=bt/YvmHlfnwJAf4mMnD8FjZLXVzoke5wKE0YEjXiXZ0L5cGrac48GR+Uw9/0Yc9w4IZF
	 GXDTltqQXkDkdW0RBchezgAw58IPaI+bjMJbeiWnyWMkhDCtg7XHNg0vgCEb0p27hdY/5
	 I9LdkuG6blX+pFKC38N9C4J3j5q6kkS4Hcx8SsNsQlwugqv2BJFYnzADGt/wOkhs6UzT3
	 ljCZfhrmihriYAplrXLZ29ifF1+k8fDKL5PXi3VX9aBF0IAPdOQEN+qPkx1SctetiMLTW
	 KMeBcs2vkFhTcTlZAZIjyymQKtnoEczHdO4gvS74jZv+YiH+ZBd/UZZ71tbt+yWKy0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhZm38xY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24122606A326;
	Thu,  5 Nov 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhZm38xY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9371F000C1;
	Thu,  5 Nov 2026 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886251;
	bh=nMx+qKZMdTW9xm6I5WXQUxc3B5nxfYJ70c+GdQuGnWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EhZm38xYRGEirWuC3vHIElR3c+JDHgm6QvjpindY01y89POMRMIFpLxmtZaU0EJwp
	 XfRmKQIPvjS0CQwz946ppbyZjnsg+jw64OdFa6aH0mKXC4pViUZ4bArDapPQINrMzX
	 8LtWVKh8e6yX1L724rlFoKt3OT1mL6+elQLemBbuHye1UK48QKSUHGwJB3QEZdmyzh
	 iKpQPqYJg6i9Qv9Nj3ix8ZmCvtCOjdnMGof2JG/SYqxV5nft5WM9qBMX4n64p/eSzP
	 sPbG7BH040bulNJ8JXohdw/xDkQle4/AQ53yVKeG309PLs98BEXJLLc5YXx1uzUgBb
	 TOAXqLrwGpxeg==
Date: Thu, 5 Nov 2026 13:44:08 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20261105134408.GJ1650678@google.com>
References: <auyHEHDcjYRWM5ip@sirena.org.uk>
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
In-Reply-To: <auyHEHDcjYRWM5ip@sirena.org.uk>

On Thu, 05 Nov 2026, Mark Brown wrote:

> Hi all,
> 
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
>   544 |         device_for_each_child_node_scoped(&client->dev, child) {
>       |                                            ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
> /tmp/next/build/drivers/leds/leds-pca955x.c:554:25: error: use of undeclared identifier 'client'
>   554 |                         devm_release_action(&client->dev, pca955x_fwnode_put,
>       |                                              ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:559:35: error: use of undeclared identifier 'client'
>   559 |                 res = devm_add_action_or_reset(&client->dev,
>       |                                                 ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:562:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
>   562 |                         return ERR_PTR(res);
>       |                                ^~~~~~~~~~~~
> 5 errors generated.
> 
> 
> Caused by commit
> 
>    abeb74220fefe (leds: pca955x: Take a reference on the child firmware node)
> 
> I have used the tree from next-20261104 insted.

Looking, thanks.

-- 
Lee Jones
