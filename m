Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816370;
	b=2+/z9KGsho6ANz4rqgLZoOgFvlgVBl3yUVfLObWxWAfVponJEM1qg637oVhFzpyJ5rUK
	 kkSYY4RAqLVIXe49aexYbFs0wdJIhmtjOJhHQ94bpdfzMCAiBWm64+gRDh1WjZwJAkvVN
	 7aCu6FQYADEuLQs5tenIfaOfc8NwPcIcrMEpPcCsaf5KmFoW37MkyCISjX6E+tpk4tVL+
	 x33QjtrhMVKNUv0GBXgb4lPVToGtwpsdDOloWc2RpLBhKEjLk4PopECqVnlW/k3G0IiII
	 tKCeIW3p+UhhIxsZMtDEE6Rri92WSQz4qTNlQI6S+31H7oxNzBMAbjJm7zcHPIkVbgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816370;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dZeCHeyNJJOiXW9MrpUHcvUlDWCc5YQzpgtfqAIDDo8=;
	b=dAEOxIZAH3bdKkq8ds7B9P1Yadt+T32MU8fq20LHq20XhP46mHoEErEDCgtOxGNiMMvt
	 V7tXlhau+sNOp7cpucmXdLJAhNHj3j7GKjI5FsfasbyHwXVFCQ4IO0i+l85MCAe5rp76R
	 yeF+IVpKi3+DLw0o3kDZrlznmalxugCtninHNDSYuuhX1VtUCug/+l0IyJBx/v8oqlpPr
	 oQY4WCm2kLYV4fIjpMt3t+UroE9HhW4xzZyvElpMjR85IqsDoh7WzFwePhWqhVgM+wqqH
	 xktH94bfzZ0ROD2gZ++mTTDKI7Bvtwt2hayn1kbHBo8C/A6570ejES/K/aUNtg1kAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7CECpqc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C07606A336;
	Mon, 16 Nov 2026 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7CECpqc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8122C1F000C5;
	Mon, 16 Nov 2026 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794816370;
	bh=dZeCHeyNJJOiXW9MrpUHcvUlDWCc5YQzpgtfqAIDDo8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b7CECpqcnLq7skR4jT88oV3j8sRtIiknINOZ/81WjAfUN2kUosv/cr2oMM1Sl+XK0
	 ABVS63aeKpmoADqbiutZtE2bbPsZ83n7YLQPkp/41Y3TvmfUOshIKf+Mr3iBu5TDkM
	 2jkkJ6Bvxs7ot800wTALb3Dt01VV2LLrvAd5JAsCw+Ry8DlZ/ctdU0XTQ0qF8LPeVb
	 MzuJ8XlZzl9TTlyy2hiZrT9zMxKX4fqUhGT0rSBeKdi3i17Kr5n0avTwDnURqYSV5/
	 UpEgo3I3YAMipOed+OBPu+MgCf9UF80L9Qf1nXgXru6X837ZgkHQKPo8V4BzlhY37W
	 DpuuGazgIXT2w==
Subject:
 Re: [PATCH net-next v5 3/3] net: phy: acx00: report receive statistics
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Mon, 16 Nov 2026 08:06:09 +0000
Message-ID: <179481636902.3136.5648060525079274631@kernel.org>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-3-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-3-ed81a7f54373@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rx_packets permanently loses successful frames when CRC errors
  keep breaking the bracket for 320 s or more.
- [Low] Speculative, depends on undocumented counter behaviour.

--

net: phy: acx00: report receive statistics

This adds update_stats and get_phy_stats support to the AC200/AC300 EPHY
driver. Successful frames (frame count minus CRC errors) go to rx_packets,
CRC errors go to rx_errors, and the hardware byte count goes to
rx_bytes_total. The hardware counters are sampled with carry detection and
a CRC-bracketed packet read. Wrap-adjusted deltas are added to 64-bit
totals, and a delta is discarded when 320 seconds or more have passed since
that counter was last sampled.

> diff --git a/drivers/net/phy/xpowers/acx00.c b/drivers/net/phy/xpowers/acx00.c
> index cee6c7ff0278e..691f4931af460 100644
> --- a/drivers/net/phy/xpowers/acx00.c
> +++ b/drivers/net/phy/xpowers/acx00.c

[ ... ]

> @@ -110,6 +138,169 @@ static int acx00_ephy_write_page(struct phy_device *phydev, int page)

[ ... ]

