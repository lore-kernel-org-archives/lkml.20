Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5934611C2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194778; cv=none; b=BN6h3WZGD7NjcFcggygBIiySsampywPsVmNiTfKJx0xyRLZBU/NINESlGYLf5XYnLtA1WZu1+XLl3XtXrihh4z79x6oNJPTOuc53umJ/UsBWu+0G8paGW5DE6Y/u+LZ0JRDyqXvRJ3pv+4O98JNX+V9ErMGH5FlXoNxWWQoYQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194778; c=relaxed/simple;
	bh=meA6MsQGL4r+3NWB8mPcZgx3ZsEQbioVKTri4hnL4O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9hfbbQ5c4M1OLR1FB1PIWko+lqnD6rQhRL+w1VcolwESRsTUrBTqBigeXKVX83BDLIN17Inmf8xpiSYoO0GH99w3nVduIge2srwd4YfX8+oCidXRi7kkLzphPmLM5IgoPfzb2nD+jWQ5yu2so7RvF69uMFX9VCimhFgRa+E5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPe5AK6Q; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPe5AK6Q"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so1234083eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194776; x=1792799576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJzMPP3FpZ1Vumfeo71j9PoiRQb0nGjd9sFzsJIM0NY=;
        b=GPe5AK6QjV3Cnc+Y5GEwsyK7FawTgaK0F/bNA0PT0XOfvjfWBB3qq8WBi029HFkRVD
         cD5J68YMSeU2rWI13hOSoSo7ezB/tAchX9TQNez1ktgdBZFagCeuLfNLA0V7Hf2Oi8i0
         +27WLU1EXX6slI4CSysQ8qZS5aOKi/z4Q8+KfTh4HEWf6W5kOlGjU7VGPgWg4qSOQuPe
         UNTvvJfVWNLFgLk/qwrIPt+HnTUgRAILOrQDa8I2RU+utp+zPw4bnTgDLQGtBVQ1Yxuz
         mJGRRC7bNxFQ/s9evc++PyEE3CJzV0OxvEwonmNH5hLeo+lhq25kNe/zH6ioArxiTmgR
         c2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194776; x=1792799576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJzMPP3FpZ1Vumfeo71j9PoiRQb0nGjd9sFzsJIM0NY=;
        b=w3Aa+ox7ftTw+jC7590ka739Wzo2SMUN8BsjlshXRHRL8pZHyI6/kPaCFWjNDcAfEo
         GAlI0nDLii/ojW0EmLjKC0W+fjU//7DKAOHUMIPkztna5CozsyTLNmBFO0bCmWmHspZu
         xOrHwC0ay9Lbt4QfHC81ozKBUKLyPmgYEvEUT43i2TpUEZKFpTfR6W9e+XnD73S/FX7d
         Cb4ooS/bz2/b3tWnHrtVaAuAqysGgl+q7DmaNF8gWrgH/+r24YsorLTB0lNRB2IbStEA
         0stePsHsnh9Y6zyg7A+q7hsQgBfkXGDK0DG4Cx/1tFxbl3TuBBBEM+FO93xgEQ6G+piM
         vS9A==
X-Gm-Message-State: AFq9FYK3778PQVaONz9alq8ahYhJqcNWmGHqfstVpSH/rxDxt/DxWy2b
	k8qPg4y3ORjrOv2ZbWM+r7C4oA+L8VNpi4sOS1+2jn8fGz6CVb3wZ4GV
X-Gm-Gg: AYBFou0URV3IOrEhwfsX00MD3VPR3APnWoD9ZGqCP52sPRCLr/ks3z1PyJzSiOSME/m
	B1MLWoscEAk2zMkU0Ropb3MKurtPSxfYdM4XYoN9y/L2O3W4k8gwTzk6i8IE/u8x0D6wJCvXxWl
	+9C5Ws43xR7fexCqDr8k9wedx0YJBIFQDfwibknM8N5bM/0gFAB8/zwOpiVhdVUwBDZvQbUjSvb
	ValBadY3amoDq8D1N8YCykFECdityXa6XLYmWXWu5p15HhjhU440OYslFYBAWAoNbkhq3z96Snv
	p9kZiYRbWbKNti21/K+5p4cz1yJ2s8ZqsVp1yzsURceZ9BQ/4AD3K3y5ZgF6y4/Y0MBFSC7y7T0
	HVCk4ed7KE5lNSVi00RjzBx0RbeSnssGvTkZbie9n+WOXgZQDf/mXjfKGPNVVJNJGiHRsYR+uqM
	Lg2U51hshjMsAVzDv+gwWpPDHCWzBsd0enck4Ily2w5tYv71Q6/IFGWt+S6k5pabrjWQgYY36D7
	vdKR8347oqtcHKvfF0is704hc2K82o9yuU46Y2G5bzAULo8Q61QMGC+mssDzZQqZyY=
