Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802111;
	b=AYfQC1nUyoWaBJiWnwmNXMqBGiT0RnTLVDKrVwe47GuhbH8P8na4xb0VwGYSkg6gJf+Z
	 TuMrf04+7kwgsJDLsQNlNdRy/Qlggbl/NdM86W2HskHV5yrw/gqrmzCBZLX8fAI7/U8et
	 1V0dfKDbvyrV1eahVPEhQoEYV2y7wzAI79aNidOQE7Z50Q+sp6xGSq6hcFahXFOuJaz1z
	 OUkTC49cJvs89jHl3Sd0+5E/rhB7+dlkNHoFH7Cq8Ste9DINQAKTmqyubUI52qiqIz011
	 0mMQaCnm6vI0o5pMmwxku8trKziae2TAusy8XzyJiRYNcIjhbvu6fntPLcRkiS2GjRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802111;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=d+HNJ4xMxnEgTTUQcyEb0YV9rSrW2aczwrTwMqYQtlI=;
	b=iz4Bn0RTSBCl4OLjnCiEP9qKc5Zx25EWfBVBzW6/vacoIF5/JnIh6K4Zxe4vcXnUsRaW
	 u+IqCASysJYEUY1zd/hShOxEd8oKUyOnQmrNadqwulX2js8wKc33hxNvlnixxGZE462js
	 OaS9pmegFTFw0vPmjR8leXwsZYyBe9y9JAsv9gGMJR3gmKGW9+8qMXewx5doP+MmIA8jS
	 QNVNEBjMxEt1O2rkH3R5EUABkak1PPqvbztaqc3ACX16IdUv1rlcpPNLr9ljVkPhebTVd
	 epaXQZw7HNaW95C32idqe83eqY+PiEaLts7zm1Bs7Ed+0LaX4LkjYJ0ilaDL93AqpuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmvIrT1u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C1606A31A;
	Sat, 24 Oct 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmvIrT1u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0A11F01825;
	Sat, 24 Oct 2026 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802110;
	bh=d+HNJ4xMxnEgTTUQcyEb0YV9rSrW2aczwrTwMqYQtlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cmvIrT1uP+vfGt8oq5aXJwbRrrFCuvn1u7jXRvf2Xs8Sc6u9/gmtT/Bcj/TfYtn5O
	 CY6U/hnLuxanrG+c9GuWxDUsPjV2zXa/pJ157TIqANKa3zghRvz7M2G5kebTppX5Eu
	 wSkl22zIrfwMZWQaGeWHmRIzUgWcVINsPkgkVQTV/xyWkU3e+tgiq73U9yb0GehyaL
	 D3ObsRXnx3LttwY8jM2zga/a51ExMomg7jX4f01G683b38e4erPEQuDDeIb1pcD509
	 Zpta62Qd8fE1/ny00/C/w2iLsP0+yIJVTQBQumGyHmNsPOaCEDAIwSXsZ8LhsfpOQc
	 3tHloDDnDBhbw==
From: SJ Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uaccess: fix some erroneous kerneldoc comments
Date: Fri, 23 Oct 2026 17:35:02 -0700
Message-ID: <20261024003503.87171-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87se1ww4ld.fsf@trenco.lwn.net>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 23 Oct 2026 14:21:18 -0600 Jonathan Corbet <corbet@lwn.net> wrote:

> Several of the comments in include/linux/uaccess.h generate kerneldoc
> warnings due to the use of "/**" markers on non-kerneldoc comments and
> unmarked literal blocks.  Bring these digressions into form and eliminate a
> number of docs-build warnings.  No changes to code or documentation
> content.

All look good to me.

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
