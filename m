Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837285;
	b=a9f450THlCAyEA25vJb2gW+Uyzmb/dgPChC4KtNQhsz3Llv3ul6COgsKGx/5RzZuIhB2
	 DqOuM72P8W7lRq8JoPc1ana+mHHQs9an6LEMrWb4CXYI3MAdQqfyLj4/Bx+fd36gWqGHP
	 ifAsicdbDP50C7M/vpd3FUSsiD6coHC211ecxUo5Et73WO2zMqyrPRqo/EJdMwCefIU41
	 77QppXh9JJtZdal61QQJnYL7aZLN3pXL6GqBxDT9393EI/8xRpYDTb/92LfdnKJyWo3+u
	 GSL5IKkIlZvA/9Pa+JHRmEKm7sKyCLOc15XMMaOmKzxn1XKElz8v1p9zTjOqvDr453Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837285;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QEC5bH3mf6ppNxnqhZUIX9nYzf+HXa3xcTJXq8rdH+s=;
	b=PdsFeoMxMKpC3jJNjGHxrwdCYtXO/l8LsoZmj4BN2n8Ncpn1FUfRuQnApzkPF8b0A0Mv
	 xLv9E+QDcHSfxyfCOMpnYZBi8s+ZPmoL/7f9565/zFpfdckpPitiuxc73SsE5Y8JJGeWw
	 1BRFlevM09IJJj40KaOniFkJ+MN4MgAsfVRNvlJD3437jzWjhUTvchNCTB6Rjj8I9mV7K
	 6uHiOuu3y1W+V9Dvh1vsQmhA4/KM3gNtMx287Celvba9cJTfIyLKtXpRN2ryKsojvRcDC
	 Ed4+bJ0jvncqpv0nqzeZFUER7X4CJB97PKfVwjTvCywDWLgkDKNAOrbVYANt9eOvG2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0u0iGlj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1FF606A89B;
	Mon, 16 Nov 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0u0iGlj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8D81F000CC;
	Mon, 16 Nov 2026 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837285;
	bh=QEC5bH3mf6ppNxnqhZUIX9nYzf+HXa3xcTJXq8rdH+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H0u0iGlj4EHuczofS5R02f1Rdk34Yf2EFRQtNGSS5GZ+jARa4hGVXydby/6CnEvgA
	 ImopRT5uJkGjz6Z1oeibJP1PHh2umGu2Ekay8u0QyNkhWoItGd/CY9Z0sVTG7IQUm5
	 p79JlrINdC20IWreuvZOK8auV5xCFqBZK7EBuploxG1yyVcVfylqXX0+ivg4nEs8SL
	 DT4Zi+cylT4FmT+DVgcUoa8DlFYqpsxe3h0d69Uh/ac0j89xoFKg1pCEGDWYfJxGVg
	 Gj4NxT2c7BFUYF59YwOfFR/juI0pzZUpA17j2yyQkdrKfNcYu4rktLnR2UYdVnDEPG
	 zUXU3PNO6rsBQ==
Subject: Re: [PATCH v34 net-next 4/8] net/nebula-matrix: add chip-wide
 hardware init/deinit implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:43 +0000
Message-ID: <179483728389.3136.12160393764038697386@kernel.org>
In-Reply-To: <20261112094925.6098-5-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-5-illusion.wang@nebula-matrix.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The control-PF probe has no real handshake with the
  asynchronous firmware cleanup pass; it relies only on a fixed 2-3 ms…
- [Medium] nbl_hw_set_driver_status() changes bit16 of
  NBL_DRIVER_STATUS_REG (0x1300444) with a read-modify-write:…
- [Low] The patch adds a firmware ABI dependency with no version or
  capability gate.

--

net/nebula-matrix: add chip-wide hardware init/deinit implementation

This adds the Leonis chip-wide init_module() and deinit_module() hooks in
the hw and resource layers. They run only on the control PF.
init_module() programs the chip-wide datapath registers and sets the
driver_status bit. deinit_module() clears the bit and sleeps 2-3 ms for
the asynchronous firmware cleanup. A stale driver_status bit is also
cleared at probe time in nbl_hw_init_leonis().

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> index 75d6982ae1e83..371c317daaedd 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c

[ ... ]

> @@ -150,6 +175,742 @@ static void nbl_hw_get_fw_eth_map(struct nbl_hw_mgt *hw_mgt, u32 *eth_map)
>  	*eth_map = FIELD_GET(NBL_FW_BOARD_DW6_ETH_BITMAP_MASK, data);
>  }
>  
> +static u32 nbl_hw_get_quirks(struct nbl_hw_mgt *hw_mgt)
> +{
> +	u32 quirks = 0;
> +
> +	/*
> +	 * Read quirk bits from mailbox register.
> +	 * All supported firmware implement the quirk ABI,
> +	 * firmware always populates NBL_LEONIS_QUIRKS_OFFSET.
> +	 * Value ~0U indicates no active quirks.
> +	 */
> +	nbl_hw_read_mbx_regs(hw_mgt, NBL_LEONIS_QUIRKS_OFFSET, &quirks,
> +			     sizeof(u32));
> +
> +	if (quirks == ~0u)
> +		return 0;
> +
> +	return quirks;
> +}

