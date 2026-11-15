Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718614;
	b=zGg2TLIP6QomuaF52Oti1Oo+flgf3IF8p1hAHWZG0oz8TeMZ4VHfzjridRXWVo9lzr98
	 homJtiMg6p69ENWUk7lYY7IBx14aL9JycqBd8U+glpB+84gssbI8zvjgnwSPhEU0jP6ak
	 fxcLI+iXONH8KleDQVBSvN6BnN0qIlqHeJDxb5rFWcW7NdNX+RzxZMlJlxb18QnA0KNoR
	 prW04FHdwRmaj5br/E6LkBBPKXktswp45BmfUN8XIQzNx3QlsXkyBSjiGr1RKPEtmoPPF
	 QFyzXugEIuBjl/co28lnMb1dy/tmzjEuZmckZY8yjMGRR9Z5PBYGZrc8ch7smKsXajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718614;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OfjSECZG3khnXVUvbjv+JW4zvsO+5SX6UimzwnRfK0s=;
	b=a7ERDzYHq+fQd80jejzSNHQimspnY7cShEf26A+Valq3MIUUxTMx1aULg2NJoYFcYDz+
	 Y64leSLgYABo3cLhM7sOl9tCXE9T7daY2QqwZJjOPzB5eeHoBEdBbBct7IAkvNRLXTWZA
	 W1zCheRDIC5mPJRxFaZc9GjODFVT1EQEh3MVRU/wU3ERP/MsAqyeOk912l9g3EemsCYkG
	 Fj0LvjYFFQrX4h4evSLsNxUqBhqIFaY4jjdrv6729aOKMZN8zb5oyjVpWfTYUSjrBpqoL
	 oUzRQZx1M4GqMaOPmGcb537fEBhoi21HGVLOFxil9PGcoIAZ7QbspqDNIQARBahx/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkbBO0En;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A1606A33B;
	Sun, 15 Nov 2026 04:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkbBO0En
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AC71F000C5;
	Sun, 15 Nov 2026 04:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718614;
	bh=OfjSECZG3khnXVUvbjv+JW4zvsO+5SX6UimzwnRfK0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MkbBO0EnTAA+Y6eex7CAZuS4MTNAAVcavLhFOn7FNMIz0jvFLf8Dul/XPS5v9PUya
	 hzST9iXqtPgt/4KMlEW5jlYyRdLnVocaK+FFiLnHpkLIvzfRXy7T1sB7LpQcZiKtrW
	 9SZ8Ev7P3S3QfeSSY0rEXkFn7y3XdToaRn3finoDZvllS5v4WYyx1XDGmOFrjUmyMH
	 HnmGQofHAu9VIR4qgEUcdyZfAsZZX0CtTMYCaFa9gKvo8+GL30z8EDoJdJaZ184zkO
	 72G2XiXSeZoMvuzIs9J4qps1slbXa0d8jm2qiTP2jJLer041j8oiwdNRMsIvcgiyg/
	 Gdpps9Clxp62Q==
Subject: Re: [PATCH net-next v02 2/5] hinic3: Avoid concurrent updates on
 32-bit systems.
From: netdev-bot+sashiko@kernel.org
To: gongfan1@huawei.com
Cc: wudi234@huawei.com, tengpeisen@huawei.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, ioana.ciornei@nxp.com,
 maxime.chevallier@bootlin.com, mohsin.bashr@gmail.com,
 dimitri.daskalakis1@gmail.com, hramamurthy@google.com,
 larysa.zaremba@intel.com, vadim.fedorenko@linux.dev,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 zhoushuai28@huawei.com, wulike1@huawei.com
Date: Sun, 15 Nov 2026 04:56:52 +0000
Message-ID: <179471861282.2199510.12155151522849226893@kernel.org>
In-Reply-To: <3c49f9de764a5d8c463706882e191a945f376518.1794371175.git.gongfan1@huawei.com>
References: <3c49f9de764a5d8c463706882e191a945f376518.1794371175.git.gongfan1@huawei.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch is titled "Avoid concurrent updates on 32-bit systems",
  says the `+=` inside the u64_stats retry loop of hinic3_get_stats64()…
- [Low] After this patch, struct hinic3_rxq_stats::csum_errors
  (hinic3_rx.h:36) has no consumer anywhere in the tree.

--

hinic3: Avoid concurrent updates on 32-bit systems.

