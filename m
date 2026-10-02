Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC8353A6D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964452; cv=none; b=TB3y77ekTiMSQJhhqfgQ7wnSaqbuBzUw1Wb9W45d290JJf+Z4IVETgzLioLH142oRu5cIKBuAGUA1yoNheZE4rdXhBbL/VpFOctmnwYF+OGlHrLizWBIDGqCk6qOzg/TH0aGICqqtSq+lqP2cHKChsE7fZok4+7aZmAo6P7ydbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964452; c=relaxed/simple;
	bh=XFig6Nzk/qay+yzXKRTTHOWA4sYlWhCCmfJYk7q06r8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMv8mlSn6MH5jcsX4zwBEJHWA8U/A+1kZLr97wyLNwaPm7n1lKQf6tD5t3Od8/pK3rmkgDsfF2t3RpwxaUhpCHYPjERM+eyCD2CDEi61zrgMk3d4msTHdcsDJuNVp3iC77n9FFnwO5xRuxM5tlyMiqLlAW2o91JNYjP7tmb05NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmMI3/Bm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmMI3/Bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790964444; x=1822500444;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XFig6Nzk/qay+yzXKRTTHOWA4sYlWhCCmfJYk7q06r8=;
  b=WmMI3/BmKW0ay3y5n5oez5j+GaNptm4Lc3kZRQC1FMV5qCi1xh7GkUZb
   5GwyHEeTIXJ5fSRYdJEBsu98PMfaKsFWfJQp34zBn6TY2UAEziGCXPOwL
   k9MHyg4lDNyB8RpsVWPEGk1hzYzl4Rv4HOw87TbIOtzIRc7r2LqAGQnTm
   wdzfcGZnuh1egT/5SNwFGUd7vQsTngZMpTnQVznTAP9QAG353japCiPh6
   5jOKD75Lct6oPkCJ7OMCooc3xTqFHazftZRcNScIiNKYK7nzIZgah26n6
   8yx5LNU7bjM/O0tXIjTqyfVWHxCe/wDeCV+84LEpNdVHd0sbA6Kx8fruu
   g==;
X-CSE-ConnectionGUID: FweD0Co6ThCPuZvXxDOZaQ==
X-CSE-MsgGUID: RiKFXuTdS1KmsQbFGMCPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90591909"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90591909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 11:07:17 -0700
X-CSE-ConnectionGUID: U8Kpr0tRSUuQcz9T1aisDQ==
X-CSE-MsgGUID: NTgZ+SUoRsOJt2pKpLXQAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284363493"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.108.45]) ([10.125.108.45])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 11:07:16 -0700
Message-ID: <82cdbae9-0009-4286-9ca0-5f83100bf07d@intel.com>
Date: Fri, 2 Oct 2026 11:07:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libnvdimm: Handle negative return from
 nvdimm_clear_poison() in nsio_rw_bytes()
To: Serhat Kumral <serhatkumral1@gmail.com>, djbw@kernel.org
Cc: vishal.l.verma@intel.com, alison.schofield@intel.com, iweiny@kernel.org,
 nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org, error27@gmail.com
References: <20261002165641.14479-1-serhatkumral1@gmail.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261002165641.14479-1-serhatkumral1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/2/26 9:56 AM, Serhat Kumral wrote:
> When nvdimm_clear_poison() fails, it returns a negative error code.
> However, 'cleared' is a signed long while 'size' is size_t.
> The comparison 'cleared < size' promotes 'cleared' to an unsigned long.
> So the error condition can be bypassed and the function can
> incorrectly return success if the subsequent flush succeeds.
> 
> Explicitly check for negative error codes before comparing with 'size'.
> 
> Fixes: 868f036fee4b ("libnvdimm: fix mishandled nvdimm_clear_poison() return value")
> Assisted-by: LLM
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/90d3d353-28e9-4f6d-b141-a9b7157d5514@moroto.mountain/
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>

Makes sense
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/nvdimm/claim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 309cd2cddb0e..2725dceaf938 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -263,7 +263,7 @@ static int nsio_rw_bytes(struct nd_namespace_common *ndns,
>  			might_sleep();
>  			cleared = nvdimm_clear_poison(&ndns->dev,
>  					nsio->res.start + offset, size);
> -			if (cleared < size)
> +			if (cleared < 0 || cleared < size)
>  				rc = -EIO;
>  			if (cleared > 0 && cleared / 512) {
>  				cleared /= 512;

