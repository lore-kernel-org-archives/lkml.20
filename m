Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C247F2D3;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=ec7u4C3JiM97/h1GG2Uclul0SHhMpHzS2yk1Mucd9yAgcCQ05PjxpztpUjWL+lompkoRSDse/kZjOYqzldmQtSkRAu/dKzv06Ue295CwSJMvVE1QwJ992lhpYEvELjiS6Uv8xF0u7UqmHi9ouHbRgGsP1G/Wnxxx2lF8gymjFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=1iieyWSC3pZciv//Kpnax4nly4jOd5a1ZWwkua8eHas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T61dmUATFgwvkSoOwlK9j+OMyTQuPxKH99VvvyssZfd+9IkC35zCj7nLjXlSdQnUHkIEPsbZWU6WS4tyFBh0MfUsJjNyg0kq7vaiNOYpMq5wqjRwJbV3YWZGTdHC8uNFKMp70Y4jfLYpdSUZd1cpwGBuU4CqHoCHYd7Gc1Q9ntw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj8ttBu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj8ttBu5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 130E9C2BCFB;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254011;
	bh=1iieyWSC3pZciv//Kpnax4nly4jOd5a1ZWwkua8eHas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lj8ttBu5NCa+sOjaEsfPx96s8rlJxqpO19C6RWE8T/xP43kp+6I39DfDUvpDTANcX
	 LYMzkf+ZaQhCIly/9AfZeqfk190vTgby90gImM5HhefjJGEJ9iSeZ4L7x88YRV3BrP
	 FybFl02yES0wsv4sJq3GO5rdcA2AfPfNmD5dcJoSUNa08Dp2XIA2byazhj24Y5iON9
	 WZSPyT8uu67i9618DdtmWY0i1ovrzCEdcviKLHzhc3niygIC6yEKF16lyj7Ikv/VgQ
	 zOBsqYcId1OzhrVAShH7kkKPMJ8hfab1o4V2VON2PYDY3wSV/C7Tmb8YdFgx4sLfUO
	 TNn+CoBbopqaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0071DC98314;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 14:46:52 +0200
Subject: [PATCH v3 8/8] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v3-8-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4460; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vq9lvSOR2VIBGP0fRKY+9ohQFZy6/FOmVWHYIrxxovI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu4sWvgoJ8A8yFZCKkemrfrtI0Y8Q7+CRO8o
 8/mFQ7NVMOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbuAAKCRBgAj/E00kg
 cp7OD/94SY8sK76YZw8CO9lgDcFfvzmEaFgFeUIUWaNiXmcgSoc9/n88d7Wv4lEwkW9992Q1FGB
 78r9qMAZOq4xo7r/tIJjyJQFkcz6iVaHyZyI9XAzj2pJmrnjvYIEaFEB7V7aKl8HjKS7DPbzkmQ
 H9/jw6h9i1kt5gvF6wA/bzahyYb/SJw809j7CrqhxMdjupEGsL/LtwUXc+mvnGoU6/fnC8IgDgn
 Zq/0fDvRQKa3FubYDbgcfGNN74qIE7UCtSvEGa/HLI/rge1nPJTZSr7e8Xn/Bh7qAdYEroayfyv
 Mo/k4FodjVJjFnQzFM+9KnKVv0TXF1Jx4QwMpn2d7zlXIBZ1lmgHYxn4Hue+tcQAfc6mA7StODd
 agTJ2PD0wVSXN39T3t5Ib4EVRTfDA+zDF5RdBNuPvNL6ZnfDcMXcktIeqheKBPUUMj4hWKtUwuE
 osSpzowXsqW6ip1jmbLkIvoxCiRmI/cwqZpqCiPkrWjGNcdX10XEMZGL6Gbo5tJ43PB8vJjsZdc
 inSC8W4CbjfXMUgdZpBuuNUWL0Vso9Dd1F14ebj5O+a1swDbFJD+3vCGZWUO7lsf69D7Py34t8e
 YSEbrpFbfOuznnZdvExg4ic5FbaDLETdfEjcM1OA7vR2xNFpb9oVco4l7A60p8j5gHifYg8FzBN
 jlKaau7EpC0xfvg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Pixel 3 sound card so far only drove the two CS35L36 speaker
amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
for it and route the three digital microphones

Based on work done by Casey Tunturi.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index cf87b582e3997..5393aee0370ac 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -4,18 +4,20 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd934x.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &mba_region;
 /delete-node/ &slpi_mem;
@@ -510,16 +512,20 @@ dai@72 {
 		qcom,tdm-data-align = <0>;
 	};
 };
 
 &q6asmdai {
 	dai@0 {
 		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
 };
 
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
@@ -537,40 +543,81 @@ &qup_uart9_tx {
 
 &sound {
 	compatible = "qcom,sdm845-sndcard";
 	model = "blueline";
 	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
 		    <&quat_mi2s_sd1_active>;
 	pinctrl-names = "default";
 
+	audio-routing = "DMIC0", "MCLK", /* Top mic */
+			"DMIC0", "MIC BIAS1",
+			"DMIC3", "MCLK", /* Top-edge mic */
+			"DMIC3", "MIC BIAS3",
+			"DMIC4", "MCLK", /* Bottom mic */
+			"DMIC4", "MIC BIAS4";
+
 	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
 		cpu {
 			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
 		};
 	};
 
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
 	cs35l36-dai-link {
 		link-name = "Speaker Playback";
 
 		codec {
 			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
 		};
 
 		cpu {
 			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
 		};
 
 		platform {
 			sound-dai = <&q6routing>;
 		};
 	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
+&swm {
+	/*
+	 * Nothing hangs off the codec's SoundWire bus on this board: the
+	 * speakers are CS35L36 amplifiers on QUAT_TDM. With an empty bus the
+	 * controller reports port mismatches and frame-generator timeouts on
+	 * every boot.
+	 */
+	status = "disabled";
 };
 
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
 	nfc_int_default: nfc-int-default-state {
 		pins = "gpio63";
@@ -706,16 +753,32 @@ &usb_1_qmpphy {
 };
 
 &venus {
 	firmware-name = "qcom/sdm845/Google/blueline/venus.mbn";
 
 	status = "okay";
 };
 
+&wcd9340 {
+	/*
+	 * PM8998 LN_BB_CLK2 feeds the Pixel Visual Core on this board; the
+	 * codec MCLK comes from LN_BB_CLK3. With the wrong buffer the codec
+	 * never sees 19.2 MHz: eFuse sensing times out and every capture
+	 * path reads zeros while SLIMbus control traffic still works.
+	 */
+	clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
 	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
 	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 

-- 
2.55.0


