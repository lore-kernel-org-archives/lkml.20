Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881910;
	b=OBWF7zIu9eWJtVVZlyVc/OGT8uN4e4vDV4g1o+sTkgXGBgXtYrcKrPnZCbGpFTPSYh9P
	 fWSrfFgPqKa3BBt/oQZ5L4mTZCo+x6WeTuFN/cRp/aerxl2UsbqUZ26XvfifqylGqYRSY
	 wr0KuZMV4aXP+eW6qKNEsDJWMxL7let+mBWUCvvelGn4VgwL+R8EyKM3Qv2xT5ETE4d9V
	 QsqZpwUmWt6qzQttmdxAEoT5Jr9nCrn3qyQ1s0cFO/LRdGSCQ1zKy6Iwa81lSWANhE6if
	 Bb5M2wYtOSBxd0tsxRTutqDvaaO9ul1adsqSnd4juk9EuZXm/duronQgYk6fFFrR6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881910;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Iug4TGD754qTGDCf5G9syud2pIcOMBho6GRbOeFJ2eM=;
	b=19nLr+a/gjcwCkj9+Tc+CfYQag8qs5yeZVSU+KHqzljZYkk8+IAkOvv+9pJBm+JJptdc
	 D/Oq+Wx8KN3bLiqkHYfow6WyEZduGuZPiDUldyTqBZob2uZXvfqQkI8FSMyfGHfhZZg3B
	 BJKIb264J5zKGKBiZ6Iro5FCOvMNSrLwpYGwNxpbA9b67hDzzDiskczlSTtWWYR0xIlCG
	 nKY4oraelmyc5kR5xWtqBh/kmCVNszyUL8LMmEqBhlTO7G/n2gAhVAPyc58VEer4zA+nu
	 jq9Ge8gCa1HRJhRMQRgbyEMAS7RXDk324ogf+l+31TnUmrZyQe2PUfwzgsmLuobLTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEjVcZzi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E15606A330;
	Tue, 17 Nov 2026 02:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEjVcZzi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E29C1F000C4;
	Tue, 17 Nov 2026 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881910;
	bh=Iug4TGD754qTGDCf5G9syud2pIcOMBho6GRbOeFJ2eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LEjVcZziI109Xn5JMSCKjugQlpC6pcFAAjTW299SRsPCILV8vxeoXFs1AscQG4qw1
	 Nez/j5Ytq7OsgY+YgItILZL58Ay01mGCbQp/4CNz5UHzYQKKiiBYCR6WjqWh0dY18J
	 0ML7X+1luOuPArL0p57IxzDDVlD0WEoQ3wVVxRRCvOOHfTiA9guC2JbvoXJe7hbveh
	 ivwF9s6TPQlb3BSBeve22y1ymnZsNNGIVART7fjKxrraPp7mlxuj+QUQQiJR0jeNSy
	 +vdFTEDy0/NfzuhFzzd+FtMCC1Ov+n+SaShORYaMZ+jBXwICDCc+gV3EqiR7wY1eYN
	 R2VoovQBZcBng==
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
Subject: Re: [PATCH net-next v15 13/13] dpll: sit9531x: model the inter-PLL sync line as a pair of pins
Date: Mon, 16 Nov 2026 18:18:27 -0800
Message-ID: <20261117021827.2220456-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-14-arouhi@sitime.com>
References: <20261110202607.55744-14-arouhi@sitime.com>
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
dpll: sit9531x: model the inter-PLL sync line as a pair of pins

This patch exposes the internal INTSYNC line as two pins: a source output
pin and a destination input pin on each DPLL. Taking the line writes a
register pattern to the source PLL's EXT page and sets a global enable.
The owner is detected from the pages, and connects are refused on
unrecognized or conflicting configurations. Resume now re-reads the
INTSYNC owner, the output mute state and the output delays.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 8f305cc27737e..e3ce7b6cad6b9 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -2585,6 +2604,556 @@ static int sit9531x_clear_notifications(struct sit9531x_dev *sitdev)
>  	return 0;
>  }
>  

