Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27F470137;
	Mon, 14 Sep 2026 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391689; cv=none; b=ZcycLGNWAKFZd+rxx9PIprMFFJQH6kPOWOEQfd2fj9aG82JW84MLn4Cl8sCpDwDZnMDsLwuHeUBRI1ztkeHq0T02+iTydul6l7basjaW4UiQnpgzilpfgr2gmrTAx4Oah4iV10pkTbf0dIYWhUQK0IodnIVQYRwdkyITwFBJSew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391689; c=relaxed/simple;
	bh=BFRBA8DV2oP10cMJI4g3tsK+H2FtgVGWqvV8xiozWzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/cq0guR+xPUG+LX7ylVehaYmzHnqkTiL3eXxoX1BJwFJ7rlf6PoeG71SQSVpqsNSTDmHZFw+tijYn0pP+k6aHi13d5y2U6ZEM+yTFKJjkRmMoXkkNhnV9ITTL5nsN1ap5Zwvmh4riW/5TPzTSYyoQ4tXqW1htVnu0MRkCcAcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZ5/EOhg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZ5/EOhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789391688; x=1820927688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BFRBA8DV2oP10cMJI4g3tsK+H2FtgVGWqvV8xiozWzI=;
  b=PZ5/EOhgPBBkonfS9n5Oi/Uat/DNx6PEwlyiK31r28SCWdq+dmdONQ7Q
   7ucEKVKrGCMAz9oKYTro9hR66OvOTQd5N1ax3gvNubWslVs4b7HBeU0W0
   Sg/1T3k1v/qF1zHPvKUV9aoC8JANQqCxebcURmLxAJZlYSVjx42NcHBSz
   WCVevMRxEAMsT0msctl7u471DTWiEA+i9GERdEIJEwPECc7xndcLSJEFv
   2AiqnrLMQtgc3kN/Z0kUc7P2VErWoY6yufG1K+GgPk55Z+D0xdkuDWv7O
   omSOETH6AhQ20P0nVNewJI2vV+pQX81VY5hET7r+9Z09tuFyPjhEjbTyQ
   Q==;
X-CSE-ConnectionGUID: euKO1RGUQDeTPtTMkoQo+w==
X-CSE-MsgGUID: I5EL5rf4S4SWezAA5pjJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101093021"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="101093021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:14:48 -0700
X-CSE-ConnectionGUID: qeEX/YG0RQ+S1Rr1ef0yLA==
X-CSE-MsgGUID: SSlO6rYUSMaHwHjNU2/HQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276170656"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2026 06:14:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F233899; Mon, 14 Sep 2026 15:14:44 +0200 (CEST)
Date: Mon, 14 Sep 2026 15:14:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org
Subject: Re: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index
 fixup
Message-ID: <aqfzRPdG_bYemE6U@black.igk.intel.com>
References: <20260911193208.410015-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911193208.410015-1-jthies@google.com>

On Fri, Sep 11, 2026 at 07:32:08PM +0000, Jameson Thies wrote:
> Update ucsi_displayport_enter() to return invalid error when the PPM
> reports an current alternate mode greater than or equal to
> UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
> failed GET_CURRENT_CAM response.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Original patch didn't incorporate reviewer feedback. This is a fixup
> to be amended to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04cec690b1fd9d1c4c314b91a10d8c68a3acfe18
> 
>  drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 8d2032d0762c..572da7bbd29c 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
>  	if (ret < 0) {
>  		if (ucsi->version > 0x0100)
>  			goto err_unlock;
> -		cur = 0xff;
>  	}
>  
> -	if (cur < UCSI_MAX_ALTMODES) {
> -		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
> +	if (cur != 0xff) {
> +		if (cur < UCSI_MAX_ALTMODES)
> +			ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
> +		else
> +			ret = -EINVAL;
> +
>  		goto err_unlock;
>  	}
>  
> 
> base-commit: ed2050bc671b44b2c948dbd4347cc534d44ccc9f
> -- 
> 2.55.0.1007.g17ff1f9808-goog

-- 
heikki
