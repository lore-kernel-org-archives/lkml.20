Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021813;
	b=LCQvTewjnqVZk38sJ+KNatWylKkNg0+qOQLDV5UROB48z8mB30tYCXAypIW3saYOQTdl
	 /svGXnZaIaeY0SuuIoeqkdTzllBYF/gWU9aKQUdL9znBXKFCidkSuSOzBqgIYTv7MgAo2
	 P7yOEjGAe9DuMoGAFrmBLZu2gPzrlKMQ3wnBbRSTfDdiGd1pL678nj3XRgZfK48h4P3Nm
	 QpH2wWo7CVti8Mbbp3JQL+f8Cc3ZxyAJWu9MU7Zv7sOjCAQ9H78rlB2O2XiFG/L0u7JbX
	 GwbcqSym0kZWCE79R6fdJDYo8QVBImjGnsxPsrcEGhkJjfu0sUlIoMhKQLvm5J1jtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021813;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Vz/DBzNIf5iajVdC7eq0Iu8LOtrCCoU7Cy9zGHs3nEw=;
	b=UpGqFhFs0wEkur+dJOs+QpNZO1d4fP1GXAceM2MXx8IFn+CI1DEhKjjnSR/BtF7XrkLH
	 /Zmi4cX6ir7+JMr+LRvXJ6Uds1+ACTRz99DKeISbYJxbAUbR/1lNDqIqQ4cl1vdn2gY1f
	 XJiA/TSmSoHVDQ5AhJEVJS2YWhfA6D+tGLopBUDMCmFFxw+OEz31M3gB25z8VW/byO9F0
	 Z1pimP4bLD+VV5FkT6UqCqZ1LuojPoxSAIpOC/SWZQcP7aFDnz2FJtyMj7he+bRafcBg0
	 /EDP7IdE5wQtJtKRp4eCHM0J0dxctAjYdoXRqVoz8WGn6soxT1i8CwsO9odWY7hjfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ApO/gF84";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F0606A31A;
	Mon, 26 Oct 2026 13:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ApO/gF84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793021814; x=1824557814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gZzfuu3dJymOL/xW1scaMwA3JcdtpAzOVlR3uF+YWAE=;
  b=ApO/gF84vcc/o8bm0s9u7w/GWiqWCiIF8Oq9u53Kk6d8QrSyolE/WWBa
   83Em9ZsVrTBWd66XHVybNF8IUnvBs2gKXtYiVzbmEtY/gaepDMYn9vRwT
   TU/Mxm7OAzvTCNEohuYTYgzwjZLgNxwlcgI0gg3nxqaAKpcQy9J/pYq6h
   imY0eEWEYA8SeOMMNVs23TnkCAHAD46RF1Y9LuTC08CszDnxhz3HPMXIZ
   FY4FajnfdUP8ReoBaQJ54FTPVnxUgEa8JJrhgcXDXxC875Wkd2Em+pNm3
   X/8jg4sdaUFgiF/iNtHIu8apvRxCqRq4ALYNol0B/HSESWQAAghJ5cIml
   A==;
X-CSE-ConnectionGUID: J9gvBgOrSdGeNIsKOvUkjw==
X-CSE-MsgGUID: EBwuwHaZRXKlMTqun4Rt+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1719371"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1719371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:36:53 -0700
X-CSE-ConnectionGUID: lMv8VEU8Qrqa1KgiH1wJ3w==
X-CSE-MsgGUID: PSkhzGGiSl2TNq4p1HQ5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4655416"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 06:36:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7B4E199; Mon, 26 Oct 2026 14:36:49 +0100 (CET)
Date: Mon, 26 Oct 2026 14:36:49 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ali Ahmet =?utf-8?B?TWVtacWf?= <aliamemis@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhu M <madhu.m@intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: debugfs: Fix GET commands on UCSI < 2.0
Message-ID: <at9XcSnYtFvxf1H5@black.igk.intel.com>
References: <20261024174441.878903-1-aliamemis@disroot.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261024174441.878903-1-aliamemis@disroot.org>

On Sat, Oct 24, 2026 at 08:44:41PM +0300, Ali Ahmet Memiş wrote:
> Since the debugfs response buffer grew to 24 bytes, every GET command
> fails with -EINVAL on UCSI < 2.0, where the data length is limited to 16
> bytes. Clamp the length to UCSI_MAX_DATA_LENGTH().
> 
> Fixes: d9dc19910321 ("usb: typec: ucsi: Fix debugfs response truncation beyond 16 bytes")
> Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/debugfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index 77a0dd75edd3..3cffd3778c67 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -60,7 +60,8 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_GET_LPM_PPM_INFO:
>  		ret = ucsi_send_command(ucsi, val,
>  					&ucsi->debugfs->response,
> -					sizeof(ucsi->debugfs->response));
> +					min(sizeof(ucsi->debugfs->response),
> +					    UCSI_MAX_DATA_LENGTH(ucsi)));
>  		break;
>  	default:
>  		ret = -EOPNOTSUPP;
> -- 
> 2.55.0

-- 
heikki
