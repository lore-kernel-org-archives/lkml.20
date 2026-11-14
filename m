Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=IebPMSVYbPs4irDgzYh6a0BAAOMsPCZUn2e88y9v8rJDZFxOKNUbyvOhFPxdbACS4/5M
	 80QgZ4cB80foP/zfVbBYVjAeibqCvzLrs9WpMH/LK3WooYUnyWeAQ0dJtQwmv6Z3Ncga9
	 yEXBwCdkCNrz0I016f+kgUwwSVVmiyiR0z5oxbMKcDXPfZgGUfBxzjiIQj4jxCQVW7MyI
	 9rovxSe+Etry9kriQUzXU+0/DkMTF+PAz8jRUTVaVh6YSLQxkqsTpNoS7FSsz8kEJvNal
	 79UHKtWMq0ypEMKsJhLqm64whWZv6qfgBtxDyq8iVsUl5/dh2j8iuZwrOpU1QuoQtlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
	b=xpERtqH7DGoxYg6A1UoDWrIKSH8k4kUxHkFa98pZPMx6r5S5YwBPhO0WkQc71Mfl7I3N
	 LrtDFAbf7GiwmCD0fAMUk+UWDoJxgRWh9ENqbl54arA+kD7hrwcJbLZJqiYz/RRDoZSiM
	 XWQCjWXT1J5s0d/fL8CopAyI9D1t9DSBK8iyH44N4dY+hPnggZryz/LsMeYw5iybCEqBi
	 M5TjA+dnERGon4YGkcfYB6gSfq08Qgb1DM5KUvH4UcU2iwcNSLXD2pOfqWacc2l5EXWhw
	 w1z+Nqk6CxHFf5fzU+nie0D1XZr0z55eprMl7Y8bxHh5hFvpxLu30tMqX9KkQbeCdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04157606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04157606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1xthx2695986
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=; b=KhzPPwlDNmzZsIoR
	H00OnEl7/kX1tlPRMexasZ/r7bTyeloozJyEU1lxIw3W0myb77SSMiuLLRw8wge9
	YpuOc8GxA8hUmmF+PTcdYCBRk1dcGYTvEGV3U368p9j8lT+WdDmg3m4dvV2g/G36
	MJGuwCjvdGtTnwFxOZx4cAlzcPM0Y7YDwAk2ehrjJozpKmpOkNIY+QFAJxZd7as5
	pDv5Kv4gNXLqMWah4QFzpnfLxp25i8m1lwnBQNiDMX6VNheRN+denX9OcbD7GEBB
	88FuDWne488pwUthOAMJr9J3QbC4AqG83DwIQTd/ZvmKLWUc82vLWodDxSmHQo81
	e9ce8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx87dsf46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso220664eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625767; x=1795230567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=TRqSzZJblMUO4su1u7Fa6h1vaEgSUBnl89L9HTjzOoVf2zMb4Fx/ycJm99hg05cRm2
         ZU5sthBFwslwGd83xmPzy6rZy/MEYLkAaBS0GBX6f3awnFkT4bGdhfc1RKPVrgjI/Rdd
         crpeatHXHawwx8pEqJeFfgyBI0T/tvMRmISLtRooD7ytIa+pRgaEHk++n3JZ9+Gbl0Sj
         Qdc3PtNmvbW2TlgT7x2xS57LrANzgHju3ecY7pctJC/gcRDvDuZEpv1MlRgB2PS4pNRP
         71vlh6CM4v6OnZ+z7DKbRvRSlFsSk4Qw8n7usNY6+CwpZ0u/rrHKTHopTG0NSHDRuhrV
         wZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625767; x=1795230567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=Ffg6lVjRg1aT7zacVxY7jxDN+tPy21XESRtZTeYtH3v93DXgJLvAkVAUUVgd6L6srh
         QOfhVG0HES/X3uwlzu0PvhrVsvz2h/VESF6GLDSt1nNxA3VStmOu4EIb2ABvihFkUSbN
         +NngmvyX7+Msh4eE3T/XOC/jQsNsELbe0rgpi+6pV0imEvbVGllpySlAKAwyKkECoDj7
         FDlroFMOGQddQFdbMuzmG5+wUqkVrfTc/MffGJTef80ALxB8QTienCR4kqyFPgcRo75G
         jdJ7Xgv3Zmh+oidpea3HcXnKtgs7iyHOMmwHXCJLzfzPOdssYqxIGOwyZSjL3wtIzVWa
         Sf8A==
