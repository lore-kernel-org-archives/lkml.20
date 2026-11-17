Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881896;
	b=l8CJrrhTvTiU4FyxZU4X8cuPL30l+7M1shfexVlK7Lkf+DAi/EkltObHWnJO3lZC2ufa
	 XtfBZYGp9vuDumThwvzVsWOWwnjL6yOftkp3nl91jAdKaU1+F25P53frrnEJpjGMpJ/u/
	 IFyfqF6LaloiRM7Yvnu1OJISwV0tCgKVRLHeGgZUA2jeWfj5LfcESeya0CQ2qvBFnImUf
	 bXP+GNYiBj8f7UjCHKIuvkfdFskx7tw81O8Oy6Hzr7dbu400NhG/QbdCafJtN5qlGcfAZ
	 whaFtImlfGY3uQxVNAU7uBH0Nl4NXQYzTt9FIX5klk3tB6+6FPQ5xQXvPGvG5jV7z9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881896;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sdSt55r0fTFx62nLZg0naHwKJZoMkcT4ngcWiMzRM/A=;
	b=VgjY2ZcC/0/2lHEv4LpOS/FBZPsE6jzrVdOX0GRUlt/Xadnq6fPtuIF6h2XvXwlxIZdP
	 QnI4eRZzGglissxian6Iqmwsv0/jqtAHDpKgvKzddhqKSt4HIbA7rsqgNVPk6K7Bik0md
	 ES/cFzobnQpUijaPTWb9rx/HjaXlgXSlgeEDqdZ+QcSvXVC7JRd/7NYb6aG9tAU1y4sME
	 feWKIt3zPZQ+/40lRY887yZKywS7R0huYnFDURsHrtTSqzA97WCR4UPcPlZogvrVkdw2b
	 FT+7SH1hQoxuG6q38UqNmPmMgy2LWCYMgYSu+QMclkR19wpdU5WIctIsyLxmsPvClLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYnpj4H6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D737606A881;
	Tue, 17 Nov 2026 02:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYnpj4H6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42711F00926;
	Tue, 17 Nov 2026 02:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881896;
	bh=sdSt55r0fTFx62nLZg0naHwKJZoMkcT4ngcWiMzRM/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FYnpj4H6Bo3eq8V1WuRRrlDYgEzJaCcGY2Dq42qf/3SI/ycXw1TXWB32BpcppMtUq
	 B/acZ39yO1dbnY9WfEzV6NVcSoLQ836lCPMVBccxa1Dj0JbOPtUhsm+o2LvAp828Rl
	 yp7/JtobAhTGQTScXAPb3YGOfk/dm7BbFH4H5d4qAGv3kl+I7yytxp8MBufr65+GOe
	 BLONXPDSJrw4i1EC+mUNDtnM1xUzhdZf4Ilx75etr72tCBSKebH8+APheYYysIq5Mq
	 aiLMTQINoQt40/R2egiAXW2h2XJSpCundYWPv+wW1conefAdVpS2sMsJCGkic3DKrV
	 XITiQ++86a2mQ==
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
Subject: Re: [PATCH net-next v15 06/13] dpll: sit9531x: register DPLL devices and pins
Date: Mon, 16 Nov 2026 18:18:14 -0800
Message-ID: <20261117021814.2220156-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-7-arouhi@sitime.com>
References: <20261110202607.55744-7-arouhi@sitime.com>
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
dpll: sit9531x: register DPLL devices and pins

This patch registers each SiT9531x PLL as a DPLL device with lock status
and mode callbacks, and registers the XO as an input pin on each one. A
kthread worker polls the status registers every 500 ms into a cache that
the callbacks read from; INTRB, where wired, schedules an early tick. The
clock_id is built from the SiTime OUI, the I2C bus number and the address.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 3ec1ab5aa56cc..209671e7917e2 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -181,122 +206,1415 @@ int sit9531x_update_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,

[ ... ]

