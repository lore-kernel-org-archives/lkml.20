Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD753DCD8F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720322; cv=none; b=PTF3SVJLsv2JccZxhE6lE4L3lOV+uMhLT0gcyj3c0a+TzEDiPQadWikiICJe6sVzlGBO/NNP18Im2NWtM1ZKxLv1tLzshJg/JZe4NIiY18kF4OFaOEZxCr9APNtX50otNVdnbWY0yGNGBmrWylTusiw/1jozugB3XOm3xvUAz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720322; c=relaxed/simple;
	bh=7H07ux+U7T+YCyoM12u/zwKVHaUewo9YS+QqP9Iescs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3ScYAulXLAUwXTMqmJawXRKIJaQWyeYqwzRRctJjHPD83TBsSXdaOCr/XLYCJOpS7+9cTdGgqoJTBxHT/ymhHQIs2DXdzm9c6Qg0u+IesCgtobWyxYgn7sbm3bwLWEfdRkX3fsriBrApd/vlA0V0VSKFH5z1PSJvs1izLGaVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW/h+RqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaO3RjEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW/h+RqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaO3RjEJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THTr4I826723
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Qop1QRVxcd
	dz8tWoGmGwLFCW73MGgkmUOvGYtVESlg=; b=jW/h+RqJd1yA141VIs6OmWirZtZ
	mQ+6HUZsWcahuns/+STRdkrsRhoOyBSZxitnA/rIt6AxmSgS9/t7kbYF1yJ4Y6k8
	Sl/M4H6YoRPHjLjEV/4unI9uYRy/uj0gdtUiuGGe2e9yTMUjChugQ4EjrSuJT/qU
	x8a3V2Aef+sH4Lf89J1dy+tUa2BGF7opVD76Vpws7KGL6dcS8y+/AxDS5rWakQw1
	DbsWdY+5eeUcI7wBYlEAXraru7ma4cBKaWNR0+Qj+BP5/WKEFUK1Do92ndioJ91P
	bzt9/bL0XZ7UwTCQ2po/nqm+eRujgwdg3nkfOpKawwb+IPkIkv015Pm9dFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh12u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so983598685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720319; x=1791325119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Qop1QRVxcddz8tWoGmGwLFCW73MGgkmUOvGYtVESlg=;
        b=PaO3RjEJIEFKOBYsfQTZ1zLrKHN5ihWIO2kmqw9ozDeLzmsrdAUbfa+8IGO6O0oZ2r
         RAHbDBOG+ookNWRCWHMVCqtDSc0k1Gn1VSNObrZYMv+8dH8ndu/zpTKACYIyElwFyQDX
         s78ylorJT6WtQUbKrclfj3jEnEqZzPyh9pymzUBFizI/xGljkinv8+X1ZNNYl+mXzkXB
         afFkt9RnqcDz3iLglRHW0Cg1q8Fiiy8Xk0vR2F+U/vzJwx5yHfQ3kuomtO8QpnQkUEfJ
         HD3i74kzdQRvIkancXaPXS3Ak15W0Dh7q3pzm8iZD3SYGCJuUk+W8j1q/GPXsYlR+ZH2
         bwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720319; x=1791325119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Qop1QRVxcddz8tWoGmGwLFCW73MGgkmUOvGYtVESlg=;
        b=RluYLV7PZJYHhAjVlBSU59Izs5Kw9NDCRkWDJR9BVMsCGTJwVIJ/RCWnbqLI9SXPf2
         78FXy7R85a+oVW9cWv9dm5CLJ4UWJafKDzYGs802z/66j7iKxlZogBj3nPDkM1ktllaj
         RdTQ0DvQ5O8gN0w86I1L18Q016EiQUBjAkmO+hAETyvlpnkBo21VJQhRE6ZpngKDwkjN
         IdQep417AeXYsXIg+Nsh08sD0iqC1Rq1c/4+6Q7Moc6Z1U1getc4mINnSuareGDeHpfn
         VpMRq+KLsq3HBPa0b59xQ1gpEH5AlGN3SFVLqQS+d/O575XMU/nXvHTYcjHfP0rFaK+w
         vVfw==
