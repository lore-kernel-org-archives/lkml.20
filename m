Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456724;
	b=2PvRI9TYe13z9NOD4C23Du6JjWchv3QCvIiQLPWkxh5gdw6YS9g/yXKvV//nkiTnkd2F
	 y51n0HeJsYit3kBFX2hkwhUjIE41WB1u2a1CJ5IDoWK9fSEOOYGiXZWssgOv0/KIR7hV3
	 jAxWXd6EcRzLc0ruu5no5z+RphUqm9h9xFWxlemzf4KdaB7Xol9MNblfEpMfn9jtu0g6p
	 M0cudREggk0KqidGlndwFhLSEOMXhL8hMa40/93L8LFky7Ive+Ns5yovOkz0WTfUrImqa
	 FxYe1REK5R98qIVROgqlrqju1o7oLqsKBq9nFJLB74odCFe0rFfYcZcNvZfVfQ4UppQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
	b=cMhKOyfmyqm08keQi+iQeFWNAyOj+VdnoReyi6Wx7RvNvPH5sMtQlaY1XC9QU/zqE5hH
	 zAn0k3C+19cO67S7hMT453FwoQ0n+xP8swQV1PKQSjCACRlKcui/YaMcEU5gSXu8Yg85z
	 IPLekwo5LBTmVPX+gZIehfntYok0mchU6rI+Agchx5OVxMxN1FKoDF5vtzBZO9tdn/FvV
	 H8y6GxF9oz90PmbcEqJWRY63dNhgOAlhBPL4c+U69uHC/7b/25xURVlwhRBuxnouiXcMv
	 en7xyC1aoo2qGKzipuy6wqj+lrLBZL83PnSM6NMT5WcB43cplC5NLME6gP1Uzounjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE1606A331
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7CE1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03bq3174207
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1uIfte2UHyz
	L3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=; b=NTQI0OQOlsqFt1vvRumZyTlDdB2
	iROByswjnbYdROK4c3v9MnOZsZ7d2jv9PII6Dr4OgNHvlaPDBNMuVmVBiRcmrXW0
	cKtV7S81lv3Hs4jnI2kJP4Dj0GE/s03rU4NiqHrCSGGVEzviRfACFBxXqvKbHB3C
	9r6sKRoqTZgsQZkLtbJZFCFlfslS9zGoxslW9UrQpOygy9EDheN+jaRILBQws8Xm
	XgPAwxA1zcIIE34+hkiqrkXqeU9ypVc6XwtovnKuEXCNdCxDqqU963Q0put6ud0J
	p6e+5wZromGudGN8ljm2v4Zcg6lojft0RGu7KLfNUuFxDRqDwvceHl34ohw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fskng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3092774eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456722; x=1794061522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=bsb+ONc0hutBwpLrIzH1YDT3QbRUd7COJ6TZ5rMf1RnOPtqj4FPsk5gVbjBUgzQXz8
         ye5BzK4MDorGYLUlu+ABJJnlKd5TI5exDNueCvE5+as8Ox9pGFNYEfrYP6+akTeo0bGh
         CKs8H7YXf0AXDd1x21aEIXpdxbbvAFcbW/2ia8Www03yohvqe6890BY7VPpJU9ZRQi3r
         4DZJZhvQKzvP/1H0lFJrITBk0/bcbviU8kjkvQU/jMuNlcaxD0Ntt5UoCZcSZ0x74qbV
         n3xDCZfRsM2FgeKR9GB02vFP0IM1I4yUZVT7NLrKscgHAbRh2167lYN7h1mEJq9A3KJb
         61RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456722; x=1794061522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=A+p4R17IlMC+D/zf5GzSHesgFDW6jD3obsVSrCDq/lXRzJAKmiiSzhfbDm4Pv7onm0
         Db/fYXUDsULjM1Yq+1DQMGqtH1jFPMegao6H3Vm/1hc5/ZVXNQcMTCtDL9E714uY/mDy
         95ZWV4HhvMpFn53A1OTsdv+tZrTHMNdJMxLU7k2LY2IzgBn4ZLqqSveKxCWC2Y+3ZhZY
         sraW8CL6V97D5Av5d6IwWJU0NjtPvvuPZdsSdlu/tCGEejTKgxKU6nxtALZf4cOm45Qp
         1HbEe3+B7+iRumo5Z1ACCwX+qt2RaazJ+Sq+7ZcDxRA8wS6N8lg39s667gZu9Q1Y7E/B
         svhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZFha6aiDxS2Rs6BIBhLPkxOh/uFzTDZFJT2LiI1WuSyBYypAn8Sdu64fevJvRNd8PnUtFIAjhyeW+FBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHJZqQoa0ErDjOTgx4dSZMBlqfNODiVJ+MelqPbmV5kSRgjANW
	epzMOXHu5Q67HRVeqWP5bI1for2dgNZUXQcXCu0d+4ZmVVLZMwPB6r4l/4Pvk/D1t5hjGdODEh0
	pgdy8Ulxh8efdE8Bx5af5RWIr0S7BlYnymvF97Wqv6MSEOll97Ki7ZuYJ9zdVuKGDgUQ=
