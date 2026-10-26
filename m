Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012953;
	b=OZeBGE1lQG7Oz838YTSg7nUN0lnUYFhvp34ZRfC24dzXRx3eAlwkPyWVAGrhlYQP1KoF
	 vm2ud9cnC1w+vg6W5cvHD5CbWKE9GeLie1oP68QgH19hMnwzAbxOhkDouTrQHIPrYQHF7
	 TVjZcCVLwghvrxLTtQjTcOJuQ7JGCutDsS3oYMFKKAXbIChEnqWmFVwzBCbQc7FmUefdC
	 V5qB3ZC3R09xJgqgfbeISipridXeMMCa1Dpd8lVjX6FZU+b4KdzdJuk944O+OkLluHMZ9
	 ojeIqYdX3Ua6sDx+HGWCptMVHF3SxAl9FuCmjQ0clEoq0r76q0MfTApq8T/mUxuYN8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8NovCQH940na+gosyoo7UWT5zfsY+yv5JWNQkZbmeL0=;
	b=o4+vtXaOLCKBQglOHTODPc5Si6cVY60z54FY2HtnLjkewClucnBZfHXBnvBERTjJBjSS
	 w0VhF0rxfM1Z+vJ5chPy57OqAkwj2g3BES6mRWJkuYDqlgp52P0poFR/pT4mS741ltOvG
	 d1ABQV+amdHpjrW1tpWxJlRDCbVMiWBOT7bff9eXdkNp9vvrSpqJsHPJiU4qQOH9IwFi/
	 Ak7MCLjcDj3+HgLBOhh9DEKiWuGIxTToWAXRHt5QC3+64OA9/WT+1yKDrOmpnC5/ZJm7D
	 s1+cl5lFWyQB3juRMXyJozCA9aqAo6gXKScRW/UYiJC6M3J9JNznIXOlD8q0qehD36A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CIIbWtkh;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66013606A31A;
	Mon, 26 Oct 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66013606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CIIbWtkh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793012953; x=1824548953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlcDPbq8YL7OdWQu9xDbnnlqJLjzqxo74xBBo/QFseQ=;
  b=CIIbWtkh9W1ZlA5E/XRxWLd/Lwxg5OmHHnuaRXqzjP0kIUhGpnPaLowy
   yAXqF4iRl8NHbTeE2SnAcpu4WgLrB3MaTOKz4U+ZIKcuBarJV/gAgofa4
   N3WKUHBZ6Lxdh1A/C1CRxBv/+pfECwYYS4a4T7+FPsCJPBN4lJ9wHhfAG
   GX0BzAhEAhTRhCN3PCHPfZP6/Xj1i4lGWxawdCwHpfPJavWixJ3CRpn11
   3MYjkjOyURlHCK4VoS0IsE38/rhOOeaMLtxff8OJK9g57wuiObHGBSlIf
   ZrkTC7EpZ05D5J4/PDppoKaMVRoe/svQUxjmCvJH3HGN9/fzsw0ak1KJd
   A==;
X-CSE-ConnectionGUID: Lkr2tMdPQqWtonOz8NfV5A==
X-CSE-MsgGUID: pLokmp6/TDSBkQq8F3z1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1567230"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1567230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:09:12 -0700
X-CSE-ConnectionGUID: Pji25Z/gSYWakq1dFtDIMA==
X-CSE-MsgGUID: twf3KC97TzuRlYmB1RWPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4637081"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2026 04:09:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F178A99; Mon, 26 Oct 2026 12:09:07 +0100 (CET)
Date: Mon, 26 Oct 2026 12:09:07 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: fsa4480: Report switch & mux events
 to codec
Message-ID: <at800xHh8lvwsi-8@black.igk.intel.com>
References: <20261020081343.1507986-1-val@packett.cool>
 <20261020081343.1507986-3-val@packett.cool>
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
In-Reply-To: <20261020081343.1507986-3-val@packett.cool>

