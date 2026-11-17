Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881899;
	b=EdUSUvu2MOQ2xyoE8IGl2SXq9WuugNq0zrCp888A9iLIIpTeXBFxGTTPyybmP5KKiqlz
	 FM4h1yWuGkMBJ+cOnqLZ9OG1dqD5qgksmGPd6qAO1azGWUry9hBcGBfhY5U6SvDXtc2fm
	 rfbWUZyvzIk/C+VMLuKH2Ya0TvEhZ7eT3BYsnX8LPcIT8D6Ng97JWJrukX6O7Mj+MfWzM
	 6MaEBddfJ3t53vGzF5Pv9Z+g+ZwkYHIq5zSg4LF6p/H2kHG628/xS/0k3BXAnN5csVIIs
	 pIDpASdf73OGe42obm5CXjX4cGa+lfEVlCt1jIoT7FEKsw01nRdSbi6gclT/Cn5fj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881899;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GzYpw2pkjx/F18WqLGXcWT1byr3KxqlnaVpUgG20AM0=;
	b=vUu9WEOn/CXAAL3aQSVd4lym9qCTp07eVOsfjBO1N1YCmyN85sIaY+y9wOvqOVF1BTPB
	 62+LOWP/Zn3e01qT0Vgn2v37JG1SPYcVy/lNoomv5gtBiRhSRkgGWygVdQr+P2sJJ5ECD
	 6Zl7/m4hB26+6VaSY0yFvJvbrOm4la/9km/g5lks06KKTGtLvYr9WGoOoZrMlBmcYfOW/
	 okXhMMvGtTNABQxhHNYknRWPJL+j09dCkNfQhaWgUmKCsTpDKAFqVY92Fl58iRvG2sd0J
	 +4dvjXMA3pOsDfeYnQutQXclFC5wmTbgSFTt6pkw5EpaA2AEh0hsSUgteZgQJnOYoOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=je4MTkzv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4D606A32A;
	Tue, 17 Nov 2026 02:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=je4MTkzv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80021F000C9;
	Tue, 17 Nov 2026 02:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881898;
	bh=GzYpw2pkjx/F18WqLGXcWT1byr3KxqlnaVpUgG20AM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=je4MTkzvf5CgXozUxSBf71fN4cRhHHlcFehPDpj6soj25Wj23tgCcEPDv2H/kIxNV
	 HN5hdgjjviYb+Gz7IWRZSWBl7NhbfUkZADI1NLQj2W+NuuFC/VL7elUOmrC/l5edG9
	 nLwCK5pfyQv9hypYGCpQxPaKDCOdQ3qwoE2tqa9VVeGPlXbKALw8IQUoVELnugsra9
	 GMqaKxftwxYsqFaIKHAMI7s28GCFifA6BzmdLVwAE/XUtOswBka/6oeZ3/0nj6tEWU
	 YoXuLIgaHtmepWOk9XuOY4Bo1yOTBvWAddPqxvqwsDQ5BBz+kidQ65iUPkm8+ux/s3
	 V/bJtJBA6xAhg==
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
Subject: Re: [PATCH net-next v15 08/13] dpll: sit9531x: add support to get and set priority on input pins
Date: Mon, 16 Nov 2026 18:18:16 -0800
Message-ID: <20261117021816.2220207-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-9-arouhi@sitime.com>
References: <20261110202607.55744-9-arouhi@sitime.com>
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
dpll: sit9531x: add support to get and set priority on input pins

This adds prio_get and prio_set dpll_pin_ops callbacks for the sit9531x
input pins, backed by a configured priority per input and PLL. It also
advertises DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE on the reference and
INTSYNC input pins. The periodic poll now also notifies pins whose priority
moved.

> Keep a priority per input and PLL, seeded from the table the part
> loaded, and rebuild the table from it on a set. Priority and state are
> separate: a priority set on a disconnected input applies when it is
> connected. The range is 0 to 255 over eleven slots; inputs of equal
> priority keep their table order.

[Severity: Low]
Most of what this paragraph describes seems to be in the parent commit,
"dpll: sit9531x: implement input pin state on a DPLL". That commit's
message doesn't mention priority.

The parent already has these:

  - cfg_prio, cfg_known, seen_srcs and seen_valid in struct sit9531x_chan
  - sit9531x_prio_cfg_seed()
  - the reseed in sit9531x_chan_state_fetch()
  - sit9531x_prio_table_build() ordering by cfg_prio
  - sit9531x_input_prio_set(), which has no caller there

This patch only adds sit9531x_input_prio_get(), the prio callbacks and the
capability bits.

Could the priority code move into this patch, so it is reviewed in the
patch whose message describes it?

> A table rewritten outside the driver, by a profile reload or an I2C
> tool, becomes the new configuration, and the poll notifies the pins
> whose priority moved.

[Severity: Medium]
The diff seems to change more than the message says:

  (a) sit9531x_prio_activesel_pick() takes a new routed argument from
      sit9531x_prio_table_commit(). This changes which source is latched
      into the active-select nibble on every table commit. That includes
      the add/remove commits made by the existing state_on_dpll_set path.

  (b) sit9531x_dpll_changes_check() now also notifies on operstate
      changes. The parent exported operstate_on_dpll_get but never sent a
      notification when operstate changed.

  (c) The seen first-poll suppression is replaced by
      sit9531x_dpll_pin_baseline(), which sit9531x_dpll_pins_register()
      calls before the pin is registered. Changes made between
      registration and the first poll are now notified.

  (d) Failed pin notifications are now retried through pin->ntf_pending.
      The poll also no longer goes through ops->state_on_dpll_get.