> +static int sit9531x_chan_state_fetch(struct sit9531x_dev *sitdev, u8 pll_idx)
> +{

[ ... ]

> +	rc = sit9531x_read_u8(sitdev, SIT9531X_REG_OUTER_LOL_STATUS,
> +			      &outer_lol);
> +	if (rc)
> +		return rc;

[ ... ]

> +	rc = sit9531x_read_u8(sitdev, SIT9531X_REG_PLL_INNER_LOL_STATUS,
> +			      &inner_lol);
> +	if (rc)
> +		return rc;
> +
> +	rc = sit9531x_read_u8(sitdev, SIT9531X_REG_HO_FREEZE_STATUS,
> +			      &ho_freeze);
> +	if (rc)
> +		return rc;
> +
> +	rc = sit9531x_read_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_STATUS_1,
> +				  &pll_status_1);
> +	if (rc)
> +		return rc;
> +
> +	rc = sit9531x_prio_table_read(sitdev, pll_idx, srcs);
> +	if (rc)
> +		return rc;
> +
> +	sit9531x_prio_mask_build(sitdev, pll_idx, srcs);

[Severity: Low]
This runs once per PLL on every 500 ms tick. That means each of the three
global page 0 status registers (SIT9531X_REG_OUTER_LOL_STATUS,
SIT9531X_REG_PLL_INNER_LOL_STATUS and SIT9531X_REG_HO_FREEZE_STATUS) is
read four times per tick, when one read would cover all PLLs. Could they
be read once in sit9531x_dev_chan_states_update() and passed down?

The 11-slot priority table is also re-read for every PLL on every tick.
At this point in the series the only thing built from it is prio_mask,
and nothing consumes prio_mask yet.

Add the input reads, the eight notification writes and the page selects,
and the poll issues roughly 100 I2C transactions per tick, even with no
DPLL listener. The commit message says the poll keeps a netlink call from
turning into "a burst of I2C transfers", but it does not mention this
ongoing load. The redundant per-PLL reads of the global registers are
still there at the end of the series.

[ ... ]

