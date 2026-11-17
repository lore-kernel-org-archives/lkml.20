Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881907;
	b=AboWtDp7wZ/Kk7Lq8imXklxJ+wfCmQbqrgzqOh4a9IfoAMgP4loC2eAI7uubTGCVJBbV
	 PJTd9ezRQBxnkwLP2QVCmsRRxb+c7bnpINp7K60Pzgp6uJyEczD6n1ADjd+0e7vmA2iHm
	 phU0O1KVG5P/wIyFDDjSggf/LBpF00+i1KS6+gTD68CX3ACMtgPsflgN3T+D1jZKBzWMg
	 j3oyhNDHQzQjhT2BtkzwcnxWakro2ZsP8Ivfsjf94lNNby3n3MYmsDr7JaxqoHzFCnBmX
	 idxxG4vYIZxBxoETmIE6nVjjD6uXZj4ROgSjSmv6afS+vf/nByTLEzK73ZiJKtIOjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881907;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uXNAolqoDuD1b2D+yUcAQm+hCu7hdccYS5JOFuamf7k=;
	b=L0uU9z5poLPjCha7Ab0XYiBimOYy1m26XHBf1vS8ZpD3JBz8xsSjVDNbamsuvOb4YfrE
	 5RU3LIceIQO5kvxxTBXsZzpWZwpBLfCrskv934SM7YadWUSFJLwuhfEUPliiQ63DCXo+b
	 AA4ZIE8ZOHnCojDDCWU4DD6GZOnUt113dysSL3SPdLvYEmYv/u3VjaprTGC84hR96J6CD
	 +AzC5Wpp/F7qn8ia+ZNsLWh4VUZWpBYNzDRRduoRwg0u6x+URWqUR+rb/CqzN3f96OfsJ
	 cfQeiPyOfaZbxiYbUO9Tg4qcPUu8oQB0btHWHNjtL/0q0VPe9SRdlxbH+7G3l1OPdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVPZkEOu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C76606A880;
	Tue, 17 Nov 2026 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVPZkEOu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA881F000C9;
	Tue, 17 Nov 2026 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881907;
	bh=uXNAolqoDuD1b2D+yUcAQm+hCu7hdccYS5JOFuamf7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TVPZkEOuIRkqnWOuJGzNyYvmd/794cG3j6ig+syo8w+MbEeE3yzeVouzWhrh5WVM4
	 6Q9K7cKTRKJpDk6H2UwtZr77gED4zoQzh+HMas/PstSrE2UffRnz4Pmlw2j7Z+qVat
	 svxuZ32tPyH2Ybm65mEDyCSg7Iu7YlYrNhbrxCeGhv1dcRvYqI9heClPXMsKNR0vaN
	 C1FQcnHvPahRSxwSJ63dNLL9zEAnGvZLqg0Rc+Kl3RnasGHkNf5oKT/RNkqJ9f9T06
	 pQxMA6Z9rLPEo6ZgWX/TLwTmilFvqbFzGq2og+6MwyyVdbGdsCXRZeN5bX19TAx7C3
	 Zye6tPqBgdpeA==
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
Subject: Re: [PATCH net-next v15 12/13] dpll: sit9531x: add support to get phase offset on the connected input pin
Date: Mon, 16 Nov 2026 18:18:25 -0800
Message-ID: <20261117021825.2220421-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-13-arouhi@sitime.com>
References: <20261110202607.55744-13-arouhi@sitime.com>
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
dpll: sit9531x: add support to get phase offset on the connected input pin

