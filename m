Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895428;
	b=4Nsu9+KjJsLcnczxM1ugYSO7CSboQXsTI5HrDqw9yW55d9sj6fNssfb8bGJ9aTame4bp
	 jFDnA29irgRcxn7wkVNCvkgf5iHmWevcP1IeLIijxD+LVJ/+nGDsLHyuaRevtZc7/QNIC
	 vkRXUrmMTtJ1EpDDh9aJkANgCX0TIxBwmIpcIqUn56mRV2KAwTmNiuVM9HLfBlqkoGdwq
	 Hiy6GwecryRimEV8hJoNXY+r67IckwIoTT47IgiOGn9b0cNXMqS83QlfyT6MBcCbtkmeU
	 FeI/iTeNXJ33th2wLI0daIRZSVMbz9OOQ5T8NJtqqEOcT5LHZpSiuitTVqyr8+Kjy0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g+Ix9M782AWmmg7/DCMcF7wQtsXbZw4qUKtRODhsdvE=;
	b=OLqPkVyTsxUDInFUUEvqhxeziTzcgwOY52CBsybMiMo1ni3mQ7jz5dQzp85dqmxfcxzC
	 /G3chqY4y9h+bQVIR1kafsq6py2YOaiBwCwcGHla3x4au6PCZvKucB2oIdVRxR9d1T/in
	 pvA1hWSkMgdqmPEAkQcjyEziaQZdvr1dDBFGX/h78rcC8eEPLguVGk4rrbrM9iiMpQk1y
	 pDL5OIV3tamsVBKlpV8uA/EG3eL0rOTa+lU2+MzOni77aWki5Nl4R/zkx6YS9K+3YFMVM
	 cF5w5SRAg5r0+61DTrsNIgZtIJ87OargQyp+ZbI1PWkzMWqTglofrS72OkmrxS3/kAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GUWF2/qf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98707606A31C;
	Tue, 17 Nov 2026 06:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98707606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GUWF2/qf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a6KS3407488;
	Tue, 17 Nov 2026 06:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g+Ix9M782AWmmg7/DCMcF7
	wQtsXbZw4qUKtRODhsdvE=; b=GUWF2/qfJyYBWKLcnb/pJYeQ/2yf5K/V+Cq4pQ
	9A16E5jLNRRFdb8cpEuZj19F/3NqxZDikKMMILto4oZucdp4Nsj+XhYS5amPocZG
	kKlD5AkTa4UJbRzMDwZjgSMLeHOUaNiMdU4Bse6NrBqV3I95paZaOdAATx1ms6tn
	PWE6mnRgwRpVIDevzfc93wKqQTrxEHT59G1YTK4GoKyvSpjNNiancH8PsPHsIptO
	u0IWWMQfuB9hLRRgR39DLMII1ULd3yIppFs916bPn0WKQ5f41NZUsbNzujmy9VQy
	boSWAYSLawF9aVBfxkUG4ZvmiWq9IYrVp5bAtBDJfBszMj2w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09hthkhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:03:44 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5skvA2164277;
	Tue, 17 Nov 2026 05:54:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AH5skUK2164238
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 05:54:46 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 139235BF;
	Tue, 17 Nov 2026 11:24:45 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:24:44 +0530
Subject: [PATCH v4] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
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
Message-Id: <20261117-resend-upstream-attention-v4-1-3f11ab312d2f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACPs+2oC/43PPU7EMBAF4KusXDOR/4jjrbgHopi1x9hAksV2I
 lar3B0nBQ0UNCO94n16c2eFcqLCzqc7y7SmkuapBf1wYi7i9EqQfMtMctkLzg1kKjR5WK6lZsI
 RsFaaamtBsL02wiI3SrHWv2YK6euwn19aDnkeocbW+hG55lZIKQTvpND9wEEA3pYSUzfie0xv+
 DSX0n0u+OHmceza2eWYSp3z7Ri9yt1nOgwojRKgCTVo6y1YqR3QxZMN7nEQhv+29lmrOoB/PLi
 qNs9JDFJclKeg/wC3bfsGwOCpcFQBAAA=
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794894885; l=1981;
 i=arpit.saini@oss.qualcomm.com; s=20260929; h=from:subject:message-id;
 bh=pIWMmPTRYc78mAwWEgaqQrAf4r1FydLuUq4p6Yc3jSU=;
 b=w8kkWlDOPCuRzLGf3GMdNAWqNHiO9x83KLKUruHHJMn/A219LBA71UWDG2ncl/GeBxRd7/BzF
 5dqm5IKIlGVDChOSHxmeWIe7HpZBP7o6u7ryr7KcL0z83Hdi5+M7jjo
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=hAgg8uNgzV2UIXcMolGFuWsdQLeg5F/siao+So2kbBc=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX8BS9rRvPH2m0
 4wLUE3IX4OOcXtOTk63AbNwHwXV+4Qk+dzrAQw5fNZfuODh4su44GMKSsE/djX0m9oeTIcKsoez
 ihueOaXf7i+YfZ71RPKSfuNe2/9cgvA=
X-Proofpoint-ORIG-GUID: 6TThHicpKZHzYWbnvMnDDY1Cu8Y_AXym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfXx9HXZLbL/zAc
 mN02rOS3XAS8lYMlNsPhyWjs6izwlHC2mgs9yeF8DoiHspvyuhSgV45GG8PnQGvGZzXV5lK5gOY
 Y+Fq4qmt+nO1mlr2PqwjA2wq8q8oE+03UISKdHcKIdQLyh5gA7iXPvCuf6GWBunD4yKPgUKyBB6
 mR36AExKrFxZ/YT9g8mzWPOeshSJ4sko/3i96LDhJXLa6MVyEvWY7Y4Q7SltRcHQvEJS0UYht4V
 hkXYQ9/RNWpbXbPsvnMaej3Gt3wcSCET4BbTFRNDDtSIf+y2c7+k7LF/yixfSMXBgT9+8vu3Djc
 4hORVuyzR5nRAd+2NmLF2oMp78Ki+fWNjl6RHTnMzH1KEt3fgAo0D9zAwOPhReMNs3zd370FxQ9
 uZoovjxXIGjOW9Hz/+25655BVaR6kxF0An6s1Ic3FtBg9emo963S16zsvGQtLezqXbmBSseO7Cq
 rMoLBDiG/L8MiRQo0hg==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afbee40 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i2EsyF76FXefJmyIMhAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 6TThHicpKZHzYWbnvMnDDY1Cu8Y_AXym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170023

From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>

The NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

While 1.65V is within the range accepted by the panel, the power grid
documentation specifies L12B as a 1.8V rail, so set the minimum to 1.8V
to match what the hardware is expected to use.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Co-developed-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
Changes in v4:
- Addressed Bjorn's comments: make it 1.8V, i.e. set
  regulator-min-microvolt to 1800000 instead of 1650000, as the power grid
  specifies L12B as a 1.8V rail.
- Fixed "Sepc" typo in the commit message.
- Dropped Dmitry's and Konrad's Reviewed-by tags, as the value changed.
- Link to v3: https://lore.kernel.org/r/20261007-resend-upstream-attention-v3-1-c2af21b3def4@oss.qualcomm.com

Changes in v3:
- Added my signed-off by.
- Link to v2: https://lore.kernel.org/r/4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 64bc1cec612e..b0097715aee4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261007-resend-upstream-attention-f964719a0733

Best regards,
-- 
Arpit Saini <arpit.saini@oss.qualcomm.com>

