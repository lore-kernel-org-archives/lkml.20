Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B70472078
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250082; cv=none; b=t8pY/YZ9HtiQXpL4EBzdnEp+gCqY59tvQ2l8P069qx+DV4qfQg1loYw3XOTBp/7c6SRbV5v/8/c0DDV4WYUsgjoAlLMwVvUa4mPhD14+zxkUKN810vd6BMThOpSy7i9QyYP9JmmliT8tlR/Ua7k9CNRGPr8HNnKrOYfW/5xb+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250082; c=relaxed/simple;
	bh=2HAdXfiu/PLGPDRoUMST4Gy4hCI6iQnVrCqoLWrINE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRztWmlWb9Gs97h3v6ZkiLr+MJBIvdcx6DfKbfi/8GZFJsL2j0UxJ3tgqeqnfnvUi9UR+8InrGa6tZrLKGt6J9+UyOHs+phPcVgk1L1Th9Jtgqtw06yaS5rpGRt9TkVPPjXSfhSKTbMFH91F2WOqC4bgBEKIOvQFU+g1R4HsrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIRuOT0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BergBUca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIRuOT0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BergBUca"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Hvl1975446
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=; b=aIRuOT0BXDjSkFkE
	gp7r0LYTaJ+Aio5g85wNFMXLid5zAt5PibU469R9K47BBDsihpyQuHlhFR40f0c3
	X4Lxqh4FzrwR4xkBUmmEZkQcbs9rsQDg618ZDcz8JaTi+wJcd9mr3ImeP2uahPCG
	e+cGkTxiLWl0NCwt4+klPCXmVxGcje6tc4BOzndvQehuE/0YNwzGWhSE8LOg5jDR
	p77b8ikBSuvWVsikzt6HpnMQUe48z7VgajxBdBHO1+MQ1mIxcMKAJ63X5MA0yDCU
	51RIGlCHY3K8E7YkahELg61EhvLpPWkDBZ8T7SJagawIyqIJcKagqIh7vZRq6h+W
	nauPFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r16kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:07:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so132068685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250079; x=1788854879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=;
        b=BergBUcagSd34OR4S6rZCn36Po2cU8Mf6RaGhBzvKBFI9tg++cJLQSeQk3uSQihO/g
         Vlv5JxAKnVmv1kO2g4g3uR8bVSupkA8Cu6OETF0IxizWUq0ijgKGuAZZp1wbMmfjUeoP
         YI72UXLLkPcxXPRfTDu/Tb9mALXu4rKFqWywxatZvwoXn1RJsY0TQUtWP1QCBCnwBrpk
         kalD7pbhyGct++pvQ0eIOWOmpiQv1in08z9MR8ixm9xJ/dxepXzuW7PR3yvO1P8Z3AnS
         dgP8oa//6CEUATZkkQUcZT8gUljfz1v9XqIivXvmQ99JpYI36WtwRivlkOwO0RrwbmEY
         fm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250079; x=1788854879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=;
        b=d0g7I3wjl8vrWdPti5NHMbJrwhw6wUAEe1Vr+cUlGHXA0fe6Qx+rTP4aTxlo2oiyWW
         15CPwne2ArUArutF5zKzVuYUuVa4/CY+VWfw6lCDrcMr8vVJDrFEPEbBPnjfrDYauQ4R
         EOqLAbWNz6fnXLrv4RgByGL4FsNyiaPZlK+cgcZPwMVtLyudIt9tEolRHlr0nKC125nL
         uHfgluKnqaPf5ybrxwkRcfMrtRO/nQWErJwtHH5tKwwwnE8OqUvtiISNVD7VoZMeJ4tK
         cjRuPnBM7FZNvzU/uLrxqm0KJd8va9K7VnlmNO1nrAp0KZkBwvZPTl5bmY4LNFXhJwOB
         hoqg==
X-Forwarded-Encrypted: i=1; AHgh+RpRJIeo7h8vP1D5V2vbgxuDutyRIoHiTUufciEA0Wpyq/uwgQKLC+NXQZu0T+6VhqikSyuN5i7Ahghh99U=@vger.kernel.org
X-Gm-Message-State: AFuF++kJBWh33ID7G0mYY6k7oP8LzVgbSgCvPB94XVRAn9RP0BpykYBg
	V/uuF+lRs1tdivKxhjBR5mLVCzVWciH0z3Br5Q/kaCgyG+6BaP9pEcfHXo6X0eIeyU75bt9qQ3e
	8C1lXcWhT1qASq5HYhvK2EvGwhA7Sf1mk0fWQk9N2j6jLskLjCad8QuxmjvXdsRiBOq4=
