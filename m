Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968492;
	b=JB8ZuB1AqTFfncqPhcDlIC6V/IjaQYMbMOF9UpH2kTBqkl6XyizrCpQSAkIq8bOc5GlY
	 4p20KjIzZ8NBc81KnzOczRgNvx8B8hr0WDBZkTR1fL9fsq/gnP04DMIhopjtDuJdReB1r
	 b5EfboM7hw4s4ot27ob0eyGSq+z+nwwa5npaRIRwi4O7bucKZtRAkndON63I0cm66CJ2o
	 +AAiGwVHzIf4XtE6oCF/bCLImnEVWnDA+gYoKCAMEDgLPfmSEUW9LCUXXU3xd00SV2NeU
	 4oeWbBo8VGcKkbJ3RXDP6ubo0u7cFDPYmDVpJPkePZTcHjocSSuFMS1Rtjctx1QxItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968492;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=z416bufXKzdg8JB7Xmf8YPRGG2ESN/fDx9Tznr98+0w=;
	b=5LzlPuCTDwyZKtfpWf2lxQISv70qOXKzdi3h/KCBRs5dlGgO9T2djTkWznMxioyODxem
	 RpYMVnh+2uBhG5WihwU6kIsMR5lYNzJ0H+CJoqWGtXWsYrEw8utLnYyZ/dT7w7GSqooHg
	 vWFYXFEakAeZghfMvB81QwlUZgJOTX4q0N7TLsJTp+Uz45lSNwihl5sDpwfjkIpRXNYpg
	 EWn7AE41tPFte7OIVoD/Lj4bcLMsVGmBncyfus7nITJ0rmtEdnp5vl5X56LN99hQ7GPnm
	 ecIJP8J2RU+DpLKVL5LjntZsxGV5IAmm+WcgD87UQxk78DvjYswgvQoSJiWtGq4RFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hx/jZiIz";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F789606A32C;
	Fri,  6 Nov 2026 12:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F789606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hx/jZiIz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793968491; x=1825504491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y4tSWaw8r345vuGM/DHjXQVhzbLVsgzIMcpOn/BiIg=;
  b=hx/jZiIzrLP75H9tejS9Z3in0Q5uhUfCfBW02gHqQYmUVg56moc69G4f
   K/rGNwvLn5nugVCZVvTqmHj0EbR8s6qzKCuKEGI6xCfW5uHjh/wHCThK3
   Aazhwgr2YAmUClcuX6jG2tT/9xtw3wAz6QCibkXa9lB0c5hg4mCPCgcIP
   4pn5T70kFGi1Nn8L9QaFIs7vdiyoAgbMPYf1jBRbfymFjcdHTZC36Ejqs
   9iGfHLtuvgdWBnH+pVNq+3ooNv0Yms5i4VCQgf2cl+Kt1E5uy4eLjc8MD
   M+sfqFqI+y3+3nPVRmJusBTIv9U6KiqfjmVQnEf7mkiK0jqbAnuGcdjHq
   Q==;
X-CSE-ConnectionGUID: 1NubkoGcTJWzGoBuh/VE8g==
X-CSE-MsgGUID: aPJQvyrRSba9YKjz3NCJcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2667895"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2667895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:34:50 -0800
X-CSE-ConnectionGUID: dwbSkyncRpm8SBA305BOMw==
X-CSE-MsgGUID: +plRwO58QAWl4AGp9bk/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7692843"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2026 04:34:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 22AE999; Fri, 06 Nov 2026 13:34:48 +0100 (CET)
Date: Fri, 6 Nov 2026 13:34:48 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Asdlerto Korry <korryasdlerto@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
Message-ID: <au3JaIfCVs1N_R_7@black.igk.intel.com>
References: <20261102003508.341309-1-korryasdlerto@gmail.com>
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
In-Reply-To: <20261102003508.341309-1-korryasdlerto@gmail.com>

On Mon, Nov 02, 2026 at 02:35:08AM +0200, Asdlerto Korry wrote:
> ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> print it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and calls fwnode_get_name()
> on a pointer into the middle of it, so the "missing reg property" error
> path oopses instead of printing the message (seen with the same code in
> pmic_glink_altmode on a Samsung Galaxy M52 5G).
> 
> Use %pfwP, the specifier for the name of a fwnode.
> 
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>

Acked-by: Heikki Krogerus <heikki.krogeurs@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c         | 2 +-
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 1db0c88d817e..4b4905624d61 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -433,7 +433,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>  
>  		ret = fwnode_property_read_u32(fwnode, "reg", &port);
>  		if (ret < 0) {
> -			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
>  			return ret;
>  		}
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index 57b37fca150c..fc74c205181e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -430,7 +430,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
>  	device_for_each_child_node(dev, fwnode) {
>  		ret = fwnode_property_read_u32(fwnode, "reg", &port);
>  		if (ret < 0) {
> -			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
>  			fwnode_handle_put(fwnode);
>  			return ret;
>  		}
> -- 
> 2.25.1

-- 
heikki
