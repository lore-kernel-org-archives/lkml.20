Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04C51DB1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167315; cv=none; b=q3wqRsVryiArJaeANQAEic9yrtmLhqUKA/GWlXVbdfp6o8pmc8h9wEcV5Woqv+77rLP9I2nsBkKS39Jbr3fNG6TdBLEXZAtJleopWPEQlA0PV79xo8fAeCJCYgJnLdk7BU9fqtDoWotnmdeOe9hly9Dk9YYPJFWYmiVAB597UV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167315; c=relaxed/simple;
	bh=Ek5z0CBXkgwZF8KRaC5oaEvh1V6la5e7M8Pnc1W2ljg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rCPojjqC3clH+2vdEa+17vgLR2XZMp6bGAMyC96q5dJA+CqUlWz+bawz6uLRJnE1PGLMyeOailWBdB7BoIpsX/VMZYvRjhe/RIjAS7PK7DTyJetnhPCzlyHvdHmzsC3tXSiDS0+8Z3OiuSok7l1OAkOVVyaCT6qRO4NW1b+bfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GERPuo7D; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GERPuo7D"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43f9b120so11598427b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790167305; x=1790772105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hZoNf+dKS4ot9QpSci3melFpNehcPk6jWY1Nfe4Rys=;
        b=GERPuo7Dpi/+Eadr1lIQEyBkXwyReGsWutPH2WmAo+j66J2OamPJwOmNqDtj2uTzMf
         a2WVRiy3NQ3QEq8PmID1bryNyQCblDvxaSIwitoYT0Ki10pp+d5PR8ezMqfFRvKFo5gc
         RTCnWv4gXytoCRVVzOUwzu8dZVTS4Kr/+ocGg9NDv9epJaAahPtAx9OMqC75ajFtVU53
         fTe0JTkW/Rfm3YRvkiHC+hGWEVMyPPtNqFCFWPn3aUeyWlJEW67apFkFZR8a7uhSOXIm
         SJAJ755mI30uhu1uSHMDM4WhvCJe38UDEVfiDj/231cFYZPJ4uoPHcQGPlnoDX2oSyG3
         g1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167305; x=1790772105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hZoNf+dKS4ot9QpSci3melFpNehcPk6jWY1Nfe4Rys=;
        b=A26O2zTIY30O+GBhvALiblRImm/oh8143UFlIU3x+i1/3Ic34fn4G3k4bImJfnvOCM
         far9wTfrCFSeZM3o+pikmmlcpNWZY6v87HMBXyWhTHuUQNBZHOZjOka6UHEJC1B9Vv+O
         /mjiV7GSzH2FTz70aeHUYB8/+Cqif5rD0TvdfBpArnYl8QP/rNX3qOT7PCVZmZOtNg3m
         2tbifh4chN9h447h4k0osyczmZrSUbZgGU+lhXshaMDD6Vkv9HZO2o6zBUhnsOiHzwtg
         c01sKrRSUO3Q2zkx2crQGQ0p4eBtCSOH7QS8e1wcyHJypdfv5egCrlvKZxVHvKN1XtDi
         Kxlg==
X-Forwarded-Encrypted: i=1; AKwUvByEp8imhZA8BIH/ECzZnoc0dUMQu9NHYskLlNAtu2SwaZD3VTEos/cAYh6M/DPQG1QXLzqaiiZW2BYnke0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqpnNK0XlsHRWxnSySOD9L6XN0j6T6SdLcbmnVGb/TYBh5qhwm
	KdvH5Yg0BfvKA4+Rhun4DjfqvWTspSGNNo+QpHrk24Zfb5/4uuYJL22J0cW8MSLFRhg=
X-Gm-Gg: AYBFou1tzy69Z6rXiEbv9m1XjT2SK0qMU0jkhUvtib51RIFOriuTr+RDlLUpm/o8S+g
	dZwPqlYIxwTuapGeN2dcAiDWkJeDGSjr+qsEpXuT/5HD5LNrjw3Iv45H8gI0tTy85QGE3Lu/AoQ
	+xdbXIbwarlrqkfcp99jFn+UeNOaxgzsM8B9OirhLucwN3BEZ084oWzsVlmzhokmIfnQCpZ5UBc
	gWQjUbadVDuegZCPJ9fvquA3CQl8/vCpYXB9/PrTN3w7d4KT9eVV4TQtOfbLXPzwuMlenuvlAVd
	2H4JKUNDeguiTheBhRZkkjPUmsrG8F8tM4unltVympLbzAEuM4iujQy3M6HdrUhRWEJRTd9BXFO
	T4JxglUk07YqeNk99B2bblOFvBR2UY+fung63WlU01tkK6QZhFtf+SJU+m6MQAYnzslZOPJpOJ7
	YXxwz0kr6Nx/wUhSqnYlrq0BwXkKczBekCV9JgIvbJ3R/zI7eT9w6WgNy3WEeZJ39rFtqRsEcIP
	CtmlHMbnQ==
X-Received: by 2002:a05:690c:387:b0:89a:63da:fab1 with SMTP id 00721157ae682-8a45d0f0b06mr12154097b3.108.1790167305206;
        Wed, 23 Sep 2026 05:41:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c484e65sm19343386d6.48.2026.09.23.05.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:41:44 -0700 (PDT)
