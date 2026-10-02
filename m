Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944374756DE;
	Fri,  2 Oct 2026 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934830; cv=none; b=U1jmyxC+X5HvLBMNtZ82af3fXQqcmXLrWj1Pr0nkV6IJtOUauGsuMXWxbAbvO0qv36xr/oLFkNC9/MlwF3fiu743N9TyZiK53hJyNbXAEOxMxJF19UyQKXAeCG4ezIoSizBshs7VecGewdxWEF+mzlByG4nFmEKGo+rt90t6wK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934830; c=relaxed/simple;
	bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+2AOqoEVQASrcyN/WcNFVzlnik0BQrCH2Pv9TP4Ym47VPZMp5Ui8IUTLtFl5o3WSkNLqiBRd5EoX3XZKu9g/+T7YBOulvbn0SpM886gaBaaV8o5BzOkj54iQJeMgf+HD1jVoeSxDVeFDThUk6FFxO1C1kbSaTLpWMM9CmLI/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uFFEU1Vc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AujxyfLu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uFFEU1Vc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AujxyfLu"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=uFFEU1VcN4x4mayxaIqPd0/GKENbozNP+XrPM/Re+UIFTQCqqgSf6ruVxwP2Imq2dfOwiF
	tZpNxRIwnbO7dvBxCJqJYGpKn9SD3Ktk3pHZHpRolEcRLbBi/JTJu6U3TaIIaTZvh3z+Tr
	O8Q+qB7gU3zzqLohm5rdy3XU67aKYILX6FSp8aa3JIMeMKpOJllZtEDai/YpTWvmY95KXz
	PVI5pAQiuP3KKk+lWW8dEJ92mQdQrRrVmMP3D5o7tOg5K4Rt7anZEKrNF/jFM60ZFZ/61A
	8arKLx0URwIGho4OFLPs3a26A0nDXxxANeFgzOyyr0duu19NJKgBt/tku2ZoKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=AujxyfLuoCFKJIAcvIZgMKDAzVSFLRYZiTToBxeMKu/ncdyu/4D1aRZstrIQ9vCzLiyrtY
	fGSz4sUfiTOc5ZDQ==
Date: Fri, 02 Oct 2026 11:53:43 +0200
Subject: [PATCH v5 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rpi-tryboot-v5-4-6294c131e583@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=sU4r3cwQeiSUNQ6cOZ1Ry8jt3NbxXLDfmcVQ5uMvhJpSAi2ZgxEvPZzpiMezyJV3MrUCMc4/7
 O8Z3ia3n/dVC9JCfK6hyFOLr9aSvg0HyQYKTVVe4A8twY+RQ3DAosqz
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..67095c7ff770d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -49,6 +49,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

