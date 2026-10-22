Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660762;
	b=nO2EaC5KeK7mJUzpFoFTZTpds3sIhURLwsWcK2C02wCDMTYEMFvFHidb5PlBsxaqBTxj
	 JmWYztn0oVIN456j0dDKIpmUVKO4sGXQl1lGAY5T4olPPG34JAypO6lt6wGARYvNflznA
	 2UYzzBMq2PomlKhMPV+aQbQzMOqs6kOhZTlWOBRBQQZ9fSmL/FdmeKPGya/lI2RTdky3j
	 6DsrHR3gihnNYt+efaFf7kwK6fziwAVjTQTj8YqY3/qdBOJAgPsYlgkdAKjRfGaBsp9GJ
	 pqAzX0blqJzg2ei70eBaW11IFmYWD1I5Mvfuj3IzUMf27A72BZ3l7L03XLP6Bc9U5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=mtdYLWe88mxgRglzPYLPlbUCfTUjV2fBgvp3LVp248PDfL00dwg0CASclD6UpwtVvqbP
	 Bc/6+do2FuCpHDHYHtT5kRsUd15I5bGD+d+jEro9V8ypPktB+7CtpP1iKIaO+hxSLVAJz
	 h5OA7md2ySH82IDha5kpEuL2lwwyqaggrQfpwJJCYOem5WQYVBSxMxZvQtEROzleX0678
	 msE9ox+l4wm5KAer5FFrU55lhXZ0/JQX6KIcqfGf+kkvpGNmQRL7Bh5oTWGbkrQn4HltN
	 /HTEUo8WtNzMwRrmaQsgETSeJoV8gBA34b6GE0HHnbow5ltSielOAxrApp2NHpslviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969660A2600
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D969660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4550d8ab15so201339066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660760; x=1793265560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=gXl5+Gb6xohglf6t2PtAn6M8rqT9TTuWwPgMpEtwM+UheIq1KRs8zY7QIDcxht8PzO
         1ZPZM24MgSPYmEEdlvK0bB9tF6GRM3hX8M4hvq3GB62Wf9Hq/BSjbV6k6rm9/oqpqI6+
         QD/pyF1oFgvvojgb2GEt/vc5HSrimYUihuOmfp24y37TXu1kydvHQxL6vb9gtANnAvNW
         xakS433LHUxbj9ne7GTnnkWXBBRj0mfV9/oSDK3v1XmBBlPsUEgzsLX+NgA23e+vDL80
         aCT4sMlH6auzjfpbhbY/VyDrvvDEth0whQcVz0H7zvh/+CvkNcpd8+MMIrL51M8uuflz
         7apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660760; x=1793265560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=AQE4OJRPu9l3hkL+dZPxI1WiePXQUxNF5gT988BUVdwyonJZ8YWm50npqsZrw7edBp
         3Napyd3H7mPhhFx+IPTuF0SelKjEAqP6kZtQgtqzoDgTluyPqfNoawLuDvuXbqNyCOCp
         uApOuaY3G9lvZwBctmf2fUo2kcLOWzyy++CNEJbTT2zJk++nt45u0HIAVDo4DNptjK/M
         EjqIbGJ+vkBxOnRV8z5iHjPm4aKZLZj7zDAmSNGvApvKT2DP2tD9NX7kXK2fzhMZINIr
         tuMZGGQ+EZw8X7Wpe1kfKVirAcC0YAbRg02dlvXXMilimVJcXFkTOKN9q6sKMECeWOnb
         Pkgw==
X-Forwarded-Encrypted: i=1; AKwUvBzbuSyleiM294oxNqsfEHFpyDbjKe1W/itvLNdfMNwaQohEi5Jd4B2f6zfNYSM7738aLWmiCCt2VKOTgk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSxaO0QuKTPfMwORpxC+oqKyuCt1Mm3VnGU2TDKdmRP8Pyq15X
	e6o4SS0KcIA4dKst8RdmYRgETpKIyRuJiQHIaPxMScH14twcuMEh7qdU/H11qrQ9iUQ=
X-Gm-Gg: AYBFou0BNJCwYcOR0D6oYw2vSJxeGCIFfptNz45tZD4IK0sMNxHtnjKAauM3/URQYlu
	mmgjUUOtfYxjhJpd1w8gKaD7IpQVgcK65aSlEiBEhgLQcN4/f2UbHsdA2kAjJS6h0Mrkm2S1t5C
	q4UZdUDCT9mDcpGoIzd17wbSERbCxP9DIBdEIieoPsLiWD1NPGUVF1jkv5+M4HZsnPB9BnzJQ6C
	NyG7W1RR0WRDXWTVL46m2n8R1NRRutpw2uoY5r8qgqk3UmedA+TTJS0/QdHfI8ptE5sZZt5qM6B
	V/4/pCz8p/UvtjNuQXZm70Sy2Z45q6h08LHxDcj86x23ijPLN5Uu3Z9AOIqxOkW6p/lBMrxS87n
	d8CO7ftHFpxtxVhqvSZdJFdXclSdqDn1IcVZl0CUvm4w7WTzEEDg8JfXWbMfeP1uND5gOJEM/we
	fmagJPRDp8n7ljzg5HgWqEOeLKT+RfvDdCpvE3oMEer1GfQJnZbsQ2zMV8orPViWwz8TKFeFgSl
	F7Gy5rNDqrYBZzQ8b/PxsormiReDf2XPzkscMpEMTohPtxMyP2UHQ66SzGwOK0z+FyIFeHEKE3b
	8AJ7LTxbHpG8t5wT2iE0KFok47M9mRjYC43t045VPz8E87YbHEy41quz1ThuQKgJywVfEkL/cyi
	Zx3+xrvwkaKdSAedev5l7C5w+TaJS8EhLI1PZSfiLvhCPLMhfJQLt95E52jSWeMVxqGU+
X-Received: by 2002:a17:907:c608:10b0:c46:8c16:a656 with SMTP id a640c23a62f3a-c468c260476mr152082566b.18.1792660760257;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:17 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-3-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=7+N8AToHLH9xdV3tCOOMykHgHkC/SjnCyxhXQF5Xbwj8wB5CmBkIGumo/1wSKGWDi0IkaKEly
 nKKRh8WkrzOCBsnRZcvh+pPmdQcgLeB6bDtrGICgzm2J/XqZ0xXceoc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

