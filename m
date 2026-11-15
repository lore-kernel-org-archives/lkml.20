Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718618;
	b=WJQiqNm/ns2Xjs0S1WFoQ1F9HzmPPPweAAfEmRITiIfmyUbQcSL3h7xI0H+ZceWG9GIA
	 hDfIJiq4HY079uLi2HBB8rqnvfuBdy8SA/jNSAbGuukaaJk6MvwvYFm6Sai7ib2HaHuN1
	 cAu04YtjE/+C0ObSolXdjVkd4cnFa+IPvBFeRg4Odqy7i09tjQknQrHUZ+6729tgjkvJ2
	 IdXGv7CsV+YrL59lHRF8TBJs8Wrh9TUEhG2oU0Wi9o7Btm4GGB+Db9kyo9Dd73Q1+1G3m
	 umD2c4Z4NoT+t8vhbPp6rFWHWBrb4MjJHVYYdrnTY3L9CzPLKpjYD+LfSLywk0Hg4ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718618;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=umEF1V5naPnh8ERwF6yGhvvB2KlgnFk29EnM3cvuuGo=;
	b=F0BWD/97MTvZZ+7/wnMSxhpWHe2/bgDqStSu2CfMk5zlPPD5MmXKmj91LLj7Bn9Jk6Tc
	 HgxBScMltHBpqobHaAxsTRRiN829CRmamk9bt+7o/zMBp36JExFGBJhU9gvHexgXSAl1m
	 2uEtbqo9TyzQ7qsCGvOVXhz/2VgNuiggJrcUxp/y+QCfo+4GOkbp5FIcEhVtkIZpbiATF
	 eOBFDcD50TbWlhv0Irt6Hhi2ZvSUK4x/gFkA0OLuxoySnNhalrtnk/cGa5h+S1xw9/ygB
	 oOdzNVy0VDcipHW66/NCZUXvICmKVM9aFvtxkSsepMl9uttLHmyCAZQNsBkAqesPf2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG5NuuYW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41318606A8B3;
	Sun, 15 Nov 2026 04:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG5NuuYW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9081F000C6;
	Sun, 15 Nov 2026 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718617;
	bh=umEF1V5naPnh8ERwF6yGhvvB2KlgnFk29EnM3cvuuGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cG5NuuYWiIGl/DlgwPlsR932Lygn7go3nbDe8hBNslFf7MPTlyCiov1BBBwvhJ5JH
	 AlhGmwPBwj3YL9esOOtbevpDSDMPVzvsRYWOPJ7KsbxZs1oYRem/NxyYNDH6iBDeQL
	 NnPEuTek3ZLNANe6VjIHU9dsScLlC8IzaCWBtycAkSPFbGwW6K74o1vYHl20z/Zvs0
	 f74y8fs7+5N/kZhCf20+01e5wMGvmomW40WX0obLHZ14jRa+bgBmOznVWO0Wf/uNNx
	 +07kPMr4wu+syNB4fmjGaAVbfT7kHstUVCaWUpTn5c+sY91p3TpVnHPNO8qKV4Re6Y
	 DgOGYviAkJvBA==
Subject: Re: [PATCH net-next v02 4/5] hinic3: Ensure the value of max_qps is
 greater than 1
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
Date: Sun, 15 Nov 2026 04:56:56 +0000
Message-ID: <179471861630.2199510.18244494312107393478@kernel.org>
In-Reply-To: <1bfd52d6bdc2a7fc1b7eaa183293d4859ad7d94a.1794371175.git.gongfan1@huawei.com>
References: <1bfd52d6bdc2a7fc1b7eaa183293d4859ad7d94a.1794371175.git.gongfan1@huawei.com>
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

- [Medium] The patch has a Fixes: tag but changes no runtime behaviour.
- [Low] The subject "hinic3: Ensure the value of max_qps is greater than
  1" does not match the code.

--

hinic3: Ensure the value of max_qps is greater than 1

This commit changes hinic3_func_max_qnum() so that the queue count it
returns is never below 1. It has a Fixes: tag for 17fcb3dc12bb and no
commit body.

> hinic3: Ensure the value of max_qps is greater than 1

[Severity: Low]
The subject doesn't match the code. The new expression in
hinic3_func_max_qnum() can still return 1:

	return max_qps <= 1 ? 1 : max_qps;

So the guarantee is max_qps >= 1, not "greater than 1".

The rest of the driver also handles 1 as a valid value.
hinic3_try_to_enable_rss() in hinic3_rss.c skips RSS when max_qps is 1:

	if (nic_dev->max_qps <= 1 ||
	    !hinic3_test_support(nic_dev, HINIC3_NIC_F_RSS))
		goto err_reset_q_params;

The same function also sets nic_dev->max_qps = 1 on its own error paths.

Would "at least 1" or "non-zero" describe the change more accurately?

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c b/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
> index c5dd53a8fa96c..65d3114548257 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
> @@ -267,7 +267,9 @@ bool hinic3_support_nic(struct hinic3_hwdev *hwdev)
>  
>  u16 hinic3_func_max_qnum(struct hinic3_hwdev *hwdev)
>  {
> -	return hwdev->cfg_mgmt->cap.nic_svc_cap.max_sqs;
> +	u16 max_qps = hwdev->cfg_mgmt->cap.nic_svc_cap.max_sqs;
> +
> +	return max_qps <= 1 ? 1 : max_qps;

[Severity: Medium]
Can max_sqs actually be 0 when this function is called? The only place
that writes it seems to be hinic3_parse_l2nic_res_cap():

	nic_svc_cap->max_sqs = min(dev_cap->nic_max_sq_id + 1,
				   HINIC3_CFG_MAX_QP);

nic_max_sq_id is a u16, so the + 1 is evaluated as an int and cannot
wrap. HINIC3_CFG_MAX_QP is 256, so max_sqs always ends up between 1 and
256.

max_sqs keeps its zeroed value only when hinic3_support_nic() is false,
because hinic3_parse_dev_cap() then skips the L2NIC parse. In that case
hinic3_nic_probe() returns before it calls hinic3_func_max_qnum():

	if (!hinic3_support_nic(hwdev)) {
		dev_dbg(&adev->dev, "HW doesn't support nic\n");
		return 0;
	}

The other callers, hinic3_init_nicio_res() and hinic3_try_to_enable_rss(),
are only reached later in the same probe. hinic3_init_capability() also
runs only once.

If that's right, the clamp doesn't change any value that can reach it.

Even if 0 did reach this function, the old code would fail cleanly
instead of crashing. alloc_etherdev_mq(sizeof(*nic_dev), 0) returns NULL
and probe fails with -ENOMEM, and hinic3_alloc_qps() rejects
!qp_params->num_qps.

With this change, a 0 from firmware would instead give a device that
silently runs with one queue.

The patch has a Fixes: tag but no commit body. Could the commit message
describe the symptom or firmware condition this fixes, so stable
reviewers can check what bug it closes?

The next patch in the series, "hinic3: Ensure that the value of max_qps is
not changed", changes the RSS check to max_qps == 1 and relies on this
guarantee. The guarantee already seems to hold before this patch, though.

>  }
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794371175.git.gongfan1%40huawei.com
