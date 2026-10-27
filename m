Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062239;
	b=Kg78wXkTe7MoupZeQInqa88+rBsIw0cLa4jjwj7YUONJA7kCea9rD07DQMz4lJFDn+ND
	 3+vTrX+XmTFShBSL/bXYD6qBJS/iGOuSQ2N/1gWk3/lHr65kqYxI6lnX4ZghoXbvAWGFD
	 Q6QBEaEnrws1rj9TCrM+RYpWTpWPdHHhOciIRhYcR6A46bkAMMGAWDG+I1T9q3dLHS785
	 iW5uUaUsbRQ9FJkNLbwOFFI3BYxI7fEjS2kBH3c3UnCTtWjESZUdDw0ECpYgwRsABHDuT
	 Kxxen9cFHxlJdYY1BVOlukpKEM0o8suS/BwJnffE79B4Xcnp70M/3+pCLRl60G9OTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0NzN51aqRpbJStcrZN13gsc+4FSKGxJBlY1ADn1Tu20=;
	b=sr7/dSeHXrAhmpIC8RBJdTUMhcMwa7mj4sM14zyo19KBYOjygXctHvmWbzIkFuZOqPnN
	 6UdGJwce22Gd2MYdCiua9lvP1OMrvbHCKgY2JS/VTw1QHzDVrD/f62qYqrX6ZCG18nH+Z
	 7wDUPyW/yqAfcXYYtYBfE1ysiZD1begqLXWgf35M3ZW/QSgnrWFmgykfOzDeI8AEtVHXc
	 aun2ZV82Fwbecoe0YjGSLrr+yfW8p+KAVg8DxH+JYFMUPS9/h/cAaa0M3dbCoQJAkRF0o
	 TcV44onyPBbocL23yedgipjwmesZep86xyYlBCF2zL1ohZNEmChvASDOMWhMgpv3I/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FKOdtr1h;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDC3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FKOdtr1h
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CE5ifV2bP/0mqUZJORz7tK38azXS/zuEQgIjJrDVLeQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793062236; v=1; x=1793667036;
 b=FKOdtr1htyyvyuDWfxIZbp28KTe2RRrkN7GGRUs3ML9EyTFnzoB5GTZpjyG3qLSFsO9iuEOB
 fAsSA9T4O0dojnSiohshUMmeyKmj4zOctNAEucu72IEJZOE5CWbftqPUu9NYkEhwakfWatkEb/Y
 IW/HeiakxjNq0R8MGvv1x09U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ddee97269a11767f;
	Tue, 27 Oct 2026 00:50:26 +0000
X-Mizu-Trace-ID: ddee97269a11767f
X-Migadu-Flow: FLOW_OUT
Date: Tue, 27 Oct 2026 08:50:17 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Timur Stukan <timur.stukan.linux@gmail.com>
Cc: netdev@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
Message-ID: <at_1RnSinpG5t7bZ@fedora>
References: <20261022103821.89552-1-timur.stukan.linux@gmail.com>
 <atsRW-aYHeB-cEgi@fedora>
 <CAF+_u5Byu9BccKQpZ9VcXAb-fMEhpKAD9A65LktLDJ77ng+KfQ@mail.gmail.com>
 <at6lTNHwA1V9Xja9@fedora>
 <CAF+_u5Bo7_GySpNLv00omfAtKD++5DJYgriSO_=rwzNT7vrfyg@mail.gmail.com>
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
In-Reply-To: <CAF+_u5Bo7_GySpNLv00omfAtKD++5DJYgriSO_=rwzNT7vrfyg@mail.gmail.com>

On Mon, Oct 26, 2026 at 12:20:37PM +0200, Timur Stukan wrote:
> On Mon, 26 Oct 2026 at 02:56, Hangbin Liu <hangbin.liu@linux.dev> wrote:
> >
> > On Fri, Oct 23, 2026 at 03:35:57PM +0300, Timur Stukan wrote:
> > > On Fri, 23 Oct 2026 at 10:48, Hangbin Liu <hangbin.liu@linux.dev> wrote:
> > >
> > > > >  static void bond_miimon_commit(struct bonding *bond)
> > > > >  {
> > > > >       struct slave *slave, *primary, *active;
> > > > > @@ -2807,10 +2828,21 @@ static void bond_miimon_commit(struct bonding *bond)
> > > > >                       err = bond_update_speed_duplex(slave);
> > > > >                       netdev_unlock_ops(slave->dev);
> > > > >                       if (err && bond_needs_speed_duplex(bond)) {
> > > > > -                             slave->link = BOND_LINK_DOWN;
> > > >
> > > > Hmm, this issue only happens when link_state is on
> > > >
> > > >         netif_running(slave->dev) && netif_carrier_ok(slave->dev);
> > > >
> > > > while !netif_device_present. Should we set the link up when device detached?
> > >
> > >
> > > Hi Hangbin,
> > >
> > > Thanks for the review and the suggestion.
> > >
> > > A detached device is one way to get there, but it does not cover all
> > > the ways to hit this bug. In particular, it does not cover the case i
> > > reproduced: during inspect both link_state and netif_device_present()
> > > are true, but the carrier is lost after inspect and before commit, so
> > > reading speed/duplex fails in commit.
> >
> > Hi Timur,
> >
> > Thanks for the explain, but the same question to this patch. How do you
> > make sure the carrier is not lost during bond_miimon_inspect() and
> > this slave->link_prev_state setting?
> >
> > Thanks
> > Hangbin
> 
> Hi Hangbin,
> 
> Thanks for the question. To answer directly: there is no way to make
> sure the carrier is not lost between bond_miimon_inspect() and setting
> link_prev_state, but the fix does not need that.
> 
> Let's split the miimon logic with this patch into 3 steps, executed in
> this order:
> - bond_miimon_inspect() - carrier is checked here and new state is proposed.
> - setting slave->link_prev_state - just a copy of slave->link, it is
> not read from the carrier.
> - bond_miimon_commit(), case UP - speed/duplex check.
> 
> And there is the case where downdelay is set and active slave flaps,
> so it is currently in FAIL. Possible scenarios:
> a) The carrier is present during inspect, so bond_miimon_inspect()
> proposes link_new_state as UP for active slave. Then the carrier is
> lost somewhere between bond_miimon_inspect() and bond_miimon_commit().
> It does not matter whether this happens before (your question) or
> after setting link_prev_state, it is set to FAIL anyway. Then in
> bond_miimon_commit() in case UP, speed/duplex check fails because
> carrier is lost and because link_prev_state is FAIL, the active slave
> goes through a regular down path with failover.
> b) The carrier is lost before bond_miimon_inspect(), so UP is not
> proposed at all, and after downdelay the slave goes DOWN through the
> same regular down path.
> c) The carrier is lost after bond_miimon_commit(), so the slave is
> already UP. On the next miimon tick bond_miimon_inspect() proposes
> FAIL and then it follows the same path as in b).
> 
> So slave->link_prev_state is not affected by carrier changes between
> inspect and commit, that is just a copy of slave->link, needed to do
> the right thing in bond_miimon_commit() if the speed/duplex check
> fails (e.g. because the carrier is lost).
> 
> The same applies to the approach without link_prev_state I proposed to
> Jay, since there slave->link itself still holds the previous state in
> bond_miimon_commit().

Ah, yes. I miss-read that. The bond_propose_link_state() only set the
link_new_state to up. The slave->link state is still BOND_LINK_FAIL.

Thanks
Hangbin
