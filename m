Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718619;
	b=EP+wLXe3LFye5Kd6EmIWo4ou0nsCgMx/RJ7NGE1nV/aUSA4064Uc7Fzv4ycaEUs5CGmf
	 otuj7w+qxYLeIDcDMGb+yFox7kq/QwJNdXnpUPY/g6Du7eck4iQ7IxR9qWv3t1YzJVg8+
	 mrkTb3+OPm5TE+mGIf7AO7qKf/svz5VAVDQz9j9lT3fpMX69H54EOk/LmobyDL0HnoK7n
	 W+KXeIjAlLlKbuuauiq5+ObTsuKjNpL3k0gb2SZ+SLtr+OrcIoTG5QPx5OUiSSkKaoZOR
	 l4/cPAWt5ig3uQHGpqTQ7eh18lZXyzLdxskLTB7ea+FkGdh3rC6cpzpkSTHG7IB03ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718619;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tI6zfMdxE7bLEfk7tQngRwcxVxwJBB6L+Hi89v7P2eQ=;
	b=e/xRFfmmfRlxLk74MbNZTAZG78kK4uZLmk/IhcPhEKQSyiLUdueyCVo69NuOKc7C+YVd
	 I0lZLcoeBXJTa/xwyOaJlhWX22Tw1zLfa7tZk5SPbc2K+DfCAoMl6K7t2stefoBgGzA1X
	 LehDl+hF++VOQ7qEwZ0SDbh5n+Nf5z8LQN2X2IZdG4KXu8ybQGdfQdCKDO7jhak0NcPFe
	 +UOHjYf3gyNHQEmNxF5dApJ7QyZ54vmCJ8nqoRANMZaapzLjJDl+nsGI6Wfdy+fs5X7ZA
	 bTKmcqlVdHZmBv5eDmjjHjXROkitaKAHsmOEnfdL9ZoPQYAlRmalg+E4hz32syo8/Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYijmX9C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C460A2613;
	Sun, 15 Nov 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYijmX9C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8057C1F000CA;
	Sun, 15 Nov 2026 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718619;
	bh=tI6zfMdxE7bLEfk7tQngRwcxVxwJBB6L+Hi89v7P2eQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TYijmX9CknZ2FtlQaD0z4+LrV1K2wBSCGiihIVaXyzivKXJRyYRZZx5iar5COqbyW
	 yKyTXgq+GQEqyd6fawtPodVS7PQCyE4vOOp0FxJD5A5MHm93ACyecQNMIe1aGCGoal
	 JnptMkOmyZwL7zVuOcmWgXCzvl/hkdt0weB7SYHs2EBQPmiPrcti8H+ES67ZX3vZFn
	 545zKEmmMMvBOGGVsvhDItsHjaWLzqJc8+crHyZLMAO1g3bRUwgwcj8xyvNSeyeNr4
	 NWEY1UuMEhzMRhYlJeLbheOsct8lwYnHdL2Com7zJYTb+AXyTDMBRuwFEUHJAOlK/D
	 j7JCMDTyXrryQ==
Subject: Re: [PATCH net-next v02 5/5] hinic3: Ensure that the value of max_qps
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
Date: Sun, 15 Nov 2026 04:56:58 +0000
Message-ID: <179471861806.2199510.11943795385941858718@kernel.org>
In-Reply-To: <f29963a1b343ec749f566decbbdb67e7e018860f.1794371175.git.gongfan1@huawei.com>
References: <f29963a1b343ec749f566decbbdb67e7e018860f.1794371175.git.gongfan1@huawei.com>
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

- [Medium] The patch has a Fixes: tag, so it will be treated as a stable
  bug fix.

--

hinic3: Ensure that the value of max_qps is not changed

This patch stops hinic3_try_to_enable_rss() from setting nic_dev->max_qps
to 1 when RSS setup fails. On that path it now sets only
nic_dev->q_params.num_qps to 1. It also changes the max_qps <= 1 check to
max_qps == 1.

> nic_dev->max_qps is used to allocate hardware resources. Therefore,
> it is assigned the value 1 only when its value is abnormal. In other
> scenarios, the value cannot be changed. However, the value of
> nic_dev->q_params.num_qps can be dynamically changed.
>
> Fixes: 1f3838b84a63 ("hinic3: Add Rss function")

[Severity: Medium]
Is this description accurate? The users of nic_dev->max_qps appear to
size only software arrays:

hinic3_alloc_txqs()          -> nic_dev->txqs
hinic3_alloc_rxqs()          -> nic_dev->rxqs
hinic3_init_intr_coalesce()  -> nic_dev->intr_coalesce
hinic3_setup_num_qps()       -> nic_dev->qps_msix_entries

The hardware queue capacity comes from nic_io->max_qps, which is set on
its own:

drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:hinic3_init_nic_io() {
    ...
	nic_io->max_qps = hinic3_func_max_qnum(hwdev);
    ...
}

The removed nic_dev->max_qps = 1 assignments never change that value.

What failure does the Fixes: tag refer to? hinic3_try_to_enable_rss() has
one caller, hinic3_sw_init(). It runs before hinic3_alloc_txrxqs(), and
before hinic3_setup_num_qps() at open time. So with the old code, every
array sized from max_qps was sized at 1 after an RSS failure, and the
sizes matched.

At open, hinic3_config_num_qps() also forces num_qps to 1 whenever RSS is
disabled:

drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c:hinic3_config_num_qps() {
    ...
	if (!test_bit(HINIC3_RSS_ENABLE, &nic_dev->flags))
		q_params->num_qps = 1;
    ...
}

So after an RSS failure the device runs one queue, both before and after
this patch.

The only visible change seems to be on the RSS failure path: the
per-queue software arrays are now sized for the hardware maximum instead
of 1.

Could the commit message name the symptom being fixed, or the later change
that needs max_qps to stay at the hardware capacity? If neither exists,
would this fit better in net-next as a cleanup without the Fixes: tag?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794371175.git.gongfan1%40huawei.com
