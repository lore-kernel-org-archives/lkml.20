Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738281;
	b=J7mqGgfXa0BbkDBs3FH4JV71pVf0+cMQi7aU1m//AN/7CP/OQ+a2kaeQc+taG90zvOkR
	 wJ+A7h2edendDS/Lcj6sVVo2cCN5riohIcvjvCBwwtd8x85lbI8uj1907lVv9Ng4NDICt
	 YhFSk1w/QHTPwvJfxVH031HAvhHiB1nvvSqJ1YII8Or8vsJeIe5iaDWvoeQ0MDPWMAIH5
	 Sm5TwdQn+l6rjhL+Gb6zAyyPn8QsUqZAJGmzz4k9g0dUXPpI9SAD/3e3xf31W8/umy6lc
	 H/ER6naUckdWbVQYP7Fa3NIILmpRS/2iq7xOcKCNjNGjhDL8JdMbhFpf9aXvXudHdtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=leqd8bjysq3sI8BCFfOQAO3C7CjcpPnNC+o0cVOOILs=;
	b=T6GHvHqIOmnf21kPjTyh09L4xlwQ0UOQq6nJBB0ESEOz17/xrDy/8DLVxCYjD2fnbp22
	 chASc6TXwJSrEUxVEP+9Wte1WLzC8Zypmiplhb5Je/nNGjiiJEfPcuFgOvppi/m2ahMj/
	 Yz515W5G+xGUJ2r6fwTiNBVGU7druPu/xsSiYOfFL2H6V4px1QTHls9UiOm4nNPUst64f
	 jhnfgvX5wMzrv5rdUAYzxSR1Rtq3JQ/ikmi/KWWQ3RV1OhK8Gdyje12w5jVDUfXWhoxJ6
	 l1AwfyGrF2IJvLc60fdVnVm1+JapcFmH6/tFooHfSdGZcY1G3EwKyeUqEsqnUU+t/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=SdUWW3kl;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216E4606EEB5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216E4606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=SdUWW3kl
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jK0kq0Ycbz1XM30j;
	Tue,  3 Nov 2026 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793738272; x=1796330273; bh=leqd8bjysq3sI8BCFfOQAO3C
	7CjcpPnNC+o0cVOOILs=; b=SdUWW3klr97TfUzXyr2nLuC+zyxG/7bYujCYQosH
	qcaMgyEZBr5fjiztNVYlsyM+GYasvo4mNUtaPJe8SkKx+MVul9yRNDvqWNv40+Eh
	EESxJCpBPFgP9UExTkwLetXDhRNJaHW8cHuWawh0ZcNK6kurAEgWpujQ7GevYpM1
	xT1Csr7lCGRZcvbjvzn5U3R+wiPL+Rc8yyyaxxHlTiRO9vohBKotLvoWZv6/5sHM
	PeidHtXoMvZNaRjMhnIeg/qzq6MgFKxRY1xPznSurhg8gYSaB7numJEY8SITp/hb
	7S5lJrbtVl6uQDCdRICjxBV4WluE0wn+L/9dyaki1EmqLA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9xFdNjr8AU6W; Tue,  3 Nov 2026 20:37:52 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jK0km00NRz1XM30h;
	Tue,  3 Nov 2026 20:37:51 +0000 (UTC)
Message-ID: <c587609c-58fa-49af-b5d1-dbfd98c60ff7@acm.org>
Date: Tue, 3 Nov 2026 12:37:51 -0800
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
Subject: Re: [PATCH 07/14] nvme-fabrics: Annotate nvmf_lookup_transport() with
 __must_hold_shared()
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Sagi Grimberg <sagi@grimberg.me>, Nathan Chancellor <nathan@kernel.org>
References: <cover.1793654853.git.bvanassche@acm.org>
 <f7be25530c5ddb30da2f13638a35e2daa8002c0c.1793654853.git.bvanassche@acm.org>
 <20261103075116.GA3844@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261103075116.GA3844@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:51 PM, Christoph Hellwig wrote:
> I'm only seeing this one of 14 patches, so I have no idea what to do
> with it.

Hi Christoph,

If I have to repost this patch series I will Cc you on the entire
series. The cover letter and the rest of this patch series are
available here:
https://lore.kernel.org/lkml/cover.1793654853.git.bvanassche@acm.org/

As explained in the cover letter, the purpose of this patch series is
to prevent that lockdep_assert_held() suppresses the need to annotate
the functions in which it occurs with __must_hold().

Thanks,

Bart.



