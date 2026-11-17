Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881903;
	b=mJBS7XJTDs5evo/hGWh8ph/cOxZ83+eJB4jqr8hWO/5zKqbGPokz1Ufc7XWbWTYR6WLq
	 xd+MSt0AAMY3bLR3EPwDK6UMKxpV2m6QLHXziMNk0HhNbFmesmNBF1tinQ+o5rqZogxWg
	 oD8/k+1nXDdK9X0PQo2UAf4aBDg2DXLrA30jc5FlfvLVjj6L1LjLE+0C+FdKLQCauUxby
	 FLpmqCOHNsGzHFDTqaokgySnx0uBf2FekUekFkcVEkTl47hLqL4BeQUtCeIl6SAssGgQh
	 PNfl5/xHe6zyJu52nH/b8mGSxH+DEghN9D150DcFP6fkXwqBXE8gJRPDvtz1JcZSnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881903;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=brr3DvJqwDgwIdOITUi2l4ifUKdb6KRcxgyG27EeCyE=;
	b=TOsIppLaRo6Rp1wdQhYSg1k3zDtogwAQW1XLWVYrWs8i06XhEXpzewS23I3lJJvqi9II
	 89uNQON4co/w1lUt9V83bS4bUUROTHjxKdjaX6a24iGZdXMxJWLxGbSzkACpy+u+Emr/D
	 Q9L8Xl8c46So9/ENWDzvkVExLogCsOxGQUkznHalpiP0gUrhF0e1sOuijunN9C5G0kb9g
	 7UpNH4o7GgicRSZsvDK4AugXdOptAxqI3tCD2gCdmIhHyEg1y+K59Os0VGeQ7/reC+mWi
	 jCoRXfyozETt+nKLXjQ9pIxFmpOzGKqR3FR8r8n3DkiFg/eEZ5wjuOCs88uOZdf8kRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAdAUAHO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2092606A331;
	Tue, 17 Nov 2026 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAdAUAHO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF7F1F000C4;
	Tue, 17 Nov 2026 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881902;
	bh=brr3DvJqwDgwIdOITUi2l4ifUKdb6KRcxgyG27EeCyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OAdAUAHOX80FlsWZ/pjpEch4HfMWPAeYvWk8R6pdGYvp66RInorh95+VGt3FI4Bmb
	 tbAdG3bUHqw/bft3QeP7EqXOy36RwRiIh86n+4u2jsUjp4x+OpltySkS6yVDR6+PQH
	 ufsl7H+k9/BAtG0Pacbt031g8wUoP32w2Ii9HDDh/SbkOjn5xY/Cd2zB4FucIqOk9+
	 T/kxFuquc3drWbTxrGnt9p3TC2moJVOM5WKWD3RWbofDF2bn7xpsyq4UJjxCVNxF5V
	 xAIKsDWzo4rkpA+GJ09wDdsoXX9jNAViSqwMzh7wa690EoRS2tmWz95OkqqeFm+CuK
	 25FVcZj6k2RMQ==
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
Subject: Re: [PATCH net-next v15 10/13] dpll: sit9531x: implement output pin state on a DPLL
Date: Mon, 16 Nov 2026 18:18:21 -0800
Message-ID: <20261117021821.2220343-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-11-arouhi@sitime.com>
References: <20261110202607.55744-11-arouhi@sitime.com>
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
dpll: sit9531x: implement output pin state on a DPLL

This adds state_on_dpll_get/set callbacks for output pins. DISCONNECTED
mutes an output by forcing the slot's Hi-Z pairs inside the output
programming state, and CONNECTED releases the force. Output pins are now
registered when they are routed to the DPLL.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index c7ab33993c288..458de502bc8f7 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -459,53 +459,42 @@ static int sit9531x_output_forced_hiz(struct sit9531x_dev *sitdev,
>  	return 0;
>  }
>  
> -#define SIT9531X_LOOP_LOCK_TRIES	3
> -
> -/* Close the loops and lock the debug block without committing */
> -static void sit9531x_prg_abort(struct sit9531x_dev *sitdev)
> +/* Re-read an output's mute state. Caller must hold sitdev->multiop_lock. */
> +int sit9531x_output_state_refresh(struct sit9531x_dev *sitdev, u8 out_idx)

[ ... ]

> @@ -554,6 +543,174 @@ static int sit9531x_prg_commit(struct sit9531x_dev *sitdev)
>  	return 0;
>  }
>  
> +/*
> + * Unlock the Page 3 debug registers and enter PRG_CMD; output-system writes
> + * take effect only in this state.
> + */
> +static int sit9531x_prg_enter(struct sit9531x_dev *sitdev)
> +{
> +	int rc;
> +
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> +			       SIT9531X_DEBUG_UNLOCK_VAL);
> +	if (rc) {
> +		sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> +				     SIT9531X_DEBUG_LOCK_VAL);
> +		return rc;
> +	}
> +
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> +			       SIT9531X_PRG_CMD_STATE);
> +	if (rc) {
> +		sit9531x_prg_commit(sitdev);
> +		return rc;
> +	}

[Severity: Medium]
If the SIT9531X_PRG_CMD_STATE write fails, should this path really run the
full sit9531x_prg_commit()?

Before this patch, the failure path called sit9531x_prg_abort(). Its comment
was "Close the loops and lock the debug block without committing".
sit9531x_prg_commit() starts by writing to the same register that just
failed:

	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
			       SIT9531X_UPDATE_NVM);

After that it retries LOOP_LOCK, rewrites sitdev->loops_open, sleeps 100 ms
under multiop_lock and closes the debug key. Its return value is ignored
here.

