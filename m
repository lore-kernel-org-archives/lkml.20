Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0B383993
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842853; cv=pass; b=AWyZ3smGRIVOlUpu4+gjSQSScYY4pBTZOgo1+MgZV7K6cDwepwq7qyYR8vHNejbQdGU74svIkzr4PVETletMJQI8M9dE8s0MrOa7izk9z5Ywp8OdOzplNo7yovmcTm1W17CqXWPkVtoDdCSJutLFSA9hIfBPPZjVhEDiTl1+R9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842853; c=relaxed/simple;
	bh=W3Ab3yphKMxYz1/8CqZ7FpqnITfODGN1+Yw8aaRTaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOHiSHOOlOguUAG7+IPGH4/Yt4uo9B3Pbv2jYmVeW5jKvlL0pyKld9ZUwi/ca+K6xyoGxJZn7vQKHWcqy6/4kaZkS+JQcGiocrNa6Jsjs7t/qt+ITDKdpiZV2bkiNGsof57fObG2kNCu3etOgIwzpK0ERosJ934ISZv9cUqWAkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/v3ToNJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/v3ToNJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5f91ae397so10991a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842849; cv=none;
        d=google.com; s=arc-20260327;
        b=gWhkFC1dbY9766pDIsdxREvNuC83tQYLMFDfDlvXmZ2IGU24ZCuifqyCsRxyHlbr+3
         9P00aKPRSbhtetVeGnb1/O9FAK3wgcbMoSjBHpbX6b6/pMu+Qiv5Xot6Smkl6lQ2MJHX
         Irmg8eLm97Li/x+hxIRMoLCoytf9qt/peoTd2m4d7f3zbE57R4J5opRg49KXypxiRipU
         l61fV3fNQM+TMu4qcxiXv3qyNDBxoHpBZkWxhX8O1JW7H3jyAxrcA5KYTBD/A3T7+88C
         VcI9yaPkk20kZDQp1SoIFchfTUL5BMc7/1xpMbCBOCra/1kzIMv3SQ2AnAUyBYlTKXvo
         GZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        fh=po3urt/9A1xqgS4UzCkkUQp+L2kj7LJ9O/rmvHk3F8M=;
        b=mIP6inY3vkWj0pG1e69fqWwrXWz0xW8KvBBlSvy7b2Q641wlr8VtzK9H/jcz+v2cog
         jzJ3UtvCRT5JkcblX8fxrUjsVRtXwgHroH2EdINuFwtByG20RPCUZkfbf0S4Sr01QnnU
         E0PlENlj91iv6pw96f/TSfrms+8/oZkhc1mucwITV2Il/d2mROvNz8M9liKqbHZEdMbH
         I+tRmk0z4mrBgHUuCqXsAW0aNoQ7sAt4o5ClYfDHyHS/hY51OjWezJkXl0ILjIia/bwH
         JBMq/aU42tSiKwafF53z1+PeSMgRZsFqmQnaMZlUEololdVYURfybhybiQ/QGrTWNECZ
         KCLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842849; x=1788447649; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=N/v3ToNJU3GaR1Gi/EN5NS7dDb73uL8y7wKjgFBc5AfT+3MmPd9Vkvsiti1/s5Laf1
         /QO7JEa2Bc3O0CHFUNcfdEF5X9l92+MvtAF0dv9156l2X1WXhayO5kapSEZIBPbBUcWS
         +CW03OsKd9r5TbbZmGklkWtgwbGgvMnPa9f76mSMyjuh7aOGD+aF0kotH+/nfrz//SZ/
         PpKJbbBd91H+J163qMoRdu8T30MLyvxGnBx46lm40/k2y9HhFHlaDTMgw+Scgx09hngb
         3QG6AxShQuK7CtdS1zx54v0sJtKbCzopJOD7W0BOZMHk2yx5ybEtQefDARNzg+VotiIA
         U3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842849; x=1788447649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=k6XP7NARsBKjXyi3bdKUO2hfpkGcY3CKnB74Ze4DF32kWgM/epP2UhMHZDbcLblsGx
         /8Fw2DediHJ4ArSfdHaED5kpDHmWh1Euk7nq8/kAaZX6xUDKs1v6QYFpZqr3YXnblYlr
         6iEnqRqEXtmm/Nn+IYJ/xGTnWCxlf4WUr3de+Gg/qRnE2XL6TjT9GS/4vwWuuAmC36Si
         gSKwS1xeaizBgIKGcObVmLm69J7zKGU9BLYHw/jAdcWqp9KimePzErMYsadQj+n4EEhl
         yvW8aAdtxV3rS9xpZDEYMAbt+ViMYXPvkUxZrnaBb780yz6n2qoETX6uDHoPFgRe6YwH
         N8Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqWwIsOyxxs8I8vfhPbSBtDyKDz3TtzgtWP81jfeBVSwZMUj1G2x12KREpFWCkJlvxSEs9crBbVY0nj7p8=@vger.kernel.org
