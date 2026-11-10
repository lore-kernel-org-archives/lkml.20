Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306203;
	b=hWvuIwjLaT9EONEItbhG87QZP+J3d/loLdeWv17CkZp6vFjBapO6fQ+leqUSI2PQgYba
	 K9Ax3E1Gp7XbRcso0rS3wRLANN0bVmvz1H97bEgbdSHDpj4NTB3A6j3Z2GUfgdR0jKzj7
	 G6lrZha6clF/mHLm+bGlToyDwk75LvEyCJFJfW1AyENkF+4bdhpiO932+U5AlwkIvoa3U
	 RFumgrP/BqyHwrjp26Ed+5vvpl8DImycJOPw0pP3/+dMSYx36OZSJyxFUI76A8o9/JJxB
	 z91+jZA0AqCfMtYC8ETh5TP0QW2ApTW0vEuXXtIhgcS+rpy2sNvKsVnyP5WmcGX7mQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306203;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4Z0jCGvHX7DYTMHYJJkZX4Syiq7dm23F/7eJvYhL9hA=;
	b=F5dcIxJ6aq+q3r0aGMA7gbEkukdP/ptUDtu3OSwacoA0bz9PY/BqKtvRY1x8qun5YUZO
	 M8wCVhCF8fuiMa1PcGrxM3I2psBSZdACheLte4mz/sBR+lBcENC+hfrnZCVDbn1HajR/l
	 sVAMPKaI4/6bGwX+6W97ovVKXtKwL2ZPiX+VzfPSiDlrReXfUJ1zd5H39vEOg9kfGZGVQ
	 aLZ0dlqmc/MYn5+vw8paw3joehRM719qd37ea8XYxvVfF4/enQ4RJWcMMne6gMqFuEFtS
	 BPxTuKAQt96pVDKMbQOrVbItZZH6eP6Mj9ylVpdxWFX0IRZZ/mYIlKM+MRQJuIvEO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a6Mfbo73;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627E606A330;
	Tue, 10 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D627E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a6Mfbo73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794306202; x=1825842202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wjszt7vM3bw02fZ3cs7BjKTSZKJ0qHoKwjXdiaPJRyI=;
  b=a6Mfbo73+SrM3sHiDwcDI0oxsil3Nlx7SCNXYP3I6fYQSfnduqBmAgoJ
   vqfsvcgtvY2wZcKGMFcQWzfst6xp9vlCsfuwVXUc5FahzmmHnLH2tsf+j
   1whNY2yqnjHiw+ONzJ+em1GbANlfKq8ofmUbYfeU2E8AWC+FOqMesgHQU
   unvcpHZ+3p/+RB9DaBM1NJ00oP2HTmyPyel5inqrMmWjxMEDOaa77oUBq
   1BS0pHO9wiCFXfWj7f7k6WiVJ9Bq9D478fU6ZRmb4ZjO/PJLaPg1HeZYJ
   VrnT9NsyR3zUSh01h3h/pHM1zAm0fW1+7nUinFg7XiqhIuxRfbcGgSCjy
   Q==;
X-CSE-ConnectionGUID: eccd8BY8SZa3LFclk4bP7Q==
X-CSE-MsgGUID: 6ZvqUCJvT0O6NcMe9BvH9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2947232"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2947232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:23:21 -0800
X-CSE-ConnectionGUID: d1DTb5iFQ/SQSrBs5v72qg==
X-CSE-MsgGUID: WQBGl42RT7Ohb2uQR2e6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8263477"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:23:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 201A0121B7B;
	Tue, 10 Nov 2026 12:23:18 +0200 (EET)
Date: Tue, 10 Nov 2026 12:23:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: bingbu.cao@intel.com, antti.laakso@linux.intel.com, mchehab@kernel.org,
	hansg@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Don't stop or close a stream that failed to
 start
Message-ID: <avLwlhbOg-9EJo7g@kekkonen.localdomain>
References: <20261106121905.42571-1-j@metarealtyinc.ca>
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
In-Reply-To: <20261106121905.42571-1-j@metarealtyinc.ca>

Hi Jake,

Please be careful with git send-email arguments in the future.

On Fri, Nov 06, 2026 at 07:19:05AM -0500, Jake Steinman wrote:
> When ipu6_isys_start_stream_firmware() fails, the firmware stream is
> either not open or has already been closed by its own error path. Since
> commit eb68e9f1c6eb ("media: ipu6: Bridge the gap between streams in
> V4L2 and IPU6 firmware"), the err_requeue_buffers label in
> ipu6_isys_csi2_enable_streams() falls through to
> err_stop_stream_firmware, so the driver then sends STREAM_STOP and
> STREAM_CLOSE for that stream as well. Each of those waits for a
> response that never comes.
> 
> On Panther Lake (IPU7.5) I have seen this after the firmware rejected a
> stream start: stop and close both timed out, a later stream open timed
> out too, and the ISYS needed a power cycle before anything could stream
> again.
> 

I wonder if any firmware communication failure, a timeout or other error
should trigger the IPU reset (once the users are gone). The functions
communicating with the firmware should also probably check that condition.
I just sent a PR on IPU reset changes, they probably don't address this
problem though.

> Requeue the buffers and go straight to freeing the stream on this path.
> The CSI-2 receiver error path still stops and closes the stream, which
> is open there.
> 
> Fixes: eb68e9f1c6eb ("media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 1525454..ed4e4f6 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -678,8 +678,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
>  	}
>  
>  	ret = ipu6_isys_start_stream_firmware(stream, &bl, &desc);
> -	if (ret)
> -		goto err_requeue_buffers;
> +	if (ret) {
> +		/* The firmware has no open stream to stop or close here. */
> +		ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
> +		goto err_free_stream_firmware;
> +	}
>  
>  	if (!csi2->streaming_vc) {
>  		ret = (IS_IPU7(isp) || IS_IPU8(isp)) ?
> @@ -704,7 +707,6 @@ err_stop_stream_csi2:
>  	else
>  		ipu6_isys_csi2_stream_disable(csi2);
>  
> -err_requeue_buffers:
>  	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
>  
>  err_stop_stream_firmware:

-- 
Regards,

Sakari Ailus
