Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982321;
	b=RW5hgyeXb/FKL79imXJG8KK/dkUF4H65QFcv6OLj0SyFsdgR0Y+ZXiXqlEFuHG8WfEWM
	 nzDz/Mo/8j45ICyHklfLSym84Axlim6517nYqiGVvRap0ckY2lnknWdlqPYH6ofKaIJ/2
	 3zKxP8t0T/cNnpqRO/emHLzfmJC5gPqJU1KVxm6im9aOkPmCetg6e29RSVDZqj5/pd2TP
	 joS0mZC7i0q5gBmqYiKM9iKPdxSbAO8DzhLmFocdPyuGQfJkliygfk8n36aBxLYF9Z3Ii
	 FMQriG0ygzqggsv+yChpjUpquNgdPWKCbg5lNMX+J1BQ5TB6F4HUNaC8rk8W/7lAByQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982321;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Zamge69zICdWu/U1IuFrQcBL/wmA7tidEKYPjxmmkAY=;
	b=SRp/9nyw/9K/50wcmnch5m3Wqo63RBnbbS0e5Vmvci0QZXOIB0yojjqFnXuc/d2RbdjG
	 1IFTpYxMjy5rhnjqTJU4UkWT+zA8lMYeTgYrcfBNmDuTBGIg/arlAr05BLNoSrQqflDe3
	 XSPPYKpHgAxnApYppS1SfESztJ39AjKyLLrO7jbez/L7LAa5erMEP5ofxw0pG13nRzFC1
	 YDHDMN/0/U0VvyB5B3XN/UHGwO9vASRuv5Vuu4wk62OjSV3RSSZtnFt/Shys1JLF5wiQd
	 GMhGT+NJlwKvRJYHq0fwXsdWEEbXQSxrGojNLOja8Gj52O2UZmZPnbJj6BPa5Pi5x7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GYuXP2xJ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E69606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E69606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GYuXP2xJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792982320; x=1824518320;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WEYVJ+KKrJk/w3z8nbmsDgS0Lcy4OrWmpyQqGc19Ugk=;
  b=GYuXP2xJhLRMOcm+CgoyIanNb04Jb6ewk+hGs4SzWAnXMkSrik2Ao31B
   uSdcR7r9z39Zr9WhEynW+2AlY1LupilySwE5OpoSnGc/iT2KUza//Gv/5
   7NcDFtGpGRDg+GrBP7TXK0UYVP5cTPN2vn9kJiZoRj7pLNm7Ay+3EiSNC
   PjXCoaGOHjT1xqqSPTYTeU/VouYbMVkhqnjWjodwaZCyO3G8pEV32S59C
   esLtEAKP7/rh0EZvjI8XxR2Ktq0vTwmktoTrXLK/9GsF+msXvsftpl1c2
   qUvz0/9z81nd1cAUV1h1EDLQIBlAs5qD0cKsqXPO8pz6OXUzcfOmrKkpA
   w==;
X-CSE-ConnectionGUID: 10QJPcRhSJaEMvP580u4ZQ==
X-CSE-MsgGUID: opsTphuMTNmwVmsLuO8yIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1526340"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1526340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:38:40 -0700
X-CSE-ConnectionGUID: 9ZJWsffSSaOmN7n4kzk9AQ==
X-CSE-MsgGUID: jfpAvo1ERaiu1YuqAHGbTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4198842"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:38:33 -0700
Message-ID: <78f8a175-40ce-43c9-b542-45bddb443fd7@intel.com>
Date: Mon, 26 Oct 2026 10:38:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-7-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Introduce support for binding and unbinding the Trust Device Interface
> (TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.
> 
> Executing TDCM_OP_BIND transitions the TDI state to a locked state
> (TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
> to verify this state transition succeeded before finalizing device locking.

Can we expand it to talk more about the BIND and UNBIND?

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  drivers/virt/coco/tdx-guest/connect.c | 75 +++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index 1f52a187b30f..e36515fc43ef 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -159,8 +159,67 @@ static bool tdx_is_dev_teeio_support(struct tdx_devsec *tdevsec)
>  	return !!rsp->is_supported;
>  }
>  
> +static struct tdx_devsec *tdx_tdi_bind_dev(struct tdx_devsec *tdevsec)
> +{
> +	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
> +	int ret;
> +
> +	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) = tdx_tdcm_alloc(pdev, TDCM_OP_BIND, 0, 0);
> +	if (IS_ERR(tdcm))
> +		return ERR_CAST(tdcm);
> +
> +	ret = tdx_tdcm_run(tdcm);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return tdevsec;
> +}

This return tdevsec and ...

> +
>  static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
>  {
> +	u8 state;
>  	int ret;
>  
>  	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>  	if (!tdx_is_dev_teeio_support(tdevsec))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) = tdx_tdi_bind_dev(tdevsec);

... the __free(tdx_tdi_unbind_dev) are not easy to follow.

I'm worried if it is OK to Dave given the previous discussion[1]

[1] https://lore.kernel.org/all/70056924-1702-4020-b805-014efb87afdd@intel.com/

> +	if (IS_ERR(tdevsec_bind))
> +		return ERR_CAST(tdevsec_bind);
> +
> +	ret = tdx_tdi_read_state(tdevsec, &state);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (state != TDI_STATE_CONFIG_LOCKED)
> +		return ERR_PTR(-EIO);
> +
> +	retain_and_null_ptr(tdevsec_bind);
> +
>  	return &no_free_ptr(tdevsec)->pci.base_tsm;
>  }
>  
> @@ -181,6 +253,9 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
>  {
>  	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>  
> +	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
> +		return;
> +
>  	kfree(tdevsec);
>  }
>  