> +/* Return a mask of usable counters, or a negative MDIO error. */
> +static int acx00_ephy_read_counts(struct phy_device *phydev, u32 *counts)
> +{

[ ... ]

> +	/* Bracket the packet counter with an unchanged CRC count. */
> +	for (i = 0; i < ACX00_COUNTER_READ_ATTEMPTS; i++) {
> +		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_PACKETS_HIGH_REG,
> +					      &packets);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
> +			break;
> +		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG,
> +					      &errors);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
> +			break;
> +		if (errors == counts[ACX00_STAT_RX_CRC_ERRORS]) {
> +			/* Both hardware counters and their difference wrap at 2^32. */
> +			counts[ACX00_STAT_RX_PACKETS] = packets - errors;
> +			return BIT(ACX00_STAT_RX_PACKETS) | BIT(ACX00_STAT_RX_CRC_ERRORS);
> +		}
> +		counts[ACX00_STAT_RX_CRC_ERRORS] = errors;
> +	}
> +
> +	/* Keep reporting errors even when no coherent packet sample is possible. */
> +	return BIT(ACX00_STAT_RX_CRC_ERRORS);
> +}

[Severity: Medium]
Can rx_packets permanently lose successful frames when CRC errors keep
breaking the bracket?

On this path only the CRC bit is returned. __acx00_ephy_update_stats()
therefore leaves stats_last[ACX00_STAT_RX_PACKETS] and
stats_start[ACX00_STAT_RX_PACKETS] at their values from the last coherent
pair, while rx_errors keeps advancing.

When a coherent pair finally arrives, its delta is only accepted if:

		if ((priv->stats_valid & BIT(i)) &&
		    ktime_ms_delta(ktime_get_boottime(), priv->stats_start[i]) <
		    (s64)ACX00_STATS_MAX_INTERVAL_MS) {

Suppose the CRC count changes in all three bracket windows on every poll
for 320 seconds or more. One example is a bulk transfer over a damaged
cable with a few thousand CRC errors per second. In that case only the
baseline moves, and every successful frame received since the last
coherent pair is dropped from rx_packets. rx_errors stays correct, so the
reported error ratio comes out wrong.

ACX00_STATS_MAX_INTERVAL_MS comes from the byte counter's 4,000,000,000
modulus. The 2^32 packets-minus-errors difference cannot wrap at 100 Mb/s
for about 8 hours (2^32 / 148,810 minimum-size frames/s is roughly
28,862 s). The dropped delta could still have been recovered.

The commit message says:

    When CRC errors keep arriving, update rx_errors from the
    latest stable error read without advancing the successful-frame baseline.
    A later coherent pair accounts for the intervening successful frames.

Is that only true when the incoherent period is shorter than 320 seconds?
Would a separate interval limit for the frame counters, based on their
2^32 modulus, avoid dropping these frames?

> +
> +static int __acx00_ephy_update_stats(struct phy_device *phydev)
> +{

[ ... ]

> +	for (i = 0; i < ACX00_NUM_STATS; i++) {
> +		u64 count;
> +
> +		if (!(ret & BIT(i)))
> +			continue;
> +		count = counts[i];
> +
> +		/* Include sleep and read time; unseen cycles cannot be recovered. */
> +		if ((priv->stats_valid & BIT(i)) &&
> +		    ktime_ms_delta(ktime_get_boottime(), priv->stats_start[i]) <
> +		    (s64)ACX00_STATS_MAX_INTERVAL_MS) {
> +			if (count < priv->stats_last[i])
> +				count += i == ACX00_STAT_RX_BYTES ?
> +					ACX00_RX_BYTES_WRAP : BIT_ULL(32);
> +			priv->stats[i] += count - priv->stats_last[i];
> +		}

[Severity: Low]
This depends on counter behaviour that isn't documented. What happens if
the difference computed in acx00_ephy_read_counts() goes down between two
samples?

			counts[ACX00_STAT_RX_PACKETS] = packets - errors;

This code treats any drop as a 2^32 wrap, so rx_packets would jump by
about 4.29e9. Totals are kept across resets and power transitions, so the
jump would be permanent.

The difference only stays non-decreasing if two things hold. The frame
counter must include every event the CRC-error counter counts. It must
also never increment later than the CRC counter for the same frame. The
bracket only shows that the CRC count didn't change while the packet
counter was being read.

Two hardware behaviours would break this:

- The CRC/error counter also counts events the frame counter skips, such
  as runts, collision fragments, false carrier or RX_ER.

- The frame counter increments at start of frame and the CRC counter at
  end of frame. At 10 Mb/s these can be up to about 1.2 ms apart. If no
  good frame arrives before the next poll, the difference drops by 1.

Intervals are already limited to under 320 seconds. At 100 Mb/s at most
about 47.6 million frames can arrive in that time. Could a wrap-adjusted
packet delta larger than that be rejected and used as a new baseline,
rather than added to the total?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373%40gmail.com
