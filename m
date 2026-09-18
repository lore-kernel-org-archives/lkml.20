Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A4CE693;
	Fri, 18 Sep 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726186; cv=none; b=LOE/XkWyIWPDJ4F5ZZWE/XJLwE9qrTxLJZk2rDuZMtkGjAlNI3cVmSxgwTgt8RHFim5UimGa9nOru1StkuT3n19Y67AH1agOgm4yZ36A733u/TqKUJ28LlgnxHWZPnBkhoQRiTxu2QPkhl6IjuPjQ6or6XyI4zwNDlnKVFy7DE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726186; c=relaxed/simple;
	bh=xnzew9psuZcf5yZ5+8AMSSlsltDwTJFC7fNIWXINm6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOjEGStActtNHafJXaNMccMtLw/ao7mkBymRAjGHmAzznDo1+dOyPFsW9X6yMDHWUtv6rZxrs+LKrXBq2Wrw0Spo1Jxqf5Nlt2seSVYZMb1icXMCYTV/GRUgEXtKmyeYiOD7V6MCdsfGvcaGjN3hN03F4/K+IXKX8T1wTkgZQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMvpoeLV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMvpoeLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789726184; x=1821262184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnzew9psuZcf5yZ5+8AMSSlsltDwTJFC7fNIWXINm6o=;
  b=XMvpoeLVLPS5uQDTRfGL+YFN+5duH//BCnw7GtrNrSkfDEi+cEhJmQcT
   KDA+xZV90D8H9E+4dHPG+J9wwtVnXPWbUPwLeDEgV8tClfEQ0AoW30Lre
   NkyjLq8JX5lOxc7kQHt4T3DkMK41pAYI6eq+4zUKxKqC/XP1NFLdFRs7b
   E6XC0eVgt4MIKGF3ZhtHNEQ/AQEOdweYFRO/1xlhBYIQwKqvLhiydwEyi
   qVkHNrlRhZSoAVgsee49/xp7hq/toUUuH6u8VtZSeMntBk2DsrhrDbMdU
   45j0NteTvRgT1yBRFdCUOx6Q1yO2XnTDDjaLKCxPVsimezJlr0huzdbKF
   Q==;
X-CSE-ConnectionGUID: T/l0vS4ETIqC1n6jYTXiHQ==
X-CSE-MsgGUID: 0bqB/aeYTyOw27s7Lm+jZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115754970"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115754970"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:09:43 -0700
X-CSE-ConnectionGUID: Es40qkYbRMGG2I3cjXjt/Q==
X-CSE-MsgGUID: ofVW37FJTTuq6aw3Upgfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279557599"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:09:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5C960121BB0;
	Fri, 18 Sep 2026 13:09:38 +0300 (EEST)
Date: Fri, 18 Sep 2026 13:09:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hermes.wu@ite.com.tw
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/21] media: i2c: it6625: decode detected timings via
 typed register structs
Message-ID: <aq0N4gsslj5WGVUs@kekkonen.localdomain>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-13-78d72d7886a5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-13-78d72d7886a5@ite.com.tw>

Hi Hermes,

Thank you for the patches.

On Fri, Sep 18, 2026 at 04:57:28PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> it6625_get_detected_timings() manually assembled each 16-bit field from
> raw byte-buffer offsets with a shift-and-add sequence. Define two local
> structs of __be16 fields matching the contiguous REG_H_ACTIVE_1..
> REG_V_ACTIVE_0 and REG_H_FP_1..REG_V_BP_0 register layouts, read
> directly into them, and decode each field with be16_to_cpu(). Guard
> each struct's size with static_assert() against the expected register
> range width.
> 
> Every member is 2 bytes wide and naturally aligned, so the struct is
> laid out with no padding -- this is safe because the struct is the I2C
> read target itself, not a cast over a pre-existing raw buffer.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/media/i2c/it6625.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 60c79a2277941621c7aa83189244b706a5505d66..90b87dbf54fcfc7ad2a1245d4594beee24a193ca 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
> @@ -769,10 +769,22 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
>  				       struct v4l2_dv_timings *timings)
>  {
>  	struct v4l2_bt_timings *bt = &timings->bt;
> +	struct {
> +		__be16 h_active;
> +		__be16 v_active;
> +	} active;
> +	struct {
> +		__be16 hfrontporch;
> +		__be16 hsync;
> +		__be16 hbackporch;
> +		__be16 vfrontporch;
> +		__be16 vsync;
> +		__be16 vbackporch;
> +	} porch;

The driver accesses many such register areas, I'd define these separate
from the functions that use them. This isn't the only one case.

Alternatively you could define each register separately, which is what most
drivers do, albeit the usage pattern in this driver is a bit atypical so I
think using structs for this indeed could make sense.

>  	int val;
> -	unsigned int width, height;
> -	u8 buffer[4];
> -	u8 buffer2[12];
> +
> +	static_assert(sizeof(active) == 4);
> +	static_assert(sizeof(porch) == 12);
>  
>  	if (no_signal(it6625)) {
>  		dev_err(it6625->dev, "no signal detected");
> @@ -792,24 +804,21 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
>  	bt->interlaced = val & B_INTERLACE ?
>  			 V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
>  
> -	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, buffer, 4) < 0)
> +	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, (u8 *)&active, sizeof(active)) < 0)
>  		return -EIO;
>  
> -	width = ((buffer[0] & 0xff) << 8) + buffer[1];
> -	height = ((buffer[2] & 0xff) << 8) + buffer[3];
> -
> -	bt->width = width;
> -	bt->height = height;
> +	bt->width = be16_to_cpu(active.h_active);
> +	bt->height = be16_to_cpu(active.v_active);
>  
> -	if (it6625_read_bytes(it6625, REG_H_FP_1, buffer2, 12) < 0)
> +	if (it6625_read_bytes(it6625, REG_H_FP_1, (u8 *)&porch, sizeof(porch)) < 0)
>  		return -EIO;
>  
> -	bt->hfrontporch = ((buffer2[0] & 0xff) << 8) + buffer2[1];
> -	bt->hsync = ((buffer2[2] & 0xff) << 8) + buffer2[3];
> -	bt->hbackporch = ((buffer2[4] & 0xff) << 8) + buffer2[5];
> -	bt->vfrontporch = ((buffer2[6] & 0xff) << 8) + buffer2[7];
> -	bt->vsync = ((buffer2[8] & 0xff) << 8) + buffer2[9];
> -	bt->vbackporch = ((buffer2[10] & 0xff) << 8) + buffer2[11];
> +	bt->hfrontporch = be16_to_cpu(porch.hfrontporch);
> +	bt->hsync = be16_to_cpu(porch.hsync);
> +	bt->hbackporch = be16_to_cpu(porch.hbackporch);
> +	bt->vfrontporch = be16_to_cpu(porch.vfrontporch);
> +	bt->vsync = be16_to_cpu(porch.vsync);
> +	bt->vbackporch = be16_to_cpu(porch.vbackporch);
>  
>  	bt->pixelclock = it6625_get_pclk(it6625);
>  	if (bt->interlaced == V4L2_DV_INTERLACED) {
> 

-- 
Kind regards,

Sakari Ailus
