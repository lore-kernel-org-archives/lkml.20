Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648520;
	b=MWCSC2/t1sDgzoQJYw3cjr9S/CpaqXsRZSvZ4mFa5w1xPqSFedMXGoGVPWbvIcwNTLz9
	 qiLljrMREb4Hsx6fLdcYIQSLu87odCCjZSPsyG2QHz/c8XxFCTF3w9PePUL/JA28gISAi
	 o/6mKFoKuC6bWXUtgD5nypYOXUPkeEppdDlXo4SwCnLHh87HTRdw9OLEQ2GqWA/K1kANp
	 fR0J2SydTMvmXJ9HIk6j5+l9tX45I5b3nhcDSAJ55+GRwKzdBk+FBeLhjTXc5B4+rj2aR
	 e3DrcfMslXj+8JWiYhJKpQCW2Txt8pnrPRT1N4Ng3xTfNoUd0nCnxTQCTG3GR6U6Bzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648520;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kmc0qXi4ME4oDz4wqA5tJxUwkXHr4wrcUHauToTFwAo=;
	b=2Y5wLAFBuLgtE63MHufP9iPd6tc4sw5czNMiEApBHha/LqoCS72v9vvt3LAyebDgfhDJ
	 asinTmONYb7UK1OwwQqqjnCt1Olj/HjiqKC/D+OEqL5JMFllykSFwFScMVKNdGBkCnhXi
	 0jICMbOB/KNt8WiVhw/RJ6G9S9KwTmFlBeMl+0rmLj58arBZrBI3Xo5PUYPnWF7yRO/cu
	 uIYmzLzYHzhY201nGKPq9NiACqrCLsQsPjLe2kiuO4egkeB2o/APBrwr+WrNpWDiF94vi
	 +FDdOJ2HiqutZFAnGvQI6fJcsD1q0XP03YSCM7LQAXg8qMRqfEQh7ccvFUU6HIWmG6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxEdHNGU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDADB60A5BC6;
	Sat, 14 Nov 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxEdHNGU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30D61F000C4;
	Sat, 14 Nov 2026 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648520;
	bh=kmc0qXi4ME4oDz4wqA5tJxUwkXHr4wrcUHauToTFwAo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GxEdHNGU8YlrQjxHgIsODocmGg03kNpnybHp4ArN1VIvGjQ6vm6ADVEjhn07BRuEb
	 omGqhvb4ezIuIHR9R2wzjrjOC5xhrTHRHu/6TfRSjPey0fA53O+LqjsMpMra3CYkGq
	 IWLQl809W/KhdxaAtvW6fMEDM12DKFRCrPuMHKV3mPMqUc+IDb6gCeBpMZKgkTEkNm
	 ExqaTN8dKJ4mH0kg6vh+Vloe30vQSQkmj3+VlZSzOg3lHySwJDSpAHRNwCSy3wrcGA
	 nzThStENq9zJywEpegX25uks7D8NIgGYrZF0JonwFFCiNZQMdEw0fBNWm6AvdghVvz
	 f2LDPi03K6uEA==
Subject:
 Re: [PATCH net-next v8 11/11] r8152: enable UPS for RTL8157 and RTL8159 QFN68
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:39 +0000
Message-ID: <179464851954.2199510.2249014623372235889@kernel.org>
In-Reply-To: <20261110032416.16968-12-nic_swsd@realtek.com>
References: <20261110032416.16968-12-nic_swsd@realtek.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] r8157_ups_en(tp, false) in drivers/net/usb/r8152.c runs the
  BACKUP_RESTRORE wait on RTL8157 (RTL_VER_16) as well as on RTL8159.
- [Medium] If the backup-restore wait in r8157_ups_en(tp, false) times
  out during runtime resume, the device is marked inaccessible and…
- [Medium] After a UPS power cut (PCUT_STATUS set), r8157_ups_en(tp,
  false) waits only for BACKUP_RESTRORE.
- [Low] r8157_ups_en() clears the USB MAC firmware version by writing 0
  to a hardcoded register, USB_FW_USB_VER (0xcfd7), and then calls…

