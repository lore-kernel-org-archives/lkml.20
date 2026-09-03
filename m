Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B85378813
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451259; cv=none; b=fKHpMysB/HBtcJBTiikP4bnNHFt6QNjfDA/wvVpzw32qRvWXnSFk7mYnKebbUt443SHSElrzUsxz+6nyUPcpombafH6dlHNmvP8vaaDuG8H+aHVCZlOADiRmiunhk5CokfjBwt0Q6ADQQZiZndB76fvy9rlQroAYaFmHJP90/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451259; c=relaxed/simple;
	bh=A7n5QG9Jrq+2C38U170Iv6gJVcsHrMheTE2SwSWSYKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVYTP78lnWH8nxTD6dPi4EpCVC3zIIrK8k9RT3PCyvkx6tQeb/LO2Wy/cNi0r4+YKitsiSm+iFd0xJy8YXUSf0ZxW+ga0grWtbBMcShcxsrDrcpyFo3FXGF11nVPlYotem/VsT54uHGJ2dWDlZDvoHS2dhIAOQ3PuJ233/26gTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVlcQUAM; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVlcQUAM"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-86d43cdee51so312177b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451256; x=1789056056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0iIQfc/Xn8g8sZnyqtSBPoDrNyGH3/tP4TlfCZpLUs=;
        b=GVlcQUAM2oQdOmJHl9IaCoouSEuT55xhWUtP9l+YhmIGLXoAUQfhURpO7VRuCLRkqn
         DE4drM0mfakSXv6Yaigt1YFE/01S8xQ71cWPGi2EsT/N9fMCkmAILZr+S0uRWvJ0xQ9W
         ldRt9RkZLS1dES1tP9FGdQ2tDEZtwA1On0duy1OrASlqhYXLmqnyzgZaj2jL12XhICX9
         hFlfiFxP+T9dmXhQG4vUl6Ma4B66byJrnkmUYdFALAGY+bBIQTNbW3nxgApibuWS2mCj
         Xh/72IvkCC8vJG4MJTJzJ7gUBVn5SUoYA0nlZzN+RC/ceYfpxKNxYDcE70j0gTipgCln
         +AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451256; x=1789056056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0iIQfc/Xn8g8sZnyqtSBPoDrNyGH3/tP4TlfCZpLUs=;
        b=dvChB/qsb/6H8QAJH3JRPKdUsRAAAxbsb/TxuLsUJqZkPgWJG13R3YCX30pS5tuCi1
         c6KP/017eOa/sRkCNf6LA3ppQInbhHizSttPS49YX/gvTvmfcjwdlLrmr4nq2fFKWQ6c
         LZT9w8w64c0v9ZvF2S48/g6/hmclolExuqe0+IZ5F205x8RQkf33g6BZN3pvEw0J8QzD
         H+N/7gPUO2nZJX5zIXHFWMlfWJPBTdY+RQ7piKhE+DEg8iYzC/TsC8EQslqSlO28c8ow
         Pw4kEhKfmsgKnvYApoURtw6qaBWqT3uHw3kllc00IRx/9mstgRYCh+y9AXe+EdDZOV+Z
         5Tgg==
X-Forwarded-Encrypted: i=1; AKwUvBxP4SulHbEikweTFAGwQBk8sJk9e55ogLluyNOfP6+CI5LZxMxf/KDa26fmFC7B+5urXZEbSryhlaroJLM=@vger.kernel.org
X-Gm-Message-State: AFuF++lvlQ5nrB4Py3K+R+JwWviyNAIcfPeso9yRWPjWEu0+kQDzHt1T
	rw6ixNkF9DC7cjcpT36g7Qt0ieD1Uu0PL4b3TUChOOC422pfKgadJSiW
X-Gm-Gg: AYBFou0rIfLs8O6Mp1zmbnMr3OKVvxsn7ijRDFkd2X70ZtCPAQsotiok3OH+BHqlR6D
	8AnK4OA3+fl9Lgc3QFVwBuZvtxcwa8uk2Xvzyr4Uo7xPGxjIt4KaRNkO9+gqP3pU6cjuQfa/bVn
	od20tAmlNlv6IVwE0tRVbHNFR/vQzcTCftlLSO2U8axb+iu6DMiq40jsWBahjO4mGfR+HkQqzYO
	Q61CrGnwJugU25gCnLmp8y+oGi1CvnqpP8IMq3EG/RkIIoNhNuy4BCorlBw7YlTXWBHVqW+gwsE
	Xk1vgwNn3+Jwtahhoi2IgUuyId6h2MCz7nTrMHja0pX+72V7RldcbTOdin1cR7qOc9ZhtlwU4ty
	vHvZrbqUGZrybEN1REOLJQw9pIsYBj+O1UBUM4TFWm4LOc68drRqidF7kwo+JucMnxJRJLrntwS
	ZF0RS4AAomOrDQLKPV+48iuM8s7oJxf03Gp8NXNwUt4Lp2J+v01wdJ+ApjsdwnsA==
X-Received: by 2002:a05:690c:e694:10b0:820:15ad:522c with SMTP id 00721157ae682-870ed3429c9mr3743287b3.11.1788451255669;
        Thu, 03 Sep 2026 09:00:55 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c186d60f8sm43058097b3.36.2026.09.03.09.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 09:00:54 -0700 (PDT)
