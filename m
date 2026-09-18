Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E647DD42
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764526; cv=none; b=FWIlSRd+LLqh+B0a+WJE8/DE9YMR6QrvyrfCh5Mwi12M2F2xQ9lxF3DDVNlS/aM19aCl6cA1+O5nlGS3WjUMhVEq2DNvjSpYOQIMWKzCdY44C0i0hW2HEsfv1zGKaDyBp5SwC+X3eK2ksYqJ7s+wOA2WZFzG818T284uslcQm2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764526; c=relaxed/simple;
	bh=lIULnVXaHfRFnKyXSPLXe+B+3MNbWg24iPNhTFY0tY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvJSXfJzIAuGNtukgGFqxEzBt6Grv5gtRXBlrXXRklbrTl6FpspKV4J88jWvIX3f/ZHcCGNOZccsZjnRai0k9VhSxJQDfTMAKNkk6npWqLwsrO/Wz9q8hy7B1klo7yxFhRhA/B5Jip2yHcEBzh7OI8G4qRUHDBtlLddfUMz1Lig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=MpxylbWV; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="MpxylbWV"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7fcb425fb68so655704a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789764522; x=1790369322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ppEJDHuTUlQGSUDN/FO8Ik2+PuCaJNFQHPiMwbR7z+4=;
        b=MpxylbWV8mXZjpP1d9RjcG5xs2WRhFCwoNWkKiEssMBss9q967o3UetYXz5mQVzcLR
         zJ+QcyfLzHcRq/u1TBWr4+xZ/Il546Xr7E13aFMBU4kHtDjX/+c8mwsqlRas4IZ7AqLG
         Px85tD9IsKfYCH7PhXkXha3addR6GK4RIRT5P2K8NmCU94zncAcHrJLoiHBGpxcyaVoh
         DymEBfMy3XS+U3l/5TALT6tnGU1/SMOjsKn5e6OBlOj3pasxQvcNyeaEDZcU9tiwV0a8
         M87W9IH4Ort8EfqJL9EvbibDL9rBnJRbeLePiDxkmem2E1GymKTopt8Anlmi6TztRvW6
         +92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764522; x=1790369322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppEJDHuTUlQGSUDN/FO8Ik2+PuCaJNFQHPiMwbR7z+4=;
        b=sOFdrPbftqkS9QjIWBQdh4oKlLN4cKtgtVNTFZPRju1cyoeMCJura9uZUMzC3zQZPB
         tmk0REgXRuZ1rp69osM/ysRMsD/ubpaX2SSFkkr2FMmb6Rw+zF5jMWwkS0VsuvB95YvJ
         dzRyM9WMeBhzHxnAD7G5P4xDJY8tVk4GYdkWgRCrIlB1lpO6nCB2GjhCmP/01DCuj9bt
         i8bGByY3A76+RxVAACncbg1+vbdRYH/Sla/mkivBZsNg9YUlBXmGk5VcYavcf9Q+jspL
         NhYSMqnfKaFgM5E2lom1Db3ShJXEAFDem9WfNHFsM98moyDQm51yeJZAjubkfX+QR1MC
         sGFw==
X-Forwarded-Encrypted: i=1; AKwUvBycWYNAi3FF11FiP00/tpRwPAwStOuaWMJuIoGVWozbmt9jq3OEtAhsc4KU2VLawykIJvNcdLlAkWcrkXc=@vger.kernel.org
X-Gm-Message-State: AFuF++k4udkzxsmu704IaAbBVkxwdr6+oH9Yq9Erb7GLN08mmvHy6NMt
	+gpKYqTPDrWMsjv3P4EkQ9oWz0TP8kqdrDhILVATrJhMZN3XCsK2SlsHR9k3IInp+0g=