[ ... ]

> +/*
> + * Values written to the source PLL's EXT page to enable or disable INTSYNC,
> + * which locks the frequency PLL to the phase PLL.
> + */
> +struct sit9531x_intsync_reg {
> +	u8 offset;
> +	u8 en_val;
> +	u8 dis_val;
> +};
> +
> +static const struct sit9531x_intsync_reg intsync_config[] = {
> +	{ 0x2D, 0x02, 0x00 },
> +	{ 0x50, 0x08, 0x00 },
> +	{ 0x51, 0x04, 0x00 },
> +	{ 0x54, 0x02, 0x00 },
> +	{ 0x55, 0x28, 0x20 },
> +	{ 0x5C, 0x0F, 0x00 },
> +	{ 0x5D, 0xFF, 0x00 },
> +	{ 0x6C, 0xDD, 0x00 },
> +};

[Severity: Low]
This isn't a bug, but the commit message says:

  Taking the line writes a pattern to the source's EXT page and sets a
  global enable; giving it up writes the disable pattern.

The pattern is eight unnamed offset/value pairs. They are written after
the EXT page debug window is unlocked with SIT9531X_PLL_DEBUG_UNLOCK. The
comment on sit9531x_intsync_debug_lock() says that key "opens every debug
register on the page". There are no register defines and no datasheet or
vendor reference for these values.

sit9531x_intsync_src_detect() also opens the debug window on all four EXT
pages at probe, on resume and on every refresh.

Could the commit message mention this? Could the registers get names or a
reference?

The order in the message is also the reverse of what
sit9531x_intsync_enable() does, which sets the global enable first and
writes the pattern second.

The message also describes "an output pin on the source PLL". However,
sit9531x_dpll_pin_is_registrable() now registers the SYNCOUT pin on every
DPLL:

	if (index == SIT9531X_INTSYNC_OUT_PIN_ID)
		return true;

sit9531x_drive_pins_ntf() also notes "The source pin is one pin registered
on every DPLL".

Could the description match the pin model that userspace sees?

[ ... ]

> +int sit9531x_intsync_readback(struct sit9531x_dev *sitdev)
> +{
> +	bool partial = sitdev->intsync_partial;
> +	s8 src = sitdev->intsync_src;
> +	int rc;
> +
> +	rc = sit9531x_intsync_src_detect(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	if (partial && (sitdev->intsync_src < 0 ||
> +			(sitdev->intsync_src == src &&
> +			 !sitdev->intsync_partial))) {
> +		sitdev->intsync_src = src;
> +		sitdev->intsync_partial = true;
> +		sitdev->intsync_foreign = false;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does this sticky partial record make sense on the resume path?

The comment in sit9531x_resume() says "A part that lost power returns
with its profile's INTSYNC routing". It then calls
sit9531x_intsync_readback(), not a fresh sit9531x_intsync_src_detect().

If a partial record existed before suspend, the new scan result is
overridden in two cases: the scan finds no source, or it finds the same
PLL fully enabled. In both cases intsync_foreign is also forced to false.

The kernel-doc reason, "a page reads the same latched or not", only holds
while the driver's own unlatched writes may still be in the page. After a
power loss and profile reload, the page holds the profile's real latched
values.

Some possible results:

- The profile fully enables INTSYNC from the recorded PLL, but that PLL's
  SYNCOUT pin reports DPLL_PIN_STATE_DISCONNECTED while the line is
  driven.

- The profile has no INTSYNC, but other PLLs still get "INTSYNC is already
  sourced by another PLL". The recorded PLL's destination also cannot be
  made selectable.

- The profile sets the global enable with no recognized page. Detect sets
  intsync_foreign = true and readback clears it. A later CONNECTED on the
  recorded PLL then passes every check, and sit9531x_intsync_enable()
  drives the line alongside the unrecognized configuration.

Would a plain detect be a better fit for resume?

[ ... ]

> +int sit9531x_intsync_enable(struct sit9531x_dev *sitdev, u8 src_pll_idx,
> +			    bool *rollback_failed, bool *touched)
> +{

[ ... ]

> +	rc = sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val);
> +	if (rc)
> +		return rc;
> +	if (touched)
> +		*touched = true;
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +			       val | BIT(SIT9531X_INTSYNC_EN_BIT));
> +	if (rc)
> +		goto err_disable;
> +
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_GLOBAL_UPDATE,
> +			       SIT9531X_SMALL_UPDATE_CMD);
> +	usleep_range(1000, 2000);
> +	if (rc)
> +		goto relock_err;
> +
> +	rc = sit9531x_write_u8(sitdev,
> +			       SIT9531X_REG(ext_page,
> +					    SIT9531X_PLL_REG_DEBUG),
> +			       SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		goto relock_err;
> +
> +	for (i = 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc = sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].en_val);
> +		if (rc)
> +			goto relock_err;
> +	}
> +
> +	rc = sit9531x_pll_small_update(sitdev, src_pll_idx);
> +	if (rc)
> +		goto relock_err;

