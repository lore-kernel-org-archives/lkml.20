Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332631;
	b=ZBdJGVEIzUfAIFTIAoQXCbI3U2UMFUH/avPNDoBC3htMzFZ4QpSB3ODsX16qRXrOvkkS
	 GiU8f8NM05D7p5RbjBaHqS950gln8D8cVs9pvYq22se595To+nDFPH2HwvHlJCj25Q7r7
	 8dN/Bjqb9PaaN0MZ3kUMypkamYv0JRdtyzA1skEp1vE21nNCygENCRx+IsWQhfM/grD+n
	 P75Wflqf5rDEzGza03ocMKu0RSov2Zhl/x2Euxte2X1WcZ8PMjPeFZ/4Y+Gx2vTbw8cZd
	 2X0pvbUTUzysgO+0suic8QEwJIg6z7ucsZnJg19P2UomSate/aW0ySus/D5y6nGqYyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g1jb+6xFRaxfW+s+GrlDz4VHByKru/fEuJ86nW0oDnk=;
	b=SxOTjcTQL/nTJGq9eihtcfw4xV57/ns521WJZAQSPSBrvWghg1/HJONY7YTj615ABvaI
	 fe412r3febMBx2IyFUQGx/GvRnbv6DeA5E31hnh95BsAHVEJ5Mojc6+WZYRfgUyYVOPgc
	 a/7b3LGsAdVryo7dMTnvmontosCOtkJkupYgxFm5CkbN6z7PcleRmxwuHT2hNi3+I8PMn
	 RNqp135/NmkMzAtPv32whbHSAd8K0uSkl7bV1IUSmzC4E7p8x8NekmnZQbTNhp9GCGWOm
	 fbhQ1t87J2JISulvNFyXbH1jqWpou8whGdg2p23nxGHq91B0ROVCo7Mpk7jUrluMROg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BYIZXyMf;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BYIZXyMf
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84e513877a3so2002380a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794332629; x=1794937429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1jb+6xFRaxfW+s+GrlDz4VHByKru/fEuJ86nW0oDnk=;
        b=BYIZXyMf8AlpCGoyXoTFyqJ/cRhRHFcTLDB40sI+ogWaxYCJTZt9TC5UVasrWx6Ffh
         MCLEnx1rc1kjmlXnt+b//TrvasaFMFtcG2NHEWanLw7sJkcM3wRIg+ozDcHxMt+LQQyY
         k82eXXp6JOY+R5mgZak1V1yGV6+eX4pT5vrA3CVlWkHB2GvAdvjrFQVR7QpCJyXVbHci
         fj6nkdtXumNu0MrKR8wASSjgf4Kf4z9tGAj9z+L9NkLixCnc/WsuMskPFfLCYbTIOq3u
         rFIQApxQ0CDag7xJ7Gy4KDag8oB3QGQF/Vhq9DsPSffJXrDqN3ToKPTtjKnWbhTJgZjh
         f3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332629; x=1794937429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1jb+6xFRaxfW+s+GrlDz4VHByKru/fEuJ86nW0oDnk=;
        b=eHiRMM9lPi0mjMON3Frh8dGobNCFS+79O0AE/yxYmXp0BiR2ljRcR9+uF7EEIJOGSg
         V1ojnLk6JNPtTnJljVfIRXOrQYjQXWU7MqyKkBwNZ7VGJZdpWVJd8w1hwTD3I+Nl0POB
         l9l6QKezkP6xQpp1LCrVOH8eJjz3mSgY5iRb3asSgQ73dEDFBcjVx9sDS+AG1jaqE+e5
         1usr58k/351xuFYgV1RcOt9TH2JMTkk1oYw//wcKY8BFDVPdrKQkBKns423v13+EVvLZ
         6epdPo9w+g9AavsQcC+8gHt+rph3cyKNjA2P/t2UYgk2P1dFLRDKJUXhDz6yNe6rDl8c
         5ykA==
X-Forwarded-Encrypted: i=1; AL+hErHXOmqcRmBGWiGmoK1x6WmaJtq3/2LKNrzqXSuG6ht1kfYPYFW7OmkibKbcEFz77q8/2IMgR2xxhyE48hU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trzHogJMvQJnuCrNlyMZKUS7IKi1VTZlCdknQTtphUR87LDF/
	0j4zS3mNPw7iihFwOzZIR4cm6W8Cnbu8bFYsAxLbul60z5UluqYhCdiCRFYjFBh0BX8=
