Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725303BFAE2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882933; cv=none; b=E/T/RXDWaGw7+z8fXvkz8jRkgZKcHBl0jSMCZ+y8PPrxcWXtqZFXEI09DPwsjf8Ov5ntiPjzvTryOLxJwg1SiKBgfxUE/FlEf8CSq6ZUXnAzS4N7hiu7oIzCZzm0eUK6TDxZs8Odk4IrJDdetbul2WSux9PHrPonS5vLbFGxYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882933; c=relaxed/simple;
	bh=YoWO1uZ6XfmRu/nuSKAH9yuafS0EX+S6pIOALHqhJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4va3256l4QUe9GF70q3OHJnVRavxDj8KjipuDE2ektRkXUSwknDQSIe+lSovI2J2HacrEKmYMIo0nJQjx3Cvqoevgf45Ycy1M27LPMhdPXAn095UXCBJZxRd4RQDHJaXEYZzh08rZ34Ozyg36sEtJ/ZTsFu8mpELIjfndTSThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP7TA9DM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP7TA9DM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso12917035e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882931; x=1792487731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMyxaXXvU9op18W95PhIMdi3fsVmWdUMGH6XFjptvKI=;
        b=nP7TA9DMN60winnguVsOkG7OG577yfLaZI/FWTHkTzR+VD0CMag4+f5wjQ1K5XuJBI
         /IoSb+4DdrMV9weUJPGwaFnsUt8Xn+Qx7H/coLIBaghvtyLw61j27pKu0ogWuv2mGsPI
         1g1+HGtEw3U12SHvrz6mGKSXnqGe5lq5b/+m8EUKwsyysJOioPzW+KDryDd+n5hum4vP
         czsD6EiycZAroub7iWh0a1Gfe9O9heaZiVXKLhuhNlJ09HhUyEUrceH9/Ms9QherM2c7
         y+z3mhNzDwOK0clfuQseacH+NOOxQ5FgxjYfMDDbBrQhN3QIAi+HFucGkA+sbSVzYj/b
         jfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882931; x=1792487731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMyxaXXvU9op18W95PhIMdi3fsVmWdUMGH6XFjptvKI=;
        b=jq/yDstKBPzIMzVnJqWT9zYwvoHFw72FS/ulzQZjkDOfWKcsF1/TtGLQOjzpi+YqAX
         pVFbkptebBnpVmQNwLJScRrL2+3mTPIDiih/Msd+6tEf9BpDreEArtv9Z2Pe5ncGpGcH
         0pTZXVlhtR7fVSk2H7rNn69y1SsI38NfW9duaZTrUoZtWDH9eyC6muiyboR16jUMTjlm
         krZ63QjATjuJwTCdYeNTWTCO+k6RB5xPAnzK8PuuKMvsyV4pOUTP7UMkmmG05UBNzGry
         HG0u7OdLBibx3wQQSIBpFMnOtbfgXqwXXCF5tfVqkZNH7NejNzz+hlpjml5rxsHKEvbD
         pm4w==
X-Forwarded-Encrypted: i=1; AKwUvBzhDzw4ZeNjJN998pcSsEyP7fmkFnI9EeHzPiaPCAcB/dEo1tAB97m8HDJxlu54anoSdASLiE+MCIgCikk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuz2ZlFV9tVYKfLUAm5jW4j/CI0PQDQEIhd0IUavu4K2NbHTmN
	4SyO0IScJHD5pAYFJN97K04Vm1jsF8D9W16ADYYR9JkklMD/0zV7YOXz
X-Gm-Gg: AYBFou0b0n3jjbDNfjBNUwctr/0wdLO+BqAHLd69j46zlG289yF2LUhqxRcxj3+l48N
	htBV5iTWWcZdqnPdEnN07WacPlu6G+Rc+LcPObl6NpCEROIrtJVqSUT4tE6U1XIEaiECbLJaB6Z
	JOafcDE8TF9TN0B/rtEvB2IPApdRwmJqnA+u49Ec3P+Hjk3TAw2hmuXveSp5FlwImLSmeQna+Ad
	Ar5rkf7bXuoO4xcb+jvPHwljolF3dAsT7NugJi/iiLiWi7nbiGhFScGxtxCOBIsDW9bunhOwMWw
	ikOdaQm38bOGBaHm6P6oyJhbtFL5CIgkzKtFOdQB3Wer2pHwvV+2rhE5BlnMlPZXUS5MeoiAEs2
	jM61FsxWJBglPf2awUY3bLlGEQAyRq2QTEMmSf/mM/qYGOfDfdsiN2uLI8Z8x7mziFZkDJyc0Sc
	XN67gC6LfAU++ncxPGVkB1Hy5+RrQYxYbMcX4xCSsij/lfhDpsi1dkYNPw0NgmuSAJbHqeINdRJ
	oiAhqH8fKUOmKB1kIFBwE4u/+u8S7KYeiPrchlzdBSqoUWjUgd5la6jm6kcIAu3BQWkiBavTRx9
	LY6CYDB3UfFfZCoVxwJ6Z8AFQ3sr30/85YC9T7Eg909VDA==
