Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776933;
	b=d4xwSMJ0pQg6VrmeJxMDy+yY7hPPmAabYTo0Yv2TgYxiT7XOm8A1Qp4V7OKpD0XzShJY
	 u2g30PYULEwEisxRSi5kyRbuafMxQM5Zm2MqD6n9XxiORGGKUsO6Rd+Gb2xSLbh7QcvQa
	 AdIcA0Fq5BeoDluwfZrrjS12ihKaUX20Cu8ON00+Oi02qKB/jZoeSRyG8kuWU+Bm4UCQw
	 gR5zFl0QvG3CbgX86aVhIogw1/Vqn4JoheQQ3hEx1ROym4crJpsrsi+f2YVQsCCEI4OAf
	 nxsaDA3BUkTdv3BklVXfAsVrnuImnJUr+w0wYNwKvinw0FRh9fqg6Ck+1RVFzCHhG7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776933;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=nFL9gOlfeAoS8obTdRmygx/FAGTFEE16eev7Iz2z1Oc=;
	b=JY5iqB4KNtH7N876AywwwrKgRPPe7026JjqCkTIk9nAFxCfNf0KDEpPJN0RFX9SZQ/ea
	 iwpFFr/hOJCNizCtoAKhIHgSLTxWniHPBwAhIrTU2N+SxSfmt2LLNz9ZGXtAsVDUoWpAV
	 wwWMxSHcXzdE0DReF+dZbIB9nQMe0qbRnMjFt2qLr18CpUnW1ujhnM0u3uBH8KJb42dvQ
	 cAOQt6BF17p5r04tVQBDQv1+4u5B2h638NpwNRuEPP3qmjGpRvDkIY7i4H3kHjAscpoqV
	 FTYjVMf7+3yg9npbAOmc+luzwLcn7JSd4MCrhkQrG12sqmo9OrwhpTloB+WXZy5U1jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=furwAIqO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C83606A32F;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=furwAIqO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776931;
	b=G/S9cIH4IQ1Y2baPer063vcZVSsoM88FKh5lF0daBBOHdKCX1Rcsc5ZOTrU+o6Rv6tBX
	 fOLNvzdi5q7B/nHOVSwu/QhPrwUNDGfMEGXSeja0SPINzPHsBmEYesUTpwo8UfJJFObQa
	 +dg1WczxZCCfT2bbUwrr6JQ5FYkHiS+5ne6Uog4BtNufh2evSDjUIrEthUJrSQjcoddgX
	 N1jzedB8fktwgAgIRFBC1ps3zP7soH//2o5jzbwz+DzN4tYJoPaAKmZBYBe823YDthgNW
	 3UK2YDnLZYiDDAiBOFOf/z4k7STfnIc79GICql+etR+YnlA5K3fBomalBi8e6/kJ0rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776931;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=nFL9gOlfeAoS8obTdRmygx/FAGTFEE16eev7Iz2z1Oc=;
	b=Ni59iioEZ6lTlW0HFjkMBybHcSvpuLNysM5AYymU8FtGoPzyVoO5lZzmD/QkX0F9lb7H
	 BmMpGlqzWerYUAn1Rfsjlczhd3+PQs3fEEiurVgoYc2ErL0GqODiirorhed70+k8hvIbG
	 ZbBNVgRqSuKmKNyg//ksbmKSJFG8aZtHF/lYQkF/e3X65r/xzMDmrpE13sRjl8ChOM7GS
	 ERTcYGSZxxh3bgAelN8v22N+xvOP8XGlA2icQ1vytBr+sH4FnlP3NF9WzdkQ39MJBZGc8
	 D0/X1PQr2Ba2Bw1hMmI5wT6KHBvRQcnWu+XSGC0h1FrLsaB4MsXN9ZnU7hHbMQoRTqg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A1CD1F00919;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776931;
	bh=nFL9gOlfeAoS8obTdRmygx/FAGTFEE16eev7Iz2z1Oc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=furwAIqOpCtvdtPLm0hRN0QvxQvkkBodbrmhiII6RnlMTr/Bx4hegHgAPk6hxpltK
	 SMm9KWyAFtKQZHDGchAsE6BfI2Sagy3+7CyaDl4PpLMF7PfpYGQ18KruzY+yLzRa0T
	 THJWJnqt0R/yh05cBUd3lw03WYccSXB1LEWPnXTAich0BUoM73f0pKZGT7xg62vL4B
	 Ik2nHsjiw0Wf4cm766oQl6W1kPAsfLMv9/uCWNSXUZBkTfMsQWv9SspNg8mL4h/fDv
	 IKWyTKgPAvpgHaAcsX3Ij/FfoalT+qJzlXSSi69zW/13iMmfIGlCBlE/wvcn3QjG8l
	 xX1zPM50trdpQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9361C46CED;
	Wed,  4 Nov 2026 07:22:10 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/3] usb: dwc2: Add Siflower SF19A2890 support
Date: Wed, 04 Nov 2026 02:22:05 -0500
Message-Id: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAB3d6moC/yXMPQ6DMAxA4asgz42UuCqBXqViIIkDZoAq5qcS4
 u4NMH7DezsIJSaBd7FDopWFpzHDPArwfTt2pDhkA2osjdGoJJq6xarWKmweVWVf9hmtJ0cBcvR
 NFPl3DT/NbVncQH4+L3Acf5LiqGZyAAAA
X-Change-ID: 20261102-sf19a2890-dwc2-87573f7cebed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776930; l=1719;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=Z4EjSzZXH0bddZ+mXFeyQq2pbYLxiJX5/x/gQVQD4wQ=;
 b=ET7n9iDOcFGaCj2RJ/J6IK5kjkkJFlIaktvBT2Tflv5L9E66k0Wm0C/0/e/jYzUlMWdbAmosI
 ijXuHgd7Te0B2Jsnu3JgqafhwaRPD/WZ84KD6nrUHHgEYzjgeg+3C1V
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The Siflower SF19A2890, a MIPS SoC for home routers, has a DWC OTG 3.30a.
This series adds its compatible and parameters, and handles an
interrupt it raises without flagging it: with battery charger support
enabled, the core sets MultValIpChg in GOTGINT but not OTGINT in GINTSTS,
so the interrupt is never cleared. Chuanhong saw the line disabled with
"nobody cares"; on the GL-SFT1200 the system stalls instead (below).

The two driver patches are Chuanhong Guo's, from OpenWrt and his
SF19A2890 branch. The OTG one handled GOTGINT on every interrupt for
every core; here it does so only for cores that set the new
otg_int_unflagged parameter, which only the SF19A2890 does.

Tested on a GL.iNet GL-SFT1200 with the USB PHY driver: a USB stick
enumerates at 480 Mb/s, reads at 5.6 MB/s and comes back cleanly after
two replugs. Without patch 3, a couple of replugs leave the system
stuck, the console repeating its last message with the same timestamp
until a power cycle; no "nobody cares" message appears first.

---
Chuanhong Guo (2):
      usb: dwc2: Add Siflower SF19A2890 support
      usb: dwc2: Handle OTG interrupts that GINTSTS does not flag

Joseph Telaak (1):
      dt-bindings: usb: dwc2: Add Siflower SF19A2890

 Documentation/devicetree/bindings/usb/dwc2.yaml |  1 +
 drivers/usb/dwc2/core.h                         |  6 ++++++
 drivers/usb/dwc2/core_intr.c                    |  5 ++++-
 drivers/usb/dwc2/params.c                       | 11 +++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-dwc2-87573f7cebed

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


