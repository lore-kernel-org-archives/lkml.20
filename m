Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAE831A55B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006766; cv=none; b=rP/IS0a0GZlMMEmNH21+FKvpfqr76APo9cU62aop9Pz/7LEpXYC0xqPKHtC+i6jKJYZ7hWanV5sb7Amv5aH7FE9m/yxrtUDtsLfFxC7QFXT6nj2xfmXKACQ//gyWjSAO2G33W6GXUKTmwnBdm3eJZG/UYQcdqRHx+NrkiDecKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006766; c=relaxed/simple;
	bh=JzPrbtLU1aX7jPBx7o4xg1QwPf4aojsF7MwxzjDLuXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OonQK+040TJCl3Nj27u6Wu19lrV3NqAw+DX1TnYiqVwzBLz77DYEXgHSYh0+BBEH1YJUk2BVL1wUq5HwM2xSReC4WA8PG4luqu70X+BoYM5Ic9lF3PdNAOrx3xCPSfxM+n+NeUxn0ALsMCSxRD39xf3c3PxjLYC2AUYrS+4/M7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=PeOT03ul; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="PeOT03ul"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9399a1c21c1so388997685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789006763; x=1789611563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2IJdQLgVNz13bowYN0scU7l+eW7QDn2APNBpPDBpQ/Q=;
        b=PeOT03ulNvtGuiqvNZ1Ut71Z8K75+Dwh0Cp6ZTsxP3RFmktG6KGkOOBRVoJHcUSykw
         xJyt3pAxuJen+dSHATwDiC6JFgOSpIVX3gln6IQdvGaPP8agx3KSOpakHL5218DPPHKE
         nLmrsKvT8MQT0mj/qIjlQA8GIgDDGvsXtK9xaYb8WQNqHmT6sHd1+I4ZssswJETVs6yi
         SkIUS1bu15FwkGwurmq5xDNO0i5czlQRD72BgK8MrnlF14dEiyu67RduJ3G2/x0uQT15
         cRX0XMJzW07hfAUdxWvwsR4PIGbCqM8Oy3A22ArQjJcykHVgbwLwN+vrKEC1F+viHZRT
         A1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789006763; x=1789611563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IJdQLgVNz13bowYN0scU7l+eW7QDn2APNBpPDBpQ/Q=;
        b=NT8FM9dBJbW61XVYDfXvsceWnJvbytmp3lrz0t1t1JW4FCTgsGydgtd/aGar59GGm+
         nYmokjghF0AdbOcRhU7VRe7AiINg8gR8eDz2XE7hvFO7BZ/pLe/GZ4zCnhopPwuLtDTm
         IsMNCsbXM91k6vK3u7GGulXxiI7OcNwtDEoxvWUaz4gOJ//nXFG+DHfzQg1G+TZ8DPNY
         1P6uEbaeIwWv0sbC7pNx3NZy3aWqVZ5ZCLYjicg63DXwkSUru+mWRnUADWjmZxfwgFPH
         Tay/UenHWIADDi7doZJnMKXJ680loKQpXmXZmX0OjhoBA3Y+jzaCEKX0HXFf/6IK65+H
         BJIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDBVBjcg3B6VwqRGLUKWCmedzV14jJeln6YYTvRbzk5s1XIezXS2UQxdTkJVit6/MDtzd4SjoVnwPoorY=@vger.kernel.org
X-Gm-Message-State: AFuF++kskOZCpA46fxPx4oxkW6r3j9XUGq1/yFawDUcruYNicDLDUWAu
	XQL789o90lSh/8b+2TvmNeIuDgtuguCcWPTo80hGwV9g/JbIjtPb9PZfPodYcxQkVN8=
X-Gm-Gg: AYBFou3qhx6GgR8PAZ+bNGS5mPcvwciVLSRFS4JqlshT9MxCDHyrfZj4TC0/tsnPmRv
	6qzWDbceXvTacFnEiZbOtEN2C/RcRo9F9sPxz9SNT412xbNQvxJHlx8futwf+Dcpg8hbB1vODuV
	g9YD5tQY60Hut0EbZJ9n0yZXSj3Jbjymqmhr1iMWTdNh+MwTLOHz/ha7BvzTA7mVX1lsKd2zPJH
	B8rMscGzN78NeI9aJzx0ERcEwmVAx5BcgfChomddb+9jOdgknYeEvd0Is95XARFaD71ep54wwSS
	izbJQyvEyu8mNbkXwiIK9f68ia3CCSuNWnI09qfO2npHNo212Hyw67igoT6JPbT0SUEPAByQsKi
	3bYZPEmcwVfsGZMQ222N1fzdfbrT+VAaJ95x0ovS8w8Rol2j1f7kiztuh3A4Xet7bHfiVMdBqOW
	GavCOMkldr2hTEM4I0U9cB1moYsxqFJrpRMitSqwp0CLuarFhS5LYF5FbdszlUX8F3DfxtfDopt
	4w=
X-Received: by 2002:a05:620a:bd3:b0:939:de6c:cb45 with SMTP id af79cd13be357-939de6cd191mr25538485a.47.1789006763100;
        Wed, 09 Sep 2026 19:19:23 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm1561375585a.32.2026.09.09.19.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:19:22 -0700 (PDT)
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
Subject: [PATCH v2 0/3] PCI: of: update endpoint ranges dynamically
Date: Wed,  9 Sep 2026 21:19:15 -0500
Message-ID: <20260910021919.3421449-1-elder@riscstar.com>
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
  https://lore.kernel.org/lkml/20260908213459.2519059-1-elder@riscstar.com/

The entire series (based on v7.3-rc2 and including those prerequisites)
is available here:
  https://github.com/riscstar/linux/tree/outgoing/dynamic_ranges-v2


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

 drivers/pci/of.c          |  89 ++++++++++++++++++++++---
 drivers/pci/of_property.c | 137 +++++++++++++++++++++++++-------------
 drivers/pci/pci.h         |   1 +
 3 files changed, 173 insertions(+), 54 deletions(-)


base-commit: 857c3561ea9f2c3107b5c6d830d3b3face159cbc
-- 
2.53.0

