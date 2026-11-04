Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778155;
	b=stE16bRW3CrUvSkZRVPBOdTLBkOWduseKC45cVpTTtnNlGvzXop8cfxJq60QsZGSxirx
	 gT0NW7R6gF9Zfl9G8PxFgRAnz2qxO7TV3YuJrn5hqnv3mAymnUigVQUUbNM0LbnK98GhR
	 MFZdL7StV6JZmAPychtgRt9VXK+UYtHF717Ee/NoyZXPSbqpnkBd15xt1mZMQ1KKVYMec
	 +L6DbXnMvuFZo7Smzh/G1A6GAArMLMRyX3cyUzb49nXOKHpq0m/ETCdqbaZ8GGlWfp1ia
	 F6lsAqc10ZHk2uppYofjCIKG2T9WhHHih4/x2xxJtf8ROQle5esP62sWujVLif2aBjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778155;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Cs+ssJWn7EsZgWGobaXQVwsypj2tkI0shuN4UyKtIW4=;
	b=GrEQxVsHbpFuW1DJXd2WFABTcmBD1jO2zn7Z7XmrEtc+BRUHenS+4N/azcMvMNySxcnR
	 ejTrwKr6Z/t4tcvZmb0lS6b0s8JBiY5PlGY/pXR3urzp5TPpBvk8SWz+7yXMOzm9cYyDu
	 f7XsuBVT8NR88lDtmaTxw8yojWOnapafTZwskjHWT9AZAd6vHub1Tgz5jvL37BAQJ3/DL
	 NOfPaWkg/v6A/Bzmv8gUNr1hUV2CiYxmdutyQ/i+ATnB+06cGO5eDs6pR5KRm+qOE7QoM
	 xwYioWseuLYfzJCieFy2VLj40BJOECbTMEeCPxX4QmSjcMkrIJa+mIxtjlnmo2nX+PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QMBqdReS;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DEC606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DEC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QMBqdReS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YN/rDXtXiQZYf2nwHzC0UlHhvQkqsD2TMXlrp+fG7rE=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793778150; v=1; x=1794382950;
 b=QMBqdReS7KbivRNjvKo7JJUakAtXCwJBHzYYqp4Dn8Vpe5mggMu9Z1r9m+WXkFPMzYocKwws
 jirH3BJ2LyFIGooB8H1Kd+OCNjqOm6fW0FPBh443JZxRMurBmma8wOa9HvqouJcfONDYLNZoxQr
 0yFhPLfOxqe9ETqw0ZagIQ4vTt8i8/3bqDZRArq0xZ2NfeBfLFfY6YoP+2KzMXS96dD10/S2ghX
 JsBkoOfX6W/SXjTj1V72UacTKffepqShaXO65UtCIoVVFQYorl23A2j5ZCjEfDJ7BVrA+L9Gi2v
 dOceej6mVu2goqUAqFwGUggGso6jxZbWEFgSyKeY3ClSw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01f4aea7d4fba35e;
	Wed, 04 Nov 2026 07:42:30 +0000
X-Mizu-Trace-ID: 01f4aea7d4fba35e
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8180x: Add SLPI remoteproc node
Date: Wed,  4 Nov 2026 04:40:31 -0300
Message-ID: <20261104074200.123842-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sensors Low-Power Island remoteproc hosts the Sensor Hub firmware
that Linux userspace (hexagonrpcd) can talk to.

Describe the SLPI node for the SC8180X SoC.

Signed-off-by: Val Packett <val@packett.cool>
---

Forgor about committing and sending this while submitting the Surface
Pro X series v1..

Since this is independent and simple while that series is waiting for
comments about the multi-PCIe situation, let's get this in first?

Thanks,
~val

---

 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e3211958d..18f03aa62d85 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2259,6 +2259,67 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		remoteproc_slpi: remoteproc@2400000 {
+			compatible = "qcom,sc8180x-slpi-pas", "qcom,sm8150-slpi-pas";
+			reg = <0x0 0x02400000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 494 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8180X_LCX>,
+					<&rpmhpd SC8180X_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&slpi_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "dsps";
+				qcom,remote-pid = <3>;
+				mboxes = <&apss_shared 24>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x05a1 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x05a2 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x05a3 0x0>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
 
-- 
2.56.0

