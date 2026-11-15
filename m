Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783692;
	b=pX65DbnJ9nfiqZ1xXas3GTVTzTnBN4dDFGad+JZnnEadKnZ7r0SPtljukb/QHBUgCGrA
	 QPgg6xNWK+9rZtaoOnqjG2SwNIalu6YI7jIXNG7z/M/AuQLxL0SI3EGs3nAuFM2Qnvm33
	 Ly8HTNbmrsr8u1zpcFAszSeZcjVEOIvMtx9ORkWZ3bwHdyEkYJY2fZXCFbHxFnoe0qSsJ
	 lhYmAv7viOCMrdHL+ATFoFp0E71nyZiRryQ68n2Xx3F1MBXCSuhKt+ipQ/UpqeTS6ZXSq
	 vpoXeGsRIJOIyhhZWAqUPW4RxkqU02eq4mHv9hJK1XnAYfODhGxLQRhPgXD6HUj8Cew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783692;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DyXscBM6rKSqAxqGibRfOYNr5/PSL7sFuhg7DlIKEfA=;
	b=wDPrLmxew+8+xDjv8pc+OrlFXFYd3S42BF3JUo6E5ir+CJeqhxxUX24N1yAdnQO1a1Z7
	 wmzswBUv9sR+EQubtineNjoxO0phQs8/SNh6DF3f560kdU0pPWD7M4h80UEXfxOg5zAmA
	 T9NGErqVWVGRKAubrPWU+bUiCBBKlpQeEMjtfflIu1ddOJv3IF0d8D6paDslXT8RyRAN+
	 2xTQEnK+iR1cFE28nzyJoID+6Ydn6/ws5zduPRUcNCznIdP9aUr+ycI+w2QT7XgoBPls7
	 olLDblnL9QqpDiD3OhvA25lpY9iOtaH0wkWJH5Hzvx4UsnLQ/WkCScdF5fCjMmIhUmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXHHCxhR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DF606A31F;
	Sun, 15 Nov 2026 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXHHCxhR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FF61F000C4;
	Sun, 15 Nov 2026 23:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783692;
	bh=DyXscBM6rKSqAxqGibRfOYNr5/PSL7sFuhg7DlIKEfA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FXHHCxhRVx9uv5flE81n4x05x9YNK3FhbWGO0dErAF9ezUtlut4nNc86kZ7n91ziX
	 amUHKsOudXuFkomzogVCTPLZpTSOah5jqxJY9LI102749HJ/rmnkGB52frsBYz2ww3
	 vWePh7nsygehVTXbKutWknUCcsCmgrzCniqCTNQPMz76/IGdjlTacT2H9j6wL4kjJu
	 bSS+2M4lew3cCo7hUu30sYAZrsYSELQnZisAYG3J899wM1U5WUO/ON9A45s2S0A3Df
	 Ownzt2n8yC2LBDDIk+Nsjli/WH0Th/EEklDwyFk57h4N4qKdf+nqQs7GFIGdllBeXO
	 yNbJPjroKirqw==
Subject:
 Re: [PATCH net 2/3] net: dsa: motorcomm: Rewrite FDB entry on port migration
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 23:01:31 +0000
Message-ID: <179478369106.3136.17586264754426731793@kernel.org>
In-Reply-To: <20261111234110.1449602-3-mmyangfl@gmail.com>
References: <20261111234110.1449602-3-mmyangfl@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: an address that moves between a user port
  and the host (CPU port) still leaves a stale port bit in the hardware…
- [Low] yt921x_dsa_port_fdb_add() now calls dsa_bridge_ports(ds, bdev).

--

net: dsa: motorcomm: Rewrite FDB entry on port migration

