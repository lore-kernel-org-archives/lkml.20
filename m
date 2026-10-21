Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552062;
	b=qCIjfhaTuv5uDPzxPgeBfZYHfeMCy+5r8Nl7D3NkFagcw3PWmCPB+vQp6A5uXU88ILPG
	 MRyInePI4tG59BuNealytoEUY3oRMw7njP9Cd3wmYjCT20ONcE8YwZF6w0VvxhbnSzUhs
	 YSBUY7vFl5oAuTlzMtGMLApbc7e50vu/5g0vHQG9+2blKQ1avOIJpBo8cMJbtJlI91tHf
	 GqENNzSqk4gZsO5L5ytYsm4cx45q7DNytbkVp53vQKJbxWNS1l3YoArOIuCyXOpCarTBO
	 ZPXb01ZZGrNwEcd8lFd8yQLPMXz85uoWGc/R4rNseN6N9IAixiKh6LX14hiJUpkUGpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552062;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LXGO/Ihk9N7F64gTwFfu4H1jjMd/4KNmHzrx69idA3c=;
	b=CRYO6wEAdnzWYmQ7pGDNP7nNOtNsxh6am2tagaBtvxbld+zVAr/poNFYV7wSKYHZQ8MN
	 5AFtJc+t5TzY4mkbG0xlutetGcZ3zxmxNJh+32e3IwXNA60irhFKfexqtawgteYgdJ2dq
	 tmh69vMfCCW2rsfe83cJwSowQPqfy4WtHlRQOHrTyiO9w2c7io+ycNWij7UrWssc//ZUB
	 sBt+NIf7ibGqy00TLyAhk021PWBSb3OlYGf2KJxPKKqIl00WzmdTq6e56lNUVRpxMOYJE
	 f1dI2uaQPPQDfOmgfULIalzWgzZAPmIfwjsIVRDDZW0oMug18a4lk5fj7sZG1uSOb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8yYgPPo;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DD606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8yYgPPo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/uplozhpt4dcAKvCO16vQWyHQ5FbixVEQFL8xKVM96I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792552054; v=1; x=1793156854;
 b=M8yYgPPoV4q7547aFDcoivPGdL1St8RTKNnolZ0Hene2Htbbwwjd1qDW7l0viyLmAJiFgLp0
 B5rhbkXporg8LeRtmzNXGaTAoM88ogE9KduOGiZNbuRm+t59Y81kmap3BT+J65CfY8humsmfr+b
 HkHdD57pIHvF5ZiJRTpwN3eM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eed8bf568db21181;
	Wed, 21 Oct 2026 03:07:34 +0000
X-Mizu-Trace-ID: eed8bf568db21181
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
Date: Wed, 21 Oct 2026 11:07:27 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>,
 Taegu Ha <hataegu0826@gmail.com>, Tom Parkin <tparkin@katalix.com>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Chapman <jchapman@katalix.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <179255036282.3290.8488375760281728576@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/10/21 10:39, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.

This is reproduced in a VM, with a TAP interface bridged to a PTY. When 
IFF_NAPI_FRAGS is set, a non-linear skb is passed to PPPoE and then to 
ppp_async_send() without linearization. The packet sent to the PTY then 
contains garbage data.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
