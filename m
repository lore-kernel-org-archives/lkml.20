Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664388;
	b=gXfJn1Yg/0niIc6QrImtmBYKuDH8eCCtMnBYreepIz/Hf0WUUPQ502UtQsiNA5GWp2ZD
	 FuNJ2qFea0UexbMIe+D00pu4Rbe2Es6HSMW7/nx4nftziYi4CBYCoNAXsBk2tMMuNIzm7
	 Mdb9THn9uri4AQ2lPKFVomMmGBZqLIfoJEJoMVnpS2kLOLa7QzPqLtc7Cx8BTwoPVH1RH
	 6xsDueNsLA621c+RNW2X0fHAVjQULY7Y083Yr7fzckntJ8o9iHBnqfjH9Bw7raAV0LiM5
	 HA8hlj9gA+j6kETMjhMg6RDT0Kv1fIENSQT997kcYPIzOfduFUEVsN01+xB/6lQ8tUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=l7W4b9OM3w7aZUcPr3GA7zM7H5bAXzEKkvW6TiSrbHo=;
	b=UBqLXdimDmO6L0QmOgYM0/GFIDgR9QoYoyyrdLFLoQaZ8Y2Mf/WtixBRBjc9mg1/XWRU
	 CxEafdW73xEHrT+tM7bwcfH91clFBIirjzXTR2dbWK4RnYzk8f1KZ/eyxj40NOnpbWQbR
	 +Pr+BHsoiMgHz4kW/VEKXQmfJAnssShhXLAZvOo5Ika+uMWxKgqGZFfeXpdrrbw6hObZ7
	 0Kpi/BifevlexQXr+ZZNsqHPbJ6YwkNe7EYtkbYDiHSi5t/6syTFXFwsStPI6Aapo1xMP
	 FZk+Z2jS5lbMJ2JzFHKfTGTLx71VbMCm2mAqClfoi6IUxcAUttmEtIGD+IQMnW1A8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="C/xXpXjP";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A33606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A33606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C/xXpXjP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792664387; x=1824200387;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RSuwUQ0sXYuLEUIHlbVE3xx4xHsDdpGiUAb7E6nsLzM=;
  b=C/xXpXjP49Gm31lpzmf/NPWVJsE8I5y3sRAt+z1MgRpla2N/evrE9ORf
   bkPYpoHYhLBJwufHpU8cjyi93uNHt+Lj5rjGXpV69wqFyQDzaESOq/RJb
   DOT7GejTDRQCwaHLL+8IxgHcxRPUFWr2smnp0AgmZEpVSHmS7e1Bk0jeQ
   nWuTMmLtNYNW70uNDYKAUvC7uiLBqur50/0RL78Fi7PqOpnAUCt5CI8uC
   ubXgdtr5/9vdeBbMyEVURCymOh0yX9ziwjruxmRetAVfpY3j7TinfCSqP
   2VhwHj3sFrx+ILDpO5sOphge88fHUoMMlk6XzZXVvBq7XHJuWUYj0wxSl
   g==;
X-CSE-ConnectionGUID: 6KS36AKMQJKl/nUeJmtoLw==
X-CSE-MsgGUID: CpaDhyEGR6S0Do6kM7168g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1297538"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1297538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:19:46 -0700
X-CSE-ConnectionGUID: Po4/K/vPS3upp4GXM+E7mA==
X-CSE-MsgGUID: +gr6xd94RoOsUQDt+MDnEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3274138"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.253])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:19:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 22 Oct 2026 13:19:39 +0300 (EEST)
To: Navon John Lukose <navonjohnlukose@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Lee Jones <lee@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, mfd@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mfd: intel-lpss: Set d3hot_delay to 0
In-Reply-To: <20261022040453.45797-1-navonjohnlukose@gmail.com>
Message-ID: <42bbb588-8750-0985-4daf-57608cb09c46@linux.intel.com>
References: <20261022040453.45797-1-navonjohnlukose@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Oct 2026, Navon John Lukose wrote:

> intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> LPSS controller still sleeps the default 10 ms d3hot_delay in
> pci_power_up().
> 
> The PCI spec asks for those 10 ms on D3hot->D0. Mika pointed out that the

Please include the surname too. Since you'll have the email address in 
Mika's tag that's probably enough (otherwise you should include the email 
as well).

> LPSS controllers are not really PCI-connected devices, so the delay is
> likely not needed. quirk_remove_d3hot_delay() drops it on several older
> Intel chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
> 
> Nothing misbehaves with the delay in place, so this only shortens resume.
> On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the touchpad's I2C controller
> autosuspends after 1 s idle, and the first report afterwards waits for the
> resume. With d3hot_delay set to 0 the i2c-hid interrupt handler for that
> report takes 1.1-1.9 ms instead of 12.6-14.4 ms, with no I2C errors. Only
> Arrow Lake-H was tested.

I don't like how this changelog is structured.

You should make it clear at the beginning that there's some delay 
(introducing the problem you're trying to address early) even if 
everything "works" with the delay and that the delay is due to default 10 
ms D3hot->D0 wait.

And only then proceed with in depth explanation about the delay and why 
it's not needed.

-- 
 i.

> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
> 
> Notes:
>     Changes since RFC:
>     - Drop RFC and add the review discussion to the changelog (Andy).
>     
>     RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose@gmail.com
> 
>  drivers/mfd/intel-lpss-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
> index 63a3fb58566..5672f033e5c 100644
> --- a/drivers/mfd/intel-lpss-pci.c
> +++ b/drivers/mfd/intel-lpss-pci.c
> @@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
>  		info->quirks = quirk_pci_info->driver_data;
>  
>  	pdev->d3cold_delay = 0;
> +	pdev->d3hot_delay = 0;
>  
>  	/* Probably it is enough to set this for iDMA capable devices only */
>  	pci_set_master(pdev);
> 
