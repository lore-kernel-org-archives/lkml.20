Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0913D7D67
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443693; cv=none; b=KuBzWWpwrmE1Hvgka/GYcfUg/UbEWqOUZx/XclQq1A+CxP4P6nt9XNPwobrETBSrLdUXD3KoDZcJGBljjgO1LqE1HS3Inj79T/IBKtWB+tjHEL3qVUh8kpM8Nz6v4HfvkfhnMZfAMOOc9JKHYXwbzvTwohsBzpoENaFxRckTiPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443693; c=relaxed/simple;
	bh=JZFxXZsrjM4DbU545aptMj12odYhiTP97780+XFXm5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f74yIkStyaD38Z4FsI4o6jDjuEacHz/nNJrR52gdtB0JyTipNVBPiQnCZh2CIiuZDFv3lbNiet6RN6yzr3iZPwHFL5NxVXvGzXGp0XOj5XhuC6zjsp/56pHn99UTmXAFEPEEx3v1S6D0sujXdiza6oFocifJUjP2SfFev/lhFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKgVb1j1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eT8TzzPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKgVb1j1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eT8TzzPL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BVvs2895502
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 07:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=; b=mKgVb1j1CL4rFTei
	mMNzYGecjT1e/nyiibpqd9UNF+gFzMFUc0rhqN3JUWtu/6yWi6BRcATT9rbJyxTR
	H5IqKUXLRyeJFJrKAe0N2Ug+NzcDioENUbhwxzfQJ84jwEPP4rERPpnv5Z0YS1tx
	TeHIvSBzqcobmvBBo6UaSKkOvNHbreG88l3SLHjsMoHxqM3PWQZ/a03d9s8B5g6Q
	oV3d+Lp5BPUoLKumzd5BV0WY4QgTFSFcPG/BsUk862638rNgdB1w0mnuP5jqvV57
	3bPALnL+z1CoNs7Z4GzsyAZdaS5W9OKbuGzuTc0y8C35RPix4gGRBUN36tRxWOsc
	93UunQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg97ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so9487589eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443688; x=1792048488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=eT8TzzPLa1wbssdpmkOwTkGSsBVKGQ0Wd4crE+Bh87T/k5nFMShzW+b5/R7yadE2E1
         99co3zrxUwZYnZnsd2aK6CihESenb042XA/2ckGmHThfIKMFDEFUIhk35Lrl6DuYhwF7
         VwDE180Wk7gokJS6DK4ChKdv1ls+4iJ58Y40e51pLE1xshlzhiMzNKrFis8hph51GOuj
         qKOz7R01qIQ4nCZJjj9JWldEmPo87m6Jty58E5wAJW68r7cU5NJ25TWUyxvHNJYFj9wh
         9CACQYh2Q7Jo3IGqve+GAW9cHBN3Hiu4wrx90zyroE+LrzT80Aq81repKAsrx6fHyux1
         fDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443688; x=1792048488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=eenRYJ32M9ddno21bt3P6QmXWARTmgxZ3m/r/d9E46xTo+CPpb0osOCNfthqSieXmc
         AD3XOvaHyPBllEzYeFgVx0RzCaM5x4Fm/bwoisq5jS/mnnaYniyAd1FrtOdkErbLfDyu
         KXEO1VQY2x+2glLgIDYLINBXg8qTaCjvCXATzTASqaY5vn+3cZo1Ti13aJ6AIDzUAV9G
         B4CLWr6bpd94aWbZgiSrSJj+u7FDnu5HF3zguS9DiDmrxY3ta4u3qZgdsKTrdKcfutMz
         RIEEVYooknBD3cEhU7jAyuK3LdHxmSs5n0+c3Tsp7snqvOFfR1tkIQYopzLR7udKCYw0
         6fXg==