This commit changes hinic3_get_stats64() to read the per-queue counters
by assignment inside the u64_stats retry loop and add them into
rtnl_link_stats64 after the loop. It also removes csum_errors from
rx_errors, removes the NULL checks on nic_dev->txqs and nic_dev->rxqs,
and removes the dead stores before the loops.

> hinic3: Avoid concurrent updates on 32-bit systems.
>
> Within the while loop of hinic3_get_stats64(), the counters between
> u64_stats_fetch_retry and u64_stats_fetch_begin are incremented by +=.
> This operation will cause repeated counting of the counters on a 32-bit
> system. Therefore, change += to + and the counters are incremented
> out side the wile loop.

[ ... ]

> Fixes: f47872bed40f ("hinic3: Add .ndo_tx_timeout and .ndo_get_stats64")

[Severity: Low]
Can the double counting described here happen in this driver?

The hinic3 Kconfig entry only allows 64-bit builds, and COMPILE_TEST
does not remove that limit:

drivers/net/ethernet/huawei/hinic3/Kconfig:
	depends on X86 || ARM64 || COMPILE_TEST
	depends on PCI_MSI && 64BIT

When BITS_PER_LONG == 64, the retry helper always returns false:

include/linux/u64_stats_sync.h:
static inline bool __u64_stats_fetch_retry(const struct u64_stats_sync *syncp,
					   unsigned int start)
{
	return false;
}

So each do/while body in hinic3_get_stats64() runs exactly once, and the
old += loop already gave correct totals.

Even on a hypothetical 32-bit build, nothing would force a retry. The
only u64_stats_update_begin()/u64_stats_update_end() sections in hinic3
seem to be the init-time zeroing helpers hinic3_txq_clean_stats() and
hinic3_rxq_clean_stats().

The new reader pattern is fine as a cleanup. Would it be better to
describe the patch as a cleanup, drop the Fixes: tag and target net-next?

With the tag, a change that has no runtime effect goes to stable. It
would also bring along the NULL check removal, the dead store removal
and the change to what rx_errors reports.

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> index da73811641a9d..d1fd91d97ccfc 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> @@ -791,49 +791,35 @@ static void hinic3_get_stats64(struct net_device *netdev,

[ ... ]

>  	for (i = 0; i < nic_dev->max_qps; i++) {
> -		if (!nic_dev->rxqs)
> -			break;
> -
>  		rxq = &nic_dev->rxqs[i];
>  		rxq_stats = &rxq->rxq_stats;
>  		do {
>  			start = u64_stats_fetch_begin(&rxq_stats->syncp);
> -			bytes += rxq_stats->bytes;
> -			packets += rxq_stats->packets;
> -			errors += rxq_stats->csum_errors +
> -				rxq_stats->other_errors;
> -			dropped += rxq_stats->dropped;
> +			bytes = rxq_stats->bytes;
> +			packets = rxq_stats->packets;
> +			errors = rxq_stats->other_errors;
> +			dropped = rxq_stats->dropped;

[Severity: Low]
The commit message says:

    csum_errors and other_errors are not the same things. csum_errors will
    go to csum_bad in netdev netlink qstats.

Does hinic3 have a qstats path for this? I couldn't find netdev_stat_ops,
get_queue_stats_rx or csum_bad anywhere under
drivers/net/ethernet/huawei/hinic3/.

That means this line removes the last reader of csum_errors in struct
hinic3_rxq_stats.

The field has no writer either. hinic3_rx_csum() detects the checksum
error but returns without counting it:

	if (unlikely(csum_err)) {
		/* pkt type is recognized by HW, and csum is wrong */
		skb->ip_summed = CHECKSUM_NONE;
		return;
	}

The only other reference is the zeroing in hinic3_rxq_clean_stats().

Removing checksum errors from rx_errors does match the rx-csum-bad
definition. Could the commit message be corrected, or the qstats
reporting be added along with an increment in hinic3_rx_csum()?

As things stand, csum_errors is declared and zeroed but never counted
or reported. If a writer is added later, checksum errors still won't
show up in any user-visible interface until qstats support exists.

> +		} while (u64_stats_fetch_retry(&rxq_stats->syncp, start));
> +		stats->rx_packets += packets;
> +		stats->rx_bytes   += bytes;
> +		stats->rx_errors  += errors;
> +		stats->rx_dropped += dropped;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794371175.git.gongfan1%40huawei.com
