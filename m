Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4F3B42F7;
	Sun, 11 Oct 2026 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695143; cv=none; b=nSW/GAKlP24tNs31VoAwI0AtFdVQItpTL3TEYcfHFDndPjLy6sujwo7JgxZLdJ/v2fUpTOb1zRVtzn0QGWEux8KApSvoe4RsqPXRmOdxNxUTFjdb9YY621NDTp0w2mmnvD+x5+q5mZhKp2Tey6QFX+sDtv7HDRY8DM74Ho5OHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695143; c=relaxed/simple;
	bh=izFFMBZfXQ9/VWdpF6hsfMz83NBpCxFja+vkA4CQIkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHbhAcgd/SxA26yhzGj+imFlSJK9LwmDNK59QtjORGkMukOGx/dHxq9OK0y8tUvmE+SI6G3Vxg7CKHNeQyXMoarNUDHmH93+tF/EGf93gSN6hpFVJWPGsGM9GF6EpojMtUXHOmAG42puFToOUl8vmToCt92I4jBAdUvRhYtXG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=QkTK6ptr; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="QkTK6ptr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695142; x=1823231142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zi6KHFmDxxufNT+kLc1hpVVqGcfCvmZi7/L2CDqj0C4=;
  b=QkTK6ptrM8Y2hWY8AftJq4vB5dnuS29Ig2IqOpUZGY4vgPQiQsuPLPxK
   11aaVJcKWnkuwn3s7v5I2Up/+qKmvyCcqELAEEfqN0yBJb1e7Ug8QV3vL
   /sPD2e2zf/GQxfhHnIfvPGY0Qd+qpCPMKj/tE2S2lHCWXpZmAIxZQm7YE
   Gnc0C48kKr2+/uDz+Q+5nFMWzN6kW2Fm++HWupYZPXOagsxE6o5NA4qo6
   PK9rHK6DYhSjkZjuMgbDDzscsWiWiwjZTX0PihYUsVVYnKTIhdAaAZAS/
   441e/N/YwToTK8/4kHI5AanugBYBKGra8kYU9R0zpNAczYnGsPui/la1x
   A==;
X-CSE-ConnectionGUID: O7wIv1a6Tc6+1TUCi6U5Nw==
X-CSE-MsgGUID: OpYvvgfsTfaB2ZXIzVwcJg==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30939717"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:39 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:8222]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.115:2525] with esmtp (Farcaster)
 id b227d276-9b11-432f-b12f-8e3958d81f07; Sun, 11 Oct 2026 05:05:39 +0000 (UTC)
X-Farcaster-Flow-ID: b227d276-9b11-432f-b12f-8e3958d81f07
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:39 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:05:37 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 6/9] dt-bindings: interrupt-controller: amazon,al-fic: add mask selection
Date: Sun, 11 Oct 2026 05:04:45 +0000
Message-ID: <20261011050449.41903-7-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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
v5: no change.

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

