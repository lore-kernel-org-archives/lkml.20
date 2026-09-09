Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387A55D893;
	Wed,  9 Sep 2026 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967437; cv=pass; b=uTkNkUDaaIhWkEqPEPgZNQoAdD6OHbLHTzjKWIYlv8iYmwfbDPywakyBS1x/etGxCnbZk9UJyf1LprNxzlthGYpSCNTmp5AK6/d4Gk+pmeArHMNFIp1A9on9ZXEdJOncyAsnUlrBBOqyPa4/85+CFmDktpWR2co3J+nj92bv1v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967437; c=relaxed/simple;
	bh=EG49WdudFwmpOA/1PPqzc6htFSSubInZyJTKoSmHGxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUjW15pEB+F28+U5Vqqf2FfZ3254tVg2DvI1XukmKPHEJSFWMJKGR05xthBzHs3wy9HS9nkM2JAz08eeKmwAu/PD4plbPpF4s9qGT6X814K5fO7EXRoPC3clwa3phtZTRTNBuOdLPVhCBiS0ERm3b7o6fmxO5e6RXS4NoOo62Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VdERhikv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VdERhikv"
ARC-Seal: i=1; a=rsa-sha256; t=1788967427; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7HGlgi3ujRGXXajMaJKA0RdLdSoux5xt6CPVmSFmLgNeLzvQjQaX8sYlvTjJfBuRXuNpurHvDrFHioPonQO6xyk9x1V1VnFO27bN2XHk08MY4jdxawv3qDRlbAOo9yntDXhHaiAPri5C6YokeA10kPRQe3HwdcFTMttyUkA7Wk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788967427; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nWrgc8gHrQkCA2bPdP3SIzbWpdOOKEh0O7h1BjDXP4U=; 
	b=MSGAYQ3JuEtbXr6LnIyvP4tNSySkBb50v1UPWyE0WWc224ggrJkr/f2Pl1WgO2trWEq1Tfcfe2Eda/mGHjB86oeDmo5eDu1KtgSOD/OGgfBqufXgKXt0PFLxI0/C3dP62q8IPJY85oIbO0Ro7I+VqXMGMXdRmT3F02mILDOoxZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788967427;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nWrgc8gHrQkCA2bPdP3SIzbWpdOOKEh0O7h1BjDXP4U=;
	b=VdERhikv2kux6AsmdINu28jLUW9B5jh74AiRUCCII+0xaJH8k8adgkqlvKGRRpV6
	ayhr6tQYAbLNRTPfcJ6DtVrRBtl39hXhSvMvCyAviULvWDzSjMah/iK/ICZXmHRS0q/
	OfT/qGSNzQQSNFb10l1RKYGFZ6oo+l37tX3W3j9k=
Received: by mx.zohomail.com with SMTPS id 178896742505251.677709043366576;
	Wed, 9 Sep 2026 08:23:45 -0700 (PDT)
Message-ID: <4ba91b0d-7da1-4322-8a2a-0816fe43f9f4@collabora.com>
Date: Wed, 9 Sep 2026 18:23:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: Remove redundant dev_err_probe()
To: Amin Gattout <amin.gattout@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/7/26 10:52, Amin Gattout wrote:
> The devm_request_threaded_irq() function now automatically logs detailed
> error messages on failure. This eliminates the need for driver-specific
> dev_err_probe() calls that print generic messages.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d94..b456138c381a 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2595,10 +2595,8 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
>  	ret = devm_request_threaded_irq(dev, irq, NULL, hdmirx_dma_irq_handler,
>  					IRQF_ONESHOT, "rk_hdmirx-dma",
>  					hdmirx_dev);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to request dma irq\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
>  	if (irq < 0) {
> 
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260907-snps_hdmirx-7a30ccc56a49
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
