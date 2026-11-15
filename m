Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783693;
	b=ryEAA+dCOZ135tHqr0PMl9b/ZiK8/YjxnxY5PtLxdYAKScMZldmS3PF6cMssoSgnNQGR
	 Sr++XQ1u29ZZAAs7Ki+JBnSd5Jr+V2Krfgrw7QbN7ub7q8rkiQu7syHwTMV5/pApOX9CZ
	 u+/Wk9yMTQajOcp7BKVRYtlqXsLWyCkhEm9uFnouzM5st4os1J7aPcMO8ISLEgcPl98xz
	 kV3+QQuXuVsdcQ/37E+CAKQ/ZSJ7zSwVWT9KRuquNSdADSyFYYa1CWt87L3FxTpI6f5Ck
	 j8X19Mcc6GAqAKHcFtNIN8X/guxoo28D11iw/LMvNh44argK9vBbaGquVmeQOQ8kQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783693;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+estSKTP5vos6ferPHC7vSoZbFx1RtdPQ+GvGUrze6E=;
	b=CQmLuWDAbNnhHlVlMmyO/OZMfGdvcRHDG7r82ZG1h+6xYqRIKe5FpGtUBn69ko+0HkS4
	 cBmYIsSi4cMpq2bIAoeUgmXnq3zRHRcEaTPMQ6ubpU9nA0ASITOnZ3JkY3lmjqRuYUhPL
	 aMDBIiyPifb29EBo4fY77KW1uOMIxFkd89ZMXzt2RaBBTIzyeXBrVi0v3ZXEFehIj3Z6E
	 phvuAr1OSnX4kTLCtzZDRPDYcAFuqSVtjctj9grG5ZaL5a30WfuWw+Rp/Qt6b9fs7/iQc
	 KTN8nh7rfqNUHwpnMPuSZhuJjueNupyqUrXcWT92yJWH2EwAUUltX5fPk4jyUHiiSYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx3hwOTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E846606A335;
	Sun, 15 Nov 2026 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx3hwOTh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B935F1F000C4;
	Sun, 15 Nov 2026 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783693;
	bh=+estSKTP5vos6ferPHC7vSoZbFx1RtdPQ+GvGUrze6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nx3hwOThc9u41gYjCnWnze4IknSu0jwtA5857xSfUL65VKEt1dbhsVSO7Xl8InBGS
	 +Yndk6v/GZvJ7B4bxbXZCUIy+zU4qwYI5XIBvJbg4PeSKnIeShEx7qc4RxSYsevxJZ
	 s27JM8hECFLb0NdfOcrGgxrUJ7x4jCLJCoS/pIDg7c7sfGZ/t8KMYZ038DDHh0n2v7
	 5xhj2nrnakPK/xNUHRB50gxoZQTqE5qPjAsXw1XmzGwr7UdhV+YXYVIR2ZPuM467Ir
	 DrXl62MRVnoRo3FUkrDNOvFpWKZQTcBgrJF90GtuNj+9q4NR1bS6tNCsy9Dt7hsoYe
	 6y0UW9pNMRP4g==
Subject:
 Re: [PATCH net 3/3] net: dsa: motorcomm: Use VID 0 as the unaware PVID
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 23:01:32 +0000
Message-ID: <179478369229.3136.1576101942763120343@kernel.org>
In-Reply-To: <20261111234110.1449602-4-mmyangfl@gmail.com>
References: <20261111234110.1449602-4-mmyangfl@gmail.com>
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

Critical: 0 · High: 1 (1) · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In the most common case the fix never takes effect.
- [Medium] A port that leaves a VLAN-aware bridge ends up standalone with
  PVID 0 instead of 4095.
- [Medium] The patch removes the setup-time write in
  yt921x_chip_setup_dsa() that set the VID 0 VLAN entry to LEARN_DIS,…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  yt921x_vlan_filtering(), yt921x_dsa_port_vlan_add() and…

--

