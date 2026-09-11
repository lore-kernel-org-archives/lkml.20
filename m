Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171C41A903
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111170; cv=none; b=pL6d42xZc3iXod5JhIAOMhhLN9qJ9Ad91CIt5UqNTYENGZ3UlHUytd0QnnFaQtq5YaYUjd/zz2yKG4S+Imh0NWwyunKCkB90CQUiChsjByP9HVTzB7Job4fs99tVfR8ph0eE/UicYPgxcHBYwXdaKUcQTyk13WyAxvpASVMOfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111170; c=relaxed/simple;
	bh=A653kvWvlUjyjxOaQ/MsWghyBz85Z0vOENYbiQUJbys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCONyXt04Ew77vzyi2Wm8BM/GXfB8v3eLMeMeRqgcfbkzIOmrViRoY+Zgz6PZdhpQG3o1VgxeDdXs/PBIt5NqtM4mhi3ZXntjYP5jzKJlQ8ySuJOnf9Je+Kluu91e5pjI/6vs4fXA6t0HRWqdhWqqN+EJCcnDiS+N7y16WM4o7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sVCh83y7; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sVCh83y7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A653kvWvlUjyjxOaQ/MsWghyBz85Z0vOENYbiQUJbys=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789111163; v=1; x=1789715963;
 b=sVCh83y7h9XQNWMBpWMFPQ045CVg/bN7cd5ea56cGGGIyPzkBqqNjSXBGNEY357xakT5W+Gg
 6Bi4LeTxK4fRnOkFT5/39vOH0rmYIRgYcq0p183BPYGqcxjocsL2gua0JzmxkkwGGofeiQFgO2z
 b6zD352LGZ8uhjSr2hWWrMsE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dcfcdc42e6d32e93;
	Fri, 11 Sep 2026 07:19:23 +0000
X-Mizu-Trace-ID: dcfcdc42e6d32e93
X-Migadu-Flow: FLOW_OUT
Date: Fri, 11 Sep 2026 15:19:14 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	daniel@iogearbox.net, linux-kernel@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net v3] bonding: fix slave_cnt leak on XDP error paths
Message-ID: <aqOrcoqnRMsvpS_5@fedora>
References: <20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn>
 <178889459114.219967.6984751596437332187@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178889459114.219967.6984751596437332187@kernel.org>

On Tue, Sep 08, 2026 at 07:09:51PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 1 · High: 0 · Medium: 0 (1) · Low: 0
> 
> - [Critical] Newly introduced slab out-of-bounds write in
>   bond_update_slave_arr(): moving `WRITE_ONCE(bond->slave_cnt,…
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the XDP
>   error paths the patch touches are still incompletely unwound: the…
> 
> --
> 
> bonding: fix slave_cnt leak on XDP error paths
> 
> This moves the WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1) in
> bond_enslave() from just above netdev_compute_master_upper_features() down
> to after the XDP setup block, so that the three XDP failure exits which
> "goto err_sysfs_del" no longer leave slave_cnt incremented.  The increment
> is placed just before the bond_update_slave_arr() call.
> 
> Link to v2: https://lore.kernel.org/r/20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn
> Link to v1: https://lore.kernel.org/r/20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn
> 
> > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> > index a9bff7663eeca..1514a8ba0888d 100644
> > --- a/drivers/net/bonding/bond_main.c
> > +++ b/drivers/net/bonding/bond_main.c
> > @@ -2284,7 +2284,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
> >  		}
> >  	}
> >  
> > -	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
>        ^^^^
> 
> [Severity: Critical]
> Can removing the increment from here overflow all_slaves->arr[] in
> bond_update_slave_arr()?
> 
> By the time control reaches this point, bond_master_upper_dev_link() has
> already linked the new slave into bond->dev->adj_list.lower, so
> bond_for_each_slave() now walks N+1 slaves while bond->slave_cnt is still N.
> bond_update_slave_arr() sizes its arrays from slave_cnt and then fills them
> with an unchecked store:
> 
> drivers/net/bonding/bond_main.c:bond_update_slave_arr() {
> 	...
> 	usable_slaves = kzalloc_flex(*usable_slaves, arr, bond->slave_cnt);
> 	all_slaves = kzalloc_flex(*all_slaves, arr, bond->slave_cnt);
> 	...
> 		all_slaves->arr[all_slaves->count++] = slave;
> 	...
> }
> 
> The window that now runs with the stale count includes
> bond_select_active_slave(), which is a few lines below:
> 
> 	if (bond_uses_primary(bond)) {
> 		block_netpoll_tx();
> 		bond_select_active_slave(bond);
> 		unblock_netpoll_tx();
> 	}
> 
> and that reaches bond_update_slave_arr() for balance-tlb/balance-alb:
> 
> bond_select_active_slave()
>   bond_find_best_slave()        /* returns a slave in BOND_LINK_BACK */
>   bond_change_active_slave()    /* BOND_LINK_BACK branch */
>     bond_alb_handle_link_change()
>       if (bond_is_nondyn_tlb(bond))
>               bond_update_slave_arr(bond, NULL);

Oh, hold one. I miss read the comment. It's not about the
bond_update_slave_arr() at bond_enslave() we moved to.

This is the bond_update_slave_arr() called by bond_uses_primary(), which
is before the ndo_bpf ops. We need to either also move the
if (bond_uses_primary(bond)) block after bond_update_slave_arr().
Or just use my patch v1 version, that add a new err out.

Nikolay, what do you think?

pw-bot: changes-requested

Thanks
Hangbin
