Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838928;
	b=IkKv7++NQGQTGzOr+y20bG/q2xOdekgVxVG+oEdqaOawRzYsr+qSIl5s5SHsplbl4vAR
	 +xOl49oUk32tLT/Q483FDxqhtlJC6yc4jgEXyCHeEnjH7w6oCNEm3Xo9ZIuIHEAHSZGQ2
	 mQSflijMiAS9swF/4Yn40+OGuwBTUVdYGbSI50T3qzPNSjSPjlCt9R5WngdjS6f3wB5II
	 lQPcbLchBy+55XY4L2Ngeu1OtMOrBI5O8IKY84JuLpOjIeK1LUqDoJZKzKjzUyc3BQ8q+
	 1pDstCTehKjtDLHlj8PNaxJjEnDKQK/h4+9pCBTYjZbVU/iCn3CYq202vTiP4oh6ujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838928;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=SC80J3c4wnGHkLHHCRRtyq4DJreOwPHVNmq3LFI/0SwKd+PB0u+5pf1PDy8t+mtWpA6v
	 4hIuM0yfEFTyXWZ3S5YMb3lFI4yg1WDt+Acl+9Wvo/uDrCFNnJfpdIJ7LlXuMyAqQ3hCT
	 zfOrTDnBiArF/YzgyNZGNMV9AHHD3nNVNCuY/7IDQ7Fi1GJO+sTtwecBH6FcLlVcLshrh
	 jiVqm+XsWl+61+f/N6BGzE/hMWQAX07Ekve8AkVyJwQrQXnlVuj7S5DOR9aPu3patA03V
	 JqRGu1WEmsloDQwkQaMF1Cxwe8A5POGTPs/Udsg3dLKUWTQ0qLdRfBgutiT5nVeO29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLv5HJcf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA11606A33F;
	Mon, 16 Nov 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLv5HJcf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D8C1F000C5;
	Mon, 16 Nov 2026 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838928;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QLv5HJcf+2cLXkOHP0X1odcRBpzWX2N8sYeQ1d7lBsfQSC/qHIbBUyPQ6WS1Nchmb
	 vNUlhnWzInmLZX7vcFKPMR9AYqs1ptyZSsRhDWDK5yYeeOmfVx8LkUyi9CJjuJMVaM
	 q3WQjmC6/orYJaq9tBTsUvWnLp4Tk1iQZqjPSUelVVVMuUNKv6EwkbnlEGpUCtMjgy
	 U6iXOCWdZcHHd6TAYVCvPqM4r3tY/mB+tvOrnAWkUmyGO+s6NV9mv/jlFb2PK0DePv
	 3v8zPSZnEp4iqvK5hdAa1SqaBAEoCED+GVzYQc+j7u7ZX3hMULx5yNKCJlGjvBrp/E
	 iYGGLJREa+waw==
From: netdev-bot+sinfo@kernel.org
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] igb: Fix potential I2C adapter leak on probe failure
Date: Mon, 16 Nov 2026 14:22:06 +0000
Message-ID: <179483892696.3291.3267390747514422182@kernel.org>
In-Reply-To: <20261116-c29ba55625-net-igb@mail.sdu.edu.cn>
References: <20261116-c29ba55625-net-igb@mail.sdu.edu.cn>
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
