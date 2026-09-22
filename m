Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ABB522F00
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063531; cv=none; b=dUHxNDSfcL7NNJNfU8U66Sj2ToqY4/Ea7K/F6JbphSfTijmM/t0byr/Zp+/wCwbwAUa2KQyMiqzVEm/UjdpMz4EdEJ5gjii9aC+z6Qhtp1KtyUiDTiFbEJaa+YYbymzxEgEDJ16UXiObZ5/WYhaL68w1Nun8EKMAB0hnfCyb4q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063531; c=relaxed/simple;
	bh=Bhy9uqYX4+gKeObZReLUadqVPipO02ki+kAIFU9H1L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ro8Tg31iH4ANJOWa242yHWwAu1SkVwYBdxpBakko2Mc6VckK65hwUGjdy03TbGamgj41IjXmzM/+INrJfjUCfVXblgWIFMr36bVHt0kCQnIoGxNOAc3oNk+aWg9f1WVWfL85iuC7pt7LBHT+n4IZkQ+VAHk5Mhdu8BVHwtW4G00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agCtbc1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FN7ffLJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agCtbc1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FN7ffLJx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MuNN3383563
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=; b=agCtbc1m1MbFnEVc
	T1YAs8YLGkZITq4JSpQFyT0YnES/oQ0cJbGA6j4aUGvmZmQTtwAoL3nTkxELi0sK
	+oDzhQO6srQeRZlNIg+wWasf8xSMDA14ii4N6w4H1jSvaYq3/dfx8rt/buOzNtDn
	qNx1VL5LonHoNxb/5V75rSC9pFr3Dl5GmPU6PNRrwY545a67VldQg9FH5rq99tDV
	29DY+wFo7YSj8qsYtSIURtobaDl8lg0Lw0jGIFvhAzYm3vJPmkQ7Yj+OszFnPMRT
	oesUldVMgwNCU5x7fzn08LpH+Y6wS2B/b4sP2EZxMtbnJfQN+/dXCxJ/8uSNFvNM
	hiULcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8rs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso133548085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063507; x=1790668307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=;
        b=FN7ffLJxTktM9qSOyHqLFjICIZwTS6iMPL+BsiBNiLhLqLksmJSU9Uycpt+Z5MsQbu
         ndvkFpLUTwwJD6jGszK41KjGMk+xtU/vnBVVoQwfG+T0N/KAHgXh2+mpNRvtXOo9QzY6
         Eh983jWzuqJSKPwJFyAAoKWNmJS/irwPCFSpecoZS5E7+PKeTQQFXC3ZYUhbmDMH0dBb
         DrMyclnX/zWQOzoNF6KZkY/Ux33CjuBL4fi4TlczDISTiMWT907SHbAlCSCt12MG8aAU
         kXU4zU1IMbv691x7RVamr8h+kqtwdqDrW6KoUBerrcZY0ZpJlvkb1b68fUPKs94wwXDk
         WdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063507; x=1790668307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=;
        b=kzyaQI3HQL7o/bODv/Xtyo1zLnvB5znSZ34SHnpxlNpUjkQMGbm750c7SKZUCXQER5
         tLM9OVhe/hcib0YZwAXpPWCeJKRYDSoPS5K16aGNn74RRpn0NPJQMtPZTOUPTQKLJxTg
         U8y/ddVU4lqw8eyqq5StTnB9esOOfeGW8jSZ8Ul+DoFHsD9IEl5qYG6QbngapRw4CJD/
         wEG8ZWmwjfJU3GumRW7g9cPqKcnAFrOHtYVTUS95QP0I7cnLcBj1hDDjvCxvNXfeuFZS
         8H51F959o3dthTenvXZPLCXk87L8KVQsuvjAlamMfrkLxojO3Pwntt28xS3QP6FMOS31
         4jpw==
X-Forwarded-Encrypted: i=1; AKwUvBwIcFybMeWIAYZ839oPLxSeEemSHl7d96l88poroRzmD7dSgURr2+HS+qJQn3r7Ih+1SCDfsWPXqFQhWkY=@vger.kernel.org
X-Gm-Message-State: AFuF++n54e75tRLSiBzVs7AOrVe5l9Ns4H9XjRd4ro+mvWJzugkPKbuu
	26rfLbZ460e0znzH+hgJ4PQn6EXROPngVftxJJc76tfUJ1H6rR7gRnYgzuCiGBB9EK+xP/iO6WY
	Bd4cKjz0H10j8r9y2tD3cziGncpvXnvtO8BfzhJxYZCy4uZvzHLDGKe0DTeCL0Zlhs6Y=