X-Received: by 2002:a05:7301:2710:b0:360:b8b4:840a with SMTP id 5a478bee46e88-361a2747820mr1915199eec.39.1792194775702;
        Fri, 16 Oct 2026 16:52:55 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:ec14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm9181665eec.26.2026.10.16.16.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 16:52:54 -0700 (PDT)
Message-ID: <a0eb0511-fe0f-419c-adec-159dc16913ae@gmail.com>
Date: Fri, 16 Oct 2026 16:52:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 1/2] hinic3: Add ethtool statistic ops part1
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>,
 Teng Peisen <tengpeisen@huawei.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Mohsin Bashir <mohsin.bashr@gmail.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
References: <cover.1792149958.git.gongfan1@huawei.com>
 <3cda990995ccb002019f147b7a0c004c542229aa.1792149958.git.gongfan1@huawei.com>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <3cda990995ccb002019f147b7a0c004c542229aa.1792149958.git.gongfan1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/16/26 4:13 AM, Fan Gong wrote:
> This commit adds per-queue TX/RX software counters and firmware-backed
> vport and physical port statistics to the hinic3 driver. It implements
> the .get_strings, .get_sset_count and .get_ethtool_stats callbacks so
> these can be read with ethtool -S, and adds packet/byte accounting to
> the RX and TX hot paths.
> 
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  .../ethernet/huawei/hinic3/hinic3_ethtool.c   | 294 ++++++++++++++++++
>  .../ethernet/huawei/hinic3/hinic3_hw_intf.h   |  11 +
>  .../huawei/hinic3/hinic3_mgmt_interface.h     |  37 +++
>  .../ethernet/huawei/hinic3/hinic3_nic_cfg.c   |  64 ++++
>  .../ethernet/huawei/hinic3/hinic3_nic_cfg.h   | 108 +++++++
>  .../net/ethernet/huawei/hinic3/hinic3_rx.c    |  64 +++-
>  .../net/ethernet/huawei/hinic3/hinic3_rx.h    |   8 +-
>  .../net/ethernet/huawei/hinic3/hinic3_tx.c    |  70 ++++-
>  .../net/ethernet/huawei/hinic3/hinic3_tx.h    |   5 +-
>  9 files changed, 649 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> index 90fc16288de9..bb6094d61196 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> @@ -13,8 +13,11 @@

[...]
> +static u16 hinic3_get_hw_stats_strings(struct hinic3_nic_dev *nic_dev, char *p)
> +{
> +	u16 i, cnt = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(hinic3_function_stats); i++) {
> +		memcpy(p, hinic3_function_stats[i].name, ETH_GSTRING_LEN);
> +		p += ETH_GSTRING_LEN;
> +		cnt++;
> +	}

Do you need to manually add/track the offset? Couldn't you let
ethtool_puts()/ethtool_sprintf() do the hard work?

> +
> +	if (!HINIC3_IS_VF(nic_dev->hwdev)) {
> +		for (i = 0; i < ARRAY_SIZE(hinic3_port_stats); i++) {
> +			memcpy(p, hinic3_port_stats[i].name, ETH_GSTRING_LEN);
> +			p += ETH_GSTRING_LEN;
> +			cnt++;
> +		}
> +	}
> +
> +	return cnt;
> +}
> +
> +static void hinic3_get_qp_stats_strings(struct hinic3_nic_dev *nic_dev, char *p)
> +{
> +	u8 *data = p;
> +	u16 i, j;
> +
> +	for (i = 0; i < nic_dev->q_params.num_qps; i++) {
> +		for (j = 0; j < ARRAY_SIZE(hinic3_tx_queue_stats); j++)
> +			ethtool_sprintf(&data,
> +					hinic3_tx_queue_stats[j].name, i);
> +	}
> +
> +	for (i = 0; i < nic_dev->q_params.num_qps; i++) {
> +		for (j = 0; j < ARRAY_SIZE(hinic3_rx_queue_stats); j++)
> +			ethtool_sprintf(&data,
> +					hinic3_rx_queue_stats[j].name, i);
> +	}
> +}
> +
> +static void hinic3_get_strings(struct net_device *netdev,
> +			       u32 stringset, u8 *data)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	char *p = (char *)data;

What's the purpose of casting here and throughout the patch?

> +	u16 offset;
> +
> +	switch (stringset) {
> +	case ETH_SS_STATS:
> +		offset = hinic3_get_hw_stats_strings(nic_dev, p);
> +		hinic3_get_qp_stats_strings(nic_dev,
> +					    p + offset * ETH_GSTRING_LEN);
> +
> +		break;
[...]
