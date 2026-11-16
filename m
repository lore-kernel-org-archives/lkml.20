Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823075;
	b=M2liM+zJAEdOEBDI32rFKdEKVasLCxR7IMrIkBiImeXuanRs4c637Rpj/HQyjiAQriKc
	 EDcosrq+3P7oZ2z1VnFWp++4WzoHASONbA8UXKFv4EUTcNqeQc1xBP1qfiWP0XJI2rxHB
	 R82sSF+kfgIGdli6D0jwp4STDMy7MpbQSDKAz3afY3tthDbEjXWoEccgGed2ONIv++KfU
	 0tPIhPClXtdezZIkq+MY1VdQauI+rDvFCzSbA0u8ycPSfu/v9EXea7aqR84W+bvBNdcTE
	 6X55qi3DiUCC7ZwRhwbPm/F1i5tFdyGVc2Jj7xge0gwRM8kmh8QHMnJ/pQFOGFP9byQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823075;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=0vo7w6mZWkmXhGJxEnhLOttHOFqfj14Gy4DBnKHimI3Zgv+6PdcOSLTPI/AZ63tsZaK9
	 p/vYPbxAsAaKw+YWFMFmiY4CgGSwVtCUB/4ZD2uaAno+aaosq/MqWyx1VakppnCKo/1rw
	 6fNJ4wX8mTN4NaONDiOs2SYVRe8mzH55tLZHJQUmnu7Eu3OWYqbMat96H4v/2ky0C3pkZ
	 jCuNGHt1PfGZUpc+AEUiXIjak9QfdDGo5iXwaWeXWBtW2j8QYTGUgZDpwgMG8HAmAwDBl
	 2lQMx+2IbxkzRrPCt9zbk6q1x08WFNjaMWJEKbCFkt2DQW4QXHI7kTURqzpcc3TTphA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dtrr7gO0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1B606A323;
	Mon, 16 Nov 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dtrr7gO0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124181F000C4;
	Mon, 16 Nov 2026 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823075;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dtrr7gO0sedVdRES1cOcZqUPJJmPoNWt5retd61kAK/f3VXeb2DjCr0v3U+5xnFPU
	 B7cAYcAPMcRX13oAF3QKLb2FrocpE6zR5oooLe9VLZOYEPZyYTBrLJ3NVH4K3ex98w
	 PwrQsj2rc0Jl7Jl8gKx2W4USKQPLDcMXS6vWs3L1Ikv4NQ2ht1f+C01kmJrBzLtmNq
	 ewE0n4+aH5CpN7wXOwYFVSAfGouJzzDPeOCTlBRP1eja1jCL/WA9ieLkRtvUpZOEPR
	 ztjDCMc6jkfb77iTDRaZsR6Usb3dGF5u6goilC7G/RvBro4dl1BGFZgph0NkKOUpTF
	 n3v9SYrJFredA==
From: netdev-bot+sinfo@kernel.org
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 tomm.merciai@gmail.com, dinghui@lixiang.com, dinghui1111@163.com
Subject: Re: [PATCH net] net: stmmac: stop Tx NAPI before disabling the queues
Date: Mon, 16 Nov 2026 09:57:53 +0000
Message-ID: <179482307356.3291.12672863901613657171@kernel.org>
In-Reply-To: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
References: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
