Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437006;
	b=yNxgyCeYvTE5H6jMRa24LXMtPHWkyCylyIO5lBLdqXxAGQ8e/5gUvks4UYSkolJMa3ld
	 /p1RCOIC7vPN04ftiGgg/4f563SxdTqc6bjdV+GRiTd0oiBfYGuU62VAOcAiDSCvGoyE3
	 diBVYDLb/73SeOOZaufH4RX1FWbHlyMaxbYTHr8Pa3WO0hoOKiOGAqKwR82xLKZMZiaWb
	 GU314NXeGExx1lECyqkg7+PC79BwB3EuNmycJUPbM0M+h/sY+9BsjlPUCSeOSCqrAOhT+
	 icTVK2cFiiisECw4yvythOD8Om0e0zOkAUFMT2Kdqc66lzKhPqjOerpzGZLlDTni04g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437006;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	b=uPT+BovL9XFGYukaTPCKYKcHrpVRS9JlVqDSb57btqBfMYkeUpELRV0MUdIvYyrfxxSY
	 qNbY+q5ERIADJkD97hhT00CqvLT6ZzlYSKHGv45XhtCvvMD/uHyQMLLa5f6xIkgC8DVnF
	 W+1DCKqiKpB2rMBjTlNPtZUlEctdiXSomJvICy8YMIYzywzukS1GLQHRzSjht9Kga/T3x
	 WyE87RJIVlsqSmkse2Ypv8maFs9AYgHmrRzvhExxycQLWBjfOmnZGRcXreT9nsJh8iMrL
	 8lxZDXbfJXIyj15Zdw/Liex2GxVMAZOw76+SEVRrKnWhghosxkPLfk005StXfO0LbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxbFGovA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5125606AED2;
	Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxbFGovA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805641F00A07;
	Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437006;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QxbFGovAddVgfQIBYt3i06TYTqIA+xDMdvDo8WJTWnPzCj1V4h+CSL0XpUJgV/eWr
	 GfkNoQ1VjRK3K1z08+/VGIADIV995Dot4RllhCoST85lE3ybquJnyXzhN7ij7Kd3OR
	 uQPtuUVs29t3UvaGQTXRr09PTbQv3dD0v8ftRYKVEsYw7c1329rjSjIqcneF50ujj6
	 aqOWBfZPdR0hPbbidIWsV3/H8lYGESybD1PYDa7owc+vk5nyF7eH76z4gUhC/3+riD
	 V6jBpwKYA9i3pzdB8uoAU4XK5dI/9vehG16fFIgKo1qSp/GChpSRvWsD2cybIUMTxN
	 BfzOpUXnW55mA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:06 -0600
Subject: [PATCH 9/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add switch
 fixed-link
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
Message-Id: <20261111-dtbs-marvell-v1-9-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
The expressobin has appears to have a similar configuration, so copy it
and use 'fixed-link'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index a881a3326dba..93af902f4f6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -161,6 +161,12 @@ ethernet-port@0 {
 				reg = <0>;
 				label = "cpu";
 				ethernet = <&eth0>;
+				phy-mode = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet-port@1 {

-- 
2.53.0