This patch adds a phase_offset_get callback for the sit9531x input pins.
The callback reads the on-chip TDC through the PLL debug window and
converts the code to picoseconds using the PLL's Fvco. It also adds retry
handling for debug taps and debug keys left changed, and moves the stop
path's pending-write retries into a helper that the probe error path now
calls too.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 9896d5aa40f56..8f305cc27737e 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -2559,6 +2585,171 @@ static int sit9531x_clear_notifications(struct sit9531x_dev *sitdev)
>  	return 0;
>  }
>  
> +/**
> + * sit9531x_phase_offset_read - read phase difference via TDC
> + * @sitdev: device pointer
> + * @pll_idx: PLL index (0-3)
> + * @phase_offset: phase difference in 1/DPLL_PHASE_OFFSET_DIVIDER ps
> + *
> + * The TDC code is a 35-bit magnitude with a separate sign bit;
> + * phase_diff = tdc_code / fvco. Caller must hold sitdev->multiop_lock.
> + *
> + * Return: 0 on success, -ENODATA if Fvco is unknown, <0 on other errors
> + */
> +int sit9531x_phase_offset_read(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			       s64 *phase_offset)
> +{

[ ... ]

> +	rc = sit9531x_get_fvco(sitdev, pll_idx, &fvco);
> +	if (rc) {
> +		if (rc == -ENODATA)
> +			dev_dbg(sitdev->dev,
> +				"PLL%c: Fvco unknown, skip TDC\n",
> +				'A' + pll_idx);
> +		return rc;
> +	}

[Severity: Medium]
Can this scale the TDC code by an Fvco that the driver itself treats as
wrong?

For an out-of-band value, sit9531x_get_fvco() warns once per PLL and still
returns 0:

drivers/dpll/sit9531x/core.c:sit9531x_get_fvco() {
    ...
	/*
	 * Outside the PLL's VCO band, Fref * DIVN is usually not the rate the
	 * PLL runs at, as for a PLL fed from another PLL.
	 */
	if (!sit9531x_fvco_in_band(pll_idx, *fvco) &&
	    !(sitdev->fvco_band_warned & BIT(pll_idx))) {
		...
	}

	return 0;
}

sit9531x_output_phase_adjust_set() and the output frequency setter reject
an out-of-band Fvco through sit9531x_fvco_in_band(). This path has no such
check.

When a PLL's Fref * DIVN is out of band, would a phase offset scaled by the
wrong Fvco be reported as a valid DPLL_A_PIN_PHASE_OFFSET? After the first
warning there would be no indication at all. The kernel-doc above also
promises "-ENODATA if Fvco is unknown".

[ ... ]

> +	/*
> +	 * A status data read latches a sample and returns the previous one;
> +	 * read three times as the documented procedure does.
> +	 */
> +	for (i = 0; i < SIT9531X_DBG_STATUS_READS; i++) {
> +		rc = sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DBG_STATUS_DATA,
> +					  &v);
> +		if (rc)
> +			goto relock;
> +	}

[Severity: Low]
Should SIT9531X_PLL_REG_DBG_STATUS_ADDR be programmed before these reads?

According to regs.h, the address register "selects the block the data
register reports". Nothing writes it here, so the latch reads use the last
address written. The only writer is sit9531x_chan_routed_ref_read(), which
leaves SIT9531X_DBG_STATUS_ROUTED_SRC in place.

In today's only caller, the first routed-ref read always runs just before
this, so the state is predictable. Neither the kernel-doc nor regs.h
mentions that dependency, though.

If the Dig_Sys_read latch only advances for a specific status address,
could DBG_DATA_0..4 hold a stale or unrelated sample here?

[ ... ]

> +	/* Per the register map the sign bit set means a positive offset. */
> +	tdc_signed = sign ? (s64)tdc_raw : -(s64)tdc_raw;

[Severity: Medium]
Does "positive" in the register map match the DPLL uAPI sign convention?

Documentation/driver-api/dpll.rst defines DPLL_A_PIN_PHASE_OFFSET as:

  The negative value means that phase of signal on pin is earlier in time
  than dpll's signal. Positive value means that phase of signal on pin is
  later in time than signal of a dpll.

Neither this comment nor SIT9531X_TDC_SIGN_BIT in regs.h says which signal
the register map treats as leading. If positive there means the reference
leads the feedback, every reported offset would have the opposite sign.

Could the comment say which convention the hardware uses?

[ ... ]

