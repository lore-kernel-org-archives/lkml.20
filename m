Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0A1471416
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250066; cv=none; b=PdAfsgKUccmz7zs5rFjQgpdIsKUZ/u3oj+lTQgUK8+rl4lLpWX9Kzz+1P3+BvplNOf81+IUuwfE057Fve/1bPmDAPqNsJtYL2S9l1mo20hHoYMlsvtoLof9Jkqyjxedq3CUHLUEGJ0DNcZ/6rzvuBfpnVg5sDoqLf6SnnV5te6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250066; c=relaxed/simple;
	bh=iz5KH337FvOBh7AYwFapa1Dg7y7v4zbQQ1UombC/zqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5LWn3yzuRmeo3Fsefwv1ztnDA5tDDqtorEsGmnX+glKcJTnpy+8KbIQwtuHsCy5z8/msQsujThO49sHZlxh33PM+kNptbXbyc6nXii7CzFp0uiKX5XOcxlGLH4KlwUV7qJQgzM4W8q5X7jPbhjA6tHn4j2NAVUeFdxUrjHKgYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjxN83xC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAiGWtFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjxN83xC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAiGWtFi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Ro11811504
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPQkGr933ErzawiMiCrQR/FLH6DS2a7qSAktOE25JFc=; b=VjxN83xCZd8oNGWJ
	gmzIQK6h4P4mc+QGDr+0I6q9NRtnwKRZkDALIDUO77WB5/IoJJJ2+/soJYj3pdQ+
	SBNsJ5XRCJwA8zufJiNfu/hZ7KWEJA5JOgfdsq7TWR9xPSN+1waAL5mPish7fBwJ
	gMNfeUrOnNsowFXWQo/muT31fHnOghw09WPyj9o1+QVUmb4pNoUm/n89QLKvnU0x
	ZTH9ckcOAR2t8s22ccIaw+VN/DGpMbk+Rfo5ktA7PDFmcHwjbreoBQKMhUjfcBtp
	FEfoqwP4u2iKNKVEkZ0+B4CnFqT5SGlS1gJr25VkXXVee+/zh2hI+MRVjx8lpBzQ
	w2c6jg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4duq5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:07:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso117737185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250060; x=1788854860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPQkGr933ErzawiMiCrQR/FLH6DS2a7qSAktOE25JFc=;
        b=TAiGWtFidA0SyqafyaMY8m9puUgbOc8qAHlNZ+Esi233+HLewbiPuClRg9+/Q4dzal
         yYXxAYWZNrR0XyqrzSneVdui6Dlv/TIwyPU/xeCg+ZqBWt2ddRFxSIfFwZaEBAZ7Pmhk
         slaRqBgOa/a/0ngeZS6CapDvWMBeC4noh/N8E35e3rQtZtu4Y/nLBYhVigt4MkUuwx1b
         AhIjeyI8sGQrKfOYrzG2iSrb5ITEickkn9R+QCGP8z0e5ZOs1T4PqwOoygn63UcWfIHo
         Nas6kmRSF7AIgaJwy6/rsbiqia8+SMr9r6HS8sqS2QUUEDF41fReOrmB32t6YJ1gtf5g
         uYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250060; x=1788854860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPQkGr933ErzawiMiCrQR/FLH6DS2a7qSAktOE25JFc=;
        b=aYZgZhcOXeg4SmcqschlMcSdYhhhUsUj5XAoKL6x9zen3w1coC/fPlTb1szoBqJYh1
         8r5mAVzkER8lBB9DibQPAeAUWrdhjVOdLVf+m9Oa3Wg0ZWWGv5F6z2pJHj7ht/vJTXUy
         S63Du+ZlLGDGiZoa/CepGNVdAlguyUEze24XGpVujHg/4VbbvaGkdoI6EhtIQhCa3U/8
         OF9KbDnxoUfyT6CpZ181tVOiM+V0bYK2NW4FXpDSmRZmyiuv5fZDjRqxHmO+ducbsN8z
         vx6XKqttSEBTCa77+lHDqxzzaxdN/BwZYTURtPvZgLnWUugQpyAZEKdjLlHEeC3+8VZY
         aLKg==
X-Forwarded-Encrypted: i=1; AHgh+RpYIjmDFbpaYanlK5/Z9gMX9n1vzYqE5AXc6nVD+n49K0I0Yeo0iy1nlQ2b/+nYhehEBEJ/E4/pSgiBhss=@vger.kernel.org
X-Gm-Message-State: AFuF++mxFDKxLS9cnCWRMPv/lvRVQBO3umtG6lwUaOF+CVP7e0ipZFyQ
	w//PC7Xe1X+VVgPSyLei2VHx6c/11O8XQiMqFvikXRlyOAoPxWMiNVV/hBaXXOB36s0H/4bO/m7
	YL8igHwMhyTCRKM4ahKCvz6jwb1T/DfJc8Sk1MVz4Ywn/ANsnqwW46ZkV4R3QsnVW4EQ=
