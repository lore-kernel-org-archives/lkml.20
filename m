Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B447B43A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254462; cv=none; b=SxN+EUYuQePnjGNcojG4XyxoAFrU/hN6su2iLf3StiftOIZWqFJP98mTgpGCpbGlvB6kjARpoYSkiv3uhLalU6FrHvhDzF8NHTOiAMyGYXEb52Gc2zwJ11+i6BqXDRhB5vVL9xFKU/t1pjl2MCBVNuHNwUkAEmwHLpmKxuGdBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254462; c=relaxed/simple;
	bh=aO2eMioyOB/VcOtG8g2Q5/E7T79qL376zs9BEmEPMe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hk6YgXmhym7/T5+w8UbkJuE5wuGi1yOvVoTsrDto+lEIkUqsjTKyzflN+Zzy/pk9CGcNXpP3RnZd0QkkcTvSbKFZZQruEkZdXPVca15PNAkyVwB034o6v9mpaIMc97OcyMTppYGLh3CUOjIP+GyppP7Q7NluFKq+za6XgXuQQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zJktN61h; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zJktN61h"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c253425b253so95279066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788254458; x=1788859258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=du2ocNQni28qqCR806uGIh11ko8Tpsyo/Ip5FqU2z6w=;
        b=zJktN61h0U58NfXcn9q70izN5hre6+wjwiiLYA9ki3Ic71SyDG4xhmipQWa4gjtWEo
         jebaLKjLIwJY+NrkiIU2WmT6U1XwHDQK7RKVULObIm8NQrBNjf2744ODFGUQ0cNAqayP
         Al5LY83GEyw/eE+vOEVbXkM/gYCsKUcAdnz6sik7eC0oq2LsodKp9OzVClMvFByaMboo
         9kwh5/gZ0QJGCDOj3ANtU/ot7c9GafWEKUL/ubGJYttUx8GPZcWK2NdpOrDLiOOvgV7x
         yvRW7EXUfGifH+YObHC2lXHYoyn+UEAgYPqhjRzdF6crI2vNU2k41SDgkCIP3IpXIaqi
         hBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254458; x=1788859258;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=du2ocNQni28qqCR806uGIh11ko8Tpsyo/Ip5FqU2z6w=;
        b=GMKGNqbAGTjMFhF+iZF/2/TYx6sG/i9SpKOv8sTZcXKOSwbG3CzZpWRb3N8eAX+M2x
         kAXWfmikYJ1hi2VwtwxKueq8o5jWnetUeIUaiC6leaEIQwJGEmV+uypB2jwM9vVnrxrQ
         DZK/xgUu5FP9LyiIeWkcV9vNsHjgzHeRORsMbFA+qY/aSWWVFkv2N2oNghrSeZfXJezN
         nRZFum2t5M6OM5qwA9huVu7cbB/9CKSoQm4khWQkLEUWPbX2Q4HIKjb5D/krXD7OX8HA
         7MTwW434gTfa1XJL2GFLavFUzJSG06G+SvqwXD4XPa4FvAOEsgLANr9Y4/v1PKgi3JDh
         A2dQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHTUloYrcpegB4UNvDtZ5/hQ0Zv21W8dPkeNXkJn+AB+GNmUr+2PDagr8+o8bEHi9k05hX4tOBH5SoHoo=@vger.kernel.org
X-Gm-Message-State: AFuF++kyybn/rBS7fYh+hAq7L30YRyPgauAsHxzFR8IbTjdySAa8pqMP
	GMiyFRl0g1ATK7xeLT2Su3cBxufJpOC47svqK8O0i0+s7qY2FET2LfJThPG+n9KhgXA=
X-Gm-Gg: AR+sD13xePUhkbJTsSVb8ChRrIGhqovJABv1Wn/uU9ZWkfseCa8trqlkZAWI7aOYKyk
	mr6A5PMkilXA1bRWNEMW3xM4ou4DHbvrhKCSKW1vAyUT5pvbTbFvqeCLHVH7/TY4teFYrgWhHOx
	EPFv4zYFV0PcdlmbfsAT5Qn88+uFH8aBKvjB20MtX21QECiHXnSlYR4dTqFCoFnHyKxX7MmPz22
	0QWpol4lwDokMWLx6bplw5O49rNnkkfoOmH9p8ur2Ov7Z1ub4rXOTNFIWM49ruYsyvRBQK/7+lO
	cTfEPtBtLORZDcFdWt0dSPazuHtm7NJ7psqqm/lIOSatWiOBCqiqgpncNK6JmGhq28di3gvjTCB
	Y1xhDDaHywzNw2Sn/7KVyTdkIcUM5bNXFFAjtTgiwoeHj2OxyaiPbHiAHr+vCYCIh77MQcwB4hb
	LBwETDhAcWHJad2qLmiSnQBP9Sd4MSi/yploCD+Pm5ehAPOPfEMuR48ZQPpOHSTM4fNFLIFgO6c
	qGiA6EwfPKE9JddRkbT6DmtS55rHkL7Jiyrkjc6s9o=
