Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445FD451996;
	Fri,  2 Oct 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932388; cv=none; b=SroEFmaKnxkEpX+atwnSoc96+52KO75x62MR2kFIbUJjmEilf7zl6YUXm0XS+UWfV7bg2yDAJPXWzsRZGge19PG3PjvuY8cHnoQR3gOo5g8h5AhhGh2n5LRWoW6r4R/Ae/xfwC/pQz32yuLRWj0aLBBpUq2vInNBy+dPsKCw/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932388; c=relaxed/simple;
	bh=SeFt5drKUcJigJe6/ihmwW8xAhGCYcKroJcLMDkEUZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xdktv8Udf1ntjFt2kmWD0C4jwb+DPg+U2ise+R0kjoP14KKwWY3PrzVPnqDDiNIML2xJ6XLhfBsutswuhceSl4/UO+OHRnfuGMQJ1iKaLyKig535QAmOOtV39bZezpMRpq4HRDh1PcAC78DAIIidu2nd+B48xshihDeWvINCmfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7cQ3wxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7cQ3wxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D1F1F000FF;
	Fri,  2 Oct 2026 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932386;
	bh=E2MH5ucIaIApIUxucO1uUSHtEgWcgu2UJ4m0lbYAPS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h7cQ3wxP/WXnnUgi737EQnvb8mHwlBjSrqGRC25rUT2U+o2GapAWWMwQmfebd2ero
	 75Rgg8Ka0aM9PZ3M4NoRhFEjTooSgRi5XecELvHhbcNfK1e6dYhgbgrhp8jFiZ2M6v
	 bTCqnmPZn3dIZos81AX3ELuHFswxGZ+zwD1ixny8EFf/qLGnvQMrpw5klmEYkKO8gc
	 BtwAq8A/FC6vFNLJnN7cyidMBcz51jc+fkq7nJFX5+lTqqZgfwvZzAmHpBPxkpv6Ch
	 x19LJ1KsMd1ecksWtSLyfRcYhGpFbf5P9rFswBWW3uMN09znpCcWbguZ1bdTV8Rw6O
	 tyMEUmJcTrPew==