net: dsa: motorcomm: Use VID 0 as the unaware PVID

This patch changes the PVID of VLAN-unaware bridge ports in the yt921x
driver from 4095 to 0. The goal is for the switchdev FDB entries, which are
reported with VID 0, to be hit by hardware lookups. It also removes the
setup-time programming of the VID 0 VLAN entry, and standalone ports keep
PVID 4095.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index d84e1f6dad843..5cc8a21c9d55f 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -962,7 +961,7 @@ yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
>  	bdev = dsa_port_bridge_dev_get(dp);
>  
>  	if (!bdev || !vlan_filtering)
> -		pvid = YT921X_VID_UNWARE;
> +		pvid = 0;

[Severity: High]

Does this assignment run when a standalone port joins a VLAN-unaware
bridge?

yt921x_port_setup() calls yt921x_userport_standalone(), so the port starts
at PVID 4095. The join path never touches PORTn_VLAN_CTRL:

yt921x_dsa_port_bridge_join()
  yt921x_bridge_join()
    yt921x_userport_bridge()   /* only clears YT921X_PORT_LEARN_DIS */
    yt921x_bridge()            /* only rewrites PORTn_ISOLATION */

The DSA core then calls dsa_port_vlan_filtering(dp, false) from
dsa_port_switchdev_sync_attrs(). That call returns early because the port
is already unaware, and the driver sets neither
needs_standalone_vlan_filtering nor vlan_filtering_is_global:

net/dsa/port.c:dsa_port_vlan_filtering() {
    ...
	if (dsa_port_is_vlan_filtering(dp) == vlan_filtering)
		return 0;
    ...
}

So yt921x_vlan_filtering() is never called. The replayed default_pvid VLAN
goes to yt921x_pvid_set(), which also skips the PVID write when the port is
not filtering:

	if (vlan_filtering) {
		res = yt921x_port_set_pvid(priv, port, vid);
		...
	}

In the default "ip link set lanX master br0" case with vlan_filtering=0,
does the hardware keep classifying untagged and priority-tagged frames to
VID 4095? If so, the VID 0 entries installed by yt921x_dsa_port_fdb_add()
would still never be hit, which is the problem this patch sets out to fix.

Before this patch, standalone and unaware ports both used 4095, so join did
not need a PVID write. Should yt921x_bridge_join() or
yt921x_userport_bridge() now set PVID 0 when the bridge is not VLAN
filtering?

[Severity: Medium]

The !bdev case now gets PVID 0 as well. What happens when a port leaves a
VLAN-aware bridge?

The commit message says "The standalone default of 4095 stays". However,
dsa_port_bridge_leave() runs things in this order:

dsa_port_bridge_leave()
  dsa_port_bridge_destroy()           /* dp->bridge = NULL */
  DSA_NOTIFIER_BRIDGE_LEAVE
    yt921x_bridge_leave()
      yt921x_userport_standalone()    /* PVID 4095 */
  dsa_port_switchdev_unsync_attrs()
    dsa_port_reset_vlan_filtering()
      dsa_port_vlan_filtering(dp, false)
        yt921x_vlan_filtering(priv, port, false)

At the last step dsa_port_bridge_dev_get(dp) returns NULL, so this branch
overwrites 4095 with 0. The old code wrote 4095 here.

Can the standalone port then classify into FID 0, which the VLAN-unaware
bridges now use? The comment in yt921x_chip_setup_dsa() says port
isolation is applied after the FDB lookup. A frame on the standalone port
whose DA hits a FID 0 entry for a bridged port would then be dropped by
isolation, rather than trapped to the CPU as unknown unicast.

The standalone PVID also starts to depend on history. It is 4095 after
setup or after leaving an unaware bridge, but 0 after leaving an aware
bridge. Should the !bdev case keep 4095?

>  	else
>  		br_vlan_get_pvid(bdev, &pvid);

[Severity: High]

