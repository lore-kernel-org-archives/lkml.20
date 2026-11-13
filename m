Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557801;
	b=wvNozeWBNnK4HE5vXUWKCAMiyBb8e1uPYBvonPd0etUvZ57GDhqFZivt1PsNPop+vRCw
	 EwRPhMdH1835FFq6WK+QlgSH6kpk5epE6pHyuJCPsf3b6ot7iGjYyDVuMy4e1SLMrOfma
	 rpvnFlIxTJ4nxuEH1gT3KLLAL4O9gq4IHMpKXoXuq6S8SqyVXfvoCQPO0rZ46EXO2s/eW
	 nvvvhL77M9ewymcnxZGTon2XPMKBPhyzTe24JUAeJdp+mzpz0Gxu1F/2qBGe6O3zf7QHO
	 CJ4fkq3oQ2Qevj/kwSpWZ8jPe4R68UrhbkIx1+MXbqik6gjrT3tDll8Bzq8sWZFb0eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
	b=V21NUFgb223SiTjFCNkJ/TNTEnZw4q1v6u6Se1u0evxrHOSUjhIeKa+74mHlW6lVFqI2
	 6XmFrDhJO2hmWhfwkIflPw2p5m/nN27uYnlxyd7sSWJzQpE+XVEHrGN4jFANRAtOxaKeY
	 n13hRUGP9aQ5HLwSVqv0JMV5r/trgzJFxKpAd7D9ONNfLWDk7kvdY0T0uUIIlUVwQG8VB
	 SF6SVOj9htnECL32/Vnmiz44/HOyWkQQz6v+Mlhm/Impc/SJGrAXvEiWDcs3cCicHxVXG
	 zkGMibypcu1axFV9rA/KzFnDqHA0WYpbKvq3TYUU2SsOJGjWbfG2RGQ5iOnzOpxMEHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9AC606A88A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9AC606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50604721c8so113452466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=gXcNDLdh0Slah8YZc8PKNyzBkj1Aq91LtjJP7wmzAyIX4WXfCbYzgnJADFAwa/fqnv
         nwBTueq9cA1vq8F6GUwm/HMjqmnepfWBp0KuERX4Hy8A7/HRY0y1KJxJLYx51KR0vuTu
         8OfLdsJKXyT5eAKeZ5dKgpr9H7Pq6HVCyV+LnqF/T4535BwLnCyVUEyPzLuyzolpEmqt
         SYbcUyXEOy1xzaLMYS1lCunGwTVzElx9wTp9pEB+54dw7QUVTFklD+RiHFWK5I28XXKL
         J7v3P2KczCSrnzaRwXwFisHLNYqXt8hj7W6QBI82xzkN1KIlSHQeGzpQMrcvppCq7cCI
         qy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=Hy5hcpHiFPLIwbdRgQHOlXUHztwusEyxZRDzgSk9ACO0VIdcoDXAnHXDI05KRNPxot
         yVtVlrs2prFNqm6yBEO4DyIqVtwhHAcPApWN1HMrZ4Sh4JuCOta8vz9URPjm+rWq4YE2
         IKHL8LCaMZfsXDln9wiOhmePfX48lIlWi+J/7mrY5/GEA945+TQu4vYNvFuHlqkw+mB1
         Q7ThpIXPuaqCW7YEivgUzVn8MkcRzU4JBGLmf5+HBQd690wc7DGJEq5cHLFO7k0sdVxD
         WanNAsqqbMuPtiJJlFxFu+Z/Us5t9xhuHGyEyXrL4/xI6Zrc1ICHJqzdmWYnqyV9MrTo
         D4Iw==
X-Forwarded-Encrypted: i=1; AL+hErHlQp/f9kIezNtAsP2w3qYmGXkLF6Aq+wRSnzEHU5CYa1Vv/rl5faRJqHh65d6/qrpo6AqfoYmM9LTvmBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q0Bli2nHLVvDCJdvb+ZH7iGjBKpljHtGYmAV3zhIjIF3ePfHq
	ayGaHx4v/hUvJSG2bZl1mad6YuGNFiz+IzZIycQjl+hDiubwNUiOcJy8gBz4Mib23Bw=
X-Gm-Gg: AYBFou2UmHMDmVdGFJpmZ90h4GtFeNG3snQk05FHyd7TjuMYSXU/Jv8l1GnCe2NfIIw
	gKiUSTsFpNWT9REiv8nfaBFUpMqu1Syli50gukQ7FM95kQrJ27HgwVpt2eNU0IYr9p4lRlqzRK9
	DhCAiA6nQamnlrVINVi0fZRBMnIcpkHaqT0PHXtqLB92MZrMZne+2DDPtoTbpurnMcb/bs5RYOS
	BUzW6wQz5Uw3r12OOqvxMfh8Of/vFNE+YW2GAIHivMxauPnneFEmKjrNkgGiF5vP+ep/xy04Vo7
	R2WjYs0eGMvcBqVldCjxuHROpSJkytvKpJwZD3Htv3CQRn6/Qds3e96bZbzAeBfL4JYFXil3V8j
	T3bbDq8WvQiL+BXd+W9RwrgPR/eim79WtU0pF3CLtMMk5BO340k5XgrNvl7TYWNw13Qrn+DbS71
	BgKMczT/w6kb2C3ySDtSDsxqRsns1K0wbd+o0byWBcLhjWA/SntCZ7tz5PmzuT4a2EybPOfp+Np
	Zp2Pt72wQ9g962XDbHsJ4Tii3FYGU8IYvF8YBC5I7Nk6Kd0wGgAlowQCSS/9LRn6AYwi6nszna2
	hX/lpZHojrhSG8ivFGtNTnLdFIJ9GMTFKHn1wig7cUU4siOHUKDsDeCni5m1m9ZYwhliOcO4MQB
	qVrDiUpsZ7EBZMGtxPR6bbITo0e4l
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr142812166b.18.1794557799688;
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:36 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Wire up PMI632
 LCDB
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
Message-Id: <20261113-lcdb-enablement-v1-2-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1750;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wQ/by28OhYBe7ilOwgM0g82bOPZkl3Y5d/m2CTiHTQk=;
 b=xjIQGYG/TkAs5AVuy5/TMPcmDtNlgeT7SLb6wQ1pox7NXz9Ag7KKDE2Jg7Bzrl5jRDReHViPt
 48kqvPIPV74DgvT0WZjTuVj1XV6VCe66T0+9a2YtTF3JIYZ+u2Gz8Dz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 3223884f9cd6..77331ae6a692 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -72,14 +72,6 @@ vreg_cam2_dig_1p2: regulator-cam2-dig-1p2 {
 		vin-supply = <&vph_pwr>;
 	};
 
-	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -175,8 +167,8 @@ panel@0 {
 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 
 		iovcc-supply = <&pm8953_l6>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pmi632_lcdb_ncp>;
+		vsp-supply = <&pmi632_lcdb_ldo>;
 
 		pinctrl-0 = <&mdss_te_default>;
 		pinctrl-names = "default";
@@ -212,6 +204,20 @@ &pm8953_resin {
 	status = "okay";
 };
 
+&pmi632_lcdb {
+	status = "okay";
+};
+
+&pmi632_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pmi632_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pmi632_lpg {
 	status = "okay";
 

-- 
2.56.1

