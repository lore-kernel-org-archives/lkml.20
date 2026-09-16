Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308E24A2A5E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550374; cv=none; b=GJTp5dRnRKHSIRgSfBiKplEsqanuEGzm8ilMi5jHLMtrgJ85cS80JEawcOnHpXgLl23HjzQStQdRGQiVWd0ZdIks1Vj0Os9g+Cq9VmTbvqtJT/dCyRgZnJDVLTwd0FEgYmXmDzg+wXLOCFbgWqk64oJ68cSiMrrNE4Ao4oAqEuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550374; c=relaxed/simple;
	bh=jkhrO8RlQarX5WtjmbLsL8ZUie8tK4WmH71pVaVbJaI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8Jn8AG2QWKFrLzA6g7CboCnTsEzRnL3V/Zp4wlfNkJvlnFBikGHJHB8sOaJe5FQscJXraY1IqQjdj695dZ2iCRzGvQMv/A72uH6bvaks0I7mLSlApeLGowqcPIntnRaPD29aGpu8CfWX/wiPVzhqSs9sZCEfSjjdGhuNgAKo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIH5g/MJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIH5g/MJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D021F008AB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550360;
	bh=jkhrO8RlQarX5WtjmbLsL8ZUie8tK4WmH71pVaVbJaI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NIH5g/MJRzfT6kydf8MiqSvGIShbbQSLQkAy7fj+WLmF/TdBDCIXQ75hFcHUHhqWp
	 ILwXEYuCbxjwZ1++mPdmUh9WrdoenV/7F3r61UGSuCDP/y5JHRNmZYWeg/yvNG2AEC
	 3gS36xWuD+x+ioCwHdeRURhwvqEnmtEAnN1+3FTkld4zkQmhciDMZ4YrXpO8bjvK1B
	 EDJcehtmWQfHrSxOjEMDwDqidaXrfzWkDud/3XR2/8q1ZLGIzuaXQL6MFkkQnHOE57
	 9ZpokTIqq2b8OhdWsl6Ju2yGjeSte58xytYUUU397tnpP7cIr7DD4mBcS9Br64O+FW
	 G9k8swyZO7u4A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso703534e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJgbIaDBRRDSZDFmgpv5ZV4o/2URUMtqyJSHb313gY4hQLeC0BUujf3WXGWRyRiwBSvoKbvZpW2etIMFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ncSaKBVL1K52nnCp93fHduhZBIdrE1XT3w1Vok32ae4mF1HfpL
	d7/ITTyp52cLNBk5YKCof2qOA98olqFyFw+pFFtF9C8Aykvi5LrKZAES/i4jlWIzrBM+6qQ7HYH
	mtbDFbL7lP/0SMeWcshxRsh6X70e07HLzy2sj1RqEbw==
X-Received: by 2002:a05:6512:230c:b0:5b6:1a7c:59cf with SMTP id
 2adb3069b0e04-5b8b6643babmr528031e87.41.1789550358615; Wed, 16 Sep 2026
 02:19:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:19:16 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 04:19:16 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915-pci-m2-bt-rework-v1-3-3c7d9cf9c010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-pci-m2-bt-rework-v1-0-3c7d9cf9c010@oss.qualcomm.com> <20260915-pci-m2-bt-rework-v1-3-3c7d9cf9c010@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 04:19:16 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdJgXDUb-Uac0TRB8u1WUpLng51C4yMH6iMEMoK56tQYA@mail.gmail.com>
X-Gm-Features: AcwNN1W7y7X6KuzagaoebLoYVja13l6huiHWKjETCoObDZ4g2X0iSPJMrWYgBlA
Message-ID: <CAMRc=MdJgXDUb-Uac0TRB8u1WUpLng51C4yMH6iMEMoK56tQYA@mail.gmail.com>
Subject: Re: [PATCH 3/5] power: sequencing: pcie-m2: Create auxiliary device
 for the M.2 BT interface
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rahul Samana <rahul.samana@oss.qualcomm.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, 
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 16:24:04 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Currently, the driver instantiates the BT interface of the WCN6855 and
> WCN7850 combo modules by creating a devicetree node at runtime using an
> of_changeset, with the compatible passed through the PCI ID table. But this
> method of creating a devicetree node just for matching with the driver is
> not recommended.
>
> So create an auxiliary device for the BT interface instead. The serdev
> transport is still allocated here and handed over to the Bluetooth driver
> through the auxiliary device, along with the power sequencing target used
> to power up the controller. Also extend the provider match so that the
> auxiliary device created for this connector is matched as its power
> sequencing consumer.
>
> Since the runtime node creation is now gone, select AUXILIARY_BUS in
> place of OF_DYNAMIC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

That's some nice stuff, thanks for doing it!

It looks like there's no build-time dependency on this, only run-time? Can I
take it independently?

Bart
