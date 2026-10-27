Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105146;
	b=glAI9mr6aUMjmKDJ3TB9ndWrkAAg7U0bOYhW9VqtuL4srkqCDroz+CSPq98x1XBiKSGZ
	 VOcqCeuACWXeIlTVIPwumAqFbUoLdZYRiLkwnKYzBE+5Je4Sn9L9R4G/L7b3Ib6BNHYNv
	 x1PFu374e7GtLgs8QgBveYVYBueeYZlckpBSMJJO2yaE/TLHoASP6LSqhgO0hQI1M7sxf
	 keBX3JGC52QwY84Rai3SqB92bK5n+dg2APOaNTb/cHo38O8O84y22AgyCy/yyptWbq3qo
	 hu/Up4GpnMvTxer9/tLTQvEdrgeN0CIrOYz159FQZFs6Ff6CeDv22Ptw05WvccUmepQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105146;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=koFtvkLfr2oI9uXtX/n3Ay3Dy+ycp8hbA1U6raVcKYE=;
	b=JIDfY44BnIkDiTFiQT/25YctRvKS3o8OUJeE/EsrKT9e1+46daVWlStGp3T7xQBw+geA
	 KsR5Ik1b4NdfUTLPI4PqfPBTeycGtweBvQ4yJiYeBtvtvHcqexbYs1jH1fOZY8ZOwhYrY
	 bI2HO+KPKQdMsKQVMQsv0/9ZMebaaNPH8QYWKAg9W1TDbswHj5w7jPHiuMqUfMTj2HtBb
	 I4K3JkAk1e27hCeHfXWsbBVkepfSJJKZeTGzba9ny9232ehvodmbT5pCxqRfQ1Z01dN2c
	 0kkSjZ9zNHyMmsTKNmjvUWccehMg38Yjp20w97AerKGW1N67PzzTWtBnjJzHQbpmXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5B1imMU;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7329606A330
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7329606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5B1imMU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7hyLZnCptglh6ZfX27cwvtA9DMVa5PLCr9Si8AAJnHA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793105144; v=1; x=1793709944;
 b=o5B1imMUAsXMIe68c9yZ8nUysrg9IA3E5gU6Jo69SRBPFqKt990Xab1s4cfAE2x9M7THBwwA
 3+KbCVOHBt2XqQu4lrWHGQzoKEqn1BBqv8Aob+fNaFgruL63suAcGmi5Ee11M9EUXcFkeTN66Sd
 ikXmkP6AWUjk+DkrHmtBniH4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c7f68ba690e126ba;
	Tue, 27 Oct 2026 12:45:23 +0000
X-Mizu-Trace-ID: c7f68ba690e126ba
X-Migadu-Flow: FLOW_OUT
Message-ID: <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
Date: Tue, 27 Oct 2026 20:45:14 +0800
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
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
To: echoowall@gmail.com, netdev@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 3:23 PM, Esko Mobius via B4 Relay wrote:
> From: Esko Mobius <echoowall@gmail.com>
>
> This reverts commit 2640e6419594 ("net: advertise TCP MSS from the
> configured MTU, not the learned PMTU").
>
> That commit stopped the learned PMTU from lowering the MSS we advertise
> in SYN and SYN-ACK. For symmetric paths it argued that "the peer runs
> its own PMTU discovery and usually already knows the real path MTU".
> That only holds if ICMP "fragmentation needed" can reach the peer. When
> the peer sits behind a firewall that drops inbound ICMP, its PMTU
> discovery is a black hole (RFC 2923, section 2.1), and the smaller MSS
> we advertised was the only thing keeping its full-size segments off the
> narrow hop.


A client that cannot receive ICMP is broken beyond this: QUIC's DPLPMTUD
hits the same black hole, and nothing the server advertises can help it.


>
> Inbound ICMP filtering is very common in enterprise and carrier
> networks, and it is pervasive in mainland China. We hit this in
> production after the commit was backported to 6.12.111: TCP connections
> that reach a server through a relay with a smaller-MTU hop complete the
> handshake, then stall as soon as the client sends full-size segments.



The learned PMTU is keyed per destination address. If your relay
masquerades the clients, the server sees a single address, and one
client's download seeds the entry for everyone behind it. That is why
this looked reliable. Once the clients are spread over their own
addresses, each one needs its own fresh entry and it falls apart. The
old behaviour was never a mechanism for this.


> Clients on networks that let ICMP through, and connections that bypass
> the relay, are unaffected, which made it hard to trace back to the
> kernel.
>
> Reproducer, network namespaces on a single host:
>
>    cli --(1500)-- r1 --(1456)-- r2 --(1500)-- srv
>
> r1 drops ICMP frag-needed towards cli. srv has already learned PMTU
> 1456 towards cli, then cli uploads 1 MB to srv:


This precondition does all the work. The server only learns the PMTU
when it sends a full-size segment itself. If it only sends ACKs or small
replies it never learns it, the SYN-ACK MSS is 1460 on 6.12.107 as well,
and the upload stalls the same way. The entry also expires after 10
minutes (ip_rt_mtu_expires), so the server must have received a
frag-needed within the last 10 minutes before each new connection.

Please re-run the 6.12.107 case without seeding the PMTU.


>
>    kernel                     SYN-ACK MSS   1 MB upload
>    6.12.107                   1416          OK
>    6.12.111                   1460          stalls, times out
>    7.3-rc7                    1460          stalls, times out
>    7.3-rc7 + this revert      1416          OK
>
> The asymmetric case the commit was written for does not need a new
> default: the advertised MSS can already be set per route with the
> advmss metric, which takes precedence over default_advmss(). With this
> revert applied, on an asymmetric path where srv learned PMTU 1456
> towards cli while cli->srv is 1500 end to end:
>
>    srv route to cli           SYN-ACK MSS   largest cli->srv segment
>    default                    1416          1404
>    advmss 1460                1460          1448
>
> So DSR-style setups can opt in with "ip route ... advmss <mss>", while
> hosts whose peers cannot complete PMTU discovery keep working by
> default.
>
> Fixes: 2640e6419594 ("net: advertise TCP MSS from the configured MTU, not the learned PMTU")
> Reported-by: Esko Mobius <echoowall@gmail.com>
> Closes: https://lore.kernel.org/regressions/4F0FAEB6-A13B-47F3-BFF1-C706686C6F64@gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Esko Mobius <echoowall@gmail.com>




Maybe a better way out than a plain revert:

Revert in stable, and in net-next add a sysctl, something like 
net.ipv4.tcp_advmss_use_pmtu,
that decides whether an endpoint uses the PMTU it learned on its send
side for the MSS it advertises (even though these are two opposite
directions). Default on keeps your setup working, DSR-style setups turn
it off


