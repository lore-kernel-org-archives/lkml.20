Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837066;
	b=jZczaftq0KvBYsQ1pPp42B0tQcMHTbFRC21XuPv8+slU/T/ujcl0hyhhfo8o6WCskMn5
	 981XFIhNN214kwMRpkRsRR6rjDEuWfEOr69bGW7O8IBqUjvsVP9OpXfdkI2i7ImqPP7rW
	 9KyMtKIjg4gkfAQpjZZBl3L7kzsl8uNJmyhcnmIw4Fnn23bDXBFj5/8WltGR/QeXLkF+0
	 +pFC090vinQhFaRIx/Vm5dX8qjHdFGqHAUELyJhb17kvsK6o2TK9PeIiApnMn+j8ZSlNX
	 GFb0iTcrPT5SYGUIBfRyTDkk4hHz19rJQU7N0DpRKUbXGdakbyLyVgrC6SL72ONVuEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837066;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZnXckJbac3FziR6I6cR9lSeHW9H/UJdnrWVc+aLxiHk=;
	b=NdVR3/RI2x/2iETPAxleTD6+l3IJjqLF0VOMFgOZ0D/drMeECtWNGqUBT+Q0oZwXpuOF
	 lellt8tGKSxnSU+pQSfzxnnoUbnvRLx+1fclmvErs5wsRWxutAbMtxtHPLTuvJUCYFL+b
	 I8cBWoqjTpdlydQ/194sPs15Bx5+Vz2Z0toMK0rRIgQSjwqplKSk7KVDB3PpRMookT6L7
	 b27BOn3RdAiwGES3u2m8fnSm7udrpp8/rDZbwNCPWfqaeN/jwsvLBSxqvdH7ceR3J3BX/
	 6b7kqiSaGMpF8iMhCyeufeMHGM+81FDlaC6pemPybaAlT5iPNCZ/JMslMyqNOai6GxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF2VkZ1n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B449606B233;
	Mon, 16 Nov 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF2VkZ1n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFA61F000C8;
	Mon, 16 Nov 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837066;
	bh=ZnXckJbac3FziR6I6cR9lSeHW9H/UJdnrWVc+aLxiHk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bF2VkZ1nl+c4EDLfJSPZjk20hbd9Ssco5dqdyHTvGVoDL3A9LGKn+Fmiz/DWnBtWS
	 9EdP80Ba3utlJHDcoADEjCxGhDD6v1yFEGWrvaoRMiR5pEZUPBIk3FFqdBt4ftZteV
	 X0WXh5KfctE12bCNUvqGrNYUBt+b9ER3BggYHIz5U9VENqBVVKh+Z86FNTVEL3IySH
	 zjvqoR84MuXUd+G7adkk1DYURA+YH2eI67cNOHtYYrf1wgFECZNVHODDxAczCBqiuC
	 7bEGAG/jOS2hyCsr2JLo6Ye/UQ5GbS/TvKVNhb6a5s7eeNOmipeth1q7jGPAa06Q79
	 TV/qRsuayJqfw==
Subject: Re: [PATCH net-next v03 4/4] hinic3: Ensure that the value of max_qps
 is not changed
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
Date: Mon, 16 Nov 2026 13:51:04 +0000
Message-ID: <179483706434.3136.8532436488402631937@kernel.org>
In-Reply-To: <75d0140471d5f48801d6ad565ccd1829f337e35d.1794467919.git.gongfan1@huawei.com>
References: <75d0140471d5f48801d6ad565ccd1829f337e35d.1794467919.git.gongfan1@huawei.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch is presented as a bug fix (it carries `Fixes:
  1f3838b84a63 ("hinic3: Add Rss function")`), but I could not find any…

--

hinic3: Ensure that the value of max_qps is not changed

This patch stops hinic3_try_to_enable_rss() from setting nic_dev->max_qps
to 1 when RSS is unsupported or its setup fails. On those paths it now
sets nic_dev->q_params.num_qps to 1 directly. It also changes the check
on the function's queue count from "<= 1" to "== 1".

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> index 25db74d8c7ddb..75dc0c044071c 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> @@ -307,15 +307,13 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
>  	int err;
>  
>  	nic_dev->max_qps = hinic3_func_max_qnum(hwdev);
> -	if (nic_dev->max_qps <= 1 ||
> +	if (nic_dev->max_qps == 1 ||
>  	    !hinic3_test_support(nic_dev, HINIC3_NIC_F_RSS))
>  		goto err_reset_q_params;
>  
>  	err = alloc_rss_resource(netdev);
> -	if (err) {
> -		nic_dev->max_qps = 1;
> +	if (err)
>  		goto err_reset_q_params;
> -	}

[ ... ]

> @@ -332,5 +329,5 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
>  
>  err_reset_q_params:
>  	clear_bit(HINIC3_RSS_ENABLE, &nic_dev->flags);
> -	nic_dev->q_params.num_qps = nic_dev->max_qps;
> +	nic_dev->q_params.num_qps = 1;
>  }

[Severity: Medium]
Which bug does this fix? The patch has a Fixes: tag for 1f3838b84a63
("hinic3: Add Rss function"), but I couldn't find a reachable problem
in the old fallback.

The only caller of hinic3_try_to_enable_rss() is hinic3_sw_init(). Every
allocation sized from nic_dev->max_qps happens after that call, so the
value is already final when it is used:

hinic3_sw_init()
    hinic3_try_to_enable_rss()        <- max_qps settled here
hinic3_alloc_txrxqs()
    hinic3_alloc_txqs()               <- num_txqs = nic_dev->max_qps
    hinic3_alloc_rxqs()               <- num_rxqs = nic_dev->max_qps
    hinic3_init_intr_coalesce()
ndo_open
    hinic3_setup_num_qps()            <- qps_msix_entries sized by max_qps

With the old code, an RSS failure gave a consistent single-queue setup:
max_qps = 1, one txq and one rxq, one coalesce entry, one msix entry and
num_qps = 1.

The commit message says:

  "However, the value of nic_dev->q_params.num_qps can be dynamically
  changed."

Does that hold at this commit? hinic3_config_num_qps() already forces a
single queue when RSS is off:

	if (!test_bit(HINIC3_RSS_ENABLE, &nic_dev->flags))
		q_params->num_qps = 1;

The driver also has no ethtool set_channels or set_rxfh callback, so
nothing can turn RSS on or raise the queue count later.

The commit message also says:

  "nic_dev->max_qps is used to allocate hardware resources. Therefore,
  it is assigned the value 1 only when its value is abnormal."

The diff removes both "nic_dev->max_qps = 1" assignments and adds none,
so after this patch nothing ever sets max_qps to 1.

On the hardware side, the limit is nic_io->max_qps, which
hinic3_init_nic_io() sets separately and this function never changed.
nic_dev->max_qps only sizes software arrays. alloc_etherdev_mq() in
hinic3_nic_probe() uses its own local max_qps.

The commit message also doesn't mention the "<= 1" to "== 1" change. It
looks harmless, because max_sqs is computed as
min(nic_max_sq_id + 1, HINIC3_CFG_MAX_QP) and is always at least 1.

As far as I can tell, the only change in behaviour is on the RSS failure
path. There, txqs, rxqs, intr_coalesce and qps_msix_entries are now
sized for the full hardware maximum while the device still runs on one
queue.

Is this meant as a design change rather than a fix? If so, could the
commit message say so, and could the Fixes: tag be dropped so this
doesn't get backported to stable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794467919.git.gongfan1%40huawei.com