X-Forwarded-Encrypted: i=1; AKwUvBx8aLsLVhdKp5exVqucaYiib0tT6c5BOfjHccYX5DdvH7Ju25JXwf3F5vHDWTPziorYS4AwhIaOtnSHmHs=@vger.kernel.org
X-Gm-Message-State: AFuF++kcsSwawvJTw2o/H9SHV2y7O5kNs+WM5Ofm9ReVM4LD8lRmTAqQ
	lg19M/NBs2vKl2aT55ACoWBY0A7nthXdOiEailWT8ZOo5F3lODoKbpPlLpfD130/s341CCNor2B
	mt5/Z/lMZG7K/0xCKoQewba6NodIReORe0sg0xzyOYHmzkR+0riSVy2I0FbkIS3J7cDc=
X-Gm-Gg: AYBFou1c9ouRjulNipvlqHvETUDyW+lleV5jZ2B7LZP1uhouFYjWNADXAWaM4DLLQJp
	VYal88+iP5dbq6G4Xw1hK6BjqKuKgDVCHb26deOaJFhJTjilJ/cGtPP0hltGAj2nXqg+oM2Qfkh
	xQULZbj3BFZ0zmYRictKLmncXrdTXlMEnUqA4x+v2KkTdfRU2VRAxriq1UkQ6JnoGAmpE3pfyVI
	bYgkXqM/Wuc0+HJ1BxYnmmkWQ5iPi0C6QVkVFEdSyr4VsNAtfRLX4ZYM4jBuYW6EIopa4X74Z91
	9qgGj9eUxoNvrdJvBRjYpvXAr4xJG0QzyRidu9cwlMsn6qDQkHt//xhpQvHqNiJjDPsm3tOAEtR
	NijfxQEGrgxDt
X-Received: by 2002:a05:620a:4554:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93c9fa099b8mr187942685a.28.1790720319367;
        Tue, 29 Sep 2026 15:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93c9fa099b8mr187939285a.28.1790720318929;
        Tue, 29 Sep 2026 15:18:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Tue, 29 Sep 2026 23:18:19 +0100
Message-ID: <20260929221821.505551-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX6vDvN03TD2HD
 v1pxaKCNIIcaCy8LrTeyUZcDkVGvp7sCinfAW3tRfttMLcVk9kitbaUyqATbedbQLtmQYE8DR4z
 yhx5gmS7HPJKwJgYqyRdS1s1THCEjmWGOVigtNejStptwe9XMoEXceDGtbGgqxtixDa+OzK8iQK
 TYudErV5uy8H8Tnf27Fe4eShrH/xRi1JpmLvVtLT8HdXk+GqhDuSuAaAOWTrXf2VeEfbpoyniwT
 b90N9oWF2ZXdw9nBKmq7ij3J+x3k6JB3I7rkbMlyi4C+s7NNtqyc+d+QKpUEOw/5C9m4D1oU2qB
 0Fm7GiCz6yoyhozB7Q90r5BEDjv5WhyiiLZoMtRgZtfet0uP98glqVhuOogRh40AKnUjp9HYxqh
 hyZ0kze+f0NG/DQ/Tm8nXFgYXuvxsFG2xqXHyTTYJj5XHR7P/Y86a03HPnojeiBYDrmeSvs/hKU
 dQQE6w5zeWjOxHAjUCA==
X-Proofpoint-GUID: D7jeVsruqqWxz6U4j5QUcU_1OtKPuNYQ
X-Proofpoint-ORIG-GUID: D7jeVsruqqWxz6U4j5QUcU_1OtKPuNYQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX41lPwILyQovQ
 umuQ/MPOtob3siMR/QrxlTig4kQsW19272N4XbY1xlnAVkopBQHHxxLfOf3oUHL4QPBaRCOuH30
 otPkHUzlmEw2Zt/Brbvfroc3G97ILpk=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc3940 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MSM6P-WPhp0LPykjVWQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290088

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18a13b4a460f..de4647501085 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