X-Gm-Message-State: AFuF++mnZj4T6D//TWzlpeD8caxJ5wCHpVr/bT+hom0Rl6KGSseox2Cs
	XF8jyX+FFd9yAAOuuT4S2QgMHMQDdNC6aB7/vK8fiR8Pfl1d2uodbylpVxVBVHUEJHRUSg6PUlP
	wn0p7tI8Z6nfI1PHNWlM0pXWgiZCSnPnzCtDTRug9
X-Gm-Gg: AR+sD11yhcn9hGkirmU28NTcwNws7ezCysN3cOBAGUsDM9VsNuPTLGwyEnBvnQMJUPD
	Ta74nVPDIw0/oxyj0v+mUnNqbkhO0UO7BWdXAUpaIQPHNhXX+8BG1VRiog1qPpdcEH9eMxVf4hI
	0Zn2g1Wao0lw3Ha8xYlT5K7bNnfOMrgFOtuxD9l32/NrQo+azMY86STS9JOe1IS7ltagLE0DC7/
	uNuI7b83IGJBp0qS48l/h+U8blPtxVmzhNpxfIzNhr7RCCTih0JyL1tkajHrQwy+0WJCOd3dfwr
	FGLgTibC0SXanURTMLEytyM2P9E2t4SouZhQWkO+l/3EUg==
X-Received: by 2002:a05:6402:611:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a5f5647937mr53711a12.10.1787842848394; Thu, 27 Aug 2026
 08:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com> <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 27 Aug 2026 23:00:07 +0800
X-Gm-Features: AcwNN1UTquEpZeWJV5own34vt8ybBkfXz7pYThlv5e4VIyfdz2_DSFDAfqeUnxs
Message-ID: <CAE14pddHBP6HMihTePR+-Pqhu2DKjVgRA9++5Epod6TOCLagFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2026 at 03:40:41PM +0200, Larisa Grigore wrote:
> [...]
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index c2dafb583cf5..034ee988924a 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -563,6 +564,84 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
>
> +/**
> + * ufshcd_check_hibern8 - Check if all TX lanes entered Hibern8 state
> + * @hba: host controller instance
> + * @num_lanes: number of TX lanes to check
> + * @timeout_ms: timeout in milliseconds for all lanes
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int ufshcd_check_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
> +                      unsigned int timeout_ms)

Hi Larisa,

Thanks for the great cleanup!

Would you consider moving this helper to drivers/ufs/core/ufshcd.c and
renaming it to ufshcd_dme_check_tx_hibern8()?

Since ufshcd-pltfrm.c primarily handles platform device glue and DT parsing,
polling M-PHY states via DME commands would fit more naturally in the UFS
core. This also keeps layering clean and allows non-platform controllers to
reuse it.

Additionally, the ufshcd_dme_ prefix would align nicely with existing DME
conventions in ufshcd.c while avoiding potential confusion with
ufshcd_is_link_hibern8().

Thank you,
Stanley
