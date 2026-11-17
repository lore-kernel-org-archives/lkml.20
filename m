Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881901;
	b=2iJgST5840U91zI7ENGir39MjPqJSYRw4PpeCUVGggn+DIzPQXPG2w2vJfXch5hUILTA
	 vEu5jdSc2uAyWn+nGfOx674XERjiBlnfG+bd0XIJyLsfNKT/GiLEKKhqyWxyiNY5OteaI
	 0c2TTCee60N6VnbC/FUBrc+LnQOh8XN5RG8YCi42oqbK9+58UIdeaeYOH1U6Fw1Y4dyO5
	 lHVB8hY7PkQsskkeoy/i/J0FJx25TkYZfPwFOw8QS+zP5bdZRlTH+5NXPQAw2SyodC5kZ
	 TAcNMd7oTK9CSPOOb7hRQrqgad4JdRRsrkFcQEraP7BrnYCSktsBVLY6IupJSlaWHlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881901;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LBf8xvzoPmS3G6NIzekSAol/kCXtYxQeTNp7Dl2iC+s=;
	b=VIBDjAaGifaXr0zE7gFrgwAuuov8zgSY43wvREvKqWSzIIfwlJoURcZiVTBvMyM0qH9T
	 y3AskyJ2aUuNv4o/nigzqbeQ8dqhNMav3XzmQ3dXKQT22CKjJDOb1tjqvPjCLUXSHkNp6
	 ynPrHcmx3pzS4IKXYNEcBB+VSle5i/N2gJAvqIPGTGj0Pwk8EVcPedVx4t5ZV0FpbB+Mx
	 TT+UQgd4YH6moG9X0RYfR66vCKT5Hjt/4nPDRzbszLR8U8t9UNJUm7j6pEb8aBsq66O63
	 tvsQ0D2NJq8SSYe7yAL6xD48Q6z9ihnsSGfkkjmZPbrKaJMFfZ60c+rsYtqJE9RUwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXTCD6Gd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB3606A32C;
	Tue, 17 Nov 2026 02:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXTCD6Gd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1756D1F000C4;
	Tue, 17 Nov 2026 02:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881900;
	bh=LBf8xvzoPmS3G6NIzekSAol/kCXtYxQeTNp7Dl2iC+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OXTCD6GdUP4q/su4Io4DSECaOhVfPGP835K5MCu2ysP09wtcZC1JeQbzZAEiZtpCR
	 x7VZJ2WRReB7Y8VyGh46DehW3V1KA/YLbk9WKMP3JI//HR/EbIJlXUNMgR1M8rrTOU
	 xXiLd9YP9U+cchPB5XOpN7QHS+K1ZpaHyjUbckmsA+Rq2yObbET3VnBjb2aoKBxFxd
	 3MHgLu8/H92qlqBSFbN/UdQqE+BnwISaoI2RY2kyu8UKMv0Wpp4L9rnL5m9WacTeXs
	 UhLGUniiT+nY2ftiBlg8UUm3wX+iFImcfxVZC2ff4H/OqW31BpR0fRqFpZiYLlczTM
	 9S70z+/0wIWMw==
From: Jakub Kicinski <kuba@kernel.org>
To: arouhi@sitime.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	jiri@resnulli.us,
	vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	ivecera@redhat.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v15 09/13] dpll: sit9531x: add support to get and set frequency on pins
Date: Mon, 16 Nov 2026 18:18:18 -0800
Message-ID: <20261117021818.2220307-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-10-arouhi@sitime.com>
References: <20261110202607.55744-10-arouhi@sitime.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dpll: sit9531x: add support to get and set frequency on pins

This patch adds frequency_get for input and XO pins, using the rate from
the firmware description. Output pins get frequency_get and frequency_set,
with the rate computed as Fvco / DIVO. Setting an output rate writes a new
DIVO in the PRG_CMD programming state, commits it with UPDATE_NVM and
LOOP_LOCK, and then runs a phase flush on the PLL.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index b4e44f0d9820b..c7ab33993c288 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -1135,6 +1235,507 @@ int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,

