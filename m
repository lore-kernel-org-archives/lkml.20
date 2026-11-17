Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881905;
	b=ZP9VKItNIWj5VhgZC9GqwYyb3mspHTjYJ6P4m7TD3iIxRri5J8olsoV/c1/x2qhDm0bH
	 PwVs/F27ohmT5pDXE9e9vpYS3G7z9xh176Y8tOXxSihUlihMPwnZf11TYx/bicGgrgFeD
	 KtjwTR+utBu2XXQAWYKHvvtONf5KxMKrRU37hJszpi+tTSjODbDgl0108j8iXs9O7UWtz
	 2WnYYxepHhfToAvC0+ST2ACOmJYYkfJ3Sk6Dg33QBsvzUo9TPilpRaa4Ma5FcDRrDLau6
	 XZHygwKKm98bPsHcgtS6xY4o9Q2gQQKghhzIYVvQ8TK9u0KT+Ny17UsbWGMXInOXcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881905;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2RChwde4i9knnTRmvY27OPnra61UDL8Gg1mDzEJyDzs=;
	b=na9qT/jKmspauzmNSTqgm0DQB253n4AqySggiihvbhbvStahUKZncAJ2hJo4HG7JbIpB
	 po+G2O3DeWTFNuHJsGLJSscsHhP0j7GemfXpbtoatihZotHkqxIXzOygAtiJYhrtcj8o+
	 V798wgqjkr2aM/FEiZzgGxvb1HZQzN4bGf/Z5FkTyPpUOnU+rV4FKiS5A3AHYbXKjWzGo
	 P7POEMamtODF+KVDBzTftfJy7a9Ox30s+pVPTrhibp7IqMQN6DuwqyvuAwQGJ3l1b91+S
	 9VNjWwmkxDD11+eKNWnVAVmQaPSWk+EoLCJJN5CfuqKzIorNZ+xcEhAzlGWmeq0q1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWc87+9j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A125E606A88D;
	Tue, 17 Nov 2026 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWc87+9j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C831F000CB;
	Tue, 17 Nov 2026 02:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881905;
	bh=2RChwde4i9knnTRmvY27OPnra61UDL8Gg1mDzEJyDzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cWc87+9jUQBbMcBTJY2N/mg5KyFlLHCktJW4AVs6Ie/y/KxPAFAMVQMCKtnNM0V1g
	 ObtyEL83SlPzZcmjYmtWb4wOls8tIPcfAZ8Dnqko4/Lr83Wi/iu/iSClk+BhtdUQRf
	 lL3NgLmmlMNE9FpTwYajoIYCHmI7EXZ8SiWxmFtW9XPsZmy/AzYtVmQig59RgV/WPF
	 v+fXmPYIuFSIBSENPBQZMIAdWQ8H18p33Aep6HKks7fEi1HSC2kMfJU4rDMpsbLHFL
	 cUTcL3O2wcI9eAA4zZ3xE5mkc8+ycselJMyrv3qK0upxRtfTPjgxKgKbk6aF33ZjkK
	 LmyNsvmrHEz1g==
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
Subject: Re: [PATCH net-next v15 11/13] dpll: sit9531x: add support to adjust output phase
Date: Mon, 16 Nov 2026 18:18:22 -0800
Message-ID: <20261117021822.2220376-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-12-arouhi@sitime.com>
References: <20261110202607.55744-12-arouhi@sitime.com>
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
dpll: sit9531x: add support to adjust output phase

This patch adds phase_adjust_get/set for sit9531x output pins. A request
is split into a coarse delay in VCO cycles and a fine delay in 30 ps
steps, written to the per-output PRG_RST_DELAY registers, and an advance
is stored as the complementary delay within the output period. The PLL's
phase flush applies the delay, a rate change re-times it, and the poll
and removal paths gain retries for the flush, its undo and the re-time.

> The range advertised to the core is +/-1 ms at 1 ps granularity. The
> driver writes only positive delays, so an advance is held as the
> complementary delay within the output period. The delay is applied by
> the PLL's phase flush, which restarts the divider phase of every output
> the PLL drives, and a rate change re-times a programmed delay in the
> same programming window.

[Severity: Low]
Does "restarts the divider phase of every output the PLL drives" cover
every case? When the profile has PHFL off (CONFIG47 bit 7 clear),
sit9531x_output_phase_flush() does a full PLL restart instead:

	if (!(phfl & SIT9531X_PLL_CONFIG47_PHFL_EN)) {
		rc = sit9531x_write_pll_u8(sitdev, pll_idx,
					   SIT9531X_PLL_REG_DIRECTIVES,
					   SIT9531X_PLL_DIRECTIVE_RESTART);
		fired = !rc;
		goto out;
	}

