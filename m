Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824A3B05AC;
	Wed,  7 Oct 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372320; cv=none; b=fPEShY4wT+miwBkAT/9NR3qxUSY0Eml6G6sPCH2lBgpGLEVJNh2gGH9/fqcsYKYfy3Bv9Y4sxAi3rvsS5NmnvGRTmmK5ngiDLHMYXCSdU+dnKYPcpDnNnSOujfswtB42q08EIV7ai+sd/EHyo2N5Zwv86AQk2ZlMqf7jDzgm/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372320; c=relaxed/simple;
	bh=vLE+6b/Kh+nDs8MJFMr2arnL6E29Lxn5aSvXJd6l8t8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L4RxEeaTmupht/5gS+4e7L+awXVdVqlPg+LRXTD3Dr4HIcKt/s1wope5Fd8B0g/DbyIFBGlVqAkeRC5GHCrBcOy7pip3xZccsFqeO1k2kSciFh6aGHB8UgCBBx8j0BkqUI+/hEH1im9WYn7UvOr0TEPlj20L8yGNOgSUKIZ4lYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K80CKuSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K80CKuSC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697AcS2L3573110;
	Wed, 7 Oct 2026 11:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ehx8m5lMKTAhSGT8TH/e31
	SItFtviGhkd4cvzgcSgUU=; b=K80CKuSC5S8AkZOWqIyX2y5VKkks/zK2y92jSs
	oiuUZtdJYXo5aBw0485nChd5QgFXojQjVUryP8xl3W8Yfv2gN6Sj5WbxXS5jrLCM
	0kaHdSXzyqzjRdlq0whpTLHfbVQ0NbwMVlHhzqaQo2It8XyCsUK+yFbkxpb2luta
	zldSVa0kKHGXZ1P+vzxea2C9VrhgCRCUUSq6uGhm9NN9wtJn/uvStmn/IaB5ffhG
	m+2UxqMuuX6oHVvHqWqq+jnt0kk4NzO6Pdy25s6pFe1eraFEZj2fckAh2kJWsGKk
	HpABK6dnmIWNWsMvp8lc9JW/1lnoadDx0NT/OuMR8k+eGEcQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr84js-93
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:25:01 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6979hCRE2083983;
	Wed, 7 Oct 2026 09:47:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6979lgVi2091410
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 09:47:43 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id E0E9F573;
	Wed,  7 Oct 2026 15:17:41 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 15:17:31 +0530
Subject: [PATCH v3] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-resend-upstream-attention-v3-1-c2af21b3def4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADIVxmoC/2WOQW7DIBBFrxKx7liAiTFZ5R5VFlN7KLTFJAyOG
 kW+e0kW2XTzpbd4T/8umEokFofdXRS6Ro55adC/7cQUcPkkiHNjoaUelJQWCjEtM6xnroUwAdZ
 KS20WeDcYqxxK2/ei+edCPv4+2++nxr7kBDU061WURjqltVKy08oMowQFeFs5xC7hd4hfeMzM3
 WXFnymn1LV5lEPkmsvtefqqH31h/Ija9goMoQHjZgdOmwnoYybnp/2orPzfOm3b9gcQFdDUAwE
 AAA==
X-Change-ID: 20261007-resend-upstream-attention-f964719a0733
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791366461; l=1444;
 i=arpit.saini@oss.qualcomm.com; s=20260929; h=from:subject:message-id;
 bh=XUtjO5fVU+HQEJgtnrSzY6fbKhCszEhqXdnzl1j4QyA=;
 b=oROJaDWdPclUMUfcRQ/PIXpG2uLZUJvnnzZktDA0w8mrJtDmtRrou7xkJRJbAaLehCukRnBFr
 uGEy+OsF8d1AlMXXbknqwJd4wE09wYF9McZF2MleNHSkhvfKD5eGukC
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=hAgg8uNgzV2UIXcMolGFuWsdQLeg5F/siao+So2kbBc=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX2PkcaNq3ueW/
 UVTyIZwewEXs60drWlGBpbJw9gdvwTh0yDAWjWKptpZFv3uJck520+GSyaA5Un14ltfw116y4+w
 EBUY7ImW3E1eXkLS0WsRxcIxeRONpIVDo/PqUOO3kRVv+iatkJIxTwnVEQb9wHV62XSmNlbd8tE
 MoEpimMNB9nUhVpeQAk/047g/t8i5QEGmnf7RNH1GsFS4kHyhOYclKkSPgur2N9xj91iKAAzmp/
 FU1JLqhkC6I+ZNZoaxcI+GkqdbcUCfxCOdPA6qFtMJXBR7lFg1+qGRtq4dRL533Ko/4k4X1vugc
 Jfn183VLCCwY7QQzEKv8Z2JLEVKPDdCQ/NFyD9fzpF204Xy3L49Ft/o60zjgUxjGaaDoJNcSJFd
 T4oWAETJ4jfP/62mgvnr9hjFp+zmof5brPjiDqVUqH3G3nHqFywv7QGXWSm63uarf/DMm+W3i64
 DYOgiOBLYom5W17exbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX+pDhT34y1xjL
 Tt4b1T9eOhsUUnriisIl2aIObSkZDaGSw2e+37dh/mBaEtouizFs1xxv8pzceGK3xq1GBpTD2Z0
 YYvwVmyXTDDssgpnAD1ZNc1asd6pVko=
X-Proofpoint-ORIG-GUID: dzR-IZapQDQ_g1XHMKoNdFZf9G-7-47P
X-Proofpoint-GUID: dzR-IZapQDQ_g1XHMKoNdFZf9G-7-47P
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac62c0d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L7xdKIvrZdzy1bmArRUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045

From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
Changes in v3:
- Added my signed-off by.
- Link to v2: https://lore.kernel.org/r/4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 64bc1cec612e..9ecb40e7e39f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;

---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261007-resend-upstream-attention-f964719a0733

Best regards,
-- 
Arpit Saini <arpit.saini@oss.qualcomm.com>

