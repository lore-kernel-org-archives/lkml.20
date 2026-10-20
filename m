Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792497425;
	b=3WhmIl0k3Qbw2Debp4UQ3zadnZEkcJbH9PONK42wcyAx8ckyS/8xvVTIwU+PpaIMpefs
	 kWdazEnacS0SIarG1zrfJ/JQZ2w8g4JqdPyocV+bpoU7UsRm12tn0ITve0jWHQagolKqU
	 8iUc0SYAuc5KFVMckIakaEWg2ySRxMnezkcXcx1kGmLq8u78Sgmr848hUQGWZAGkhjGcI
	 38QTdgbb2VFIeO0qKuoHKllm07oq4sEl6J87T2uNNA7YlCKtOKM+d9wQi+mtR/EemceZJ
	 6x5Yve62pl13tti3lmb+MXlA8WKGuWjxlTUsitaOqNVRXqg9SSxL3i5SSHmYzMMQcWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497425;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=c2ZbwGjZo805kTuwhmgN0xpP/j40ipqRFn+sWpKGPvk=;
	b=VX1FxAULr+fy3UxPPAwFqjqhLGp1I9fGYnOewFrnxBWWTNprgwjsU3u3MNgVxoJQM6Le
	 RK7evbk6eH8GN8EPHmqKZ9IytKiGB++o52ub6qcX3QXhkZkXo2RgD0okA/HKmykg4Rfgb
	 pCSnZJwLLAPtg5xcT09HBdzIrzBnhXf0jhCnkTGeopejOY3UPNsnj9QHiOV+fQdhuo7NO
	 G4NFAifA5ezPimT8EvinPAVQzPKC05zmYv+i5ozVCoEA/AaZciHnBhbcKX+U3CIRMuztC
	 o2P9346NobMTBfCiPqPZWxAIbA51Bm22wVpOkPk5CdfwLziBWuIKVfRunNohacqxUwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kMVgNC2D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15B606A319;
	Tue, 20 Oct 2026 11:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B15B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kMVgNC2D
ARC-Seal: i=1; a=rsa-sha256; t=1792497409; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RoCmToWOf394k0bNeMAdI18hlfYKv1ergYluUZbLe9t9HJZRbvl+DWDpasNCpvw5fqGFyWxA/FxdhCjuVnIkbv9dRcJQCAHXxrLuqO+usje/Wp7grwlIBke9hq4bONPQtazD0LJ9vJBBvY9nClkvHg1acMbQ3A+ggfVqVruYxQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792497409; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c2ZbwGjZo805kTuwhmgN0xpP/j40ipqRFn+sWpKGPvk=; 
	b=N0Rct2ytsi4ujkSxoUvgsb996x6uP00IJ30A7ekxzGbFuRnoUb2k0Jg0d9VdVH/j02amdAc2N9FcxBHj5FkNjwBNw8u1lzxTV0Pezov09jpeEf8GQEEbVPDspaBxj6WfAQa2DPfMzvaoGAWX3on2zRudjnemv/weXShsZGtp3M8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792497409;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=c2ZbwGjZo805kTuwhmgN0xpP/j40ipqRFn+sWpKGPvk=;
	b=kMVgNC2Dp5udpbBOpRLjrJR8Xau8wjJ6QVzNhTrYbhX/XnAa26KJKHE+cWmX3Bzr
	1FpHUkM2A4X5Wg/wsPwtTP00qT6jaPeqiShJFSYxAV0g16UzPr8A7DXLCkEk/IEQS6S
	YVea53ODaI/4QbnfS3wo0XLdvmuquTW2Wg61KnRA=
Received: by smtp.zohomail.com with SMTPS id 1792497407312902.680867488977;
	Tue, 20 Oct 2026 04:56:47 -0700 (PDT)
Message-ID: <b67086ba-7b05-4c57-a701-ecb7634b6abc@collabora.com>
Date: Tue, 20 Oct 2026 13:56:43 +0200
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
Subject: Re: [PATCH] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset
 sequence
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Guoniu,

Thanks for the patch.

On 10/20/26 05:04, Guoniu Zhou wrote:
> The Synopsys DPHY datasheet recommends applying a testclr pulse at
> first power-up to reset the PHY configuration to its default values
> before any test control register is programmed.
> 
> The existing code deasserts testclr first and then asserts it, which
> is the reverse of the sequence recommended by the DPHY documentation.
> 
> Generate the required TESTCLR pulse by asserting TESTCLR, waiting
> for the required pulse width, and then deasserting it.
> 
> Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index b7247d597c9c..b9f7ba25bd3b 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -830,18 +830,23 @@ static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
>  {
>  	u32 val;
>  
> -	/* Release Synopsys DPHY test codes from reset */
> +	/* Put PHY in shutdown mode for configuration */
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
>  
> +	/*
> +	 * Apply testclr pulse to load analog programmability defaults
> +	 * and release the test interface for configuration.
> +	 */
>  	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> -	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> +	val |= DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
>  
> -	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
>  	/* Wait for at least 15ns */
>  	ndelay(15);
> -	val |= DPHY_TEST_CTRL0_TEST_CLR;
> +
> +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
>  }
>  
> 
> ---
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> change-id: 20261020-dw-csi2rx-6225697f45bb
> 
> Best regards,

