Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1046284B2F;
	Tue,  1 Sep 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269019; cv=none; b=Yox2GKGGtSljaDrx7AMVyiUPc0gDRKwGWbx8rqSTQkTVG2VVmskaMKiHBMSyKVF1v5h59diKm0OdHzVqDZi0/McZaU/Jwl23Rq62ul1olhyqZoUP3RKKCVK2192r/6F3OUoKzM17gPK+OpYu8Ok1sDqM+IW8UONggS3p9aSLYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269019; c=relaxed/simple;
	bh=5qy3uAebB04gfldj9M7xTr/B4SRDmFbO3QviPRszi8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGdCgMl3s5YbMaI/Ig7Ip/Q+rVYwm342lsCukHJ6+O8vOqazZvsCnY93q5e8YtjjhalHuvX7vyOdciRg1MUwlAoLlf7QnytrAE775/aafAbmHlEJMpRlu+CJp2fWg74VC7iUtWN8RWg/juHKeeJSf4Auv3xb2O3c44eOlGZZRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H79Mv+QZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H79Mv+QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CDA1F000E9;
	Tue,  1 Sep 2026 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269017;
	bh=kctGr2GIcA4sL7Bp+pZfcshgu9vc3PMdrx1JL3hyDp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H79Mv+QZWGJk8k9tP1TDYsRkLEGXfu3ZWugcgVF+CDbpB1pENhsCyJSlJ1i2llVVq
	 1mQH9wA9XZl5dS2VQLBQv35mEpRVYx4Iws7geya/eyX2qFRE+ZmrRzdU81yiYb+xKA
	 j2Iu84tFLf7GbvxXeVL4m5JyqR+qk9BGnwJt/JbqaeyCyNnKBExR5WbCIfOrJe7/Yf
	 jZ5bTiyEIHJKv1Z2RYUBMQWLXBLaOoR28r2u9dNobLg3O9WKOnTzb148P0IjbjfhO2
	 JfoDMNNHShcotGqljgG+P41N2kfuKdTkRO5BuEbDFyVF6h16R2RH14h8u6xgHbWOXk
	 AZGBlyA/d4ECg==
Date: Tue, 1 Sep 2026 15:23:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
Message-ID: <ukhwwxnpukzhoo34z5cgb65a45qn4zed6missgyy5jr5dlwpi2@2wzmdk5ep7g4>
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
 <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
 <b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com>
 <c1bf749c-46d7-446b-8a32-12da14d474eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1bf749c-46d7-446b-8a32-12da14d474eb@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 12:07:06PM +0200, Konrad Dybcio wrote:
> On 7/1/26 6:12 PM, Konrad Dybcio wrote:
> > On 7/1/26 6:04 PM, Xilin Wu wrote:
> >> On 7/1/2026 11:10 PM, Konrad Dybcio wrote:
> >>> On 5/7/26 4:29 PM, Xilin Wu wrote:
> >>>> Flatten usb controller nodes and update to using latest bindings
> >>>> and flattened driver approach.
> >>>>
> >>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
> >>>> ---
> >>>
> >>> I tested this on a CRD and an x13s, both work fine across suspend.
> >>>
> >>> Turned out in my local experiments I made a typo in the name of the
> >>> interrupt that was carried over to the big node..
> >>>
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280
> >>>
> >>> Konrad
> >>>
> >>
> >> Unfortunately as I mentioned on IRC [1], this actually causes random NoC timeout on reboot, which seems to be related to pcie.
> >>
> >> [1] https://oftc.catirclogs.org/linux-msm/2026-06-11#35405057;
> > 
> > Ah, you mentioned this:
> > 
> > https://gist.github.com/strongtz/50bbd71a9f41d0d1aa9849b8cf1dce21
> > 
> > This is an attempt to read CONFIG_SPACE+0x0.. I don't really know..
> 
> Could you try adding something like this
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index b123da16b63b..5e08cb239e78 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -43,6 +43,7 @@ int noinline pci_bus_read_config_##size \
>         if (PCI_##size##_BAD)                                           \
>                 return PCIBIOS_BAD_REGISTER_NUMBER;                     \
>                                                                         \
> +       dev_err(&bus->dev, "Reading configspace+0x%x as %s\n", pos, #size); \
>         pci_lock_config(flags);                                         \
>         res = bus->ops->read(bus, devfn, pos, len, &data);              \
>         if (res)                                                        
> 
> (perhaps with a WARN_ON(1) to get a stack trace and only print for the
> crashing reg)?
> 

We've seen these kind of late access causing NoC crash on S2R enabled platforms
before, but only during system suspend, not reboot. Due to various reasons,
kernel tries to mask the PCIe device's MSIs very late during the suspend cycle.
If the PCIe bus resources like ICC is disabled at that point, the config access
will cause the NoC crash.

But here, the crash seems to be happening in the reboot (shutdown) path. We
don't have the shutdown handler in the pcie-qcom driver. So the PCIe controller
driver is not disabling any resources here. Since the crash is being caused due
to this USB patch, I would assume that the USB driver ends up disabling an
unvoted shared PCIe resource in the shutdown path, causing the crash.

We need to find out which resource is being left unvoted by the PCIe controller
here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
