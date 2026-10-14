Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A73288D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940680; cv=pass; b=tVwzIr2GK0pvFXhyc6FB/F97/ZykehGxYYLeSoEj2mNGoN5+4Fne0X4DAX0E/jyJntUOBdnZzJjGOyQG9gkk2c+hyNvPVtMZ3A96FNLmo4JDWxVPqNZ/aRO5FdFh7FbptWn+T/dKw1IT+h+xpmLk38aV5jH0cTEL/mBGQ6ojYww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940680; c=relaxed/simple;
	bh=Mx8pOrR7NuAhI6a7ZnAXwffRXaDHMNA286y6u6ETCWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMVT9uIILB7HHZmSfZPqea00eVOsBT6R7yAYPrYw7QgOiEgc7MMZJM64nt1wFBk3CI3JYgZgyYMqx021wkF2lKLJPSe+H8vD+pNkk5KvcCi7IbZ+seGxIlob2fO0/1mGNvn8xqL8ZyIo5MndKpkUbHJ0Tn4FX9u6RgKNeMfqPLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnazHBUh; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnazHBUh"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1586439a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791940678; cv=none;
        d=google.com; s=arc-20260327;
        b=q9Pr/ChRgQpZ08B6CyoqtHnWWXo/jhtyPE3y/+yzg3+BRvMT+VXl8YQTDHIWfSj5aB
         o8VmZa66SWM+UqMPRCVm+/Lbz0Zo93uwDBj9iTkQ2B6V9nyYEMvMEypGADQoScKiyedU
         rpuFJLochnBqa9m+9oKQtuy5yeDGqZGuzojeEOIzQWBL+hLCcgjme53p3MRiAbDhxIRJ
         c+1nayIMbqtFf0TAMGu5gw8Yn4Fipt8gT3cmDQ6FULQLpm62YOOY1cUMH+B7yh/vcYnu
         1cDKCPhawqtL7nPhW4mA37oT+h6M9TWigjnS6J74nHD4v3bn/klNUs4/5UbvTNusqAyy
         8ovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        fh=8zOefxsg0wnnz11LDbLMf1Xo0j85KJS62qRr1zXu2oQ=;
        b=sjyB4+EeoBPpJiuteiMHsjoUYWVx7MeEQQ3snaF3sNZA4/84WirX6BjLEAWO6eDFmK
         8ESUZoKoEjC4wHcNZOU8sZcSpiL5UX68RsCNly5x7d52tYGboOBr+/gQzjmV5ZP0m35m
         HoZFN+RGsPPc/QnboWY8znfSjgVvIrM5n/UKzGw59lrvye7Bqo+1CpC9m5rOeEIuvh67
         knCFanAM8bVpokxPDROGoR+GZiWB1ZTHLa5Sk54www59vw8FYIw5MX3u3ma0MAbHhcl0
         OHwEtgu6QvcqE6CV1vVN0pqhoAF4NIunjQjydV3nfSgrUBnXgHUYW2OAEw0s4Qc2sCIq
         FF+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791940678; x=1792545478; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        b=NnazHBUhnMzRroXrKKL1OXMaxJT0nO7epnxwNXNtDY5cHhqa6D5MAzjytzbXbl2K1i
         cK927cmnp/GEDNgm/UC/buVpScS7JxEOVEbG+nOBN60VJXR7FUsb4w22GCpgtyW3JKLG
         P36Veqmd3W6mEzjLWu/E6ChFTJEh0W5ErOGGVt1/rbsqsW1kRXy/kpDw/r7+PQCYINqw
         3sw7Knd8QYFurjEkFLuPoCQAcjRoxOMKSQYij0GYGgPGVDlx6kH+byx1DM0mIQc3XTLK
         u2MYomsZia04C3cbGIWUtAkNAknQWvJGZOz5pu7Td4hwwyVMUcwrkJs3WK4kTOfgFlEx
         uMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940678; x=1792545478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDmST7kAhWIJHCguqYIGPuaIfAHg6uPk1l3Ttc4Z6Hk=;
        b=EXhIPJUIZQ43H+4dx921qgG2u+xKBXSy542LM2SRGbUy+FbdPu1yT6NbyGUsk+2jrZ
         cwM3lBqYxp0dZR4x5iN1r4qDYM/n4f3XUk7pVpFOljoJ3G84hPNQzsf03uaw/vnr3YWl
         kI7rHGjQrkelYSelF+rS2rJwREnZmsdT2KH34Yvx3pcl2FGV8QNd4v58t+OHwRfdwWPE
         OA405Im5RkeH8ioW7CPltDI+zm353jisnwW9LeU9FsXzsimaCATYUd6s36tUQgvgFvZK
         U2tk1hP1h8LEquWQ2Hcgp81V1MCOKsC+Qa4AJppNygoiYNaBbxZbV1KMYcHWlWhDFyW8
         yQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2B+tLvBHec4Tyh2OQkxHMD9Kuq5DeZeu3/qAh4XXxeWXA8HcCuw1ErNybhg4jdgJZWZEkZUWHVgh8jb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUt7PqHJ85HyiIfQJTDnGZIpxQAVQFBhEy5wuUeDicUZTmFvcN
	C0LlKxaOtbSrjTSjmK9KVCI8YjdhE6pHFWoqXd4zL0JFmIEtnulkGkPWmDrSXpREO8CX1YsQiQq
	BavfCtW9tdZYm8yEPRzLSQ3tTnNwb8vg=
