Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922988;
	b=zbrJUcebHW414TvmQiXqMUL4zIc5FIulo+SiCypV/DKwSbWD37G4j5uuYOP8y9d8cFml
	 q1jbLcIFGLUR0JAPr3g9ef2alk9ZHJBX2i0/bFa7HjcwHaT7XHZC3s/fdMbNjZIE8Aa2R
	 WXfnO2Sr2Rhi2cbmn0WvFzdeUiNsbEA2R1ehKePbtRCyRusSvbyn/XCKAp99JRowbxPYZ
	 dWmAEK1iFwP02TmE1AE8cIlWwQu9yudovosL2QYBvVK4Q/fkFGkV6PsSyP68SvKnC0tw+
	 xYi6UAFGCjh+ArGLxby6VbEAv5X3BDt6vKH9/exBbTJMvbd5tEz/XKtOSv6TTOIK6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922988;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sHQ6ietn6+j1gEyL6k+OIghfZBL1Rw76ypQ5bVWORHk=;
	b=avMv8ekaYcxma5FfOqydku7AlRKyCJPyZf01odQwN9CBF73SgFXwrRX1LPM4pWlLj2M2
	 SU9rpomj3FHQo4RWS8S2OpwkpsAC+XfmNJS5U+5BQv8+EqtzZFh37POYen7jo4/0w5tFK
	 jHjxYdKDHw0jwrXMMBwDJuTNUB2n5ydm7tsPSxLHY8R3ppDlB3LLvzcKwh0pOhUZZWAcM
	 42bSL3KGuv8jiAQn3WkWxMMIxOUMwKfRnLjgAfTK5YOPDISmmGpJQZz9UoabR0c3i4JXb
	 sDi+ELBfNFiHhSporHX/GkM0kGQ5latP/gJJjIKt5/q/mE2UCIagoiIY/uOOV51OjWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiZ9xHp1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90614606A31C;
	Tue, 17 Nov 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiZ9xHp1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90251F000C4;
	Tue, 17 Nov 2026 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922988;
	bh=sHQ6ietn6+j1gEyL6k+OIghfZBL1Rw76ypQ5bVWORHk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EiZ9xHp1jTJ64xUFy5wObWcLzGGeU3u1g2uPSemC3QkIBhwVn8xXo4wcAyCjYORYw
	 d1xMqLkehBRfaLjqa8h9jRDUYPVLIuWzf9xcW/XyinfKzDGjuvSclPxE4NKjGZv6xz
	 sYP3lXq7SYKuCRRVyEr3BG3qpWHIjJofImSqSidiU+fAtjPUvKZk3+mqMn7KY1IeoV
	 U/e3uqlpjdfMIAzlqiVFwJQIN3MHgVg+gU6TaUsgGZdsgSVVvtXxoWhCnKgqEXlDY6
	 28Z4tRYbNtKaIve3QQIYfQUCPiAKwfhjsjsnV+a2C4GKMXqGZMRrmPuQD90HBUPuKi
	 TbBEVsP+hzhFw==
Subject: Re: [PATCH] bonding: unbind 802.3ad slaves on enslave failure
From: netdev-bot+sashiko@kernel.org
To: ljp1205831794@gmail.com
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 sfeldma@cumulusnetworks.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
Date: Tue, 17 Nov 2026 13:43:07 +0000
Message-ID: <179492298736.3136.7707420195276794847@kernel.org>
In-Reply-To: <20261113130454.63032-1-ljp1205831794@gmail.com>
References: <20261113130454.63032-1-ljp1205831794@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: a failed bond_master_upper_dev_link()
  skips the new unbind and leaves the same use-after-free reachable.
- [High] The new bond_3ad_unbind_slave() call can cause a NULL pointer
  dereference in the RX softirq path.
- [Medium] The new caller breaks bond_3ad_unbind_slave()'s 'caller
  updates array' contract.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the same
  publish-then-fail window leaves TLB/ALB hash entries pointing at the…

--

bonding: unbind 802.3ad slaves on enslave failure

This commit adds a bond_3ad_unbind_slave() call at the err_upper_unlink
label of bond_enslave() in 802.3ad mode. If the state machine attached the
new slave's port to a LAG during enslavement, the port is now detached
before the slave is freed. This addresses a KASAN slab-use-after-free in
ad_agg_selection_logic() seen when bond_sysfs_slave_add() fails.

> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index e9f5e753f6770..60cc9a6a4fc7d 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2355,6 +2355,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  	bond_sysfs_slave_del(new_slave);
>  
>  err_upper_unlink:
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);

[Severity: High]
Can this unbind race with the 802.3ad receive path and cause a NULL pointer
dereference in softirq context?

At err_upper_unlink, bond_handle_frame() is still registered as the
rx_handler for slave_dev. netdev_rx_handler_unregister() drains in-flight
handlers through synchronize_net(), but it only runs later, at
err_unregister.

bond_3ad_rx_indication() checks port->slave without holding mode_lock:

drivers/net/bonding/bond_3ad.c:bond_3ad_rx_indication() {
    ...
	port = &(SLAVE_AD_INFO(slave)->port);
	if (!port->slave) {
		...
		return ret;
	}
    ...
		spin_lock(&slave->bond->mode_lock);
		ad_rx_machine(lacpdu, port);
    ...
			ad_marker_info_received(marker, port);
    ...
}

Both callees dereference port->slave right away:

