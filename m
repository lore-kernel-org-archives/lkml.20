Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458231;
	b=K9wte6MMJJBqb1y0DdlS5fG7F8AsY8qqRczmxlrQkyrtfCXNSK6LKyGMn2a4QR9tNj1m
	 tKmWjT3Rqbaesunc79y0SBUl/AzmPGdE969nmfMxFj36/TnLKhkSVO606Tb2pIVz3dync
	 1TJ9uqQznYP93ZqrYULiQcDAZ2gwkNcTiSVoLEp3aEJqPZ/DHBTPFBxZPKGohD9av7Xz4
	 3q/Hq4FZ8S95ugzL437OqsffzsSog/3lFjfAGnAYjLPkcqnbcUVB+vYldW7o9XlADfOIr
	 aoxSPNxqXNVLx9goG/Xj0s5bPLb7arFioFZML35y5iodsyQ2uWwpH9V0WhYAxye/Xjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
	b=2yquttMrR7D/qsjZ48gU/F8I1IK3N69ARo9Ymds7ksRveFOUw7fID9NDQ5XaGunq4esp
	 h8zeFc8OX/cnSYb90KKtNoEZQK/KrGmvlRhE7CUv0I/I/5ZW7YU4gZswqkLl9XzTzsVfN
	 EGrwnOtVgdXkjg8tMjplF1GIUmBqbY5iEQHpN0lpC/1kb6jKys/6hYNPV4xzKm4vNgIBI
	 KCux4c/TlC9BECY7emaZxaRD+2EzwIRdP+0FcA2KLwXJxCWidS59I5yn9lB3Hznv25ROz
	 EQ6H6aD/vhq4KeURH1G/Xm9vjL/RBe4KOBffJld8ys/iUuRusVEYrJaDU7BuekAHB5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A2606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0A2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zdk62135818
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=; b=JiUW5nH6QF8Bg72j
	Y0mJjxcl0hRiZ9UCxgcsak2E7A6vE1Vd36XXK7I5uRY1HRlqb+IuVYj25sFwep/i
	VGa/8sjZdtMj7o17B29n2zMtWQOoQdJg430JAzXBvQ9FWfriidyIvplmZP2Aw4DE
	QUWLV3zWmK63E6IOODTnLswl6MQHIMg2O5EVTlUlFiZPosGP4SOPRZE5lvWW0wE3
	7duMRfDi6JPVnSl/xM7uTsTAbY5yuMrzBX3FHPQf8J7r3qqp8vIcvLq5xyQWk3s8
	Urb2HJ98Mb1SMMSh3EOUmVya2bY1hgao6yxSWWgybMAr24YzaxNxWC/otjh9AOAV
	gewm2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjv09y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so391436eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458228; x=1795063028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=awj2mZix+clYa14MQ62RYXc9pjuX6vADvRsDKNXtO4ikdUffjiw7zwY+220oyw+YMW
         3GtqrzkFD9rr0WpKx9y/E/aWX7Rw6GCTZR0Vr+pCO1zIfiY+zNxwrE71BukfRZQU5bmn
         PqMVnlQY+KdYV3jnpUn7Z09AueRzR9+mHrICFWPz+jiImfJdIlOO4jffiLrER6tU++2I
         vCWK16lLAWx462e/fpFaqm+nFag0ZCmsMTa7EM3KwcoljGbEslGVb2zbueKF56VSNb1a
         rc2pfEyLz+OGNPizHf56ga1DTceWL3Z7hU5YPmgXUoYr+/N6G9DzkAuy5NoNdc0O6FkL
         mohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458228; x=1795063028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=KH8dxDRI410DN2aZNNa9f1ys7nz4C2Exo/82lOqxnwnavF3rIQYv6hirfoVp3xQ0HK
         /5PJAYwUdjzpmrbHiJpcub3Tvw1U7wxXL3Cbe466f/Emfm6+2zH6X7AlxrsKSGPQGcBo
         9WgcnR0eRh1IShkDCO64n4PXrwNTAql8zSgqwuodPZtaZJN9rFwAQNwMfEIlTCJ3R1Eh
         0K+thwcXhKF6ZsgSKM9rkvSzZJX1jhHw/y5yYLSaWyolNrebE7aJR8g98xHBB/r3Yhiw
         BDpewRJjh8PRLMbuGAjwFzKv+TrhvuwH+OeQQr8e0TBILTxRk3zoCz+GkM6nLz2Mos8q
         n4Ew==