X-Gm-Gg: AYBFou3Qo6bFoUPCq3POPD/Gk5xXDJWyql1Q2yL1inQtPs8K2xRM+nVOwlJQlU2Ih7D
	gKiL1wYV53gOP8PtppGNiZf3dB9ISIf+zzBTOPjcyHDhQOR1wS03M2CWyK7+o2MQ7LInDoqydF9
	MPsrYdU1dS2//d3aEplf5CwQqeslziHi1MiAVpH70kpZUqdM/rvqophg3K95jkA4QhRr8XS3Bgd
	MeuJ2ZF42aNfHCUB7OTHbgHPLnXmXuaIvc7O+D/CwIotv3b98lSkNHZAIG1/jpm+4EH40gJYuRx
	vXpFsE6PRAxezqefRO91XF/cIxFE0qQkc91LDQb+r1XJ/aGUZQbyx1L+RSK9Xu5EsKzCAXg06UK
	eAQvk3X1aIrr81K2Y2UcEv99/ivo/JvdHUIFRmhJofpoykZNsJYTcmvX1+T/3kPkalK+ncgknQl
	90axJMNqM/sCooqOLDEN+qglPjKZcdpWqr
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951868eec.37.1793456721975;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951838eec.37.1793456721306;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Sat, 31 Oct 2026 22:24:32 +0800
Message-ID: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX9aWd7SPj1glA
 7zxpXM8FPkDN1QS4Z6/yx5rW5V8xXm4W6nRItVUy0elM4MBdSF0IVtvBUqqTDIF4lt5qDLsdIcc
 OwRVMraqCbP78a0oKIU8w3I4eMfoiXE=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5fa52 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gHTnT94oeKYwnMQi0HXq2fqoZF3UjaYM
X-Proofpoint-ORIG-GUID: gHTnT94oeKYwnMQi0HXq2fqoZF3UjaYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXyuDzytqZMOOT
 oDep2z5vWTDHZcS+qpLWHxX4FmJcKV7ovjhmQIP38mvOfGRczAhfveafE7Ylxqm5NFGm/h4BCfc
 74lied0rA/LtdTD1eMkljGbVPq7/5QpcTApFxdvHuJ1InMZ4zpPooDEzuKNYSBUxZf0PDnl+tAs
 8JeNVT6QvzirwsYq+4m6ATVy7FegxgHmgs12vaVrjblLX0DAt5kI1F9P52vukgUQ5DNMixd6wqF
 s1Y5H++KXIknPTNjYx3mT9/kafqYUihb1JS8IHmqo4mEWiBlBMCJQYS8d0/3buRY60TOzXYpR+w
 smeruo2XbMSfCesj9c/gccKM6u2m2UTF8VOiK5xmMYNBuVTocrPskTVzbeqIScAb+39E9hjIN3n
 +uxHi5FgBZo9LlA2VhkznDT7gl/fMZwteBNMhLUnutO/2Q9/ldVq07gzlNEPLfXqKPI0gzQsszV
 CAH50uy3Qz7frcXSZwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 98dab85de64d..b23c1a81a376 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +511,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

