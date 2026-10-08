Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394D3C583A;
	Thu,  8 Oct 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450112; cv=none; b=d3kD8KwRWDNZy6pdEleUzhn/83t29M+OwIMqsvuTbcJREDfinlMGCKfCB/QZlKKZmZ+qAco6mHgwf+Tw2NMQg/nu8NZItEAfK8wueRsTiS0VZP2ohZFO9PuVRH+PNHuP9Q06Pq5ejSixK8WCBa5nUBdW8ecVjQO/hCGTWdc/qm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450112; c=relaxed/simple;
	bh=6VtJzmLfpgHa0fo2bSFarjgHKEi944G5fe8qAcSUl3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLFAKjaWOu3RyKs8BHJUNC1bHFVsH4vokW+wItUCx8cpCZ21PRKp7ePpQYeJQyEgcrJIJEQiIHUGsmiKpoIBi0EuJbLi3IIspxOjqj27JjKM8NYQdujiRbfXYD6FgpUcr0wpqJkbYRubdnPgsPIwThSnk38j5c3nDpqPQsDq/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=M+pUyGkR; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="M+pUyGkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791450111; x=1822986111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hXNpobdD4XBBDwhF1vM4pt2M+tAZW/ya789PU5GvSwQ=;
  b=M+pUyGkRiK69S8nnAXGVOHjkE4hboPUMbGTh931Pmnu9i5VMJbjCbwit
   AOkgJDrllgoNu0I9klVkJ2x8umDwZ8nAeoNl9sPZAIUYy2aUX/uXxhzoh
   uVnYHMoi8htMEp5uymUrkZzVQlc0fnESv7WyDgYgRgY4dIpkupjHcyNKN
   VX9OnBmqpU9MXf/HCMxZNQB7NpStwSSiSmF7lEdwVw+oLJ5q0ZgG/GsTh
   pKbwxQi6QOTmJoXPSfZr/0bNurJ/FuS/mYZQu0DFrBGfaxI5v9EFhkPmU
   Ef0Ad80xVJUgBsxydeyE41hg/aYDZhwfTI5KX69DnpeHiBrTl/s/MxLiD
   Q==;
X-CSE-ConnectionGUID: z6pibEC0S8276yNOXEJsiw==
X-CSE-MsgGUID: OvAgjO8MSNu0MshnP/pVxQ==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="30496133"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:01:48 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:24952]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.30.186:2525] with esmtp (Farcaster)
 id 07905882-5fea-4d56-a770-d2a06ad3a1a9; Thu, 8 Oct 2026 09:01:48 +0000 (UTC)
X-Farcaster-Flow-ID: 07905882-5fea-4d56-a770-d2a06ad3a1a9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 8 Oct 2026 09:01:48 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 8 Oct 2026
 09:01:46 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/8] dt-bindings: interrupt-controller: amazon,al-fic: add mask selection
Date: Thu, 8 Oct 2026 09:00:55 +0000
Message-ID: <20261008090058.38591-6-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008090058.38591-1-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
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
v4: no change.

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