On Tue, Oct 20, 2026 at 05:12:54AM -0300, Val Packett wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> In the Type-C graph, the FSA4480 switch is in between the USB-C connector
> and the audio codec, but the audio codec also needs to receive the
> switch and mux events from the FSA4480.
> 
> Update the driver to get an Type-C mux on the next endpoint and
> broadcast the recevied mux & switch state to it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> [val: enable the SENSE/MIC bits; put the refs in fsa4480_remove]
> Signed-off-by: Val Packett <val@packett.cool>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/fsa4480.c | 57 +++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index bea0c1deec94..93faa81d0879 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -60,6 +60,9 @@ struct fsa4480 {
>  
>  	struct regmap *regmap;
>  
> +	struct typec_mux *codec;
> +	struct typec_switch *codec_switch;
> +
>  	enum typec_orientation orientation;
>  	unsigned long mode;
>  	unsigned int svid;
> @@ -115,7 +118,8 @@ static int fsa4480_set(struct fsa4480 *fsa)
>  		}
>  	} else if (fsa->mode == TYPEC_MODE_AUDIO) {
>  		/* Audio Accessory Mode, setup to auto Jack Detection */
> -		enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_AGND;
> +		enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_AGND |
> +			 FSA4480_ENABLE_SENSE | FSA4480_ENABLE_MIC;
>  	} else
>  		return -EOPNOTSUPP;
>  
> @@ -162,7 +166,11 @@ static int fsa4480_switch_set(struct typec_switch_dev *sw,
>  
>  	mutex_unlock(&fsa->lock);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	/* Report orientation to codec after switch has been done */
> +	return typec_switch_set(fsa->codec_switch, orientation);
>  }
>  
>  static int fsa4480_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> @@ -185,7 +193,11 @@ static int fsa4480_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *st
>  
>  	mutex_unlock(&fsa->lock);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	/* Report event to codec after switch has been done */
> +	return typec_mux_set(fsa->codec, state);
>  }
>  
>  enum {
> @@ -287,6 +299,19 @@ static int fsa4480_probe(struct i2c_client *client)
>  		FIELD_GET(FSA4480_DEVICE_ID_REV_ID, val),
>  		FIELD_GET(FSA4480_DEVICE_ID_VENDOR_ID, val));
>  
> +	/* Get Codec's MUX & Switch devices */
> +	fsa->codec = fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(fsa->codec))
> +		return dev_err_probe(dev, PTR_ERR(fsa->codec),
> +				     "failed to acquire codec mode-switch\n");
> +
> +	fsa->codec_switch = fwnode_typec_switch_get(dev->fwnode);
> +	if (IS_ERR(fsa->codec_switch)) {
> +		ret = dev_err_probe(dev, PTR_ERR(fsa->codec_switch),
> +				    "failed to acquire codec orientation-switch\n");
> +		goto err_put_mux;
> +	}
> +
>  	/* Safe mode */
>  	fsa->cur_enable = FSA4480_ENABLE_DEVICE | FSA4480_ENABLE_USB;
>  	fsa->mode = TYPEC_STATE_SAFE;
> @@ -310,8 +335,11 @@ static int fsa4480_probe(struct i2c_client *client)
>  	sw_desc.set = fsa4480_switch_set;
>  
>  	fsa->sw = typec_switch_register(dev, &sw_desc);
> -	if (IS_ERR(fsa->sw))
> -		return dev_err_probe(dev, PTR_ERR(fsa->sw), "failed to register typec switch\n");
> +	if (IS_ERR(fsa->sw)) {
> +		ret = dev_err_probe(dev, PTR_ERR(fsa->sw),
> +				    "failed to register typec switch\n");
> +		goto err_put_switch;
> +	}
>  
>  	mux_desc.drvdata = fsa;
>  	mux_desc.fwnode = dev_fwnode(dev);
> @@ -319,18 +347,33 @@ static int fsa4480_probe(struct i2c_client *client)
>  
>  	fsa->mux = typec_mux_register(dev, &mux_desc);
>  	if (IS_ERR(fsa->mux)) {
> -		typec_switch_unregister(fsa->sw);
> -		return dev_err_probe(dev, PTR_ERR(fsa->mux), "failed to register typec mux\n");
> +		ret = dev_err_probe(dev, PTR_ERR(fsa->mux),
> +				    "failed to register typec mux\n");
> +		goto err_unregister_switch;
>  	}
>  
>  	i2c_set_clientdata(client, fsa);
>  	return 0;
> +
> +err_unregister_switch:
> +	typec_switch_unregister(fsa->sw);
> +
> +err_put_switch:
> +	typec_switch_put(fsa->codec_switch);
> +
> +err_put_mux:
> +	typec_mux_put(fsa->codec);
> +
> +	return ret;
>  }
>  
>  static void fsa4480_remove(struct i2c_client *client)
>  {
>  	struct fsa4480 *fsa = i2c_get_clientdata(client);
>  
> +	typec_mux_put(fsa->codec);
> +	typec_switch_put(fsa->codec_switch);
> +
>  	typec_mux_unregister(fsa->mux);
>  	typec_switch_unregister(fsa->sw);
>  }
> -- 
> 2.55.0

-- 
heikki