X-Forwarded-Encrypted: i=1; AL+hErF4g1LSQ9rXRG2ZLKE9cuX7nBQoN1w5+t6jKrtCa/OCHZmcW3UDOH6GI8rKmZgX6uTw4asDm5oWUyA7tEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lFa6TlN1cvdS6pV+ueQkMMBdYoW4KNRo1G+LLrm/iYCjs6hI4
	UZzJKdbc2yoYwsuvwGFONkMYfJMpJ07E4Dq/0cxDsfhasQfm84HxhgzAmEppIGJcGjE3YGpfQr+
	AkdglMb4tLOitHsvHobzw06tiKwT8IyEn2Yjr4f0ffQpv4oTyXWV1Ri9UhVYWiYZMUaI=
X-Gm-Gg: AYBFou0EOZ7zj2oixASkVLc55tewn0A8Lj/zzFU5ON0b4Lagh1/XVBtyTHFC0mcGCdk
	8aN+REN1p0EWHKqxtloqAkciC2sYv/JleY5J1+l3En9jlHW/qwDPXJFWdGzVOYNdIH+9V2X9/Xu
	oIztqS9BbwKDE7icJwGREp2N/JpWeV+kWD6UVyuIOcQCwJeUNN6XVvmdMXQjkQCDnO9oc7vi0lr
	Xy8mvTx8bT0CFmiyRddUYdZrcpmKQl38NjT05X5X+Dicw18XWh/iSvVW3cflZlv09JqXxQ2zSTA
	sIf17Emk+hYUPlxDJW6MInIuA4+eL0nqXBZGqsoE4rDNWLzmDXZvkpG1mPAa0spEiAqYlVhxXtV
	uOruNUs5xA86db7sm2aDdyU3B+kNmJlRJq7CDn6uBFT0cMQ4O73HpyYasprwqjW+YQutHPe5iMB
	oL6Whk7QAvbAwLOU1/J+l7eo8oAhDmLPmsevdapxmw7s/s6zfqD5qWU+i44cs5cPZGUodQ0BIcs
	Eb6G8Q=
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612430eec.0.1794458228090;
        Wed, 11 Nov 2026 20:37:08 -0800 (PST)
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612403eec.0.1794458227377;
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:29 +0530
Subject: [PATCH v9 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
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
Message-Id: <20261112-08-dts-v9-10-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX0O4jMtzD41Nm
 4wdM0TnSTB/MCwQLTnwYQA2Vet/xzN31K1iBgIvSoMpbpNazCKxk3HH1/4/Ss6qyMo3vqzUa31i
 s4blnZeI1gLJ1ZG32TZne252TbYhvyXUO5mULwWzD/HkuBcA7VMlHIPR+jpGI8pYb6E232ltjJq
 DDs7ii5gD2UCyYqCT9U77fBZ5N4dly5c4Euz8COW2KZ168LdWCvHi9Eqffw8UYp66KSNwFgfQnx
 EE3Qei253XrIfeIftFdFKlgJ6ItvRKw3m9z/JYFeqckF2HRn0RT1vZQqOLm6x8jM+kANWTMPzb4
 5JiMMBIeQWOKc/doW3uzHRefGlhn5nF0CrRpL/9/SH9/bcj7UbpaXqoQ4cfpY9ufvIkYyFzYRRV
 QfM83S3VAsdEBuUHn5OjkdYMLr8K0b2/3asyyYpNwKXlXMBLfehQuB8nkNUhy/cVis4Yk8iyDl7
 40NZ16paFyN8aE1pLZw==
X-Proofpoint-ORIG-GUID: tV5CbcGfhccxob_pxqDMtSumIS8hlqg1
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af54275 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: tV5CbcGfhccxob_pxqDMtSumIS8hlqg1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX0GrRFCGcFl+D
 Kzga8FRgBY5lJnzQ+eEXDMgA2RcSjWoTE4AmO0x9wL8c3zxOGNocFEm5aBVuZe49bzrM1VsOu8Z
 4zhekR6/hN+54ai3QZN4dHOL9UnR8a8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 36f874e57b42..052c2f3df94d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -181,6 +181,14 @@ opp-32000000 {
 		};
 	};
 
+	spi_opp_table_50mhz: opp-table-spi50mhz {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -459,6 +467,18 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -495,6 +515,18 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