X-Gm-Gg: AYBFou0AN005qTa+NmbLOjKOgZmfjVnS68Uu6RxO3FVTupiBp2LZ+kH7N1+DCfZq06b
	RTzYKfUvrItN7RJt121ZA/lv1O4tCuIX+hLeYh1V90+/4uhh0BUyXfMd1rHbtq/WicfLB/pasoG
	k7BG3+2CnJ0hcNDjrHJVu8dSrTsMkIahaISyx2aPyvXdvHm4vDCrnNPQbYcgFCiOF4mBttLQQAE
	EcuYznlDUUGVuHVqaB1HLBiaq8/lKE+Wjnp7XNhLQTcpNemQNEIjHVN/n3dlKe2+INFhdiP1pW3
	AKPMZKjPEdgeFO4QPIppb9NxCnd0ZpoUmQa6oTe3+EDgxRFDl9V98nPK9S++m2FyU3g1Y5p310o
	hjM6CWXedMLYSb4Yy7XdT9+vflEvaOC2A695qaw==
X-Received: by 2002:a17:90b:518f:b0:3a4:b0a1:c7ed with SMTP id
 98e67ed59e1d1-3ab3a90e667mr11772541a91.13.1791940678077; Tue, 13 Oct 2026
 18:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013220421.1588051-1-bhelgaas@google.com> <20261013220421.1588051-3-bhelgaas@google.com>
In-Reply-To: <20261013220421.1588051-3-bhelgaas@google.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Wed, 14 Oct 2026 04:17:46 +0300
X-Gm-Features: AclHuK_e12mFZYv6Pnb8WSqKFNBAW2cZiwmazllPkVxW3EceBwkTGRAJSzPTr38
Message-ID: <CAAsRjRng=D-kP3pakPA=M5k-znYbTj3gz-RGiajnxhS3ymz8sg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PCI: iproc: Use the EROM outbound window on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rosen Penev <rosenp@gmail.com>, Rani Hod <rani.hod@gmail.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 05:04:21PM -0500, Bjorn Helgaas wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
[...]

Thanks for combining them.

Signed-off-by: Semih Baskan <strst.gs@gmail.com>
Tested-by: Semih Baskan <strst.gs@gmail.com>

Tested on an Asus RT-N18U (BCM47081, PCIe core rev 0x01) with both
patches on OpenWrt's 6.18.55, which carries 767012397976 as a backport,
driver built in. bcma0:7 enumerates the BCM4360 with the same window,
BARs and IRQ as OpenWrt's current image (an earlier version of this
patch), and bcma0:8/9 print the two expected warnings (DT 0x20000000
and 0x28000000 against EROM 0x40000000 and 0x48000000). I did not
build it as a module.

For the commit log, here is a version that describes the bcma and
platform side, in case it helps:

    PCI: iproc: Use the EROM outbound window on BCMA

    The PCIe outbound window base on Northstar depends on the PCIe Gen2
    core revision. Revision 0x01 uses 0x08000000, 0x40000000 and
    0x48000000 for controllers 0 to 2, revision 0x07 (NS-B0) uses
    0x08000000, 0x20000000 and 0x28000000. Broadcom's own driver branches
    on the core revision for this reason. The enumeration ROM reports the
    base for the revision present, and bcma provides it as addr_s[0].

    Commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers
    fully"), in v7.1, gave the controllers in bcm-ns.dtsi a ranges
    property with the revision 0x07 values. bcm-ns.dtsi is shared by
    every Northstar SoC. The DT ranges cause two problems for this
    driver:

      1) devm_pci_alloc_host_bridge() parses and requests the DT ranges,
         then the driver adds the EROM window and requests the list a
         second time, so every controller fails to probe with -EBUSY.

      2) The DT window itself is only correct on revision 0x07. On
         revision 0x01, controllers 1 and 2 get an address the hardware
         does not decode, and the first MMIO access to a BAR takes an
         imprecise external abort.

    The window comes from the EROM and the interrupt from bcma. Allocate
    the bridge with pci_alloc_host_bridge() and free it through a devm
    action, so the PCI core no longer parses and requests the DT ranges,
    and request only the EROM window. The driver still reads the DT
    ranges for one check: if the DT describes a memory window that
    differs from the EROM one, it prints a warning, so a wrong dts shows
    up instead of being ignored. The driver works whether or not the DT
    describes a window.

    The same commit also added compatible = "brcm,iproc-pcie", so these
    nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
    enabled, the default on ARCH_BCM_IPROC, that driver binds them first.
    It takes the DT window as it is, so that path needs a separate fix
    either way. This patch fixes configurations with PCIE_IPROC_PLATFORM
    disabled, such as OpenWrt's.

    Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
    Cc: stable@vger.kernel.org
