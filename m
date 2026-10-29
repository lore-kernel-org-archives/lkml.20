Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282573;
	b=wFw4UcrpTceEBH6BB92rFZ3ZY/W63Jdx8LBnYQV2BYXGTamlhRfSjYgOb2ZqR0qOYi3M
	 UbVx/BUWHfuwfCa8BxD1bISLdc07T5VSl/H82A1+3wU9esiL8svS5gfESTGC3hf4cW8Do
	 ra/gS5/DP2VPKXBr3sOXt1FFub5Wpf+rVvHJl3XsIraLshfVLKyjbHfl8U2Hwbx4O5KhG
	 EhzZr50NZPh6TaS7y9lZ0Zvt9lCV5/0jXvaccF0Zmw6rrqotq35XEKQ5GFqpjA1IsE5FG
	 qiyH8xnNGjl0ga5FBMW9S7khUYyCVOrghS0kHxW3g6NnC80EaQ6Hfu0gxx9kIjq2+hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282573;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZLGAVMj8edgpTxrXyIpRaEv+HUauO5qynVoClba6by8=;
	b=W7YUaWPPIaeMz418Vdi2Ly4fmSMEchUb1Dkascj3nXgQzDgj+si8x9dnweBzYfPYj0Y9
	 2RuoJVLvAWbBHudKmzZQhrNt9V5skQFBqc14biS6Y5cd1MbRtPxpKJH0vIMiSd2lYHrke
	 6x/Gb6Di1ZUoVBGkMif2osZJX/EVZKuTf9Jm+n/3FFk/UnVIH01VJl1JjHnhuYiVhtRsC
	 x8U2MB3TimxNQ0A370KtRK4MjT2ntJT0Lq0nbufA8dECQYZYpiIy1Wf7l+byuL3eTcdMk
	 BEkNlvfD8LJPfcuZ2Sa39nBm7mAITAh98U/N1qYtxS2qr6CIqCMX+xEnSgi42Ey3XOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Im+KZbvB;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68309606A31E;
	Thu, 29 Oct 2026 14:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68309606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Im+KZbvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793282573; x=1824818573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5SbZqE3VE1sXZHKUnpwViBY2Le886Gx4mvn/rVtwso=;
  b=Im+KZbvBlXJGXnoTrkWSehkhvnkRu1RWm584upl1r8aHSbhq6O8iKbU1
   kPMatiI7c9dDjXeMzWxttJQ1JcJhu3JAaQnkQLksyyn50TxcHN8670/6Y
   cxO04DEOz0bl7t1BRqq96IWQbSSwPeZNJflWuy5jKtpySMS4c8MvTLbue
   XKyXUugavjdCP4i43PO+7Hw3ue06s4EdeiqXRavG27BJ1pwuuROb4z6tO
   jKSxWdL2Iv4lL4J0AAVlr+McJakZ72iglCArVCAiV0ScNtscfeNtYOgKy
   y+HrzjzjsnufuTxEIOFO9gcg4kaIo/4zS/Gb3RpLFwVW2Uunu79/chxvi
   A==;
X-CSE-ConnectionGUID: P5g4DsBSRpuQezvNtLvjRg==
X-CSE-MsgGUID: 45NgsUmlSx6six0zooTgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908102"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:02:52 -0700
X-CSE-ConnectionGUID: 6ccZibXWQsWOZy6jYQDlcA==
X-CSE-MsgGUID: 0rnN32oITYqBf+1yqo2CeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5700869"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:02:50 -0700
Date: Thu, 29 Oct 2026 16:02:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, hansg@kernel.org, dan.scally@ideasonboard.com,
	djrscally@gmail.com, dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] media: i2c: ov7251: Use sub-device active state
Message-ID: <auNSB_yCjo8KVGJF@ashevche-desk.local>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
 <20261028112154.855185-6-antoine.pichot@gmail.com>
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
In-Reply-To: <20261028112154.855185-6-antoine.pichot@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 28, 2026 at 08:21:50PM +0900, Antoine Pichot wrote:
> Port the ov7251 driver to the sub-device active state.
> 
> The driver kept its own copies of the active format and crop rectangle
> and selected between them and the try state with a pair of helpers
> switching on the format's "which" field. Move the format and the crop
> rectangle to the sub-device state for both the try and the active case,
> drop the helpers and the private copies, and use the v4l2_subdev_get_fmt
> helper for get_fmt. The init_state operation now fills whichever state
> it is given through set_fmt, so the explicit ov7251_init_state() call at
> the end of probe goes away; the exposure control gets the default mode's
> range at creation instead of being adjusted by that call.
> 
> The driver mutex went away with it. The control handler's own lock now
> serves as the state lock as well, so the control framework and the
> sub-device core serialise the pad operations, the control operations
> and the stream start between them; s_stream takes the active state lock
> itself. The mode pointer, which the frame interval operations still
> select by frame rate, stays and is protected by the same lock.
> 
> Behaviour is unchanged for applications. As a side effect the core now
> reports V4L2_SUBDEV_FL_HAS_EVENTS for the sub-device and handles control
> event subscription, so v4l2-compliance's VIDIOC_(UN)SUBSCRIBE_EVENT test
> passes without the driver having to declare the event operations.

...

> -	mutex_lock(&ov7251->lock);
> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
>  
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(ov7251->dev);
>  		if (ret) {
> -			mutex_unlock(&ov7251->lock);
> +			v4l2_subdev_unlock_state(state);
>  			return ret;
>  		}

>  		pm_runtime_put(ov7251->dev);
>  	}
>  
> -	mutex_unlock(&ov7251->lock);
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  
>  err_power_down:
>  	pm_runtime_put(ov7251->dev);
> -	mutex_unlock(&ov7251->lock);
> +	v4l2_subdev_unlock_state(state);
>  	return ret;

I'm wondering if v4l2 provides the set of conditional guards and hence some
kind of ACQUIRE() macro.

-- 
With Best Regards,
Andy Shevchenko


