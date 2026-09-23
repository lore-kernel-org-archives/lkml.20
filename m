Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78858363095
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128196; cv=none; b=dM+mJeE7CGrSjB+aHg0Br1ysxsRHk6ZogIz1uB/BIbW412D5R/IGkOLzPMq3RCRRmkD1S4KXypojwEc3oP3dBovHRlxuyz9r6Ax7UAIQt/gFxmMIuM2n9f4dAAfkORPNY7WImdR7+nV9W89mzxykd6lbzEN4HrnB9nGq902YW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128196; c=relaxed/simple;
	bh=sctJ8pRpBUC39phZYvLZAiXxKt0bFvx0/SjCeTNKZ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U97yG1eUlJ8ZK1VB/Rp0/aFn+xQzLBPESqv9kBQ+oajVraFCw5Al7XhSI7AmjubuyzPte4NXGtgdbOG1y/rcZVZXBEKSKvGIn4UiqM9CHixBX2tiKZTHo7StmJgF434U7rehBZIJuJTkSCizpgEpfQrDtMmipOAdrXw8YUAQZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuPsjtzK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuPsjtzK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so189244a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128195; x=1790732995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=EuPsjtzK8C/LHSlXvnte0TsxppJHCT5214tDI0d58TlMySlXnQuNGjctLUOmCM49rN
         4ZeXkCdRjGbsdgAnhmea1OlwF9Pdt5g9CfJORRb1bxhG1E/9LKbTPMeoSzHl4hdgMrlM
         tgssyTFfLXou0AM08QKU6yp2Q3wPlF3tP6h/H25Et+2b1sARTFjBu0Pd2s/soV7gqDL1
         wTjFJuv8Z7kOP1vR0m/gdZgy0Uvuji8hgQICGAo4eY0CMtlYvSHtapMMg5hQBj1di6XI
         /NJGv0GC/0K2Mbr02+xLqxlF/TUMBsde/TqIFxaAeE21h8nqKe8RYHIB6kkthD6V7oCQ
         Wlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128195; x=1790732995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=0RL9kMpe+kqDDzNfwjH7JYqmM9RlC4cCJjD+EYFl9Xg0TU3APVN0fY7qIQGXLMFl9J
         8/NzXac3Qvmai1Aqh/n9qUHapmnxnqFOqSBmiZ//TOuVWTcPgrk3XFYgB8N9U4WtUM+/
         mRQLKqWqwbQy8G0XD2BwVS/rHH7iLskEUnhtz86dSxiDo7xJO81jM/O+jG3pbPgqPdQt
         cim5tdIFMy1jkCLnA+m+IdzjCj0rZJSMCqP6ny3N6ZfjQL2iCToE2FpKgD/HjKjEeahq
         owgUAsH9THx8qflIoZ2/hgdK3pW0ix0ObF2wiP07KRYNJC+1vH19pd3SkDBWGEXMADIm
         QvWA==
X-Forwarded-Encrypted: i=1; AKwUvBzy3qijikcMELlHxkDCFjs5zWzuM0jPHIUnfX4T1V4dsD9bhhRTHqse/T/KnHwfpk2mY4neAkpQPBRTW9c=@vger.kernel.org
X-Gm-Message-State: AFuF++k6t2e65YqJr5122NbsQSqBQ8O9xmtf59xozcDENcgvvgCjxxgc
	zqZWXN9K5pxQeKOxcfx0gm+p7xI5o2ShJsF+gRpNU+6RMrFbv3L/VCBz
X-Gm-Gg: AYBFou0826VNoJqCipYNaNWaiT3BOXf/M2oTg3hdYBEN8nC1+kZx2woP7oZr8Ikit3u
	Y3aSCuGk7hVO1iYLc8Z9CoUS2fF49E0gVnUMNj4bzZ++c8n50zM7Ighwb9VyVhkxdfkLW2eT0+Z
	BF3YhMG634Tig9XaZXhRjerh/wxpOHKFuCq8pMbE46/N7YlljsXiT4gFEQJ9A84pw4gAt7gjqWn
	pPkRe9/YOCF2hyBItkOjT7wtXK2Om5QbQQSzVjr7Db4Q1CiPMQUcsnw1Kdwqz9KDyI8RglGLu9Y
	8RJw1OlrnSFueVUvooB0TZo/QUvZRHx/l9ijAt53mnmrvm8amWcYJ+mzdFAFkpMyi3WOQ7LhInv
	Q2COpe+FM222KGXgDsazU2in4dU3bUa0TspBhIQkMwsnZGQHiPwHgP8iBgdZhQpgrQeg9r+lGFX
	dKgbXRxTlRaQ8Oe0FoJQD0K1LYsNbj58HiYpBnI3gOWG3Kzy4Kjgevd/eVv0PfEkLjgXvE
X-Received: by 2002:a17:90b:4cc3:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a07e61658fmr750266a91.38.1790128194871;
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm1915180a91.4.2026.09.22.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:49:00 +0800
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
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <arMvZNEUhAQYa--o@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
 <aqEQnkrPSKB-3fam@inochi.infowork>
 <aqFst9QH9YTFlY3X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFst9QH9YTFlY3X@ashevche-desk.local>

On Wed, Sep 09, 2026 at 05:27:03PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 04:00:15PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> 
> > > > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > > > +	if (count < 0)
> > > > +		return count;
> > > > +	if (count == 0 || count > data->max_phy_count)
> > > > +		return -EINVAL;
> > > 
> > > Elsewhere we distinguish count == 0 with -ENOENT.
> > 
> > Is there is an example? I think it is suitable for its internal check 
> > to translate -ENOENT to count 0, because no phys property means no
> > phy. For a get helper with optional semantics. I think it is fine
> > to return 0.
> 
> This the brief list of what I roughly grepped with word "count" in the name.
> 
> gpiod_count()
> of_hte_req_count()
> i2c_acpi_resource_count()
> ice_sriov_set_msix_vec_count()
> reset_control_get_count()
> 

As the respond in the phy bulk data patchset, devm_of_phy_bulk_get_all()
should follow the optional semantics. So I think return 0 is a good
choice. Anyway, I have added the zero value check in the driver.

Regards,
Inochi