X-Forwarded-Encrypted: i=1; AL+hErHkM6okeo3VGuFliijvx4rkUIHuak3nSgyqfQLrVuWdbZ4dEMabqjjBIKz8hG0sTEuJXla2j2kHPa+PaG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yoInhyHifBmhoZzfOPXqsM3uz39FWzBT9jPuxsuiF36bOEpXS
	W/S6f9vo9oobpUFjrjqP/aQVl5qlMoPW/P6Yyn8THncFUYZL879zVbM6unDp8LJ6Rv+KODbksvp
	oGty7EHRNxenJjA3HKoKHFr0JidPeVDZAid7U/I7fNkgHJiOLw6C3sMpSSaRtZ/JF+24=
X-Gm-Gg: AYBFou2fg32AwiavjtAgVkc3uTLmsTDOPWH30amTsM73YBlo1IJuxHBocmsatNEhcqF
	ExsKvf0pkUzU8WfZd5Hd9MXb1W9LJW+jpwqauJG4uwHgVOatzH+t77wPfv1pjtlvQUNYSXLJ8U9
	FBjBKGXQMdy4IeChH/K+6PV5ShPS5fWgHOKhxW2UAC+MErPgPaGVBbx5WQaeJD5log7lR7NgKNV
	KARf1stwMdGQzE0AXS451QmciF1Vw5+lSJ4A/8WVlWlqWb5daYQfLK2G0QdwEx99x1vdsUsEbZB
	H317HKJpi4Fb9CgMQbIfFzqpkCyH+fmgbnXtHUR1BQ/afbH+Yn3VKtopna5ZYkv5v1sLxlPgK1F
	t9GjyjeoHUH0pRIX6QFLiizIse1PnmYW58rZzH1NgNPH/oLJC+4jp4/szP7rtKoXZ+zJK27beNz
	9pwWZx3WZRq31MNTDwQ/8v1vw7LF/YZVEl
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463931eec.1.1794625766991;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463890eec.1.1794625766486;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:23 -0800
Subject: [PATCH 2/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261113-mahua_iris_enable-v1-2-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=2554;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=NIhQBb10oAVEd9idm4CYEPbkBor2YqP2ym0YbzLwWeE=;
 b=QDCsI/X5bqUbfX8kcms02h2BT3/1Mzvp2V+vSAQiU0RuybZJjEeM16F6UTFxKdTALiYzPzjRe
 I5e3u/0E9JOCF9pqhPP7PpNPZuQBpCuJtevklmwBBRohvgMH10knX4B
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX9WbeGAL/gnjw
 nE+fl4pCYCrL7NsEwSR1CyZqgDGtJxAPJbtJyz9MrXf/yqCJf9FBBT+wsIa+z9hPus+WUVC+M3L
 XZn5RRpWKX7bbJX/o4lC+um/NshVdLCNk5yBCRrX1VWkkKykjOx3izFtixGs+G+msloeaRubzZe
 maz/C5ELAPS0ZHUtPw1LBxU/xoPDeAgRFCVfMUbqIe4eCz8JOUoSI5BZ1/Ix4r3p38KhpQBL3PA
 41F/I3HzLHZJeBLHDTHi9S7Yri9zoRs+9llAyrAamTan+NKl2rCeTOTORa52PhpAlYgX3lo/tDk
 lI5AXbEiP/oYEsuXrSV//FDZWBb4T8PcL9WY0mjmq0skN8GLko+CeWzR6DUeH7+J58W0tNjvwNw
 znCI2ITlcVsPGQKMFFaF/cvRw+Y6iGDXLxrag8M8y08mDmN7mNUCILYcnvVaXX2mKsSzzd+vK6k
 bA+MUQHxDBNWtqSXfVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX0BOmpeZTE3MZ
 p2SvHKzV7WynQuvSWXveiiF1jMLikZdrBnLSeLbqdZjmDU/66XqtlIe/10p6HigMoTUqqW+THz0
 EmL9yqpwsUuvp+SURtNwFLGpLoDVrKU=
X-Proofpoint-GUID: BZKunX7Odjwp9putgQh8V9trM6P8YcJl
X-Authority-Analysis: v=2.4 cv=BusIUoX5 c=1 sm=1 tr=0 ts=6af7d0e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A6Af-tnAtVRmK4LPXG4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: BZKunX7Odjwp9putgQh8V9trM6P8YcJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140012

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e776841db58e124c4d66225faccf8..1d01655e7623d13c43063b74d2ab086d2308e3ea 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -400,3 +400,69 @@ &tsens5 {
 	#qcom,sensors = <15>;
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};

-- 
2.34.1