> +static void sit9531x_dev_periodic_work(struct kthread_work *work)
> +{
> +	struct sit9531x_dev *sitdev = container_of(work, struct sit9531x_dev,
> +						   work.work);
> +	struct sit9531x_dpll *sitdpll;
> +	int rc;
> +
> +	/*
> +	 * Release multiop_lock before the change checks: their notifications
> +	 * take DPLL-subsystem locks, which nest outside it.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	sit9531x_dev_ref_states_update(sitdev);
> +	sit9531x_dev_chan_states_update(sitdev);
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	list_for_each_entry(sitdpll, &sitdev->dplls, list)
> +		sit9531x_dpll_changes_check(sitdpll);
> +
> +	/*
> +	 * Clear the W1C notification latches on pages 0 and 6 after acting on
> +	 * them; while set they keep INTRB asserted.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc = sit9531x_clear_notifications(sitdev);
> +	mutex_unlock(&sitdev->multiop_lock);

[Severity: Medium]
Are any of these latches read before they are cleared?

sit9531x_clear_notifications() writes 0xFF to the sticky outer LOL,
holdover freeze, inner LOL and clock monitor notification registers on
pages 0 and 6. The lock and holdover state, though, comes only from the
live status bits that sit9531x_chan_state_fetch() reads.

So a loss of lock or a holdover entry that recovers before the next
status read is acknowledged in hardware here and never reported through
dpll_device_change_ntf(). The same goes for an event that latches between
sit9531x_dev_chan_states_update() and this clear.

The interrupt path has the same problem, because sit9531x_irq_thread_fn()
clears the latches before it queues the poll:

sit9531x_irq_thread_fn()
    sit9531x_clear_notifications()     <- latch that raised INTRB erased
    kthread_mod_delayed_work(..., 0)
sit9531x_dev_periodic_work()
    sit9531x_chan_state_fetch()        <- sees only the recovered live bits

Could the notification registers be read and folded into the reported
state before they are acknowledged? At the end of the series these NOTIF
registers are still only written, never read. EEPROM_NOTIF is the only
notification register the driver reads.

[ ... ]

> +/* Queue an immediate poll tick; polling continues as a fallback. */
> +static irqreturn_t sit9531x_irq_thread_fn(int irq, void *data)
> +{
> +	struct sit9531x_dev *sitdev = data;
> +	int rc;
> +
> +	/*
> +	 * Acknowledge here: IRQF_ONESHOT unmasks the line on return, and a
> +	 * still-asserted INTRB would fire again at once.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc = sit9531x_clear_notifications(sitdev);
> +	mutex_unlock(&sitdev->multiop_lock);
> +	if (rc) {
> +		dev_warn_ratelimited(sitdev->dev,
> +				     "IRQ: failed to clear notifications: %d\n",
> +				     rc);
> +		if (++sitdev->irq_ack_fails < SIT9531X_IRQ_ACK_TRIES)
> +			return IRQ_NONE;
> +
> +		dev_err(sitdev->dev,
> +			"IRQ %d disabled: notifications cannot be cleared, polling only\n",
> +			irq);
> +		disable_irq_nosync(irq);
> +		return IRQ_NONE;
> +	}

[Severity: Medium]
Can a brief I2C glitch disable this interrupt for the life of the
binding?

On failure the handler returns IRQ_NONE without queueing the early poll.
With IRQF_ONESHOT and a level-triggered INTRB that stays asserted, the
line fires again as soon as the thread returns. The eight attempts
allowed by SIT9531X_IRQ_ACK_TRIES therefore happen back to back.

After that, disable_irq_nosync() is called and nothing re-enables the
line. irq_ack_fails is reset only by a successful acknowledge in this
handler, which can no longer run. That stays true even after the poll
later clears the same latches successfully.

Suspend/resume does not recover it either: the disable_irq() and
enable_irq() pair there leaves the extra disable depth from
disable_irq_nosync() in place. The handler is unchanged at the end of the
series.

> +
> +	sitdev->irq_ack_fails = 0;
> +
> +	kthread_mod_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Is returning IRQ_HANDLED here correct when nothing confirms that INTRB
actually deasserted?

The driver does not program the INTRB mask registers, so the EEPROM/GUI
profile decides which latches can drive INTRB. Meanwhile
sit9531x_clear_notifications() clears only a fixed set of eight
registers. One example of a latch outside that set is the sticky EEPROM
NOTIFY_4 register (page 0 0x97): sit9531x_eeprom_state_report() reads it
at probe and deliberately leaves it set.

If the profile routes such a latch to INTRB, a level-triggered line with
IRQF_ONESHOT would re-fire immediately and indefinitely. Every pass
returns IRQ_HANDLED, so the spurious IRQ detector never trips. Every pass
also calls kthread_mod_delayed_work(..., 0), so the full poll would run
continuously. On an edge-triggered line the interrupt would never fire
again.

This depends on the profile, so it may not be reachable with current
configurations. The handler is unchanged at the end of the series.

[ ... ]

> +static int sit9531x_derive_clock_id(struct sit9531x_dev *sitdev)
> +{
> +	int adap = i2c_adapter_id(sitdev->client->adapter);

[ ... ]

> +	sitdev->clock_id = SIT9531X_OUI << 24 | (u64)adap << 8 |
> +			   sitdev->client->addr;

[Severity: Low]
Is i2c_adapter_id() stable enough to build the clock_id from?

Adapter numbers are assigned dynamically unless the DT provides an i2cN
alias. The clock_id that userspace uses to identify the DPLL devices and
pins could therefore change across boots, or when adapters probe in a
different order.

The value is also laid out as an EUI-64 under the SiTime OUI, which
implies global uniqueness. In practice every board with the part at the
same bus number and address gets the same ID. This is unchanged at the
end of the series.

[ ... ]

> +static int sit9531x_dev_probe(struct sit9531x_dev *sitdev)
> +{
> +	struct clk *xtal_clk;
> +	u8 variant_id;
> +	int rc;
> +
> +	/*
> +	 * Request before enabling the XO: a probe deferral would gate the XO
> +	 * and remove the reference of a running part.
> +	 */
> +	sitdev->reset_gpio = devm_gpiod_get_optional(sitdev->dev, "reset",
> +						     GPIOD_ASIS);
> +	if (IS_ERR(sitdev->reset_gpio))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(sitdev->reset_gpio),
> +				     "Failed to request reset gpio\n");

[Severity: Medium]
This reworks the probe ordering added by the earlier commit "dpll: add
basic SiTime SiT9531x support". There, the reset GPIO was requested with
GPIOD_OUT_LOW after the XO was enabled. Here it is requested GPIOD_ASIS
before devm_clk_get_optional_enabled(), and released later with
gpiod_direction_output().

The new comment presents this as a fix for a probe deferral that gates
the XO of a running part. Should the fix go into the earlier commit
instead? As things stand, that commit still has the behaviour the comment
describes, which matters for bisection.

The commit message also leaves out several other additions in this
patch:

  - the system sleep PM ops, sit9531x_suspend() and sit9531x_resume(),
    which disable the IRQ, cancel the poll and drop the page cache
  - the EEPROM profile ID and CRC readout in
    sit9531x_eeprom_state_report()
  - the 0xFF writes to eight write-1-to-clear notification registers in
    sit9531x_clear_notifications(), on every poll tick and every INTRB

Could these be described in the commit message, or split out?

> +
> +	/* Every rate the driver derives starts from the XO feeding XIN. */
> +	xtal_clk = devm_clk_get_optional_enabled(sitdev->dev, "xtal");
> +	if (IS_ERR(xtal_clk))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(xtal_clk),
> +				     "Failed to get xtal clock\n");