X-Received: by 2002:a17:907:60cf:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c2556bfba7fmr2070373766b.6.1788254458608;
        Tue, 01 Sep 2026 02:20:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249468sm544122966b.56.2026.09.01.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:20:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:20:56 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply
 for regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtow5TVVxEPtWYzMraSrEMZe
 3erHr/D/29grMIG52YD5VVM5qnCHxpIjzgNjHKvBnJ0csF57PMRlYcyxmVWtJLz+MZI1HXBt6k
 NBDXNyr28ftvL9W8rtyen5fuCff8AS3Yg5HgAAAA=
X-Change-ID: 20260901-fp5-regulator-supply-a2288914c492
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254458; l=3901;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aO2eMioyOB/VcOtG8g2Q5/E7T79qL376zs9BEmEPMe0=;
 b=dqe9PVIolixAt/+8bKDii8RBAm2SBzQx4An5Hy/u5Mhmd1UmtydEG8tKvdyEyiRyliY7IJRN5
 gSpMggRi5I0BYeBi6mUWq13j1GVYKIFsjyn/jdKz0HJ4MR9xvS42WFd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
the parent regulators can be enabled when needed.

PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
that regulator is not modelled as regulator, skip the -supply
properties for those two LDOs.

And document what the "missing" regulators are used for.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..e9bf2faf6628 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -196,6 +196,17 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
 		pinctrl-names = "default";
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VTOF_LDO_2P8";
@@ -372,6 +383,18 @@ active-config0 {
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm7325-rpmh-regulators";
+
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b>;
+		vdd-l8-supply = <&vreg_s7b>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b>;
+		vdd-l13-supply = <&vreg_s7b>;
+		vdd-l14-l16-supply = <&vreg_s8b>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "b";
 
 		vreg_s1b: smps1 {
@@ -380,6 +403,12 @@ vreg_s1b: smps1 {
 			regulator-max-microvolt = <2040000>;
 		};
 
+		/*
+		 * s2b (smps2) is ebi.lvl
+		 * s3b-s4b-s5b (smps3-smps4-smps5) is VDD_APC1
+		 * s6b (smps6) is VDD_APC0
+		 */
+
 		vreg_s7b: smps7 {
 			regulator-name = "vreg_s7b";
 			regulator-min-microvolt = <535000>;
@@ -414,6 +443,11 @@ vreg_l3b: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/*
+		 * l4b (ldo4) is lmx.lvl
+		 * l5b (ldo5) is lcx.lvl
+		 */
+
 		vreg_l6b: ldo6 {
 			regulator-name = "vreg_l6b";
 			regulator-min-microvolt = <1140000>;
@@ -443,6 +477,8 @@ vreg_l9b: ldo9 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* l10b (ldo10) is PMK7325 VDD_ACTIVE */
+
 		vreg_l11b: ldo11 {
 			regulator-name = "vreg_l11b";
 			regulator-min-microvolt = <1504000>;
@@ -509,6 +545,16 @@ vreg_l19b: ldo19 {
 
 	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1b>;
+		vdd-l2-l8-supply = <&vreg_s1b>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s7b>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "c";
 
 		vreg_s1c: smps1 {
@@ -518,6 +564,12 @@ vreg_s1c: smps1 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/*
+		 * s2c-s3c-s4c (smps2-smps3-smps4) is cx.lvl
+		 * s5c-s6c (smps5-smps6) is mss.lvl
+		 * s7c-s8c (smps7-smps8) is gfx.lvl
+		 */
+
 		vreg_s9c: smps9 {
 			regulator-name = "vreg_s9c";
 			regulator-min-microvolt = <1010000>;
@@ -525,6 +577,8 @@ vreg_s9c: smps9 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* s10c (smps10) is mx.lvl */
+
 		vreg_l1c: ldo1 {
 			regulator-name = "vreg_l1c";
 			regulator-min-microvolt = <1800000>;

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp5-regulator-supply-a2288914c492

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

