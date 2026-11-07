Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018265;
	b=i95zgtl2bfc8T4HPd1ceZEm63qQobt4T+22zjSjeiaAsod/IC5Bg+fZ5P/1xo0696yEz
	 gAarMWB2Zxwb0BC5t2wn84G4A/hLQw21EHJqw0qRzeyvWEiMmDd9j9dwsZQMYY027LBza
	 0VRIljVeHhciWmFNTOJPT+gEttKNLIwsisJAl71cFTHb5GuCPPQtEGkvaICdKBKYJM+t7
	 sHWvaI7naSvW08NtRaH002GHYwiYFCRr6SxtRcjIQoJK+tyNTQfAmwYq7uAYXfUuZ6pvw
	 KR/qhBP2X4jhDCL13u96DkTH7X3LVFlp/FWMxFaaTgqs/3R3vxdq3kxTbTcR6CUbPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018265;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FNiNBtPDzzetWijssUKEwr2+c/XYMNjUeXXOB4NdeCk=;
	b=WMG4ea6waOBzMn9ZbKwtEI3ZVUtN/3ry6J4cgIiCECR636da9MmQX9Klaoyxnir/4z7l
	 pkVYDKSlK45tb0XBKSev575o4Ncg3CqNpTpbGkq6jH4mZk592SfVftr9L9BsKUDaJ84k3
	 J6gPF9lPiQmV58z4E3HxtC/94cjYY9ptr15GjzNPseZUslzR20ics7I9FqjuNPv7sI3UB
	 FLdcizL3ZLwbi4bMCu+sBhsk/bvOFZMkBFb+n/31VA1xGxyThTiVvf1HqWR9z+ILB1pQx
	 bS/sls9XP+sW1E80GfhD4FYTNeQBiS5EnpFLXmFLqZl2DfuNhYAPsUCitKC6SdCi4Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mR8TJXTA;
	arc=none smtp.remote-ip=91.218.175.108
