Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979246D2CF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046636; cv=none; b=HDF4c62BSo7VmCfCNv0frhBaUlQJHNSXL4esqPADlBeGaQRv2pVpFJ1949mY+JqHWjPdSTOisnPSGsra4Hq8wBV8btJ/TTFGqaXOnKXbg2LadNX/7Pmmkkpc0N0GCYmNSUP3mst0iY+Dc6dwHt4QVlDGS/rZqEvhUXcJXKhumr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046636; c=relaxed/simple;
	bh=/FYj6q7Xy2ng34DBUXkiLlonCACAzlEqokQQ19iqyR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjK/uzGNBtEoN8VyMkPZrGVWrWDTRhb2WROyLXMvTMk82Nul+/5EQ59b1k288+4oFC+tOXnKtnlzOzHyBDV6E2iGu/Gv/rnI5V+HyrsQLtLjWR4xaanWml6f75XQCSdcEFHb+KnACQIGpq/JbPAAx/55J80hllVUsX2jggBZyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f3LwMJFH; arc=none smtp.client-ip=95.215.58.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f3LwMJFH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/FYj6q7Xy2ng34DBUXkiLlonCACAzlEqokQQ19iqyR8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792046630; v=1; x=1792651430;
 b=f3LwMJFHcqTWRCRYFVnAsv20Hi0p7HijH6YmxUbKDctE167ucasVmuKgtC5oQYc3l5Ypms14
 lZtNq5mx6tT2oLXLDrddUUpBmJaBpXgfP2JkwnWld0zJBZ2BCRpqgx/JHFjDOPblzMpyk1ittCT
 qfVvSBrP/ZAHhgoK1YPyXlC4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 862023fca479452c;
	Thu, 15 Oct 2026 06:43:50 +0000
X-Mizu-Trace-ID: 862023fca479452c
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
Date: Thu, 15 Oct 2026 14:43:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> Sophgo SoCs such as SG2044 contain eFuses used to store
> factory-programmed data.
>
> As for SG2044, HW automatically loads the eFuse content
> into shadow registers which are organized as 32bit values
> exposed as MMIO.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/nvmem/Kconfig        |  12 +++
>   drivers/nvmem/Makefile       |   2 +
>   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
>   3 files changed, 190 insertions(+)
>   create mode 100644 drivers/nvmem/sophgo-efuse.c
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b..a7936dd65bdd 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-snvs-lpgpr.
>   
> +config NVMEM_SOPHGO_EFUSE
> +	tristate "Sophgo eFuse support"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	default ARCH_SOPHGO
> +	help
> +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> +	  such as the CV1800B. These are e.g. used to store factory programmed

Why is "CV1800B"?

[...]