[Severity: Low]
The comment says all supported firmware fills in NBL_LEONIS_QUIRKS_OFFSET.
However, neither the code nor the commit message names a minimum firmware
version. Nothing gates this read on a firmware version or capability
either.

nbl_uvn_init() then uses BIT(1) of this word to choose the UVN descriptor
prefetch mode:

    FIELD_PREP(NBL_UVN_DESC_PREFETCH_INIT_SEL_MASK,
               (quirks & NBL_QUIRK_UVN_PREFETCH_ALIGN) ? 0 : 1);

On firmware that does not fill in offset 0x140, any value with BIT(1) set
other than ~0U would switch the RX prefetch mode to sel=0. No message is
printed when that happens.

Could the minimum firmware version be documented? Alternatively, could
this read be gated on a firmware version or capability check?

[ ... ]

> +static void nbl_hw_set_driver_status(struct nbl_hw_mgt *hw_mgt, bool active)
> +{
> +	u32 status;
> +
> +	spin_lock(&hw_mgt->reg_lock);
> +	status = nbl_hw_rd32(hw_mgt, NBL_DRIVER_STATUS_REG);
> +
> +	status &= ~BIT(NBL_DRIVER_STATUS_BIT);
> +	status |= FIELD_PREP(BIT(NBL_DRIVER_STATUS_BIT), active);
> +
> +	nbl_hw_wr32(hw_mgt, NBL_DRIVER_STATUS_REG, status);
> +	spin_unlock(&hw_mgt->reg_lock);
> +}

[Severity: Medium]
NBL_DRIVER_STATUS_REG is documented as shared with firmware, and every
bit except bit 16 belongs to firmware. reg_lock only serializes host
CPUs.

If firmware updates one of its bits between the nbl_hw_rd32() and the
nbl_hw_wr32() here, won't that update be overwritten with the stale
value?

All three callers go through this read-modify-write:
nbl_hw_clear_stale_status() at probe, nbl_hw_init_module() and
nbl_hw_deinit_module().

The header comment says no such firmware write is known. It also says
that this is an observation about this hardware revision, not something
the driver enforces. What happens to firmware if one of its bits is
written back stale is not documented.

Would a driver-owned register or a firmware-acknowledged mailbox command
be a safer way to signal that the driver is present?

[ ... ]

> +static void nbl_hw_deinit_module(struct nbl_hw_mgt *hw_mgt)
> +{
> +	nbl_hw_set_driver_status(hw_mgt, false);
> +	/* ensure driver_status reaches the chip */
> +	nbl_flush_writes(hw_mgt);
> +	/*
> +	 * Give the asynchronous firmware cleanup pass time to settle
> +	 * before returning; best-effort, see NBL_FW_CLEANUP_SYNC_MIN_US.
> +	 */
> +	usleep_range(NBL_FW_CLEANUP_SYNC_MIN_US, NBL_FW_CLEANUP_SYNC_MAX_US);
> +}

[ ... ]

> +static void nbl_hw_clear_stale_status(struct nbl_hw_mgt *hw_mgt)
> +{
> +	u32 status;
> +
> +	if (!hw_mgt->common->has_ctrl)
> +		return;
> +

[ ... ]

> +	status = nbl_hw_rd32(hw_mgt, NBL_DRIVER_STATUS_REG);
> +	if (!(status & BIT(NBL_DRIVER_STATUS_BIT)))
> +		return;
> +
> +	dev_warn(hw_mgt->common->dev,
> +		 "driver_status already set, stale cleanup forced\n");
> +	nbl_hw_set_driver_status(hw_mgt, false);
> +	nbl_flush_writes(hw_mgt);
> +	usleep_range(NBL_FW_CLEANUP_SYNC_MIN_US, NBL_FW_CLEANUP_SYNC_MAX_US);
> +}

[Severity: Medium]
Is the 2-3 ms sleep enough to order this probe after the firmware
cleanup pass?

Later in the series ("net/nebula-matrix: add common/ctrl dev init/remove
operation"), nbl_dev_init() runs after this function. It programs exactly
the state that the firmware pass reclaims:

    if (common->has_ctrl)
        nbl_dev_setup_chan_qinfo(dev_mgt, NBL_CHAN_TYPE_MAILBOX);
    ...
    ret = nbl_dev_setup_common_dev(adapter);

The pass can run longer than the window. The commit message gives an
ECPU still busy right after kexec as one example. Firmware would then
wipe the mailbox QINFO routing and qinfo registers that probe has just
programmed.

No error is reported. Sibling PFs' RPCs in nbl_dev_start() then time
out, and their probes fail.

The unbind/rebind path looks similar. nbl_hw_deinit_module() sleeps
2-3 ms and returns. The next probe of the control PF reads bit 16 as 0.
It then returns early from nbl_hw_clear_stale_status() without waiting
and starts programming the routing right away.

The device link orders the siblings against the control PF. Does
anything order the control PF's next probe against its own previous
cleanup pass?

The nbl_hw_deinit_module() comment says "Both steps are far slower than
the firmware pass". There doesn't seem to be a documented firmware
latency behind that.

Is there a firmware acknowledgement that could be waited on instead,
such as a mailbox command or another register that firmware writes? If
not, could a much larger margin be used on the stale-clear and teardown
paths?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
