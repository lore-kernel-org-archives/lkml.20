Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913796;
	b=HXzGKLR3Q5vybmxy7AbsbIBVaTHgk57QRTFGzuZWcftWEEL8tVwLuRjpRIZRgqPmjpLO
	 ntPniti6kzNbBtHGBtOylKnc05oGZeA4TUxQzYnExm2e/+hDFH5yWzBkdMoM4BqQymM0b
	 rGCffLKP16E6KxfD37KzmPN1qfV8Nep5IRhhjxEuqAeJCFqDh7JgEahf4wQ+T4jXrRB8l
	 1GWqooyN3FdCPgM1dRAVUAG2NpQ0E80EWg5iIEPRDJzkDUC/dVP2tr5foFx4yv2ReKB3I
	 bImfrn1ohtsNJMXqF/EjQS54dHKkD5tDLbdtiqG4hii7U/QNiB0I2Lpbqu3xvXFAyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
	b=AbxAt4608aOWVUq0cDKRu3oq6XgDpvxPc+thnVYif26/5N/GThWrBTm564DWGyqWiiM9
	 bi4eVZfOd/ap//G2I5n9kcbpbbaC1iPfDfn0R8hnrTburxIRdTb4FMrifyOGLdBDK/fa1
	 +uAV2jd0iKudjNUNvL5+q7GnBpS6L4ssoY/O6U/d8x0Q7UcT1sZ+/4PfSCWcjV6V6T2F6
	 bIkwmsJOEsPmh7n8USiFYRP3q+leTU7HUKmxiSrWDv0MbdM6pET5TBEWv/mS8Y/XPbDi1
	 VtbasW3ebGYDNpaJJcBKco0JyI9FNR7TZ3sZpKhTCXjXTq+UoXOM1W8dCdKjUQe7PHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="1paC/UZe";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B181606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B181606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1paC/UZe
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so5141608a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794913793; x=1795518593; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
        b=1paC/UZe7AOB1VNol45f0EVVlCQSmD48EMl+iRZ/V9Qe9JARGUIrTf6QIxI1RIVYD2
         7Yck65VF+Ev2boLZg9xgfX1MJ8bYraMhevW3X8pvCf6XSBFoE8eFLNyg/WIitI2siKgd
         tJyWOfxHoEOW5ods623LCo/Es4A+gtXev6T0glcX7CMo1gyDmJJxgDJwrXJqxM2vH5p/
         paAScXeGRWZ35Sq6wIVWkw9YcWrn/2DIRifgypED+LmArDa4yWSKKYIlv0gyNwjKXmMH
         ZyHQgZemAdfd6g5ZuwSSvBY7rqw3ThiUujWcT24d0PT5z95xU+pJRNPmdPfVx27vQOel
         n2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913793; x=1795518593;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/EqLZTUDMhPlkceDIaWpBG7Dtr/l00OcSGXeCW+uLTE=;
        b=HiOa4atocM4ErHE+XiRM0Rnxsv7rQAchLwtTRMlMaNh1fc2uHwXqzxgTePuoM+pvrZ
         q2w/+qSvbq87JLgl/eLnV9QRxWbwEaCF+lS81Htdi56oezkWpmPuL7mkFG2pQVUWVloE
         w87sVQoEknXuxogzzTzTLoj7aRi9M2idkICK4ZZH/WWsuDwQC3OERULbqPkE9s5T2DCv
         4sC84+mHt6UWB2eiG9KCzezoZQvxlN+Lg/ouqiKyj9GYH3Do6pU3D+qQ0ixQoIgjOfcL
         ReUQwDE4khC9xJzh3qtdDROXav6bBndJ64av+wm+MzZcFS+FTXlHstQInx6Pgor/Ldta
         cK4w==
X-Forwarded-Encrypted: i=1; AL+hErGpaGffCzuQkjYF0g4M+Eo/D7X0Oj9TnyM8s9LAM1815JDyZhxGbHZeYjdyiayZgX9ByarFvMWgFBxhK/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z93+0NWzxxZddNXVNdtf9UNg1tjVLtJ6CjKaKTxgcqjy0C1FHwu
	mbQ+J8P9fRCB23pwQS8Jk74iEaXe90CyWX/xWH/PknhcDUg+ZRrnzc/3PxY5K2C6NYQ=
X-Gm-Gg: AYBFou0HdSyPUwyGgkNd+iLDtEbYtjZXXr7NdVEsdGw8rjKZWW1tf+Mo9BUp5B5bbhG
	QnQtqpU5jY9oH1+ATNHTMRoMAtN9MA4dH253VKDMNzSx32aPSp2mfIQjQJsEFvYnUrqGjZKwObu
	UrjnNo9o6nrD7SpQ0nLGUW/wq+Y0FwG66CrDDtP2A/np8Yc+3xuNIlo5IxeCylB7cpBkWNQAQxr
	nsVdCmVeQKmYHXbNXoQfY2c9LpDOqEC9Bs9XR78dyUVdxXv4lZJ6mzekzyqJ9VpBpsjM60fEVsA
	bncwU1J3gEbGbc7CN4JRsblGVPlTv4+OkUni4j05CTkQs4eCRGMD6w/9vVpGWK0ky5+oHUU1oi7
	DymnecILop0cMe/ZsKPuqu4yYwLfqGZDj2s2Vk7LBEgJIxcWp/xvm5B+n64RvUZ4NJE1ItKrWjB
	tbD2i4+fYcP5A+XZGGT/mPeSB0BOrg9zai7Rl4oj+ufzU4D7DgBLtZ82lyp6oR9WkXmIWEIQMYl
	7XF5DGNP51hCQslTBQGHWncwvry4Erz9MMhi9T85En34CK7PAg4wNa6Lvg+++HsDHCgPrdZISWC
	N5u/floLzOA5uUyhcDqlm8d8qZwWLyNSxvgGW9d0hrqCKT49tBipeKhdAI+sEd9qFEyvaDX+VZW
	9PPP6EmI=
