Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020519;
	b=2BPU6UfYiAhqb+19Tcb6VRlFVJsgphrFw1e++/T7bD/pNXeTTucA/yErz2cnMz9qeB8W
	 ositQ6b7C4WzP6HM6bp5j/dMmBKl4rp3+3tiCrXY1CNmS9AWKt6mDxRau8nRmR9b2GwYh
	 WA+uRa4r1Oo1qW/yk6XbgR4fS+Z0rvhPAY4EWlctl6/n/JuBEouwFlwvoKoR16qSdooMc
	 8QS2nZ0qAhvhzI8Q5u2Tz2T7prwHewdn5eRFXfJhu4Em8tpkKf2zq+uoalO9bYOIU79oE
	 X+o3ImCa4vs6LzCxWlOfxGA07oJTwv5EtMTOtpaTW0p5MYysODgbirmDMRBwoCoD6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Cy4rxcI3ce6TYxyPahXPnRjErY3UMtGKV16tpWTXyE0=;
	b=dvSoADQ2FEsuF5I908yYDrGZxwOAeKtoJPyYwiAWPlTDwS5tm3z4hpaJjHFkal9nsfQ7
	 lxv77WzM0/CHL9xIvTyLhJl02EcO53bnqYg+cbEWvLASFzgnYtDK/CW/rTOSzH8d9TZlF
	 POqIUdFf1mjEuSMHnM/5Vqn37QZdk8Pwm3TUX/cSh4TX9XKO6uTNDrSmY/6VWcu+pp7YP
	 pqkwVUKne9uctJH1U6/c3O95vbYzMYseOaY56ptA3ML/IJryII7D0fys45MhkjCOm4Yrq
	 JWfbKiOqLQkTMAf0SHBxvAwCkMaM9/wdpVZSZg0R/ShJYIoRnd75HJtR7eV8P2vadLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0sUY5HH;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF607606A31B;
	Mon, 26 Oct 2026 13:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF607606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0sUY5HH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793020519; x=1824556519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/LGAg2OQl5w/RWFI88m5T3EUelTRryBw3WFdvToFLc=;
  b=d0sUY5HHl1XEe1eNMIPuKsi2TaBGK/q1mtujHzZiAZ+t5+JBeHTfILSM
   LdLkfTJysvJluFIjTn1F4kIYrUq655DwH86q5XD5IueJ/5jF3hve5nx/W
   agTWO9eNfF6BtOl5kRlolLRVSG+ym+bNv4DeLQvr5pD+tUcUG5D6gID7C
   c2icolQMTXnwnDXocXARJjY4BTVBueU2M7WfTWqR89FrKDWkD0bi2S9nl
   qC1oX+Gyr/NcCwYqzD0AacYZJSzl37E1z0bWs+/4TuJz84V4VyKTKtvDG
   C22HEafb2te01k7HOFuSNpGzxre92pUIlKMJ2NMbSo+4I3qCsT0/LkEs/
   w==;
X-CSE-ConnectionGUID: +O8EPGy/RbqOB8Xl3m01BQ==
X-CSE-MsgGUID: gmif1QHKTOaZw2YdmQXydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589843"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1589843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:15:18 -0700
X-CSE-ConnectionGUID: 79JJIpZrTNukNZhmbXQ0jA==
X-CSE-MsgGUID: 3Gv8fKKSSnOnYsIOVDl8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4137237"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2026 06:15:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8CFA999; Mon, 26 Oct 2026 14:15:14 +0100 (CET)
Date: Mon, 26 Oct 2026 14:15:14 +0100
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
Subject: Re: [PATCH v3 2/2] usb: typec: fsa4480: Report switch & mux events
 to codec
Message-ID: <at9SYmvQtGAYaYYn@black.igk.intel.com>
References: <20261020162101.1527014-1-val@packett.cool>
 <20261020162101.1527014-3-val@packett.cool>
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
In-Reply-To: <20261020162101.1527014-3-val@packett.cool>

On Tue, Oct 20, 2026 at 01:20:31PM -0300, Val Packett wrote:
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
> index bea0c1deec94..3c12d17a25a2 100644
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
> @@ -319,12 +347,24 @@ static int fsa4480_probe(struct i2c_client *client)
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
> @@ -333,6 +373,9 @@ static void fsa4480_remove(struct i2c_client *client)
>  
>  	typec_mux_unregister(fsa->mux);
>  	typec_switch_unregister(fsa->sw);
> +
> +	typec_mux_put(fsa->codec);
> +	typec_switch_put(fsa->codec_switch);
>  }
>  
>  static const struct i2c_device_id fsa4480_table[] = {
> -- 
> 2.55.0

-- 
heikki
