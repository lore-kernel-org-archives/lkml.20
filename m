Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605266;
	b=T9iVGmLQQqK7EVsVkE2QGYsSbu2Q39XS0grk2Q2CGq45dIbzIg6MVqwluH50ltghBSqC
	 Wz00sDEY/zQYTGOKhl9wx1kRxJAyGCk6fAtGhAW+6Do/nh9PrUX0pSXXCFPLNE0jz0OPY
	 amc940Skw6OJ8f6ud/rYZU802HuMvdP+jlkBXHtye+cEbEb06A+Pr9v4F7LhLGAZZUInI
	 wfqAgnPjkcQJMe8d8CqCst6W+MRqXvdMKxfvvSa2uxVZWgNyBhUOTHPDk3sVtDtQKulrA
	 scH9QuHuBPzzUylBSRwgTiexeOK4YtPJ2FLuEX7GtJUnYv1czuFzDmUEp4trHrQU2kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605266;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OfgCQoL8h0OQGIBTyFTsKwgv2S5WkrlkH70wsc4VUwU=;
	b=bZSl20XMlfl8cKPUjZSciBoRaoyHac4EuSTJpHzs7vW4tVdLXjVc6ivKCNTBqJrw8pL4
	 jzQkp+gD2P/gnCImx3X+HDDkPU/Kk1/EClBNErTkTkrKmnqCXNcLeRvT0QuaSAqmQuaB2
	 CMDN351SQN8JPrKoM8s4JZIsuRWhRtobcNCroTezcz4au3LxL9KtIAQw9GGMPCPOFxuNZ
	 DHaKKnJKhsPMtU67FeAJc6jcWCrtgMs60sn0OFqVYlcokXF5KOJsZtkmjRVSjKwQyWT3N
	 +s0lG7nApp+1HiI+15c+k97n4R1DLniDtEc8lqkHWfOqpv2ba8CYDOqqafO1dNQf17A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qAaai3dX;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFF60A2614
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBFF60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qAaai3dX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DZgmR+w0hXnF42goaWJ6bzq/W2wIthHLUmetG/gcZXQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793605263; v=1; x=1794210063;
 b=qAaai3dXugNnqaMvqljDfgxrhRbkO6zBMQKdUyeMI+BjMtNlDl6iZwO2qWGjq3U3+neTyY64
 7QN6YcjyoCXCr0LRSrSRWW5ps5Y/B83buL4GUvOfjLEq53CpvYUx5Zc6Ugl2dOFrhSsojAf9U7u
 EBqRJWAfCGWageqdx7owJBSk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef704eb15b54ecc3;
	Mon, 02 Nov 2026 07:41:03 +0000
X-Mizu-Trace-ID: ef704eb15b54ecc3
X-Migadu-Flow: FLOW_OUT
Message-ID: <d6ba5426-fbee-49da-b18b-1419fd84fa0f@linux.dev>
Date: Mon, 2 Nov 2026 15:40:56 +0800
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
Subject: Re: [PATCH net] tcp: initialize send sequence numbers before
 deferring TFO
To: Jiayuan Chen <jiayuan.chen@linux.dev>
References: <20261102035943.9700-1-qingfang.deng@linux.dev>
 <bfbc4b3c-fe19-4070-97b4-4ff8ded06011@linux.dev>
From: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, Wei Wang <weiwan@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <bfbc4b3c-fe19-4070-97b4-4ff8ded06011@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/11/2 14:11, Jiayuan Chen wrote:
> On 11/2/26 11:59 AM, Qingfang Deng wrote:
>> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connect_init()
>> when a cached cookie or cookieless Fast Open allows deferring the SYN.
>> At this point write_seq contains the initial sequence number, while
>> snd_una and snd_nxt have not been initialized to that sequence number.
>>
>> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
>> sequence number as the send queue length despite no SYN or payload being
>> queued.
>>
>> Initialize snd_una and snd_nxt to write_seq before marking the
>> connection as deferred. Both sequence-based queue lengths then remain
>> zero until the first write starts the connection and runs
>> tcp_connect_init().
>
> This patch looks good to me. But idiag_wqueue can still go negative
> on the normal connect path, since the socket is already hashed and
> diag does not take the socket lock. We always set write_seq first,
> then init snd_una later:
>
>    tcp_v4_connect
>      WRITE_ONCE(tp->write_seq, st.seq)
>      tcp_connect
>        tcp_connect_init
>          WRITE_ONCE(tp->snd_una, tp->write_seq)
>
> Can you try this instead?
>
>    r->idiag_wqueue = READ_ONCE(sk->sk_wmem_queued) ?
>                      READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;

This does not guarantee the load order on a weakly-ordered CPU. LLM 
suggests using this load-acquire/store-release sequence:

r->idiag_wqueue = smp_load_acquire(&sk->sk_wmem_queued) ? 
READ_ONCE(tp->write_seq) - READ_ONCE(tp->snd_una) : 0;

Then in tcp_connect_queue_skb(), replace sk_wmem_queued_add() 
with smp_store_release():

/* Paired with smp_load_acquire() in tcp_diag_get_info(). */
smp_store_release(&sk->sk_wmem_queued, sk->sk_wmem_queued + skb->truesize);

What do you think?

