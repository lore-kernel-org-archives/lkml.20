Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086429;
	b=una23MHE51ZBS3ZORmHd9jDrnnTy8pp240RoyHkFlqoyfJEA2bf+1oCv8tYIJngYUCrx
	 IeD8xuNkFCCNT3ZwnQ6BW/P5UUBEVMlyWKnXrNPtYHT5vtm1ZW0dnjMrdw/U2JwpVj2V6
	 tCjHEqWOtJjgVKL4Ev1+cdcjMDOKJIXhCO/z7wgjV86xGQEo1o0KjamT/lHwxd+u7+3PE
	 R7XVsFJ2ja7eQWrxGw313Ovyrjp/j7qoRx8Z/LVa+ZE1UarnYvkJ7IljPxQ+Zde+wl8+h
	 zWwE0YV7azH8rq+1e/5zFIIEl6FiTluUAkgJGOCziosBCGj2oiudhxPXqrxzcq+iHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
	b=DQu6iyvozsGcj6VuD1KndturBRp3II4g8pIT/fS8W3lorH0Y30eVHitnN+Sesp5k8LN6
	 3YNi1aFVL6x6eXF1Njs8TM3bKOpTiZjh03bMqOtB5vSK7oa7bCFJDTUG83KMSWDLn3snG
	 7K7V4dTdexY21U304dPUiCD1EIITA92MOJdcYBxnkQqbY70HtRqhjowiXg0NSQe2i1tqj
	 jKiS5xsxnlygRLIY9mptxN9aFVhtf/fEUF6ckxS656GQp8khZYhMXSyxrXc/c/PQaf0q3
	 4TQb/lmz62DdRooZRYYLCGMMUkTnAuFvQeQyzn53E2oU1u55aE90woRcWMrNGH/JyCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C1606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z1md1244824
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=; b=Q7R2roFXRZ694ZsA
	oTuUuzcpbi4WErRSIKJ6v1VmZn8p0B1ww46xVLuB8yzMkDtKWr39blyalzr9j+Ja
	t9r5K1f5BEb3dP3j18GTrQLPNYQB4LC3noy33hHtRxfcAlDGQI2KhHEhcYZmzuDl
	QXP0oHh1mEPdrf5WwaDtsL8YShM/QUcwxEh2mXCZ2wJgAD5dBF0AUyH6sHXIhzJ0
	cC1t5XR2Y8yrgRowx6Bp8rpky8nJyGZckfu0GvHLFbwMswBiW9EK2q8MnR7On1OH
	50PUEjIPRoy3sMADroitJ/LTM+jIfy20yOZ2MWIHs313icj1OVY7QMMzND1oIFLC
	X1SFfA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y465t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a7da05b026so5495044fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086427; x=1793691227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=Rz96YG2xrpFcXPg6hEi6oJFz/6HOoOO9JeKiP1GkOaHLAbxohdJxH1UjegUzmKfMK4
         edmvaVbszLfi56bMQn06RV3aSRtDB1ntrScWebcS9erYjhH48NNt76cCG9ZCI9YtlxQU
         rcj4aq4XGuexEHKCKE6C77EgRQwGMVJUTXWwYsWf5fstC1EJOkm/8d7njx64hzitLBrM
         0hfWdlguRjM4e5zo5cCef3zGbKZ0Ew3+Ujs+umCbzi2IpFhl54Wp4L53VAneQF3GOsDq
         h2hwFufotcm78cRIRJVtijL43z9cRgrzGXAS+4+tb9zmf06w7v5Q+2AnjgBeIKEYfDO/
         NN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086427; x=1793691227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=anROdhdJnN0yTO4N03PHT76OGUljaLCbIkpIkobLYjVcaVbYxuBypa8XNDeXxuOUEe
         Hjxbk5kpcHwSz7tSSr0djSeuFnVquUEf0HleZhRngyNx1LQISxOegrG41nC9wcCZA24g
         RyR+BEE7sQZZBtthMt0m8fPEerAvCcGdeg8E88/0PhaKDwwntKRh9xHB01X4Q9tgbUzN
         RlQV3YkX+qbvpnMLJwCnyy9Qau3luIKxEEJVdwGsXE0gEOIqZ7JPNg53KiZi2bFd+Evb
         23tcKPNKNYiFJ35VYma8bDxW8fomSQoXDtpfk9kiWnaFIl3r4gSwPM5CGU66ZmNglXQ1
         ikNA==
