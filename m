Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400051354A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748733; cv=pass; b=shdKzU/CUx+UmVGPIizziN+2McUKe4HCZ0NUFASa689hIS9SyUI0EsOB2yvEmLibGOwE51jeH8O7llk6Up+3oly7YPAjS+o8VVWVXJqbFIAcQiHK/m4xX4krQhya1kwD65FBFZBXSds9N3NdQmOElnpdUfMmH1+Hv67CXE/+RmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748733; c=relaxed/simple;
	bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMMAQQTP39JN0S6wE5Sf+pjzK7Y6PMj9GdAfGPyPYyYvZoytKQNIuA5aExmrzsBCUe9WrVpCAlmScl3xiJoHgK5hlCBnmQ9rgjtvGEJkH1rw8DFOXOZCTrMMm0z7Kz1b9Jd8vqizcgjPo5ow7DnvJCCUXRboaN8HPhKNmvPKjk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI1WO8Rn; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI1WO8Rn"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c4so926611b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789748727; cv=none;
        d=google.com; s=arc-20260327;
        b=XV6ANQaDMfxS1QcuK6VM8AS4Kmm1839mSVFLSrELY76Ep5d9ixbmnNLjGuozzQgAzJ
         J/V4mhXwLy7+hAqGMrFDRmKMa28LVFXF/dDuWmyGztPBHOmGzYZa7IhY5q2sX7qeub7s
         5NjIUjUDTYaaSNfakAVv/GY9yHPcieu7tOTHcXgIcwa5gDV+yWqFCfSLuz/qfoEOCgHG
         i/BA0od2UL8kUC9RgvZJ4cXdmpwkCT6hvVEi4+ObuPWtGHRLrDt0kiAJexKcWihAHy3s
         d/pJv0Le6c1vDbHX4XfKeCNHqmUm0khrpYGoKtKr4Uy1SnXp1EfxPz4ccrDKnFCCw4cR
         LtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        fh=qtKGxT5MK5YPRFObbgRX5XGBLJLi6OeaM6DA1pAMJko=;
        b=RHvMPGlFw/r6bcs1/zpHGWdZzIStALY8bCD/dgmQmKMBbZYnzYE3kXXAIdto9OpIGT
         at/TJL+8tnQrtjPZi84YlHJalVMv+niSWmtdp26kVdgL6mcShUHSXj4sQJ8HPfBOOIFT
         kDTbnRHnneClX63c0BrUM+WqT2sDQ67wTX6IMT9Q1Mtk6glzA004tRxolzzfQDBn4U5r
         SkXWfLu+eAlCGswGhQPxdkcylX08J/Fhb5jJzECPQ4knaM+mXgvHdu+9X3k23Zzr9IlS
         wp1vpHF1gpUUFXwVvYDbdibHI1P93tFLUBktme1w/48hkzpMPWFB5KzASJFkYya/AsL5
         bkKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748727; x=1790353527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        b=eI1WO8RnyeaXYWPeAUTKIjLT3bgSWi+jNhYoEh9QcvBhvZZpQq0aLd5paJZkAg1ph0
         QZQcQ9KT5EqZAIZFvDZCAbbjl+olq+OrLjSkOYm/iL0Cov1CLAkZ1gMHSS8a2OxJWrzp
         84KfPDVYUK2clwshSAdrCQDGvLYxC+H9eTuJZAV0u6/8ney9Nv6kZNmKJvjlRAwh9fmG
         gXL6L8DGpW9tuxTe3MMS4gjbaRk6CRt8oj5OJkQQ634alkWnTUcQkMKEYo6eQ/RAwb6e
         zWXpqVo7rAsNeG+7IRpUNgd8thuTKeuMm5iQKTKGwo/KZ1xjD2dVJkpY1LcgfmQNlblx
         Rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748727; x=1790353527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        b=u+InodZche//L1Q3xSxEJtNg7+cZxUOtk3JGdIxSLj/o88onRc+9w/oBfqYLAEcapq
         gMpS25v/x777ZGESgXxVnWCOT+keEdnb/iP3JvT8SlWBQPFVWM6ItkycEYLpWK2I32Zb
         2zMG9Z9DOE//gxvgKI89gvsx9alCBaVmZdfWgpp3Aza04TK4iXun1zYi9tSGmEmdYDFL
         q463c3JMxqAEOFqa+lcJJZP/09cYQMqx2iOI55jaAUdxUtkS8qF46+KvMS5C61QVvfOh
         tA4jYFR6Ttx2wANGZfsjkYs59WIcGLFKZtb5vQ8TsdM1fzWsYMillNWgeZTBaVWryYVv
         OGIg==
X-Forwarded-Encrypted: i=1; AKwUvBxvsuAKevdslvoM0xK9NWZSoxPnwR3yuiUhWkAkqpBFdk+vHWyBGsP94yiUThX6ZsRlZNQv06oKcgwtbNs=@vger.kernel.org
X-Gm-Message-State: AFuF++kgXagMqZrFCbW1IZscc7LDbA0PQPBAh0+CZPwKjGv0NuyvEzck
	u8oUdnqRdffrm7jpDJX8hxjaoGj0/rQmHOanFavVsuEp+CSlkswHsSFmHIkQc0QYI+sOsnEXvWg
	gtacC1Y911Nf9pJX6vwdhUwof6PRMZCU=
