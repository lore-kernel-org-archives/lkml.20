Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE524A0144
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519424; cv=none; b=DoFS/OZt3DWEbUqE5B572dY7AiXi4rBETU1xBkwW5P7V9+KyK7IpXGCifugpFc94UaEF/D85pGA5Sml1aMgKwr1Y8sjYIibM7hwPDu18NfzPXLaDiXmlipN3chEpFcn2+nP/EpApp15fBJok8iEaMcy33Wh1VBbuThFybpuzR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519424; c=relaxed/simple;
	bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sl+2qdBNCA9/aH2VkkeIFCmt9jL4+nLAPdKct4A8o6eAIYG+ij+FQRa7U61tYVYhgfiJBBbafAVzIEXgbPbsqp+IockcsLQC+twxsQY056vGlNxYoR3EupYik7pizF+U8mmS4nBAmo4f+7TKWW7Z/Ta3o1ZHovfhcZyhM7Woit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SffWNdXl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SffWNdXl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so9357315e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519419; x=1789124219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=SffWNdXlvHKg2g2NLLdW3E1uDHrhocGL+phLuw3X19l6IFxqCPPzVw0+/N2G3pTNXJ
         xxYYLCGFosCVCqbkM0Doj1w61eQ9AXmwfewYYlzeV5u8iXMM5P5c624P//IOnSmmGztR
         fT0jfQNmSYl5OA/kKkcEmaiYrvKdSKmDrOXFXivwmly0r9JHZ5Ih7+QDY8ETFDhvVQy8
         AGPoXPfdXzZ6G9zhirXsJA/jL2PAwnwxObn6CZqhlUfIp6BQVmckEi9devJSS3V/xaoa
         R2gwuN8xUd+RzacJQWH+4eRG2ZyyAX3n7H99Aig63IlgqyiKwM2ToEroKikAwO7ae7+c
         9XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519419; x=1789124219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=AwR+Z13FJSNSwCLJ/1CQAauN10oounsUoqrHOiWcsctrc9NbVNog7YsOJyB4+1/7Hx
         /LQZeFe85J2MLyM8sYZkvP+H6s0aZSzdgUyY2oXnOXfxcrATsrZL1oI9/FIWFklgYSaQ
         gEdzHblYcJOh5jSs1xvgWdsCGmgMdjYBs5sZ09gOp7bZ+nZBuE5cz8QFMBg19WuQXP2F
         dsESTzyW19V65l7JTmm+jsrHpE0SpewvAwydLDtvTPDua/Hs5E+E7BUawysHh8H4ZVT2
         9V0bVoToGBfRR6Kfqw3CQEspsNOSd0MXjhmkQDtcWZ8s+yDjA2G7Y2zwMfJsZ45io2Va
         5GdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPrhfjNtWidVTpP6gqKaqXR9GQwHbdfxPqX+MIH7r3m7jdlGYQunE1MOonYjpC6HvJBzcVt9c5M7gmr8o=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Vhaa/aMbuoa3PFcakXbXQF24szStBr+YOkVr4Sk/OJgJ7C2n
	P5319zAxS0Pd0Sqv2f+TFq+ccHBFQtuT4bTuHdy2VoMK6l7HcjJffXU6wc2hyv8odNk=
X-Gm-Gg: AYBFou1mhgxlAzbe+CWxJzHWjPkCvpOJ3Oiv92pDJJzBuZWbB6BXsc/SQn0gqVVnsgo
	+eeREy9ALwIT4qdysaVtKcIvGANff1DNr7qRmU4nGw8XlK8MyfcR3EB3Dqug09xesBObPL1uphh
	KbnMn6+5DeMrn890o+Xzw4MjT1Xx7ZOFMf/YWHYZ1syYrJQNdF7a0tW3bnDuOKlJV3CQ8JVAfqe
	SdzyJhB7A2EB9JVu59QtGsdROtJJ472p1LOOqW1O743gR6jDepjyJnfcvEePKUtuwTx9TL8lQvg
	u3BZKsJASohVIyTajPr9HkHXR292WKsJBP7IRNcGDzQK7lVFyquwPH+2Y7TD22H5yr1NALdLiVY
	3fLjI2mPuMUCK8LoEsAls9vtErXfna/0UDuHYYyF8QcsnuiUIBeAx9KDpTzdsA5aq0YPBt7XI2j
	664sqXIpiz8NIDuLL9PrfbI7NiYW93+mLykS2diYVxc2DRFIOfOmsQKL+gDXreFrk28QceHUT+Y
	S63s2YhRXU=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr51267055e9.15.1788519418566;
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:43 +0100
Subject: [PATCH v5 11/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-11-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGqao+ihk6hv/yTdGMBJ10FKmgm9lhb2NlJrAev9o5YDnzW+7
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJqmqPoAAoJECJxO7Ohjcg6IX0P/3CW
 F3TzFJng0ML4QMxe5rFn4ct4OpS8O3K/48tK0rOqPY7Pij8kXlZJd/eqNKHfTI5fmp9Wib0C0JE
 k0mfeHmAoAjZnLJ/SPtPVxdgkcL6rC2+UHEUcpxVdhPl8TSdg6u5uNgXpoWuN0HklN73erfZt/9
 0rauaYn/O0tt5EZ+8bnk17pxWsoVFo7KFNYbPGMHpbNjG4Trwnxqq+7RKdo0WGqCb2+ERaXZa+I
 /bsfTvOPL5sK8m7KEl7okzAS4h9ZwNe3JThVz9EuUzQgSovBgpRykBb2hVUsrOfKmOobjKd/bvC
 vn6KhMCJQSyVEHi86hNmCeDV1tvn3qLEUyET/Q2QW2vFrt6XBE+IwPcz9kMCpF1sng7RiFpcVhp
 7CjvHG0kA+sHdOcWf7M5INVriupz665gPsIFGUvYOFFmf8i0gsdoY/fuCtinJd24XBzzUnunMOI
 BI+m5bMAbFeHw8dbNfyvvoWR49USf7SugXV7qMhR6y1i4H7Bp4tBI3snXju3kvgf7WAL5TH9LKT
 vigN3kNqzCTWU8nzmpnR3ysJ38ifpVfg1gvhHZoSBLefKXHucVyDGFT9YFJtHwMw8gU0f+ATHEE
 4apm/Cx/OKp1v5MoXZ1QRfHb8yqFGUysxgCOSuKenNLp29Y9f70Yd3hQ4suOtOnoJ0DG1H5tCHI
 k4aBo
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0a8275d501f85..bcf3e2f610e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.55.0