X-Received: by 2002:a05:6402:5630:b0:6b6:e857:19d8 with SMTP id 4fb4d7f45d1cf-6b7c0bbf8ffmr7846372a12.10.1794913793290;
        Tue, 17 Nov 2026 03:09:53 -0800 (PST)
Received: from [172.16.240.105] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm5803509a12.17.2026.11.17.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 12:09:29 +0100
Subject: [PATCH v2] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
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
Message-Id: <20261117-fp4-regulator-supply-v2-1-d6585849821c@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZjSkEJdeQ/DouAUxiBtWiASw
 t0teACXL/nvvw0iBaYIt2yDQAtHdmMCecmg7c3YEfIzMUghldAiR+sLDNTNg5lcwDh7P6xYWtV
 orUkrWUBSfSDLn/P2Uf84zs2L2un4OhY9x+SvZ3fJj92fxJKjQFXJqjJNKQzR3RoOvncjXVv3h
 nrf9y+SRewIzgAAAA==
X-Change-ID: 20260901-fp4-regulator-supply-7f6b999e9624
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794913791; l=3743;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bNSXLD8R7osoKkLGMtIbMenLvf8i5vfZneGntJkMw8E=;
 b=FfB8C2ZPRRcId2mEBxFyqZw3SUgOavnm3FscUT3lfYHiRffRLkjc3jcbKYFgj0XgHbAIqrFX9
 3b5Z4oEKHu+Agvk4hGamlAn66l4MZdvhaomh9DSYo54itKAWGcLeYbS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
the parent regulators can be enabled when needed.

While not strictly necessary - I was told the RPMh is handling enabling
the parents - this adds the hierarchy to regulator_summary and not
parent them to regulator-dummy and really ensuring they're on when they
should be on.

The regulators s4a and s6a are a bit special. They feed back into
PM6350, but are not modelled as regulators (or anything else?), so they
also can't be added as vdd-*-supply. It would seem to be possible to add
them with their "Default on booting voltage" from the PM6350 Data Sheet
in the dts, but I'm not sure this is desired.

And document what the "missing" regulators are used for.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Drop applied patches
- Expand commit message (Bjorn)
- Link to v1: https://patch.msgid.link/20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..aa68a827a308 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -80,6 +80,17 @@ lcdb_dummy: regulator-lcdb-dummy {
 		regulator-max-microvolt = <5500000>;
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
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -298,6 +309,15 @@ &adsp {
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
+
+		vdd-l2-l5-l7-supply = <&vreg_s2a>;
+		vdd-l3-l6-l8-l9-l10-supply = <&vreg_bob>;
+		vdd-l11-supply = <&vreg_s2a>;
+		vdd-l12-l14-supply = <&vreg_s2a>;
+		vdd-l15-l19-l22-supply = <&vreg_s8e>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "a";
 
 		vreg_s1a: smps1 {
@@ -312,6 +332,14 @@ vreg_s2a: smps2 {
 			regulator-max-microvolt = <2048000>;
 		};
 
+		/*
+		 * s3a (smps3) is gfx.lvl
+		 * s4a (smps4) is supply for vdd-l4 & vdd-l13
+		 * s5a (smps5) is mx.lvl
+		 * s6a (smps6) is supply for vdd-l16 & vdd-l18-l20-l21
+		 * l1a (ldo1) is lcx.lvl
+		 */
+
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
 			regulator-min-microvolt = <1503000>;
@@ -410,6 +438,8 @@ vreg_l16a: ldo16 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* l17a (ldo17) is lmx.lvl */
+
 		vreg_l18a: ldo18 {
 			regulator-name = "vreg_l18a";
 			regulator-min-microvolt = <788000>;
@@ -448,8 +478,24 @@ vreg_l22a: ldo22 {
 
 	regulators-1 {
 		compatible = "qcom,pm6150l-rpmh-regulators";
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s2a>;
+		vdd-l2-l3-supply = <&vreg_s8e>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-s8-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "e";
 
+		/*
+		 * s1e-s2e (smps1-smps2) is cx.lvl
+		 * s3e-s4e (smps3-smps4) is VDD_APC1
+		 * s5e (smps5) is VDD_APC0
+		 * s6e-s7e (smps6-smps7) is mss.lvl
+		 */
+
 		vreg_s8e: smps8 {
 			regulator-name = "vreg_s8e";
 			regulator-min-microvolt = <313000>;

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20260901-fp4-regulator-supply-7f6b999e9624

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

