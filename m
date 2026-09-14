Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E841228D;
	Mon, 14 Sep 2026 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375255; cv=none; b=ZCJzoq17q3g0GAK7C7h0lM70/TcmYG5Ctcbuvv+j91Bn0cNrcWuz+QXMF5B9yfy5pZ/ft2IEftt5yAWmE2x8rJGHAcBZRG7Ln7TZr5IZ+Au/2Kysbpug8SjEpXyYVV+Fnn/pDay8sJHu5aBo0OFgrpumJg8Fj9rp8zOF5NkI5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375255; c=relaxed/simple;
	bh=p38AXMzca/I6aVtQpRZ8f+WAdxrgQ6IGXGdUO01HADo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWkqQQDQN0Rj7u39nEXnpVfD0FYiazhmXL0R4bpwts/sPYP+6EU1T3oGmiUlS1z8pqE8R4l4raWzHfm5g95ZpVPcn+Cw+VLbxOdmfd5z1S6CkR4Pqn5ZujUlBLPu+fvipIoCyQQgFabP6nzLS2OSQ9Fws0YUYFuLMqUD9c7aU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=mK224PTj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gbOqJiLZ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="mK224PTj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gbOqJiLZ"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9D6D2EC05AC;
	Mon, 14 Sep 2026 04:40:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 14 Sep 2026 04:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375247;
	 x=1789461647; bh=WgpmBm1w1oITFxPAP3o9Uap1UqrLDPvPvUmM3o3SQQM=; b=
	mK224PTjCeeNC1y1pSAgo7yE3v3lkV4sneL/l+VzS1KQi/DJ+DvxBOZUH427t6Ld
	y8iFvZWRcHP18x6JXmoMdm5Llyov9AKa6aL0Jpq2QGYd7AbIaOeOapV50lyOxFRk
	qGYrctwy4HC6D+KxvW2RCjxqFGaTI59hxSK8LD4Y9GWLL9jWffObW2jbEhyUNvZ6
	1gw9WNx9VTMtLaveUWjawKRrjlMUpl0KM1VQ/3EjTz058WQFFSlwuaqAXQzBnMOl
	PHAuDr7470ZQQZn/CDY+Gl1OSQ5pcDPVjfAULYh/SMVcZRNnTfOxs5dtuNxx0QoS
	giGQxmWL5O9BfD5+3IphqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375247; x=
	1789461647; bh=WgpmBm1w1oITFxPAP3o9Uap1UqrLDPvPvUmM3o3SQQM=; b=g
	bOqJiLZbdjOBe76tGVzWAGf6BOw5xXJDY2vFSPHFPEyqHyhp6GmBMXnRblB7HWEF
	diYZDZFqJhmx6Ee6+4pV/cU1yLlnyBl+CeuNz+ztwYECdfMJoa5HeFFyWIhhh8UR
	+H5in5czZ6QqTp/0TMYjzXGUfQ/a/Hh/DXMfucQm7H3k3dHHKWis3Yeb2SpFpTTa
	PhYKHxBOp2NmI+g5BTSzuI5JsiqYU6YdZ6Jw640I0REwKE0pj0yAjUEwZvEd0wLG
	1Z7aVKoTVOQn4An5AkeE/ksro/afLoDXY7z1n/DTjhGmdZJtoUXk3I0sxD0Yi6GH
	hN6uZCeAeaCv+fIkKu4VA==
X-ME-Sender: <xms:D7Onam8JQ-nFM5ezoE-drov3N3cEn1DggtMcgXxFw5D5JArVaOLZYg>
    <xme:D7Onau7OykKjL-2fslSgt2wy4A2WyU6EyGw3gQPWtm31rEmkUAVTE7qaRs4VWIS0V
    7WorprvAsy8rH0CN_AbXUPdyGersrPuf6xMDu9KOZihGSe5SnRZzKZ9>
