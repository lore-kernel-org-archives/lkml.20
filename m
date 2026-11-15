Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774036;
	b=FhtAZlIGM75pOFp264HGX6nZo3n9Sko47Mm96oVXjlhpxozS0oOyvYwrH/BeXTPbXUQS
	 T0WdzNdM24UaO/nnxWnppIYZjl4Cb2OkwemgA0eg/ac7PJr/unyaXI6VrjarOi4AA+bwp
	 Cjvct9aW1LFNKS6nCWuQwh4VkA3aFjGoZpl7brJe+GThe7ZTVaza6hjtASLoS9xpyonv4
	 6ErXKt6kYZeaVBh7BOGzeqRK9wg95QrpwKzxcL4Zda0Aw6PduHROVhYU1p4thG5Ctavp4
	 8NR5em+3gG1al8h1GMFOUl1nUtLEXFqswE2Bp/vrCuTBpIanUwF+Uun8I7UV/Ax8HIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774036;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ase7OpYUQ9Qo8XwHUkBX9h1fKBt4ScuSUaEKnuqie1I=;
	b=Qozk2wgReHMllNelUIqaf/lkkWmuAsrRRcPl4rRA4LQd8pMO7ef5r3r7PLzXDseZy5RE
	 IKKMlejRCAwqoPHPknxK8t8DWnkqdBX+qYFHuAIQUOues3/ssZ7kjdJ18aTfnb8tRracu
	 ZROFk8sw2iYzocnhqkBEcffUFx3EnvvYsbgKtAOStuCB7ajRtxHZtCHCjYuum+gJd8MaR
	 e6KvornS0qoiGxmqz0A1ZqUFx3mXfIO6y/Ma0AbnfQA7h9EN08WJJSS6FBvRgMURFllz6
	 fl/swMxZHt7L3niBIdCSNSyWzF7+seU/DaacCNtfYyhqkxNPFvQQsR4ngqLKamOckiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfHMkNZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6749D606CC56;
	Sun, 15 Nov 2026 20:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfHMkNZa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774036;
	b=1L5J5zQkPOigsa0yw4xi33DlD/SSYKbXw5nhIUl4tmj5+vlxlyVBCA/NR8liqXBoPiLz
	 oycgzUigvgkSkPEIrTafCQiuHlkVKvI8jujDzprNb9X4EF/M7kSfr8i0kMOatR2DNqO5e
	 0tTOQuw3pdGFo6nG8bT7iwjH8juEJdcn4kDlJGNHuGTaqKMfkOfwKvITUaI8v6WccIiD+
	 Z0F4nweIzYKRAeVzW0nCmTCpra9Ka1125PwvrzEmouECGj+crs0741sgrUfeapi0zrL8e
	 YyAn9o588/8uFXv6bMm727/3FBdfGxU9Uxq25gHFEGk949aoXtqcYTow4rhppnMbkjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774036;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ase7OpYUQ9Qo8XwHUkBX9h1fKBt4ScuSUaEKnuqie1I=;
	b=RluuSPMivT325tw9GvobQQU9rKvn/yPYqaz+hzQczniYQPB2iXElY30SvPs62TyEgSbb
	 SlARXJfYjtWYwA2BFfPh+uzLTSVinIv3BgfCum6F9h7NfwOew4UoJkmoPh07G+7e/u0pi
	 tsDI2Er3lN+4Xe0IXjUSayTsBUHsQgD/e4EWKNPUmGb0xkMgcazBDE4lgAIakuU1mHtm3
	 WSO1hKd/qlqzqsvVcHt0R6iLCLF9d0FFFPyNl+d7BCPTGK/C7W4jjIhoiq9Xy2lFUn43q
	 eViPwuPyzmnvmvrSh7dSmBXDrL6VE2P4EE4T2/tqyd6ef6jikyGpfpk9l9ltdinTzFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CF6E1F00197;
	Sun, 15 Nov 2026 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774036;
	bh=ase7OpYUQ9Qo8XwHUkBX9h1fKBt4ScuSUaEKnuqie1I=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=hfHMkNZag+75f1q2SB9QiYF+xjj33wcAn1ixJZ8KXTliS2c2xelmta07zQdtQIa6a
	 CCthzT2XMPiSIcTTzOuF5b2ZNagLpt7Fkmm9xjQT7Q+EziEdqvIn8ZXq86LhVdGOmr
	 mqJi99QCOWKCRJZM9iVVI6tBsv+b2GSjVcQROwWPGmtqzbKo0FkJ+mUkzQuW0cP2JG
	 vlMUmXluHBtPzbJ0PW15as41FCs9WyGsLPDxkmhj8PJc4I+QicFwv7Qf3WxWYXFa61
	 nd6+OkYU4xyQAmDZvd0jY2t/1PCuGOzGikqMzyx2XQXgg/3BCnhJCe6rz4SPJG+d8N
	 r+F82NXkJ01qA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 16B394A181;
	Sun, 15 Nov 2026 20:20:35 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:35 +0530
Subject: [PATCH] dt-bindings: usb: snps,dwc3-common: Document usb-psy-name
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
Message-Id: <20261116-vantage-dwc3-v1-1-6abb5a3277f0@yahoo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOwqAMBBF0a3I1AacBCzciljEyahjESXxB5K9G
 7U8D969IXIQjtAUNwQ+JMriM7AsgCbrR1biskFXukbEWh3WbzbP7iSjmIj0gNo4Q5Ava+BBri/
 Xdr/j3s9M29uAlB7/7r8rcAAAAA==
X-Change-ID: 20261116-vantage-dwc3-eccc2f123d3c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774034; l=1726;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=J0DuQqzHD83Tdoof2dhWur/dO95GQ6Otkr6u2afsZJs=;
 b=EW5L7/7wwp0Wa1rB+7mM5/7XBOUyZYFVvDwHdd2giW9vuobWkyuG9WmQCARjAtIcWheeu7Aeh
 guDmXGWHGcbBd+cYJ83HvhY5CLmDq6rTmqKZF1SoZhUAkPS9/3idKs2
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The dwc3 driver reads usb-psy-name since commit 6f0764b5adea ("usb: dwc3:
add a power supply for current control") to tell a power supply the
current the USB host grants, but the property was never documented.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
The dwc3 driver has read usb-psy-name for a long time, but the property
was never documented. The Motorola Signature uses it to tell the
qcom_battmgr USB power supply the current the host grants.

Checked with dt_binding_check and with dtbs_check on the Motorola
Signature devicetree, which sets the property.

I used an LLM (Claude) to help write this patch and its commit message.
I reviewed it.
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..5d46db402f93 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -42,6 +42,13 @@ properties:
     minItems: 1
     maxItems: 19
 
+  usb-psy-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the power supply that is told the current the USB host
+      grants to the device (e.g. after enumeration), so the charger can
+      draw it.
+
   phy-names:
     minItems: 1
     maxItems: 19

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261116-vantage-dwc3-eccc2f123d3c

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


