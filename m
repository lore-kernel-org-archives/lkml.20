Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.75.2.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832952;
	b=NVS+OyABtygeGLXP45q3JQDAOzJ3Mxkrv0a6732y1esVrOqKv5SEjJNSHsgTFVoXRdXh
	 XBPlVLruXnFhHaYZi9x8c4yvo9+UyJGegzAvVmYHt9eZqZqt+XIRcq70sHPSms8kPG7b5
	 Bk7meJ1337FXKp2Ac7eOoS7Hh/8Fx3pg5DaQFYOhZOYw0NWrWb43f3vOzwbmx8JTqMYdf
	 DBwX9Pvwuj+Z1dEi9LtpnDuRSi0gjbXpZ5URNmUeyr8HfoOC6vXEPTqruh/3lX5NDTg83
	 yX0ToFak42+039q6PPybzhip1BeTYe3f++bg7yRG3EvM/VUI899K418TuIxwIU0Aekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832952;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=j+ABvJucI9g8SQSbxlnYz1HQytM8W2COF+BErbolbn4=;
	b=H5cd/YlA7TgBbyIRAAyOwjdsu+nKAgHpjWZh7ByUHUq2COXeSxD4NZV0xx4M4TsHL0IT
	 IA+pNyhbJ549WQ7Q4KR2mc1abaD9nH/6PkW3vkzhqbRnT+ejWsFpw3RHKplU4MvtVrWeh
	 rgJfEx/Auk06MWpYhQao7JCPiJ0+B/Yu4euAAseiFzn177Tqt+DG7bngFIia6i2Aj5ckO
	 ejPjHiM9FOeI3tYwYoNpdsXLOw+7hw9hwmVZJmHFqmnnURWKUF74zmQCqqVczsAWXb7hl
	 UJ7U3fJfQd6bXV9Z9YNjYxCjliil1gYO4e3q6An5UfB17PBa5dU4Gk2L+9B5Bkj/UnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ikt.uni-hannover.de;
	spf=pass smtp.mailfrom=ikt.uni-hannover.de;
	dkim=pass header.d=uni-hannover.de header.i=@uni-hannover.de header.a=rsa-sha256 header.s=2024all header.b=NoM1+x8B;
	arc=none smtp.remote-ip=130.75.2.113
Received: from mailout2n.rrzn.uni-hannover.de (mailout2n.rrzn.uni-hannover.de [130.75.2.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B9606A31C;
	Mon, 16 Nov 2026 12:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ikt.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ikt.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uni-hannover.de header.i=@uni-hannover.de header.a=rsa-sha256 header.s=2024all header.b=NoM1+x8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-hannover.de;
	s=2024all; t=1794832943;
	bh=dTnYRjti854yMK6gCj3tqfFLwTch3rQzYpsKYB8gilY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NoM1+x8BR6dB1WhnbGq4u6pAqKIG1a8iUlXU7AZnx0qvfzmdsr7oAOG6iTMI8+G8U
	 mcMLVMt+wE2QpxpI1AinQYtFWKeJ9w+Q8cwFklMKxh5G8lhedtzu1YDkq/wOyEyEkV
	 cmJDOssy8pWIXvgSfdHYa0lwbvS/8rQW9bMak/Xrq3OzlK9QGrQoscq2SDNwQS8Gnm
	 z57BdVR4KbuiI0sidwgHccqDHxIZT9Sgty00/3I8UbqMO9ZpU2JN8OprLhrXd7rhLN
	 Am1O4OsCK6Lmi0TARAGcvkfq0rpJ4n6rnewVYbcz2A4EytSEQt+rTDE69Y360J+I+c
	 J/BT0LJuuvI+g==
Received: from [172.23.181.54] (gateway.ikt.uni-hannover.de [130.75.73.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mailout2n.rrzn.uni-hannover.de (Postfix) with ESMTPSA id 0CC6220085;
	Mon, 16 Nov 2026 13:42:23 +0100 (CET)
Message-ID: <87ce806b-a0b8-4f57-8c0e-c93d00437cc5@ikt.uni-hannover.de>
Date: Mon, 16 Nov 2026 13:42:22 +0100
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
Subject: Re: Re: [PATCH net] tcp: roccet: do not restart from idle on RTO
 retransmission
To: Eric Dumazet <edumazet@kernel.org>, Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Simon Horman <horms@kernel.org>, Tim Fuechsel <t.fuechsel@gmx.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261114141315.19007-1-zhiqizhangg@gmail.com>
 <CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com>
Content-Language: de-DE
From: Lukas Prause <lukas.prause@ikt.uni-hannover.de>
In-Reply-To: <CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 1.4.6 at mailout2n
X-Virus-Status: Clean


> Unrelated to this patch, a question for ROCCET authors:
> 
> On a repeated RTO, tcp_enter_loss() sets cwnd to 1, then
> roccet_state(TCP_CA_Loss) sets it back to TCP_INIT_CWND.
> This means a burst of 10 packets after each timeout, including
> the backed-off ones.
> 
> This is a more serious issue IMO.
> 
> Thanks.
> 
>>                 tp->snd_ssthresh = tcp_snd_cwnd(tp);
>>                 tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
Thanks for pointing this out.
We will investigate this issue and provide a patch for ROCCET soon.