X-Gm-Gg: AYBFou0+6RrA4kJDq00vgR01vwH0CxaoUuKvetFvmziRsqfcBMPhGc6s+2ToXQlTzu8
	OWRgbdcDwxfC/l9j6q5ugj+kBDgzeiuKcdOjBHCDjk73kaO4eG9gvMUeEKNiAMAdZOuwGbsxyjk
	nijKQpD129VUeVkIPJsEst4bRQj7RRHN6loWOBavnrKkBflKGYha7JJ9r9f/kR7Bnmn0AH0gaZP
	xXqG1v+bDdU+wuug67L02AQIX4h9/XWMfJpnFeXNKxi6DiGWnmC3J/5lxl0jPm9nA1k3mnoU/uN
	hzApvglQ+O5rsGJkfCTO7bGFVz3vV6I8mDDPvmyLhOynJ+nPcdg1wxKm1F+gSkFp/R5VnU1SCAu
	Mnmw189RW
X-Received: by 2002:a05:620a:4112:b0:93b:fac5:bcf3 with SMTP id af79cd13be357-93c17f04695mr291159585a.32.1790063506647;
        Tue, 22 Sep 2026 00:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4112:b0:93b:fac5:bcf3 with SMTP id af79cd13be357-93c17f04695mr291158085a.32.1790063506144;
        Tue, 22 Sep 2026 00:51:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:17 +0300
Subject: [PATCH v3 08/13] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-8-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bhy9uqYX4+gKeObZReLUadqVPipO02ki+kAIFU9H1L0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN5ghlseSeXiZzY2rKvhIaHjhtGUS6fMJOIr
 MsMHf048meJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzeQAKCRAbX0TJAJUV
 VoRkEACINVKrnTOKZNo5OXlkQfPxHr02976ncJHgAfjZc4JFm5yrmUgOILQrV0FKDyIeABdRpZk
 FEK+WrPO07TXzPpCG8J0SrAEuuBiOfGpvjisRZtunw5+BlkhHd+rM+l7PbsW2tmB8qHr6fh7r4d
 tc0sT/UGKXzlGCVzY8bbPHVEUlHuHON1SbGtDohn3P0P5pY3c+kop6GoCDNDVjmxCDz/hom60Wu
 921Bv0ncnKmp9dZ+ljMx9QWo6udKd5ILvEAB/t5NYWgn8pilcX06tKSP2ADwm7i3YE1+fooV9du
 SRUPe1uQMcRBxOUjDg/xxCGaB96W6Fw95SISXcCRhvYbizKCnLAibHrJsVFabZP3dhB73vfxh4G
 1xDCjkz7d1j9TD1UJTBNRtaXecVLo96IUoGEkM3lj/wRZtiMn7slDh+I0FSQROBZDDxIsdklyRD
 qKpFkr1lCtR70AhOi86uJYTcNOL/CMbLOX6VWMNjcxU3b8ptch453c1Q6n/gI68cKChg9Ycqbko
 PbHNwdahzbbIfbxAmKNch1j+tCQhX3Nt+Fo42STMP8xuBp107odCWc5LaovZASEiKteVOztH1pb
 Qb5+op8wWLTB1aBgpsplJdOenQNE0eWa2SEDjdxie+OcNoHR2lwjiFjgislPef1yxK9elIMNEVz
 VjfMzMzNfCYBlSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: shSNqucEcyJfQ-H9GdtCKa1lz6fGVRfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXyq+VsuPDWtFZ
 b4e3qGntVTHHO3cE8q6vgz9JXjr2W9soU6bPZcx29weR5IaajbeRegGK4E1o2BmPB+c8pccZw+4
 uggPL1i+kAmN5+7pLFXF73J6LZM0B5Q5Q2Q3g5kFooh+/VTBa86fXatU35U1TBLhJDmKfKoOkyW
 27E1y4Rl1mucbFEHMeCR1WAQblvnBvPOcvMx+EqZGQPeHtxCduRLEncStckN5MiM2/fakrng9E1
 nTBGT+YXSVfs8KN7GJ4apEfTWUoUlN9hz3QerPNXVMbsjMlxHpNGu7RUyXuq0c91v978RJoT9HB
 OCA98VU006KNNLE3gPJRkhaboMDhYurJIEly5Zi5l2zgGxErbnuOUOaXnwKcG6eCUpvsPo0LDR1
 kSAZ/4WTHvbJDS010LOK7aWrKbpCAJd7sxenFZXVwb8FGuV7m7sDG/vgQW3FSKiMp2+jjY0mehA
 02SRH2oE9tUWxIfkV3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX1hlMgjePD+tJ
 UV0Pp+7AVG2eE4emdXepcofozl5O/G6nvYDT1QUyNWq7u7NHDUo2RNbhj6ze7+rzOV8N1hAer5d
 2etqcE81uOpRkA8TsqJQmy7e93FKPVg=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab23393 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: shSNqucEcyJfQ-H9GdtCKa1lz6fGVRfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9d4fa442d158..65f0d3b14419 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1201,6 +1201,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

