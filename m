Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214775;
	b=yZtkGxBskTsQntilJX2BTs5o1qtCSr2yQ8yfkC67+pCXmgXZbZ8wnLlhuLhV4GGquRbe
	 zmBHY8oH8nHsSsKA0nOHohOVBv6Q2UdKj0dQHNYwVtr3gWfu8HzNQ9AkHpgnh2He9b9R1
	 P8uHfhHBqggyHapyC3DU/cMzweujHbl+5jowihRDb1pqMkZexB1VzK1h8lVQgS963jgrq
	 0Kz3EmyVKmJDzOSuEfSt/Kdc4QBo+rlDnnAul1pC1MYeSSHrBgp0GdIrOtSYkmAfmlvOm
	 aQYVpWgojo+6uRe8Ywcyz0/kBcdcX6hA26J36dvdiNDLSYA8ZPh6Z/Sf4QlRHb2x9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
	b=InlK5dRCpklrVAa1bG4TWzA535Qf0CYX/wN5FFk86Qk6ax79dZPtCia75BAkgHwW+EhG
	 iGyf/ZeV/c7fYx8HYviyOjGdZv7pW77C2dUlMn8976ASDk3J1f7aE4EZ9Uq9tA5EUeArd
	 E78Qalif2lED1oJgNPIch9xszYm+nGw1MGbGFDMqAeDNqEOAz20aiqkDf/HAIB4IFf7Z9
	 caJhMtY3mVbtE0TF8MWEHnKckvvcBpiLSh+squomwfXwncfEgUrii3OtZuLAcBVDrk5rY
	 7Ks7EHKtkk0JFyzgSbi8AqWQIaOCkG6oLcqyv2KsTDq4NvXVEbk9Sxxgm3y//EMd2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMIzDC2T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2h4RSMm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1270C606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1270C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMIzDC2T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2h4RSMm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969qcj401314
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ssmNaEyrZS9wo/rCifldKj
	AHfj9Rbpdxj8LpdJl0xJQ=; b=ZMIzDC2Tk8gXcRoqzJIwMZcMlOLkQoQUBb6diV
	o0DhyWyXYBsZ2bw9SsyO8CRObkYm0NYdVSBjbLSbD9reX/QSTMs34jp6KCpsMqD3
	SPkkQphmUZeEz5outdf8cr45yY/ER/blLLDyWxtm7U0l5xpFNrg9UzCjdTzu77DJ
	w+vbA9SJUOVlIWBtvGsmo5VxnzMY2wK+qk/ZNneJsOgZA4OMq3H0Kz5UUmSpqDQZ
	UZKpQy3y9eIR1rQicrgSiZ8lDGdZpZaQMLprtoP26qs2w4tyQf/kLyFVJ5x8UPOf
	shHCpe3NPWWGdAc+QwP2tL0EwemWwY7XXwFskwrOq1RmXxtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5v7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:59:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1079433eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214773; x=1794819573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
        b=J2h4RSMm+UhT2BzGXnxMOr2lO450HdEmrsizrKexxQvaLCyp13ebOd3KZzDbGCUzjg
         vHV7SFa205wEyX9xozk2LNMmxfhZALN/NO9bpvyYCWL+BFjUGpGXqiRyi/tbP1C5dvEO
         gUpTIws8ORrM3bbQbAKSep9u+nMDRFheoxaHDrlfC5PNmjChv+a0mcmMdfGH8HiQZr+M
         vIyOm89fEvrv54TxgdYQOVgpg1Ext77xzKlZnHYJpSGMQ/kSpdwQFsylta2PdYJ+jTxz
         PGtQssDA6AK7HV6m1KGOmCaPL9bsBs7cIwUqITkF4K6VRubpcvNiM/0sDnT0sxAjOqZc
         6bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214773; x=1794819573;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
        b=2VPDA3D1v1e1ZK6ZmhGUtcZl/4PpD8L3/r/fbo4FgbLGSTjxHuWy0DJxosWzc8vLA+
         yMIOQCuZAzzyUNrB88yvUNlDQecgjcSC+yYXBKj/eq8hCbDLotk1slTrqGRDQO74r95S
         EF9KbPbLBGjq4J+HKh8N9m0SFb5nF9a9/wj7VB5zNFsjMNWRhutVBizdRcLSnhJdrgAP
         lyIbLwn9tUl9w63A3OC56NiyyeoLHmnWa0i7w5mcgS5jk+/h5pYuXoT/EFMzVZEvr/S1
         t21Todcu7DSdYlmncLfI8R+vbMKEHNf/zI7YZEsrOsZf4dfVKUXUs5fm1q0yCNVau3Te
         WuWw==
X-Forwarded-Encrypted: i=1; AL+hErFQgNl3JdmcAROg6GIVr87n0eIGEoJXUOOJU+mRXCfcWLkSwj9H6g1VDvnSbgjpcuc8GYzgOJHn9eEwLJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w8TOHRejmZBOZ3J1+KkPkzh9vVCvQTDVTMYeheDXbilLxsn+A
	0l9lV5vmeuRp6YB5G3AlLLfDzuDxheANEHVMlE2p6HgEIPQZCqdduWhPeD6919CFXc21Vj9F7kN
	f3Ju8YlLVeOxXVjEHrduVYREc6XdAxBETr/T/Vt6CGl3S/4WvONIVfp7k1eQntCtdaHY=