> @@ -2689,13 +2880,20 @@ static int sit9531x_chan_select_fetch(struct sit9531x_dev *sitdev, u8 pll_idx)
>  	return 0;
>  }
>  
> -/*
> - * Read the reference the device feeds a PLL from the debug status bus; the
> - * active selection does not change on a fallback. The caller rules out free-run
> - * first and must hold sitdev->multiop_lock.
> +/**
> + * sit9531x_chan_routed_ref_read - read the reference the device feeds a PLL
> + * @sitdev: device pointer
> + * @pll_idx: PLL index (0-3)
> + * @ref: logical input index, SIT9531X_INTSYNC_PIN_ID, or SIT9531X_REF_INVALID

[Severity: Low]
Should SIT9531X_MAX_INPUTS also be listed for @ref?

sit9531x_hw_src_input() maps SIT9531X_PRIO_SRC_OCXO to SIT9531X_MAX_INPUTS,
the XO slot. That value is not below info->num_inputs. A future caller of
the newly exported helper could use it to index state sized by num_inputs.

[ ... ]

> @@ -3637,6 +3833,61 @@ static void sit9531x_dev_stop(struct sit9531x_dev *sitdev)

[ ... ]

> +err_unregister:
> +	list_for_each_entry_continue_reverse(sitdpll, &sitdev->dplls, list)
> +		sit9531x_dpll_unregister(sitdpll);
> +
> +	sit9531x_dev_pending_retry(sitdev);
> +
> +	return rc;
> +}

[Severity: Low]
This isn't a bug, but the probe failure path changes here and the commit
message doesn't mention it.

Before this patch, err_unregister only unregistered the DPLLs. It now runs
the former body of sit9531x_dev_stop(): priority table write-backs, forced
holdover release, phase flush undo, output re-timing, sit9531x_prg_commit()
and divider flushes.

Would this fit better as a separate fix, or in the patch that added the
pending-write machinery?

Some other parts don't seem to belong here either:

- The reworded comment above sit9531x_reselect() is unrelated to phase
  offset.
- tap_pending was added in "dpll: sit9531x: add support to adjust output
  phase" with no user. Its companions tap_write_code, tap_read_code and
  key_pending only arrive in this patch.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index e6271ebd47ac1..ba4ac5e7d365d 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -488,6 +488,122 @@ sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
>  	return 0;
>  }
>  
> +/*
> + * Report the loop's residual phase error, sampled with the loop closed. The TDC
> + * compares against a signal the PLL drives, so a PLL driving no output returns
> + * -ENODATA.
> + */

[Severity: Medium]
Is "sampled with the loop closed" actually enforced?

The callback never checks sitdev->loops_open. sit9531x_prg_commit() sets
it when the SIT9531X_LOOP_LOCK write fails on every try:

	sitdev->loops_open = !!rc2;

The poll worker treats that as a known state: it retries the commit and
skips flush pulses. Here, though, the decision to sample comes from
sit9531x_dpll_selection_active(), which uses lock state cached at the last
poll.

Suppose prg_commit() fails during an output frequency, mute or delay change.
Until the next poll, could the cache still report tracking, so the TDC is
sampled with the loops open and reported as a residual phase error?

