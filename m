Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346099;
	b=FRJ6ID876mTKo8VJRdrdiQA7UJxRYtCKvtvio6hx3dZfQOq5DkRIvtsagw+TLVefSoku
	 VTL1qS1JUQ4VH28TEAYrR2dBnrIcpX4VA+phJJg6Sq+MB726Z4YsuRgxFoRneqxnQOZ3E
	 dQmJac5nt3qcf6RczylvaDL3raVK0fthdNmQSPckeyySMHabeg+adA1EvcBBFrkrn/9ci
	 tPRPj/3R3hd+K4vOSd+vpZdA6ad7V4NSl/tWMZmByflCNohi4ajV6VWWtV6jmIoQmPwJ1
	 vjWBoCY2+ODuC0Qwh8l1NogATCSXeSPkENXKx7fH5lTznDggob4X31JacPNNnHLpQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346099;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LHQfIWBN+aSGdEKtJFwRZbRX7DnmFZfG929FAAq5IgQ=;
	b=Ko2fsVSk8mR0k4QqCI1WnlAwVrge9FTEl0vLPXoCpm8RD8yIkiAaicDW2zjKnfLYZSgu
	 aUbieINkfFUvpvKOPaQvB/KvjjUP4WsJKNJEDE0q1/Qsv93YNB8QMh+6GRiG+Ur0eg/Bn
	 CNL+bP0QthldEZbwQKsE4TNTI+OpUEKvDvkucmVTTu7XHIjCkoMtIremHBa0WitYx8ILQ
	 JMBAIJBRLDXQFJhN/LY3nqWOaI/tSseHRy4/etv+/mOKFYufZpFSarBNLJBmWDcCKhsYN
	 Gr/x/+z8JGcDbPFZr7ah+6liSMeiv6O2F/cQRL/Idu6OrRiAoG+lLOVet81LNGlutXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BC7f5qyj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F5606A31A;
	Fri, 30 Oct 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BC7f5qyj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0861F000C1;
	Fri, 30 Oct 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793346098;
	bh=LHQfIWBN+aSGdEKtJFwRZbRX7DnmFZfG929FAAq5IgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BC7f5qyju+/fSlQIUvWknQdcX0/4Lgvmwc5UewXk6ZGBO9IH/RlPeNDXozvSHnr2e
	 rLAE8V7idK7dM6vNbAipaoMjUPk76icNrrEaPgdtLTr91YhJ/1ZXrHpMbb0nLbQ6p7
	 msZmbfIaZupQS+ozV3/xLWtjS6++UtqQfxYIAOfRNI7YD3nwdWVjgGU/nzkWGhyDMp
	 a7SqKgqFsvFpZP3MRwbmIXNKX2MTxNEKagLT00XBSDhoHeKQq6t4UUKUKo406fXVdA
	 c+k8FEhHkl6Qfif1USVoINmgdqXY2QyZg4kb8a9xPkGh5czUsEP5FQY/K/COTjLMKB
	 Hotj/KXBkrLwg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMhF1-00000004buE-3RQR;
	Fri, 30 Oct 2026 08:41:35 +0100
Date: Fri, 30 Oct 2026 08:41:35 +0100
From: Johan Hovold <johan@kernel.org>
To: linfordWu <linfordwu@163.com>
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix loopback Kconfig help
Message-ID: <auRKL5XqAFGOek4A@hovoldconsulting.com>
References: <20261027142258.1720002-1-linfordwu@163.com>
 <auC2LiV6564Z1zFg@hovoldconsulting.com>
 <179328281884.1789021.4493185936400503751.linfordWu@163.com>
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
In-Reply-To: <179328281884.1789021.4493185936400503751.linfordWu@163.com>

On Thu, Oct 29, 2026 at 10:06:58PM +0800, linfordWu wrote:

> I found the incorrect help text while reviewing the Greybus Kconfig
> entries and prepared the fix with assistance from an LLM. I should have
> caught the earlier patch during my pre-submission search.

Thanks for the details. Note that staging is there for people to learn
to create and submit patches and that using an LLM defeats that purpose
(LLM generated patches have therefore been rejected recently).

Johan