[ ... ]

> +static int sit9531x_output_phase_flush(struct sit9531x_dev *sitdev, u8 pll_idx)
> +{
> +	u8 ctrl, orig, phfl, armed_mask = 0, parked = 0, i;
> +	int rc, ret;
> +
> +	rc = sit9531x_read_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_CONFIG47,
> +				  &phfl);
> +	if (rc)
> +		return rc;
> +	if (!(phfl & SIT9531X_PLL_CONFIG47_PHFL_EN))
> +		return sit9531x_write_pll_u8(sitdev, pll_idx,
> +					     SIT9531X_PLL_REG_DIRECTIVES,
> +					     SIT9531X_PLL_DIRECTIVE_RESTART);
> +
> +	/*
> +	 * The phase trigger is chip-global and fires every PLL with on-demand
> +	 * flush enabled; record which ones the profile arms.
> +	 */

[ ... ]

> +	for (i = 0; i < SIT9531X_NUM_PLLS; i++) {
> +		if (i == pll_idx || !(armed_mask & BIT(i)))
> +			continue;
> +		parked |= BIT(i);
> +		rc = sit9531x_update_pll_u8(sitdev, i,
> +					    SIT9531X_PLL_REG_PHFL_CTRL,
> +					    SIT9531X_PLL_PHFL_ON_DEMAND_EN, 0);
> +		if (rc)
> +			goto unpark;
> +		rc = sit9531x_pll_small_update(sitdev, i);
> +		if (rc)
> +			goto unpark;
> +	}

[Severity: Medium]
Is a full PLL restart meant to be a side effect of setting one output's
frequency? regs.h describes the bit as "the restart bit restarts the PLL".
When PHFL_EN is clear in the profile, the call chain
sit9531x_output_freq_set() -> sit9531x_output_phase_flush() would glitch
every output on this PLL and drop its lock. Any PLL cascaded from it would
also lose its reference.

Nothing marks the channel stale or refreshes the lock state after the
restart. Would userspace keep seeing the old lock status until the next
poll?

When PHFL_EN is set, the loop above clears ON_DEMAND_EN and issues
SMALL_UPDATE on every other armed PLL, then restores them. A request on one
DPLL device therefore writes registers that belong to the other DPLL
devices.

The commit message only says:

  The phase flush after it is enabled per PLL, so it realigns every
  output the PLL drives.

Could it also mention the PLL restart and the writes to other PLLs? The
later "dpll: sit9531x: add support to adjust output phase" patch also only
describes a divider-phase restart.

[ ... ]

> +static int sit9531x_output_divo_write(struct sit9531x_dev *sitdev, u8 out_idx,
> +				      u64 divo, bool *back)
> +{

[ ... ]

> +	slot = info->clkout_map[out_idx];
> +
> +	if (slot > SIT9531X_PAGE_OUTSYS0_SLOT_MAX)
> +		page = SIT9531X_PAGE_OUTSYS1;
> +	else
> +		page = SIT9531X_PAGE_OUTSYS0;

[Severity: Medium]
For slots above SIT9531X_PAGE_OUTSYS0_SLOT_MAX, the DIVO bytes go to page
4. However, sit9531x_prg_enter() only unlocks the key on page 3:

    #define SIT9531X_REG_OUTSYS_DEBUG		SIT9531X_REG(0x03, 0xBD)

regs.h describes this register as "Debug register (same offset,
per-page)". The comment in sit9531x_prg_commit() says "The debug key
register unlocks every debug register". Which of these is right?

If page 4 has its own key at 0xBD, would the DIVO writes for slots 6-11 be
ACKed but dropped? sit9531x_output_freq_set() would then still cache
fvco / divo as the new rate and return success.

[ ... ]