This commit merges yt921x_fdb_join() and yt921x_fdb_leave() into a single
yt921x_fdb_update() helper that takes separate leave and join port masks.
yt921x_dsa_port_fdb_add() now passes the bridge port mask as the leave
mask, so ports left behind when an address migrates are dropped from the
hardware entry.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index f34f37b736249..d84e1f6dad843 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -877,10 +872,17 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
>  			const unsigned char *addr, u16 vid, struct dsa_db db)
>  {
>  	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
> +	struct dsa_port *dp = dsa_to_port(ds, port);
> +	u32 bridge_ports_mask = 0;
> +	struct net_device *bdev;
>  	int res;
>  
> +	bdev = dsa_port_bridge_dev_get(dp);
> +	if (bdev)
> +		bridge_ports_mask = dsa_bridge_ports(ds, bdev);

[Severity: Low]
Is it safe to walk every port's dp->bridge here without rtnl?

dsa_bridge_ports() does a plain load of dp->bridge, then reads
dp->bridge->dev, for each user port via dsa_port_bridge_dev_get(). This
path runs from dsa_user_switchdev_event_work() on dsa_owq, and rtnl_lock is
not held there. Before this patch, the driver only called
dsa_bridge_ports() from the bridge_join and bridge_flags paths, which hold
rtnl.

The bridge leave path looks covered. dsa_port_pre_bridge_leave() flushes
dsa_owq under rtnl before dsa_port_bridge_destroy() runs. The rollback in
dsa_port_bridge_join() in net/dsa/port.c does not flush first, though:

out_rollback:
	dsa_port_bridge_destroy(dp, br);

Say FDB work queued by an earlier static fdb add on port 1 is still running
when a bridge join on port 2 fails. The work could load dp2->bridge just
before the kfree() and then read ->dev from freed memory.

The loaded value is only compared with bdev, so the practical impact is
small. Separately, bridge_join stores to dp->bridge on another port with a
plain write. That is a data race with this reader that KCSAN can see.

DSA core already does similar lockless cross-port reads in
dsa_foreign_dev_check() and dsa_tree_offloads_bridge_dev().

Could the port's own bridge come from the db argument (db.bridge) rather
than re-reading dp->bridge outside rtnl?

> +
>  	mutex_lock(&priv->reg_lock);
> -	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
> +	res = yt921x_fdb_update(priv, addr, vid, bridge_ports_mask, BIT(port));

[Severity: High]
Does this still leave a stale port bit when an address moves between a user
port and the host?

The leave mask comes from the target port's own dp->bridge. This driver
sets ds->assisted_learning_on_cpu_port, so DSA installs host addresses by
calling .port_fdb_add() with port set to the CPU port. dp->bridge is only
set on user ports, so bdev is NULL and bridge_ports_mask is 0.

yt921x_fdb_update(priv, addr, vid, 0, BIT(cpu)) then keeps every existing
egress bit. The existing entry is already STATIC, so ctrl1 == val1 and the
full clear in yt921x_fdb_update() is skipped as well:

	ctrl1 = val1;
	if (join_ports_mask) {
		ctrl1 &= ~YT921X_FDB_IO1_STATUS_M;
		ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
		if (ctrl1 != val1)
			ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
	}
	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(join_ports_mask);

The result is still an OR-in, not a rewrite of the whole entry.

One way to reach this: take a static entry on swp1 and use bridge fdb
replace to point it at a foreign interface in the same bridge, or replace
it with a local/permanent entry. fdb_add_entry()->fdb_update_dst() only
sends RTM_NEWNEIGH, so swp1 never gets a SWITCHDEV_FDB_DEL_TO_DEVICE:

fdb_add_entry()
  fdb_update_dst()
  fdb_notify(br, fdb, RTM_NEWNEIGH, true)
    dsa_user_fdb_event()            /* host_addr = true */
      dsa_port_bridge_host_fdb_add()
        dsa_switch_host_fdb_add()
          dsa_port_do_fdb_add(cpu_dp)
            yt921x_dsa_port_fdb_add()   /* port == CPU port */

The swp1 bit then stays in a STATIC entry that DSA no longer tracks. A
later host fdb del clears only the CPU bit. Fast age through
yt921x_fdb_flush_port(..., false) does not flush static entries. Unicast
frames for that MAC keep going out of swp1.

The reverse direction seems to have the same problem.
dsa_switch_for_each_bridge_member() only iterates user ports, so the mask
from dsa_bridge_ports() never includes a CPU port. When a host address is
re-pointed to swp1, the old CPU port bit is never cleared, and frames for
that MAC also go to the CPU.

The commit message says:

  "rewrite the whole entry on add with the bridge port mask as the leave
  mask, so that ports left behind by the migration are dropped from the
  entry."

but egress bits for ports outside the bridge's user ports are kept.

The later patches in the series, up to "Use VID 0 as the unaware PVID",
don't appear to change yt921x_dsa_port_fdb_add() or yt921x_fdb_update().

For DSA_DB_BRIDGE host adds, db.bridge is a copy of *dp->bridge. Only .num
is zeroed, because fdb_isolation is not set.

Could db.bridge.dev be used to work out the bridge mask for CPU port
calls? Could the CPU ports also be added to the leave mask for user port
calls?

>  	mutex_unlock(&priv->reg_lock);
>  
>  	return res;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111234110.1449602-1-mmyangfl%40gmail.com
