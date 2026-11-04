Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799327;
	b=O0ERtw7pEcpyOTM8O/zoQgb9VhCeUBfcDUQS8lDC+DliJk+iPBqEpy0MtUAOHuB9EZCV
	 0f6EwN7yBP9Hp3Dl2FFevkXGP7Z/zVSLi10BjXiMuSHgkC1x+EmGfVTA4XiSTtr9I1XiK
	 wL1l2Ua74pgCy+prR4kZJ0v6ImMr/4Z8TP26JOtgbc4dG06GgqpGYLemltsuxgIp37bsp
	 fUQtBtLlVLTGp9LQRdlJKtU8taF9m1NmtxVazgrY43FxrVxy8A57OnraQXJDD05/Vy8L1
	 lz8m3o8vLAsFz7dZ6J36sQz6QqW2FwCUXDEuj+aAPJR6eULC2NQ+jbcJlxsM8kyNmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bcVTjcoUuDJ00d+ZrLupJl8lYibYslwMamSO7+IhYGk=;
	b=CscqF+8EwJT0hNqRZ5WAezjp25uU77s3QERVPluDtS4v7YPG/7QrYjP7gvv33Zsh17r/
	 i8z3NIko0AX7xkN+yCYU2firSxhxKx077J03Hnbt06IzwrDsaYxBppvHQtcgYBM/q6Vqa
	 1kmQXLbDqAizRQwLXdKxheHX02fGvil++GvOzNN6KaP5Ta0jdZKjwWB7nH4DanaraPopW
	 ev9ZiRBRAh6hqkqrPgXLOAGnEFzae7272UJWMUZjsLrGEDrFNhzkFwmjgsaL2/e/KNK45
	 T3yBAmbYCKcgQ1JioT4YjcCEMrfou0KdoLI5R2YtBCbE9rg46TOWvauQCeawDNtjMNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LlYpn60K;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E588606A330;
	Wed,  4 Nov 2026 13:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E588606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LlYpn60K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793799327; x=1825335327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6VvQvS8yHC7ZYvx7BpzBaw+xd0bVq75tP+dfZH+tEUU=;
  b=LlYpn60KWP+HRSiunYDDs37Q3QZ0eG9HZkXPe1n+nkGSDxvi1g21QCq0
   mOnvdYBXdKT0iZ/CwLqFHrVwm4JnsLGY4W3kJslilIWf6NF20qy/BxB6j
   p8dIsyUXcHMJuZ4AJBzfag4riTj/DWkLqwH5iWxukDN6djW6o7Wj7Mm+U
   bl2V6Zoapi9B4Sonqk77zZrxNy7VkxPEsjdrTFe3OISJ/bUscv/jSrzXQ
   wJjZHMRYEwg6WPzryxaN4uIfTEDnFqcO6LMJBKOwBLpcJOGmpgYm/YpAY
   lJdK/iqCxgyOHlspzHyvaTUaLe1cU+UPWLfDJE7b9n1qDHhgcR4R3KrZC
   A==;
X-CSE-ConnectionGUID: CengWsgSSFaYut0KNM8zLQ==
X-CSE-MsgGUID: NSegXEIoSRujVXnaTqIDIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2460442"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2460442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 05:35:26 -0800
X-CSE-ConnectionGUID: T1C8mLIpSUKvYrW72HHCOQ==
X-CSE-MsgGUID: EMU1ZmYdROakGetFActrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7060961"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 05:35:24 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7B664121BB0;
	Wed, 04 Nov 2026 15:35:33 +0200 (EET)
Date: Wed, 4 Nov 2026 15:35:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: intel/ipu6: fix EOF sequence logging in
 ipu6_isys_isr_one()
Message-ID: <aus0pXClb3bGAV_7@kekkonen.localdomain>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
 <20261103211031.1573726-12-valerii.sokolov@pm.me>
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
In-Reply-To: <20261103211031.1573726-12-valerii.sokolov@pm.me>

Hi Valerii,

On Tue, Nov 03, 2026 at 09:11:21PM +0000, Valerii Sokolov wrote:
> When handling IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF in ipu6_isys_isr_one(),
> stream->seq[stream->seq_index] is populated with the current sequence
> (atomic_read(&stream->sequence) - 1) and stream->seq_index is immediately
> advanced to the next ring buffer slot.
> 
> Subsequently, when IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF arrives, logging
> stream->seq[stream->seq_index].sequence reads the next slot in the ring
> buffer rather than the slot written at SOF (logging a stale sequence
> number from IPU6_ISYS_MAX_PARALLEL_SOF - 1 frames ago, or 0 on the first
> frame).
> 
> Read atomic_read(&stream->sequence) - 1 directly so the EOF debug message
> logs the current frame sequence number matching SOF.
> 
> Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
> Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
> Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> index 5d95fb9234..ad08506b32 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> @@ -651,7 +651,7 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  		dev_dbg(&adev->auxdev.dev,
>  			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
>  			resp->stream_handle,
> -			stream->seq[stream->seq_index].sequence, ts);
> +			atomic_read(&stream->sequence) - 1, ts);

Except for this one.

The IPU firmware works based on timestamps and you could obtain the
sequence based on the timestamp but I don't think it's worth it here. I'd
just omit printing the sequence number which is unreliable.

>  		break;
>  	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
>  		break;

-- 
Regards,

Sakari Ailus
