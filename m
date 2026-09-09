Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04755867E5;
	Wed,  9 Sep 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963798; cv=none; b=OAKe8COPx2l8XQguFZy99MYL62IMMVHWonnliqyIqGotdG6zcaoCYtKZ6YrszOBuZri0bSTK0nd69Y/OW+wdscudZIZeHXhMffBYjUBdI8j30k1/Mc/dwNuQOutiUPGffQ+G1cMU3bXDBOIvXcUZ6W3AjRkHrPwHm1bh6hUSESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963798; c=relaxed/simple;
	bh=oFj3LPGOh3YJeEBYfsHZEdVm+PKEWEMJnTwhuquIUwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edqjdark0mhIa8xx+QZIdzCYz4mpBfXynctFafTlOeT1GbXWjKocJ2qwj5Ui2683Nj4bRf3+BR9WrijOyY/DNrtaVOv/CPooQJ8GuZ1OsqukCxmzCciGEL/iwSLm3gqIXxGrUeI81HdiG5OHJnmxTiCljjXjDET8BsKlo8bVuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJqvscfV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJqvscfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788963796; x=1820499796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oFj3LPGOh3YJeEBYfsHZEdVm+PKEWEMJnTwhuquIUwo=;
  b=SJqvscfVwnuTW1fnSxdq0wLWxbsripY5Ompcqmji2OWzKyjh1WIAxm0z
   LcstSUUnJ1xxfBwdHAvPx/eT7NB6UrhqDKVdbEafJzZpn5pT4Ul30QlP9
   9H6vHzwVN1ctCNn+jya1rRbavFnoWavW4x0rmQVdSCUVggYmMSV1Lnjt0
   aU7Z8olRZPnLjGKzZ4fe9GQE/i6clkvUtldl2EUBrAYgJc11j7jJDis5E
   i/5bu6iHT6mgD04DFrrmkw4FJkNayVRDefx+1CDuviKn2mlI8+AtR1VFJ
   km+zxBZyanTw1zAouJ/pCSOSRzs5cNlAOx4e81gV3SXoUZ5jj9VMueDxo
   g==;
X-CSE-ConnectionGUID: IsonrbN4RvawGHc80fYtvA==
X-CSE-MsgGUID: pQyqX+xFS2u3UjmtacikKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99987029"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99987029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:23:16 -0700
X-CSE-ConnectionGUID: eby6Ed5rThypWRRduF6EQQ==
X-CSE-MsgGUID: DnVMhwm5SOyKs9V4wJVftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="270850516"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 07:23:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0B13C99; Wed, 09 Sep 2026 16:23:14 +0200 (CEST)
Date: Wed, 9 Sep 2026 16:23:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: anx7411 - stop the IRQ before destroying
 the workqueue
Message-ID: <aqFr0gC4b3mn1pbP@black.igk.intel.com>
References: <20260903082254.1540271-1-gonglinkai@kylinos.cn>
 <20260908060333.4097219-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908060333.4097219-1-gonglinkai@kylinos.cn>

On Tue, Sep 08, 2026 at 02:03:33PM +0800, Linkai Gong wrote:
> The IRQ is devm-managed, so it can still queue plat->work while
> remove() is tearing the queue down. Disable it first.
> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")

Not for stable?

> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
> v2:
> - keep the minimal remove() race fix; drop the workqueue later if wanted

I don't see any difference compared to v1?

thanks,

>  drivers/usb/typec/anx7411.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 41df115912b9..c3d36da692e4 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1566,8 +1566,11 @@ static void anx7411_i2c_remove(struct i2c_client *client)
>  	anx7411_partner_unregister_altmode(plat);
>  	anx7411_unregister_partner(plat);
>  
> -	if (plat->workqueue)
> +	if (plat->workqueue) {
> +		disable_irq(plat->intp_irq);
> +		cancel_work_sync(&plat->work);
>  		destroy_workqueue(plat->workqueue);
> +	}
>  
>  	i2c_unregister_device(plat->spi_client);
>  
> -- 
> 2.25.1

-- 
heikki