[Severity: Medium]
Should the EXT page pattern be written and latched before the global
enable is set?

Here the global enable is set and applied with the page-0 small update
first. The restore path in __sit9531x_intsync_disable() notes "The page-0
small update applies the global enable". Only after that is the EXT page
unlocked, written, and latched with sit9531x_pll_small_update().

So for several milliseconds of I2C traffic the gate is live while no EXT
page holds a latched source configuration. sit9531x_intsync_src_detect()
treats exactly this state (global enable set, no page pattern) as foreign
and refuses connects in it.

Destination PLLs that list INTSYNC could select or lock to the line during
that window. If a pattern write fails, the line was also live with no
configured source until the rollback. The disable path already uses the
safe order: gate first, then page.

Unless the hardware requires the gate first, would it be safer to latch
the page before applying the global enable? What the part does with the
gate set and no latched pattern isn't documented in the tree.

> +
> +	rc = 0;
> +	goto relock;
> +
> +relock_err:
> +	sit9531x_intsync_debug_lock(sitdev, ext_page);
> +	goto err_disable;
> +
> +relock:
> +	lock_rc = sit9531x_intsync_debug_lock(sitdev, ext_page);
> +	if (lock_rc)
> +		dev_warn(sitdev->dev,
> +			 "PLL%c: INTSYNC enabled but the debug window was left open: %d\n",
> +			 'A' + src_pll_idx, lock_rc);
> +
> +	return rc;

[Severity: Low]
Can the EXT page debug window be left unlocked with nothing retrying the
close?

If sit9531x_intsync_debug_lock() still fails after the SIT9531X_CLOSE_TRIES
retries in sit9531x_write_close(), this path only warns and still returns
0. The relock label in __sit9531x_intsync_disable() does the same.

The caller, sit9531x_dpll_intsync_src_state_on_dpll_set(), runs
sit9531x_intsync_src_detect() afterwards, which acts as one more close
attempt. If that detect also fails, intsync_stale is only set when there
is a conflict:

	} else if (changed && detect_rc && sitdev->intsync_conflict) {
		sitdev->intsync_stale = true;
	}

So after a successful enable or disable, the poll never tries the close
again.

The main PLL page already has this covered by chan->key_pending and
sit9531x_tap_back_retry(). That path writes sit9531x_pll_page(pll_idx),
though, not the EXT page.

Should the EXT page lock be tracked the same way?

[ ... ]

