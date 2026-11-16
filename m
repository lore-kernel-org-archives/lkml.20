Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855361;
	b=H8gCQJifN78O/eHuYqArHRlI++HB1TWcVUsGvIqUYYY3H7x0DwXIgRMv7kr5HkoWIrP7
	 Q9E9TRDYc7DR09yrHsyp8tphyKodIxHenkunYVTJ2ilQQ7n3IoOLuHTJVoZG0bSL9CBY7
	 gY4TXI6yMPB/p3ljUvV/yaUdXRdgkaeTAA2WN0ipn9rz5TT2N+Fy4/wbc3/l/bPJdHsoL
	 S1wPSwhfXpJ9MLC2VkAYMnZaL/keHGAA16b9XsxGmPelaG0VGwShykmwQC/RsTr/W/GzO
	 HyMDIWZ8Yk6+W1DApNt7zpWmBGXQp7qbY5UTg1uv7SOqqRDuqBcQmlZ6GsxT9ZHP0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855361;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KB1UFy4sY9Lka5h6bjZA4GkBoUQ1PdeF8B3DGeTCYJY=;
	b=TXnGHQRdq9OM6Ln7hkqAXHorpGh4iYyDHDJyZFhxtBcVldBcXqcPh4NuAajJlJZ+XhmR
	 UnDoGkH+OslW4U1SejTSJN/m6fsOzsO6OH/+pE5H1xsZnedYeOraZxHKFHV7ff3pGV0OH
	 bRk4avuvruzwmwEJrWdXa/1gBxBbQP1MNbRKRMoY9h9oGEoknYa8EM+uJa4yNbqmmgMez
	 fviu7BPhpza1fa1PnmpzBXd8buVxVuihyRzJ5Na/PfznuhoKr1BjTN6Gkw500Ie4YjqVu
	 zH18zXEm76s2TzDmPMJACRjN64DyGWhGjvp3ub8ydqPNPkUmnX0WwKujmX+EVKGe/iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHwmrIw4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E59606A336;
	Mon, 16 Nov 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHwmrIw4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FCC1F00925;
	Mon, 16 Nov 2026 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855361;
	bh=KB1UFy4sY9Lka5h6bjZA4GkBoUQ1PdeF8B3DGeTCYJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KHwmrIw4AJ8BoC5ejVsJG3tt+bWf2n7cFkf52ty9QR+3kRjvht+2YRN2hF0QSYLBq
	 YA3Do4jc31gxLokpaA/DZvdKyoTTCX1AyA9R8heuHLz164eC8OTHUYzPTO8MYzTUta
	 7tfFxajrH9FDgre68iLnT/3/sdkCDHzPbBw37eXUek21ZU95/PIAqh6zN512qTp42g
	 y++PbP0vPtaO4lhkFfVUwsDKL3lZxUKHOTABBFjrH8XmRgBoqg2QCWx2hcnmtYIgr0
	 E4Ly0ZLXJzXY1oK/o2O5anrCWhKhaFSShTd8wL23FHQF6RsduzwCrWAT20129qgQnh
	 PDL3LhHtTF1hQ==
Subject: Re: [PATCH net-next v10 11/12] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 16 Nov 2026 18:55:59 +0000
Message-ID: <179485535983.3136.18038505829775887634@kernel.org>
In-Reply-To: <ddc3b324-fe93-4c1d-a4da-558c0d6e88f1@yahoo.com>
References: <ddc3b324-fe93-4c1d-a4da-558c0d6e88f1@yahoo.com>
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

Critical: 0 · High: 2 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On family D, the new L2 serializers pick the LUT key with a rule
  that does not match the hardware.
- [High] On family D this patch makes rtl8365mb_port_set_efid() a no-op
  (rtl8365mb_main.c:2666), leaves ds->fdb_isolation false, and still…
- [Low] On family D, rtl8365mb_setup() sets ds->max_num_bridges = 1 to
  cap offload at one bridge, and the in-tree comment says "offload only…

--

net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

This adds family D (RTL8367S-VB) L2 entry serializers and table access
differences, and makes the per-port EFID write a no-op on family D. It
also adds a LUT init step and limits family D to one offloaded bridge
without fdb_isolation.

Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
> index cd5b333932bee..14acc84d35211 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c

[ ... ]

> @@ -240,6 +255,76 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,

[ ... ]

> +void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
> +			       u16 *data)
> +{
> +	/* A VLAN-unaware bridge reaches us with VID 0. The chip learns such
> +	 * traffic in SVL (IVL=0, FID=0), so use the same key here, otherwise
> +	 * the static entry never matches the learned one. Only a real VID
> +	 * selects IVL.
> +	 */
> +	bool ivl = uc->key.ivl && uc->key.vid;

[Severity: High]
Does this rule match the key the chip uses when it learns? The chip
picks IVL or SVL from the IVL_EN bit of the classified VID's VLAN4K
entry. On family D that bit is only written in
rtl8365mb_vlan_4k_port_set():

	} else {
		struct dsa_port *dp;

		vlan4k.ivl_en = false;
		dsa_switch_for_each_user_port(dp, ds)
			if (dsa_port_is_vlan_filtering(dp))
				vlan4k.ivl_en = true;
	}

That value is a snapshot from the last time the VID's membership was
written. rtl8365mb_port_vlan_filtering() does not rewrite existing VLAN4K
entries, so IVL_EN and the vid != 0 rule used here can drift apart.

