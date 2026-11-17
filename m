Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=12.32.117.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924647;
	b=VnsJ7mhApFmUlRiH81hXtWTmk7N199DpFcgUqHUqILC2wX3RcZ14FaS8XR0g7s7gEdae
	 f6awnb6qlTKag0PbdZn2A8e4i+sN/Y50myfz47lLm/2IS7CC1TutYx1m7GnlctJxWPK5H
	 P/BO+aRvgw/WLA4J59d+pHexHaXnrk5j2Xt5k0BjF7MIHinEGNHQNiPMjOTYP7FlDfdNC
	 76mYWosWOFWegDjNkowQP9bWfF/aC4LTbTryuZlWekDsilfA+FfGeGcmOdFu1aPtQh09+
	 1n4sr9vhYTmKQEdVlbC2r+rhwbpCWld5ZJXOiE0e5EnjnvarjXDoBz2Fb2ZAfgSdyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924647;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sbCeEi/zdy+UVGUuW0RVFLXiGPzDGrZ8Z79PUhXSy3Y=;
	b=h3DWKpa/IyJqDImaGI+uMpd6KZGXSasadxBJ4aosYdRBFfMwTL8rRY1rp+50oXGpjj/K
	 mMwipZcp9V+jNv2VbHNUaioQ68DsZG/vHylHcYW02Wa+F2A70ZSVwrpDugd/SfkmtxegN
	 HOb3vtLkakOofblOJcQYECcXAoqRIGbyiWscgf9MXI3czrn1jmh8Bz6fiY7Ym2ejeHXjz
	 l+xV8nYEfvQlVdMWffhSfe64YZo4DoKT0q+n/2ZItWjRQ/iPUuiCU7jBgSmB/iIJlkwyh
	 3QeBw23nZiiZe/g/xuGNh9uKxnw3fWRnHqWIKmiewZoS5qyCYC64p8S6fm+yH2n2FUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chelsio.com;
	spf=pass smtp.mailfrom=chelsio.com;
	arc=none smtp.remote-ip=12.32.117.8
Received: from stargate.chelsio.com (unknown [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C9606A31C;
	Tue, 17 Nov 2026 14:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost ([10.193.191.19])
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 6AHEAcQg013376;
	Tue, 17 Nov 2026 06:10:39 -0800
Date: Tue, 17 Nov 2026 19:40:17 +0530
From: Potnuri Bharat Teja <bharat@chelsio.com>
To: Artemii Mashanov <ralerrdirsardx@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@kernel.org" <edumazet@kernel.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] cxgb4: allocate the full ethtool filter location
 array
Message-ID: <avxgSZdRIe07WZfT@chelsio.com>
References: <20261117090608.33178-1-ralerrdirsardx@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117090608.33178-1-ralerrdirsardx@gmail.com>

On Tuesday, November 11/17/26, 2026 at 14:36:08 +0530, Artemii Mashanov wrote:
> The ethtool filter location array stores nentries u32 values, but
> cxgb4_init_ethtool_filters() passes nentries to kvzalloc() as a byte
> count. The insertion and lookup paths allow indices below nentries,
> which can address memory beyond the requested allocation.
> 
> Allocate nentries elements with kvcalloc() and the element size.
> The array remains compatible with the existing kvfree() calls.
> 
> The size mismatch was found by reviewing the allocation, the array
> declaration and the indexed accesses in the filter handlers.
> 
> Fixes: d915c299f1da ("cxgb4: add skeleton for ethtool n-tuple filters")
> Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
> ---
> Compile-tested cxgb4_ethtool.o with GCC 14.2 on x86-64 net/main
> aa40afa831eb using W=1 and KCFLAGS=-Wno-error=format-truncation.
> Both baseline and patched builds reported the same get_drvinfo()
> format-truncation warning. Hardware validation is pending.
> 
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
> index 0092bc16f887..c72c0bcd45c8 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
> @@ -2269,7 +2269,9 @@ int cxgb4_init_ethtool_filters(struct adapter *adap)
>  	eth_filter->nentries = nentries;
>  
>  	for (i = 0; i < adap->params.nports; i++) {
> -		eth_filter->port[i].loc_array = kvzalloc(nentries, GFP_KERNEL);
> +		eth_filter->port[i].loc_array =
> +			kvcalloc(nentries, sizeof(*eth_filter->port[i].loc_array),
> +				 GFP_KERNEL);

Thanks, Tested on T6, ethtool -N filters at high locations now insert and delete cleanly with KASAN enabled.

Reviewed-by: Potnuri Bharat Teja <bharat@chelsio.com>
Tested-by: Potnuri Bharat Teja <bharat@chelsio.com>
>  		if (!eth_filter->port[i].loc_array) {
>  			ret = -ENOMEM;
>  			goto free_eth_finfo;
