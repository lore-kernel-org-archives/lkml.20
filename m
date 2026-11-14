Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648519;
	b=GCO88+5XVgGGX0Sg39O0Y6AW1XfNtVw4vrlzCGMl4rOrMn9+iR35w0T2C0jhAfJ4BjjC
	 ZuUI+FMv2Nl3uozR8aTinGSbQ5AZT3FAuhnHGyaE6AMnbbKQc26Rd74Ai3DxBh2z1K0FJ
	 ep5KjhZ80WgdTBJyLk/rhusIxlqt3h56h7QyQ/bwDaYaWyZp4acnq1/Irew7vEZs/hRsm
	 FTtM0JBM/XYrpbCgQO3LRPgJpBEbHPBaOgLfIYI0RT87gUZhuQwUB+vgD0AUgeed+Hxzd
	 oLe3I5C8WTyLundw1CRhVh5Y4+nwRW6HZKRfukQefIPlwPKzP9Z48qr+OB2LEyFz2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648519;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xrLvPdJEUUqaQ/n89kUTd0s6jU/al9JGuEDtjAUCSLM=;
	b=LBWa0BmaxqIDOX+1PtOVNyrazu3NtiSfB8CT9G9fpOk6hbuIaJ7E7fzuDLwEyMGkCKOY
	 bHF2HE9XJLLf/EfY8q6TPOMo1A74vnNOsjqV5i/C0uGefKyDPGq3nkrjRRbtucxa0TQOn
	 hRD555+4IyPwHzarWWfapNPBO3UpgUDVz+cbAp7xKYO/f4bhYBu9w1bakbvhEdrgUItWT
	 j5WtdtfHCD8r4dDv8pVnCScOAgaf7+j63AeiTD5+usrCdQccbXZxLc7ZbIxN0+Vnxzvaw
	 nwOM9CitRqKVv73Bilvqc2aHRZOo/rJcFCrHNjIbfptr9YE53+D6Hg+kOBFj8Mn71+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKwCspk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A460A3838;
	Sat, 14 Nov 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKwCspk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C149F1F000C4;
	Sat, 14 Nov 2026 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648519;
	bh=xrLvPdJEUUqaQ/n89kUTd0s6jU/al9JGuEDtjAUCSLM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cKwCspk2cK546Np7fu/oTXn/wNK38jyDkkggnMcmHgRYMPR5qfdlLswvAD/nOKnbh
	 XlSA52QozaZHQD4+ZqNJU3SYtCNSknIHeH91Ek125k6JNYw/aGEcnXEBWA7P8yvaVd
	 4XA33Kum3IC3Q/AKdgh2hMy8OTCU/YVt2Hd4FGiulWECqTMzYfBI7Kz88arh1aJia+
	 0tommdnutJcXZU1LzM7WWOy9zC2vFbHE7xzVUraGAFSmkgQ1m5yMQ3v4axvaYe1zYF
	 Cnex4YyufgE8aAE4wZaeHzxaB9GJZ9SYU7jj8VQDWJzKCCBsKsGRIcnFHKEbipdF0z
	 0JsdwGRcFz7rw==
Subject: Re: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:38 +0000
Message-ID: <179464851836.2199510.10154643847175029122@kernel.org>
In-Reply-To: <20261110032416.16968-11-nic_swsd@realtek.com>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] set_carrier() (drivers/net/usb/r8152.c:7468) was not converted
  to the new error contract.
- [Medium] The commit message says rtl8152_get_link_ksettings() now
  propagates the error.
- [Medium] rtl8153_in_nway() (line 7431) now returns false when the
  OCP_PHY_STATE read fails, which means 'the PHY is not in…
- [Medium] r8152: negative errnos returned by read_mii_word() to MII
  library
- [Low] rtl8152_set_speed() (line 6835) can now return early on a failed
  PHY access, after it has already written some advertisement registers…

--

r8152: add TGPHY register access for RTL8157 and RTL8159

This patch adds a TGPHY command channel for PHY register access on RTL8157
and RTL8159. Access goes through new rtl_ops.phy_read/phy_write hooks.
A TGPHY access can fail, so the PHY accessors and their helpers now return
int, and a set of callers is updated to act on errors.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index fad4473caf2a4..703ec5483778b 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -1669,16 +1680,33 @@ static void ocp_reg_write(struct r8152 *tp, u16 addr, u16 data)

[ ... ]

> -static inline int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
> +static int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
>  {
> -	return ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2);
> +	u16 data;
> +	int ret;
> +
> +	ret = ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2, &data);
> +
> +	return ret < 0 ? ret : data;
>  }