X-Gm-Gg: AYBFou0LIqPoZCPJxIkivX001JbJ1ftzmxsqniY93ID37y9wKvX1t+9+WQKnIeP+ti6
	1s1B9noZoq1nBGQHdu4E1OvuDly1Cx/+EmrXE++u5HFmRcjIr0JAzWVFS6orpp6ognvHCUCoJ6i
	HRGafqUbLH1FOBDhQhfzQWy3tBsqmtqibwcxHXTyzEdA8+rju+6RYZf9g5vxP+ys7z7uUPLoq6z
	6PD2NPkcu0JVUq+dqZmhfg1DpAnZvCcF7HRhkWUqbegt253JzJ0U2lPb5mYLKn2BJpQwQ9HLg2U
	8Ij1k1JSANXNBVzx2UwVHkRZ55yfojQbN4XfFEtZifB+KAJS1AaxkUZZ0tWcYNhLWJdn/whiFZa
	F4qhykbaRxqBzOa+bdfIta5mczA4u3hqI3HCRZmalo2AtWpDUoAhPKu6WZ5u2v75uaWbksmC832
	o0/cPGkDT/2g==
X-Received: by 2002:a05:7300:33a8:b0:369:38e3:5363 with SMTP id 5a478bee46e88-3725d1a4f0amr6122866eec.7.1794214773334;
        Mon, 09 Nov 2026 00:59:33 -0800 (PST)
X-Received: by 2002:a05:7300:33a8:b0:369:38e3:5363 with SMTP id 5a478bee46e88-3725d1a4f0amr6122830eec.7.1794214772718;
        Mon, 09 Nov 2026 00:59:32 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37391fa11ffsm5470848eec.6.2026.11.09.00.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:59:32 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 14:29:05 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto Engine
 for SDHC
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
Message-Id: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFiL8WoC/x3MQQqDMBBG4avIrDuQKDaNVykuYvzTDtgoGRBBv
 HuDy+8t3kmKIlAampMKdlFZc4V9NBS/IX/AMldTa9qntcYzcpiWWiNY5xg5rYUX/EJW9kDnev9
 yxniqg60gyXHP3+N1/QG1/Ea8bAAAAA==
X-Change-ID: 20261109-enable-ice-sdcc-for-lemans-9ee375987009
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXz3n2rMviULbe
 jVjkxNff+LW3XRcXVkTWn+rbC4tOjDue0S8KNDjxPp/62NVqnfWFGBuKH+OBuLQ+4zd6oL3eFoA
 w58KRA7mT1FLwD/O2IYkoNVkyD+dD5U=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af18b76 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDrDLeE5ssBeLXbAN28A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1UDiRgrAQ5L2JcwTgF3RtaHOCmWY0XgT
X-Proofpoint-ORIG-GUID: 1UDiRgrAQ5L2JcwTgF3RtaHOCmWY0XgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX0Pncd2Wjex1i
 7teB6QgmVtqcIDe6m/O/PlG4E47LVgppQkaoy0czGpDYcd//8pjP/BXBkofkujlVivnEE4WHdqK
 4JlYH3qQKMuaYsSS9xf5jFY+rmqbpcxgwQrwQN0xyyPZzXaSaaClWTPm0D4FWYwVaOySLbM0aFz
 FnNAViL3D2FDWHAWCuBEe8lKGap5U2vvhkBN4FOdKmynfvGj/AfnyYQTGOtaTapcFUIZv68rdeU
 CItt/ORZNnNcV+7bp2Jyeo/xwioZ/fVB6wPsT0wuUTPpNBHht1HXH+caEzShZJv90PUimeBIm6C
 0SkXFdcreAn7B6ASW6oOdO5G9+imyhWsI+adqDKW0y5pAub/aIRn2rsCh/MeYnSHI+qN/78fpQG
 WSN+bSY1+N0/e0qyQmUr9PfidCZksmIu4YGV8yF7L2M2GdKN54tr5ih6kkGLnnIDT+Y72IqL82+
 rstHolvuCxXCE0fSajA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090035

Add an ICE node to LeMans SoC description and enable it by adding a
phandle to the SDHC node.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
This patchseries enables Inline Crypto Engine for LeMans platform
for SDHC storage.

Testing:
* dtbs_check.
* Validated on LeMans-evk with custom Mezzanine board for SDHC support.

Dependencies
============

[1] Enable ICE clock scaling
    https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..dfd41b613523fb85eb122488e0562447f7228e61 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			status = "disabled";
 
 			sdhc_opp_table: opp-table {
@@ -4348,6 +4350,33 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,sa8775p-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SA8775P_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-enable-ice-sdcc-for-lemans-9ee375987009

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