Message-ID: <f41a6261-ae04-44cb-b01f-b1da02d9cb80@kernel.org>
Date: Fri, 2 Oct 2026 11:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
To: BG9OXA <bg9oxa@163.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>
References: <20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2026 05:52, BG9OXA wrote:
> Hi all,
> 
> This short series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S
> based single board computer.
> 
> Board summary:
>  - Rockchip RK3588S (4x Cortex-A76 + 4x Cortex-A55), LPDDR4x
>  - eMMC, microSD slot, M.2 socket (PCIe 2.0 x1)
>  - Gigabit Ethernet, USB 3.0 Type-A, USB 2.0 Type-A ports and a USB-C
>    port (USB 2.0/3.0 plus DisplayPort altmode, two DP lanes)
>  - HDMI output, three MIPI CSI and two MIPI DSI connectors
>  - ES8388 analog codec with 3.5 mm jack, HUSB311 USB-C PD controller
>  - 40-pin header, RK806 PMIC, IR receiver
>  - No SPI-NOR; the vendor bootloader reads extlinux.conf from the SD/eMMC
>    boot partition
> 
> Patch 1 documents the board in the Rockchip platform bindings, patch 2
> adds the device tree itself (plus its Makefile entry).  The "alientek"
> vendor prefix is already present in vendor-prefixes.yaml, so no vendor
> prefix change is needed.
> 
> Tested on hardware: boot from SD and eMMC, gigabit Ethernet, the USB 2.0
> ports, the USB 3.0 Type-A port (UAS storage device, 5000 Mbps link,
> 309 MB/s), USB-C DisplayPort altmode, HDMI video and audio, ES8388 analog
> playback over the 3.5 mm jack (checked with music), the ADC keys, the IR
> receiver, the PWM fan and ramoops.  The M.2 socket is described following
> the vendor design; no suitable device was available here to exercise that
> link.  dtbs_check is clean for both patches.
> 
> Notes worth the reviewer's attention:
> 
>  * The codec is clocked through I2S0_8CH_MCLKOUT_TO_IO rather than the
>    internal I2S0_8CH_MCLKOUT mux that the other boards reference.  On
>    RK3588 the MCLK-to-IO routing is a gate in SYS_GRF SOC_CON6 which the
>    bootloader leaves closed, so nothing drives MCLK out to the codec;
>    pointing "clocks" at the _TO_IO clock makes the codec driver open that
>    gate at probe, while "assigned-clocks" stays on the internal mux to
>    keep the 12.288 MHz rate.  Verified on hardware: i2s0_8ch_mclkout_to_io
>    is enabled with the codec (1-0011) as its consumer, and playback works.
> 
>  * The codec compatible list is "everest,es8388", "everest,es8328", as
>    documented in everest,es8328.yaml and as used by the other boards with
>    this part.  The standalone ES8323 driver cannot instantiate a card on
>    this board at all, which is how the fitted part was confirmed.
> 
>  * Analog capture from the 3.5 mm TRRS jack (headset microphone) does not
>    work yet: the capture stream returns a constant idle pattern (0xFFFF)
>    although the analog bypass path works, and the DAPM routes and the ALSA
>    controls look correct.  This looks like the same ES8328 capture problem
>    that has been reported for other boards, so I kept it out of this
>    series.
> 
>  * The USB 3.0 Type-A port is wired to usb_host2_xhci through combphy2_psu;
>    both are enabled here, as in the vendor BSP.  combphy2_psu is free on
>    this board because the M.2 socket uses pcie2x1l2 (combphy0_ps).
> 
>  * The 3.5 mm jack is fed from the codec outputs (LOUT1/ROUT1) and from the
>    headphone amplifier outputs, as in the vendor tree.  Describing only the
>    amplifier path was tried as well, and on this board that gives no output
>    at the jack at all (verified on hardware with a test tone and with music
>    playback), so both routes are kept.
> 
>  * The board has three MIPI CSI and two MIPI DSI connectors, but no camera
>    or panel is described here: those are plug-in modules.  Enabling the
>    CSI-2 receiver without a sensor attached makes the driver fail to find
>    its endpoint at probe (verified on hardware), so, as in the vendor
>    tree, camera and panel descriptions belong in overlays.
> 
>  * GbE: phy-mode is "rgmii-id".  As you explained, phy-mode describes the
>    PCB, and this PCB does not add RX/TX delays, so the delays have to come
>    from the PHY.  I went through where each delay is actually applied:
> 
>      - MAC side: none.  dwmac-rk takes the delay values from the DT only
>        for the plain "rgmii", "rgmii-rxid" and "rgmii-txid" modes; for
>        PHY_INTERFACE_MODE_RGMII_ID it calls set_to_rgmii(priv, 0, 0), so
>        the RGMII delay registers are written with zero.  (The driver still
>        logs "set tx_delay to 0x30"/"set rx_delay to 0x10" when the
>        properties are absent, but those values are only the parse-time
>        defaults and do not reach the GRF in this mode.)
> 
>      - PHY side: the delays.  The Motorcomm driver programs its internal
>        RGMII delay for RGMII_ID, using 1950 ps for both directions when
>        rx-internal-delay-ps / tx-internal-delay-ps are not specified,
>        which is its documented default for both directions.
> 
>     So with "rgmii-id" nothing is added twice.  Measured on hardware with
>     iperf3 at gigabit line rate: in one 900 second run, 96.8 GB transferred
>     at 924 Mbit/s with zero retransmissions; in a second run on the final
>     revision of the series, 300 seconds in each direction, 925 Mbit/s
>     transmit and 937 Mbit/s receive, with 114 and 23 retransmits out of
>     roughly 24 million segments each way (a few ppm).  rx_crc_errors and
>     the other error counters stay at zero in both runs.
> 
> This is my first patch to the Rockchip platform.  I am a Chinese amateur
> electronics hobbyist (amateur radio callsign BG9OXA) working on this board
> in my spare time, so please point out anything that does not follow the
> expected style.
> 
> Changes in v6:
> - My oversight, sorry for the noise: when I switched phy-mode to "rgmii-id"
>   in v5 I forgot to update the commit message of patch 2/2 at the same time,
>   so the message still described the v3/v4 approach (delays applied on the
>   MAC side) while the code had moved to the PHY-side delays.  The message now
>   describes what the code does: the PHY adds the delays internally and the
>   MAC adds none, so nothing is applied twice.  The device tree is not touched
>   by this change; the compiled .dtb is byte-for-byte identical to the one in
>   v5 (verified).
> - Keep the headphone routing as in v5.  On this board the 3.5 mm jack needs
>   the direct codec output routes: describing only the amplifier path gives
>   no output at the jack, which I verified on hardware with a test tone and
>   with music playback.  So the parallel routes are intentional here and
>   were not changed.
> - Link to v5: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077620.html
> 
> Changes in v5:
> - Use phy-mode = "rgmii-id" and let the PHY add the RGMII delays, instead of
>   "rgmii" with the delay applied on the MAC side, as pointed out by Andrew
>   Lunn.  The MAC adds no delay in this mode, so nothing is applied twice;
>   see the GbE note above for the details and the measurements.
> - Move the Makefile entry so that the list stays in alphabetical order.
> - Rename the headphone amplifier node to the generic name "audio-amplifier";
>   the labels are unchanged, so no reference is affected.  The audio routing
>   itself is unchanged, see the note above.
> - Set the Type-C connector data-role to "host".  The XHCI controller is
>   host-only on this board (dr_mode = "host" and no usb-role-switch), and
>   the vendor DT lists "dual" only because the vendor configures that
>   controller as OTG.  The power role stays "dual", as the board can be
>   powered over Type-C.
> - Link to v4: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077616.html
> 
> Changes in v4:
> - Add the missing blank line between the include block and the root node.
> - Fix the node indentation in a few places.  That cleanup is whitespace only;
>   the compiled .dtb is unchanged by it (verified byte-for-byte).
> - Rename the Type-C controller node to the generic name "typec-port", as the
>   other boards using this part do, and drop its redundant status property.
> - Give the fixed regulator nodes the "regulator-" name prefix, as the other
>   boards do; the labels are unchanged, so no reference is affected.
> - Route the Type-C SuperSpeed lanes through the USBDP PHY, as the other
>   RK3588 boards do, so that the PHY does the orientation muxing.
> - Feed the headphone amplifier from one codec output pair only; that is what
>   the other ES8388 boards do.
> - Cc the people and lists reported by scripts/get_maintainer.pl.
> - Link to v3: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077611.html
> 


This looks a lot like LLM generated stuff. Don't. The easiest way to
annoy maintainers. We are not going to read long LLM-generated
paragraphs for trivial stuff, because trivial stuff should be explained
with one sentence.

Best regards,
Krzysztof