X-Forwarded-Encrypted: i=1; AKwUvBx2oSlgzgX+WjKl/P4PFPA4Vsxxhx9TseNxcOMakRll5Mg+9bxMXraN2d6Nl7P6XD2KnY4uIF9qEE0mx5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUIoiavO87sYwao83VwIYop6RB8eKpqpqsp+TRhio3QShuZwdu
	g5+4X9hSAU1Exb+Ub9Qr136h7Qpuvxoy/aGueiw70b/iNj8/o+sayLVZRlFwzjlj36szZc/7FEc
	At2ndvXrH9xmaHR4zQl6C78EYsKFnxStvf/xNAfYC2ftDO/GXUV5zDJLOAfK7ebik01A=
X-Gm-Gg: AYBFou3aXn2CdWFEd3giOtqiy9Y0e+U9ehan42LfF67OkKwOja3F2LgUwnsTMp1QW93
	YWV64FmALR3n/70xV9R0TzuMCJeQmLuLGBn+8VVfUcs7b9t4KmBGAmawT5cuQDF2Tc2JPKVz0xX
	pa0Ghw6FeEwFgrYE+QmNYobJUMuv5N1cDHdQSCbn0B3aor7Vt+Ftnal+CNNnl9VYHuqOAhrmfBX
	4UJRA1VEaIZq8dbxhQhnl/olNNQev04qjXjcaeZhi3v9YfKRJViafho74pIfm8/zK1GESjXt4EC
	V1cbiwEsllE0M9wLr+A+spTe2iWZfykEMwyGwCVjKj6D0AeTuoGx/1zrIQBjR1mZ0GRAZrmrPvG
	RX8GkxfM081F5J0vQe2BEiXIuFOe5XcwFRbdtv+yVudjNxRGOxGrgprZAp5e3PXrC
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116188fac.16.1793086427079;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116170fac.16.1793086426651;
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:33 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
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
Message-Id: <20261027-mahua-surface-laptop-v2-1-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=712;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=I5VGgvURKCSh7RVlYn3xw6pmM2/y68t8tHmKUFQr6Nc=;
 b=k0RlEAFG+6mYw2LZ2mOH7ywRiIRgsH7NO3QjxcnAGxl8AE89aMSwrSxYS/2AHMfMSjGuEkv6z
 XREfC8bq6aaD0ehDBkKI+mDKwIf/KeWydhGGVgs9CQnsD4tA9Rm3BNk
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfXw3jHyeLKDr1h
 rWyY83cI0UlM5XrT2VKv1PYad+uYluop4jqQnOmVSWRIo9TELgVqTp7FKhpYdmO796KzWDJQrV1
 8L0ELncY5vgaPDVtLXaO9vrYfdW9I9Q=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6ae053db cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KuocmVZnZXzmgL9DMHkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX/qyyUhqkEoCw
 Q39s261J/8AwASch5zRf5w74Cko7gOU1gZuPIBZsRGfNpQQk43PugbvzHRYtmszwlLnrSXvG3hm
 hUhE3HRVQVqxbNL0lkcvlredlV3qOhLkeO7Px4MLoKF7bFVITS2Alqj2bYJTCzVlT4BYYEZBsDr
 R811YSzDY1aiTWk2PMFq6lYaRPEqRYdKHonKJEbYTCgmXnOc+1hy+hwY0LkB9cI8VrMzMxOF0EO
 51KGXcnrgwg8jZh5ZqG+kKN3WU6Jw6/585x8CtQe+ymixDyILqNyLxU5xeMJAqtuCRXwpRRooFC
 cNnnJxpFshq6H2YbEFnIXU/Jb+BmF5oth898LFF0QDbyJARJaefSUAXrwE2AEPtl8mt89OYS8jJ
 tYhuMFP98BtGBGENp/FT1K3awffKl/Kkfu7PCx9KZBYt0vxqLQGmAX8j9mA2/O4fsoZD69oNMyx
 2lsOwqPIQXH1TvtYZeA==
X-Proofpoint-GUID: tEQA_LUAIjev_zisgUH89ulqhGvz8nkt
X-Proofpoint-ORIG-GUID: tEQA_LUAIjev_zisgUH89ulqhGvz8nkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270029

Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..14941a0b0854 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
           - const: qcom,mahua
 

-- 
2.34.1

