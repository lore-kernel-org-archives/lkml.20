Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429899;
	b=YgTE20X+W4eYhKLlAXRWWnuwIm3989kP5QnMz1fgMpgNSEyXwYrhKI+UBoAhZYcYFKVW
	 YY19ouO9H/1TV4N6ZsvHd/xhiLBF0VX64J0tzdoyqTKVse+9W56U9lB0e3aYC8LESkwKe
	 +QiHd2bv+WV/nIjvSiEjA7gdkE3kgY9FfSwBN/rAwnJ6RFAUor2HQ2KXExRdD9L9UiUK8
	 aqqOwD83POLrBfHygVuH3lf+6ydOcWcSjYFrSF6pDxBZyCEiXr6r5TvgRMe2SdPK9h/X1
	 GjirNQBv0o/EEgkMpqVeeRW/ww9P64m0GubwkgJQni3TgphCmE94JNiM4/J/h3eUcPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429899;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References;
	bh=xmuXHhRfdZJiWO9pcue2VV3XCRgsivcHNxf26+zNoZI=;
	b=wee7RG550m8hkvfIHWJSR9yVUVXiXtq/GGFhBYhTk8aa0oonc5Ntzv3h8g6qbbVsD6Mv
	 QPHHrC1zK2ms3nEcYWwZM8lOuK+PMovJ+/r4hmd8qkF9mNiwFZIUihHHWd4Hk17y7AQrH
	 jDzDykS0/hbCx4/rrHyAtRdQbsBiLKVwFBYQ4AZ1yQ9OrE4oNrShq1qdK7gDqgkbw7dDN
	 DmMLLkIygO1RKZfxKjSrk9435zWQ0GRUcwyOnrSFEKSXjB4U1lMPhFBQe3zo8YnGHFPWh
	 l4GTv6davRdt1FedtrmwQeWbbUBkw9j6j8sQdWYpBw8GfPU18dNaIT7JAOLcLNLH5pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWFN3zEn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB3606A31A;
	Mon, 19 Oct 2026 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWFN3zEn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F1A1F000C4;
	Mon, 19 Oct 2026 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429898;
	bh=xmuXHhRfdZJiWO9pcue2VV3XCRgsivcHNxf26+zNoZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lWFN3zEnyKK0cjiF8iim7IZT/vb0NwSoqP+6sgRXVlR0y6SkRZIxFxxw4KBblMwMP
	 NsiMonAfjGzk2gOXvLD78yAbjViXxFjL7g/DxOnc2gpxtoJR461o8uRmoQbaPBaJdt
	 YV61nWvj0EQA6jpyga/P0zGivMzwGj2xV5TAyutj+JSket/+N4AGCzEwfXb2uAoZp5
	 VxzbOhuEnR2gj6DtZNw8cWhF1ShjTwmW16bVFe5eDPLQDCMMk7iJkHlns1sBkptiJU
	 2nIarCeEo7+JjYmuZuYJSzuZhdlLTtn1HFj7fpiLSchYgM68Ak9wpdhQqGzds0saTi
	 5pnIRExRwbOqg==
Date: Mon, 19 Oct 2026 07:11:37 -1000
Message-ID: <16f993e261e43155c853c62c3e2d3507@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Usama Arif <usama.arif@linux.dev>
Subject: Re: linux-next: manual merge of the sched-ext tree with the origin tree
In-Reply-To: <atZM9nFiaMvuX9kP@sirena.co.uk>
References: <atZM9nFiaMvuX9kP@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello, Mark.

This conflict is already resolved in sched_ext/for-next by a5ba5c61951d
("sched_ext: Merge branch 'for-7.3-fixes' into for-7.4"). The sched-ext
side of your diff matches for-next as of Oct 9 (a8acb152ff95), from
before that merge. The current for-next (24c453aa8598) merges cleanly
into mainline.

Ours differs from yours in one spot: in unlink_dsq_and_switch_rq_lock(),
scx_wait_dispatching() comes after clearing p->scx.dsq, not before.

Thanks.

-- 
tejun