This isn't a bug introduced by this patch, but is br_vlan_get_pvid() given
the right device here?

bdev comes from dsa_port_bridge_dev_get(dp), so it is the bridge master.
For a bridge master, br_vlan_get_pvid() returns the PVID of the bridge's
own VLAN group:

net/bridge/br_vlan.c:br_vlan_get_pvid() {
    ...
	else if (netif_is_bridge_master(dev))
		vg = br_vlan_group(netdev_priv(dev));
    ...
}

That is the host PVID, not the PVID of the port being configured. When
vlan_filtering is enabled, a port set up with pvid 10 would get the
bridge's PVID (for example 1) written into PORTn_VLAN_CTRL.CVID.

yt921x_dsa_port_vlan_add() and yt921x_dsa_port_vlan_del() make the same
comparison:

		bdev = dsa_port_bridge_dev_get(dp);
		if (bdev) {
			br_vlan_get_pvid(bdev, &pvid);
			if (pvid == vid)
				res = yt921x_pvid_clear(priv, port);
		}

Take the common sequence "bridge vlan add dev lanX vid 10 pvid untagged;
bridge vlan del dev lanX vid 1". When vid 1 is deleted, the bridge
master's PVID is still 1.

Would that call yt921x_pvid_clear(), write PVID 0 and set
CVLAN_DROP_UNTAGGED? All untagged ingress on lanX would then be dropped,
while the software bridge still thinks lanX has PVID 10.

>  	res = yt921x_port_set_pvid(priv, port, pvid);

[ ... ]

> @@ -2336,15 +2333,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
>  	if (res)
>  		return res;
>  
> -	/* Tagged VID 0 should be treated as untagged, which confuses the
> -	 * hardware a lot
> -	 */
> -	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
> -	ctrls[1] = 0;
> -	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
> -	if (res)
> -		return res;
> -

[Severity: Medium]

VID 0 is now the classification VLAN and FID for every VLAN-unaware
bridge. With this write removed, what programs the VID 0 entry?

The entry is left at hardware reset defaults for learning, membership and
untag. yt921x_dsa_port_vlan_add() and yt921x_dsa_port_vlan_del() have no
special case for VID 0, so the 8021q auto VID 0 can rewrite it.

8021q adds VID 0 through vlan_vid0_add() on NETDEV_UP when
NETIF_F_HW_VLAN_CTAG_FILTER is set. DSA sets that feature while the port
is VLAN filtering. The add reaches yt921x_vlan_add(priv, port, 0, false),
which sets the port and CPU member bits and clears UNTAG_PORTn.

When the bridge then switches to vlan_filtering=0:

dsa_user_manage_vlan_filtering(false)
  vlan_for_each(user, dsa_user_clear_vlan, user)
    yt921x_dsa_port_vlan_del(vid 0)
      yt921x_vlan_del(priv, port, 0)

and yt921x_vlan_del() does:

	masks[0] = YT921X_VLAN_CTRLa_PORTn(port);
	masks[1] = YT921X_VLAN_CTRLb_UNTAG_PORTn(port);

	return yt921x_reg64_clear_bits(priv, YT921X_VLANn_CTRL(vid), masks);

Does this remove the port from the VLAN entry that the unaware bridge now
forwards in?

VLAN-aware ports with no PVID also classify to VID 0, through
yt921x_pvid_clear() or yt921x_vlan_filtering() with pvid 0. LEARN_DIS is no
longer set on VID 0. Can frames accepted there, such as priority-tagged
frames if CVLAN_DROP_UNTAGGED does not cover them, be learnt into the FID 0
table that the unaware bridges use?

The comment in yt921x_dsa_port_vlan_add() also looks stale for VID 0:

	/* CPU port is supposed to be a member of every VLAN; see
	 * yt921x_vlan_add() and yt921x_port_setup()
	 */

Apart from 8021q, nothing adds the CPU port to VLAN 0 any more.

>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111234110.1449602-1-mmyangfl%40gmail.com
