Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328443;
	b=FYfZtaICiTd5ayuGiff025zfgCANsDHr0lHkcRJ8zKJLfqqvEQsQFcMnatOoiyN4J2Un
	 /cE+pINzkdy/kOxGye/+8Ahj3/rUA5TOgdyNmRiFTKnBLwSrNeg7sImkecL6BL7AYlnrN
	 /48b6wo/vTuh/tB/TIqAJYI76g/HqOO2HZiUR9z4ovOlc7dkx2elO23AdW4GZlcXzo0u5
	 PUxrQoKQB2zBO3rUxHoNlWoujGJJu4VImLpjyXP3ASzRqEgqPyKKe5iR7qHlU67AiV8NM
	 JeIaGgNoVZswMw1mPXxpUBbaumYi1QNE94qVubgpC2UCpJTlw0hIg03uDYF4dhUg3Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328443;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xYEq8HbwUXEbqfAYqiylUR/1VTWi5Y1t3UUmnG8Hobw=;
	b=liHD9lFCyB+DsisqWAiaREppMeI0Sw6KgHsV2n+SN0cWPOQmQd1iy7C+wkE+DSHAhUjb
	 AaXaxqmAxtq5qQP759TLwDpQEjT5nPQrzk0gCN50l4i8lSOwtNYvf+AaH4MJjZRKwEIFR
	 QMxPH4oC3z+B9VskvHiQSn/zLxOoseY4Jeas8elqirNEuiLYNk6xAHgOylUB7TmtQlAzp
	 28VbvOze8fuFtAObOO7W9aTF34sCtorbLgqYGQ9PlUpLsZ5W/ItLfn8NdhpI6IdldqozS
	 1mQcDEwQBE+8EBoqZyS7fyknlhfdQ4q2l3faRRZ5UqqVOOkt7ef+d9o08/rnMfa8QqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=NjXWYsqU;
	arc=none smtp.remote-ip=209.85.216.101
