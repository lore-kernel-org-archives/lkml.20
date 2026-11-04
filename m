Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808509;
	b=hAlP2RqjjcvINNm3irVwL4GVvfk/56TclEQSZDOXELoMeKJsPWen8uPNO8FvP0WdFc31
	 nG9IoIFWLD8Ma+JTl97Pc7uEZZ3nPRCqcgjbsu51+0FB6fad4EwLflrrj4ao4wJDjhffN
	 bbmx0cbcDH4wMj3ZtySt+Vv79GG5Ppjx3swTIkknCCsn9hv2PXx6s7FzSv4FgOTbucyBx
	 YtCYPTbijPecaLCKXDK4U1A1zxIze+/u/H2hYY/6JT14ZKjsw64ayvthWNz5t3T4cVu4i
	 N2STs26/LJDGmLBhSKNVo0q2NrbnkhA8x+K0U8W8cu2NBaSYr/7cQyKbFRSgoZXT4AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808509;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=prKL/IiDtwtZc6yvvtNMWVlCcs+HKIOTNMT0UbmZxag=;
	b=zeEpcOyIGh7tuGgyeFGLIhXCx3kPk3YGnHYRGiLCeecDXkVmb8hW3QImi9aHf2Uzhe3y
	 UzvwaplFwBZ86nhuOB3wd6HfDXIoiKgkYKmD5wjqomc/TiQiIccwdk8sICbOv6AITEt44
	 4Mxe9Lh9aaoqjKDjY8Ea8jTqq7VteSML47nzQkVXu0K3mv9FW9MWuSg4bL64iLmENLcrt
	 oHPWNDR//HL9gILMky1mQL5nPs1TQ7pIQ8SxjjnsfHPyZ7WVznvWE6UsaoivuBV7OIieL
	 eDJtOT3XIPvcf3sT2HgJVWUY7zc79ZVKRpgSgv3E8raqgTPTzlLmuGIT0URb6i8O+Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=SffZOo3u;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CC1606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=SffZOo3u
Received: from [192.168.1.10] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63DEA20B7167;
	Wed,  4 Nov 2026 08:08:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63DEA20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793808493;
	bh=prKL/IiDtwtZc6yvvtNMWVlCcs+HKIOTNMT0UbmZxag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SffZOo3unSj20HxNN/HBXkrg74iNW686erVL6zKzCyh7fgseY8VWtJOkLzn3BTWG6
	 kAMblKKR0pEPU6mkN11IyTSYYC/skyUn8eMWFElgxZXoZ92gr4Ozsa3sqpTvmF3C37
	 hpCvaDZSlr5dvJrJ1dRRV+56es5iUzZhZb6fsvgU=
Message-ID: <1ac51332-054a-47d1-abce-60bc74646e44@linux.microsoft.com>
Date: Wed, 4 Nov 2026 21:38:24 +0530
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
Subject: Re: [PATCH] mailbox: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 04-11-2026 17:03, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
>   drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
>   drivers/mailbox/zynqmp-ipi-mailbox.c    | 13 +------------
>   3 files changed, 3 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
> index 1f87a84e5995..f489bcabceff 100644
> --- a/drivers/mailbox/mailbox-xgene-slimpro.c
> +++ b/drivers/mailbox/mailbox-xgene-slimpro.c
> @@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
>   	},
>   };
>   
> -static int __init slimpro_mbox_init(void)
> -{
> -	return platform_driver_register(&slimpro_mbox_driver);
> -}
> -
> -static void __exit slimpro_mbox_exit(void)
> -{
> -	platform_driver_unregister(&slimpro_mbox_driver);
> -}
> -
> -subsys_initcall(slimpro_mbox_init);
> -module_exit(slimpro_mbox_exit);
> +subsys_platform_driver(slimpro_mbox_driver);
>   
>   MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 96462ca84471..262832753fa5 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
>   	}
>   };
>   
> -static int __init cmdq_drv_init(void)
> -{
> -	return platform_driver_register(&cmdq_drv);
> -}
> -
> -static void __exit cmdq_drv_exit(void)
> -{
> -	platform_driver_unregister(&cmdq_drv);
> -}
> -
> -subsys_initcall(cmdq_drv_init);
> -module_exit(cmdq_drv_exit);
> +subsys_platform_driver(cmdq_drv);
>   
>   MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index 42d2583e44ca..da7d33435cdb 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -1022,18 +1022,7 @@ static struct platform_driver zynqmp_ipi_driver = {
>   		   .of_match_table = of_match_ptr(zynqmp_ipi_of_match),
>   	},
>   };
> -
> -static int __init zynqmp_ipi_init(void)
> -{
> -	return platform_driver_register(&zynqmp_ipi_driver);
> -}
> -subsys_initcall(zynqmp_ipi_init);
> -
> -static void __exit zynqmp_ipi_exit(void)
> -{
> -	platform_driver_unregister(&zynqmp_ipi_driver);
> -}
> -module_exit(zynqmp_ipi_exit);
> +subsys_platform_driver(zynqmp_ipi_driver);
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");


Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Regards,
Prasanna Kumar