--

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This commit adds r8157_ups_en() and calls it from rtl8157_runtime_enable()
for RTL_VER_16 and RTL_VER_17_QFN68, so UPS is toggled on runtime suspend
and resume, and uses it in r8157_init(). It also extends r8156_ups_flags()
with per-speed EEE flags and 5G/10G speed encodings for these chips. On a
power cut, the disable path waits for BACKUP_RESTRORE, clears
USB_FW_USB_VER, and reapplies the PHY config and speed.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 703ec5483778b..9c7031f938bc2 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -4496,6 +4534,58 @@ static void r8156_ups_en(struct r8152 *tp, bool enable)
>  	}
>  }
>  
> +static void r8157_ups_en(struct r8152 *tp, bool enable)
> +{

[ ... ]

> +	} else {
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE);
> +
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +
> +		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
> +		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +			return;
> +
> +		if (ocp_data & PCUT_STATUS) {
> +			ret = read_poll_timeout(ocp_read_word, ocp_data,
> +						test_bit(RTL8152_INACCESSIBLE,
> +							 &tp->flags) ||
> +						(ocp_data & BACKUP_RESTRORE),
> +						200, 20000, false, tp,
> +						MCU_TYPE_USB, USB_GPHY_CTRL);

[Severity: Medium]
Should this BACKUP_RESTRORE wait be limited to RTL_VER_17_QFN68?

rtl8157_runtime_enable() calls r8157_ups_en(tp, false) for both
RTL_VER_16 and RTL_VER_17_QFN68. Nothing here checks the version before
polling USB_GPHY_CTRL.

Everywhere else this wait is treated as RTL8159 only. r8157_init() does it
only for the VER_17 parts:

drivers/net/usb/r8152.c:r8157_init() {
    ...
	switch (tp->version) {
	case RTL_VER_17_QFN68:
	case RTL_VER_17_QFN100:
		if (r8159_wait_backup_restore(tp)) {
    ...
}

The u2phy/u3phy backup restore patch enables (0xb99c BIT(0), 0xb9a2) are
also set only for VER_17. The earlier r8156_init() gated this wait on
tp->version == RTL_VER_17. The "split r8156_init by generation" commit in
this series calls it "the RTL8159-only backup-restore wait".

The commit message says the timeout is handled "as r8157_init() does for
the same wait". However, r8157_init() never runs this wait on RTL_VER_16.

What happens if RTL8157 doesn't assert BACKUP_RESTRORE after a UPS power
cut? Wouldn't every runtime resume after a power cut time out here and
leave the NIC inaccessible until replug?

Could this be gated on RTL_VER_17_QFN68? Another option is to call
r8159_wait_backup_restore() under the same version check that r8157_init()
uses.

> +			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +				return;
> +
> +			if (ret) {
> +				rtl_set_inaccessible(tp);
> +				dev_err(&tp->intf->dev,
> +					"backup-restore timed out\n");
> +				return;
> +			}

[Severity: Medium]
What recovers the device if this timeout hits during runtime resume?

r8157_ups_en() and rtl8157_runtime_enable() both return void.
rtl8152_runtime_resume() carries on and returns 0:

rtl8152_resume()
  rtl8152_runtime_resume()
    tp->rtl_ops.autosuspend_en(tp, false)
      rtl8157_runtime_enable(tp, false)
        r8157_ups_en(tp, false)
          rtl_set_inaccessible(tp)
    napi_enable(napi)
    usb_submit_urb(tp->intr_urb, GFP_NOIO)
    return 0

The existing recovery in rtl8152_resume() skips runtime resume:

	if (!runtime_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
		usb_reset_device(tp->udev);

So the PM core sees a successful resume and the netdev stays IFF_UP. Every
later register access is short-circuited by RTL8152_INACCESSIBLE. This
lasts until a replug or an unrelated reset, such as the TX watchdog.

The commit message acknowledges this and leaves recovery to a follow-up
series. Still, this patch is the one that adds the runtime resume failure
path. Could the recovery land together with this change, for example by
queuing a reset or passing the error back?

> +
> +			/* clear USB fw_ver_reg */
> +			ocp_write_byte(tp, MCU_TYPE_USB, USB_FW_USB_VER, 0);

[Severity: Low]
Is USB_FW_USB_VER guaranteed to match the fw_ver_reg in the loaded USB
firmware block?

The path is r8157_hw_phy_cfg()->rtl8152_apply_firmware()->
rtl8152_fw_mac_apply(). That function decides whether to skip the patch
using the register named in the firmware blob, not a fixed address:

drivers/net/usb/r8152.c:rtl8152_fw_mac_apply() {
    ...
	fw_ver_reg = __le16_to_cpu(mac->fw_ver_reg);
	if (fw_ver_reg && ocp_read_byte(tp, MCU_TYPE_USB, fw_ver_reg) >= mac->fw_ver_data) {
		dev_dbg(&tp->intf->dev, "%s firmware has been the newest\n", type ? "PLA" : "USB");
		return;
    ...
}

Suppose the FIRMWARE_8157_1 or FIRMWARE_8159_1 USB block names a
fw_ver_reg other than 0xcfd7. The USB MAC patch lost in the power cut would
then be skipped as already newest. This write would also land on an
unrelated register.

Could this use the fw_ver_reg parsed from the loaded firmware instead of a
hardcoded address?

> +
> +			tp->rtl_ops.hw_phy_cfg(tp);
> +
> +			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
> +					  tp->duplex, tp->advertising);

[Severity: Medium]
Does this power cut recovery need a wait_autoload_done() before
hw_phy_cfg()?

The other UPS exit paths wait for autoload as soon as they see
PCUT_STATUS. For example, r8153b_ups_en() does this, and r8153c_ups_en()
does the same:

	if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
		if (wait_autoload_done(tp))
			return;

r8157_init(), for the same chip family, runs r8156b_wait_loading_flash()
and wait_autoload_done() before the backup restore wait and PHY setup.

r8156_ups_en(tp, false), which this function mirrors, also has no autoload
wait. But r8156_ups_en(tp, true) is never called, and r8156_init() clears
PCUT_STATUS first. That path has never run after a real power cut.

r8157_hw_phy_cfg() waits only for GPHY_PATCH_DONE, and only when
GPHY_FLASH is set and BYPASS_FLASH is clear.

If autoload is still running after the power cut, could the firmware and
PHY writes from hw_phy_cfg() and rtl8152_set_speed() race the hardware
reload? They might then be overwritten or only partly applied.

> +		}
> +	}
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
