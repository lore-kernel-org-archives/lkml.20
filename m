Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF02609C5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114169; cv=none; b=ti0sXZJjHP1cNd/gw/VlcnHPA9tBcMRIuGCk1v0EVlUamDIjSj/+x6IRmiRsUhlBLpBt6hH9ZQYacxHJIaCG/v9Ydxs/ACaTwP9fUGTFH15H2phBma47g9q36gs7BSSq601RoJ2vf6eiWIfmbOYOA0LkajQZ16xbNNOWEPrzt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114169; c=relaxed/simple;
	bh=ZDUrEhbV+2TXq+MkQPnXAz+dDI19w+d9G1ESNOiQmJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp/FIJuRbE03IZ261vfjnmVJA0Hfr/PpzAgoBQ59U2ENIGfTQKk55rookd+DtvrzGnaNWAt3xwVyOSVJIYk0dD7rD2dDeQXxPu6QWZ4YmN7y27c5WevPeVMbRgE4WWj3SCAPPqSSX0yE26JuL3XN8Y2yNvAevE5VtlbS2NGCO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cJZmrMoe; arc=none smtp.client-ip=91.218.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cJZmrMoe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZDUrEhbV+2TXq+MkQPnXAz+dDI19w+d9G1ESNOiQmJg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789114163; v=1; x=1789718963;
 b=cJZmrMoe5/j1r6M89ukpc21PQLHEP2yStvfBhg8b9yLb6vGTHtUAoDIYu+SdUXGTm9xpK2Py
 NYAzNsaBV8rOTR0WobrF+oL/zgWPTy7ix1j531NfUXV2SL0kbrupoiHZ7cwKhWwI82FWqK3QGdE
 AmXGR4ifwVEzFmNtVkpTpTx4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 78e6f9d7077485fc;
	Fri, 11 Sep 2026 08:09:23 +0000
X-Mizu-Trace-ID: 78e6f9d7077485fc
X-Migadu-Flow: FLOW_OUT
Date: Fri, 11 Sep 2026 16:09:15 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	daniel@iogearbox.net, linux-kernel@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net v3] bonding: fix slave_cnt leak on XDP error paths
Message-ID: <aqO3Kw-ydibVisXK@fedora>
References: <20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn>
 <178889459114.219967.6984751596437332187@kernel.org>
 <aqOrcoqnRMsvpS_5@fedora>
 <8149fce5-04c3-4a14-969c-c65a75dcf699@blackwall.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8149fce5-04c3-4a14-969c-c65a75dcf699@blackwall.org>

On Fri, Sep 11, 2026 at 10:23:26AM +0300, Nikolay Aleksandrov wrote:
> > Oh, hold one. I miss read the comment. It's not about the
> > bond_update_slave_arr() at bond_enslave() we moved to.
> > 
> > This is the bond_update_slave_arr() called by bond_uses_primary(), which
> > is before the ndo_bpf ops. We need to either also move the
> > if (bond_uses_primary(bond)) block after bond_update_slave_arr().
> > Or just use my patch v1 version, that add a new err out.
> > 
> > Nikolay, what do you think?
> > 
> > pw-bot: changes-requested
> > 
> > Thanks
> > Hangbin
> 
> Oh well, it is becoming too dangerous. I'd go with your v1. That is the safest bet
> that can be easily backported. Sorry for leading you down this path, I missed
> we can still reach the slave arr update via active slave selection.

bond_update_slave_arr() is somewhat hidden, and I also missed it :(

The settings in bond_enslave() are growing increasingly complex and
interdependent. Moving any line around becomes risky.

Thanks
Hangbin