X-Received: by 2002:a05:600c:4593:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a18e49bffbmr232748425e9.22.1791882930410;
        Tue, 13 Oct 2026 02:15:30 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm448488855e9.11.2026.10.13.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:15:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:15:28 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vincent.guittot@linaro.org, zhangsenchuan@eswincomputing.com, 
	Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 0/6] PCI: dwc: Rework the error handling of
 dw_pcie_wait_for_link() API
Message-ID: <wsrntkojtitvhprw7q5sabqcvih24mpfwiwiq5e4fg6d2tkixs@6q2vtdfo4shr>
References: <20260107-pci-dwc-suspend-rework-v4-0-9b5f3c72df0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-pci-dwc-suspend-rework-v4-0-9b5f3c72df0a@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 01:41:53PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series reworks the dw_pcie_wait_for_link() API to allow the callers to
> detect the absence of the device on the bus and skip the failure.
> 
> Compared to v2, I've reworked the patch 2 to improve the API further and
> dropped the patch 1 that got applied (hence changed the subject). I've also
> modified the error code based on the feedback in v2 to return -ENODEV if device
> is not detected on the bus and -ETIMEDOUT otherwise. This allows the callers to
> skip the failure if device is not detected and handle error for other failure.
> 
> Testing
> =======
> 
> Tested this series on Rb3Gen2 board without powering on the PCIe switch. Now the
> dw_pcie_wait_for_link() API prints:
> 
> 	qcom-pcie 1c08000.pcie: Device not found
> 
> Instead of the previous log:
> 
> 	qcom-pcie 1c08000.pcie: Phy link never came up
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Changes in v4:
> - Skipped returning failure during resume as well if no device is found
> - Link to v3: https://lore.kernel.org/r/20251230-pci-dwc-suspend-rework-v3-0-40cd485714f5@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped patch 1 that got appplied
> - Reworked the error handling of dw_pcie_wait_for_link() API further
> - Link to v2: https://lore.kernel.org/r/20251218-pci-dwc-suspend-rework-v2-0-5a7778c6094a@oss.qualcomm.com
> 
> Changes in v2:
> - Changed the logic to check for Detect.Quiet/Active states
> - Collected tags and rebased on top of v6.19-rc1
> - Link to v1: https://lore.kernel.org/r/20251119-pci-dwc-suspend-rework-v1-0-aad104828562@oss.qualcomm.com
> 
> ---
> Manivannan Sadhasivam (6):
>       PCI: dwc: Return -ENODEV from dw_pcie_wait_for_link() if device is not found
>       PCI: dwc: Rename and move ltssm_status_string() to pcie-designware.c
>       PCI: dwc: Rework the error print of dw_pcie_wait_for_link()
>       PCI: dwc: Only skip the dw_pcie_wait_for_link() failure if it returns -ENODEV
>       PCI: host-common: Add an API to check for any device under the Root Ports
>       PCI: dwc: Skip failure during dw_pcie_resume_noirq() if no device is available
> 
>  .../pci/controller/dwc/pcie-designware-debugfs.c   | 54 +---------------
>  drivers/pci/controller/dwc/pcie-designware-host.c  | 23 +++++--
>  drivers/pci/controller/dwc/pcie-designware.c       | 75 +++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h       |  2 +
>  drivers/pci/controller/pci-host-common.c           | 21 ++++++
>  drivers/pci/controller/pci-host-common.h           |  2 +
>  6 files changed, 115 insertions(+), 62 deletions(-)
> ---
> base-commit: 68ac85fb42cfeb081cf029acdd8aace55ed375a2
> change-id: 20251119-pci-dwc-suspend-rework-8b0515a38679
> 
> Best regards,
> -- 
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 

Hi Mani,

Is there any reason patches 5 and 6 were never applied?

kind regards

Franz