Received: from mail-pj1-f101.google.com (mail-pj1-f101.google.com [209.85.216.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1B606A21A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC1B606A21A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=NjXWYsqU
Received: by mail-pj1-f101.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1418553a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328441; x=1794933241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xYEq8HbwUXEbqfAYqiylUR/1VTWi5Y1t3UUmnG8Hobw=;
        b=HvY4tG8vq0zfqYCU1HREcN/TSfC7vzSdf1w3NMp2WBT88uHZaLUMrqkXGgLw5Rt5GD
         LxP/g6hsUmf42I/gXlRSnB3TKduW1Mq70peXaRk1JxlpcwztlTxTBcTF8N5mSuFnZjiE
         pyG3K4okpm6cCYOtQGB2xplHgcBbAOZQh6GlFbEYy2GqwJro7KqrdpKPM14eltqYdYbl
         Iy3oi5dtLwX6Dwk5/n/lA+zZIi5HqRHMPGiPLF4sA+oV+nQyVDiQPsbeL9o0D/eFTK6N
         mCmhCvYq9IroJjB6Uopo1x0gAO2CU5DjYSEf0kq9AnfadyeUdEaaqdWpVwGKXYTIvRUb
         E9rQ==
X-Forwarded-Encrypted: i=1; AL+hErEG7ZtO4OHg6VddmsuSCtFFteEf2vXTTg9fgqoQ8+b5xbbZKFlxcl4lfbwruElRIk8ZpOmPIjCQ6z4H7vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z90vGrcFj0B0Ovj9UqlDuMU/meUoN0vD55XSCWpBArSnSGdpQYV
	82ZbvwKr2a643yF028PGUs5uUMAz4nQyD2ziljRLL/HEGzeKIyamS4Gy83NFsmsy8SiEy3SNTmD
	y3X7Dr/b3/8500dHQREm5WXfl9i+4IL+VgoG5Sb0=
X-Gm-Gg: AYBFou27bVGwIjJJ+HYcbloMUGW54aloCjjwtkM39JU66PYEXoqw1QCJwqgoFbmcloc
	PCVkE1Jqq5enbOW8RhzF8Qm5yeCDZdxzGI2CLkBcTGq/yEDiD7dS0T3QU1uaX/PTiV50/JWIs9m
	/SdFFSV+TsHUlauLZg6YuUAQMXvFlXHnCy97lZZmnaTUCgthrHGTlouvTqNSaDbnGq92l0Tttz5
	+EiO2eC2+xMqoTDC8I0VOdn/MEKeZRoprHDGy2KLzKy93knhEHccVf8mZiyXBFxaBjiED/vmJZI
	QtblrXCT/CUN5xPVaMuAs7WhO6OmKe/D8qE8M8Epz5Q4dgqQbDSBzaXVOH5C1xbj8cj/pka8Ij8
	GAA==
X-Received: by 2002:a17:90b:2b86:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3b166cc1492mr3132138a91.18.1794328441135;
        Tue, 10 Nov 2026 08:34:01 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db39f76sm230466a91.3.2026.11.10.08.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:34:01 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794328438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYEq8HbwUXEbqfAYqiylUR/1VTWi5Y1t3UUmnG8Hobw=;
	b=NjXWYsqUesUoBb2Op846E0r3AyPiJ/nASZJaxW4MJZHcJSVe63eNzfVRxBodLtwKIO07fZ
	OGHokAm3OieWlB++q3OW7jcowp6Dlns0Su0gH8549/u85RwDnDxeVlOZ4JlL4h+hudRPpS
	YQ89M7sHVvCPkUqKhlM6t/YdSVJgrAY=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id d39f359f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:33:58 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:33:56 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Chris Arges <carges@cloudflare.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <avNHdEw2zHGyBe_U@zx2c4.com>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com>
 <aq2jp8lXwSIqihaj@20HS2G4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aq2jp8lXwSIqihaj@20HS2G4>

On Fri, Sep 18, 2026 at 03:48:39PM -0500, Chris Arges wrote:
> On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> > On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > > Calling peer_remove_after_dead() currently flushes device-wide packet
> > > crypto and handshake workqueues while holding RTNL. This is problematic as
> > > unrelated peers can continue adding work to those queues, blocking other
> > > tasks that want to take the RTNL lock.
> > > 
> > > Instead, this patch tracks pending crypto handoffs for each peer using a
> > > counter. After marking the peer dead, synchronize_net() prevents new
> > > submissions. Next, wait for pending crypto workers to schedule TX work and
> > > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > > packet and handshake work.
> > > 
> > > This scopes teardown synchronization to the removed peer and prevents
> > > unrelated peers from extending the RTNL hold time.
> > >  struct wg_device;
> > > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> > >  	 */
> > >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> > >  		return -ENOSPC;
> > > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> > >  
> > >  	/* Then we queue it up in the device queue, which consumes the
> > >  	 * packet as soon as it can.
> > > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> > >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> > >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> > >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > +		wake_up_var(&peer->packet_crypt_pending);
> > >  	wg_peer_put(peer);
> > >  }
> > >  
> > > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > > index 824bbefce61c..bb35e3205491 100644
> > > --- a/drivers/net/wireguard/receive.c
> > > +++ b/drivers/net/wireguard/receive.c
> > > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> > >  
> > >  next:
> > >  		wg_noise_keypair_put(keypair, false);
> > > -		wg_peer_put(peer);
> > >  		if (unlikely(free))
> > >  			dev_kfree_skb(skb);
> > > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > > +			wake_up_var(&peer->packet_crypt_pending);
> > > +		wg_peer_put(peer);
> > 
> > This adds two atomic updates to a per-peer counter for every RX packet
> > and TX batch. That could introduce contention across crypto workers. I
> > suppose it'd be good to see some measurements in if this changes
> > anything. Certainly it should change _something_. Question is by how
> > much.
> > 
> > Jason
> 
> Jason,
> 
> I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
> UDP payloads. Goal was stressing the path where these atomics are getting
> incremented.
> - patched 2 vCPU test showed ~1-2% reduction in throughput
> - patched 8 vCPU test showed ~6% reduction in throughput (more contention)
> 
> My main goal is reducing the amount of time holding rtnl_lock when we remove a
> peer. In our systems we frequently get hangs due to workloads bringing up and
> tearing down wg peers. So perhaps I'll need to look into another approach
> where we're not introducing something like a counter into the hotpath.

Did you have any luck with other approaches? I'm still interested in
this.

Thanks,
Jason
