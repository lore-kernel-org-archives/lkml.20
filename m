Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BD473C93
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250093; cv=none; b=T4XKAT00V+4MUD3BP+/UYcM9sdEIjAYD8SE0jrSCD8HyNhk175VaBp+W7kkP2bSKAYjjIVz0sIK6EERUA4PzGCWW1ZLmyu6hTDdEOmD3+W4jNDn9wX8gTKgPI43tI30GriB9WmncDWMKlZm+6WpxXMKbTy3AHTqBKaLRD7CYSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250093; c=relaxed/simple;
	bh=sFqG9CIAihRqDQ9bvVwk6iZoUUSU0TNuyP/K0+ZwkZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PsEZUw7gnJK9he/9gggJF1176mXLavdAa6EcYuabkXagd5YDfgwd1sZYXuutyvIyq5SLObswPI0iStTmwvjLwjgK9k8QmRSIIfyq27XI9iSalEkWt+nBz9KY+s8V09pM/yoNK0uc6RcdWiU8MvebgiI8xyvZpSYAZvN5MdY/j4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gzy9nP9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy3csc9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzy9nP9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy3csc9H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JRf1975509
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=; b=Gzy9nP9lqg8qyDJG
	4ytP0WAU2fMk3xsQVWEAw2XNIq4FfidR207qd3FUOv9qIUs97RuPCRRkD4tdKF21
	WqH9DiCbPDhJAy1cMIIf8TWkO9r5y++2WfcXnJiwAlhj4I8VQL4VeCzbV9JPJcYb
	aH1suYJezmXCJeSZhslSZRCyW/my1jLycikShgQ9ApZtR5e4/spsZyrp+loB4A88
	qzfF1j3+P8D+Xu/U+AaRuPzz7e5zQ78Q2UPYkKwv5Pcj3+mgwJI3fm6382e01s3t
	y8a7NiaUIh6MOdAjnwuOl0WvLuP8FXiJ9ReG/g/tkb2H3hQ3IzJfZZRkYG1dsiHp
	ROrN8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r16mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:08:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so128344885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250089; x=1788854889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=;
        b=Jy3csc9HLN6V0rQGBuzhDVsgeDYgQcYxVNGtSFgTi3gBHkjUeOhF1UreuIL/rZv8EW
         BnZlCoSO8xD29CQuuHe/18NAp6fdKOkjyg3h+PbRmyyIDOXFVjzVJ+PdIJ2X0TCVxGXY
         04PTp3ehxoe542GGnHqMhrf2iCwVw49bJZMv2odhtLGTkCMEMDHzIpTKPkoWnHe+juNZ
         OgcTC8LWMztJcv7nDAUdhj2VoKsidBT+AnxuW/NGrd425aAoFV+0PAupdq+J0ZzONvJE
         T/P4DXokGhGpWKlO8t7B0Cu8opSTNJusBM79oR6j0Bmz+zvtd2d2VPd72OrWLArIeEmD
         lKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250089; x=1788854889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=;
        b=rSk9dp/lWObRRt/12NsbL0n9Fxf1sT0l4FWwJP/8FqlMYJHdXETX/yaeA/TF90f8EU
         LnNkEfnD3F4LLdKL5LlXupbhNs3h/yx/Zyr9x0pQEnAS1GtefOXr0cRn3Jym/3Odqo/3
         yMvo3n8VvoKwke5nmHPOONuuVWap44MrUvpupce1PsBLHPE/rmlNIAD2yaABOTNmHZ2O
         Sxw1D/cfyOAUm7QDNx2xzD6e7nKgfMLcmceEmR8PN/Ct1Av42tZX+yDYkBBIhLshPJbn
         5OPyhxCHdw1Qk1bDU6PrRhOpCCtYVjA/9gRFfMSGJO3aQNkQxANIMwLIKLwh2ZJDJ88e
         flDA==
X-Forwarded-Encrypted: i=1; AHgh+RrD2AYRAvIkqc7blluM5RtaBgB9L1g7mAZegXEK7uDHvIQKK1C85I9bFyRi9fF5K3qhUONVeuIN/hCrPpA=@vger.kernel.org
X-Gm-Message-State: AFuF++mNhDAoT0hTouqTck2e53ZOEaYTCg4kHg/eQIrUAQcOuT86BAOn
	ojPviOIDFV9Uffgf+TaTCskSlAp/aUOGPRSZmSCnNQsBaxFqjSf2R+ujuThDmT0yy0e6Sjqeuet
	YXGCuu4NtS8N4nSD+tW54mWj7OZqq/7tBQt5PGkYt+4ERBXNifgH4VhkGjAUMxfL/CII=