drivers/net/bonding/bond_3ad.c:ad_rx_machine() {
    ...
	if (lacpdu) {
		atomic64_inc(&SLAVE_AD_INFO(port->slave)->stats.lacpdu_rx);
    ...
}

drivers/net/bonding/bond_3ad.c:ad_marker_info_received() {
    ...
	atomic64_inc(&SLAVE_AD_INFO(port->slave)->stats.marker_rx);
    ...
}

bond_3ad_unbind_slave() sets port->slave = NULL under mode_lock. For a
LACPDU, the RX CPU can pass the check, spin on mode_lock while the unbind
runs, and then call ad_rx_machine() after port->slave is already NULL. The
marker handlers don't take mode_lock at all.

__bond_release_one() avoids this by draining RX first:

	/* unregister rx_handler early so bond_handle_frame wouldn't be called
	 * for this slave anymore.
	 */
	netdev_rx_handler_unregister(slave_dev);

	if (BOND_MODE(bond) == BOND_MODE_8023AD)
		bond_3ad_unbind_slave(slave);

The commit message says this "preserves the invalidate-drain-free ordering
used by normal release". Here, though, port->slave is cleared before the
drain. Should the unbind come after netdev_rx_handler_unregister()?

One deterministic way to reach this rollback is the XDP check in
bond_enslave(). With an XDP program on the bond and one already loaded on
the slave, the code jumps to err_dec_slave_cnt and falls through to
err_upper_unlink.

[Severity: Medium]
Does this rollback leave bond->usable_slaves stale?

bond_3ad_unbind_slave() discards the update_slave_arr result from
ad_agg_selection_logic() and expects the caller to rebuild the array:

	bool dummy_slave_update; /* Ignore this value as caller updates array */

__bond_release_one() does this by calling bond_update_slave_arr() after the
unbind and unlink. In bond_enslave(), bond_update_slave_arr() is only called
on the success path, so nothing in the rollback rebuilds the array.

The unbind can reselect the active aggregator, for example when the new
port was already in the active aggregator. In that case
ad_agg_selection_logic() can disable the old aggregator's ports and enable
the new one's.

Wouldn't bond_3ad_xor_xmit() then keep using the old usable_slaves until
some other event forces a rebuild?

>  	bond_upper_dev_unlink(bond, new_slave);
>  
>  err_unregister:

[Severity: High]
Should the bond_master_upper_dev_link() failure path also unbind the port?

bond_3ad_bind_slave() runs well before the upper link, but a failure in the
upper link jumps past the new unbind:

	res = bond_master_upper_dev_link(bond, new_slave, extack);
	if (res) {
		slave_dbg(bond_dev, slave_dev, "Error %d calling bond_master_upper_dev_link\n", res);
		goto err_unregister;
	}

The slave can be visible to the 3ad state machine during that failed call.
__netdev_upper_dev_link() first calls
__netdev_adjacent_dev_link_neighbour(), which adds slave_dev to the list
walked by bond_for_each_slave_rcu(). Only after that does it send
NETDEV_CHANGEUPPER, and if a notifier fails it rolls the adjacency back.

CHANGEUPPER handlers can fail, and they can sleep. For example,
dsa_user_changeupper() -> dsa_port_lag_join() can return -ENOMEM from
dsa_port_lag_create(), a driver error from DSA_NOTIFIER_LAG_JOIN, or an
error from dsa_port_bridge_join().

bond_3ad_state_machine_handler() only takes mode_lock and RCU. During that
window it can run ad_port_selection_logic() on the new port and link it into
another live slave's aggregator. The rollback then reaches
kobject_put(&new_slave->kobj) and frees ad_info while lag_ports or
port->aggregator still point into it.

Isn't that the same use-after-free in ad_agg_selection_logic() that this
commit fixes for the sysfs failure?

The commit message says "earlier unpublished failures are unchanged", but
this failure publishes the slave and then rolls it back. Could the unbind
cover every failure after bond_3ad_bind_slave(), placed after the
rx_handler drain?

[Severity: High]
This isn't a bug introduced by this patch, but can the same
publish-then-fail window leave TLB/ALB hash entries pointing at the freed
slave?

In balance-tlb/alb mode, bond_enslave() calls bond_alb_init_slave() and
bond_set_active_slave(new_slave). Once the upper link publishes the slave,
bond_slave_can_tx(new_slave) can be true, and a concurrent transmit can
store the slave in the TX hash table:

bond_xmit_tlb_slave_get()
  tlb_choose_channel()
    __tlb_choose_channel()
      tlb_get_least_loaded_slave()

drivers/net/bonding/bond_alb.c:__tlb_choose_channel() {
    ...
	assigned_slave = hash_table[hash_index].tx_slave;
	if (!assigned_slave) {
		assigned_slave = tlb_get_least_loaded_slave(bond);

		if (assigned_slave) {
			...
			hash_table[hash_index].tx_slave = assigned_slave;
    ...
}

Normal release clears these references in bond_alb_deinit_slave(), through
tlb_clear_slave() and rlb_clear_slave(). The enslave rollback does nothing
equivalent before kobject_put(&new_slave->kobj) frees the slave.
bond_alb_monitor() only rebalances slaves that are still on the list.

A later packet with the same hash would get the freed slave back from
__tlb_choose_channel(). bond_do_alb_xmit() would then use it:

	if (tx_slave && bond_slave_can_tx(tx_slave)) {
		...
		return bond_dev_queue_xmit(bond, skb, tx_slave->dev);

In TLB/ALB, two failures can happen after the slave is published:
bond_sysfs_slave_add() failing (goto err_upper_unlink) and a failing
NETDEV_CHANGEUPPER notifier (goto err_unregister). Should the rollback also
call bond_alb_deinit_slave() for these modes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113130454.63032-1-ljp1205831794%40gmail.com
