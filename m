Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A254562A9;
	Wed, 14 Oct 2026 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960580; cv=none; b=TM1CvpKRfDHiUxqB7bWY5Ie75HYeZ9NUJ3wx4ostE/tRcLk6BQLFCE/IEz/2pWzsinIIB9moCqZW7wZR8gI/I5JH18Zz7bih5zvdU5Ht9wC0kg52KBsdxZlWcanngjCJhOryFbwkj+XZcFjnxSJp/EIlCrFHiLAcSOOBFtnfp3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960580; c=relaxed/simple;
	bh=Z4wPYzqtzBlgByDOShN4XPsuT1tJTB0xD/ozMPHl0tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZRKWrskX/Wx/MvF8v6oDaiIQ7XIfy1Eca2mxhSHiC+gfnQ5brXFLL7WAZkTb54/GK02XaVHwaEkdfEUbP0wACekLuUgmisB2KHJToQj3dE2fT7bm95ihP5k8zi5+98yq81K+qKcpgWzfs7PB3Ho6oeBf9R1W8a4gINaX3+8XP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+4EoT7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+4EoT7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019E51F000FF;
	Wed, 14 Oct 2026 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791960579;
	bh=/bUDKVOzA4eklq4cWWGfUuCckNjOwJQvfNeMTErHGzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+4EoT7xLTghpn91mW5J28nRryY/cpxFR/mHMQDBmGiUga0gIM0aWSQfsSzlxLIrP
	 pEkxffw5HWyMZFXN4/yDEUfr+k6CmIyJ0x/msF18HXla8638KT8hW0kA3ZBKJnew3u
	 ZLGex0jILBnPUJ6alte+MeGqMpPu0oJSP3Xo9l7Ip3Qz2vkc/iqr0SLJCR02wIE6u+
	 boWArkXglHQijKYLSrDBx7U3VaRnQICIjLzatXffR+ZhJH1QXKQZ+z0Ul9V2URq7rZ
	 uHU2DEjQhvBsqQMNC/yhH58XtU7S/RBpyjq8AGTs9reGbhj7Gu9lnMWu3Ys3zzMYDJ
	 pEmohBVg4htcQ==
Date: Wed, 14 Oct 2026 06:49:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Scott Collyer <scollyer@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/chrome: cros_ec_sensorhub: Modify clock
 drift estimation
Message-ID: <as8mAFOdk7wgNqVd@google.com>
References: <20261013105753.1370713-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013105753.1370713-1-sgsatyam@google.com>

On Tue, Oct 13, 2026 at 10:57:53AM +0000, Satyam Gupta wrote:
>  /* Precision of fixed point for the m values from the filter */
>  #define M_PRECISION BIT(23)
> +#define MAX_DRIFT_PPM 200LL
> +#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
...
> @@ -271,13 +277,36 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
>  		return; /* we already have this irq in the history */
>  	dy = (state->y_history[0] + state->y_offset) - y;
>  	m = div64_s64(dy * M_PRECISION, dx);
> +	/*
> +	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
> +	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
> +	 * that would otherwise corrupt the median filter history.
> +	 */
> +	m = clamp(m, -MAX_M, MAX_M);

[This is one independent patch.]

There is a unit mismatch here that makes MAX_M off by a factor of 1000,
clamping the drift slope to +/-0.2 PPM instead of the intended +/-200
PPM.

See cros_ec_sensor_ring_ts_filter_update():
- dx is in us; dy is in ns.
- m = dy/dx is actually off by a factor of 1000.

> +
> +	/*
> +	 * Detect ODR (Output Data Rate) or Mode changes (e.g., transition from
> +	 * active streaming to low-frequency batching). If the time delta (dx)
> +	 * changes by more than 10x in either direction, reset the filter history
> +	 * to prevent mixing noisy active samples with batching samples.
> +	 */
> +	if (state->history_len > 1) {
> +		s64 prev_dx = -state->x_history[1];
> +
> +		if (prev_dx > 0 && (abs(dx) > 10 * prev_dx || prev_dx > 10 * abs(dx))) {
> +			state->history_len = 0;
> +			m = 0;
> +		}
> +	}

[This is one independent patch.]

Setting `m = 0;` is unnecessary.  Setting `state->history_len = 0;` is
sufficient to reset the filter.

The code elsewhere uses `-dx`.  Using `abs(dx)` is inconsistent and would
treat backward timestamps as valid deltas.

>  
>  	/* Empty filter if we haven't seen any action in a while. */
>  	if (-dx > TS_HISTORY_BORED_US)
>  		state->history_len = 0;
>  
>  	/* Move everything over, also update offset to all absolute coords .*/
> -	for (i = state->history_len - 1; i >= 1; i--) {
> +	start = min_t(int, state->history_len,
> +		      CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);
> +	for (i = start; i >= 1; i--) {
>  		state->x_history[i] = state->x_history[i - 1] + dx;
>  		state->y_history[i] = state->y_history[i - 1] + dy;
>  

[This is one independent patch.]

> -static void
> -cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
> -					     *sensorhub,
> -					     struct cros_ec_sensors_ring_sample
> -					     *sample)
> +static bool
> +cros_ec_sensor_ring_is_past_timestamp(struct cros_ec_sensorhub *sensorhub,
> +				      struct cros_ec_sensors_ring_sample *sample)
>  {
>  	const u8 sensor_id = sample->sensor_id;
>  
> -	/* If this event is earlier than one we saw before... */
> +	/*
> +	 * If this event is strictly earlier than one we saw before, it is truly
> +	 * out-of-order and must be dropped to preserve monotonicity.
> +	 *
> +	 * We intentionally allow duplicate timestamps (==) to pass through here
> +	 * because the EC/ISH may report a batch of samples with the same raw
> +	 * timestamp. These duplicates are required by the downstream spreading
> +	 * logic (cros_ec_sensor_ring_spread_add) to interpolate unique,
> +	 * monotonic timestamps for each sample in the batch.
> +	 */
>  	if (sensorhub->batch_state[sensor_id].newest_sensor_event >
>  	    sample->timestamp)
> -		/* mark it for spreading. */
> -		sample->timestamp =
> -			sensorhub->batch_state[sensor_id].last_ts;
> -	else
> -		sensorhub->batch_state[sensor_id].newest_sensor_event =
> -			sample->timestamp;
> +		return true;
> +
> +	sensorhub->batch_state[sensor_id].newest_sensor_event =
> +		sample->timestamp;
> +	return false;
>  }
> 
>  /**
> @@ -547,8 +582,10 @@  cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
>  	for (axis = 0; axis < 3; axis++)
>  		out->vector[axis] = in->data[axis];
> 
> -	if (sensorhub->tight_timestamps)
> -		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
> +	if (sensorhub->tight_timestamps) {
> +		if (cros_ec_sensor_ring_is_past_timestamp(sensorhub, out))
> +			return false;
> +	}

[This is one independent patch.]

Dropping a sample without setting `batch_state[sensor_id].last_len = 0`
leaves the previous batch length intact.  The next batch will compute
`sample_period` across the gap using the stale `last_len`.