> +static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,
> +				      u8 src_pll_idx, bool restore,
> +				      bool *owner_kept, bool *touched)
> +{

[ ... ]

> +	for (i = 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc = sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].dis_val);
> +		if (rc)
> +			goto restore_global;
> +	}
> +
> +	rc = sit9531x_pll_small_update(sitdev, src_pll_idx);
> +	if (rc && owner_kept)
> +		*owner_kept = true;
> +
> +	goto relock;
> +
> +restore_global:
> +	/*
> +	 * Restore the global enable, or finish the disable if the page holds
> +	 * the disable pattern.
> +	 */
> +	if (restore && in_window) {
> +		bool off;
> +
> +		if (sit9531x_intsync_page_off(sitdev, ext_page, &off)) {
> +			if (owner_kept)
> +				*owner_kept = true;
> +		} else if (off) {
> +			rc = sit9531x_pll_small_update(sitdev, src_pll_idx);
> +			if (rc && owner_kept)
> +				*owner_kept = true;
> +			goto relock;
> +		}
> +	}
> +
> +	if (restore && was_enabled) {
> +		int ret;
> +
> +		ret = sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +				       &val);
> +		if (!ret)
> +			ret = sit9531x_write_u8(sitdev,
> +						SIT9531X_REG_INTSYNC_GLOBAL,
> +						val |
> +						BIT(SIT9531X_INTSYNC_EN_BIT));
> +		if (!ret) {
> +			/* The page-0 small update applies the global enable */
> +			ret = sit9531x_write_close(sitdev,
> +						   SIT9531X_REG_GLOBAL_UPDATE,
> +						   SIT9531X_SMALL_UPDATE_CMD);
> +			usleep_range(1000, 2000);
> +		}

[Severity: Medium]
What state is the line in after this rollback?

Suppose one of the dis_val writes fails partway. in_window is then true,
and the page holds some disable values followed by the remaining enable
values. sit9531x_pll_small_update() has not latched them.

sit9531x_intsync_page_off() reports that the page is not off, so the code
falls through. It then sets and applies the global enable again over that
mixed page.

Next, the caller runs sit9531x_intsync_src_detect(). It sees a page with
both patterns and records intsync_src = pll with intsync_partial = true.
After that, sit9531x_dpll_intsync_src_connected() reports disconnected and
sit9531x_intsync_driven() treats the line as not driven.

There are two possibilities:

- If only the PLL small update latches EXT page writes, the line is still
  driven from the original latched pattern under the restored gate, while
  the driver reports it as not driven.

- If the page-0 update latches them too, the gate is on over a
  half-written configuration.

Would it be more consistent to rewrite the full enable pattern before
restoring the gate, or to leave the gate off?

[ ... ]

