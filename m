Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705765;
	b=ceDl48D2mLRcQMAqpAVe03pZLOQju3Qx22YB6sdCUUVIzySAMiDd+FaOA4ulTLI50mdf
	 sMliYEJCjdlWBAuCChlPzms8FN+FIR9DywbIRkzFxRMhN/hhA4eGBy4FwTD2xfXeJfw89
	 fu4Evs4SV+DimK+PKtNqzQlX1r9hnBMyrycZqPerByo1tQ4n7COrsLP/SAV7h1hHclUD1
	 Zqx/S6/MS4UQXVXgq6+vRDIApXxuxSSOmQrdweItKCwzjVYf2NIqvfhUJWOfRzyw/FMa4
	 U76RA+TGg2FCQjPeNIDkC4uXf7g6fkAbslvfWlDaoq2NyQw06jatP/kJ8Okswfb1T2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705765;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qz+fPWIF4bXW3lbUM+ZrF330S44l3iQQjeuqmyfbUxg=;
	b=tNbrIsHwgznlDLGixDU7UNoQjQC0GYF6OdIGfj9jGMO2cvvT3dYYtkxg1oCNfa7WipTX
	 Zs5yq2wJSKx5Nrm7mV8qVnW1ecBTmI6uEnFzKWTrc7c4Z87fHspKSNnyWxdfG21oXwO7E
	 Ic6pbBo6AgmpOx3F7Kwa5eKbD+S+Hu9eFrSCSvTosoRS+t8zCclsyV0FLTxBlSxasY0Fk
	 pACcKW7N6S5H/rKoczIt+RsFIo8TvmJBWo/zoRdOo4fFls1rl+CLal5LNJ1bVjXFLfEX+
	 xGKR9l53Y1KcbvKyXkjI/DM2Mt3fWkNEnTIuuOcNj5WRwPQqQuPQj7Q+uoli0XwUMdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=uIxoh9tV;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0EE606A329;
	Tue,  3 Nov 2026 11:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=uIxoh9tV
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D59631D12;
	Tue,  3 Nov 2026 12:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705620;
	bh=6yOW+W3uxLObx1ifl5CN+VxtAiOiKH9JtEw8xiD18sU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uIxoh9tVxsyG2XP4OC1mF2fjzcYo7DbhRNXiM2KEWoDxURZRL/1dJcPwbM24P2XZf
	 fO5X5Wyb1Kxv3V9UdY/FwuqQwzwY+RdZiam8p0W60mlQJF26r1OO+hAMveHb1ESsVe
	 rcdLoaltfQLr2baoAKB86uBEY46WQ5y1Rsq2syM8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:21 +0200
Subject: [PATCH v5 01/15] dt-bindings: display: ti,am65x-dss: Add AM62P DSS
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-1-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3568;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=6yOW+W3uxLObx1ifl5CN+VxtAiOiKH9JtEw8xiD18sU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccVR7aUxhTLH/yluOKEr1ol3ZKzt5c+fV5T/
 iiHQ+q5te6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFQAKCRD6PaqMvJYe
 9fCSEACutgMA2kTsdvlbowqYhdbzlPw3Y5NmLOMaoBudB9sPLXC4hlpfeD+f1fqIRPlpfJ+Ko+b
 CsEYBBzdwi+sTaG+qt5f3+woJayI6gHrHh7xGjh+BvHKf2xkoHKeWKsmToTozKeMfQ/xecyQ0k8
 ciBx7SUHatE3AdcCRlsxyQ/Ed3fFNKUi2T3DTphWGqCiH9Sx8XD23vAEmei/TAycaOJWzyTZMtH
 PkmJyfqrroaHfGkhjQ7sJIIHME4ZVcy3ZwdcskaZbJgJyF7ujROhArnOR4RyDXzg1kG2DqmNl2R
 wkiyCoqpCTWRacxoCiqtiqw7vlaB17EDDRTKLoCLMH2iI3mNR7422akjM4V4LsjLXvYoZBXu2fF
 B+Na6iJ67qlCHpvHFll/EP8WVVufjqtFwE5EvKn3kfh6/IEwo2up04jueq/Qm8m00eWRJftcb9+
 gODSfwiIz5UonSQYCtLRr1HEyqJKK0PVNic9VoRoyt041PprVMxGmtYHYa4zJVss8xItokNHMGp
 ixxbsdvI/78Xf/m61ZIH4UoBTe/1666Zog2yK3QnT8nSzzspQgyR9OastF2EwFTJx+mBRDIzI5/
 dGz63kfCryWTnlIXVK1VeLj5Bp0AqjxZ77KFlqnjRyLV/XfKH0I/pW3rdG3V/A7EYwrNdry3zOx
 wImlT7hh6VeamwQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

TI's AM62P, J722S and AM67A SoCs contain same implementation of the
display subsystem (DSS). There are two instances of the DSS (DSS0 and
DSS1), each with two video ports (VP) and two video planes.
Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
DSI TX and a MIPI DPI output path.

DSS0 supports:
- VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
  clone mode.
- VP1: DPI

DSS1 supports:
- VP0: OLDI1 in single-link mode, or DPI
- VP1: DPI or DSI

The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
between the DSS instances. Thus only a single VP can output to DPI, and
a single VP can use an OLDI block. Note that in single-link
configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
be used by DSS1.

The DSS IP itself is compatible with older SoCs. While we could use
"ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
on the safe side in case the driver needs to do something special for
the dual-DSS case in the future.

Original patch by Swamil Jain <s-jain1@ti.com>

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml          | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index db7d3d216b64..5ddee18b4982 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -28,11 +28,38 @@ description: |
   On AM62A7, the first VP is tied off in the SoC, and the second VP is routed to
   external MIPI DPI pins.
 
+  AM62P SoC contains two instances of the DSS:
+  On AM62P DSS0, the first VP is connected to two OLDI TX instances (the second
+  TX shared with DSS1), the second VP to external MIPI DPI pins (shared with
+  DSS1).
+  On AM62P DSS1, the first VP is connected either to the second OLDI TX, or
+  external MIPI DPI pins. The second VP is connected to either the external MIPI
+  DPI pins or a Cadence DSI TX.
+
+  An important note about OLDIs on AM62P:
+
+  There are two OLDI hardware blocks. Each OLDI has certain configuration that
+  has to be done before it can be used. The OLDI blocks get this configuration
+  directly from the DSS block, via DSS registers. However, as a single OLDI
+  block can be used either with DSS0 or DSS1, the source for the configuration
+  changes according to a mux. This mux is set according to the OLDI
+  configuration registers in DSS0. Thus the OLDI control paths change at
+  runtime, and it is not obvious how to structure this in the DT bindings.
+
+  The solution used here is that each DSS node contains the OLDI nodes that can
+  be used with that DSS. Thus the DSS0 node has two OLDI child nodes, OLDI0 and
+  OLDI1, and the DSS1 node has one OLDI child node, OLDI1, so three OLDI DT
+  nodes in total. The two OLDI1 nodes thus refer to the same piece of hardware,
+  and they cannot be used at the same time. The selection which OLDI nodes to
+  use are chosen in the board dts files, so assuming the dts files are correct,
+  no resource conflict can happen.
+
 properties:
   compatible:
     enum:
       - ti,am625-dss
       - ti,am62a7-dss
+      - ti,am62p-dss
       - ti,am65x-dss
 
   reg:

-- 
2.43.0