Message-ID: <484e967e-a8b3-438d-a2c2-2bcc45ff2ca1@riscstar.com>
Date: Wed, 23 Sep 2026 07:41:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] PCI: of: update endpoint ranges dynamically
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com
Cc: lizhi.hou@amd.com, herve.codina@bootlin.com, andrea.porta@suse.com,
 daniel@riscstar.com, mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910021919.3421449-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20260910021919.3421449-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 9:19 PM, Alex Elder wrote:
> A PCI endpoint bus is a devicetree construct that allows a PCI
> endpoint (function) to have sub-devices defined that are accessible
> in an SoC via the PCI endpoint's BARs.  Such a bus is represented as
> a devicetree sub-node for a PCI function having the name "pci-ep-bus".
> There can be one or more pci-ep-bus nodes.
> 
> A PCI function with a pci-ep-bus devicetree node must also define
> "#address-cells", "#size-cells", and "ranges" properties, to specify
> how endpoint bus addresses are translated to the PCI parent bus.
> 
> An endpoint bus address has three cells; the first indicates which of
> the function's BARs the address is associated with, and the other two
> specify a 64-bit (2 cell) offset within the BAR's region.
> 
> BAR base addresses are determined dynamically by the PCI enumeration
> process, so generally it's not possible to include them in a static
> devicetree file.  When this addressing scheme was introduced, this
> was not a problem because the devicetree content was generated
> dynamically--after booting--based on the information (including BAR
> addresses) available following PCI enumeration.
> 
> It is possible (and in some cases, necessary) to define the devicetree
> nodes that represent PCI devices ahead of time, in a statically-defined
> devicetree file.  In order to support the PCI endpoint bus model in this
> case it is necessary to dynamically update the static devicetree so that
> the BAR base addresses assigned during enumeration are reflected in the
> endpoint's "ranges" property.
> 
> This series implements that dynamic update, leveraging the same code
> used to create the "ranges" property when PCI_DYNAMIC_OF_NODES is
> enabled.  The first patch makes an argument to of_pci_get_addr_flags()
> optional.  The second patch separates the code that dynamically builds
> the property value into a helper function, and the last arranges for a
> statically-defined devicetree node for a PCI endpoint to have its
> "ranges" property updated (if it includes a "pci-ep-bus" sub-node)..

After some offline discussion, I have decided to slightly
change *when* the "ranges" property will be updated.

The Raspberry Pi RP1 device defines (statically) a ranges
property within the pci-ep-bus it uses.  It maps BAR 1 to
a base address 0x40000000, size 0x00400000 range in its
parent endpoint's PCI address space.

For the original proposal, the ranges property is replaced
for any PCI endpoint devicetree node with a pci-ep-bus subnode.

Instead, I'd like to offer the option of defining a ranges
property that does not get replaced.  This way, the Raspberry
Pi RP1 can continue to work as it does now.

An "empty" (no value) ranges property doesn't work for
pci-ep-bus, because it will treat the upper cell of the
parent base address as a PCI flags field; pci-ep-bus
instead uses that cell as a BAR number.

So I will be posting a new version of this series that differs
this way:
- In of_pci_make_dev_node(), if there is no existing device
   tree node:  no change (create a complete node dynamically)
- If there is a preexisting devicetree node but the current
   device is a PCI bridge:  no change (just return)
- If the device node in of_pci_make_dev_node() is not a bridge,
   but there is no "pci-ep-bus" child node: no change (just return)

- (New) Look up the ranges property in the devicetree node for
   the PCI endpoint device.  If it is not "empty" (i.e., if it
   has an assigned value, as would the Raspberry Pi RP1):  just
   return (do not change the ranges property value)

- OTHERWISE (empty or perhaps missing ranges property), call
   of_pci_update_endpoint_node_ranges() to create a new ranges
   property dynamically, which takes into account the assigned
   BAR addresses for the PCI endpoint.

					-Alex

> 					-Alex
> 
> Note: this series is built upon these patches:
>    https://lore.kernel.org/lkml/20260908213459.2519059-1-elder@riscstar.com/
> 
> The entire series (based on v7.3-rc2 and including those prerequisites)
> is available here:
>    https://github.com/riscstar/linux/tree/outgoing/dynamic_ranges-v2
> 
> 
> Between version 1 and version 2:
> - Included the first patch (which was previously posted in a different
>    series)
> - Modified the last patch so the ranges property is updated only for
>    PCI endpoints having at least one "pci-ep-bus" node
> - Rebased on v7.3-rc2 (and the prerequisite series)
> 
> 
> Version 1 is available here:
>    https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/
> 
> 
> Alex Elder (3):
>    PCI: of: make a flags argument optional
>    PCI: of: introduce of_pci_build_prop_ranges()
>    PCI: of: introduce of_pci_update_endpoint_node_ranges()
> 
>   drivers/pci/of.c          |  89 ++++++++++++++++++++++---
>   drivers/pci/of_property.c | 137 +++++++++++++++++++++++++-------------
>   drivers/pci/pci.h         |   1 +
>   3 files changed, 173 insertions(+), 54 deletions(-)
> 
> 
> base-commit: 857c3561ea9f2c3107b5c6d830d3b3face159cbc

