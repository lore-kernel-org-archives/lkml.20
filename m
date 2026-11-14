Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648516;
	b=OWknYYMSudKV+Q+5kmp/5/QlGi+h/g4B6Lg1v27aXt852oJqYj3PhQK3eC6ISEaWqaoA
	 DzPyuLwxmuw+CNWLrqPkIBBGR4pdG7Yx0CjRiPUpsd1xfb5ubX/D5sSM/OghmMU1st7Cv
	 bQjC/pajRoTGu1W7oRmUdJkLgs7KzfGrR5qGHOubwrIXCa11BNrZPOR2DYCeRFSU97Aec
	 acZIRgXSazTwYghRbuQZ/lcsreKRIBk0N9G7/wXdxB0DG+EqPQPW/HK0k07QJ14Wb2DbH
	 z7lZr7UDO0naGHbIB0BJrn+WtqPy6PBsO2Puf3LY0+WQ8hvOi8ZpBqJh/s83U3Nl3GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648516;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uhGPQOmAwKKc2gq7T3b9MMRl1PX+oiJZpfA3LholO9g=;
	b=j6mvlUHvo2biSrpH7OcpBmWFDOK42nX/qAnmV/aBbcX0N7uJDvEMQhDPCfnS67C35bnm
	 9x3Wf3w/5iMqYAPIFA3p87TMtlO3347yiUnHkSBGXTa1AX/RhBbWiSwhOUlK/ecxj615+
	 YaAYV3aUA2yLJ1FhOkpVmLYhtoO1tREPgfW1oHeHrNOzH4xSY/BsRgsZNqqX8fUaj3dxB
	 cV0SgrZ1Qa+ddLg97ZtOp9jtbPRk4E/0P9SGLtdgqhci2ZeNcz30/kty3nohuKNyJkdIA
	 dJujW/FArx2YA+o2OCMtjtwTCCNKctZT7DkBnrq0gUnDTDQ/x29tsie1eyo2jpgdv1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nfMXY5GS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E860A2601;
	Sat, 14 Nov 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nfMXY5GS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E6C1F000CB;
	Sat, 14 Nov 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648515;
	bh=uhGPQOmAwKKc2gq7T3b9MMRl1PX+oiJZpfA3LholO9g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nfMXY5GSzkV4BvkFT7gud3iQUdQUlks9HqhrY3bTgkXbEITL/DI5fGMcJNTGeg1pA
	 AjJ3z36eROValJQDjw35OEQsrXo4nY2InQSV4XUII0pZahGwE+x0TX9P4UnswUt3OZ
	 GyIRUTXVc85eyVrfoUZOw7d/MCNZB+QjDdxBPsZlm3X5nIVm7+0dyUx4O85TVOoIiy
	 uvmCIDUj1KvdXgub7xV1ABUMCg3pgYa0li8K2VmcsLoRUNOVeguT3UBerGpCZnK8Py
	 EB6YdGQ3FDwRDXRSv8Rjohf/6bJaBz/cQYBQH0ijLNthf5R6eUSaq0o1o5XkeM1SXG
	 hY6153rVMuWpQ==
Subject: Re: [PATCH net-next v8 06/11] r8152: add new init writes for
 RTL8156/8156B/8157/8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:34 +0000
Message-ID: <179464851473.2199510.6808488710116582608@kernel.org>
In-Reply-To: <20261110032416.16968-7-nic_swsd@realtek.com>
References: <20261110032416.16968-7-nic_swsd@realtek.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] r8156_init() (RTL_TEST_01/VER_10/11/12/13/15) and r8157_init()
  (VER_16/17) now always clear RMT_WAKE_EN (BIT(0) of PLA 0xe0c8).
- [Low] The commit message lists each new register write but explains
  only one of them (RX_END_TRANSFER_EN).

--

r8152: add new init writes for RTL8156/8156B/8157/8159