> +static int
> +sit9531x_dpll_input_pin_phase_offset_get(const struct dpll_pin *pin,
> +					 void *pin_priv,
> +					 const struct dpll_device *dpll,
> +					 void *dpll_priv, s64 *phase_offset,
> +					 struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	/*
> +	 * Read the monitors live: on loss of signal the device falls back
> +	 * without a request.
> +	 */
> +	rc = sit9531x_input_mon_fetch(sitdev);
> +	if (rc) {
> +		mutex_unlock(&sitdev->multiop_lock);
> +		NL_SET_ERR_MSG(extack,
> +			       "Failed to read the input clock monitors");
> +		return rc;
> +	}

[Severity: Medium]
Can a transient I2C error here end the whole system-wide pin dump?

For the routed, tracking pin, this callback does live I2C on every pin GET,
every pin DUMP and every pin change notification. That covers an optional
output state refresh, two monitor fetches, two routed-ref reads and the
full TDC sequence in sit9531x_phase_offset_read(). In total that is dozens
of transfers under multiop_lock.

The earlier patch "dpll: sit9531x: register DPLL devices and pins" caches
status "so a netlink call does not become a burst of I2C transfers". This
commit message doesn't mention moving away from that.

Every I2C failure becomes a hard error. That includes failures in
sit9531x_output_state_refresh() and sit9531x_input_mon_fetch(), which only
decide whether the optional attribute is present.

In sit9531x_phase_offset_read(), a failed tap restore or relock is already
queued for retry, yet it still replaces a valid sample:

	ret = sit9531x_tap_restore(sitdev, pll_idx);
	if (ret)
		chan->tap_pending = true;
	if (ret && !rc)
		rc = ret;

The core only tolerates -ENODATA:

drivers/dpll/dpll_netlink.c:dpll_msg_add_phase_offset() {
    ...
	if (ret) {
		if (ret == -ENODATA)
			return 0;
		return ret;
	}
    ...
}

and dpll_nl_pin_get_dumpit() only carries on after -ENODEV:

		ret = dpll_cmd_pin_get_one(skb, pin, cb->extack);
		if (ret) {
			genlmsg_cancel(skb, hdr);
			if (ret == -ENODEV) {
				ret = 0;
				continue;
			}
			break;
		}

Wouldn't a single I2C error on this device drop the pins of every other
DPLL driver listed after it in the dump? It would also make
dpll_pin_event_send() drop the notification. The driver's own comment
already notes that "the core fails a whole pin dump if any callback
returns an error".

Should these cases return -ENODATA instead, at least once a valid sample
has been taken?

[ ... ]

> +	rc = sit9531x_chan_routed_ref_read(sitdev, sitdpll->id, &routed);
> +	if (!rc && routed == dpin->id) {
> +		rc = sit9531x_phase_offset_read(sitdev, sitdpll->id, &offset);
> +		if (!rc)
> +			rc = sit9531x_chan_routed_ref_read(sitdev, sitdpll->id,
> +							   &routed);

[Severity: Medium]
Can these routed-ref reads leave the PLL debug window unlocked without
key_pending recording it?

sit9531x_phase_offset_read() ends with:

	chan->key_pending = !!ret;

so after a successful relock, key_pending is false. The second
sit9531x_chan_routed_ref_read() then unlocks SIT9531X_PLL_REG_DEBUG again.
If its final lock write fails all SIT9531X_CLOSE_TRIES, it only returns
the error:

relock:
	lock_rc = sit9531x_write_pll_close(sitdev, pll_idx,
					   SIT9531X_PLL_REG_DEBUG,
					   SIT9531X_PLL_DEBUG_LOCK);

	return rc ? rc : lock_rc;

The first routed-ref read behaves the same way.

In that case sit9531x_tap_back_retry() returns early:

	if (!chan->tap_pending && !chan->key_pending)
		return;

So neither the poll worker nor sit9531x_tap_pending_retry() (on stop or
probe failure) relocks the window. The only other closer is
sit9531x_chan_state_fetch(), and it calls the routed-ref read only while
the PLL is tracking.

If the PLL then moves to holdover, free-run or OUTER_DIS, does the debug
window stay open, even after the driver is removed?

[ ... ]

> @@ -520,12 +638,14 @@ static const struct dpll_pin_ops sit9531x_dpll_input_pin_manual_ops = {

[ ... ]

>  static const struct dpll_pin_ops sit9531x_dpll_input_pin_norate_manual_ops = {
>  	.direction_get		= sit9531x_dpll_input_pin_direction_get,
>  	.state_on_dpll_get	= sit9531x_dpll_input_pin_state_on_dpll_get,
>  	.operstate_on_dpll_get	= sit9531x_dpll_input_pin_operstate_on_dpll_get,
> +	.phase_offset_get	= sit9531x_dpll_input_pin_phase_offset_get,
>  };

[Severity: Low]
What about the XO pin? The commit message says:

  Only the input the part feeds the PLL has an offset.

but sit9531x_dpll_xo_pin_ops has no phase_offset_get:

static const struct dpll_pin_ops sit9531x_dpll_xo_pin_ops = {
	.direction_get		= sit9531x_dpll_input_pin_direction_get,
	.frequency_get		= sit9531x_dpll_input_pin_frequency_get,
	.state_on_dpll_get	= sit9531x_dpll_xo_pin_state_on_dpll_get,
};

SIT9531X_PRIO_SRC_OCXO is a priority table source, and
sit9531x_hw_src_input() maps it to SIT9531X_MAX_INPUTS, the XO pin id. So
sit9531x_chan_routed_ref_read() can report the XO as routed, and a PLL
tracking the OCXO never reports an offset.

Is the XO meant to be excluded? If so, could the commit message say so and
explain why the TDC doesn't apply to it?