On those profiles, any phase-adjust request that changes the delay bytes
restarts the whole PLL. So does every poll or removal retry of a pending
flush.

The code comment documents this fallback. Could the commit message
mention it too?

[Severity: Medium]
The commit message covers the delay split, the advertised range and the
advance folding. Should it also describe the deferred retry logic this
patch adds?

The previous patch ("dpll: sit9531x: implement output pin state on a
DPLL") already declared flush_pending, flush_ctrl_pending, flush_ctrl,
flush_arm_pending, flush_armed, retime_pending and retime_ps in core.h,
but nothing in core.c used them.

This patch adds sit9531x_phase_flush_undo(),
sit9531x_phase_flush_undo_retry(), sit9531x_flush_retry() and
sit9531x_retime_retry(). It calls them from
sit9531x_dev_chan_states_update() and sit9531x_dev_stop().

This also changes the existing rate-change path. Before this patch, a
failed flush in sit9531x_output_freq_set() was logged and ignored. Now a
failed flush sets chan->flush_pending, and so does a failed commit after
the divider write landed. The poll or the unbind path then fires the
flush later, which is a full PLL restart when PHFL is off.

sit9531x_retime_retry() also calls sit9531x_output_phase_adjust_set()
from the poll and at removal. That enters PRG_CMD, opening the output
loops and waiting 100 ms in sit9531x_prg_commit(), and then flushes. None
of this needs a user request.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 458de502bc8f7..9896d5aa40f56 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -1616,40 +1703,19 @@ static int sit9531x_output_phase_flush(struct sit9531x_dev *sitdev, u8 pll_idx)
>  	 */
>  	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
>  			       ctrl | SIT9531X_DIVO_PHASE_TRIG);
> -
> -restore:
> -	ret = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, orig);
> +	fired = !rc;

