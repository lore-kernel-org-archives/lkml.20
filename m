Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3588849A3DC;
	Fri, 18 Sep 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725943; cv=none; b=Pj3B3Xa6yeRC5NnX1IBdr1NRqTadEUkrgkHc6ezHfWcZwEldF1b0+DAu02396byxq7Tv1MeAJZCV9xML8KxIR9n+DKCaukh0c/l32MplII2QlUaUoxUP7KVfE4imYe7/Gf5K1lJl1yr2PBQqcfRa64OXJ68rpdas70A45/LowVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725943; c=relaxed/simple;
	bh=Mjp+xa61NuVqwvKfqePopOpjMUq9XwOAEKjkGjEy+Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4l5r1eg5eVdtHdS3zyB12InEc0+tvTLf7nTwJwXtvP3c46vxdLtcMz+SMBx1ZF7o+0Db0TC6lRXGF1pEUzU3uqvGF1rrkEGSp2MVXCJOzxqsST3hPuC12hsN2WAchJ2T26bBpYpauQ3i/dBo2eRr9YawBkcXVGR1aJrLNSwYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1hTH1y1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1hTH1y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789725940; x=1821261940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mjp+xa61NuVqwvKfqePopOpjMUq9XwOAEKjkGjEy+Gc=;
  b=m1hTH1y1It2A4EBVBJ2C7CsnSvRHPa46UYTWUYBglYz1XrKOdCKSROlw
   pQnSlqGFKVxT7GqYXikbu3MSWp0aS8KyHfj2PZwGeTl45taXvBK/UmZxS
   kKw/JSqQWLwvkkYBNfC/DuwGy13tAH3Kh8aZoBW4XeHe4ucdsDxSmzA4E
   M3fL6kjmzvafKQmZz0GTcqTVZB4uuGj8vnWaVHEQrs92jI/c2qB8KJBNE
   4fYBOKHAHFZc/F6GwlKZK0Xrto5qbL3FFEHUXDjBJE7MdXm7lZKe5EFnU
   RXmz0yBChDtZZb64o5Xu+ZrcDfbsmDZsHBmT8xk5u1KGoQOTSKnGuIgJo
   g==;
X-CSE-ConnectionGUID: A1I7gcpaR3W3O0majV5uXQ==
X-CSE-MsgGUID: mHU41NIrSEe6DldGwoZ/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115754550"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115754550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:05:37 -0700
X-CSE-ConnectionGUID: BjosQO+fRQ60FvxoKMu3IA==
X-CSE-MsgGUID: UyaU5ZU7TK+9eUIKAjxJOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279556047"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:05:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B42D121BB0;
	Fri, 18 Sep 2026 13:05:32 +0300 (EEST)
Date: Fri, 18 Sep 2026 13:05:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hermes.wu@ite.com.tw
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/21] media: i2c: it6625: propagate control-update errors
Message-ID: <aq0M7AO3k8Q8CFuo@kekkonen.localdomain>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-2-78d72d7886a5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-2-78d72d7886a5@ite.com.tw>

Hi Hermes,

On Fri, Sep 18, 2026 at 04:57:17PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> it6625_v4l2_sd_ctrl_update() discarded the return value of all three
> v4l2_ctrl_s_ctrl() calls it makes. Make it return int, run the updates
> sequentially, and return the first error; both call sites now check
> and log it.
> 
> None of the three controls has a driver .ops, so the only failure path
> in v4l2_ctrl_s_ctrl() is range validation, and every value this driver
> passes is always in range -- this is an error-handling correctness fix
> responsive to review, not a fix for an observed runtime failure.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/media/i2c/it6625.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index da17e5d5ce9e2dd1060abba1598b0e3f78857e9c..5d267676606e340ad0ee5ad2b78e5acb50a32980 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
> @@ -889,11 +889,19 @@ static int it6625_s_ctrl_audio_present(struct v4l2_subdev *sd)
>  				audio_present(it6625));
>  }
>  
> -static void it6625_v4l2_sd_ctrl_update(struct v4l2_subdev *sd)
> +static int it6625_v4l2_sd_ctrl_update(struct v4l2_subdev *sd)
>  {
> -	it6625_s_ctrl_detect_hdmi_5v(sd);
> -	it6625_s_ctrl_audio_sampling_rate(sd);
> -	it6625_s_ctrl_audio_present(sd);
> +	int ret;
> +
> +	ret = it6625_s_ctrl_detect_hdmi_5v(sd);
> +	if (ret)
> +		return ret;
> +
> +	ret = it6625_s_ctrl_audio_sampling_rate(sd);
> +	if (ret)
> +		return ret;
> +
> +	return it6625_s_ctrl_audio_present(sd);
>  }
>  
>  static void it6625_enable_stream_locked(struct it6625 *it6625, bool enable)
> @@ -1136,9 +1144,12 @@ static void it6625_clear_timings(struct it6625 *it6625)
>  static void it6625_irq_hdmi_5v_change(struct it6625 *it6625)
>  {
>  	struct v4l2_subdev *sd = &it6625->sd;
> +	int ret;
>  
>  	it6625_clear_timings(it6625);
> -	it6625_v4l2_sd_ctrl_update(sd);
> +	ret = it6625_v4l2_sd_ctrl_update(sd);
> +	if (ret)
> +		dev_err(it6625->dev, "%s: failed to update controls: %d", __func__, ret);
>  }
>  
>  static void it6625_irq_hdcp_change(struct it6625 *it6625)
> @@ -2297,7 +2308,9 @@ static int it6625_probe(struct i2c_client *client)
>  	it6625_debugfs_init(it6625, client);
>  
>  	it6625_initial_setup(it6625);

What if this fails?

> -	it6625_v4l2_sd_ctrl_update(sd);
> +	err = it6625_v4l2_sd_ctrl_update(sd);
> +	if (err)
> +		dev_err(it6625->dev, "%s: failed to update controls: %d", __func__, err);

Shouldn't you return an error in this case?

dev_err_probe() might be better here, too.

>  
>  	err = v4l2_async_register_subdev(sd);
>  	if (err < 0) {
> 

-- 
Regards,

Sakari Ailus