[Severity: Medium]
Can the XO still be gated when probe fails later on?

The reset GPIO request moved ahead of this call so that a deferral would
not gate the XO of a running part. But this patch adds many failure
points after the XO is enabled: sit9531x_derive_clock_id(),
devm_mutex_init(), sit9531x_devm_dpll_init() (kthread creation, the I2C
reads in sit9531x_dev_state_fetch(), DPLL device and pin registration),
and devm_request_threaded_irq().

If any of those fails, devres unwinds and calls clk_disable_unprepare()
on the XO:

sit9531x_dev_probe()
    devm_clk_get_optional_enabled()     <- XO enabled
    sit9531x_devm_dpll_init()
        sit9531x_dev_start()
            sit9531x_dev_state_fetch()  <- I2C error
    return rc                           <- devres disables the XO

The part is deliberately never reset, so it keeps running its PLLs and
outputs from the loaded profile, now without its reference. Driver unbind
takes the same path.

[ ... ]

> +static int sit9531x_resume(struct device *dev)
> +{
> +	struct sit9531x_dev *sitdev = dev_get_drvdata(dev);
> +
> +	/* After power loss the part is on page 0, not the cached page */
> +	sit9531x_page_cache_drop(sitdev);
> +	if (sitdev->irq > 0)
> +		enable_irq(sitdev->irq);
> +	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
The comment allows for the part losing power over suspend. In that case,
is dropping the page cache enough?

After releasing reset, probe waits fsleep(10000) for the internal boot.
Resume has no such wait: it re-enables INTRB and queues an I2C poll right
away.

Resume also does not re-read the static configuration that
sit9531x_dev_state_fetch() cached at probe: ref[].sig_mode, out[].cmos,
out[].routed and out[].pll_idx, chan[].manual_input and ref[].pll_mask.

Suppose the configuration was pushed over I2C before probe (a case
sit9531x_eeprom_state_report() detects and logs) and power is lost. The
part then comes back with a different configuration. The driver would
keep reporting the old mode and routing, and sit9531x_input_get_regs()
would pick the DE or SE force/state registers based on a stale sig_mode.

At the end of the series, resume re-reads phase, INTSYNC and output mute
state, but still not these fields, and there is still no boot delay.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> new file mode 100644
> index 0000000000000..6d676fabf13ee
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -0,0 +1,295 @@

[ ... ]

> +/* The XO feeds every PLL and is always connected. */
> +
> +static int
> +sit9531x_dpll_xo_pin_state_on_dpll_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv,
> +				       enum dpll_pin_state *state,
> +				       struct netlink_ext_ack *extack)
> +{
> +	*state = DPLL_PIN_STATE_CONNECTED;
> +	return 0;
> +}

[Severity: Medium]
Should this report CONNECTED unconditionally?

include/uapi/linux/dpll.h defines DPLL_PIN_STATE_CONNECTED as "pin
connected, active input of phase locked loop".
Documentation/driver-api/dpll.rst allows CONNECTED in automatic mode only
for pins with DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE.

sit9531x_pin_props_get() sets the XO capabilities to 0, and
sit9531x_dpll_mode_get() reports DPLL_MODE_AUTOMATIC for any PLL without
manual_input. The driver also already reads the PLL's active source from
CLK_ACTIVESEL into chan->selected_ref. The OCXO code there maps to
SIT9531X_MAX_INPUTS, and the OCXO can appear in the priority table.

The result is that userspace sees the XO as the active input even while
the PLL is locked to an external reference. This is still the case at
the end of the series. There, sit9531x_dpll_selection_state_get() also
reports the routed input as CONNECTED on a manual-input PLL, so that PLL
shows two CONNECTED inputs at once. On an automatic PLL, the XO shows
CONNECTED while the other listed inputs show SELECTABLE.

Could this state be derived from chan->selected_ref instead?