X-Gm-Gg: AYBFou3fqjgcafuhh/VA/qsMuE/cOr+1OOhSxKWYUBemw8EXtxkDSQA8Qdk3E7bWDT0
	uXbjmdC6MfogyVI/hdmj/VyN3BgIYS5hIFSJemPzL3Sw4loel0/oX36G8FyA81RK486EiOA411z
	TTlV/lxHwsCcWsXLhrYSJ4F4ijVE40qS9NOkbltqe5k0MfcrNnv0Bp6UElfrCroXO+VSnsptv0/
	Fd+2XCTFFI7BBj+Ml+pFKjtrgfOpvjGn1ZBT+5QM1CIYygS6CKaWeARup0OVkfD1fCqyNWE+4w2
	k2re9OMmWZtPgPGfU+NqPvQw3htSyvY7mp6yzBLECHwCZ3ZZN22rcpxVbI2pmg0AXd+WeF1LLQJ
	nsI8apgfOf76GsXMwgXd0wQOP1UB5JloG86JMMtxI1NSdxK0UcqHHn9DLyY4j+tBqvO+oo4h32A
	Rwg/6eTYmiJjznTUsnvkBLb5YOxrZ/9V7sc8BFjTZdXs+Uean+rBDSWmU=
X-Received: by 2002:a9d:7441:0:b0:806:ab05:c1dd with SMTP id 46e09a7af769-80ddfd6c11amr3214332a34.4.1789764522401;
        Fri, 18 Sep 2026 13:48:42 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:1923::281:62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8107dd8bc84sm480328a34.9.2026.09.18.13.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:48:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:48:39 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Message-ID: <aq2jp8lXwSIqihaj@20HS2G4>
References: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
 <aqpqEIy_h0DIywRy@zx2c4.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpqEIy_h0DIywRy@zx2c4.com>

On 2026-09-16 12:06:08, Jason A. Donenfeld wrote:
> On Sun, Sep 13, 2026 at 07:19:08AM -0500, Chris J Arges wrote:
> > Calling peer_remove_after_dead() currently flushes device-wide packet
> > crypto and handshake workqueues while holding RTNL. This is problematic as
> > unrelated peers can continue adding work to those queues, blocking other
> > tasks that want to take the RTNL lock.
> > 
> > Instead, this patch tracks pending crypto handoffs for each peer using a
> > counter. After marking the peer dead, synchronize_net() prevents new
> > submissions. Next, wait for pending crypto workers to schedule TX work and
> > for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
> > packet and handshake work.
> > 
> > This scopes teardown synchronization to the removed peer and prevents
> > unrelated peers from extending the RTNL hold time.
> >  struct wg_device;
> > @@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
> >  	 */
> >  	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
> >  		return -ENOSPC;
> > +	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
> >  
> >  	/* Then we queue it up in the device queue, which consumes the
> >  	 * packet as soon as it can.
> > @@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
> >  	atomic_set_release(&PACKET_CB(skb)->state, state);
> >  	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> >  		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> > +	if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > +		wake_up_var(&peer->packet_crypt_pending);
> >  	wg_peer_put(peer);
> >  }
> >  
> > diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
> > index 824bbefce61c..bb35e3205491 100644
> > --- a/drivers/net/wireguard/receive.c
> > +++ b/drivers/net/wireguard/receive.c
> > @@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
> >  
> >  next:
> >  		wg_noise_keypair_put(keypair, false);
> > -		wg_peer_put(peer);
> >  		if (unlikely(free))
> >  			dev_kfree_skb(skb);
> > +		if (atomic_dec_and_test(&peer->packet_crypt_pending))
> > +			wake_up_var(&peer->packet_crypt_pending);
> > +		wg_peer_put(peer);
> 
> This adds two atomic updates to a per-peer counter for every RX packet
> and TX batch. That could introduce contention across crypto workers. I
> suppose it'd be good to see some measurements in if this changes
> anything. Certainly it should change _something_. Question is by how
> much.
> 
> Jason

Jason,

I benchmarked a wg peer on a 2 vCPU and 8 vCPU setup with 1200 byte
UDP payloads. Goal was stressing the path where these atomics are getting
incremented.
- patched 2 vCPU test showed ~1-2% reduction in throughput
- patched 8 vCPU test showed ~6% reduction in throughput (more contention)

My main goal is reducing the amount of time holding rtnl_lock when we remove a
peer. In our systems we frequently get hangs due to workloads bringing up and
tearing down wg peers. So perhaps I'll need to look into another approach
where we're not introducing something like a counter into the hotpath.

Thanks,
--chris
