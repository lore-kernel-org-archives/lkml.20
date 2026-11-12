Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484113;
	b=DIFiSxpUg4xDnfBXxyei2c/0c5hbdNECgfovTyB0IN3SydLK1CmW3Kj58bCFw1Ou34W3
	 T52l1xaTSQt2aY3tI++x8grEhwEnB9OZB6XVC4LnNPRcqT61X0hXf9DjaBUuaPvkIb0la
	 3aP7k4/SoNy/p+oS6O1f/F9R9ZyReqty/RK6/95jeL0GOb9Xi+IpvTYuYMbslKv3fvPQf
	 FACyZLyn9JTxHhxJk0ugrqEBoeW4D7t5HJHy5TSZYNYL9q6ei0QYa15SPx/sqCnujp6MB
	 RRKHpYUpwhAmRRoMey9NbRSNAQH621svSqeUjOhcZRp/D714vIc4n1+06BdibAHURQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=VZVy7urDQoMi7AYb2OHBUHBw0zowY4SSLp8uc9mcuW0=;
	b=O69izBO5SUZoRTDm6AlPFAVVAgge+TpH+C4eoY1WnPWzY0IloJN22/G/PCMos2bmW5rj
	 vcWAku6yUUnGpGT+3CRk60p8SLbMA3iUuUewXQqpKLLt2lf9+hSD2NAwHZKI7IL10kk40
	 Rsc/U4tOOfrbt8CuwmMTqjP9G1frdnc/EUnhJYf/wLTD+ByIT2KJwaq7VWi7KJOsr5alY
	 3svofaZgvewbyxso8MH4bbI/o/xotRDxf85asa8sI6s5lyaWAhGQxPKduMYk2yhME5QQO
	 nrjWihNWDD5DXUHM0Ny5+F5No8y2dQQp1PjjOL4GRW95aAUZPG8CgBsuNeSvVBsVScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYNPE4VD;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CAD606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYNPE4VD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794484113; x=1826020113;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vo27qnizSaWoeng/wgI+cUcoe+VkKt4vRpNAtaN69Pw=;
  b=AYNPE4VDSA5x1RNq5ne9No37aMF0ASG3Jai7NNLlIRRNAY8cuprLLFHL
   3+j/4Jn6Ix35qy6VglHqspkD7JW0qYz9+qKu8BPxxfUBRkasZy+0tMTLP
   YUMr8deFsSG2piUxK22xVrQ3JjV0xqpGG1D0AsLzcuUrzy5C7uPojupw5
   YhQqc/tUDcXFXjMT+2fB2ShSboAzOBjPHKI9qupqfyWgjARMFg0KTYOAw
   KDa6J1YwKkq4mvXHxsUA4+oxCEcvdPSzB+Y2CM0iaiT5T95AFQ8CqtM08
   j+ARmDLpZ0fB1EBpb5364LUd+7EZR3qOwxMu1RgV1/7REGhdD6PnO2cvK
   A==;
X-CSE-ConnectionGUID: GAbygwvqQ0mQJenfBcTeeg==
X-CSE-MsgGUID: PttKuqquQpeii4sX3wIOKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3185860"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3185860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:48:32 -0800
X-CSE-ConnectionGUID: +UP8GAYDQJynOakSbn4Hew==
X-CSE-MsgGUID: xSrzvlxZQFKkvS49/NzKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8526038"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:48:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Arun
 Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH] drm/debugfs: Accept "reset" with a trailing newline in
 edid_override
In-Reply-To: <20261112-drm-debugfs-edid-reset-v1-1-4cd19d83cd22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261112-drm-debugfs-edid-reset-v1-1-4cd19d83cd22@gmail.com>
Date: Thu, 12 Nov 2026 13:48:26 +0200
Message-ID: <eead642a87b1916414972dd346a4be9195020541@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 12 Nov 2026, Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Writing "reset" to a connector's edid_override debugfs file removes the
> override, but only when exactly those five bytes are written. The
> obvious
>
>   echo reset > /sys/kernel/debug/dri/0/HDMI-A-1/edid_override
>
> writes "reset\n", which is handed to drm_edid_override_set() as an EDID
> and rejected with -EINVAL, leaving the override in place. A test
> harness that cleared its override this way kept running on the
> overridden EDID until the next reboot.
>
> Accept a single trailing newline as well. An EDID is at least 128
> bytes, so a six-byte "reset\n" can't be a valid override.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Found and tested on an Orange Pi 5 (RK3588S), with this change on a 7.3
> based kernel: with the HDMI connector's own EDID written to
> edid_override, "echo reset > edid_override" succeeds and edid_override
> reads back empty, and "printf reset" (no newline) still succeeds. On
> drm-misc-next the patch is build-tested only (arm64 and x86_64, W=1).
>
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit message, and I reviewed and tested it
> as described above.
> ---
>  drivers/gpu/drm/drm_debugfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index a72f9723d3a9..3c6290457fa3 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -569,7 +569,12 @@ static ssize_t edid_write(struct file *file, const char __user *ubuf,
>  	if (IS_ERR(buf))
>  		return PTR_ERR(buf);
>  
> -	if (len == 5 && !strncmp(buf, "reset", 5))
> +	/*
> +	 * An EDID is at least 128 bytes, so "reset" with the trailing newline
> +	 * that "echo reset" adds can't be mistaken for one.
> +	 */
> +	if ((len == 5 || (len == 6 && buf[5] == '\n')) &&
> +	    !strncmp(buf, "reset", 5))

Feels like a more robust option would be to allocate buf with
memdup_user_nul() and do a simple sysfs_streq() that handles newlines in
a generic fashion.

The corner case downside is that it'll also match "reset\0" followed by
a bunch of arbitrary data, but then an EDID like that wouldn't pass
anyway.

BR,
Jani.


>  		ret = drm_edid_override_reset(connector);
>  	else
>  		ret = drm_edid_override_set(connector, buf, len);
>
> ---
> base-commit: cb0a63f0c96e8ecb90199eeb99cc2a7fcfa703d4
> change-id: 20261110-drm-debugfs-edid-reset-0504a20c67d1
>
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

-- 
Jani Nikula, Intel