X-Gm-Gg: AYBFou0u2n3ckFcUQnVytVCmMrAA96rV8L66Ux2BgYKHKl7FYUDwy/HIprdizWONuD9
	X97wWwQC71qBJl14AxszmZlAfpF6ZzLph1dKAqRaFJCKog2IPyCK6Gx8ynuVMSA6T5VQPZ/8v0t
	rnQwV9JpH6hOWeqRTVQAJFP/zW4XeSBAP8H8GlInVlxBOsI0N4sfBxFXhmdYl81b5HxGmnOqyX+
	qytMQkGruSdrQB8mHEDhhGLq1DgkD2s5/hKefhZjO1X84SPtpZX4g2FaNrMR7JvCsU+E9zJB8Vh
	vM7ZoUIqxlUDQgDsyJYB/kwO+dbb8Bh6zWc6Ob//zsG6sLIZBLJsIkwycH8ZyoqLFhYBURlHhYD
	UfMCb2Oefz78DIw9BjvhL4J3vm7KaMzVB0dM=
X-Received: by 2002:a05:6a00:13a7:b0:872:20f2:3287 with SMTP id
 d2e1a72fcca58-874dbeee762mr5939157b3a.10.1789748726761; Fri, 18 Sep 2026
 09:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
 <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com> <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com>
In-Reply-To: <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 18 Sep 2026 19:25:12 +0300
X-Gm-Features: AcwNN1VOh8d_2xmEh01oZ9EcnHO1v-ja8QTE4DnWV1Kfj81LBJx61PkF6VeulFQ
Message-ID: <CAAsRjR=sHgZMgXuTid+D7Vst=N_GBUZUrduZ4YZax5rbotHNMg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, bhelgaas@google.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rosen Penev <rosenp@gmail.com>, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 18, 2026 at 12:32:12PM +0200, Arnd Bergmann wrote:
> If the DT window doesn't match, how does the bcma driver find
> the device node that corresponds to the EROM entry to populate
> the child nodes?

By reg. bcma_of_find_child_device() in drivers/bcma/main.c compares the
first reg address of each child of the axi node with the core's register
base from the EROM. That base is 0x18012000, 0x18013000 and 0x18014000
on both revisions; only the outbound window differs. The pcie node's
ranges is not looked at. The reg is translated through the axi node's
first ranges entry. The PCI core then matches the wifi nodes below that
node by devfn.

> The driver should probably check earlier if the device is
> already bound to the bcma bus, rather than just trying to
> request the bus windows. If anything, I would have expected
> the conflict on the 18012000 address for the register
> base.
>
> I see an ioremap() of bdev->addr in drivers/bcma/scan.c but
> don't see a corresponding request_resource() for it, so maybe
> an easy fix is to add this to the bcma bus scan and
> make sure that always happens before the pci driver probe?

In the tree as it is, neither side claims the register base. bcma
only ioremaps it in scan.c, and pcie-iproc-platform maps its reg with
devm_pci_remap_cfgspace(), which does not request the region either.
That is why the window is the first thing the two collide on. On the
ordering, bcma_bus_register() calls bcma_bus_scan(), then
of_platform_default_populate(), then bcma_register_devices(), so the
scan is done before the pcie platform devices are created and the
bcma core devices are registered after that.

> If a board has nothing connected to one of the host bridges,
> why is the pcie host bridge still marked as status="ok"?
> Do you need a driver to put it into low-power mode, or
> should this just be marked as disabled?

The three nodes are in bcm-ns.dtsi without a status property, and no
Northstar board file disables one. Which controllers carry a device
differs per board: the RT-N18U has one on the first, the R8000 on the
first, and on the second through a switch with two radios behind it.
bcma takes the cores from the EROM, and bcma_register_devices() skips a
core whose node is not available, so a node marked status = "disabled"
is skipped there too, and neither driver would take that core. I do not
know whether an unused core needs a driver for power.

> Does the platform driver reprogram the windows to match the DT
> description, or does it rely on the boot loader to ensure they
> ranges/dma-ranges properties match the register contents?

It programs OARR/OMAP from ranges only when the node has
"brcm,pcie-ob", and the inbound side only when it has dma-ranges.
The bcm-ns.dtsi nodes have neither, so it programs nothing and runs
with what is in the registers at boot. The PAXB_BCMA register table
has no OARR/OMAP at all, and the bcma driver never asks for an
outbound mapping, so it does not program them either. OARR0/OMAP0
are in the PAXB table the platform driver uses, at 0xd20 and 0xd40;
I have not written them on revision 0x01. Broadcom's 2.6.36 driver
writes OMAP/OARR 1:1 from its own table: 0x08000000, 0x40000000 and
0x48000000, with the last two replaced by 0x20000000 and 0x28000000
when the core revision reads 0x07.

> When using the bcma driver, does that update the ranges properties
> in memory to match the EROM contents?

No. 552aa843e4c5 drops the windows parsed from ranges out of the
bridge's resource list and adds the EROM one; the patch in this
thread reads ranges only to compare them with the EROM window. The
property in the live tree is not touched, so /proc/device-tree keeps
the dtsi values and the mismatch shows up only as the warning.

Best regards,
Semih