This commit adds register writes to r8156_init() and r8157_init() so they
match the vendor init sequence. Both functions now clear PREBOOT_OPTION and
RMT_WAKE_EN, and RTL8156B gets a u2phy backup. r8157_init() also disables
interrupt mitigation and AUTO_SPEEDUP, clears the reset event flag, adds
VER_17 specific writes, and clears RX_END_TRANSFER_EN for all chips.

> Bring the per-generation init functions in line with the vendor init
> sequence by adding writes the shared r8156_init() never performed.

[Severity: Low]
This isn't a bug, but could the commit message say why most of these writes
are needed? Only RX_END_TRANSFER_EN is explained. The rest are listed with
no stated purpose or effect:

  - clearing PREBOOT_OPTION in PLA_INDICATE_FALG
  - clearing RMT_WAKE_EN in PLA 0xe0c8
  - the r8156b_u2phy_backup() values written to USB 0xd3ce..0xd3dc
  - clearing USB 0xcf04 bits 0/1/2/7 (interrupt mitigation)
  - clearing USB 0xcd06 BIT(11) (Warm RST / Bus RST event flag)
  - clearing USB 0xb9a6 BIT(0) and writing 0x0448 to 0xb9a2 on VER_17
  - clearing AUTO_SPEEDUP

Several of these look like fixes for specific failures. Examples would be
problems after a warm or bus reset, after a USB2/USB3 PHY power cut, or
with interrupt mitigation enabled. Other patches in the series are marked
as fixes.

Is there a user-visible symptom behind any of these writes? If so, could
it be described, with Fixes: tags added? That would show whether this
belongs in net and stable rather than net-next.

Could the message also say how clearing RMT_WAKE_EN relates to WoL and to
remote wakeup from runtime autosuspend?

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 364a0573f6cd1..a1c2e1e08b161 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -8528,11 +8543,24 @@ static void r8156_init(struct r8152 *tp)

[ ... ]

>  	r8153b_power_cut_en(tp, false);
>  	r8156_ups_en(tp, false);
>  	r8153_queue_wake(tp, false);
>  	rtl_runtime_suspend_enable(tp, false);
>  
> +	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_INDICATE_FALG, PREBOOT_OPTION);
> +
> +	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_RMT_WAKE, RMT_WAKE_EN);

[Severity: Medium]
Does this leave RMT_WAKE_EN permanently off on these chips? r8156_init()
(TEST_01, VER_10/11/12/13/15) clears it every time, and so does
r8157_init() (VER_16/17). Nothing else in the driver uses PLA_RMT_WAKE or
RMT_WAKE_EN, so the bit is never set again.

init() runs at probe, right after the wake state is read:

drivers/net/usb/r8152.c:rtl8152_probe() {
    ...
	intf->needs_remote_wakeup = 1;

	if (!rtl_can_wakeup(tp))
		__rtl_set_wol(tp, 0);
	else
		tp->saved_wolopts = __rtl_get_wol(tp);

	tp->rtl_ops.init(tp);
    ...
}

It also runs again on every rtl8152_reset_resume()->tp->rtl_ops.init().

The WoL arming path, __rtl_set_wol(), only writes PLA_CONFIG34, PLA_CONFIG5
and PLA_CFG_WOL, then calls device_set_wakeup_enable(). The
runtime-suspend paths through rtl_runtime_suspend_enable() and
r8153_queue_wake() never touch PLA_RMT_WAKE either.

What happens if RMT_WAKE_EN controls whether the MAC can send a USB remote
wakeup? Then WoL from system suspend and resume from runtime autosuspend on
a link change would stop working on RTL8156/8156B/8157/8159. Software would
still report wake as armed through saved_wolopts and needs_remote_wakeup.

If the bit is only leftover state from a UEFI/PXE preboot driver, which
its placement next to PREBOOT_OPTION suggests, the clear is harmless.
Neither the code nor the changelog says which case applies. Can this be
confirmed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
