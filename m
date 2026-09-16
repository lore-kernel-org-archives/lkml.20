Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674F456E08
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.146
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546372; cv=pass; b=GHHUfyI9QW6DvBfmJXWdyfiH5gNVYpv5Jv2Tv/ZSgFYTIo0E41vMW1ioBQMiQhbe2jh4iMJLCgXx8BYqCuw63z3q21+uIHInWkL4nxDFQn572qAg8wr9b/zDjI0ryiPyc3sT5PhW9b13au/M160eQb50q9yBTenelZrTYSTZ1NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546372; c=relaxed/simple;
	bh=vtzklOp5Xc3g/KxmtFeZ6TN32AvYKrtilRPIXnxGc48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKPeSxxlyFrA2S3C9WZePXXvxvtQsPrXjvfI/LqwsVqI6+cRPeJTm9AL6PSlAPtZY9wZlcKoDUoWapVu4ySSIKRX1ZmmOUg6FQyZ8XM4J1IFXkcjlAVv6Xf/FLBMx7k1HikJzuGYM3OgErkbK4zRPcBdwYx2i1Hwyjsbj3D6Fn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb3x2UBy; arc=pass smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb3x2UBy"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so4328765ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789546360; cv=none;
        d=google.com; s=arc-20260327;
        b=BSTrMv3K/LPlI+l5IhpC6inToprOKC/7Z85xaxuJ3CNB9LyipCM+TvobIvPCOBPQc7
         yWzptyTTgp0JI811RNt2+T1i6IqxBI05YzjuL2hFomXW4a7jwiQ5CMv6OA96niTwluBF
         wyBJVbtMKHdmB8uPMIkSRffBFOM93yOSwyw+oLWMpR+TGayjUs0YtiqPrtI9zUuOrn07
         MscUCLUyYrJdENXTzTz7aTfaJOoXKSeFgtMdK2K6keT92EnCeNOnHPBsNVwK8Tzg7JS2
         pe9TF0ed5Jsz6SJvM1ik0lZOnITMLz6ZPX4AZQZSezwgtt8rlAwuzvFfq7DUFILgrk6d
         QqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        fh=j8L7/yxrXryiCXeofth1GU9F+e1rJlX3J6VjA8ynTmk=;
        b=VmWXu5NkN2obWoBFQ1FujwNZbfICtIHHWF7RKqG1krSPj3pnj1GPHFHcyAG7YGAdsp
         EBTGdM5o986fldwyXaCtrStOh8bT7ci7DqNwd3XGk45b2/8duaEIUyjbis6FcxTPFJtK
         eDdEeKe46S6fLvZbtI791wEDmuoB/uywtBq6RmxhqeUvImvKynD6lL3RHKs8l2zUtfYP
         TYTqyL5Cun+/KQExvrVhPOWlQff5oqQKdSaFCDt6paLjNPIHojNgehfQ4Yq3D3YIWjla
         jKnWt5U0AS/uIO2ToKPo+anQx8q1YNPdMcAgP9y2dHQ8SvaEkRyyh6Z6d20IklrgG656
         FoUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789546360; x=1790151160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        b=Mb3x2UByLaiTS1wbzyN1Js7JSTj+P1dZX3KPIYnsVv6Uyr2KWXxiJvTfE7QZeCxieY
         Zr6wfATGgWXv99wkpMrpJeTdsaZ+Ut/a+GdWm1BARW0SPtUE2ioIajmSe0S8HKeIZE6c
         C769V7A33EBQHBS5DzkWi4614teS1BUhah+1LpwUd/kGWAwhkd8A7URpVK9dG4VtPCKw
         Wvz8zcGUI2FXxSJizx+xDHd6h1O7dpVAW4r6QMxLDvIKQpjeffbTG278eIZsnQXUcOeO
         aFVuFbZnvMR8MgF0AOj2bMVeUPHpQsgDn5Ap3dbqHZkcJ9V4/x2pFStrP3osuVXwrYYU
         sO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546360; x=1790151160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        b=O9Mc4QZrLB+ImKNoh+Fh5owgzQJ0zRFHQkUZucVtaV2VN2dGKgPY4MSsZeYdYssBlF
         GD5akOq785NYb0FQO9babmjU9nbS+3bz75ZHsaOgoosIS4URWWkh94XPag+ime5wcecN
         6cxb8Na686N0vRFYFZfZC4zC1DXakR/jSkZHYKQ6R3xcfULwyYaXtjDqdAseMHTniS13
         xKhnEtVglfiXI0MruUtaXIzJcRp3db/Pq80KWsTCksigRld3w5lRWLcXRra49UZX7otC
         O8ch4ZhyMmRS4/5A78ekmA6iHCJYw2XjY6+axX7W/fI1pj4qsKGugjmKfN/ILNNcXPgx
         mPzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlWXtOl7Kfv6jxZ1DHeIKokT4Be4bofGuO1mGkdovxVNSQpJCYE4ZmtNqOXktqWJ7pOQ2Y4hZp/zBscU8=@vger.kernel.org
X-Gm-Message-State: AFuF++mML6UYXhVicWOmJ8Bqc3uyMKrK0SzNvpDzV9VUce7jZnztMLii
	OVtfK3gxQ251inQhFvg3yGihYAIB5xziYVSlGrL+6hctrIDcT7NL6y4zFjdLyu+EmmDPGaxawWK
	CUI/FPy27zH99bPPi9mvVucpSBpLJHvU=
