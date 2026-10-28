Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221630;
	b=yvi9H8BuSFMA1tYjhx2OJ/CY6tSBv+KIA83mHUurGOrONpMGkNSjmRtE0qWeLouG3lnX
	 aLYPj/cTYkFNjRmwwPgHZgfAPHEyKkASOdH255IeUzXJ+im7AdJz5YkZgaah2wdQI6DyO
	 fKLJJfp6x97n1GArefUmls/H5O0fm7vynz4Abkcpo1c0uWAaqtqwKfKBY2R0gzRO5jLS0
	 yRoH10VYAqNboHh8PCW2yPGYB3G93J4e4T95gerjPpu9C9f5X/FQSeANd+iOsVNnW0l7K
	 BFt9+NK2L/jgzLhI/luHnP8NsLT2r+b8zFvnolO6WSHKBEmPxtlcpT9A4HMwtygFYWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2/lPgg8fKxGL3uLAdVbmY1R/+7ya4E8tGVT7ByIFRjg=;
	b=DqBBtKbSQz7Xa1dqHvGBjuuzFO81IPAoOzylb2v4kL8wSgtlMIEv6u7aAOULLAL58zs8
	 XTasWb1sL6IoolLGpasT0A3chRvfg+kpR3K3xeQbt6qZ7A/M1iL3J2WbxhEjgJJ4NcfGS
	 u5VkWpoMkY5vEYYTUo1Su+lzcwB5e5MabFFUXaeB17auhpXpy+w7JIQlZlp1XnoeD5s66
	 NVJVmK2bKszH6qrsyQrdflWrr9srSUyw6PjXjy8WUQnVGp7+ddaU7L1Spm9t1yO6vaVkf
	 Bae/2flqBRM/IGlgqTgZmjFz2RYit5MTkXQlGLUFDEdVvhEgxdMF0pYKG9DiFCmVSZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=m4mtgKA8;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=m4mtgKA8
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 701CE14C2D6;
	Wed, 28 Oct 2026 22:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793221627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2/lPgg8fKxGL3uLAdVbmY1R/+7ya4E8tGVT7ByIFRjg=;
	b=m4mtgKA8vzB48AHooh9KfUJFZwgaPwddicOLjyxi/t6FlBpahaXnIXUf30lFPqTrFsxY+S
	3gR2+bU0BiaB9tLG4jnegOQuPvDeU5UsIi5V+1xq5OqDw8Vui+fyd/6SjMylTt/QMV4EYc
	kyu1EN17ZRbhuXmN4eFNqrLmmXVc1U+RpeEQyhmDqLUBIQxxAQu6qey1Ry2LzuPOznHaKZ
	Wg4KGllH5USVGlclz6b06inudgr1FsDdIjvXhkCK+St84F5unF+TiP33jhtcC+TXgapm6G
	/8bwZJnRU4dboykDCHzWvXIRH+acKUDtvNGmmFaYdG5PU4r83/9t6pfcaUyNyA==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 223e1ccd;
	Wed, 28 Oct 2026 21:07:03 +0000 (UTC)
Date: Thu, 29 Oct 2026 06:06:48 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: skvarlamatus@gmail.com
Cc: ericvh@kernel.org, linux-kernel@vger.kernel.org,
	linux_oss@crudebyte.com, lucho@ionkov.net, sgarzare@redhat.com,
	stefanha@redhat.com, v9fs@lists.linux.dev
Subject: Re: [PATCH v3] net/9p: add vsock transport
Message-ID: <auJj6EKveraM5woC@codewreck.org>
References: <arI7p2EinDektW0n@codewreck.org>
 <20261027200522.94192-1-skvarlamatus@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027200522.94192-1-skvarlamatus@gmail.com>

skvarlamatus@gmail.com wrote on Tue, Oct 27, 2026 at 09:05:22PM +0100:
> I noticed the batch you applied to 9p-test on Sep 22 (including
> the vsock transport) hasn't made it to 9p-next yet, so I just wanted to
> check whether it's still planned for the 7.4 merge window or if
> it's waiting on something.

Sorry it's just waiting on me to have time to do something.. There's
still a bit over 1 week this merge window (it's exceptionally 3 weeks)
so I think I'll make it, I've just pushed to next

Thanks for the ping
-- 
Dominique Martinet | Asmadeus
