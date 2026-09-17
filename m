Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4993846F482
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630880; cv=none; b=Z2Lyoa0Mj5cR3h9bKlaYDAJR+jn5IwfV68M0cONfzNvIxMMBFYtB1cyGHKwwBmUZRXeNgg6DU2nlrG8luTtedIcQyjhg6i6nR4r5uIjtYhzx7NFORw/leTWQ461pM9vx9+NyVThl3InmpoYFmud330EkuDzIbmGvnkIScUjFbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630880; c=relaxed/simple;
	bh=ybuc0eQKPpFxwZiNaLTvVKXX2SEAe7c0YFFIymON/gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ja5mreYXfQeXlBgu5TQyPkx1aqzhK6zN8WSfCFd+8UFHJ3owwdkB+sFOnIeXYkVjS/w8YgpycAnmOx63uTQ5QnpHV6MhdeEfYNFPUNQm6vr1j1Gqb4OjRF8LO6PtDbfg8HuQyJdyBAObPpdhhf/xmNXNOiU0pbWa0+8yKeUHUtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0A8gbNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0A8gbNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E554C1F000FF;
	Thu, 17 Sep 2026 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630878;
	bh=6UzRYkx24oWw5btcDc5w4SwrcORJJzZQEWWbJGZCgpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l0A8gbNPpUcNkLnTtnDTAnV3fFGqBRVBv7zbncBu8uLWhJEGfye2GbUOGYw6J6USN
	 JbT75CdxGUmlVx29YcuMN4FlfJv/7qSpFuAT7Y9Wv3jeeGD/zCr+Mr7Xuj8nrsYc7z
	 mGguH+Vq9wkoMTRBmvQzpTcEx1v7aKXeQNRTrwSj+jUlH/hRstTuQWp7EGc4wy02Ah
	 mkD5Iw4RUTHw5b2f10uN8V8XbshbqM5NKuoUbVNYs4pfhjIQRZyKSccLpABa9URtof
	 R4h1hq8U2WCkZdgmuytJDR4aacshH3U7JUAIF7GjFKMp9+IUZsiSF7J533fX/t4aKK
	 OiHd5+UOTEAlQ==
Date: Thu, 17 Sep 2026 09:41:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jinke Han <jinkehan@didiglobal.com>, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, laoar.shao@gmail.com, peterz@infradead.org,
	jgross@suse.com, kees@kernel.org, rppt@kernel.org,
	jpoimboe@kernel.org, calvin@wbinvd.org, pfalcato@suse.de,
	linux-kernel@vger.kernel.org, tiozhang@didiglobal.com
Subject: Re: [PATCH v3] x86/kprobe: Fix crash when probe cs call
Message-ID: <aquZlwJ4iJ0W2Yiy@gmail.com>
References: <20260908073742.GA10517@didi-ThinkCentre-M920t-N000>
 <20260909094420.049df579134ec8525e1eef40@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909094420.049df579134ec8525e1eef40@kernel.org>


* Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Thanks! Peter, Ingo, can you pick this via -tip tree? 

Done, thank you Masami!

	Ingo