So an entry that may never have reached PRG_CMD now sends an NVM shadow
update. The comment above sit9531x_prg_commit() ("re-lock the loops after
sit9531x_prg_enter()") does not seem to describe this case.

This also changes how the existing caller sit9531x_output_freq_set() from
the previous patch behaves on failure. The new sit9531x_output_enable() and
sit9531x_output_disable() paths get the same behaviour. The commit message
does not mention the change.

Was this meant to be part of this patch, or should a commit-free abort stay
on this path? The same call is still there at the end of the series.

> +
> +	return 0;
> +}
> +
> +/*
> + * Mute or unmute every Hi-Z pair of a slot. Caller must already be in the
> + * programming state.
> + */
> +static int sit9531x_output_hiz_write(struct sit9531x_dev *sitdev, u8 slot,
> +				     bool mute)
> +{
> +	u8 mask[SIT9531X_HIZ_PAIRS], state[SIT9531X_HIZ_PAIRS];
> +	struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];
> +	int i, rc, undo_rc;
> +
> +	sit9531x_output_get_hiz_regs(slot, p);
> +
> +	if (!mute) {
> +		for (i = 0; i < SIT9531X_HIZ_PAIRS; i++) {
> +			rc = sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,
> +						  false);
> +			if (rc)
> +				return rc;
> +		}
> +		return 0;
> +	}

[Severity: Medium]
Does un-mute lose a Hi-Z force set by the loaded profile?

This branch clears the MASK bit of all three pairs and restores nothing. The
mute path saves mask[] and state[], but uses them only to roll back on
error.

The commit message says "an un-mute releases the force and the pads return
to the loaded configuration". Take a CMOS output whose profile forces one
pad and leaves the other driving (part_muted). Here the force on that pad
is cleared too.

sit9531x_dpll_output_pin_state_on_dpll_get() reports such an output as
CONNECTED, which matches the core.h kernel-doc ("reported as driven").
However, sit9531x_dpll_output_pin_state_on_dpll_set() skips a request only
when part_muted is clear:

	if (!sit9531x_output_state_refresh(sitdev, dpin->id) &&
	    sitdev->out[dpin->id].enabled == enable &&
	    !sitdev->out[dpin->id].part_muted) {

dpll_pin_state_set() in the DPLL core does not compare against the current
state. So a request for CONNECTED, which GET already reports, still reaches
sit9531x_output_enable(). That runs the 100 ms programming sequence and
releases the pad the profile kept in Hi-Z. A mute followed by an un-mute
ends the same way.

Should the un-mute put back the profile's original force bits instead of
always clearing them? This code is unchanged at the end of the series.

[ ... ]

> +/* Caller must hold sitdev->multiop_lock. */
> +int sit9531x_output_disable(struct sit9531x_dev *sitdev, u8 index)
> +{

[ ... ]

> +	slot = info->clkout_map[index];
> +	rc = sit9531x_prg_enter(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	rc = sit9531x_output_hiz_write(sitdev, slot, true);
> +
> +	ret = sit9531x_prg_commit(sitdev);

[Severity: Low]
This isn't a bug, but every mute and un-mute runs the full output-system
programming sequence. That is debug unlock, PRG_CMD, UPDATE_NVM, LOOP_LOCK
and a 100 ms sleep under multiop_lock.

The commit message says this happens "inside the programming state". The
previous patch describes the settling time of that state, and the comment
in sit9531x_dpll_output_pin_state_on_dpll_set() documents the 100 ms
loop-unlock window. So this is mostly covered already.

Would it still be worth stating the cost explicitly in this commit message?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index a450a81d02f4c..a32d37a396b11 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -638,10 +639,114 @@ sit9531x_dpll_output_pin_frequency_set(const struct dpll_pin *pin,
>  	return rc;
>  }
>  
> +/*
> + * DISCONNECTED while the output is forced to Hi-Z, by a mute request or by the
> + * loaded profile.
> + */
> +static int
> +sit9531x_dpll_output_pin_state_on_dpll_get(const struct dpll_pin *pin,
> +					   void *pin_priv,
> +					   const struct dpll_device *dpll,
> +					   void *dpll_priv,
> +					   enum dpll_pin_state *state,
> +					   struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin = pin_priv;
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +	struct sit9531x_dev *sitdev = sitdpll->dev;
> +	const struct sit9531x_out *out;
> +	int rc = 0;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	out = sit9531x_out_state_get(sitdev, dpin->id);
> +	if (out->state_stale)
> +		rc = sit9531x_output_state_refresh(sitdev, dpin->id);

[Severity: Low]
Can this report an old mute state if the Hi-Z force bits are changed outside
the driver?

The hardware is read again here only when state_stale is set. The poll
re-reads an output in sit9531x_dpll_output_ntf_pending() only when the
driver itself has set ntf_pending:

	if (!out->ntf_pending)
		return false;

Suppose a profile is reloaded, or the registers are written with an I2C
tool, while the driver is bound. GET then keeps returning the old
CONNECTED/DISCONNECTED value, and no pin change notification is sent.

The input priority tables are handled differently: the poll picks up
external rewrites. The output frequency and phase getters read the
registers live. Later in the series the cache is refreshed on resume, but
runtime polling still never refreshes it.

Is that difference intended?

> +	if (!rc)
> +		*state = out->enabled ? DPLL_PIN_STATE_CONNECTED
> +				      : DPLL_PIN_STATE_DISCONNECTED;
> +	mutex_unlock(&sitdev->multiop_lock);

[ ... ]
