Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838686;
	b=BhpyDhoMqFmjSs3R/YtftWjA87bYY2iCTCpZCYik1FSG8o+onHVJgw3DzpPvJcw8Ahsd
	 CI0u3MuCi2wdO9loXXi40zhBlAmPHK3imy31JUQqelVnDUrGcHUbjQeVInTLFVjaxpIlO
	 IMvUTSfNs9wE8in0s388dCTrAPNZpaDGOzb5E4iWBMzZvO6skZkFM5zXHnVyahTBrhkYj
	 Rr0yPH44eu7NaPOoO/aorAJBZMNbNB81cOhZKqlGHeZbxdI6jwSB2DJhLVun2i1vvPVZw
	 BSDt0q2kE3PE4eQ96P5UHES1OGYpRflvdRYB9nG1gfFiXerehOXKTIsqfPkbGtq4Dag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838686;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=eIcREdThgF9lOjIT0LLaIANx3elV6pjyEBaqXvafKPDEdplihGyVewS0lBqQM+HWwbNU
	 wGEKxQJcibblvwcYGLqS9Ih+XnzVeHu4IUgoeq09oqiWYDWjWeN6IP13o9LAbs1xdJ2SZ
	 1sl0qWXoq9Vm1cWCfusQtxQCZqrchbkyx8hHYZvh/+AepYELblknWNyMcdHEFeFMy7vFP
	 p5zNivxgTX071za7U5OpHfm81+n0AYQT5PfMKD1YYYSFVeyMS+cM4+nGRb4zEzddjSR+S
	 S1eOwaGR5gobElvEMhuvdtP4K1tV6U6uMhWxqK8rzhugHnyoK7MP1AiUSRHEFBa0TMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASsKfjSV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6B6606A33B;
	Mon, 16 Nov 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASsKfjSV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB881F000C4;
	Mon, 16 Nov 2026 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838686;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ASsKfjSVJmSncJyenuityQ11YD0cqniHcq7RTsY+FRqOP8m6gnNOzPbIXcF1vi1Xt
	 X2SroF0dBs/xnU8OoUi2HM2cDD0+N+P1Y+SiFhZKtT/ldLYVq64d4fxWfG9Pc/Yyyt
	 uX1zqP6GhBnCWoc2FMWwH8CUzuOVTNoFJKNjvMr2Bci8Z5Ywu/8Vz52znE9xton7PK
	 g3m1dohfcbXQGMqpCYApYMop1zqXy2w0iapJDtJ9G4074uO7JdvsBSaRaszK3UhULZ
	 Qo29VmHC83eVe27DC7E76Xvl2hDGa87VDcpfFRyE6qpjSzPpVwHin0LU7Dp5wLHhRe
	 wZmtnQjjXWVaQ==
From: netdev-bot+sinfo@kernel.org
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] octeontx2-pf: Fix potential use-after-free in
 representor teardown
Date: Mon, 16 Nov 2026 14:18:05 +0000
Message-ID: <179483868522.3291.8301144475477801109@kernel.org>
In-Reply-To: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
References: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
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