Three cases where they seem to disagree:

(a) The bridge is VLAN-aware and then vlan_filtering is set to 0. VID 1
keeps IVL_EN=1, so the chip keeps learning untagged traffic as IVL/VID 1.
DSA now passes vid 0, which is serialized here as SVL/FID 0. Static FDB
entries, host and assisted-learning entries on the CPU port, and MDB
entries then get a different key than the learned one. That is the same
VLAN-unaware bridge failure the commit message says is fixed.

(b) The bridge is VLAN-unaware and then vlan_filtering is set to 1. VID 1
stays SVL/FID 0, but DSA programs vid 1 with IVL set.

(c) A port joins a bridge that is already VLAN-aware.
dsa_port_bridge_join() replays VLANs through
switchdev_bridge_port_offload() before dsa_port_switchdev_sync_attrs()
sets dp->vlan_filtering. If no other user port is filtering yet, those
VIDs are written with IVL_EN=0. With a single switch port in the bridge,
nothing rewrites them later.

In each case static, host and MDB entries would be ignored. Traffic to
the bridge MAC floods, MDB entries do not limit flooding, and fdb_dump
reports wrong VIDs.

The earlier "set and get vlan 4k for family D" patch already says IVL_EN
"is refreshed on the next port_vlan_add/del for the VID, not on a
vlan_filtering change".

Could the key be derived from the VID's VLAN4K IVL_EN/FID, or could
IVL_EN be refreshed on every vlan_filtering change?

> +	u16 id = ivl ? uc->key.vid : uc->key.fid;

[ ... ]

> +void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
> +			       u16 *data)
> +{
> +	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL. */
> +	bool ivl = mc->key.ivl && mc->key.vid;

The same question applies here. MDB entries use the same vid != 0 rule,
so they would also miss whenever IVL_EN for the VID does not match.

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index bcddad0c25a24..ebc7d19fedd0a 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -2650,6 +2662,10 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
>  static int rtl8365mb_port_set_efid(struct realtek_priv *priv, int port,
>  				   u32 efid)
>  {
> +	/* Family D has no EFID; see RTL8365MB_D_LUT_CFG2_REG. */
> +	if (rtl8365mb_is_d(priv))
> +		return 0;
> +

[Severity: High]
Without EFID and without fdb_isolation, one bridge is still offloaded
with hardware learning. Standalone ports, ports of software-bridged
bridges and the offloaded VLAN-unaware bridge then all share SVL FID 0.
Can a MAC learned on a bridge port take over DA lookups for frames that
enter a standalone port?

  frame with SA=X enters a LAN bridge port
    -> X is learned in FID 0 on that LAN port
  frame with DA=X enters a standalone port (e.g. WAN)
    -> LUT hit points at the LAN port
    -> the standalone port's isolation mask (CPU only) drops it

The commit message describes this mechanism, and the tester saw it.

Since fdb_isolation is false, DSA installs no host entries for the MACs
of standalone ports. So nothing pins, for example, a distinct WAN
interface MAC to the CPU port.

Any host on an offloaded LAN port could forge a source MAC, such as the
router's WAN MAC or the MAC of a host behind a standalone port, and keep
refreshing it. Traffic for that MAC arriving on the standalone port would
then be dropped until the entry ages out.

Documentation/networking/dsa/dsa.rst expects standalone ports to behave
like independent NICs. It only lets them share a database because their
entries always point to the CPU port.

Would it work to give the offloaded bridge's VLANs a private FID (the
family D VLAN4K entry has a FID field)? Disabling hardware learning on
family D bridge ports, or not offloading VLAN-unaware bridges, would be
other options.

[ ... ]

> @@ -3600,9 +3642,16 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>  		goto out_teardown_irq;
>  
>  	ds->assisted_learning_on_cpu_port = true;
> -	ds->fdb_isolation = true;
> -	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
> -	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	if (!rtl8365mb_is_d(priv)) {
> +		ds->fdb_isolation = true;
> +		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
> +		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	} else {
> +		/* No EFID, so bridges cannot be told apart in the LUT: offload
> +		 * only one, others fall back to software forwarding.
> +		 */
> +		ds->max_num_bridges = 1;

[Severity: Low]
Does max_num_bridges = 1 really guarantee that one bridge is offloaded on
this switch? DSA takes bridge numbers from a system-wide bitmap, not a
per-switch one. In dsa_bridge_num_get():

		bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
						DSA_MAX_NUM_OFFLOADING_BRIDGES,
						1);
		if (bridge_num > max)
			return 0;

and in dsa_port_bridge_create():

	bridge->num = dsa_bridge_num_get(br, ds->max_num_bridges);
	if (ds->max_num_bridges && !bridge->num) {
		NL_SET_ERR_MSG_MOD(extack,
				   "Range of offloadable bridges exceeded");
		kfree(bridge);
		return -EOPNOTSUPP;
	}

If another DSA switch in the system already holds bridge number 1, the
first and only bridge on this family D switch gets number 2. It would
then not be offloaded at all and would fall back to software forwarding.

Since fdb_isolation is false, db.bridge.num is zeroed in FDB/MDB
notifications anyway, so the number only acts as this cap. Should the
comment be reworded, or is a different way of limiting offload needed?

> +	}
>  
>  	ds->configure_vlan_while_not_filtering = true;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d9da17af-f49e-4878-a8dd-59a8919e6930%40yahoo.com
