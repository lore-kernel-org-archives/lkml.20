Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865900;
	b=sdXFWu4FzxlsCb+CUGNmJhznrGEJiiHiJREVZzq7c9k+6foggjl0kOTAkAXiAUKklrkN
	 YG1yBtWRNj38AFZXonHNu+KvT0LIN9CQFhAblOa+zeZl/yDm3HExAvlSd0g4GoNWe5OV0
	 dgtrRpb/VnQi7fBPTMa0nCqKaHybmJUI5us+xw/WgnuV4yjJYmvUlDa35BcM0Odr1SxO6
	 4PuFgGggweT7F+jsIywD1WoJhh3DimKgGpJ8UIpUe6Y3tY2UkNYhPb0YayZdLJT0xt66T
	 GwP8TM1gFYlt8MxGqY/d3Lq9AsQgsvSO8UXiyZ+iLrcFnh0mzaseQNe4PNvwBdGY5xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865900;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zZ2IMqdyHD8YPJWNNN44CHMDAC+YrZ7ZFUxCkTKxjuw=;
	b=jN6sx0f8WfIAzGyJCNBU2rKEWHblBkwrHF+bn2V6d+1UNzKP93Q/bP4RlBjnMfKpIwdb
	 DcyV2duEPp7iG1YQsDF2yVlvQz73bL5ypUg2OMgC/PAgys0+uQDh8Q78OB8WYtQu5gpyM
	 1MyCBZfl/sLu+ySj7mRDSkK+Fi/MyJnmwX9uZt+7sCXKKpLwijejyYxijMP4UeNwICidH
	 ST4T30n610XI8bTc4X3wLmoK8+v1ajmmgXHZ4ZFeYbJjU7YHxooW3AX3c/bbv0M11AanN
	 +gfNnX8vmlqhSIdZkDCNY6NZm54767GuO3uf4FEbvjjO8WHroSSZXFpEPkU6kZx1xHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Izs8aCyC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57A606A323;
	Mon, 16 Nov 2026 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Izs8aCyC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DB11F000C5;
	Mon, 16 Nov 2026 21:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794865900;
	bh=zZ2IMqdyHD8YPJWNNN44CHMDAC+YrZ7ZFUxCkTKxjuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Izs8aCyCT8WLVKCgQXZHc7msMcujOYkqmvf0GC4HOdtxuCzVvM5W/BHNCc4BZjqc2
	 xQ1eNz2ZOYVBlmihJT83FkEhj6fKJcDLujz7cWAnrBEf2xykRaRIua+PoH43WhU8U1
	 ARSORGIzoCA4exG564KRiq8xIqdLKvMdSo4y6wH8=
Date: Mon, 16 Nov 2026 13:51:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Yongxin Yang <yangyongxin@kylinos.cn>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] profiling: keep the error message in the
 mm-nonmm-unstable merge
Message-Id: <20261116135139.ffa354b526687dd39f62b58a@linux-foundation.org>
In-Reply-To: <20261116214219.470791-1-sashal@kernel.org>
References: <avsnCFn0jCvbhtRw@sirena.org.uk>
	<20261116214219.470791-1-sashal@kernel.org>
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

On Mon, 16 Nov 2026 16:42:19 -0500 Sasha Levin <sashal@kernel.org> wrote:

> Commit 944b8062bc6f ("profiling: report it when /proc/profile can't be
> created") in the vfs-brauner-fixes tree and commit 091be6dce28a
> ("perf/profile: report failure to create /proc/profile") in the
> mm-nonmm-unstable tree both make create_proc_profile() return -ENOMEM
> when proc_create() fails.

Yeah, two near-identical patches were in flight at the same time.  I've
dropped 091be6dce28a.

> The second one also prints an error, as the
> return value of an initcall is not shown to anyone.

Unless they use initcall_debug.

> The merge resolution
> took the first version, so the message is gone.
> 
> Keep the pr_err().

OK, this turns 944b8062bc6f into 091be6dce28a, ack.


