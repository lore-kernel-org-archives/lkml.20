Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A81526A84;
	Tue,  8 Sep 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866057; cv=none; b=DpUBXiPCg81cMHDuSZBXCLrwdhO1lbp9d2a9QVd9/hj+slU2jrtSL+5b9pa+D9CSKGb8a/CcOsBPz+aCP9aSUeTn9eg0MgFpVh/IUe9wMFDHJalAYg6iQSq3anUk3vOSatKuPzGGc/BshYSSzxplRIjzYnl62Rc4tDE3Rp2evkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866057; c=relaxed/simple;
	bh=xGoIe/NeHzhwCF7D/ZgE5eeSfjdWOuYshvLObJf5hfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsEkKaeUqJWqKUafAUN6jsnxlxvdeJD/YUPhllvQtuMSv5UfZ3yUx849uP/tr1dIFBnVTHHwAqjrecrkZCLyZL7sBrBCOp/j3YUtLZwz6nToxsUXHpix8gxpiOnWeDsWXzu7NvHFtQOpeSk2u2bbBF0SLCgmpj2119pe5pHlthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh4bkDw+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh4bkDw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788866052; x=1820402052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGoIe/NeHzhwCF7D/ZgE5eeSfjdWOuYshvLObJf5hfo=;
  b=jh4bkDw+iyJfQzC5xsMZrrd0EjqIhK3vopJGXnsyde2pzLDT5iKUm2E9
   rVoz5MwoJygpC0A9SWkwgOI1qNQ383e0tirjy+cQGi37h3hpbsJQADCbo
   9NTawEyEkNJJeFUUcaoTpDVK/I/PEPgVYWy+NzACPjppdkuxY2IiojNVY
   lF5BXZctTjeOVBIlo4UzEPJYp5NBk2rFEXYIdbvcERuwmYtjOfKKeTnNJ
   HbKvaps193v+VwnEDciEgMz0mJYVwXY455cf2nIQshJU56vhHgZp2qGDE
   0498DaiKN8CnaU7oqzeBcxJqc38H11LfV2tk/CsqKzfA5+IQlPaNG+Tc8
   g==;
X-CSE-ConnectionGUID: 3CF0vkzjT62FOTb/UuUqdQ==
X-CSE-MsgGUID: mRMPnTdZS86ZhgFZF2fEpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76825101"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76825101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:14:07 -0700
X-CSE-ConnectionGUID: JzJho5jyTJuDqqQ/GjRhPg==
X-CSE-MsgGUID: ZK37vcV7TUGTEz4txHIBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="294444862"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:14:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F133811F7F5;
	Tue, 08 Sep 2026 14:14:07 +0300 (EEST)
Date: Tue, 8 Sep 2026 14:14:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Message-ID: <ap_t_x0D5moBWJz5@kekkonen.localdomain>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>

Hi Wenmeng,

On Tue, Sep 01, 2026 at 03:40:05PM +0800, Wenmeng Liu wrote:
> OG0VE1B is a monochrome sensor and cannot produce coloured test
> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
> Rename it to "Standard Test Bar" to match the OG0VA1B naming.

I guess the test pattern generator is still the same (or similar) even if
the colour filter on the sensor isn't what you'd expect of e.g. a Bayer
sensor. You you call it standard, however, I think you should define what
that standard is. We're not limited to datasheet naming here.

> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/og0ve1b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>  
>  static const char * const og0ve1b_test_pattern_menu[] = {
>  	"Disabled",
> -	"Vertical Colour Bars",
> +	"Standard Test Bar",
>  };
>  
>  static const char * const og0ve1b_supply_names[] = {
> 

-- 
Regards,

Sakari Ailus
