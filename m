Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855356;
	b=aHy0nQLpceulJ0hzKN8k9vBy5LxXVq+2vZ5Uiw9kqHCbPjw7fEbalRNj30LWm/fxHbcH
	 nZ7yWSea6LwMxgcGj8qiPDqC+Gzshxo7t1lllnMJFFPIWJAJKvwWEKMPKzSty+5K6VQuC
	 l9CTTfD8i1g65w0PDUjmihSyCIrW3nG9HxjBuN5UMcsCko35pcWTqlFrgXFJKEypRa2OK
	 t7dDdgA4NarOpOipcm7lCZTlbxjrA2tz5n6hl/MdW13BQIwA6xj//s1Qm5WjyPR79qR30
	 iBJ9VT/7x+hLyIQq4OkJlwNIVOAK585Qsz2JlJxWiZrZJPR4irfz22EL6zFsNmCPdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855356;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3MwGTia29hoI59AYQaU2Ez4dH29GW4k/UQmwogH8ApU=;
	b=gK7IjyXl7UhdxMlBSqo0LoXYlv3kbV9PSuV8LYtITauKkVdy55DZb6XborOH668S8TI8
	 bEsBRxes0yCkT6XdpSnYBwXy34RMFAP/B01gpjgUBoboefmdvLcgyahWL86eb3n2nLuGp
	 JDxfQzVn46nS3LR2pAlGEm1Nk1A7mlMu87+Hlsw9uay5f4ocSpGo2y9zHFLQKCckEa8Y9
	 N6HgXe6HtGz5oVmIQ4/qqPU7U9+Acq1c9lFnnV40wBremMmwImUGvwSeqe1CITKjGhWeF
	 4ZAm8Ope5EIXilb42kfT1IkT110Nmhgl+PeMU8YPKorqCbtYN8O4xxondI4HrbhXoiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI5Ywpeq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A4606A322;
	Mon, 16 Nov 2026 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI5Ywpeq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA571F000C4;
	Mon, 16 Nov 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855356;
	bh=3MwGTia29hoI59AYQaU2Ez4dH29GW4k/UQmwogH8ApU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RI5YwpeqRU57kQQWAFDUJRI5bEo4fI8+rmCJLhGn9A3llbMJsF4YoKFvGsBkr0yBL
	 cqrd2c0RNIirTEO6PINH2Lo4/35mrVpFmhWBLxVXikHrWvlaS7bLaV1U/GOwQdtigv
	 s750fDUw1UdKNtLAQ3CIyFUB+2Fs6GrsRDG2EgehBvuANEdrQVgEJ+wByoa5Y+cHfm
	 AbePJMoj4FrMX3Vfybceg/YA5m+iitTxs8t5Y5kmscYEXzMivISIhqepF1/20FhRQB
	 Vu5KGLxdA7G++XQeEghBbwopbceLVJjE2SPzu3KI43PH7SDBhmdkM6Pa+mt+N0nUNM
	 NkU/wGwqOyZ1Q==
Subject: Re: [PATCH net-next v10 07/12] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 16 Nov 2026 18:55:54 +0000
Message-ID: <179485535493.3136.1068069637622995619@kernel.org>
In-Reply-To: <915a9103-82e6-4504-8d6e-3d12c4e7af1a@yahoo.com>
References: <915a9103-82e6-4504-8d6e-3d12c4e7af1a@yahoo.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On family D, the per-VID IVL_EN bit (CVLAN word 1, bit 3) is
  set only inside rtl8365mb_vlan_4k_port_set()…

--

net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

This adds two-word pack/unpack helpers for the family D CVLAN (4K VLAN)
table entry, rtl8365mb_d_vlan_4k_read() and rtl8365mb_d_vlan_4k_write().
It also changes rtl8365mb_vlan_4k_port_set() so that on family D, IVL_EN
is set only while some user port has VLAN filtering enabled. Family C
keeps IVL always on.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index 566c6bc1449af..bf1a6a9916114 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> @@ -314,7 +391,21 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
>  		vlan4k.untag |= BIT(port);
>  	else
>  		vlan4k.untag &= ~BIT(port);
> -	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
> +
> +	/* Family C always uses IVL. On family D, IVL is on while any user
> +	 * port has VLAN filtering enabled, so that static entries match
> +	 * learned ones in a VLAN-unaware bridge (SVL).
> +	 */
> +	if (!rtl8365mb_is_d(priv)) {
> +		vlan4k.ivl_en = true;
> +	} else {
> +		struct dsa_port *dp;
> +
> +		vlan4k.ivl_en = false;
> +		dsa_switch_for_each_user_port(dp, ds)
> +			if (dsa_port_is_vlan_filtering(dp))
> +				vlan4k.ivl_en = true;
> +	}

[Severity: Medium]
Can the per-VID IVL_EN bit go stale here when vlan_filtering changes?

The bit is only computed when a VLAN is added or deleted.
rtl8365mb_port_vlan_filtering() in rtl8365mb_main.c changes ingress
filtering, the transparent masks, the frame filter and the egress mode.
It never rewrites the 4K table entries:

rtl8365mb_port_vlan_filtering() {
    ...
	ret = rtl8365mb_port_set_ingress_filtering(priv, port, vlan_filtering);
    ...
		ret = rtl8365mb_port_set_transparent(priv, port, dp->index,
						     !vlan_filtering);
    ...
}

rtl8365mb_setup() sets ds->configure_vlan_while_not_filtering = true, so
VLANs are programmed while the bridge is still VLAN-unaware. Take a
common sequence:

  ip link add br0 type bridge
  ip link set lanX master br0
  ip link set br0 type bridge vlan_filtering 1

VID 1 is written with IVL_EN=0 and keeps it after filtering is turned
on. VIDs added after that get IVL_EN=1, so the table ends up with a mix
of IVL and SVL VLANs inside one VLAN-aware bridge.

The reverse also happens. If filtering is turned off, the VLANs stay in
IVL mode. Later in the series, rtl8365mb_d_l2_uc_to_data() and
rtl8365mb_d_l2_mc_to_data() key vid 0 static entries with SVL (FID 0):

	bool ivl = uc->key.ivl && uc->key.vid;
	u16 id = ivl ? uc->key.vid : uc->key.fid;

In both cases, would static FDB/MDB entries and learned entries end up
with different keys? The commit message says this logic exists to
prevent that.

The bridge join ordering seems to add a further case. In
dsa_port_bridge_join(), switchdev_bridge_port_offload() replays the
bridge VLANs through br_switchdev_vlan_replay() before
dsa_port_switchdev_sync_attrs() sets dp->vlan_filtering. When the first
port joins a bridge that already filters, are the replayed VLANs written
with IVL_EN=0?

The policy is also switch-wide. With one VLAN-aware bridge and one
VLAN-unaware bridge on the same switch, the unaware bridge's VIDs would
be forced to IVL.

The commit message says:

  The stored IVL_EN is refreshed on the next port_vlan_add/del for the
  VID, not on a vlan_filtering change.

Nothing in the driver triggers that refresh, so the final hardware state
depends on the order of configuration steps. Should
rtl8365mb_port_vlan_filtering(), or the family D join path, walk the
existing 4K entries and rewrite IVL_EN?

This is still present at the end of the series, where the family D info
is wired up in "net: dsa: realtek: rtl8365mb: add support for
RTL8367S-VB".

>  
>  	ret = fi->vlan_4k_write(priv, &vlan4k);
>  	if (ret) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d9da17af-f49e-4878-a8dd-59a8919e6930%40yahoo.com