X-Gm-Gg: AYBFou2y3ObFDRnQyHoGt19crTFhmgTgGoGXyMreFSg7d9Ghx/LatIZL5X+0SErEB5+
	ZY2UU54Xf1hgplHKZ7qVmxW/cFS4Xjs8YeaQOxZS7BYPuyT0eBdeVFWw5TmLPBp9JAcvYBl4l6B
	Lw//JN1G0aYNJKXcJQAWvLgIo70tVSPLr9e8EGQOzlBdWkpcWFV6OV++oI8gSihkJ/mCRthE7kl
	z9CjhYZK0PrY5rQvrXyylhLAaXP+mIjx2KdeCF31O8m750YK2kuGyLtHED+tyv5Nqin5CslCtvz
	hIBtcdvgSSapPQnI1MFslTND5GLfFDzXI43cfQqET9jfQb9wMlXOmAGql5EsjipsLshSTc6jArd
	W30rWC6lx8E0K8My1bQePZLn27JZEN5sx8AKnf8Ssb4xs2t0HBYxGeQ4AJ0ZmgDKiUhOga11BuN
	feyUoJvjVHMDrfG2HDCbd619qRapjwfVv0oZ437BXjbhI6rRAxfdcjy1JTqCA0T4Np+2PNVMIQI
	NsctUNLeSv1r4hQvM/qIJO74xoOXdlkhvedkec7UCk8XJyWCbYgPE0DOxjECuj7TKDyFkZ7KWP6
	8+qHtIYT68gGOOSsuarFGsbkX59FrKDpSila
X-Received: by 2002:a05:6830:4429:b0:81c:9abc:974b with SMTP id 46e09a7af769-860f01d5f35mr119441a34.17.1794332629456;
        Tue, 10 Nov 2026 09:43:49 -0800 (PST)
Received: from 20HS2G4 ([2a09:bac6:bf21:15d7::22d:12a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbfa983sm2478344a34.20.2026.11.10.09.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:43:48 -0800 (PST)
Date: Tue, 10 Nov 2026 11:43:46 -0600
From: Chris Arges <carges@cloudflare.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <avNXVJX2YVU06T3B@20HS2G4>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com>
 <aq2jp8lXwSIqihaj@20HS2G4>
 <avNHdEw2zHGyBe_U@zx2c4.com>
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
In-Reply-To: <avNHdEw2zHGyBe_U@zx2c4.com>

On 2026-11-10 17:33:56, Jason A. Donenfeld wrote:
> On Fri, Sep 18, 2026 at 03:48:39PM -0500, Chris Arges wrote:
> > On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> > > On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > > > Calling peer_remove_after_dead() currently flushes device-wide packet
> > > > crypto and handshake workqueues while holding RTNL. This is problematic as
> > > > unrelated peers can continue adding work to those queues, blocking other
> > > > tasks that want to take the RTNL lock.
> > > > 
> > > > Instead, this patch tracks pending crypto handoffs for each peer using a
> > > > counter. After marking the peer dead, synchronize_net() prevents new
> > > > submissions. Next, wait for pending crypto workers to schedule TX work and
> > > > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > > > packet and handshake work.
> > > > 
> > > > This scopes teardown synchronization to the removed peer and prevents
> > > > unrelated peers from extending the RTNL hold time.
> > > >  struct wg_device;
> > > > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> > > >  	 */
> > > >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> > > >  		return -ENOSPC;
> > > > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> > > >  
> > > >  	/* Then we queue it up in the device queue, which consumes the
> > > >  	 * packet as soon as it can.
> > > > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> > > >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> > > >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> > > >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > > > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > > +		wake_up_var(&peer->packet_crypt_pending);
> > > >  	wg_peer_put(peer);
> > > >  }
> > > >  
> > > > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > > > index 824bbefce61c..bb35e3205491 100644
> > > > --- a/drivers/net/wireguard/receive.c
> > > > +++ b/drivers/net/wireguard/receive.c
> > > > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> > > >  
> > > >  next:
> > > >  		wg_noise_keypair_put(keypair, false);
> > > > -		wg_peer_put(peer);
> > > >  		if (unlikely(free))
> > > >  			dev_kfree_skb(skb);
> > > > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > > +			wake_up_var(&peer->packet_crypt_pending);
> > > > +		wg_peer_put(peer);
> > > 
> > > This adds two atomic updates to a per-peer counter for every RX packet
> > > and TX batch. That could introduce contention across crypto workers. I
> > > suppose it'd be good to see some measurements in if this changes
> > > anything. Certainly it should change _something_. Question is by how
> > > much.
> > > 
> > > Jason
> > 
> > Jason,
> > 
> > I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
> > UDP payloads. Goal was stressing the path where these atomics are getting
> > incremented.
> > - patched 2 vCPU test showed ~1-2% reduction in throughput
> > - patched 8 vCPU test showed ~6% reduction in throughput (more contention)
> > 
> > My main goal is reducing the amount of time holding rtnl_lock when we remove a
> > peer. In our systems we frequently get hangs due to workloads bringing up and
> > tearing down wg peers. So perhaps I'll need to look into another approach
> > where we're not introducing something like a counter into the hotpath.
> 
> Did you have any luck with other approaches? I'm still interested in
> this.
> 
> Thanks,
> Jason

Jason,

Yes, I have another approach I'm working on that doesn't require a per-packet
counter. I'll try to post something in the next week or so, this is still on my
list.

--chris