> @@ -4420,12 +5000,128 @@ static int sit9531x_suspend(struct device *dev)
>  static int sit9531x_resume(struct device *dev)
>  {

[ ... ]

> +	/*
> +	 * Drop and report writes pending from before suspend: a reloaded
> +	 * profile may have replaced their registers.
> +	 */
> +	for (i = 0; i < SIT9531X_NUM_PLLS; i++) {
> +		struct sit9531x_chan *chan = &sitdev->chan[i];
> +		bool retime = false;
> +		u8 j, ho;
> +
> +		/*
> +		 * A table write-back is pending only under forced holdover;
> +		 * once that is cleared, the next poll reads the table from the
> +		 * registers.
> +		 */
> +		if ((chan->table_pending || chan->ho_release_pending) &&
> +		    !sit9531x_read_pll_u8(sitdev, i, SIT9531X_PLL_REG_HO_CTRL,
> +					  &ho) &&
> +		    !(ho & BIT(SIT9531X_PLL_HO_FORCE_BIT))) {
> +			dev_warn(sitdev->dev,
> +				 "PLL%c: forced holdover cleared over suspend, priority table restore dropped\n",
> +				 'A' + i);
> +			chan->table_pending = false;
> +			chan->ho_release_pending = false;
> +		}
> +
> +		for (j = 0; j < sitdev->info->num_outputs; j++) {
> +			if (!sitdev->out[j].retime_pending ||
> +			    sitdev->out[j].pll_idx != i)
> +				continue;
> +			sitdev->out[j].retime_pending = false;
> +			retime = true;
> +		}
> +		if (!retime && !chan->flush_pending &&
> +		    !(sitdev->flush_arm_pending & BIT(i)))
> +			continue;
> +		dev_warn(sitdev->dev,
> +			 "PLL%c: pending before suspend, dropped:%s%s%s\n",
> +			 'A' + i, retime ? " delay re-time" : "",
> +			 chan->flush_pending ? " output realignment" : "",
> +			 (sitdev->flush_arm_pending & BIT(i)) ?
> +			 " on-demand flush enable" : "");
> +		chan->flush_pending = false;
> +		sitdev->flush_arm_pending &= ~BIT(i);
> +	}
> +	if (sitdev->flush_ctrl_pending) {
> +		dev_warn(sitdev->dev,
> +			 "flush trigger source select pending before suspend, dropped\n");
> +		sitdev->flush_ctrl_pending = false;
> +	}

[Severity: Medium]
Is it intended to drop these pending writes on every resume?

Nothing here checks that the part actually lost power. sit9531x_suspend()
only stops the IRQ and the poll:

	if (sitdev->irq > 0)
		disable_irq(sitdev->irq);
	kthread_cancel_delayed_work_sync(&sitdev->work);

The DT binding patch also says boards so far keep the part powered. In the
usual case, then, the registers survive suspend.

Before this patch, the poll retried these writes after resume through
sit9531x_retime_retry(), sit9531x_flush_retry() and
sit9531x_phase_flush_undo_retry(). The last of these writes the original
GPIO_FUNC_CTRL1 trigger select and the per-PLL PHFL enables back, and it
does nothing once the flags are clear:

	if (!sitdev->flush_ctrl_pending && !sitdev->flush_arm_pending)
		return 0;

With the flags cleared here, a pending delay re-time or realignment is
abandoned. So is the undo of a phase-flush trigger or enable change.
GPIO_FUNC_CTRL1 and PHFL_CTRL can then stay at the driver's temporary
values, and nothing retries them.

The commit message only says "Resume re-reads the line owner, the output
mutes and the output delays".

This pending-write policy is unrelated to INTSYNC. Could it go in a
separate patch with its own rationale?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index ba4ac5e7d365d..1bd2b962cdabe 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -177,16 +191,18 @@ const struct dpll_device_ops sit9531x_dpll_device_ops = {
>  };
>  
>  /*

[ ... ]

> + * selection naming the lost one. On manual input select, the routed input is
> + * CONNECTED. The INTSYNC destination has signal while the driver's record shows
> + * a PLL driving the line. An output or the INTSYNC source is CONNECTED while
> + * driven and DISCONNECTED otherwise; SELECTABLE is refused. The XO pin is
> + * always CONNECTED.
>   */

[Severity: Low]
This isn't a bug, but this sentence doesn't match sit9531x_intsync_driven().
That function also returns true when no complete source is recorded but a
PLL is locked to the line:

	if (chan->routed_ref == SIT9531X_INTSYNC_PIN_ID &&
	    chan->locked && !chan->ho_freeze &&
	    !chan->stale && !chan->intsync_dropped)
		return true;

So in the foreign or stale cases, the destination reports signal rather
than DPLL_PIN_OPERSTATE_NO_SIGNAL.

The comment on sit9531x_dpll_selection_no_signal() ("a PLL driving or
locked to the line") does match the code. Could the contract block say
the same?

[ ... ]

> @@ -662,6 +689,325 @@ sit9531x_dpll_output_pin_direction_get(const struct dpll_pin *pin,

[ ... ]

> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,

[ ... ]

> +	switch (state) {
> +	case DPLL_PIN_STATE_CONNECTED:
> +		if (was_connected)
> +			break;
> +		if (sitdev->intsync_src >= 0 &&
> +		    sitdev->intsync_src != sitdpll->id) {
> +			NL_SET_ERR_MSG(extack,
> +				       "INTSYNC is already sourced by another PLL");
> +			rc = -EBUSY;
> +			break;
> +		}

[Severity: Medium]
Can a partial record cause refusals that userspace has no way to see?

sit9531x_intsync_src_detect() records intsync_src = pll with
intsync_partial = true when it finds a page with both patterns, or the
whole pattern under a clear global enable. The error handling later in
this function also sets intsync_partial = true after an I2C failure in
enable or disable.

With that record:

- sit9531x_dpll_intsync_src_connected() returns false, so every SYNCOUT pin
  reports DPLL_PIN_STATE_DISCONNECTED.

- CONNECTED on any other PLL's SYNCOUT still fails here with -EBUSY.

- sit9531x_dpll_intsync_dst_state_on_dpll_get() and the existing
  sit9531x_dpll_pin_snapshot() force the recorded PLL's INTSYNC
  destination to disconnected. This happens even when its priority table
  lists INTSYNC and prio_get reports a slot:

	if (sitdev->intsync_src == sitdpll->id)
		*state = DPLL_PIN_STATE_DISCONNECTED;

- sit9531x_dpll_intsync_dst_state_on_dpll_set() refuses SELECTABLE on that
  destination with "PLL cannot lock to the INTSYNC it drives", although
  its source pin says it is not driving.

The only way out is a disconnect request on a SYNCOUT pin that already
reads disconnected. Nothing tells userspace to send it.

The foreign case (global enable set, no page with the pattern,
intsync_src == -1) seems to have no way out at all. A disconnect request
does nothing:

	case DPLL_PIN_STATE_DISCONNECTED:
		if (sitdev->intsync_src != sitdpll->id)
			break;

A connect request is refused, and nothing clears the global enable. The
source function then stays unusable until a profile reload or reboot.

The commit message only mentions refusals for an unrecognized enable and
for two pages. Should the partial state be reported consistently, or
exposed some other way?

[ ... ]

> +		hw_src = sit9531x_input_hw_src(SIT9531X_INTSYNC_PIN_ID);
> +		if (sit9531x_input_prio_present(sitdev, sitdpll->id, hw_src)) {
> +			NL_SET_ERR_MSG(extack,
> +				       "PLL selects INTSYNC as a reference; it cannot drive it");
> +			rc = -EBUSY;
> +			break;
> +		}
> +		rc = sit9531x_intsync_enable(sitdev, sitdpll->id, &owner_kept,
> +					     &changed);

[Severity: Medium]
Does this guard cover a PLL in manual input mode?

sit9531x_input_prio_present() only tests chan->prio_mask, and a manual
input PLL ignores its priority table.

sit9531x_chan_select_fetch() can set manual_ref to SIT9531X_INTSYNC_PIN_ID
when the select register holds the SIT9531X_PRIO_SRC_INTSYNC code:

	if (sel & SIT9531X_MAN_IN_SEL_FROM_REG) {
		sel = FIELD_GET(SIT9531X_MAN_IN_SEL_MASK, sel);
		chan->manual_ref =
			sit9531x_hw_src_input(sit9531x_prio_src_canon(sitdev,
								      sel));

With pin-based select, sit9531x_chan_state_fetch() can also report
routed_ref == SIT9531X_INTSYNC_PIN_ID. In neither case does INTSYNC have
to appear in prio_mask.

sit9531x_dpll_pin_ops_get() gives a manual PLL's SYNCOUT pin the same
sit9531x_dpll_intsync_src_pin_ops. So with no recorded source, no conflict
and no foreign enable, a connect request passes every check.
sit9531x_intsync_enable() then makes that PLL the line source while it is
using the line as its reference.

Automatic mode has the same gap while chan->table_pending is set. In that
case prio_mask is built from table_back, and routed_ref can still be
INTSYNC.

Should this also check chan->routed_ref and chan->manual_ref against
SIT9531X_INTSYNC_PIN_ID?

[ ... ]
