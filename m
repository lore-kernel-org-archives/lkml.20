Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE84D09FE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950919; cv=none; b=dqt9DGKg6TwfUn6Taff/Wx8rVdOJtCLPO5q/BcwHPkF1pDwP2zJD3fndYzBNMpBAwrF/O0h2We6mL6V+Xb/Jep/b9O4fm/40ZBTKDh39ykJBCa7PmpfNwi2QJG5cDPseow25ZRK5hLfo/E+DzoI3BiDznjzqbOoot83J8sJkBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950919; c=relaxed/simple;
	bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXlYI/yuuKFtRtu+oPysfxewIzl4wuN0OgSA/ueGyPExbpn8Vy+MU4HsehzkQ8BP4/7yFlLOlvQ+yeQ3HmojagmeK+n2YanzXK2SUhBJlvkqZhuiKU/ddRS2e2FRpG4IycFqhjrIzmvtgxsQJB5rP+saj63i+R8VBmlZ7nXXIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B9t3ueg8; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B9t3ueg8"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e4034b4a6so281888466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950915; x=1791555715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=B9t3ueg8Pmc+KrU6E3zhTuRIBbhheBto6drE548IyrDTB6vVRIromBM23EGoaNb61t
         fBIXt/BJBEjVZffWrxii6LaStWtEdW6L8Ei0cAXOgnra6yKjZzud1aAQ1IduzZc2K9T1
         H4/bsJkAcfd1QBfSbYBJVl25i0XxyZKzvSh+Swn9KJz0Ve1txL5VuYlWqDxgTb/Yc/aL
         xT9Rjd6uDqm4x1G9taR8y/5YGgJITWlbJhPuTgnY5/saty+9HU8L+ipVuKn0Art3/XqV
         UTyuVmogeRUBvv8xAgUCriA9Go4fxDb5ingSGzfxcZZ5HnWEkp+tLDJUV6eH/Ws8Nder
         al/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950915; x=1791555715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=oeTSxLAH9XtosmYIWM55w06adJD173/IAcPUJ8HWilglXjbzVBXhl6DRAQwSzmi5Kc
         nY1ZUp+Grw3Q0a9g1Dfo5xVH5cefVYnBFFt6+CoWxRyiZ+r/YDxpgDh2eKNl+QWQoeci
         mQFHQCdChEw0QHil3CfU+m4GX6fpGjbKpHSMlHhrBlHjOc9XqmXN9NZkBpPJwC5pEbrR
         C0sNxTiqDwU2xrOn7bnM6ycjien5zskVByAlnXiKaPlgwJoP6KF8UiftmOu5UBwwz0fG
         RvzhVBuA3fFyMAaQv5iP8zQgsxrTZj3TtBgLA7NqdO/dg5b/HUJwgiqdo9YoSPtTPABv
         yJxg==
X-Forwarded-Encrypted: i=1; AKwUvBzOh01IJtFO5MBxm4P6EDg35eJkE3CcNTSY9qnbsWDYXhBMAie4d3iYdMdp9XyKP0NGqgJ7BIeDIXi2RjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lytzH3K3fFvacEH/KiKbjBA3i0oL2X3aA02VPTgapKWBD/9es/
	gGYbsrNM0oKiw70pXNhsSmExsF5/S/mCX+/EgklRTAO/HbYXfkgEPNacBkvfyKhTl0o=
X-Gm-Gg: AYBFou0HlSEZ7HJRsF2X+7mN1NhOrn8VV/xRH5o106H6ea45x50rWyP8NGSzkKkkgVP
	ndSQEQCERV4RdC5iraX63z9AIvZRp9KMdKSDl1jFmxEXPd8emsHtaS6sxtuM0+lrfBd0tIPhG0L
	R7l9UyZ0vaG3Ss2RMaJEmRJST7DIGNpn7FAraiRodunu92HOA3rR3oF2FD7ZbJe6/6STOvx24XX
	1V9KeZUPQ6cvGCac2wF6gq+R9SABGmSpFpJ8M2bTpyVBS9RZn6slr+e8mkuH2weiUGxu75GgSz3
	gnERxhF3ApcBzS1xliyjKYpzc3gdEeP0FZD9f5kGJyTyP7TzmojSYfkLQ/St0oL2oYfHstajnaX
	xOEtVcDVAviK4knIad2stjXAkM3dDiZAwi66wI8y66x/GoTQ27ZHPQdgid7HeosoIfulIMt5Vg0
	8+P4SjxuXAjahJHEijN4JbpKViUggq7SCVO5KHS8HXTJB54Dc7o3sTsIsZhik1hmHasmDWxZ8+8
	9Simr7viKE+/f2ihaKfXDZOfYhSefzXnq0J4d+9cu+Wmm0fq1HU
X-Received: by 2002:a17:907:96a2:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c2e4ae24de7mr253246566b.36.1790950915541;
        Fri, 02 Oct 2026 07:21:55 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:48 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-4-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
 b=0miXsdcT4VeM7yvVFtm0Wm/kXPYBFutnMKbTczS6I6lMKnzluxR7nVoKsN9W/y0nt8zJB2u6F
 MQE8ldE2YMNB7Ct6Fs5g8EPCGfsf2IZOaucOYjNGRNOcB8ACveXIb1P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4e8777162b53..11015c3fa331 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -709,6 +709,49 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -872,6 +915,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -906,6 +963,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.56.0

