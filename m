Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720103;
	b=J4TmPOAZ4dvk5WuCRWssT3xWGoU/6ziUP/Wc+5HkaoniIKxtoP9aFuIzzMasEyKBNgxK
	 gieMB9Ik8A7g011tiw7eCskkUsBC1pNS26jDpHkLGc2ZQIHJXXnFBrkEMMwzgO8FULXPf
	 jgwOMDkPWpNk1Ubsv7mXNyk5NwfnwBlwDLzBiXVWZcsCwyPC3o5u9iZaU1OtiKBvmWXtx
	 np3u4QBxzl5hRHMutgXWvKyYWswy2rUuBe6okYF/I3vr6WwZH6EkDv/GT9D8raFPcJrKf
	 FdoVgVz2lhFG3b3Pw0mb621lBHunWMgrO0XyDktnVW79ACtlcn4nVs8eSq7p9PpxGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720103;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TY0hZsWLPRTQMxeVW6Na0ctagqhgwKOHthul7CCfGVg=;
	b=wIuA6NivOVAa0ivTQN/rorEkeoaKjJ3TqTAngkVLven7+s2gBPsOJs+dNpnZFvHRMH19
	 MGBoXA+yG0wkHIZ3/y8HJSaFdaLllTe1zGwKNH4HImc1qNQWHC4qIHaV3vojsrCbHSl8i
	 diERpT375uuz6kIL25jKXvZ8dCLMqQA36xhIZrRMT4V2I8wdoggCC/IuCL6udGzKabC98
	 g+c7zxaN2P5kjvxStxUqI4tJMyfktRP7UVtTbQgBNkr4n1ojwcd2bh5kOFWEsn6VfUFl6
	 r59CYR/P53Llr8Ds0+7J1bgKHUNhS2d9gUBnpBfDM1bysNlO+QjrXdHJt72w23aaECQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jV9aTeQa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB15606D813
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jV9aTeQa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19831F000C1;
	Tue,  3 Nov 2026 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720103;
	bh=TY0hZsWLPRTQMxeVW6Na0ctagqhgwKOHthul7CCfGVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jV9aTeQa3hlEbAZwz9/KVdhWMd3daljzrTB522wl/MzTlrtXvYYSSiVXm7dXb8Qe5
	 DJ4UcpYG6RqoDU8TxjVdlQ+fztueQnJcmCyDmpCfb+Pk0oNXq3pd83H64kkbg65gvD
	 g7QFuHSr3SQqlkw/sTMmH5qFqtvMZaFEhLwKhIrxReqxGZW/Oqp/w6TdqGDWXrovS6
	 peHmZC12V5BcYH1aYEYO9zXzCQNP0a4awdkhRQK16/pR9qT5kD9BBQVeSuYyLYrFoh
	 0fvEX55wK4mqlCNzL8WtvUX/Bxq4AO92HV1U2X74dmyU5v6eirZI/ciLA/LK/XYkgf
	 csMmLf6dkQr6g==
Date: Tue, 3 Nov 2026 08:35:01 -0700
From: Keith Busch <kbusch@kernel.org>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: reject keep-alive timeouts that would overflow
Message-ID: <aun_JSS0cwnL9tm0@kbusch-mbp>
References: <tencent_E7828EAC883D49896E2EDD4FCCFE653E9909@qq.com>
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
In-Reply-To: <tencent_E7828EAC883D49896E2EDD4FCCFE653E9909@qq.com>

On Fri, Oct 30, 2026 at 04:46:22PM +0800, Yingjie Wang wrote:
> nvmet_set_feat_kato() and nvmet_alloc_ctrl() convert the 32-bit
> millisecond KATO from the host to seconds with DIV_ROUND_UP(kato, 1000).
> The addition in DIV_ROUND_UP() is done in 32 bits, so any KATO above
> 4294966296 ms wraps around and rounds to 0 seconds. A Set Features
> command with KATO 0xffffffff then succeeds but disables the keep-alive
> timer: Get Features returns 0 and Keep Alive fails with Keep Alive
> Timeout Invalid. A Connect command with such a KATO creates a controller
> without a keep-alive timer.
> 
> The converted value has more consumers that can overflow. Get Features
> multiplies it by 1000, and the timer paths multiply it by HZ in 32 bits
> and arm a delay that must not exceed MAX_JIFFY_OFFSET.
> 
> Reject a KATO whose rounded value does not fit all of these. Return Keep
> Alive Timeout Invalid from both Set Features and Connect. Validate Set
> Features before stopping the current timer so a failed update leaves its
> timeout unchanged. Round in 64 bits. A KATO of 0 keeps its current
> meaning.

Thanks, applied to nvme-7.4.
