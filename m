Received: from mail-qv2-f29.google.com (mail-qv2-f29.google.com [74.125.230.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42B93F6C2A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288691; cv=none; b=Vp+8CR9A1Pv5EkBMxOM8pA4ikJKyCcKd7JrguDBo1WDNOmtDZx/nTzUMsiokNfFd7TKd9Xi8YokkP89Cc/sgjAJspkT5S1UbMsIvwCjGAhhUR4KYdIe+2ZMIJlxVytrMfziMEhGAvbWaSEkcsV1wrJB7b5zVelzrUYVE5QdV/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288691; c=relaxed/simple;
	bh=ZdWlOg2k4wxwvxy1HHMmM2VbraDjgj2FEzkLGTct57s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/dIStK5BTy26sz/EAACsdRljOufpRsi+UypantWXnOwW9ZPmMhTagUp+3ou3IpR2LUE5vhhut7qSYPqxaqQzqomsIA1btF15IU0HWYCzf52ihpL5J+75RACF6VS6ToZtNFxesBRhOmB4YQrpvZb8J/1qDycwr+24rBK/lbpx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=s91mQQyH; arc=none smtp.client-ip=74.125.230.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="s91mQQyH"
Received: by mail-qv2-f29.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso3292916d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790288688; x=1790893488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d3roQUV6QY6LJLrYwiArT/fpcpm+0hr4Nw+vflAtJ4=;
        b=s91mQQyHhYS+HMZgdDRfd8/mRcV2rYaGmb6Fl9jGeDBEzk3Hv8WBLz5HFRaqqz9H4p
         1aJvy8RNIlGAGyOy8cCV1gK+hoBQzdvcEqjQONkLKyirR1RNWenqxtwXu+X9Hahz90XY
         zIvA45X9kS1EsW9OB+gH7aH1GCTC9oQiitKqfPDcROjBy4txzKIdhbwwLpWS+u3t5Etg
         W9gV0lOuj9AdADXltV4ajrvnpnzZ3hUNihTWwILv01knJ7jlVGz9wjobM7OQm3XMd5gG
         1yHIKv16a482pLo8gcdcd8pvpIFtYqVH0n6+k1W6tOa4OUcOaR8PsXFEigeJ1p4isTV2
         AC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288688; x=1790893488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d3roQUV6QY6LJLrYwiArT/fpcpm+0hr4Nw+vflAtJ4=;
        b=btO7rDVnmaI6txu0KBWqnZPZPvbFu47SD0+dRJpuDhZGIAB+SsNsMLwER770LCzAXG
         iTVjBkvx5+Rb7Q3mZQEmUpqz7tVx65ynODU52iSII3jF7K1s0xan2ab2Hcggs1k6TORv
         +9tueu74/828SDAwRnH9++1tVGbBX6BVrPAtkC9fSu2GX63nmr32TBYYN07rNRGiozh7
         YJtbws8M4oZ1eanoHwvfsUuT9CCi0+dp0yzqx7qrqMxMbCr5MQ2/pDJu3cK0tovaUt8T
         YgTUvQY2gE/Ev+l7kb4adOxIHIYzYSqKDEbO96Z0jtUhgwxHPS9UGib38p3M46URYMpQ
         sY9g==
X-Forwarded-Encrypted: i=1; AKwUvBx5zeZLLTPTklDF3hsrAX+Did64dIKkLbTB10BFi7mUGsjrUTTqLOAKLDaGfd4WhBFeo0aS7yPM4ulqSUw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4Yz/RPA+paAeCdM7raIDY7tOlobwqHW93RtugzOIuDRM67bEx
	Atp7cAgMXQb/GFxYaBUDfvOechbpYnjsTYL96wQkBLk+iyFG5CVZIXVU/q4LMk2B6e0=
X-Gm-Gg: AYBFou26RBzcLvEURC6tLGqYv6RWoTE/+MRki0I+PLRPjgTe2RzqOnvNv+YxqGYD4II
	G1xYRX/Q0fF2PyEa61ahbZ6dsAYB/fD7kJ1IH820NtXC4YNuu+hGXSdmxXW6nHuK4vJQQxQBPvB
	Vvr4K3V86iQ7/NH9aevjoz3bynzKfwiYpA+piY19ZySEN25PX/Z6AnSZoQpwCHyXIZq7es0Bf5L
	ZzU8GqNDJO7OPfLqc6unfb8Im4XkxBH3ChhNmmotbSVDo+SmKf9A8bAp86nSLdvTFcIQw8arPF0
	g1vm3BtDO3mlbRNMiA4tWhqinjtEiL2VnPqpAcLvGAWhzDB8m4UAbzXr66991uoQeM948NFMkNy
	0s1QBrP+ZpkPHKnUaIRcsc0yffmzeIVaAhpWQDmB7eno9j/Zb65zz18gm/kjAV+F4Ikm3PFdryQ
	Q97VgRnUTkPipbZ8g03LCCpYT84svtFoK39Pocb+mur0FU3BR/6VmBScxsaS+98s8YHOVeJscWD
	fY=
X-Received: by 2002:a05:6214:5b08:b0:910:3453:7d8f with SMTP id 6a1803df08f44-9142f91cbe6mr13728836d6.36.1790288687772;
        Thu, 24 Sep 2026 15:24:47 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430eaf5basm3516496d6.44.2026.09.24.15.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:24:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com
Cc: lizhi.hou@amd.com,
	herve.codina@bootlin.com,
	andrea.porta@suse.com,
	daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	mani@kernel.org,
	robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
Date: Thu, 24 Sep 2026 17:24:40 -0500
Message-ID: <20260924222444.1351466-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PCI endpoint bus is a devicetree construct that allows a PCI
endpoint (function) to have sub-devices defined that are accessible
in an SoC via the PCI endpoint's BARs.  Such a bus is represented as
a devicetree sub-node for a PCI function having the name "pci-ep-bus".
There can be one or more pci-ep-bus nodes.

A PCI function with a pci-ep-bus devicetree node must also define
"#address-cells", "#size-cells", and "ranges" properties, to specify
how endpoint bus addresses are translated to the PCI parent bus.

An endpoint bus address has three cells; the first indicates which of
the function's BARs the address is associated with, and the other two
specify a 64-bit (2 cell) offset within the BAR's region.

BAR base addresses are determined dynamically by the PCI enumeration
process, so generally it's not possible to include them in a static
devicetree file.  When this addressing scheme was introduced, this
was not a problem because the devicetree content was generated
dynamically--after booting--based on the information (including BAR
addresses) available following PCI enumeration.

It is possible (and in some cases, necessary) to define the devicetree
nodes that represent PCI devices ahead of time, in a statically-defined
devicetree file.  In order to support the PCI endpoint bus model in this
case it is necessary to dynamically update the static devicetree so that
the BAR base addresses assigned during enumeration are reflected in the
endpoint's "ranges" property.

This series implements that dynamic update, leveraging the same code
used to create the "ranges" property when PCI_DYNAMIC_OF_NODES is
enabled.  The first patch makes an argument to of_pci_get_addr_flags()
optional.  The second patch separates the code that dynamically builds
the property value into a helper function, and the last arranges for a
statically-defined devicetree node for a PCI endpoint to have its
"ranges" property updated (if it includes a "pci-ep-bus" sub-node)..

					-Alex

Note: this series is built upon these patches:
  https://lore.kernel.org/lkml/20260924150222.1179235-5-elder@riscstar.com/

The entire series (based on v7.3-rc4 and including those prerequisites)
is available here:
  https://github.com/riscstar/linux/tree/outgoing/dynamic_ranges-v3

Between version 2 and version 3:
- The ranges property for a PCI endpoint with an existing devicetree node
  is only updated if its ranges property has an empty value (i.e., it is
  "ranges;", or is not defined)

Version 2 is available here:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 1 and version 2:
- Included the first patch (which was previously posted in a different
  series)
- Modified the last patch so the ranges property is updated only for
  PCI endpoints having at least one "pci-ep-bus" node
- Rebased on v7.3-rc2 (and the prerequisite series)

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/


Alex Elder (3):
  PCI: of: make a flags argument optional
  PCI: of: introduce of_pci_build_prop_ranges()
  PCI: of: introduce of_pci_update_endpoint_node_ranges()

 drivers/pci/of.c          |  94 +++++++++++++++++++++++---
 drivers/pci/of_property.c | 137 +++++++++++++++++++++++++-------------
 drivers/pci/pci.h         |   1 +
 3 files changed, 178 insertions(+), 54 deletions(-)


base-commit: 6ba8359b84d69a07d508693551ed3f661d838e9f
-- 
2.53.0

