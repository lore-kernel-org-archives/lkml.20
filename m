Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907669;
	b=cVJofxXgVCwKhXERgv2diwoJFtRMG6vs8ffPKyjWkAHIg8hL74pBoIa8Rr6mO5vdyzeq
	 jRTfz/wkJocvB80Ea3pywp4Befrkoj3dMOTlm0wZ6kNdRAO/vhbkDwytBnPOQjDo3Q1xo
	 q+JtCWHNVbIByWw22d45m8mE+lkzpr5XoMNtX0dIMAgpZglfRct+KO5e2YJ1p2+yqjHXb
	 f3kzpGlNEA8GZVs4sC5cF2nQ1TaXm7ryGIEUO5VncFGNPvVPaxUGM54lpwBC0IvfgfU30
	 F6UBpk5jqkTwXwveIpZ6OnlPoLg5KTUDIhb7AhsAIN/TulUH540tgAJJt3PsaQ1m4kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907669;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=k8aFo/yc9X3s5VqY6RTuO7yq8GbRLky2z87jlIghXEc=;
	b=oSGp7HAZoAvkQoDSdSXet7FzmX/1VSqbFg4sdzPvmQOSu86VxQ936tpfbjOiPfOJbt1j
	 hDH7IP3LcWXcrY6cb9kncFwE2joQpcDCXaCWVM/ZKJu2YrHxJTsxbJw8VIYtEX5BaIENi
	 MccNaS4Qs84nQ11IapKJQ4TS7GOB/K+UoMbEhbwGvomxJCpLkDupEpqM9Mp/J2n1aJiBn
	 RecdN53b9lU+NBaEeKizojJD4C6efblrbLnSioQ0lU0sxh1JhqpOaGNLgWWaAiKTLR20i
	 d36gBjoD158ly9468barEuRlA8ycOqOntWIX25bKw3qLCwTzxGWNZU7pi2P05hsZbXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djlAUTF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B4608521D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djlAUTF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5551F0089F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907668;
	bh=k8aFo/yc9X3s5VqY6RTuO7yq8GbRLky2z87jlIghXEc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=djlAUTF7JNVfWqPbi7UGL/iz0V6iaR+m5LMvSjirzsA3kHFle3u5MIIIp3M9tqQHd
	 ZZQ/0uHDBIGHUehZX/MOsX6FTZRAP6lYpFuhaV0k54JzKywAWQRGpHAAbrEei7C9wt
	 0GlRKmaYWK5IngSkFi4MOrBXEa/u5Pv+x3+GbSjNyFu+LxcHyEvt81+PO1s/MlSqTk
	 FnC1g6oGBrP7kGZhGovaKWj206BcUm3h0dgBxewf8xejEwWNU/A2e7bXicQbjPv6Cd
	 11X8INSHWG+UcrwKSDrmJFWz3nDArmLHsANmdaDBIT/QFPU4FsoMYsMDefDqMweezS
	 1vyFfzjd+b4rw==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id C2745198003A;
	Thu,  5 Nov 2026 14:41:06 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Thu, 05 Nov 2026 14:41:06 -0500
X-ME-Sender: <xms:0dvsauiOSvqS6xJsAIJICJwgSJKeaLBodR1M7rlvwK6__yYgrhHiNQ>
    <xme:0dvsap0ckldRBwcDyKWWIszsgOqEE1Z59vGLOK4vkXsVL8tOwJ5jwoBwW6MDC4QQ8
    ox9Db8U2mVARXR22COiGAyZuVMRh3WsdVcn3aKjFYkxYuoJp-EAREw6>
X-ME-Proxy-Cause: dmFkZTEmnsfCORAF6cRR0aUe4yXm1XEW7kEU4v6TFdngIx1yejLSVwmdqRlVejDj5uzb0X
    yBQw0Kk9bumL3iU/eqgS3QXz2yeiQXdBFep3nBOxgFlrl5+fQjZD4yTQkg/7g1no3VbaEw
    iyQ4HJL9Kz5x05g84AKZ2GfYgmh3pTOSqWmia1I8r1ibLDk0/r6xocQ583hmG4fUTTxh/Q
    LOhQBg9tSghEqI+M7tffRSPXXeAKREeCR4g7WeJfsHXOfoG7PGIouulsd4jHHKdKE/stAi
    8cmVOoNZiL4pbdCQ/FfbGJi/srS5GgU4qBQWZKDXHiMvc2dMvnXAptyypm2p7XtdDELzpc
    Fx1WZj15AuvVeqQI2ArB8oIfyiLS81fUPAnv7isin8jCT6VrdP8dRcCxd/DIZsHCRhXZwV
    1x1hNKPJ9oSfcLHQb9+ITRc+gdSSQAGKXCfAQYCZjk4BBRnujJXbTjNb4y96mibuVUz6o7
    f6uxbgqnAEAmuw/IEnMHaHkeDLapy2RJD9BixIJ0C3JZ5yctqbVbT51iHL17C33brSSxmW
    ld/56supj6XtUVNnUWVGBN9YhTi00iEeniHIcjIEhBhjNv3GjuWyj+RyWweeVDdWnOOVWE
    FpfyrfV4Bbr435VvPmGkrNS/Hz+pKbygdtPbk47YZlhX2n67k9Hnawd0/Tdw
X-ME-Proxy: <xmx:0tvsaiGEHwHfPz4sT5RZiU8CLp0hlgMsqAHKpBnEr-Jg3KEBM3bIAg>
    <xmx:0tvsaqWou5ovRjbWqkURPElQrCHcjvCEpn1l1-0ZoR2xfry8F__8SQ>
    <xmx:0tvsahIacXdGdTFrvPkOqMgzLCykaZzoUmb7yYcPQxprHsj1-a7v5Q>
    <xmx:0tvsaq9TTPboPIdjNRjrhwdPRb5N0nHyzUw-ILPpEbo3l84bwSaxcw>
    <xmx:0tvsakIRRAbtJtyinkv114BEaFbjUgT23hHJ_0q47wKa0d9rE-G1Qh94>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6A67C2F8005C; Thu,  5 Nov 2026 14:41:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AKtfczmvw_f7
Date: Thu, 05 Nov 2026 20:40:11 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <9c223475-8d9d-40ac-851f-c2d3eb210842@app.fastmail.com>
In-Reply-To: <auykJBSzKheGmuwv@alpha.franken.de>
References: <20261021192418.7246-1-kaloz@kernel.org>
 <20261021192418.7246-5-kaloz@kernel.org> <auykJBSzKheGmuwv@alpha.franken.de>
Subject: Re: [PATCH 4/4] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 16:43, Thomas Bogendoerfer wrote:
> On Wed, Oct 21, 2026 at 09:24:18PM +0200, Imre Kaloz wrote:
>> On CRIME 1.1, a MACE or PCI read within about 2us of a read of some PCI
>> registers (aic7880 HCNTRL, INTSTAT, ERROR) can return that read's data.
>
> this reads strange, can you clarify what is happening ?

When the CPU reads one of those aic7880 registers and issues another
uncached load right after it, the second load sometimes returns the
first one's data instead of its own: readb() of HCNTRL returns 0x02,
and the readb() that follows returns 0x02 as well. The second read
does not have to go to the same chip; the other aic7880 and MACE's
MAC_CTRL get the stale data too.

It only shows up with audio and SCSI DMA running, a few hundred times
in 25 million read pairs. A gap of 2us between the two loads cures it,
masking interrupts alone does not. CRIME 1.4 does not do it, and IRIX
also delays around each PCI PIO read on CRIME 1.1.

I'll reword that paragraph in a v2.


Thanks,
Imre
