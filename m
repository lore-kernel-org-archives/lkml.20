Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1AF497B94;
	Sun, 18 Oct 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327212; cv=none; b=g4X9cQRDdWo5UOXXD8TW0lk2UY0qFWv/Uj/G8zenceOQwaYbXqbZmk1Zi9Pvrg9jWh9POCG/xn0jE4rFGa+uGSRNEuEprI44tbCFGL9fgzGzTI5MINONzD/2/NqgLFMCYEfN16HlHN/Ur8EQCPuWzl5O0ENzpGEcui6ndLVsCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327212; c=relaxed/simple;
	bh=RWdIbcz5wJseY6LFlEA/9107vSddJFDtDUzoZ6hSAPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgaVAi4QRR6wxpHGzxgwCJZyvq/KKnWBRTVAMw56kM1REr2fypxA9SLj3VBFfy8U5YKXem6Pic1FmymsHE84cpnRhdYCLFS0ZuVFH0dWu4bG8P39E6fPWv3BFlqIBBZklrRbjECmBsxPgzQnS2LzFwNa/YOCy5EQdtYbR2hyg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt8UiC9C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt8UiC9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807BD1F000C4;
	Sun, 18 Oct 2026 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792327210;
	bh=mmnv/Skt5HK9P7tABbR9P+/0X2OHL5yfGFNv767t684=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dt8UiC9CThk+APa0Y8FEe5F15uM4Agdfw01ew+hZiESj63eOVYkEZNZkkTPqmSace
	 BinC7t+0ACHrDlZWLP7jjZF3CgZLgv4/r4K1gQHDkY4SXoALIuvwuN58dL2TiaAa96
	 5x7QHtSnrPTp5+NZonTzdNBpinJ1DUznj4rmL8OnUmI32LXjo45atwYySS1vmvs8XF
	 Zxmch+qR6MWF/5ULJldGjYyhna5weeq4QoW52xH1rtIEml3fNFOzRnvH0jR/Ok415f
	 IFF/R4Q0sOWGjgh1DZ6JjMhXBf0XdzoXqlbcHKhzy/c1jlaJ5gS5VY+e6KbHfURQ6S
	 H2NZFK/tceQPw==
Date: Sun, 18 Oct 2026 18:09:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <atS9fkULEWfCbVVm@debian>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
 <asN4I1cpVb5HLNu7@parshuram>
 <asOMP3uJJmdpfvtt@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asOMP3uJJmdpfvtt@inochi.infowork>

On Mon, Oct 05, 2026 at 07:41:52PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> > On 29-09-26, 16:52, Inochi Amaoto wrote:
> > > Add several helper functions that allow drivers to get several phy
> > > consumers in one operation. If any of the phy cannot be acquired then
> > > any phys that were got will be put before returning to the caller.
> > 
> > Do we have many such examples? Phy is not a many resource like
> > clock/regulators... Do we really need this. How many in kernel users
> > will benefit from this API?
> > 
> 
> 
> I guess the following driver may benefit from bulk api. Most of them
> are PCIe drivers....
> 
> drivers/ata/ahci_imx.c
> drivers/pci/controller/cadence/pcie-cadence.c
> drivers/pci/controller/dwc/pci-dra7xx.c
> drivers/pci/controller/dwc/pcie-tegra194.c
> drivers/pci/controller/pcie-rockchip.c
> drivers/pci/controller/dwc/pcie-qcom.c
> 
> Note: I mean the bulk api, not just the things I added. I guess many
> may want devm_phy_bulk_get() or devm_of_phy_bulk_get() instead of
> devm_phy_bulk_get_all().
> 

No. I don't think the PCIe host controllers need the PHY bulk APIs. Most of the
time they need to control each PHY independently in a multi-port setup. So
having the bulk API doesn't seem logical to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
