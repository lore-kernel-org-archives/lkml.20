Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020863;
	b=GK6Rtw6h5DwjxX1lR2OZqbpsGFDLyFI/LpzlYqxizrEAIr6eYWpSuxRbghQLEEz3EGoZ
	 Rq4TWE88hGJdU0SlAqcQj27uIA3YdG8RTqONtDdGCfTtovnG9f0t8Rtnh+llvF5U41BIW
	 o0OF6AYuF/50QkxZUjyYgsPeYUWgYUvg3IXZgCpd3ZCyuUrWcB2P/Xi8BJwDLdo2YwH0X
	 hG4OPZdUJt+P8BOUck70zlV4sE4iTU2Ul+fFll8wcZDYFBVa4JzER6cFNksapHf/fzOuJ
	 U882PYGvwPJZiK8AGmIafoW5y2e1y+MyB9EQziufRuxidsCFNrxXE5XPiW0XBJyVv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=92zvWHSppKZKlbV2z8fjTOWLGPxOJ1h84oGpWcTlTa0=;
	b=ZW/XQ/x8j9wqEIBubWl54DHqWDcgkQXjXt0QmBmxw3IAWYHZJi+EUPwbYLCp+nMvCG1V
	 VSX4/v/0jeNv8Oj9VHln1pUFVtshToDdU3A2a2r4/P6X836S4EkvahR+CfSOnVVtG30Sl
	 LiuLpZxXT0UJX96oV6wLhfd4N16hb+WX13rprTCajKR1PECdOmj7QMl1OyFWt8yMu0YRw
	 YB0TiQi5rrnCB1lIAExhs9wOGTQJMq0Pb/AKfxuiACKtMW/vHrW+BNF+ar8gzsRHstPZC
	 RCCESMMU3AcpyGVVTDB/XW+EfqdU1qq/WR8L6YhFIzomotMSPes6Bhemb3Q9YadG+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyEsjetc;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3A606A321;
	Mon, 26 Oct 2026 13:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyEsjetc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793020863; x=1824556863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6UvNyOiSBy/+IxTQtW7UsyYTQPm1czeX/2xhznn6Gs=;
  b=UyEsjetcICm4VRhp4Iy0mgEtWZM8m3aPBH1YtqtuhRKkwn6KeyDMHX9y
   J/6FzDF6/pyFEEILyKNRITAnsB9qpQSfOp6jYT3GoEA+rqUcF9ryRxyjH
   HbN5VMId4Sx49slStSxzNrjohQtUmRFJbqT+aFZ9OZJKD47Z4sF/h6VlK
   903rbZTM7y4APxzMn22fCdFCCAKg1sL4XycYpvH8McnBnnGsaSvuzGwyC
   T7IXMzJSQxnIIJgXdHGyR1H0D5BqvApVeLnCb1Q8mys7FAnU4ZBWavbCe
   msBkyPhrcRlnum9KmacPxcftc4VkiICykQqIG55Lc9Hl5q0IIYuT7kfpt
   Q==;
X-CSE-ConnectionGUID: EswSfgT7SB6SOm2g60gakA==
X-CSE-MsgGUID: A7o+F5QfTXGtdzoeUGaJ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1717905"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1717905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:20:54 -0700
X-CSE-ConnectionGUID: Mw/j33mWQxywAcp5SRfSfw==
X-CSE-MsgGUID: w6K/vCLGRh2RTP9zxJha7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4652334"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 06:20:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 15ED699; Mon, 26 Oct 2026 14:20:51 +0100 (CET)
Date: Mon, 26 Oct 2026 14:20:51 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, neil.armstrong@linaro.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in
 DP-only modes
Message-ID: <at9Ts6lDS7yWuAMK@black.igk.intel.com>
References: <20261022165143.1327-1-26rote@gmail.com>
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
In-Reply-To: <20261022165143.1327-1-26rote@gmail.com>

On Fri, Oct 23, 2026 at 01:51:43AM +0900, Joonhoe Kim wrote:
> DisplayPort pin assignments C and E give all four SuperSpeed lanes to
> DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
> assignment and stays available. The FSA4480 sits on that pair, and in
> these modes the driver turns its USB switch off, so a USB 2.0 hub or
> device behind a DisplayPort sink is disconnected as soon as the
> DisplayPort mode is set.
> 
> Configure the USB switch the same way in all DisplayPort modes.
> 
> Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
> support) with a USB-C monitor in pin assignment C: its USB 2.0 hub was
> disconnected when the mux was set; with this change the hub and the
> keyboard behind it stay connected.
> 
>  drivers/usb/typec/mux/fsa4480.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index bea0c1deec94..e05ab3c10c81 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -93,16 +93,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
>  		sel = FSA4480_SEL_USB;
>  	} else if (fsa->svid) {
>  		switch (fsa->mode) {
> -		/* DP Only */
>  		case TYPEC_DP_STATE_C:
> -		case TYPEC_DP_STATE_E:
> -			enable |= FSA4480_ENABLE_SBU;
> -			if (reverse)
> -				sel = FSA4480_SEL_SBU_REVERSE;
> -			break;
> -
> -		/* DP + USB */
>  		case TYPEC_DP_STATE_D:
> +		case TYPEC_DP_STATE_E:
>  		case TYPEC_DP_STATE_F:
>  			enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_SBU;
>  			sel = FSA4480_SEL_USB;
> 
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> -- 
> 2.43.0

-- 
heikki
