Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622833D6494;
	Fri,  4 Sep 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508022; cv=none; b=ip0cTZPhjfNpe+JQA8FQWHuWhw1DDzOb31FbRqjoV/9vhB7sP0Q5ZpEJlMN6I8MFPf8hTg3eJ7EFMRKVEl4FAM1ZRlHn57oPeJESlh8nv0C5P6hT+j2w/clx3xEDBl2xEPMGEMSIpZRgJHTPHnsf+VaO2l56I2uhbWdETfw6Dig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508022; c=relaxed/simple;
	bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlsJ3CgEFkI+5BVNyW8/ahXZUN6ygdJA/fyjIvdtW8joyN9LHS/Ya2aYZylpwBmhtUPEslrXLvhqIr4Up6zx8ozQCByoPMLkh3Kj0iySLAmakzQIm4zWajXLNU03hMDC+AZ92sWe+ZouLC+hWXMdIjREUsh9PeNWdl8HTnblmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ou7KYloF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oli/DLLT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ou7KYloF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oli/DLLT"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Ou7KYloFVfQeXOYjs6icOcO0toqKh4tb2sQ5odwXHVOTwX0ANZ1w+cy3jK1J43zOSlVWPE
	TADjKYOCz9fBujFYOOTnLvbGbycGhmkNqsILmWSUk3/swvmvSLabubbgdG1xz6drH4MQfG
	RJBqmnkESJR7Ehab8xEeeld3SFCt6JSZ/+e8FTfcU6nP9qdOTHD2mg0DzYcfJKHnP3voPF
	Zceser/FEoKcNOMKUmEBCTAh/YaOZ5yNGpmj5ZQe5eBN+oCGsgnBjZmSfc86pdJAoCTevq
	683mAaE1G4Hw1r7XELAC6fdnfVNhIHL0TusJ8r5WAh2sQJlJ4qu4VFHWoDKGXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Oli/DLLTChQOzEKX+fc9+x90BNQKTKC6oGTFHIhIYW3mksystGx1zRRJ8OHifiAzXvnItd
	y/3GJMSmp9tHQVDA==
Date: Fri, 04 Sep 2026 09:46:52 +0200
Subject: [PATCH v4 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-4-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=9OHiFAcRLrbVcJZzqxiwULkiLJzATYx1es2N7u29eEKBKhMKvQyU31E4wctPOOGLn+ajDrn7n
 tG42W1UFI9vDi4tqcsiGlslqMktTkAGruvyhdfLm6uDdAQ/iC8PxQWf
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