X-Gm-Gg: AR+sD12jPCa2fANsA/bR9DacTROOt5aPXRzRKaC0axgyCJA0avhdz4w9k40TyKUxI77
	muF+CMGpUIVJKKj5E70NUIOgUWIPss8dAhsELhDFxCWM/1TdYkXGXIDPJ6Kl9M3a++ylPa7i0QC
	wNEX3/XFJLGG5ftaW8PdgkZhTE6hHnkEuOqi5+VyqfbP+Yv67+xSn2/RT9X3ExMEWvP++ZcB2hP
	J6iQ0KRQ8+fyIObcTM9o/pdG1FnwMMmfgwXX9rOoChkBN1U+4zwGn55MtnEA8g4NAhm71duJL2C
	baVV8963xZMyGQwsXEKV8iCXE6rjZBEblWVHxx8BCpRiky+1gZ6f/48mck4M1mFKeVdO6f1HvIV
	vcjFXvRKp
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3441725885a.13.1788250055497;
        Tue, 01 Sep 2026 01:07:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:92e:7533:ef63 with SMTP id af79cd13be357-939138015a6mr3441720285a.13.1788250054887;
        Tue, 01 Sep 2026 01:07:34 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:00 +0300
Subject: [PATCH v2 03/16] arm64: dts: qcom: x1e78100-t14s: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-3-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iz5KH337FvOBh7AYwFapa1Dg7y7v4zbQQ1UombC/zqc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloetDzliqx1neXsWDGS5DV4dhVzFui2QoaDCx
 ilkvuus8lmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrQAKCRAbX0TJAJUV
 Vlu9D/4qL1YBfFEF4A4ZeN++H/akCJNLDcorzam4Z47UqdrF5k7VP7zGpal6GMKkmPhopvUfpuR
 C+bdFytmzpfF91R/+/dYaNSo0QXroJ3j2jaVVDvbbL62Ab1qJtL8g91uSQNREeW/TawytRDaWot
 UuUh2G3iBKiuK7lV7/UzyRsdc0jxNNrOzbo4QaWpUiSVCw1skrqqXt938va76pibqjKOP2UsA3L
 0fTjjnwdlgtiNmJBNd8wMhfOdZ4e9nvL2TONSn5DYXqb2XM2SwxWBBfRxZzUArJYPOnih+NlJn0
 PSa74DNbguyFejYC/+I26jS8ZFNCaA48HovbYHLVC/7SxAZmunDCWplepRbvJIDiHNoMnmpHKNY
 nItswgehvmrP5MKVi6qyNqi2RRcQRmRCdVaI+yK0oaL/VKXlz6ikhXnY3gI+w3zQ2QyeBn1Iaoj
 hGEW0q5Hwxeq/yS91JG+0ftxweKsNqHujFhEbfGAgRmP88LbpzpIyhMygs2fbsNufn8KObCs0IA
 fk9xvX4lJdqFwQ8LEwOoH5TXPnhCIUUN8PNNy4Gbjhz+wsiabqoQEsa2OWb28IjByhISFilpz2F
 x4Kb5uMYX9O2tSfYID1XX2d0t+kdIpWAxXyLA9pDP/5LDGiYSlZfgQYMY6TeqLEqV+SguGjAX+L
 wNhxp0dV5vJZf5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a9687cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX8wGYZQfuklYw
 xDAEe+DsHIY54X60Uton3+9eNHWlPxqIx2+PopUXeJsjXhI/EMpbLCqeVdov7YQJJmqGWxoGgTV
 ILvh15xxHwLypwUhrZMQ0DttZrEMEJKKeupXbuNmYo+fvT3dLtYHkhJZ2elV3pW1efyqiCIoZG0
 FmzoN7t8jcHD1QPvR/aH/WTTfpWuJYPSUE6P2qRNUksfSNFF5jNTphyuAa/xFmES15dfx1peg8D
 1t3mypGIpvu2i3JbnbUwBSjF1lSnLmQ5yh8cRYrUCclTTgfZG5U8tkU0cOZAMsWi3E8/Xn5sSE0
 PzQbWZykUYk39GRP7N3Jmrb77go5MUBcOMmiPHQDbPKba7cDlgSzMyZrvmCnso1FE7arsFbJa7+
 CH5+avMfW7KmfVAw06FUMCX+QnzbQ9kx0XSpPmbE1Joge9iOtYgGukAxuxChIcTXXKy1AcYIhpX
 jGvL4C2Bg9TCJvYyCrQ==
X-Proofpoint-GUID: WlN1DcY8MA5me952EIyiytqQdqroRraW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX11KDrb2A3qp3
 JHmmIGIQjd4FDwGiQnwkI8sH3s1N5HfKZCUi6D2ZVImpHOdAA+rNRmOln58tXG08owID49HPUWM
 WxgDLX1iYI6QZVewzpeRFSrCvesL8MA=
X-Proofpoint-ORIG-GUID: WlN1DcY8MA5me952EIyiytqQdqroRraW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..8f7b01617461 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1385,6 +1385,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