X-Gm-Gg: AYBFou3t5Jc+MSL95LdiXn6GYWr056HhOqqdLflj+9w06hyUp4ZxGFvUGcQR6Zy2Bxc
	xs8nfIWoQ3PEo+aemKWZxbL0xfJrf7ZB06n2c6ZGunQGTMPlhXP7/KQSop+gjMCU57qI4Z4ppL1
	3VS+ehh5g1Zig4u4oRbIpk1SllA/3m/cH7yzDXbQQWl6YWK0aWb8yvH6UtUHzn6tjy26mWTs+bo
	8lPiL4qF2z+Ku1GFrVAmfdRJNDAhODe3x2kK3Ha75OynvQzOnseFVeB10ZjjIhRgcReriHMtbp7
	5YYlA5siZSlKQ77EuQmMOjQ/isi5VReQ81en2452b0ANhbLETSLLKj4Bxl0BZa19y/GpK/XgwgA
	2FHFHzIjQOTGmufEAoE9FXExyoqfCFiArz3l2ht5gGUQ95M8k
X-Received: by 2002:a17:902:f787:b0:2dd:4070:8f5 with SMTP id
 d9443c01a7336-2dd8e75ca6emr35576805ad.21.1789546360033; Wed, 16 Sep 2026
 01:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912043626.437-1-strst.gs@gmail.com> <20260914174624.GA663242@bhelgaas>
In-Reply-To: <20260914174624.GA663242@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Wed, 16 Sep 2026 11:12:28 +0300
X-Gm-Features: AcwNN1Uc845XdVMCaRf6nH7tbJM_-GdS3-1HqZH4tFRgRtiorOZOnG7_uldSdsw
Message-ID: <CAAsRjRmur6jr6mOt4ifSc7DA3k7z31qZ5AWwoJ2qK8qV26eqpg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com, 
	arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2026 at 12:46:24PM -0500, Bjorn Helgaas wrote:
> I guess this goes back to 767012397976 ("ARM: dts: BCM5301X: Describe
> PCIe controllers fully"), but I'm confused about this.  Why are two
> incompatible devices (rev 0x01 and 0x07) described with the same DT
> with address ranges that are wrong for rev 0x01?  I thought DT was
> supposed to be matched with the hardware in the box?

Yes, it goes back to that commit. The PCIe nodes are in bcm-ns.dtsi,
the include behind bcm4708.dtsi, bcm47081.dtsi, bcm4709.dtsi and
bcm47094.dtsi. Before 767012397976 they had reg and the cell sizes
only. That commit added the compatible, the interrupt maps, bus-range
and one set of ranges, and widened the axi node's ranges to the same
three windows. Its log says it was tested on BCM47094 with the
platform driver.

Both revisions are the same PCIe Gen 2 core, BCMA_CORE_NS_PCIEG2, and
pcie-iproc-bcma matches it at BCMA_ANY_REV. The difference this driver
meets is the fixed outbound window base. The first controller decodes
0x08000000 on both. The second and third decode 0x20000000/0x28000000
on revision 0x07 (BCM47094) and 0x40000000/0x48000000 on revision 0x01
(BCM47081 and BCM4709, measured). The values in the DT are the
revision 0x07 ones. Broadcom's own driver in the 2.6.36 vendor
kernels, arch/arm/plat-brcm/bcm5301x_pcie.c, has 0x40000000 and
0x48000000 as its default table and switches to 0x20000000 and
0x28000000 only when the core revision reads 0x7. The enumeration ROM
reports the same base per core, and that is what the applied patch
reads through bcma.

> And I guess I missed this part about the platform and the bcma drivers
> both trying to claim the same device.  That seems like something that
> should be solved somewhere in the bus drivers (platform, bcma), not in
> pcie-iproc-bcma.c and pcie-iproc-platform.c.

Yes. Both drivers have bound these nodes since 767012397976 in any
build with both enabled, and neither the applied patch nor the
follow-up changes which one binds first. The follow-up only stops this
driver from requesting windows it never programs. It is in the commit
log because that changes what happens after the collision on revision
0x01, and multi_v7_defconfig builds both drivers (both symbols default
to y under ARCH_BCM_5301X). OpenWrt builds only the BCMA one.

> Why is this not a problem for other BCMA devices (bgmac_bcma_driver,
> b43_bcma_driver, brcms_bcma_driver, bcma_hcd_driver)?

Because the pcie nodes are the only children of the axi node in
bcm-ns.dtsi with a compatible at all. bcma_bus_register() runs
of_platform_default_populate() on the axi node before it registers its
cores, so a core whose node has a compatible gets a device from both
sides.

The gmac nodes have no compatible, so only bgmac-bcma binds them;
bgmac-platform matches brcm,amac, brcm,nsp-amac and brcm,ns2-amac,
none of which appear there. The usb2 and usb3 nodes have no compatible
either; bcma-hcd claims the core and populates the generic-ehci, ohci
and xhci children itself. b43 and brcmsmac have no platform
counterpart.

> Is this another consequence of using a DT that describes
> "brcm,iproc-pcie" controllers that don't match the hardware?  Why
> don't we have different DTs for these two kinds of hardware?

The double claim comes from the compatible. Revision 0x07, where the
DT window matches the EROM, gets the two probes as well, so the ranges
play no part in it. bcma attaches the node to the core by its reg
either way, and the wifi child nodes in bcm4709-netgear-r8000.dts hang
off it, so both drivers see the same node however the ranges are
split.

The DT is already split per SoC family, and BCM47094 has its own
dtsi. The shared part is the include. The per-SoC files can carry the
window difference; today they do not.

Best regards,
Semih
