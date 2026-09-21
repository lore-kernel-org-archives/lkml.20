Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4D47B439
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987399; cv=none; b=PZBepBnFAKzsXbM0ov0w8gEQQGWWlaLIkItzBhN/WEcE7XETDhUzmIEPhJYlCUDyHCJx+uTctga/ZlGCI/cA40Zd7TR1ENqyLbAtOE2U8zCF+YkUGK70qTb6WT4xFh2BG/rOG4OABJFbxy+MQhsQ6b+nemnuOb+7/vNvqVh8rps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987399; c=relaxed/simple;
	bh=HrgUTYm+rQYlaefjTDnzVgQ/IOugymTnai8JLExScwo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s79Izdlc0h6ysLl+Tro+/RFdFXLUoeq2TtRhZrzrYyDbl1xKxs6JyL+ms4fMdeKQUKyRTB+XNg3wuPSlv3TMpN/uFQq+6daCyXjxUtS82vuaGsXnBOtRHSuX+mh3PUkRcJEYpRZjmoUiCIP/td8c8Q24jHeisw7sr+qfqZ46u5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkFc3WrE; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkFc3WrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789987395; x=1821523395;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=HrgUTYm+rQYlaefjTDnzVgQ/IOugymTnai8JLExScwo=;
  b=SkFc3WrECGyXN1/mrImH/OT/YZtYU+cc/uyRJIN2Lk6DuMJWlIBtCQ9i
   CYPGR+5jxdO61Xocd8vR/LnsLiZ8elGYWogMYA0xdMU4Cs1OAvKKo9z7T
   WYXHpL10wvNKItkYXdNoFgUw5H8vTffi2ReX3RqdMcG0tOgNAGhls5P8V
   MBlj9qLTffjEyU+QsyBQc/uuqYrCyu0pmxpJG33vV6STcQvcgFl2HJ/7P
   epbs4GyKhrDxBJrsDP8fQcdE7UeIFWsj+almLMPNaqNuedc3v39pkAbYq
   CiJP5Q0TSaxi8YIgFyrB8knuudC9sUPsbBopc4/uOnQ4ipZY57J4VAzBr
   Q==;
X-CSE-ConnectionGUID: hC/m4kXjRga1hOF4QfLmKg==
X-CSE-MsgGUID: GsO6h3HZQJSUYPDviDijLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="995469"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="995469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 03:43:14 -0700
X-CSE-ConnectionGUID: znoIhxjORJWJFEc2a2LaUQ==
X-CSE-MsgGUID: 8ojwJ6voTL2BfIN5PbF4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="272759840"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.180])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 03:43:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hui Peng <benquike@gmail.com>, airlied@redhat.com, sean@poorly.run,
 tzimmermann@suse.de, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/udl: reject short USB EDID control transfers and
 fix URB init cleanup
In-Reply-To: <20260919223511.3889061-1-benquike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260919223511.3889061-1-benquike@gmail.com>
Date: Mon, 21 Sep 2026 13:43:09 +0300
Message-ID: <e53ce901a913d9b660d682d8206a2167770c02b4@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 19 Sep 2026, Hui Peng <benquike@gmail.com> wrote:
> In drivers/gpu/drm/udl/ (udl_drv.c, udl_edid.c), check that
> usb_control_msg() returns the full 2-byte response in
> udl_read_edid_block() before copying read_buff[1], and clean up
> allocated URBs if udl_Driver initialization fails.

One change per patch please.

>
> Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 1922988625eb..239a6983f49f 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -97,8 +97,10 @@ static int udl_usb_probe(struct usb_interface *interface,
>  		return PTR_ERR(udl);
>  
>  	r = drm_dev_register(&udl->drm, 0);
> -	if (r)
> +	if (r) {
> +		udl_drop_usb(udl);
>  		return r;
> +	}
>  
>  	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
>  
> diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
> index af4cff2a7c51..b7c462436573 100644
> --- a/drivers/gpu/drm/udl/udl_edid.c
> +++ b/drivers/gpu/drm/udl/udl_edid.c
> @@ -36,7 +36,7 @@ static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t l
>  		if (ret < 0) {
>  			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
>  			goto err_drm_dev_exit;
> -		} else if (ret < 1) {
> +		} else if (ret != 2) {
>  			ret = -EIO;
>  			drm_err(dev, "Read EDID byte %zu failed\n", i);
>  			goto err_drm_dev_exit;

-- 
Jani Nikula, Intel