[Severity: Medium]
Should fired also depend on the TRIG-low write? regs.h describes the
flush as the whole pulse ("pulsing DIVO_PHASE_TRIG high then low
flushes"). The low write only happens later, in
sit9531x_phase_flush_undo():

	if (ctrl_back) {
		rc = sit9531x_write_close(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
					  ctrl);
		sitdev->flush_ctrl_pending = !!rc;

If that write fails, the undo still re-arms PHFL_ON_DEMAND_EN on the
parked PLLs and disarms the target PLL, while TRIG may still be high.
chan->flush_pending is already cleared because fired is true.

When sit9531x_phase_flush_undo_retry() later gets the low write through,
can the pulse complete with the wrong PLLs armed? The parked PLLs would
get their dividers restarted and the target would not, yet the driver
would record the target as realigned. This depends on whether the
hardware acts on the falling edge or on the full pulse.

> +
> +undo:
> +	touched = parked;
> +	if (armed_here && !(armed_mask & BIT(pll_idx)))
> +		touched |= BIT(pll_idx);
> +	ret = sit9531x_phase_flush_undo(sitdev, ctrl_back, orig, touched,
> +					armed_mask);
>  	if (ret && !rc)
>  		rc = ret;

[ ... ]

> @@ -1815,12 +1882,357 @@ static int sit9531x_output_divo_read(struct sit9531x_dev *sitdev, u8 out_idx,

[ ... ]

> +int sit9531x_output_phase_read(struct sit9531x_dev *sitdev, u8 out_idx,
> +			       s64 *phase_ps, bool *beyond)
> +{

[ ... ]

> +	rc = sit9531x_get_fvco(sitdev, sitdev->out[out_idx].pll_idx, &fvco);
> +	if (rc)
> +		return rc;

[Severity: Medium]
Should this path check sit9531x_fvco_in_band() as the setter does?
sit9531x_get_fvco() warns once about an out-of-band rate but still
returns success. sit9531x_output_phase_adjust_set() refuses that case:

	/* Fref * DIVN outside the VCO band is not the rate the PLL runs at. */
	if (!sit9531x_fvco_in_band(pll_idx, fvco)) {

Here the same Fvco is used to compute ps and t_out_ps, to choose between
advance and delay, and to set beyond.

The result is cached in out->phase_adj and phase_armed at probe, in the
getter and in the ntf path. At the end of the series it is also cached on
resume.

For a PLL fed from another PLL, wouldn't the reported delay differ from
the real edge? phase_armed would then also drive the re-time decision in
sit9531x_output_freq_set().

[ ... ]

> +	if (!rc) {
> +		u64 t_out_ps = mul_u64_u64_div_u64(divo, 1000000000000ULL,
> +						   fvco);
> +
> +		if (ps >= t_out_ps)
> +			ps -= t_out_ps;
> +		if (ps > SIT9531X_OUT_PHASE_ADJ_MAX_PS &&
> +		    t_out_ps - ps <= SIT9531X_OUT_PHASE_ADJ_MAX_PS) {
> +			*phase_ps = -(s64)(t_out_ps - ps);
> +			return 0;
> +		}
> +	}

[Severity: Medium]
Do the encoder and this decoder agree on the sign of an advance?
sit9531x_output_phase_encode() stores an advance of -X as the delay
T_out - X and reports the request's sign:

	if (phase_norm_ps < 0)
		*phase_adj = abs_ps ? -(s32)(t_out_ps - abs_ps) : 0;

This read path returns a negative value only when the positive decode is
above SIT9531X_OUT_PHASE_ADJ_MAX_PS. That never happens for an output of
1 kHz or faster.

Take a 10 MHz output from a 5 GHz VCO (T_out = 100000 ps) and a request
of -1000 ps. Encode writes 495 + 2 cycles (99000 ps) and caches -1000.
This function then decodes 99000 and returns +99000 with beyond false.

Any path that sets phase_stale replaces the cached -1000 with +99000 on
the next re-read: the getter, the ntf path, or the start of
sit9531x_output_freq_set(). The failure branches of freq_set and
phase_adjust_set set phase_stale. So does the resume re-read added later
in the series in "dpll: sit9531x: model the inter-PLL sync line as a pair
of pins". DPLL_A_PIN_PHASE_ADJUST would then jump from -1000 to 99000
with no hardware change.

After that, sit9531x_output_freq_set() re-times from
held = out->phase_adj. A change to 25 MHz (T = 40000 ps) then programs
19000 ps instead of the intended 39000 ps.

Doesn't that contradict the core.h kerneldoc for phase_adj ("with the
requested sign")? The code is the same at the end of the series.

> +	*beyond = ps > SIT9531X_OUT_PHASE_ADJ_MAX_PS;
> +	*phase_ps = ps;
> +
> +	return 0;
> +}

[ ... ]

> @@ -1893,20 +2394,130 @@ int sit9531x_output_freq_get(struct sit9531x_dev *sitdev, u8 out_idx,

[ ... ]

> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{

[ ... ]

> +	rc = sit9531x_output_phase_bytes_read(sitdev, out_idx, old_bytes);
> +	if (rc)
> +		return rc;
> +	sit9531x_output_phase_bytes_build(old_bytes, coarse, fine, new_bytes);
> +
> +	/*
> +	 * Skip the write if the quantized bytes are unchanged; a rewrite
> +	 * restarts the divider phase of every output on the PLL.
> +	 */
> +	same = !memcmp(old_bytes, new_bytes, sizeof(new_bytes)) &&
> +	       !out->phase_stale;

[Severity: Medium]
Can a request that quantizes to zero still fail this raw-byte compare?
sit9531x_output_phase_bytes_decode() treats register values 0, 1 and 2
all as no delay:

	*coarse = (prg_coarse > SIT9531X_OUT_PRG_DIVO_CYCLES) ?
		  prg_coarse - SIT9531X_OUT_PRG_DIVO_CYCLES : 0;

But sit9531x_output_phase_bytes_build() always writes coarse 0 as
register value 2:

	u64 prg_coarse = coarse + SIT9531X_OUT_PRG_DIVO_CYCLES;

Suppose the profile leaves the block at 0. A request of +1 ps, which
phase_gran = 1 allows, encodes to coarse 0, fine 0 and phase_adj 0, but
the bytes still differ. This function then enters PRG_CMD, writes the
bytes, waits in sit9531x_prg_commit() and flushes every divider on the
PLL, for a delay that stays at 0.

If the hardware does treat 0 and 2 differently, wouldn't outputs left at
the profile's zero and outputs set to zero by the driver end up two VCO
cycles apart, with both reported as 0 ps?

> +	if (same && !chan->flush_pending) {
> +		rc = 0;
> +		goto cache;
> +	}
> +
> +	if (!same) {

[ ... ]

> +	}
> +
> +	/*
> +	 * Restart the divider phase so the delay applies against a known edge.
> +	 */
> +	rc = sit9531x_output_phase_flush(sitdev, pll_idx);

[Severity: Medium]
Should this flush be skipped while sitdev->loops_open is set? The poll
and the removal path both avoid flushing into open loops:

		/*
		 * A flush pulse sent into open loops may be lost when they
		 * re-lock.
		 */
		if (!sitdev->loops_open)
			sit9531x_flush_retry(sitdev, i);

Consider this sequence:

1. sit9531x_output_freq_set() writes DIVO on PLL X.
2. sit9531x_prg_commit() fails LOOP_LOCK, which leaves loops_open = true
   and chan->flush_pending = true.
3. Before the next poll, a phase request arrives for any output of PLL X
   that quantizes to the bytes already programmed. With phase_gran = 1, a
   value 1 ps away from the cached one gets past the core's equality
   check.

Then same == true, so the code skips PRG enter and commit and reaches
sit9531x_output_phase_flush() with the loops still open.

The flush sets fired, so flush_pending is cleared at the out label. Once
the loops re-lock, the poll has nothing left to retry.

Could this leave the dividers unaligned, with no warning, while the
request returns 0?

[ ... ]

> @@ -2925,15 +3596,46 @@ static void sit9531x_dev_stop(struct sit9531x_dev *sitdev)
>  			dev_warn(sitdev->dev,
>  				 "PLL%c left in forced holdover\n", 'A' + i);
>  	}
> +
> +	sit9531x_phase_flush_undo_retry(sitdev);
> +	if (sitdev->flush_ctrl_pending)
> +		dev_warn(sitdev->dev,
> +			 "phase flush trigger source select not put back\n");

[ ... ]

>  	mutex_unlock(&sitdev->multiop_lock);
>  
> +	/*
> +	 * Re-time first, since it re-locks the loops; the flush runs only into
> +	 * locked loops.
> +	 */
>  	mutex_lock(&sitdev->multiop_lock);
> +	for (i = 0; i < sitdev->info->num_outputs; i++) {
> +		sit9531x_retime_retry(sitdev, i);

[ ... ]

> +	for (i = 0; i < SIT9531X_NUM_PLLS; i++) {
> +		if (!sitdev->loops_open)
> +			sit9531x_flush_retry(sitdev, i);
> +		if (sitdev->chan[i].flush_pending)
> +			dev_warn(sitdev->dev,
> +				 "PLL%c: output dividers left unaligned\n",
> +				 'A' + i);
> +	}
>  	mutex_unlock(&sitdev->multiop_lock);
>  }

[Severity: Low]
The undo retry and its warnings run before these retime and flush
retries. Both retries reach sit9531x_output_phase_flush(), which:

- parks the other armed PLLs
- may arm pll_idx
- selects the register trigger in GPIO_FUNC_CTRL1

If its closing sit9531x_phase_flush_undo() fails here, it only records
flush_arm_pending or flush_ctrl_pending. sit9531x_flush_retry() drops the
return value:

	sit9531x_output_phase_flush(sitdev, pll_idx);

Nothing after this point retries the undo or warns.

Could the device be left at unbind with on-demand flush armed or parked
against its profile, or with the register trigger selected, and none of
the warnings from the earlier block printed?

This is the same at the end of the series, where the code is in
sit9531x_dev_pending_retry().

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index a32d37a396b11..e6271ebd47ac1 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -741,12 +750,102 @@ sit9531x_dpll_output_pin_state_on_dpll_set(const struct dpll_pin *pin,

[ ... ]

> +static int
> +sit9531x_dpll_output_pin_phase_adjust_get(const struct dpll_pin *pin,

[ ... ]

> +	mutex_lock(&sitdev->multiop_lock);
> +	if (sitdev->out[dpin->id].phase_stale) {
> +		bool beyond;
> +		s64 phase_ps;
> +
> +		rc = sit9531x_output_phase_read(sitdev, dpin->id, &phase_ps,
> +						&beyond);
> +		if (rc) {
> +			mutex_unlock(&sitdev->multiop_lock);
> +			NL_SET_ERR_MSG(extack,
> +				       "Output delay could not be read back");
> +			return rc;
> +		}

[Severity: Low]
Should the extack message be set when rc is -ENODATA? That is what
sit9531x_output_phase_read() returns when Fvco is unknown, and the dpll
core treats it as an absent attribute. dpll_pin_phase_adj_set() goes on
to call ops->phase_adjust_set():

	if (ret && ret != -ENODATA) {

A successful set would then still carry "Output delay could not be read
back" in the ACK. A pin-get would leave the attribute out but still set
the message.

The driver's phase_offset_get returns -ENODATA without a message.

> +		sitdev->out[dpin->id].phase_adj = phase_ps;
> +		sitdev->out[dpin->id].phase_armed = !beyond && phase_ps;
> +		sitdev->out[dpin->id].phase_stale = false;
> +	}

[Severity: Medium]
Is it intended to clear phase_stale here while out->retime_pending is
still set? Say sit9531x_output_freq_set() fails after the new DIVO landed
but before the re-timed bytes were written. It then does:

		} else if (retime && landed) {
			out->retime_ps = held;
			out->retime_pending = true;
			out->phase_stale = true;

freq_set itself skips the re-read in that state:

	if (out->phase_stale && !out->retime_pending) {

The getter reports the hardware readback V and clears phase_stale, but
retime_pending stays set.

If userspace then sends PIN_SET with phase-adjust = V,
dpll_pin_phase_adj_set() sees an unchanged value and returns 0 without
calling phase_adjust_set:

	if (!ret && phase_adj == old_phase_adj)
		return 0;

phase_adjust_set is the only path that clears retime_pending.

On the next poll, sit9531x_retime_retry() calls
sit9531x_output_phase_adjust_set(sitdev, out_idx, out->retime_ps).
Wouldn't that reprogram the delay to a value other than V, and restart
the PLL's dividers, after userspace was told V is applied?

> +	phase_adj = sit9531x_out_state_get(sitdev, dpin->id)->phase_adj;
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	/*
> +	 * A profile delay on a slow output can exceed the s32 attribute; leave
> +	 * it out.
> +	 */
> +	if (phase_adj > S32_MAX)
> +		return -ENODATA;
> +	*phase_adjust = phase_adj;

[Severity: Medium]
Can this report values above the advertised phase_range.max?
sit9531x_output_phase_read() sets beyond when ps is above
SIT9531X_OUT_PHASE_ADJ_MAX_PS (1e9 ps) but still returns ps. Three paths
cache it in out->phase_adj: sit9531x_dev_state_fetch(), the stale path
above and the ntf path. This check only hides values above S32_MAX.

Consider a profile delay above 1 ms on an output slower than 1 kHz, such
as 1PPS. It would be reported as a PHASE_ADJUST between 1e9 and S32_MAX,
while PHASE_ADJUST_MAX is 1e9. Writing that value back would be rejected
by dpll_pin_phase_adj_set() as out of range.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index f726fbe037f3d..6cf5fc3459dde 100644
> --- a/drivers/dpll/sit9531x/prop.c
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -170,6 +170,20 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  		props->dpll_props.capabilities =
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq = 0;
> +
> +		/*
> +		 * The part takes a delay anywhere within the output period;
> +		 * +/-1 ms is a round figure within the s32 ps attribute.
> +		 */
> +		props->dpll_props.phase_range.min =
> +			-SIT9531X_OUT_PHASE_ADJ_MAX_PS;
> +		props->dpll_props.phase_range.max =
> +			SIT9531X_OUT_PHASE_ADJ_MAX_PS;
> +		/*
> +		 * The 30 ps fine step is not advertised; requests are rounded
> +		 * to the nearest achievable delay.
> +		 */
> +		props->dpll_props.phase_gran = 1;

[Severity: Low]
With phase_range at +/-1e9 ps and phase_gran = 1 on every output, every
value passes the core's checks in dpll_pin_phase_adj_set().
sit9531x_output_phase_encode() then folds the request modulo the output
period and rounds it to VCO cycles plus 30 ps steps. The call returns
success and a change notification follows.

On a 10 MHz output, +150 ns is accepted and reads back as +50 ns.

Is it intended that userspace has no way to learn the real step or the
per-output period limit? zl3073x, for comparison, advertises its real
granularity.

>  	}

[Severity: Low]
This isn't a bug, but after this patch the comment further down in
sit9531x_pin_props_get() is no longer accurate:

	/*
	 * Read the divider into the cached output rate used by phase adjust;
	 * -ENODATA is an unprogrammed divider or unknown VCO rate.
	 */

sit9531x_output_phase_adjust_set() and sit9531x_output_phase_read() both
read DIVO directly and never use out->freq ("the cached rate is whole
hertz"). Should the comment be updated?
