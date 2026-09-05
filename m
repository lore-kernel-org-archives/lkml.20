Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43538B131
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619608; cv=none; b=tgV/H0IRQdwAZTFaGyry56E5zr3btFqf/+3E0vFmYkyMIXQgjDYoi38GPqAAF7OIkP+I8ohfa+umI3y6ho5+Jn6qs28Kn2eHlig+/krLOdETczBsvd58gesfJn1Ue9/X9sz+nBbS3IwZQ+xfB1OupcBAO6QXqKMS4Z6dbDU8zkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619608; c=relaxed/simple;
	bh=KhV/sExtmXB6UlADh0yOfIqRP3nAvtEhErCcazy8J5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHWDgSuZmNUi6updr/0UiSvMC7GFY0OO0YsTdWNohndlUu7mfmhyCXkqmlvUjZKnL5TZojp9DKzAFpPvmXsbvgliC2Ig2WpiZIKiBpJlXLtvtE+JktZUNtKjmFheZ3ODLTdYeHxAjaeabi97vzEAW63Q0kqNIc4GjjwqBhEqQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0RQCtVU; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0RQCtVU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1674165a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619607; x=1789224407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lIUHrxpa8LGuaDX4+74JSWWI9JDXZlTSaRdKXqmY6I=;
        b=D0RQCtVUZ0R66JVPMRj228CAFTWiGudK/I0oI1KeMQFoBAUS6jI4/Rxuy3+I0lFn2s
         Hr8qO+VzhMPTJm4MZEJn85XdJm/aNRgCTcUOF01hKG04cIfCul32H3jikO7oAHZ9N+RX
         O9kfjAyOMzsKN6oR2leTLNJnJhaqccZ+lbKIXfqbgZYdKfGFZf6Hf7t4hLBJV81N5/TC
         Ufv20jz1emh/xMdnr2k7BJl1vAHknspdZbQrDTeps1KNXO8BvkOXKnR6rY/Q5a9mUzT3
         WjOic63jRzGXUQVUZyLYIjrOuiHGGLzgz66KlAPjaTLaGJl2+gLKJBpk097dM2pvTXsc
         m+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619607; x=1789224407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lIUHrxpa8LGuaDX4+74JSWWI9JDXZlTSaRdKXqmY6I=;
        b=ao4pu7ZPl3smny395lLGABtRVUafxnE/OKvKMms/Tr+/rl6m4+YU7klxbjPDRxZjWA
         XH166L8XLuG5tGPByJspKnm5+3KUX/cE1S2TrArqJ0R1ABIcouWJwfQx+0b/iIpzGqnk
         CrEpBHAXK/pmh6PCsmwfGntp7/5NnQ4itEUqJdzDEcOsuBH0uVYn06fY6F45Kq0nxCSj
         be7HkfflRKGvd6xWoyl9gqfwc7t+QN+UCmXtD5ElA0FNWXWGMJfPU5MC9aYWpSKb4IHB
         0LVCUjhasldKWD5yhKX2NBvgUochXX4dDL0CO7m/6ardurov8tVWyuSmGPZuvBVQpTgU
         1LfA==
X-Forwarded-Encrypted: i=1; AKwUvBz+8FobIwZ1qLkYmQsjbTiNjmvgaQCQMDbKQf8vKKKaqM+waPd7x+J7HtBaIcF1Gq4UX5BW98wIYl3hd+w=@vger.kernel.org
X-Gm-Message-State: AFuF++nhMnbqxxgjLXKmyfOny1a0eXkP0VOZLzDQ9T14H/Eic3pg8O6Q
	uI073gkAq5wBer9bX3b9XzdKRifAY6VIkUYkud5gTjyArL2jpAXYupWe
X-Gm-Gg: AYBFou1BJam7iKTnEE6Vm6A5F+CuuntZGukQm8msLN+Pj14k/bTS71wLrn8DXD3UnsZ
	xHZrTmflz1yAGnI6kkU9XQwVY85NPEk0fahz83ksxUeJuzlQ4eSuQOO1SqTIic6fNRejORCVXpe
	AfautG9/USpWbH+Ief3fNTaaq9Wb06+7vuNpcoD0QzpDPy8ajfongNNxkHRV3JwlTKFzXIaS0uP
	0ABeSkGZVHqnEIw7PUj5P/zO6YiwAvjGuBD03/RbYbAokLGeSJZlcvWkqEiRue8eCC051N2wrRg
	R2pxOu2irG5auUGCmabHvss8YIoVI1/7sBIBYgbuI09iLeVnktGU9l9FYS7ryhY+xPu0RZ2uZMO
	+3fJktPJ8zUjtGaOAFtuSNdwZzPINal/knLg2PMBL/R1lN1xeryEK92ZBu4PSrooWNF3+P+IHrV
	Cxu/0cJ0jkMkhgZoCk8+IYMsdv23vDmmWgpn/PtspNbrQkQsJ0ma4xUdcr0SVvCC9LWsRm6T7WQ
	7+Z6KKmrQokoEtV+HQC7lEIvgtwe2nxPewT7NH9qQ1gHC6LpP5FhcfLVgcOQK5UO7blblKgiTZL
	CYJM4X9YlGY=
X-Received: by 2002:a05:6a21:487:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3da39b58320mr21305071637.1.1788619606891;
        Sat, 05 Sep 2026 07:46:46 -0700 (PDT)
Received: from nickhuang (2001-b400-e2da-caae-e718-2aad-4c92-5b14.emome-ip6.hinet.net. [2001:b400:e2da:caae:e718:2aad:4c92:5b14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc467df7beesm843306a12.7.2026.09.05.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:46:46 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:46:41 +0000
From: Nick Huang <sef1548@gmail.com>
To: "hpp.iscas" <hppiscas@163.com>
Cc: Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yu Ning <ningyu@eswincomputing.com>,
	Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Message-ID: <apwrUYd3VybxbAm7@nickhuang>
References: <20260905134251.67210-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905134251.67210-1-hppiscas@163.com>

On Sat, Sep 05, 2026 at 09:42:51PM +0800, hpp.iscas wrote:
> The ESWIN PCIe host controller is a platform driver matched through
> eswin_pcie_of_match. PCIE_ESWIN is tristate, but the table is not
> published for OF module autoloading.
> 
> Publish this platform-device table. Do not change the RISC-V host
> initialization sequence or PCI device matching.
> 
> Fixes: b593c26d081a ("PCI: eswin: Add ESWIN PCIe Root Complex driver")
> Signed-off-by: hpp.iscas <hppiscas@163.com>
> ---
>  drivers/pci/controller/dwc/pcie-eswin.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
> index ce8d64f..1bb4469 100644
> --- a/drivers/pci/controller/dwc/pcie-eswin.c
> +++ b/drivers/pci/controller/dwc/pcie-eswin.c
> @@ -388,6 +388,7 @@ static const struct of_device_id eswin_pcie_of_match[] = {
>  	{ .compatible = "eswin,eic7700-pcie", .data = &eswin_eic7700_data },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, eswin_pcie_of_match);
>  
>  static struct platform_driver eswin_pcie_driver = {
>  	.probe = eswin_pcie_probe,
>
Hi hpp.iscas

Since this driver uses `builtin_platform_driver(eswin_pcie_driver)`, it
appears to be built-in only. In that case, `MODULE_DEVICE_TABLE()` seems
unnecessary.

Regards,
Nick Huang
