Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350138;
	b=x7+7OAnpx0uRTXinVUpAd+jiAhukYrGCP5XYEijRIAVc8PYb67+CFazA+ZVyBXw1fVgh
	 2povMCXvfaBvw7h+plOHrG+igFlHc1hS4uWUjXtGby4ZGgv84YFJGyF5o91SsS8mRQxMc
	 /ZhP1W2o5RmGqnk+S2iTM+j/cIHtCVIQmh4IadEN5DxuxqpR9iSktSF3DSTUrX0SHk80H
	 HS0XnY4coWlRfJYLg249wWg3TWbJvB+v5I+ceQoy8iTBKtDqcaH2GFu53XUs0smMrYLY0
	 G6HcsxN8elOWYyfn1C3zNnF/w7iOfFBjCYfyVNw6D9LtZPAsHNyP+C/orVf+LiqRJ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350138;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=beajLhwN9CSsow59nJHWmE9Zgynru7ufzr34F18gXYA=;
	b=gbA294pwHL8i8dBsiQ++x1peISRk8kyDAApJ6LP9VZr4XBdHri3IZJv80IFf3YxK24w+
	 kOCgjv6nuR261yRueJ9XGK4Nq7raAQw1MKQgjfoe3h5fFKJWoTKHTbHZ5V5bBhce9a1PH
	 LDZdXnEhvUOADqQm3Jv01OnFqMCqREHp6fmUS8KvagJsEftbGTKradYtN0c3TsH35fTk9
	 wxIWVh6h7GVktkGBBDN3jDtaV3e65H00cE6z743etu4+qOfyoQ89Ge6TLGnLyG1Z4gGlR
	 s+wC4aUaWWa+b4GqBdXQljIrdj7FKwgbjBiLytv52ZmSTLLuNScdw2jSeMIWk2VWeFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XouvUJkv;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47830606A31F;
	Fri, 30 Oct 2026 08:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47830606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XouvUJkv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350138; x=1824886138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pp2u62TqO8sxtCU4vUBVQ9y/ebXI4VwDVRUtwi24cCE=;
  b=XouvUJkvhSCfdyu/qvCOxNxR1innkubVQ3HduIUq/9dIiuInPK89PXLC
   iRWwX5t23STFOsuzkZO/Ie0ZnBCLxbf+bhAMc5I5cjX8pFbECLaBWlaIt
   CO1kz+UFIdWciDPZBmtHn6hM9e19fpsxzBVvO3VMo9JTiTpIWAt/J4Wxb
   5/TKBe6+ih9hnPGYIUG8sathPKhFZ3T7pXfXWq8vkmwHqGprvGTQH5SPt
   xOGrH4NSWiyQp3o3PrszYO1b6JJCdk898JInSStp3yG1k0qlDmU+UdkuH
   Us5V3EEsR1EvXYv5ovmlaLJstFPKWbl6/mhfPiJqEswWca/EOVhR483ho
   Q==;
X-CSE-ConnectionGUID: asPwSAm6TM6adc4xwqNbDw==
X-CSE-MsgGUID: JetgwPCYShiQeixQukR6KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2123150"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2123150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:48:58 -0700
X-CSE-ConnectionGUID: /NkdBB7hTVKoteKXAmZV+g==
X-CSE-MsgGUID: viDSKn0rS4+qJWHrqsN2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5265516"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 01:48:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2DA6199; Fri, 30 Oct 2026 09:48:54 +0100 (CET)
Date: Fri, 30 Oct 2026 09:48:54 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Message-ID: <20261030084854.GQ158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261030082539.1208733-3-chunfeng.yun@mediatek.com>

On Fri, Oct 30, 2026 at 04:25:37PM +0800, Chunfeng Yun wrote:
> There is a dedicated wakeup irq on nvidia n1/n2 SoCs.

Okay but why it is needed? Can you add this to the commit message?

And why you did not add it already in the first commit that added the
platform driver there anyway?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/plat.c  | 16 ++++++++++++++++
>  include/linux/thunderbolt.h |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> index 85a00cd391d4..8d83b484d942 100644
> --- a/drivers/thunderbolt/plat.c
> +++ b/drivers/thunderbolt/plat.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/slab.h>
>  
>  #include "nhi.h"
> @@ -46,6 +47,15 @@ static int nhi_plat_init_irq(struct tb_nhi *nhi)
>  	if (ret)
>  		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
>  
> +	if (nhi->wake_irq) {
> +		ret = dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq);
> +		if (ret) {
> +			dev_err_probe(nhi->dev, ret, "set wake irq %d failed\n", nhi->wake_irq);
> +			return ret;
> +		}
> +		dev_info(nhi->dev, "wake irq %d\n", nhi->wake_irq);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -53,6 +63,7 @@ static void nhi_plat_exit(struct tb_nhi *nhi)
>  {
>  	devm_free_irq(nhi->dev, nhi->irq, nhi);
>  	flush_work(&nhi->interrupt_work);
> +	dev_pm_clear_wake_irq(nhi->dev);
>  
>  	pm_runtime_put_noidle(nhi->dev);
>  	pm_runtime_disable(nhi->dev);
> @@ -85,6 +96,11 @@ static int nhi_plat_probe(struct platform_device *pdev)
>  	if (nhi->irq < 0)
>  		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
>  
> +	/* ignore error */
> +	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
> +	if (nhi->wake_irq < 0)
> +		nhi->wake_irq = 0;
> +
>  	return nhi_probe(nhi);
>  }
>  
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 212c8fea6571..06b90d452ee2 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -533,6 +533,7 @@ struct tb_nhi {
>  	bool going_away;
>  	bool iommu_dma_protection;
>  	int irq;
> +	int wake_irq;
>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.43.0
