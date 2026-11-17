Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883163;
	b=1ILfqwsOoFtjS6u9ncIGYf+k42aBVHHIXciYw+puubLOV8qlQVNpYGMSMCHe6h5Gww1z
	 LNqrujRgc75tdxh8SmmgllZva8gf3h0NNkocqqXhuKBqBzvFWNv1fdw4ecPgSPp8rXxvW
	 3+CAF4j9IngD1Ey92Zg5ZNzvvZNfLvPWGpuGavAJjE9wIY+TYpSssyPl8HojexyQh/Ith
	 1u9lO6rZwXMGdyWMm4XOQCO3CwDXzQN07Dn+FLKw65rfrvxO8LOPMR186LRqyQSr9xezj
	 TAaaHCy16AalgzDP7HqFGTOVabHhDXYprhALwvUy/2UAx1M2D6rZ2H1KFekSwSJMs6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883163;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8XYv1cpvvrmmfi8wFGVX41Eu2iBwCsdWTtiDpoQvKOc=;
	b=3jXXwW196iCTAh5OWt4X8bk6hb0JHX82IsyA5qGmgxyAhuQD25z7fD6jBwr5AHvFLd9g
	 6OjAhXhGIgSl1VDcCn/PuyTaBpiNOHx2cHzeC/75eH2qYZ902s4aTRzgHMnOLIk1RdWdF
	 +css42a9Bsy/2oZPuyzqNEKlSA919VOog11xYqDmZKvjUaDW1b2W6eRrsBc2JxYP0YY7N
	 3TKX0BQ08nrsLWpkDbmlJzX3HAZFVaEhxdZ6HU/v0k8AU5qkLMo9nNAm0Rpn/Sz3l4evR
	 byuOV2PZUgYQh8gkhK2BYgmxg8Ig03Ys0QnNVPkUXsoCmI5fMlbR3RFVt8KIlWvnDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSuSgw6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F1606A329;
	Tue, 17 Nov 2026 02:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSuSgw6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E9D1F000C4;
	Tue, 17 Nov 2026 02:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883163;
	bh=8XYv1cpvvrmmfi8wFGVX41Eu2iBwCsdWTtiDpoQvKOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WSuSgw6v/Fm9A7iMTMtCXAQPd3+xVpGD9yytWPCaKDQtdStgDOc5IBBTgs+7T2vBY
	 1bYzMdOfQrCBKPhmVwsk6SBk65iMsmEW9yAXSXySdEcTQ3Hs9vZwSRun7NtlIWDJdi
	 B1I4unntAjEuDt3k7/CBUjQgAVEupr//CQhxccKv+4xsDXl//Xv0HXfzI3wfc/IDg2
	 x/nmXIKo6jr1kpx8PjK2d9w2OMg2ecFeGj07f+hvQ7B10t1YUuRJplf6t+8VX1Juvy
	 Acy7pD63u4rmkkoTpDiaDOA7d0SL/KRteEMnZkdY+MxY+gBt6YD2rfhuT7QnWlybjH
	 nnJoWjKo3I2kg==
Date: Mon, 16 Nov 2026 18:39:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: hangbin.liu@linux.dev, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, donald.hunter@gmail.com, wessel@jacobi.pw,
 rdunlap@infradead.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next] netlink: specs: rt-route: move fixed-header to
 operations list
Message-ID: <20261116183921.50286c0f@kernel.org>
In-Reply-To: <179460807877.2199510.9635428422960175112@kernel.org>
References: <20261112-ynl_fixed_header-v1-1-8475ea19e409@kylinos.cn>
	<179460807877.2199510.9635428422960175112@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Nov 2026 22:14:38 +0000 netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Should this be fixed in the doc generator rather than in the spec?

=F0=9F=91=8F=EF=B8=8F good AI. I was about to ask this...