> +int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,
> +			     u8 pll_idx, u64 frequency)
> +{

[ ... ]

> +	rc = sit9531x_prg_enter(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	rc = sit9531x_output_divo_write(sitdev, out_idx, divo, &back);
> +	/* NVM update and loop lock */
> +	ret = sit9531x_prg_commit(sitdev);

[Severity: Medium]
Suppose sit9531x_output_divo_write() fails partway and its rollback also
fails. It logs "the divider is part old and part new" and returns an error.
Is it intended that sit9531x_prg_commit() then writes SIT9531X_UPDATE_NVM
over that torn 34-bit divider anyway?

The back result is not checked here. sit9531x_prg_abort(), which does
LOOP_LOCK without UPDATE_NVM, is not used on this path either.

Later in the series prg_abort() is removed, and freq_set() always commits
("Always leave PRG_CMD so the loops re-lock"). The torn divider is still
committed there; the only change is that chan->flush_pending gets set.

> +	if (ret && !rc)
> +		rc = ret;
> +	if (rc)
> +		return rc;

[Severity: Medium]
What happens if the divider write succeeds, but the UPDATE_NVM write in
sit9531x_prg_commit() fails while LOOP_LOCK succeeds? loops_open stays
false, so the background retry never runs. The new DIVO bytes are neither
rolled back nor committed.

sit9531x_dpll_output_pin_frequency_set() then does:

	if (rc) {
		if (!sit9531x_output_freq_get(sitdev, dpin->id, &hz))
			moved |= hz != was;
	}

This reads the uncommitted DIVO, caches Fvco / DIVO in out.freq, and calls
__dpll_pin_change_ntf() as if the rate had changed.

If the divider only takes effect after UPDATE_NVM, could the reported and
cached rate differ from what the part produces, with nothing correcting it
later? Later in the series this path also sets chan->flush_pending, but
UPDATE_NVM is still not retried.

[ ... ]

> +int sit9531x_output_freq_get(struct sit9531x_dev *sitdev, u8 out_idx,
> +			     u64 *frequency)
> +{

[ ... ]

> +	pll_idx = sitdev->out[out_idx].pll_idx;
> +	if (pll_idx >= SIT9531X_NUM_PLLS || !sitdev->out[out_idx].routed) {
> +		sitdev->out[out_idx].freq = 0;
> +		return -ENODATA;
> +	}
> +
> +	rc = sit9531x_get_fvco(sitdev, pll_idx, &fvco);
> +	if (!rc)
> +		rc = sit9531x_output_divo_read(sitdev, out_idx, &divo);
> +	if (rc) {
> +		if (rc == -ENODATA)
> +			sitdev->out[out_idx].freq = 0;
> +		return rc;
> +	}
> +
> +	*frequency = div64_u64(fvco, divo);
> +	sitdev->out[out_idx].freq = *frequency;

[Severity: Medium]
sit9531x_get_fvco() returns success when Fref * DIVN is outside the PLL's
VCO band. Its own comment says such a value "is usually not the rate the
PLL runs at, as for a PLL fed from another PLL". For that reason,
sit9531x_output_divo_calc() and sit9531x_output_phase_adjust_set() both
refuse an out-of-band Fvco.

Should this path also check sit9531x_fvco_in_band()? Without the check, a
pin get or dump on an output of a cascaded PLL reports and caches
Fvco / DIVO from the same untrusted Fvco. sit9531x_pin_props_get() also
seeds the cache through this function at registration.

[ ... ]

> @@ -1841,6 +2442,10 @@ sit9531x_dev_chan_states_update(struct sit9531x_dev *sitdev)
>  	bool answered = false;
>  	int i, rc;
>  
> +	/* Retry pending writes first so the reads below see their result */
> +	if (sitdev->loops_open)
> +		sit9531x_prg_commit(sitdev);

[Severity: Medium]
sit9531x_prg_commit() is documented to run after sit9531x_prg_enter(). By
the time loops_open is set, the failed attempt has already re-locked the
page 3 debug key at the end of prg_commit():

	rc3 = sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
				   SIT9531X_DEBUG_LOCK_VAL);

This retry therefore writes UPDATE_NVM and LOOP_LOCK to
SIT9531X_REG_PRG_DIR_GEN while the key is locked and outside PRG_CMD.
prg_enter() unlocks the key before it writes PRG_DIR_GEN, which suggests
the key is needed.

If the part ignores the write while the key is locked, the I2C write is
still ACKed, and this line clears the flag:

	sitdev->loops_open = !!rc2;

Could the loops then stay unlocked with no further retry? The same applies
to the retry in sit9531x_dev_stop(), which would also skip its "output
loops left unlocked at removal" warning. Both retry sites are unchanged at
the end of the series.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index f03145f4d1eed..a450a81d02f4c 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> +/*
> + * Report Fvco / DIVO, or the cached rate when the divider chain does not
> + * resolve.
> + */
> +static int
> +sit9531x_dpll_output_pin_frequency_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv, u64 *frequency,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin = pin_priv;
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +	struct sit9531x_dev *sitdev = sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc = sit9531x_output_freq_get(sitdev, dpin->id, frequency);
> +	if (rc == -ENODATA)
> +		*frequency = sit9531x_out_state_get(sitdev, dpin->id)->freq;

[Severity: Low]
Can this fallback ever return a cached rate? Both -ENODATA paths in
sit9531x_output_freq_get() set sitdev->out[out_idx].freq = 0 before they
return. This line therefore always reads 0 and reports success.

For an unrouted or unprogrammed output, the result is
DPLL_A_PIN_FREQUENCY = 0. That is outside the 1 Hz to 1 GHz range the
driver advertises for outputs.

Should the comment and the fallback be updated? Alternatively, should the
cache be left alone on -ENODATA?

[ ... ]

> +	if (rc) {
> +		struct dpll_pin *dpll_pin;
> +
> +		NL_SET_ERR_MSG(extack, "Output frequency set failed");

[Severity: Low]
Does this message ever reach userspace? dpll_pin_freq_set() in
dpll_netlink.c overwrites the extack whenever ops->frequency_set() fails:

	NL_SET_ERR_MSG_FMT(extack, "frequency set failed for dpll_id:%u", dpll->id);

The actual rejection reasons in sit9531x_output_divo_calc() only go to
dev_dbg. These are: the rate is not exactly Fvco/N, the VCO is out of
band, the divider is too large, or the output is unrouted. Userspace gets a
bare -EINVAL with generic text.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index 69877fc940284..f726fbe037f3d 100644
> --- a/drivers/dpll/sit9531x/prop.c
> +++ b/drivers/dpll/sit9531x/prop.c

[ ... ]

> @@ -241,6 +244,21 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  	if (sync_in || sync_out)
>  		return props;
>  
> +	/*
> +	 * Read the divider into the cached output rate used by phase adjust;
> +	 * -ENODATA is an unprogrammed divider or unknown VCO rate.
> +	 */
> +	if (dir == DPLL_PIN_DIRECTION_OUTPUT &&
> +	    index < sitdev->info->num_outputs) {
> +		u64 hw_freq;
> +
> +		mutex_lock(&sitdev->multiop_lock);
> +		rc = sit9531x_output_freq_get(sitdev, index, &hw_freq);
> +		mutex_unlock(&sitdev->multiop_lock);
> +		if (rc && rc != -ENODATA)
> +			goto err_alloc_ranges;
> +	}

[Severity: Low]
Is this comment accurate? Phase adjust does not read sitdev->out[].freq,
either here or later in the series. sit9531x_output_phase_adjust_set()
reads DIVO directly ("Take the period from the divider; the cached rate is
whole hertz"). The only readers are the frequency_get fallback and the was
value in frequency_set.

A non-ENODATA I2C error here fails pin registration. Is this readback
needed at probe at all?

[ ... ]
