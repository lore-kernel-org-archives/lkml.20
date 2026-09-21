Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398A49A3D7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000146; cv=pass; b=ci9+ZX112RANzp9AsWmqoZmoAkFXVDTQ9LkaaGSKhcerF2S6i3fkcov0VuXW7FzH7k0N+htj65DvP5e6rtu4OfA5tDhdWe+7qLCaG7FMB09RVRb4zV6C6oMkXtmPWyRk9MQjTDjbDXRt0bj2W5KsIBwcs2bKP23esrtLVaNPELI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000146; c=relaxed/simple;
	bh=QLsW3OZgiOoo2/OqYWoiGLDpHxDhmxkLwSkqyStuBVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W20j+rM1g35+KCU7n3Sh5FTkltPw0uphV0LiIfLBznQkQ2neNS7aZAOaPnnMPEaXc9EtzkaFxfZ8MWoZ38p5alPwusvmSSZJlHzw2jsReVyz4xr5XzZ9JRzg890X+cMZ3O5cOAZaHCMNQMURXMyvwFIOPEl9JmkJJpawgZGzI9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEweTyfZ; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEweTyfZ"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso18713247b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790000144; cv=none;
        d=google.com; s=arc-20260327;
        b=nLqrmYwOEEOvBtykO3Ui08WBL9F/WXUYN1x7PhbumEEgp7xUjLaoL+KNX4+yfDhxaa
         GkRJMUdBmDlwLlaiFqpQGZ2NLPok5vfRAamRkQ4tAxvMXRHBNX2e7ZmidSjDQ7VWi+Y0
         h6tZV5eZgUYmqek7ooBZwgShroZb076LgfDk+i4BLPuDvh+ure47r/+vfBLZbezq5qeh
         eWW0Aj6RFst0rUyU0aH/FHo1HQw8zWflE/b8Ul2jE3oC/HrtxmtnGHwbArLW1YVjT/Ht
         lDGulBPyJffAlgifxssyA++JN4KkUHWbQekB8EZ7yVzaWfrzEOwM5APVh+q59c++Awir
         g4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HvT37my9dta34DYQuaVV9y1xeoKj9pu6IBKBeJIjvCE=;
        fh=QK5E6WZnKHwYnJvetFjls3NyoNMkLBCxLwR4vHdVQBY=;
        b=EZEnI8xOmVfhXddageMFsiSfV2r6Njo7a0el+A8nUIlPCyyQH7/fTGQ6wMIHLp7b/e
         7rXkQUQ6t8AtZj7hdLaXzQW91ugDWi5BzS/Ga+ANRbvqRQmJvCFZ+1SGv6X0hZO68n6C
         FRgzrvjqQJ2tsAQO0H5zt0+yNWchJ6HcEci2Hy6iL6Nc5IeeeVR9RbCLl9mkit6yQwI1
         IMY+E3eILckLmA1iDTuW2v4Wq4dezULyrX2WPyD1BUf3Y6NZCzIV+ZDrRkd3nVFdGPJ3
         86TqysaxcrE89V67sLEB5fzHHwVM5iqBW+o72wwFbD8aPRAZQ8moQY4MjVn4HpoqqBR1
         mDXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790000144; x=1790604944; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvT37my9dta34DYQuaVV9y1xeoKj9pu6IBKBeJIjvCE=;
        b=EEweTyfZQ32qQ9tfWdmJMOqOWI7AILIpu9vOY1QhgDM1z0jNsl3NaqD8BxMP76CV3X
         vazogd2n7BGMx03d4WphSIthj8PbzJAmIFTHFE4q/9WXf/9Y0rv+6iIHvL+OoKkvZuTI
         ATEZ1iaUDLohZfIlJ3IiB0X1RVYj5KYya/kNOLb7Hyz33z5HkR24bKpDwtlzHAusqxYa
         X0J/xaQiFF/iZiyVNfutjwid+lJUzPYZLpAPj5TiBr4u1rrp8wVAiwFxhAk1mKTNj8hU
         pTC/T6w+7+3QmE72IBEjgDd1i+kiwUdb2XevKQWnGuI+AA848mgtW5A44B7PXMWe1cua
         15IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000144; x=1790604944;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HvT37my9dta34DYQuaVV9y1xeoKj9pu6IBKBeJIjvCE=;
        b=kN0jkJasU/+78h9oNBLbsfEZ1Fx16mddA5mP1imkMsExbTF++0fvnfFgk9RbkAbEF3
         m00mcfoN+B4BdlwAfyqCxjy28E+Mko+/hDgmjEINvdz81XLsYKOJqA3aB0h3vyf4AXNB
         TK9ipSQWCeQmQz13GvRa10DxGcETcW6X68P9UMjlNSR+ThRGCP8guP426d6PxmojKLaK
         Qfx5daInqRB14gVqTQCA1g7PVHSV47Pa9wHMjEJNxFqGsWjH6n0+s8j7vmf+RqoJHg4j
         MOqrd0oKYigsEBwXeWk1HxcWyuYUhTYu0NrH/Hb4IUvz+vWmfuUI2j8auCjMtb3YjGVQ
         nFyg==
