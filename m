Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A645DF4F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940867; cv=none; b=D+2XJ04+1AtxfPwT/kzp85LpkJ+QB6rCsKEnDd9sLN/B+u3lm79++dlsTwNhb8+mAd20cdW+5qp/QtfJmon11Sj0AuqapfI2pong/sMkAZ2OqfRnMHNPArv+PUQkrXqcFEdnWj1NukWYRnEV2nQENfJGQs1rP7VX5YF8mqj5UdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940867; c=relaxed/simple;
	bh=DOagFB3gfTzdfAu4ufX/3C2X1fRMpO74SBtnAgKij6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBryt4BgS7e8103NYcjgmYsmPJWfpRkWPQVPGu3Ex3A5FgG61R3rBs4aLBAngzdDetNKw1Lr5Mo1yUfKFEhzES5TIoI5bQroyPUAIJjvwrXhzN98+XoHn+MaAaRoKDfA0o3QWhhzNBos858LSuUNSHLg3qrb62xHhBIpzxj0ayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExxMnNXw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExxMnNXw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d6d28aa26cso35129185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940865; x=1789545665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=ExxMnNXwbM6zPhVxYNIkZtCLNsdzbRzc1O7Qryuop+PGmHGVFjKkxW6X0i1hhHDrXU
         D50azv0O+1uHF4pVuJtMweL09vGXQsEkNfuC/es6Mdaz8aHWXeWp9Nxzn+NpyTuopVMr
         /QX1uyin0hGCQQIxi86WWfAMeN+/1wAWjNducqN+lJW6p+GkRUKcQYkd2kH44RgxDPM/
         MdTcw3G+PClIfnimcMHXDTLZAMaBZfVRnOXJ8tJ/g6qXPVXqPUzB7RCehhPm3CgK2crD
         0QWIB48MZao/aCKXGvtPsAg+3oy0x+PbXrEq8d9cOCQejLOYP62TPFJJZoWxobbuoy9J
         nQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940865; x=1789545665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=Mbe9gKjvJQ4NzDQ4oSwAp/weg2Kl4s9jDXqqPh7+PvufUXYZLWC2EL6cZPoQzBqzzZ
         DzG4fL82jXtbqxR2ufGEQYSjhTJf9L0Ha1fbwLWyV4q1aIP0cqw+KiKUmQIT0s8uvq8G
         nCSfwigdD9z437CY7nfqp34ihW6/knEvTEFY8yyc7DIjYXxZHhFBNzIiix+ZiHdx1iXZ
         oYhWvSLP/BLG1VIUVXNRfIK3nR+V9Ge/pso7H2Zg2ncJdBdUa/fO0iN2YxXclBn6qXRf
         sCTz/r+QoWt8hMCJsK/m4qUgqvA8hApGpKb1F5VY6AqnQlVNR87sIbYFFfEoeR90ljr8
         BcsA==
X-Forwarded-Encrypted: i=1; AKwUvBxoCzSlXvoUKIeTRoEmtNZC2AkhRA1riTYtO9V1Q+fxYMDTCVDxS6ub/z777OSkd1mg+RBx7Mby7npcUtI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTAFtKYrd6wi4nP7F5Q67h9i94fydeTLL/p2ZCsFWvznvabLjs
	DqhxUGEM0vI81jfioNYWFmK5YmROxW7debszIvXW1ahz4b+xMlfdOi9G
X-Gm-Gg: AYBFou2gg70pcIjsoPUK8Hk/AWd4rVcUkRX1QP71KrWsXLAVC+y/I4m5EiUd13auPMf
	Ip62//sKAu0rgr8uYZ8UN21GCm7e62xcxeMApkcmDKDvtN6MeE0ySFiP1W+jhfjCu2vDpq+Fk79
	UOthMbENYNkagVM88Yz+TYWAKGOXlqtX8Kl5JGwZhYyquqxbUK+Oc0WGS1KxiFqoitp0DATnfc4
	QjtBiXneG0T/eylcHIRbkE6Kg8e1H6BS8yuUj4RceNH4MRLTzqlG6TU96oOqrS0ir5c521oaQcB
	qFcPTacMQyMsdZ0Et6MMGUsoEYP2ddtiBshBDvvx2t36/wDe0qkqxdjLbIvIYQ23HJe5bH2Qrp3
	/OFbtMKK44K1Wjm6NDNZWzJ/WSOjEyx2HcYDJnLDsHi97A9IOa5tBinJs0bqA72yC3l8kMk1sq2
	5xArwTGBvEFkAXPaKUEqzLieYXM+iscyBYJ9ol4+OGB86wmhIpC6GEKRGewa++nf2Aa0YMGw==
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr319851615ad.12.1788940865429;
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aec084sm66832155ad.84.2026.09.09.01.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <aqESGs3_BxOd4PYg@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>

On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> 
> ...
> 
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODEV;
> 
> It's better to use -ENODATA which will help to distinguish from other ENODEV
> cases (which are more often to happen).
> 

OK, thanks

> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
