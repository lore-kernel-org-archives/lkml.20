Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72884D2EF8;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353858; cv=none; b=eiGXTA7kum5xqp8mpitn6ZjjGOMDyAHAmZiiUm8Uivxfu/1Vp7OQy9ABY/QgR+QbWGkicnEpYFVkYvNgqV0fPm6P3mbXw9vlGT5v7ybATryzKs3Yr4tQBMFDn0zkbMNjKazipCvGtRVZoKc5HXI7WZyx9mOQS18R8P37c3xZbF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353858; c=relaxed/simple;
	bh=rwI/7RKVpuopW64FwmHehrBWEq8obtox3C2g6q/otxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4kLNIf4E3gt0g60+RaNJ8orrfoHUtNY12eZfPEk6ExtRTxOeue0teaTwUR51AHS3XPybh+U+afPKbqJQfUY0H80Z+5rLiTl1QzSbn8qgymAwNROBbD9RzfZF3gCRvm1FSxtkRoHRyCzclWkWWgM3BytekpliZW//U6ccq7PKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXTuyUJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXTuyUJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D52E1F000FF;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353856;
	bh=4fULh+l1B6/QfnWfkwgXEXAOf4zGK0ZET5rXOX80kJI=;
	h=From:To:Cc:Subject:Date;
	b=FXTuyUJQpVQSZUT4PtOeGhjkd+SQpo/wfKSALQ4bg98jx1P0j/9JVPxmJICkNmj4u
	 v4ilk0Sp35vDZQRi0ZcmMKxeQ+s/u/UIf15BC8xEfMUF2ORO46OrpUCcbMaQN+cWPh
	 2mtp3G4a8lomdAki3Qbu7wAhOjZSxrmk95e9Xjk3G85AUK8O5gWh7NEUmA7+z66+w4
	 QtbXIU1fTfw1ysxGYjOjMrtJk0/MbmUfdtpTPHTGvgAqTimDfB/PXlP4xmR9RVPuNS
	 Aw2WkRgV/kc2V3zskKvwL95nlN6kH1Nbd0RaOdq0caydlgd+nOde2vZguhu9q5RK6I
	 3S5/pjLV3v79w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mtd: arasan: Add "power-domains" for ZynqMP
Date: Fri, 25 Sep 2026 11:30:44 -0500
Message-ID: <20260925163045.1920345-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZynqMP NAND controller nodes use "power-domains" property already, so add
it to the schema. As ZynqMP is the only supported platform currently, no
need for a conditional schema.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop num-cs property
---
 .../devicetree/bindings/mtd/arasan,nand-controller.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index b90d3b48c2f2..7154245b00e3 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -35,6 +35,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.53.0

