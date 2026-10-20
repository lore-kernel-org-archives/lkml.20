Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489022;
	b=QgtEHqEIPG/jpYR91kksaXYgS0vmiiSSyolAPvu5LYqmAfhI40rwVXXz/3jmwajlVvbs
	 1nr2g+XdP6VldubcMFgY4+3iW0cwtF1t38r2Rnrd6gaQecBCKK7FflylF3fqLnGO9PUx+
	 XjUw6C10RTAU0z5pwO/apRAK4Q6ggplnTZoulhxTBJ0GLrFMPL8+8P/RsdUif8vdjyppF
	 0HZ1wdgEblveeP/ft4pT2MKQqZzejgOYuyA9G3YdGSAmZ7LNPca18C1J9HKuY0SuHu7ZS
	 KBkWSV4Sa2OU/yvrROMX6gXuqD/s5RxdnWjpttgQkVjNLKwFzSFwfQGJ7AILCklNEMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489022;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5lpsvBHvAxlpc1hwk1xYx6qm1Ra+T5Mj3gqvkbfy5tc=;
	b=WUHumGDtlZAxJioGUF01ZZJ6e1Mld1pxRxmcl+W8reA0MMRFsy7gBVhE947fqUu7fnoK
	 8E76OatIO62ui9oOoCOhxbSra7RF/DVtn3Cv3vaXVYAw0Ak2lgPw44zl913Xvh83UdNV2
	 EGXd62gNn4U7u76tbWy1fUP7TaPHRXdgVSeDJcafnXvoa2cuqDznKiO6mhoIpTysE9EIN
	 7JiKqEsIGbjGVr3TlxqjRIVUYKxCq9m4jOUb/L2e64eghCpgCsuqsodINLBHvr0v6sLCL
	 wrdRhk1/+y6RnyUqzF0bkyalCXq+U+cv4vhXqD5cfrKtHXg2QbcZjJ+8IdQ+Xv4LIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L3LrkfZY;
	arc=none smtp.remote-ip=91.218.175.185
Received: from mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E785606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E785606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L3LrkfZY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YIEvM8sHgjMXvgUVAE5uSY5439/NF7a2ha/iAy9npzU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792489019; v=1; x=1793093819;
 b=L3LrkfZYl0gjR3Vo12WVSvF7RcDabj6ykozs1ep9Cl2E7fudrl/9zjW0ynytHSug1SGDaJ2m
 fKUJkVQ6vdDsT/v6dM4r9ENYhCb9wTM/CtoFw/A1S/rMa5z/RbgHE4C2USf6A7b2orO2VRuqQz8
 YwngvetnNnlVbKg7Le+up8hk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26a47b0b7a78b92f;
	Tue, 20 Oct 2026 09:36:59 +0000
X-Mizu-Trace-ID: 26a47b0b7a78b92f
X-Migadu-Flow: FLOW_OUT
Message-ID: <c23a3d37-fd61-4f7f-8bb5-64792ac7152a@linux.dev>
Date: Tue, 20 Oct 2026 17:36:52 +0800
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
Subject: Re: [PATCH net] pppoe: delete session hash entries by pointer match
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kees Cook <kees@kernel.org>, Simon Horman <horms@kernel.org>,
 Asim Viladi Oglu Manizada <manizada@pm.me>,
 Eric Woudstra <ericwouds@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020092118.47416-1-qingfang.deng@linux.dev>
 <179248826539.3290.615848934021449047@kernel.org>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <179248826539.3290.615848934021449047@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/10/20 17:24, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

This was found by LLM when generating selftests.

>
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.

It was triggered by a duplicate connection attempt in a generated 
selftest, breaking the existing connection.

