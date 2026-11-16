Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837064;
	b=uBPv/MxTBdeWVs+9xLdfCND7cuh7VqEn4S27f1Ti2gJRFqwvUrDbPWJNtKtTkGu9dNLt
	 WXImsqLgmPitUGT+Pc/5MSXp3eNJnGwQ8iSRvyYvnBBqkLhP28MtVuitQYPGo1gGTJdbR
	 8yVkPY4Xa55T7NInpUV0qJvW3LxHu7gSiTTIhE0XCodFEQLmzfNaWFbg368cEvUshcM6g
	 O5ZtQFipiMMrl4eg6OVTK9SkiAK7ogLCaIsE3n2toI6sfpTeWv3wQGefxh41lEX2MYdN9
	 LIS5Sy74tnak7IgAMYv6bFa7HPRtfAt59Vw4pLb83iJVY2kYblzDxaMfbKDfzC4i62w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837064;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KG1MGo/DVuw8aITbp4BPPajePR4Ohrcz/mqxJPeMWfU=;
	b=r8xrMJygW25FfN1L3TLpkrbv7It/9KwJKTvY67hg1VMBrees7y4owjr1WeoE3xZO5XAr
	 fLKAMvg9f1qouU9QmdjOGXLbjYqQP0SIh04JR+0Wb2/aLAHy6a13CXON2ulS3QCgrrleb
	 Cl0HGhWEv2qgASr6M/hmbRhAqAG1cspzi/bkjMuDpcHIzo26THx+SGUTqbGbAIMO1+4Dh
	 I/K90UECuqq5c+PiTReY2NFGVx09alhWxxb5RHPpZYTI5BsuJmFHA0uZjWGyYw6NIaxUf
	 Hw/RBB6iu9ruf/UbD5Is9NIdOWK9lGEMaf4cxmoeTsp3BO5fX1yRDwV31iSM7d4LKOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SneNHsiK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA03608590E;
	Mon, 16 Nov 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SneNHsiK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26001F000C8;
	Mon, 16 Nov 2026 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837064;
	bh=KG1MGo/DVuw8aITbp4BPPajePR4Ohrcz/mqxJPeMWfU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SneNHsiKDy+0YZv7oPb8vmoTrIlVZQMg0EPXkHKbvPvyiljrq/LUHd9BUnYFgCZrn
	 6ddf8sG01zboffWEVIUq8NsK8kJD8ef9dgvazigOCFFqhRcDOnDjlurIjzVg+4KV/y
	 XEiJlJ1ugUbPB9sYgse2rzHuxyVSWEjI1v/5B5S/XgVAWM1odRu4MyzAM6lrFmKJT0
	 SJ3lMRh0kmnKc2dJOpcN2WhBAfUDQ6DdHC2vyejpj1TpgrbQWyZoaT8rX+o7iddmGQ
	 EOZ+oGkY2i3ztqt2hLnst5KZNeENXRsIi0Y/wkG6QIkOoVf+HXkotg2O1pjkt+IWRS
	 NWpMMyng5ea+g==
Subject: Re: [PATCH net-next v03 2/4] hinic3: Avoid concurrent updates on
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
Date: Mon, 16 Nov 2026 13:51:02 +0000
Message-ID: <179483706251.3136.3766644106019912452@kernel.org>
In-Reply-To: <6e3be192de613fb537fc2050ce28e1bd71346e35.1794467919.git.gongfan1@huawei.com>
References: <6e3be192de613fb537fc2050ce28e1bd71346e35.1794467919.git.gongfan1@huawei.com>
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

- [Low] The commit message and Fixes: tag describe a bug this driver can
  never hit.
- [Low] The patch drops `csum_errors` from `rx_errors` in
  hinic3_get_stats64() (`errors = rxq_stats->other_errors;`).

--

hinic3: Avoid concurrent updates on 32-bit systems.

This commit reworks the u64_stats reader loops in hinic3_get_stats64().
Per-queue values are now assigned inside the fetch/retry loop and added
into rtnl_link_stats64 outside it. The patch also drops csum_errors from
rx_errors, removes the NULL checks on nic_dev->txqs and nic_dev->rxqs, and
removes the zeroing of the local counters before each loop.

> hinic3: Avoid concurrent updates on 32-bit systems.
>
> Within the while loop of hinic3_get_stats64(), the counters between
> u64_stats_fetch_retry and u64_stats_fetch_begin are incremented by +=.
> This operation will cause repeated counting of the counters on a 32-bit
> system. Therefore, change += to + and the counters are incremented
> out side the wile loop.

[Severity: Low]
Can this driver be built on a 32-bit kernel? The Kconfig in
drivers/net/ethernet/huawei/hinic3/ has:

	depends on PCI_MSI && 64BIT

When BITS_PER_LONG == 64, include/linux/u64_stats_sync.h defines:

static inline bool __u64_stats_fetch_retry(const struct u64_stats_sync *syncp,
					   unsigned int start)
{
	return false;
}

So the old loop body ran exactly once per queue. The += into locals that
started at zero already gave correct totals in every configuration that
can be built.

The subject says "Avoid concurrent updates". However, the patch only
changes the reader side and does not change how updates are serialized.

This patch carries "Fixes: f47872bed40f" and will be picked up for
stable. Would it be better described as a cleanup of the reader idiom,
without the Fixes: tag?

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> index da73811641a9d..d1fd91d97ccfc 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> @@ -791,49 +791,35 @@ static void hinic3_get_stats64(struct net_device *netdev,

[ ... ]

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

[Severity: Low]
The commit message says:

  csum_errors and other_errors are not the same things. csum_errors will
  go to csum_bad in netdev netlink qstats.

Where is csum_errors reported as csum_bad? I could not find a netdev
queue stats implementation (stat_ops, get_queue_stats_rx or csum_bad)
anywhere under drivers/net/ethernet/huawei/hinic3/. It is not in this
patch, and it is not added later in the series.

After this change, the only remaining reference to csum_errors is the
reset in hinic3_rxq_clean_stats():

	rxq_stats->csum_errors = 0;
	rxq_stats->other_errors = 0;

Neither counter is incremented anywhere today, so rx_errors does not
change in practice. Once the datapath starts incrementing csum_errors,
would those counts then be missing from every uAPI?

This rx_errors change is unrelated to the retry loop change. Could it be
split into its own patch, or sent together with the qstats support it
refers to?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794467919.git.gongfan1%40huawei.com
