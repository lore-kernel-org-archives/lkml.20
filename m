Received: from 14.mo550.mail-out.ovh.net (14.mo550.mail-out.ovh.net [178.32.97.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B43859E9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.97.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908150; cv=none; b=Ia6MzJzWhrbFGkcp6oX23lU4iOLlmv2vPhatWb/3QZEBB0+tZCWRbxNTy9Ec+3pvRdDavqiMVWhkVi97ita0+kFEwvEC+wdJLYePiDJIdqPYqWVckK1wkzMOtZX7Mshhi/hn3wYTT6aiftuKZWzOHjo/AtkHBMxc6VFClxXvOB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908150; c=relaxed/simple;
	bh=kfP8OPsPqO/oUZC3gPAT+oD2S4HQ3xDeqjik6j/TtY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TCKTFOSUVGbj/c0k+dZjvQpZ5hJ5SYBzYvzCS06UtnklbItObTU0fCmd+1kPe5yQxxYyD9SfVzO7sIJXYh7Qu5H5/HegkXgwpCiTcaXXPU9RLxUmdvF7SsPlJm6o+7HuOP3BVHoNcWRKR8REjhcRZuBJKnwGWir/BArJX70BV1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=htzndDN0; arc=none smtp.client-ip=178.32.97.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="htzndDN0"
Received: from director1.ghost.mail-out.ovh.net (unknown [10.110.58.221])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4j3zkg45dZz5xny
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:07:39 +0000 (UTC)
Received: from ghost-submission-c7b579475-655hp (unknown [10.110.164.42])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 10B87C12C2;
	Tue, 13 Oct 2026 16:07:38 +0000 (UTC)
Received: from armadeus.com ([37.59.142.104])
	by ghost-submission-c7b579475-655hp with ESMTPSA
	id J4tGM0lXzmr7Qy8AW2yxgA
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 13 Oct 2026 16:07:38 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-104R005ed722c48-267d-45b9-9d0f-38bc83d56095,
                    E71387541862F9B32BD99FE93336DDEC16E392F6) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 13 Oct 2026 18:07:24 +0200
Subject: [PATCH] ARM: dts: apf6: fix Ethernet support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261013-apf6-fix-ethernet-v1-1-9530efe1d23e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBSE4VeRs3aSloS4ryIW1JRj0SttiUS8u
 2L5ZTL/SQFeEOiXneSxS5C/S9B5Rmbu3QSWMZkKVVRa6ZL71VZs5WDEGd4hsqlrUzYKVmGg9Fs
 90v422+5z2IYFJj4huq4bM+Rl6HUAAAA=
X-Change-ID: 20261013-apf6-fix-ethernet-c77c390ef0eb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?S=C3=A9bastien_Royen?= <sebastien.royen@armadeus.com>, 
 Julien Boibessot <julien.boibessot@armadeus.com>, stable@vger.kernel.org, 
 =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 6290121306616026755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFwwrfl1iPxPmWO6o6uy7jINWKAyMh0x8QwmnQbFs9EgGBBoRnjM3BUaJEZr2O/b+jim7kDcbnaQ7gbObCvdaGwmrI7ygNuePUx2XfOlPU+ynH2L/Y3qjv+8V1sNGQDoWzTS4dPbg8+1q+A4z3650pMSEERHWOc6c7wHIzQ/cd0AAinuhk1ciGuYw2D4AM54rlUTc3EI7eSXJzVYl3OyTQSK/C+/uQKTz4zratc5VMMn5UDog0h/EUCyQxoTf55Y9AhqDDFZ6zvIsDrjC6HgMcTURajxU4gpbIZHaHPJuId6YRUZECM9rjL8rwWeXi3BZLeaf9O0cp/v2LK91+ydBE1mf2jkmddL/sGGL9Q4okh6xCyj47YVTHfO7W3fK4EIytkY5NuPGZ+Pm19dZHfmvTslL1TO/lfPFsa9Vzc3+N3jWRhrIF8+2wNBLNj9Cyq2wvhbK6PoBFdUXBf+YuJn1/zcL+WmkLAb+Ebio5gsqZgoHPhA2tAFtyk/ZiS4mSmwp6jOPWsGbq7qcvfSOB3dD3FJwIHxGjDu9GqUjHZPdjfcgO8BxXGJY9NNkNKmF/tmFlXK0GMgXWya9hOgEhLPZNULUhAgBkMIQSdz5hYa/6cWoeVAFbLg3HBeewrWoJrbYT4dO6jhwNkkS76g4eJiA8MCauMM4yCii10xThAUKWfKA
DKIM-Signature: a=rsa-sha256; bh=3JJebDaF8d0BDkPiP93+YZIa8Qgu2HPfzUYjFA6D8SE=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1791907659; v=1;
 b=htzndDN0tLZisLCb4+yCj80PN7xv9g7YXxQHdVwxNFA1I1KYQbyiZdbAzxypK7zIFvtWUdlA
 r+p/WVV+ppUAzuY9Cza1y/KRrwjnBRzj7oRtHamoL4OZoIQbEG3XxkBEHIrdeIpf1KXsfSXMgrq
 2/UbPM+mFpBi2IH1HsQ5viSypY+iiIFKg1drKuXZkQavLVjJhuqIRQm3zouS2VZrbD1Xz6WIxod
 yySiVzNtMLCjy/x0YLJTaXg29Aks8YfKXhaRmr6Nr6MiJWt0mlCrXkCR4PjW8lgmCZKsqFPEfV1
 4XJdz2LUx6I4EgcjawOWbX78kUilhY/TtDYORO48qvGqw==

Commit f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros
AR8031 and AR8035 PHYs") removed a PHY fixup that setted the clock.
Make the Ethernet interface work again by doing as advised in the
commit's log, set the clock in the device tree.

Fixes: f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros AR8031 and AR8035 PHYs")
Cc: stable@vger.kernel.org
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
index b78ed7974ea9..b55a3539fbe8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
@@ -41,6 +41,7 @@ ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			interrupt-parent = <&gpio1>;
 			interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+			qca,clk-out-frequency = <125000000>;
 			status = "okay";
 		};
 	};

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-apf6-fix-ethernet-c77c390ef0eb

Best regards,
--  
Sébastien Szymanski <sebastien.szymanski@armadeus.com>