X-Forwarded-Encrypted: i=1; AKwUvBwdn9JVYa//45xwteTngWqNZy6VgwuVfocjjOfhskpenoVqkAXs3lnhfPCcMDhB5YcbNNn/qo5svmhOp4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kI+lXVHrcGO3Gmuqzs9JEGZoJcxj/zrP4yJvCA0p9sn8K4ho/x
	5fVVilNXrztFN75a2KT0nSHbWldudzW8VVmWlKm7mCXo+leN7wZW4vVPRSmD9IIXMrpoUh/lfox
	L7uWLqTgZzISdUGQkP+jmX97ahVBu3PQ=
X-Gm-Gg: AYBFou0z+WqD1xl9k8q9Yhm6zYeOGE8ZGj59qESCTYKchClCO9Tuvse55uIKUWB843K
	oumRVhHpfQq315q3xO9XyUJ5jDaYoIjMex+ECXRCEPB1qHTPd93TaRScbHhlo9XqA68/GvRTKxX
	2P/T8ONCRLucbTErIbmASn4BoFk/PrprWO8ebbeJOJDeg3ghR4PBiuiOp2KaLLO9/32h6PUKorc
	L+YwVReT35okEYVhY6/bme/Tq6AuuG75yV0QY5OvF8J67uN7/koWrC4ZJglR+llcx3bk+ak8TjR
	CMIiO/sNece7vHabw84Ik9+R40jVdZmUPrlsghFvoDpwoHygmb5wrV9o0A==
X-Received: by 2002:a05:690e:e81:b0:66f:9564:7827 with SMTP id
 956f58d0204a3-6717fc61321mr3128893d50.22.1790000142000; Mon, 21 Sep 2026
 07:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916080030.2960608-1-lgs201920130244@gmail.com> <736ff398-98fa-43bc-9771-1b0d4c2a591c@mailbox.org>
In-Reply-To: <736ff398-98fa-43bc-9771-1b0d4c2a591c@mailbox.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 22:15:29 +0800
X-Gm-Features: AcwNN1XP7xc4w6JUo1lwgUr1iIYbKG3Cq0l_NU90yLcFM11w-KyBFtXZVHMUFrQ
Message-ID: <CANUHTR_AAKH13fRAwLY5wzMjhWuzwET=-359ZMNh0VU4tULrKg@mail.gmail.com>
Subject: Re: [PATCH] PCI: keystone: deinitialize endpoint on remove
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Yuho Choi <dbgh9129@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Koichiro Den <den@valinux.co.jp>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for the review.

On Thu, 17 Sept 2026 at 06:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/16/26 10:00 AM, Guangshuo Li wrote:
> > ks_pcie_probe() initializes the DesignWare PCIe endpoint with
> > dw_pcie_ep_init(). The probe failure path calls dw_pcie_ep_deinit()
> > when endpoint register initialization fails, but the remove path does
> > not perform the corresponding endpoint teardown after a successful
> > probe.
> >
> > The successful endpoint initialization also calls pci_epc_init_notify().
> > Without the matching teardown on removal, the EPC initialization state
> > and resources allocated by the DesignWare endpoint core are left
> > active after the driver is removed.
> >
> > Notify the endpoint framework about deinitialization and call
> > dw_pcie_ep_deinit() before disabling runtime PM and the PHYs.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x Platforms")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pci-keystone.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index 602516239a57..35787e727c5c 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -1349,9 +1349,17 @@ static void ks_pcie_remove(struct platform_device *pdev)
> >   {
> >       struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
> >       struct device_link **link = ks_pcie->link;
> > +     struct dw_pcie *pci = ks_pcie->pci;
> > +     const struct ks_pcie_of_data *data;
> >       int num_lanes = ks_pcie->num_lanes;
> >       struct device *dev = &pdev->dev;
> >
> > +     data = of_device_get_match_data(dev);
>
> Could you maybe cache the mode in struct keystone_pcie {} instead ?
>
> > +     if (data->mode == DW_PCIE_EP_TYPE) {
> > +             pci_epc_deinit_notify(pci->ep.epc);
> > +             dw_pcie_ep_deinit(&pci->ep);
>
> Would it make sense to make dw_pcie_ep_deinit() call
> pci_epc_deinit_notify() , to avoid duplication in controller drivers ?
>
> > +     }
> > +
> >       pm_runtime_put(dev);
> >       pm_runtime_disable(dev);
> >       ks_pcie_disable_phy(ks_pcie);
>
> --
> Best regards,
> Marek Vasut

Agreed. I'll cache the mode in struct keystone_pcie and move
pci_epc_deinit_notify() into dw_pcie_ep_deinit() so controller drivers
do not need to duplicate it. I'll send a v2 with those changes.

Thanks,
Guangshuo