X-Gm-Gg: AR+sD13amlAeAX7VBJ1dtPCPkNZmkdt/eDYBYKaaJFWxJhgQs06KOlLMuZGHsPOusEL
	sI/o7kd+e3qOKMf8PoLnG1ck6jYmOzgUL1Jon0+SjicT+p0RE0TEuRFL9VBKAE0VjeyPpom3DHt
	cbhT2uSMJbB5wDzy4MKezHuIRf772eknL36uxTn9DYGXPk64SVk+pCFeym1VYlbxefT27cLelM1
	3Vsw2V7sUkZ41XgQOFq1jK37krXhvOcBkv1Cw4VUI7HekzncBvSLLg5Jq/8afAbASaVVMNrkwJI
	KnVn2imbo348m8HGjyJRWKtMVoWk2wPQPBIco5N7fLCGf3IRKvFi18nr5XRHn+tzEONDbti9sEE
	5Re1/gGG9
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id af79cd13be357-939139a0b5bmr3997939485a.40.1788250088980;
        Tue, 01 Sep 2026 01:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id af79cd13be357-939139a0b5bmr3997913285a.40.1788250086646;
        Tue, 01 Sep 2026 01:08:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:10 +0300
Subject: [PATCH v2 13/16] arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-13-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sFqG9CIAihRqDQ9bvVwk6iZoUUSU0TNuyP/K0+ZwkZQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe3e0DWFJj9GIIo77JwS0VQbDEWtqRkDIMoF
 p2OgpWx/RmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtwAKCRAbX0TJAJUV
 VrRaD/43rLO+BdUC6qAg81QNwx67Aur+h0fxsuVxS/xzpWhKh53tzeNEbBvpKQh2Cvj9HaN2Zr3
 wvhEV68VdR7/3njvh8gTlNJ8x2ZipXk3zKi9F5mQW2dMtc1AaPgRIGl4AesOm41WqtKlSQEU8FX
 mzz60iJ29nUyb9qQwrQwyOr8B2BUx2XeQ5Mu9Ew7kUgjEjmldHyxGVlbZNGDz+BtT1hHqS0mtoh
 mvp5nLAaEVBzOa4in7WDgEcQBy2ekeK85Rz3MCkOkZm2scQlzDZzBJDCTr/2s53oFsrMJNQuX7w
 ykr5lquMQ0kturGI+kYY4/XW5cQshvrL+5N7jzaOqeCqfnesPzeiwHlh1SJhkA1kpnTDpUn8GW2
 tB0zeP+rk4+ii+WX7YJy05M/q4Jh+8nJRsKEb3oRW55IQ2c6jzzEPxahAesN7Jas39WILtfrmtf
 9mjla98nh9Y+7GvPmcnsbheF/MTSdjYCZ944iCD67waQDga2eHCECMQog0p3NMQuhi6RS9/q05M
 Z0/axmH4oEYMqn6WendiJ1S35sR9v+NDVgfslhKuhNKyxbnzG6YR05q1DyLQ34QaWLwLba1Onnd
 Sv0bU+H5jwu7e1FL9H05MdyretUaf7aI3b0EcjamOyhdW4TnnTS6FQHHsiQa77afxJ2OEOIlsNI
 kye0Z3KHiFxpkVQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9687ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX03BMapBPLAP2
 kjBEtt1J08IyBaZFYTsmgHnN4GHqO8nBOVBpcGaQEoXTJ/7BT0i7qKeAHGoeKpjISRQin/M7mfL
 cbbfEp7nEtXHk1g5mH7+qjfuiXa5t/7KVQJXk+YsnHiYTblioOR5RuSjm+kinuhzsv3v6Se37yQ
 X++XAvgjM7Ni+xCR6eoICP9RqpwF5jqisJapO8yJJ9F/uD0qUNHkAcxUYmnzqJJbVgxn6z8Vuev
 8K2Pi3n6ljsFzSSaM5HEfBPVejm9aj/gh9bbxZ+U7P98eE/KUhaMMTLGhigzQc7eNQySAV/xOzf
 +aE2zfCo2gJGDkYRbPj3SiLog6y3zDr/m7Q46viR7O/6IxkcPS+25hobiinTXZ7PdDDk6v8Xyjg
 4E6AFgxXKszPHvTD2kQXuLk4DD0u9CF+/DEWBnp1dTNsI7ri9aNrT3pIn6oxPsPU4Lxi7844T4V
 dKdxjHocQw3uA1dL4mw==
X-Proofpoint-GUID: 459luDMPc8whhHAhDVklPmCgRuDU21m0
X-Proofpoint-ORIG-GUID: 459luDMPc8whhHAhDVklPmCgRuDU21m0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX4nApnIejGrEO
 UIHiuGLlaOfEqTPvtPFaDNBV1wfWwUEbOedS7OW6vLmktFBcqiiJC7lzHNh6bfvhCmbbrWadM9u
 1FXNZoVHSSzKGYxyXedM47/qNCIisxI=
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

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index dba8cee43e29..bcd85cbdcb93 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1287,6 +1287,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

