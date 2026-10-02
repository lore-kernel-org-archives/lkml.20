Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B5C47D936;
	Fri,  2 Oct 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934832; cv=none; b=N8xraShGCodFkHbmfSCODM3rRNrvm2BIQ5PctZxJ09WHOBhVojOEliA8oC0rwzS7wNCNNDzfTFLjWNg+837hZlw5zDIWPEtXn/qz+GIVoLFvl5S/VDSJjfyvfJG5ovJZ0HHTm/FWily5BebtboHGSxtqf4wOgzptUTZoctoEFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934832; c=relaxed/simple;
	bh=iW92QJbYkT2c+9COJjq6j+FezNFEwORGgQahLMmFk7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4OU9/Pk+Tvc40zgJIotYAwHN/h2mmDcN0d9rTd7rPCBTHjcvhEP5SDhHALcN/XyjzHdwkNHXvFkG8xxe2YA7Jq954U3fktOc1Pb29SWD4vRAfabQfL+WG3OVOoeSY7w+zFSZh4jj4E025Y8XFIqDqi8Coeg0z9kQUF9fA/4IOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EvsHsEq9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wg8tyNQn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EvsHsEq9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wg8tyNQn"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=EvsHsEq9XUSkjFm4stZT2uh+iiUgMy/WOJLSfNTBZfwaNYuqMVQ0FjfiCoc2BvkgfzU3Mh
	RmIZrTGI4DXv5uxy/VWce06B4ggzgajk4QgApq4fQZR/MEPw5NmyDSH3VGf+6NwahJlkDC
	41DBYwxs98QEwkpU/FoWsV372t2jTuprCOX1vVkb3TBOumaw+vJsBYOzqwKNXhysYlTvhm
	ebSL8XzJPgosXvocZPQmkvcLwWxsYNaimwxp5LrELdjfYhbuWkWdP9pf3O4YpcQdfFvaOO
	gUdDEZyUS3y9Qd1hX5L9S0SUY1xEFpBQ82HDR8b6sLQ/yDq31QtdiBBdZmxTTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=Wg8tyNQncTxu0h+vVmHhN0EPWWR7elH3z/RekukHPzX0tam4OBhP4BllfMVCJ9rYkN9U79
	r9rwudAbBPwz3ADA==
Date: Fri, 02 Oct 2026 11:53:44 +0200
Subject: [PATCH v5 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to
 firmware node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rpi-tryboot-v5-5-6294c131e583@linutronix.de>
References: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
In-Reply-To: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=821;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=iW92QJbYkT2c+9COJjq6j+FezNFEwORGgQahLMmFk7Y=;
 b=N7qN0q1+miZ9NzOF4jRW6TJREIdVWvBWce7XD2CCmx9GNUyAMZi8MQSCK2CblFE3V23SMmenc
 PegD78X8mMfDbolbE8uK80PoQ2CUZTAthksEO971aDUlt7y72At1YDt
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 46c91468f4c54..174b13b8facbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -5,6 +5,8 @@ firmware {
 		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

