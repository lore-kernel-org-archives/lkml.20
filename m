Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32347DFA7;
	Mon,  5 Oct 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199549; cv=none; b=uH2sk2gnbsBT4D2945NEfN/18msY/IDVkYDioZT7a5LeQwqvQqaXMUk69RVpy6HQNLdQTELY7FkjQIZtTOjDAHLfHIXJMEEI3WR+DlGtdF8kR99FQKksNn8bIIZHBcCp/zLy0IFdB7efKO9chx+7BTNPDthSZfLw3IbVzDPoboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199549; c=relaxed/simple;
	bh=ZcAWZAX9WJN7JV/gfckG4na0ordx5XVRa3Bc++vxvtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V20rse8HPQHgh5jUhWxv3KzIpF0Jb+wAjdbuXJs4V9G0mLgVAqsd4yKvraumlKH8RtdFjRKFDI9oj6BL75YBRnJKVxuj4udwGZJ8JJ9Ou4qshBSn3+WFb36ers9vMPji5eeDyA0MaKmVpscn3Y4WrDSOdc2nGOtNV94u4hUSDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=AQ3ovLEN; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="AQ3ovLEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199548; x=1822735548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/GG3eRLOhiC+zcGyq29YlG6Ys2br360IxLZHTgc6YQs=;
  b=AQ3ovLENbOC0kDLX1wj2/Qq5AZtkzl8BONWW787e3Escn71Dk9O4swsb
   vAJv2Bg5mOg4xG49HSn2xTfeMgnpSg8I9vE0U3COMElKuGJpKO5Ti8HSh
   2w9KJX82UuBkF34mYi6yPPntf3mbKRM1THCrwEokMsg70acbvj8tRxgMy
   +83InBEN2iGZkx/DYPbyV/3yaQtkluNikMLJ+ReHfn+vfpvn79/oFQvX3
   3nZAoaV/iQmGuNBdNmSzaH++ycekikLx01uAYdiDpW/OQ4Nl4aLatvAtu
   X2D+E4KmX4F3X1FWfSiPpI/lxphCEKxK+pwBRNhyCwpTL88uTYFDF/uVy
   g==;
X-CSE-ConnectionGUID: FV1HPLUmRGmNUsIGptaxhQ==
X-CSE-MsgGUID: BQn4+kYJS1mBClFzBN4N2Q==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30399631"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:47 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12319]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.96:2525] with esmtp (Farcaster)
 id 4acab65b-0cce-4464-96db-f61aa557fa2f; Mon, 5 Oct 2026 11:25:47 +0000 (UTC)
X-Farcaster-Flow-ID: 4acab65b-0cce-4464-96db-f61aa557fa2f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:47 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:45 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/8] dt-bindings: interrupt-controller: amazon,al-fic: add mask selection
Date: Mon, 5 Oct 2026 11:24:55 +0000
Message-ID: <20261005112458.22291-6-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005112458.22291-1-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The block this driver calls a FIC is the generic Annapurna Labs interrupt
controller. It is built from groups of up to 32 triggers each; the number
of groups differs from one controller to another, and each group has its
own 0x40 register block.

A node in this binding describes one group, not a whole controller. reg
points at that group's 0x40 block, and the 32 hwirqs of the domain are
that group's triggers. A controller with several groups appears as several
nodes, and controllers cascade when a tree needs more triggers than one
controller has.

A group has one cause register and three mask registers, which decide
which output a set cause bit drives:

  0x10  info mask    gates the info output
  0x2c  error mask   gates the error output
  0x34  fatal mask   gates the fatal output

The three outputs are aggregated into three separate interrupt trees
(info, error, fatal); mapping one event to more than one severity is
forbidden by the interrupt methodology, so a group belongs to exactly one
tree. Which output a group drives is fixed when the SoC is wired and is
not discoverable from any register, so it must be described in the
devicetree.

The error and fatal outputs, and their mask registers, exist only on
controller revisions that implement them; earlier revisions provide the
info output only. A controller reports its revision in the group control
register (bits 29-28), so the revision itself does not need to appear in
the devicetree and no per-revision compatible string is needed.

Describe which output a group drives with a new optional property,
amazon,al-fic-mask (info, error or fatal; default info).

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3: no change. Added Reviewed-by: Radu Rendec and Acked-by: Conor Dooley.

v2: redesigned in response to Conor Dooley's review of v1.
 - Drop the two proposed per-output compatible strings
   (amazon,al-fic-error / amazon,al-fic-fatal). A node describes one group,
   and a controller reports its revision in the group control register
   (bits 29-28), so no per-revision or per-output compatible is needed.
 - Instead add an optional amazon,al-fic-mask property (info, error, fatal;
   default info) selecting which output a group drives. Existing
   amazon,al-fic nodes keep behaving as before.
 - Rewrite the commit message to describe the hardware and the group
   granularity, and add an example fragment to the YAML, as requested.

 .../interrupt-controller/amazon,al-fic.yaml      | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
index 26bc05dee0bc..1ebf9a427f2f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
@@ -24,6 +24,19 @@ properties:
   interrupts:
     maxItems: 1
 
+  amazon,al-fic-mask:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Selects which of the controller's severity outputs this group drives,
+      and thus which mask register the driver programs. A group has one cause
+      register and three severity outputs - info, error and fatal - each
+      gated by its own mask register. Each output is aggregated into a
+      separate interrupt tree, and a group belongs to exactly one of them.
+      The error and fatal outputs exist only on controller revisions that
+      implement them; earlier revisions provide the info output only.
+    enum: [info, error, fatal]
+    default: info
+
 required:
   - compatible
   - reg
@@ -39,8 +52,9 @@ examples:
 
     interrupt-controller@fd8a8500 {
         compatible = "amazon,al-fic";
-        reg = <0xfd8a8500 0x1000>;
+        reg = <0xfd8a8500 0x40>;
         interrupt-controller;
         #interrupt-cells = <2>;
         interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
+        amazon,al-fic-mask = "error";
     };
-- 
2.47.3