[Severity: Medium]
The added comment says a failed read must not reach the MII library
as an errno, but the two early returns at the top of read_mii_word()
still pass one on. The RTL8152_INACCESSIBLE check returns -ENODEV and
the phy_id check returns -EINVAL. Neither goes through the new
ret < 0 ? 0 : ret conversion. Those returns are not new, but with this
patch they no longer match the stated contract.

-ENODEV is 0xffffffed, which has BMCR_ANENABLE, BMSR_LSTATUS and
BMSR_ANEGCOMPLETE set. -EINVAL is 0xffffffea, which also has
BMCR_ANENABLE set. The MII library always passes tp->mii.phy_id,
though, so the -EINVAL path is mostly theoretical.

mii_nway_restart() tests BMCR_ANENABLE directly on the mdio_read()
result. Suppose RTL8152_INACCESSIBLE is set when rtl8152_nway_reset()
or rtl_ethtool_set_eee() calls it. The -ENODEV then reads as autoneg
enabled, write_mii_word() drops the restart without reporting it, and
mii_nway_restart() returns 0.

Neither caller checks the flag first. On RTL8157/RTL8159,
r8152_set_eee() can latch it through rtl_eee_enable() right before the
mii_nway_restart() call. Userspace is then told the renegotiation
succeeded on a device that is gone.

In mii_ethtool_get_link_ksettings() the two conventions get mixed. The
TGPHY access that latches the flag makes the MII_BMCR read return 0.
The MII_BMSR, MII_CTRL1000, MII_STAT1000 and MII_ADVERTISE reads after
it hit the early return and come back as 0xffed.

Should these early returns also return 0, so read_mii_word() follows
its own comment? Or, since a 0 BMCR has problems of its own, would it
be better for the callers of the MII library to check
RTL8152_INACCESSIBLE before calling into it?

[Severity: High]
With this change, r8152_mdio_read() can return a negative errno on
RTL8157/RTL8159. The failure comes from
ocp_reg_read()->r8157_phy_read()->rtl_tgphy_access().

Was set_carrier() meant to be converted too? It still treats the return
value as register content:

drivers/net/usb/r8152.c:set_carrier() {
	if (r8152_mdio_read(tp, MII_BMSR) & BMSR_LSTATUS) {
		if (!netif_carrier_ok(netdev)) {
			tp->rtl_ops.enable(tp);
			...
			netif_carrier_on(netdev);
			rtl_start_rx(tp);
	...
	} else {
		if (netif_carrier_ok(netdev)) {
			netif_carrier_off(netdev);
			...
			tp->rtl_ops.disable(tp);
	...
		if (rtl8152_get_speed(tp) & LINK_STATUS) {
			set_bit(RTL8152_LINK_CHG, &tp->flags);
			schedule_delayed_work(&tp->schedule, 0);
		}
	}
}

-ENODEV is 0xffffffed, which has BMSR_LSTATUS (bit 2) set. If the
device is gone and the carrier is off, set_carrier() would see link up.
It would then call rtl_ops.enable(), netif_carrier_on() and
rtl_start_rx().

-ETIMEDOUT is 0xffffff92, which has BMSR_LSTATUS clear. One TGPHY busy
timeout from wait_tgphy_cmd_ready() while the carrier is up would read
as link down. The carrier would go off and rtl_ops.disable() would run.
rtl8152_get_speed() still reports LINK_STATUS, so LINK_CHG is
rescheduled. Wouldn't that give a carrier off/on flap?

set_carrier() runs from rtl_work_func_t() on every link change, and that
function checks RTL8152_INACCESSIBLE only on entry. set_carrier() is
missing from both lists in the commit message: the converted callers and
the callers left for the follow-up series.

[ ... ]

> @@ -6726,12 +6929,19 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
>  		}
>  
>  		if (orig != new1) {
> -			r8152_mdio_write(tp, MII_ADVERTISE, new1);
> +			ret = r8152_mdio_write(tp, MII_ADVERTISE, new1);
> +			if (ret < 0)
> +				goto out;
> +
>  			tp->mii.advertising = new1;
>  		}
>  
>  		if (tp->mii.supports_gmii) {
> -			orig = r8152_mdio_read(tp, MII_CTRL1000);
> +			ret = r8152_mdio_read(tp, MII_CTRL1000);
> +			if (ret < 0)
> +				goto out;
> +
> +			orig = ret;
>  			new1 = orig & ~(ADVERTISE_1000FULL |
>  					ADVERTISE_1000HALF);

[ ... ]

> @@ -6776,20 +6995,26 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
>  	if (test_and_clear_bit(PHY_RESET, &tp->flags))
>  		bmcr |= BMCR_RESET;
>  
> -	r8152_mdio_write(tp, MII_BMCR, bmcr);
> +	ret = r8152_mdio_write(tp, MII_BMCR, bmcr);
> +	if (ret < 0) {
> +		if (bmcr & BMCR_RESET)
> +			set_bit(PHY_RESET, &tp->flags);
> +		goto out;
> +	}

[Severity: Low]
The commit message says a failed write in rtl8152_set_speed() leaves the
cached advertising and a pending PHY reset untouched. Does that cover all
the state changed before these early exits?

In the autoneg branch, MII_ADVERTISE may already be written when the
MII_CTRL1000 or OCP_10GBT_CTRL access fails. tp->mii.advertising and
tp->ups_info.speed_duplex may already be updated too. The early return
skips BMCR_ANRESTART. The PHY then keeps the new 10/100 advertisement
together with the old 1000/multi-gig one, and the next renegotiation
uses that mix.

In the forced branch, tp->mii.force_media, tp->mii.full_duplex and
tp->ups_info.speed_duplex are set before the MII_BMCR write. If that
write fails, only PHY_RESET is restored, and the PHY is still
autonegotiating.

Since ret is non-zero, rtl8152_set_link_ksettings() keeps the old
tp->autoneg/speed/duplex/advertising. Later in the series,
r8157_ups_en() calls r8156_ups_flags(), which writes
tp->ups_info.speed_duplex into USB_UPS_FLAGS. The stale value would then
reach the UPS firmware as well.

Should this partly applied state be rolled back, or should the commit
message describe what is left behind?

[ ... ]

> @@ -7205,7 +7430,12 @@ static bool rtl8152_in_nway(struct r8152 *tp)
>  
>  static bool rtl8153_in_nway(struct r8152 *tp)
>  {
> -	u16 phy_state = ocp_reg_read(tp, OCP_PHY_STATE) & 0xff;
> +	u16 phy_state;
> +
> +	if (ocp_reg_read(tp, OCP_PHY_STATE, &phy_state) < 0)
> +		return false;

[Severity: Medium]
Is false the safe answer when the read fails? RTL8157/RTL8159 use
rtl8153_in_nway() as ops->in_nway. delay_autosuspend() relies on it to
avoid suspending while the PHY is negotiating:

drivers/net/usb/r8152.c:delay_autosuspend() {
	...
	/* If the linking down is occurred by nway, the device may miss the
	 * linking change event. And it wouldn't wake when linking on.
	 */
	if (!sw_linking && tp->rtl_ops.in_nway(tp))
		return true;
	...
}

A TGPHY timeout while the PHY is mid-negotiation would let runtime
suspend go ahead. The adapter could then miss the link-up wake event
and stay suspended.

Before this patch, a failed control transfer filled the data with 0xff
through get_registers(). The low byte then read as "in nway", which
delayed suspend. Would returning true on a failed read be the safer
choice here?

[ ... ]

> @@ -9388,8 +9621,16 @@ int rtl8152_get_link_ksettings(struct net_device *netdev,
>  			 cmd->link_modes.supported, tp->support_10000full);
>  
>  	if (tp->support_2500full || tp->support_5000full || tp->support_10000full) {
> -		u16 ocp_10gbt_ctrl = ocp_reg_read(tp, OCP_10GBT_CTRL);
> -		u16 ocp_10gbt_stat = ocp_reg_read(tp, OCP_10GBT_STAT);
> +		u16 ocp_10gbt_ctrl;
> +		u16 ocp_10gbt_stat;
> +
> +		ret = ocp_reg_read(tp, OCP_10GBT_CTRL, &ocp_10gbt_ctrl);
> +		if (ret < 0)
> +			goto out_unlock;
> +
> +		ret = ocp_reg_read(tp, OCP_10GBT_STAT, &ocp_10gbt_stat);
> +		if (ret < 0)
> +			goto out_unlock;

[Severity: Medium]
The commit message says rtl8152_get_link_ksettings() propagates the
error. Does that apply only to these two OCP_10GBT reads?

Earlier in this function, mii_ethtool_get_link_ksettings() reads BMCR,
BMSR, CTRL1000, STAT1000, ADVERTISE and LPA through tp->mii.mdio_read,
which is read_mii_word(). After this patch, read_mii_word() turns a
failed read into 0:

	return ret < 0 ? 0 : ret;

A BMCR of 0 looks like autoneg off with forced 10M half duplex.
mii_ethtool_get_link_ksettings() also stores that duplex into
tp->mii.full_duplex. Suppose the MII reads fail but the 10GBT reads
succeed. Can ethtool then return success with a made-up forced 10M/half
configuration?

The same 0 makes mii_nway_restart() return -EINVAL (autoneg off) instead
of the I/O error. That affects rtl8152_nway_reset() and the eee_set path.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
