Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE04A64EF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265107; cv=none; b=onBC7WL6SOYxdKTgzFLaezLiP47iQwFBibqvYpbTdYePkucYN2FTgFPhOdV6At/zoIX7ZldWPy0Dh6SIRddo1qOBtNIijm4/VJqNd2D7oFD7H6YNpgsOFXaNuuIfpLm3hw521yOGGykiyqrrtkMKIXIaaNx3VEeZ5YgsCAQfuII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265107; c=relaxed/simple;
	bh=2Bf0mnwdyo39EE6DxuV6NPKmxRXCmQpodPDRGJilOXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dl62WSBkrWWsd4KWvb6OxsLGA4yVdGn8MjTNtrEHStrr/A6iACCu678JZvS3/8h1bIR4j24VrN+J/0Euh7ode6Kvjf41lPC0ac2/V8WBFr/DUOcemCKDuT0NJRZ+FKi7uiERN4zXH6mWApdsSo6OrgNwDvPzz6O3XxgS8L6KHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6E/ZFPx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6E/ZFPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790265106; x=1821801106;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2Bf0mnwdyo39EE6DxuV6NPKmxRXCmQpodPDRGJilOXY=;
  b=l6E/ZFPxAOT9Cq0QUAqXne21/zQ0XgEFz5Qj28D8dX/yJCZyAl4nOyVD
   NLIWqkeV4IKzsPpHVP3ZQ+XH0O6HoqW3C91KQ2V9nrBf8H0BEZHl1NhRA
   nBQJqgCNQM16m6U8b8Pfz2aAmAYD9TZ+K3/EpQBuOfwNg3aCdwAU9ZHRG
   wg26Wt2djS22XESCoqiXV0LrxvzR2RpyFnBO2TrT0Tuhv2pKKJd3o4MvV
   hFDcxZRwfoKztvQY8GD2NgH47dRqczrZ/rkt2ODJebYczj4mSDfJvXymI
   JQQKrNJv3O1Qdz2ryX/tVt0he/SqPS5p4vxF4vDZioORN+IAC2Q5OlWk2
   w==;
X-CSE-ConnectionGUID: AXpcLOTDRmqacih2/NwA8A==
X-CSE-MsgGUID: j2tVCAgsQ4CBLxHx1np5RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102401297"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="102401297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:51:45 -0700
X-CSE-ConnectionGUID: kXNk3BixQg2FEKMjVKajOA==
X-CSE-MsgGUID: vkNNc1nRSACqZq3MM8Y9BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277454720"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO [10.125.110.186]) ([10.125.110.186])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:51:44 -0700
Message-ID: <6a0db9eb-c1b4-4545-8b12-2dd8326d664b@intel.com>
Date: Thu, 24 Sep 2026 08:51:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] NTB: ntb_transport: Drain RX tasklets during
 link cleanup
To: Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Logan Gunthorpe <logang@deltatee.com>,
 fuyuanli <fuyuanli0722@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Bellinger <nab@linux-iscsi.org>,
 Joey Zhang <joey.zhang@microchip.com>, ntb@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260910040836.3792333-1-den@valinux.co.jp>
 <20260910040836.3792333-10-den@valinux.co.jp>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260910040836.3792333-10-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/26 9:08 PM, Koichiro Den wrote:
> ntb_qp_link_cleanup() cancels QP link work but does not wait for the RX
> tasklet. The tasklet can still be processing the ring while cleanup
> resets the QP, and transport link cleanup can free the MW before the
> tasklet finishes.
> 
> Clear active under rx_sched_lock and drain the tasklet before resetting
> the QP. Temporarily disable QP link work so a concurrent client link-up
> request cannot reactivate RX during cleanup, then re-enable it for the
> existing link setup paths.
> 
> This does not drain RX DMA transfers or their completion callbacks.

Is this something that we should handle?

DJ

> 
> Fixes: 9143595a7e05 ("NTB: ntb_transport: Free MWs in ntb_transport_link_cleanup()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - No changes.
> 
>  drivers/ntb/ntb_transport.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 45d4365becac..36797ea3ff45 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -956,11 +956,16 @@ static void ntb_qp_link_cleanup(struct ntb_transport_qp *qp)
>  
>  	dev_info(&pdev->dev, "qp %d: Link Cleanup\n", qp->qp_num);
>  
> -	cancel_delayed_work_sync(&qp->link_work);
> +	disable_delayed_work_sync(&qp->link_work);
> +	ntb_transport_set_qp_active(qp, false);
> +	tasklet_kill(&qp->rxc_db_work);
> +
>  	ntb_qp_link_down_reset(qp);
>  
>  	if (qp->event_handler)
>  		qp->event_handler(qp->cb_data, qp->link_is_up);
> +
> +	enable_delayed_work(&qp->link_work);
>  }
>  
>  static void ntb_qp_link_cleanup_work(struct work_struct *work)