X-Gm-Gg: AR+sD10qiCcTgZ6t/10223ljqZbnq38m7BqeZo5warg8Bem13VmgIGLHtjk+PDTcI9G
	fzpY9j4oudsTT/kpqF3atHeInPN0p4PW7d9NKEySfaUHjGwymbPKZiQbUkwZt62UTjXU4hCefaS
	TqXb/VgDeKtCxS+O9fPlhU2wSTzbAzmmyMSbI85Q/yap+Gmd9nSTDqzUPIDDdBKt7TQ4m+hf4N7
	A3rCmVZ18M9G6bBX/H1/IEVPVuGw2ASSmYi4xTfvzaxt3aoXHFTl5X+ZVjOlFVkvEjksNLuRedv
	Bw1Nj7m8a376ADGVVelVuZBMolJ6OJYYe5IfLA5bJX6N12UfjaCO49RZ5PUxq6gBFb8GOYqgUYD
	54jiyDc9d
X-Received: by 2002:a05:620a:280a:b0:934:b798:c245 with SMTP id af79cd13be357-9394bcfb005mr460779385a.16.1788250078698;
        Tue, 01 Sep 2026 01:07:58 -0700 (PDT)
X-Received: by 2002:a05:620a:280a:b0:934:b798:c245 with SMTP id af79cd13be357-9394bcfb005mr460773085a.16.1788250078097;
        Tue, 01 Sep 2026 01:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:08 +0300
Subject: [PATCH v2 11/16] arm64: dts: qcom: x1-asus-zenbook-a14: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-11-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HAdXfiu/PLGPDRoUMST4Gy4hCI6iQnVrCqoLWrINE4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe16gE4kJN5XF4/q8mcDKmp7o6EeLeiaHSts
 JmLBBUxA9eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtQAKCRAbX0TJAJUV
 VtPZD/9y/qr4QbGubvS2arhmPYh8wUouvVDruYzz3CEWQq7Bn8+lbQCe0Fm9QXHeh3XbRYr46WS
 U0sFzRY+eeNi4whip75Eig5WVjHO5+ONS3/kYrgZYSX7BgrY28gKwl8DTYdALzKEnBd4M/pXJGI
 vnB4AMlRjTSsKJQE0Om0SBwqKefFeqEAWD31e5FzswlpEBiSfX+En9zcOJsxZNo2G60FPq5Xj4l
 PlLHq8YKeAYgui3jpkdOL/8mRvriQj7SoxhlqnaD4WQr9z8X6ByrmwsLxfE3CxnESrq4LeURAMz
 teT3EaEp7rijsha8bumpknjtw0R1i6dcd2irnYk83PpAUnFAJj9Rq/JUZA8SochwG0Wx7JLkSRi
 7RumwmYUdvmIIl1Nf4pbMpBfYObf6f2LHK4OGGAuFkutNUpq3H/iyg/zulVOkWXBAuvvk8r55KH
 B3uHeajQuctWB78jCFDoDwCUCR3O4/U62mlu5WbUFvbw0pBBKzKW3bmvx9GaJnSpRXUVFipnX87
 7zPzV1AuXXPZYRJmd+NiB2SGQcyqe3si5EM58uipaZ+7yz93PbLfp5osuQ0tPFPJOr6R9GsjLfD
 hmQ8ASINc2xvSP9ZDxxVK+O1rs2tXsS58hfu9gWBgrSfZqHlpQ3cQ2INGv9BXvvKDo2SY2SYDOk
 vmEtKkd39alF9OQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9687df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=19dZ88v4spfqzsZ6lMsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX1f68j3FZB7QP
 BSB/QV6aC8ZEAoj9aGVufFk6eQZswoGA094Clnd6YRC4bs+er+pvU+0Jchgd++ZkeqQfDRfhDxi
 P6NLW/sGmBZCOhFBTlVzbesssm6ubdtbsAzlk1w4MBLH+OHYt9TxB4aUifFtaV1ukGHuIjQycNH
 NCrN/p7tHi7xgjC061uk2wHCgK+j4U5aF5+R7u9sZOmXvKkGvTyTG8kbp4LbI8CZN3nPdqUdL2C
 14ENlmRM2EVq7pAYFr4u4/yhdh/6HrieEDs6R2SGkmSWF6vvSuH2HAoxukEUEKxM4wiI5D0wEWU
 mXHt/EN1SzJkBUMXxp1vZRamlqExVcnHQSCxrJ2BUQG3qs7z8WjnBIShtEutiHLwEChg2OsLsls
 SQu9LeFmxoV/J4LZv8YjxWlF4XJ89C0GKMz/oO30pqSL3lCH0j4n2cZCHRQZugywtzG/0OT8MmW
 MZ8jO+U6tabmxs/W7zw==
X-Proofpoint-GUID: VPEy1y-iCIaujJndVXlNGpGKwJceURWB
X-Proofpoint-ORIG-GUID: VPEy1y-iCIaujJndVXlNGpGKwJceURWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX6OrwIci5aTev
 VG60GYt+D43j+ufCzqOzpApDwXt7qVad6EL6294LXpjaPG/mlK0g2LKQE/QrD0WONzVbdtm4TZk
 5Cm0zK4M9f/21B/YAaIw88DDhJaNdaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 59cbbfbce490..8eb4c045b58a 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1274,6 +1274,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
+			       <65 1>,  /* EC reset */
 			       <90 1>;	/* Unknown, TZ Protected */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