Received: from mta0.migadu.com (out-108.mta0.migadu.com [91.218.175.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3C606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mR8TJXTA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OYVZ0yzumc1mk5Sb1WLESPC1f1zKEMV4R0hkomobwSQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794018261; v=1; x=1794623061;
 b=mR8TJXTAyaI8UY449/vxt26+P/JzCQGp62Sv0rKA79EXTyvfggJQMSfOOVUCncG3XB2Y2h5s
 NwWce76HxNcM7OwrCvg1EW/ZUZTiPtIvi5pdFGGqX8+Ipnraj8id9cFdgqTiW63WczdB9Cbb8MD
 0atJIRC9NOfN2wueXDt7Am24=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab62eec1d21b0e00;
	Sat, 07 Nov 2026 02:24:21 +0000
X-Mizu-Trace-ID: ab62eec1d21b0e00
X-Migadu-Flow: FLOW_OUT
Message-ID: <be3166fd-596d-473a-8959-207492c06282@linux.dev>
Date: Sat, 7 Nov 2026 10:24:15 +0800
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
Subject: Re: [PATCH net-next v4 1/2] pppoe: pass bound packets directly to
 generic PPP
To: Simon Horman <horms@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, manizada@pm.me, ericwouds@gmail.com,
 nbd@nbd.name, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103111711.28202-1-qingfang.deng@linux.dev>
 <20261106181228.1263020-2-horms@kernel.org>
Content-Language: en-US
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20261106181228.1263020-2-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/2026 2:12 AM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103111711.28202-1-qingfang.deng@linux.dev?part=1
> ---
> pppoe: pass bound packets directly to generic PPP
> 
> This changes pppoe_rcv() to hand frames for PPPOX_BOUND sockets straight
> to ppp_input(), instead of going through __sk_receive_skb(). It relies on
> commit ec4215683e47 deferring the channel free to an RCU grace period. It
> also clears skb->dev, matching what __sk_receive_skb() used to do.
> 
>> diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
>> index 67c28ac763efd..5d5187e4976b3 100644
>> --- a/drivers/net/ppp/pppoe.c
>> +++ b/drivers/net/ppp/pppoe.c
>> @@ -415,6 +415,12 @@ static int pppoe_rcv(struct sk_buff *skb, struct net_device *dev,
>>   	if (!po)
>>   		goto drop;
>>   
>> +	skb->dev = NULL;
> 
> [Severity: Low]
> Should the comment in ppp_bridge_gso_segment() be updated as well? It
> still says __sk_receive_skb() is what clears skb->dev:
> 
> drivers/net/ppp/ppp_generic.c:ppp_bridge_gso_segment() {
> 	/* skb->dev is NULL here (cleared by __sk_receive_skb() for PPPoE),
> 	 * and some GSO handlers (tunnels, IPv6 UFO) dereference it.
> 	 */
> 	...
> }
> 
> Bound PPPoE frames are the ones that reach the bridge path, and they no
> longer go through __sk_receive_skb(). The invariant now holds only
> because of this assignment in pppoe_rcv(). Nothing in pppoe.c says that
> the GSO path depends on it.
> 
> The follow-up patch "pppoe: queue unbound packets directly" does not
> touch ppp_generic.c, so the comment stays stale after that patch too.

Ack.

>> +
>> +	if (likely(po->sk.sk_state & PPPOX_BOUND)) {
>> +		ppp_input(&po->chan, skb);
>> +		return NET_RX_SUCCESS;
>> +	}
>>   	return __sk_receive_skb(&po->sk, skb, 0, 1, false);
> 
> [Severity: Medium]
> The commit message says:
> 
>    "The direct bound receive path also skips the socket filter check in
>    __sk_receive_skb()."
> 
> Does this path skip more than the socket filter? __sk_receive_skb()
> calls sk_filter_trim_cap(), and that function runs the LSM hook before
> the filter:
> 
> net/core/filter.c:sk_filter_trim_cap() {
> 	...
> 	err = security_sock_rcv_skb(sk, skb);
> 	if (err)
> 		return SKB_DROP_REASON_SECURITY_HOOK;
> 	...
> }
> 
> apparmor_socket_sock_rcv_skb() mediates sockets of any family when
> skb->secmark is set. BPF-LSM programs on socket_sock_rcv_skb also apply
> to AF_PPPOX. After this change, neither runs for bound session frames
> from the remote peer. A configured policy would therefore fail open.

> Some other checks are skipped as well:
> 
>    - A filter attached with SO_ATTACH_FILTER or SO_ATTACH_BPF, even one
>      locked with SO_LOCK_FILTER, is still accepted by setsockopt(), but it
>      never runs on bound frames and never trims them.
> 
>    - The sk_rcvqueues_full() check and the sk_drops / drop reason
>      accounting in __sk_receive_skb() no longer happen.
> 
> pppol2tp_recv() already calls ppp_input() directly for bound sockets, so
> there is precedent. Could the commit message still describe the LSM
> bypass and the other skipped checks?

I can mention in the commit message that it make pppoe_rcv behave like 
pppol2tp. This commit is intended to bypass the backlog queue, so no 
need to mention sk_rcvqueues_full().

> This stays true after the follow-up patch "pppoe: queue unbound packets
> directly". There, only the unbound path still reaches sk_filter, via
> sock_queue_rcv_skb().
> 
> [Severity: Low]
> Does include/linux/ppp_channel.h need an update along with this? Its SMP
> locking notes say:
> 
>   * The channel code must ensure that when it calls ppp_unregister_channel,
>   * nothing is executing in any of the procedures above, for that
>   * channel.
> 
> PPPoE followed that rule before this patch. ppp_input() ran under
> bh_lock_sock(), and every ppp_unregister_channel() caller (through
> pppox_unbind_sock()) holds lock_sock().
> 
> Now pppoe_rcv() calls ppp_input() from softirq without the socket lock.
> So ppp_input() and ppp_unregister_channel() can run at the same time on
> the same channel.
> 
> That looks safe in practice:
> 
>    - struct channel is freed through call_rcu().
>    - pch->ppp is cleared and then followed by synchronize_net().
>    - pch->bridge is cleared and then followed by synchronize_rcu().
> 
> Even so, the documented contract no longer matches the rule PPPoE and
> pppol2tp now rely on.

Ack.
> [Severity: Low]
> Is chan->ppp now accessed locklessly without any annotation? ppp_input()
> does a plain load:
> 
> drivers/net/ppp/ppp_generic.c:ppp_input() {
> 	struct channel *pch = chan->ppp;
> 	...
> }
> 
> Meanwhile, ppp_unregister_channel() can do a plain store at the same
> time, protected only by lock_sock():
> 
> pppox_unbind_sock()
>    ppp_unregister_channel()
>      chan->ppp = NULL;
> 
> For PPPoE, the socket BH lock used to serialize these two. Without it,
> this looks like a data race that KCSAN would report.
> 
> There is a second ordering gap. ppp_register_net_channel() publishes
> chan->ppp before it initializes pch:
> 
> 	chan->ppp = pch;
> 	init_ppp_file(&pch->file, CHANNEL);
> 
> This store has no release ordering, and the sk_state test in pppoe_rcv()
> gives no acquire ordering. In practice the gap between connect() and
> PPPIOCGCHAN hides this.
> 
> Would READ_ONCE()/WRITE_ONCE() on chan->ppp be appropriate here? Should
> chan->ppp also be published only after initialization, with release
> semantics?

Ack.

> The sk_state access is volatile, so that side is not a KCSAN concern.
> The chan->ppp race is still there after "pppoe: queue unbound packets
> directly".
> 
> [Severity: Low]
> Can frames reach generic PPP out of order during the PPPIOCGCHAN
> handoff? pppox_ioctl() does:
> 
> 		sk->sk_state |= PPPOX_BOUND;
> 		...
> 		synchronize_net();
> 		...
> 		while ((skb = skb_dequeue(&sk->sk_receive_queue))) {
> 			skb_orphan(skb);
> 			ppp_input(&po->chan, skb);
> 
> A frame that arrives after PPPOX_BOUND is set now takes the direct path.
> It reaches ppp_input() during synchronize_net(), ahead of older frames
> that are still in sk_receive_queue.
> 
> At this commit, frames that go to the backlog while the ioctl holds
> lock_sock() arrive even later, from release_sock() -> pppoe_rcv_core().
> 
> Before the patch, the socket lock kept these frames in wire order. The
> follow-up "pppoe: queue unbound packets directly" removes the backlog,
> but the reordering against sk_receive_queue remains. pppol2tp already
> behaves this way. The frames in this window are mostly LCP and other
> control frames for pppd.

The same concern was raised when reviewing my patch that introduced 
synchronize_net() in pppox_ioctl(), commit 92c1bf630ab ("pppox: drain 
queued packets on channel handoff"). Before that commit, unbound packets 
were stranded in sk_receive_queue forever.

In pppd, the window between connect() and ioctl(PPPIOCGCHAN) is minimal. 
If you prefer deliver order over best-effort deliver, should those 
packets be dropped instead?

> [Severity: High]
> This isn't a bug introduced by this patch, but ppp_input() appears to
> call ppp_receive_error() without holding ppp_recv_lock():
> 
> drivers/net/ppp/ppp_generic.c:ppp_input() {
> 	...
> 	rcu_read_lock_bh();
> 	ppp = rcu_dereference_bh(pch->ppp);
> 	if (!ppp_decompress_proto(skb)) {
> 		kfree_skb(skb);
> 		if (ppp) {
> 			DEV_STATS_INC(netdev_from_priv(ppp), rx_length_errors);
> 			ppp_receive_error(ppp);
> 		}
> 		goto done;
> 	}
> 	...
> }
> 
> ppp_input_error() makes the same call inside ppp_recv_lock() /
> ppp_recv_unlock(). ppp_receive_error() then calls slhc_toss(ppp->vj),
> which does a non-atomic comp->flags |= SLF_TOSS.
> 
> A peer can reach this branch with a PPPoE session frame of length 0 or
> 1. pskb_trim_rcsum() trims the frame, and pskb_may_pull(skb, 2) then
> fails in ppp_decompress_proto().
> 
> Can this race with PPPIOCSMAXCID in ppp_ioctl()?
> 
> 		ppp_lock(ppp);
> 		if (ppp->vj)
> 			slhc_free(ppp->vj);
> 		ppp->vj = vj;
> 		ppp_unlock(ppp);
> 
> Without rlock, ppp_receive_error() could load the old ppp->vj and write
> to the slcompress after it has been freed.
> 
> This patch adds one effect in the common single-channel PPPoE case. The
> socket BH lock no longer serializes ppp_input() calls for one channel.
> The lockless slhc_toss() can therefore run while another CPU is in
> slhc_uncompress() / slhc_remember() under rlock, and a comp->flags
> update can be lost.

pppd never uses any compression on PPPoE. Fix should be in a separate 
commit.
> Would taking ppp_recv_lock() around ppp_receive_error() in ppp_input(),
> as ppp_input_error() already does, fix both cases?