X-ME-Received: <xmr:D7OnanmxJleJAwAYsWMJHli209yF2BeqfkNnwmv1OdltVB7afUFi7WfvfHMMmRv1QDO5I322fpHyRtadK60aUdpVSZ2C2RMBhqArDQ>
X-ME-Proxy-Cause: dmFkZTEDLHr0shzxwhX+29bUrq2gfJ1+uzQ4b4gKQs3bZHRMEcVi5+3e+WWMmXn4weJHF0
    3tXMcFWQblGPPDQI4M9zHrzHMMgs0LXrEWCtY0HOKPhWUiTU65Hq4BSITitLFMR/nfR54A
    QBr3yt2+EqSebK505dZuX4BQiJBC2YrhM1cKA3YLwTBOhpwZfcQEF5yaMpHRvipvp5nbhM
    qXqI61aj3JPw2SHELjXQTGsoBh2Y/LuJTzIJZd7IArzAR6+91M7O+W1wr1s1KNxWnuZkuF
    hsZ8YwXBQsE0gAiTRFJnmiV46ucM1Ygc8cn9Pw17HkJ3S5rNQ8lRntZ8AGSg3kYW6wJPqP
    Rzqna8SlL4HWgXnCQ9Z1WfDGbd/ysOg7kHh2IGuKaN21mBVQXRnlUMd5M7e+tVoy5IQoJj
    CI0pve3R0GbSu4u6/Xh5roYbxY17dbTElfdHD7FG9nmE6FfWpVrB1bNjPsBmG8VM4ugKcr
    J4nfVWNwKxQD7fzvBapXs5hxKQ/jqryNJxetD43UD0BudBi3Q4wVOtUylRkECuTvQH59mn
    cTIGahfdtTZ158P1r4x4tytMtczbomo2y/cG1PYU1r3iRYVm58k242WyY4Ta8U4Zu3T5J1
    mjOpnBkIjQpdu3AeY/UOcLNGbBKn9rM8bBl9Umi9OR3nR1B8i8v9nUqb8urA
X-ME-Proxy: <xmx:D7OnapHM8MoX6C5nhgjtVNuohpDPqGF-4K_YwmgM-y6JM0mRgUWhfw>
    <xmx:D7Onam-jSws1B2wdmTuPic0ydHRJsaDPVG961Z7S7iDyeLoo8p0DJw>
    <xmx:D7OnaikjQ6cwuViEOBUW8Pll9pW0ivRG1Vddu_eJvLubC2Uv_DwMpw>
    <xmx:D7OnapDpw1An8aAMy5n4_ef6099nNWx3kJNOWnSA2Xk5IyYa4cO5Sg>
    <xmx:D7Onat9MIoQmiU-6jnfx8Dmihxed3wN_JDQhNEH_uZwAEM-iKq8ZMydt>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:47 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:35 +0200
Subject: [PATCH v2 05/13] arm64: dts: apple: t8122: Fix child-address-order
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-5-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=p38AXMzca/I6aVtQpRZ8f+WAdxrgQ6IGXGdUO01HADo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5mNDh3mapdmPVUtcrLxUPOGbXZNlm2RDzOzn3uwO
 NjFVqR0lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmAjnF0aG7V19/VPZ53hcrSmM
 a0oPYjm94UPpp4W3Vdm37bNM5OZ9yfA//UuDx4weTu/32yY5f7fbdaDL9uKn8PTfTDGnV5pEC2j
 wAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Reorder device nodes in the soc node by their unit address.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 60 ++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 481f68a570ec..3c7677079a29 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -284,36 +284,6 @@ serial0: serial@2a1200000 {
 			status = "disabled";
 		};
 
-		aic: interrupt-controller@2d1000000 {
-			compatible = "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-			reg = <0x2 0xd1000000 0x0 0x184000>,
-				<0x2 0xd1040000 0x0 0x4>;
-			reg-names = "core", "event";
-			power-domains = <&ps_aic>;
-
-			affinities {
-				e-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_E>;
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
-				};
-
-				p-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_P>;
-					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
-				};
-			};
-		};
-
-		pmgr: power-management@2d0700000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0x2 0xd0700000 0 0x14000>;
-			/* child nodes are added in t8122-pmgr.dtsi */
-		};
-
 		pinctrl_ap: pinctrl@2c7100000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xc7100000 0x0 0x100000>;
@@ -361,6 +331,36 @@ i2c4_pins: i2c4-pins {
 			};
 		};
 
+		pmgr: power-management@2d0700000 {
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x2 0xd0700000 0 0x14000>;
+			/* child nodes are added in t8122-pmgr.dtsi */
+		};
+
+		aic: interrupt-controller@2d1000000 {
+			compatible = "apple,t8122-aic3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x2 0xd1000000 0x0 0x184000>,
+				<0x2 0xd1040000 0x0 0x4>;
+			reg-names = "core", "event";
+			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+				};
+			};
+		};
+
 		pinctrl_nub: pinctrl@2e41f0000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xe41f0000 0x0 0x4000>;

-- 
2.55.0