X-Forwarded-Encrypted: i=1; AKwUvBz8zG5eN2lKpixQULFaeAEnr0ZpIHgR8z769K6s/TKb3KNoVC+P+qffR3jV9/v09P5O+7r5pEmWUqRnFkw=@vger.kernel.org
X-Gm-Message-State: AFuF++nquODMZFylIwBUSJdZW+D7c1e8GhhBIwqXhBEnZsAL2gZv//5x
	5xBZ1mieXA4WeopJQz4FXNNY+p4ZIZr/thCKx3afzk+E2I2YgaWrdTtoYWcLh9BnwPxFw5dr5T5
	JdGdpjtqUGXfBaYE0rrNvJrElUpv3QDwGXN48M/I3FfgbujtCyCugzQFVh1jkYocFl7Y=
X-Gm-Gg: AYBFou3FLOradImOWPdVVnopbEvlY5EYLikwfaaERo6xli9p8odMpO4moZaIZdALd/1
	eyQhzeyt6jkAd5KPai9FL+Ly0KxKhDCqpT5/FHFbTkKK3+KNrtIrMFB+q7zotvOmB5dNz/GuGn2
	htsduQS0BxVWFvbUCijPliYpnNNX8NHt84A+O8FsBwLEawDtFCBFN75Qibj9qqIiGXGoRs5h1gN
	r7witGN1kjOXfpyZ+SgRbO4u0UG7P4BxSOwd3X304zhaljX+nPX6DOATIKX54oJ8B77JnHRtsW1
	bX5R4fGibDrHMLGomKXs+u9qUUVNQJnhBfgq8igRIgaoDWXXEH9BAiNZB7ZFVEqhDvvtVrJ4nAI
	XqEZGiIkNV1y6Xqyw2ISFPg3Dm5bwDMlNas/PfbKwQ3qrf6sonEFTpAhcNTNcf+N4vp6cazzvXc
	sYOTQgHiT1Ew==
X-Received: by 2002:a05:7300:c38a:b0:351:591b:7684 with SMTP id 5a478bee46e88-3515de2e017mr5605150eec.33.1791443688353;
        Thu, 08 Oct 2026 00:14:48 -0700 (PDT)
X-Received: by 2002:a05:7300:c38a:b0:351:591b:7684 with SMTP id 5a478bee46e88-3515de2e017mr5605117eec.33.1791443687782;
        Thu, 08 Oct 2026 00:14:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:42 -0700
Subject: [PATCH v19 12/12] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-12-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: _wCBcDO9P_1Goqx8upmFD7KMZL3Wm4KL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX842X0+5X37rH
 J3bBYigqRIHXUAx2K/f7NMz90WUTXwutATUYGCmBxp0eobt7B2D/bralAq2Jl1saG5Va7WrnIPu
 CshRgi5vjX8Trx2gMRCaf6Gd9GcyFRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX8cL00kOPY/Xf
 sZKwqIHbUoyNx2/fzcmQETTLAVCCF42zbIJaTH8+n8fqddwuUoeDGJ8nPZhGsP0QwYGmw5gOF8m
 7I96Tk/keEj9cslamN2uxK6b22lgr5SqjlahT92McjoNX8NPMvoRHxKQRVSmeNxidChEhVvUJjn
 dVZe/I8rJa+EYPvmjpcqYIxnWW/P7rWl0x2hkO2md/Ngu+0/fZryLR8gudnbiyJDeToKoymWII8
 kX/njQjE3X+XqVDyx1p45Y0mIZWb+5LOdZP8/YBgdQmn/nUT49dbUgovWC1tgzfkBxiTM1Z0KEz
 MBl+ipmZcrJmg0iR7a8Vc2Q97ZYMUPDUA4RvCWiBUzq9YIyjLxI+IoqWC6LRZSWB4TK0riO6dFu
 4eD2NXZqc9h2I2nVcru3QMSAhJ6RcX3S2xhb2M6ENsY6cooNEoH2ZScr2nwcpwj6r4SNz5E0BrI
 G9kAr4somhRS7akKl2Q==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac742e9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _wCBcDO9P_1Goqx8upmFD7KMZL3Wm4KL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 710af0597aaa..f915a3d1530a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4570,6 +4570,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