Message-ID: <eb208b80-4cf2-4c3b-90c7-f68520382cf6@gmail.com>
Date: Thu, 3 Sep 2026 12:00:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 3/3] e1000e: fix NETIF_F_RXALL buffer overrun
To: intel-wired-lan@lists.osuosl.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260902032913.661570-1-tactii@gmail.com>
 <20260902032913.661570-4-tactii@gmail.com>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260902032913.661570-4-tactii@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 23:29, Matt Vollrath wrote:
> When SBP is set, the card may deliver frames which would otherwise be
> filtered out by LPE being unset. This would allow the device to write
> up to 526 bytes beyond the skb's data allocation: over its own shinfo,
> and beyond. This bug is reachable only when MTU <= 1500 and
> NETIF_F_RXALL is set ("ethtool -K <dev> rx-all on").
> 
> Ensure that buffers are large enough for an entire 2048 byte chunk when
> NETIF_F_RXALL is set. Do this by moving final rx_buffer_len
> determination to one place, right before RCTL.BSIZE is determined. This
> will correctly re-evaluate every time the adapter is configured, not
> just on MTU change.
> 
> Signed-off-by: Matt Vollrath <tactii@gmail.com>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Assisted-by: Claude:claude-5-fable
> Fixes: cf955e6c96cb ("e1000e: Support RXALL feature flag.")
> Cc: stable@vger.kernel.org
> ---
>   drivers/net/ethernet/intel/e1000e/netdev.c | 53 +++++++++++++---------
>   1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
> index 063fc8cd2673..80d5a0010df8 100644
> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> @@ -3036,6 +3036,33 @@ static void e1000_configure_tx(struct e1000_adapter *adapter)
>   #define PAGE_USE_COUNT(S) (((S) >> PAGE_SHIFT) + \
>   			   (((S) & (PAGE_SIZE - 1)) ? 1 : 0))
>   
> +/**
> + * e1000_set_rx_buffer_len - determine the Rx buffer size
> + * @adapter: Board private structure
> + **/
> +static void e1000_set_rx_buffer_len(struct e1000_adapter *adapter)
> +{
> +	struct net_device *netdev = adapter->netdev;
> +	u32 max_frame = adapter->max_frame_size;
> +
> +	/* NOTE: netdev_alloc_skb reserves 16 bytes, and typically NET_IP_ALIGN
> +	 * means we reserve 2 more, this pushes us to allocate from the next
> +	 * larger slab size.
> +	 * i.e. RXBUFFER_2048 --> size-4096 slab
> +	 * However with the new *_jumbo_rx* routines, jumbo receives will use
> +	 * fragmented skbs
> +	 */
> +	if (max_frame <= 2048)
> +		adapter->rx_buffer_len = 2048;
> +	else
> +		adapter->rx_buffer_len = 4096;
> +
> +	/* adjust allocation if LPE protects us, and we aren't using SBP */
> +	if (max_frame <= (VLAN_ETH_FRAME_LEN + ETH_FCS_LEN) &&
> +	    !(netdev->features & NETIF_F_RXALL))
> +		adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
> +}
> +
>   /**
>    * e1000_setup_rctl - configure the receive control registers
>    * @adapter: Board private structure
> @@ -3102,6 +3129,8 @@ static void e1000_setup_rctl(struct e1000_adapter *adapter)
>   		e1e_wphy(hw, 22, phy_data);
>   	}
>   
> +	e1000_set_rx_buffer_len(adapter);
> +
>   	/* Setup buffer sizes */
>   	rctl &= ~E1000_RCTL_SZ_4096;
>   	rctl |= E1000_RCTL_BSEX;
> @@ -6087,30 +6116,12 @@ static int e1000_change_mtu(struct net_device *netdev, int new_mtu)
>   
>   	pm_runtime_get_sync(netdev->dev.parent);
>   
> -	if (netif_running(netdev))
> +	if (netif_running(netdev)) {

I see now that I should not have collapsed this to one netif_running check.

>   		e1000e_down(adapter, true);
> -
> -	/* NOTE: netdev_alloc_skb reserves 16 bytes, and typically NET_IP_ALIGN
> -	 * means we reserve 2 more, this pushes us to allocate from the next
> -	 * larger slab size.
> -	 * i.e. RXBUFFER_2048 --> size-4096 slab
> -	 * However with the new *_jumbo_rx* routines, jumbo receives will use
> -	 * fragmented skbs
> -	 */
> -
> -	if (max_frame <= 2048)
> -		adapter->rx_buffer_len = 2048;
> -	else
> -		adapter->rx_buffer_len = 4096;
> -
> -	/* adjust allocation if LPE protects us, and we aren't using SBP */
> -	if (max_frame <= (VLAN_ETH_FRAME_LEN + ETH_FCS_LEN))
> -		adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
> -
> -	if (netif_running(netdev))
>   		e1000e_up(adapter);
> -	else
> +	} else {
>   		e1000e_reset(adapter);
> +	}
>   
>   	pm_runtime_put_sync(netdev->dev.parent);
>   