Could these be described in the commit message, or split into separate
patches so they can be reviewed and backported on their own?

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index af6d7918958dc..b4e44f0d9820b 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -744,6 +772,12 @@ static u8 sit9531x_prio_activesel_pick(struct sit9531x_dev *sitdev,
>  	    top != sit9531x_prio_top_live(sitdev, old))
>  		return top;
>  
> +	if (sit9531x_prio_src_usable(routed) &&
> +	    sit9531x_prio_src_live(sitdev, routed))
> +		for (i = 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +			if (srcs[i] == routed)
> +				return routed;
> +
>  	cur = sit9531x_prio_src_canon(sitdev, cur & SIT9531X_PRIO_NIBBLE_MASK);
>  
>  	if (sit9531x_prio_src_usable(cur) &&
> @@ -826,12 +860,18 @@ static int sit9531x_prio_table_commit(struct sit9531x_dev *sitdev, u8 pll_idx,
>  
>  	if (!empty) {
>  		u8 sel = sit9531x_prio_slot_get(val, slot + 1);
> +		u8 routed = SIT9531X_PRIO_SRC_NONE;
>  
> +		/*
> +		 * The pick needs the signal state now, not as of the last poll.
> +		 */
>  		rc = sit9531x_input_mon_fetch(sitdev);
>  		if (rc)
>  			goto rollback;
> +		if (!chan->stale && chan->routed_ref != SIT9531X_REF_INVALID)
> +			routed = sit9531x_input_hw_src(chan->routed_ref);
>  		sel = sit9531x_prio_activesel_pick(sitdev, chan->prio_srcs,
> -						   srcs, sel);
> +						   srcs, sel, routed);
>  		val = sit9531x_prio_slot_set(val, slot + 1, sel);
>  	}

[Severity: Medium]
The monitors are re-read live here. chan->routed_ref, however, is the value
cached by the last sit9531x_chan_state_fetch(), from the previous poll or
the end of the previous commit. Can it be stale at this point?

The driver's comments say the device falls back between listed sources on
its own when a source loses signal. The new check in
sit9531x_prio_activesel_pick() prefers a usable, live, listed routed
source over the nibble. A stale value could therefore latch a source other
than the one the PLL is tracking. For example:

  A is latched
  A loses signal, PLL falls back to B
  a poll records routed_ref = B
  A returns
  B loses signal, PLL falls back to A
  B returns
  the priority of an unrelated input C is set before the next poll

The old code keeps A from the nibble. The new code would latch B and move
the PLL from A to B, on a request that only touched C.

Would reading the routed reference live here, next to
sit9531x_input_mon_fetch(), avoid this?

There is also the sit9531x_chan_state_fetch() call at the end of a commit.
It runs right after HO_FORCE is released and only reads the routed
reference while the PLL is tracking. Does that mean a quick second request
often sees SIT9531X_REF_INVALID and gets no routed hint at all?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 56bdec4bcf67e..f03145f4d1eed 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -477,6 +552,43 @@ sit9531x_dpll_pin_ops_get(const struct sit9531x_dpll_pin *pin)
>  	return &sit9531x_dpll_input_pin_ops;
>  }

[ ... ]

>  /*
>   * Send notifications for changed lock status and pin state; called from
>   * sit9531x_dev_periodic_work().

[Severity: Low]
This isn't a bug, but this comment still mentions only lock status and pin
state. sit9531x_dpll_changes_check() now also notifies on operstate and
priority changes, and it retries failed notifications. Should the comment
cover those as well?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index b9405eba49a39..69877fc940284 100644
> --- a/drivers/dpll/sit9531x/prop.c
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -146,6 +146,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  		/* INTSYNC destination: a reference the PLL can lock to. */
>  		props->dpll_props.type = DPLL_PIN_TYPE_INT_OSCILLATOR;
>  		props->dpll_props.capabilities =
> +			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq = 0;
>  	} else if (sync_out) {
> @@ -161,6 +162,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  	} else if (dir == DPLL_PIN_DIRECTION_INPUT) {
>  		props->dpll_props.type = DPLL_PIN_TYPE_EXT;
>  		props->dpll_props.capabilities =
> +			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq = sitdev->ref[index].freq;
>  	} else {

[Severity: Medium]
Is this capability right for PLLs on manual input select? For those PLLs,
sit9531x_dpll_pin_ops_get() returns sit9531x_dpll_input_pin_manual_ops.
That table has no prio_get or prio_set, and its comment says these pins
have no priority.

The dpll_pin is shared by all four PLLs, so the capability can't differ
per PLL. On a manual-mode PLL, dpll_pin_prio_set() passes the capability
check, finds ops->prio_set is NULL and returns -EOPNOTSUPP with no extack
message.

There is also the poll. sit9531x_dpll_changes_check() still tracks prio
for these pins through sit9531x_dpll_pin_snapshot(). Would an external
table rewrite that reseeds cfg_prio then send a dpll_pin_change_ntf()
whose message has no priority attribute?
