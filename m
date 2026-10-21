Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603729;
	b=abqdL2m1pvKmBcAoI0+fodc/4x6xu7KoTP3gzlil+02saxELvBDo7c9O3Ns0c/izo9pP
	 qZ5WLw7Qq9pigPhDVZAavjpMzS4wFVtSAwPdP4svOQZxkyGT5FsHkkvQLfz/EubXDhxIR
	 uzNdCj4/rfcLpkQ+b7GeBbTAIardsSMtBc9GhK2yepobm0DMGBHaN0He4tb6UGHhuCTVF
	 wCezXqKBIdf9qT7qxs0LCtkc5mWYuitHBFpOZqCMZrj9LgOhJe1aiRV3XAp9X6bwF51mB
	 CeoaknMqsQZe7A9bl27iQSG6CBZIQw/ZY0A/xoWkiu+f9mnxSZGRqgeXV82Q4H2V31A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
	b=L4ShWs28lELj5khI3Wtx0P540OuWWgxIjI/F+nKEdncoGWsBhSsWQ7Imf5ejXfmsq9ip
	 om0kZlG3LPVTc5Wca0VDop5MbTz4uSGDnXJMlBK5dqyqBmmV3AAVYODoNhT6yJsqrphLz
	 IA+jJUZCKAwOMreMWIaAaexEnHbjwaRUuKdNzhlhRwLpLWK3P7rJChLhVFff5Ea19VS7C
	 WYA0jVpPzHuAPMnBamTAaEz+h+jatpSm/OV1P7yyeiwX6VLWaQkNE/gmR/VCG3a1RyE0U
	 pjYqZ7kGN6KoZqw9vPk7QWGquRABXF+LgW/hD/H14hGU67WYAPxewXXjmLQ1sHyQ+UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A8606A336
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 125A8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXzf2sWl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYcEk9C3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG3QI9900404
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xMItVK0GNTCbTS7wNNLZ9L
	nzLA8lzBLhQMNHQ7KqQag=; b=lXzf2sWlF9yW8h/R6hYGvTTjP3iUWFtv3bf7Ke
	2vM9WEt14Z4b2yJEw8PBwx7U0yB0uGOs4QA4aOYleGhXy/WVhB4QgO0iD1BAEWBW
	YotZ2LV2/LP7z3Uj3nRoJYoOfmLxLNwaLDoqYZtasAD9oIHCDi4388U/n6VNPLIr
	Z59KAHv6ln2H8wwcPPjZzX7FmeMbSGWPAb72bFrhh0SLjrdvvNvsIsPssfgVKWfO
	oqKlDQbjlhR+jvcka69JUvUnDNl9kiKxqV/70FDFKgkpnq641cQnb5ShJS8JFoN5
	3+m8t8BjXGKdYKcUBfATDhHgOitc+x1zDoWGRIWoiuNSSnFg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2gcwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:28:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-17dc865c94cso315775c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792603727; x=1793208527; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=cYcEk9C3HW17Nm4jnwQJDXsIHB/5tRALfGp2G8OH3g8olDWnn0ErpDB4yvCBPLsdgs
         kNwiKPMvK3aNgYM7NljQmQtwaGK6rk80bbmfOXipN+aE4rO/w28+DPBrYO/HY2h1A6tu
         lV0OhPi/LAayG43EUSc9q7yqCFDldpW/JJg2/HBtqesC5twSY+7hQv/Z9UHN36FtlD4b
         7RKROosHMLo0Dt42vdE7UdiRMZ1wLHzr3DZ0pcyiF+1Cc8PSdj+LEgKXVd+HIndycDjv
         HyhvQf9FL6EfsxV+eZeIUGdshJux5FDAcWA6U4PI15+KwZK4kZ2w4LqLla2QYAhD6oU4
         WtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603727; x=1793208527;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xMItVK0GNTCbTS7wNNLZ9LnzLA8lzBLhQMNHQ7KqQag=;
        b=cUOiwQrR42anCT04XWWxVQ/LGl0qRmzbCFIoGtmUfBWgR3Mnxyz0yjTuRJgTeWNe1q
         TF5hy7+DC5066OZCOw/V5oHirlAR8wAAjCchkB7eIIMeQd7We1Y2YJTxhbiJYdoJg/IE
         5XaHauehcza62xe4AdAQDtw6/PnbXDc6fLKLEau2YNuNVkEKiXOtcaB4BS/EmJ3MUdWf
         TfXlPCoH9WY158IrBQkynNYTtnSCaf+C+oheymigNn0+CxtbkVJRRHX2pxWsSkaG7Fej
         d7Km2ff3xEqZEXWMSzjqTJL7PEMenAUNcbDbVWxYse8QEqSOPPU45m/k0tQ8NWGrxDbp
         3lOg==
X-Forwarded-Encrypted: i=1; AKwUvBxnd9WA56x9s4SIOGm2sBJw4gXzcnjVhPe6fmXOZc75sNFIxkPbva+05woxqlFP9JKwPfYAFC+i2AoXhAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWN5uyheHix/dFFYnvMM/YpIqxBrlhJjV0aQrWj80PJ/ko24Yu
	MngI4iPp6XzBUEvW5mydzyEH6Ubp6vrG8sVN8jsmUMFxSX7/AiuhJwr4K3O2e4krSPfxllIF9s1
	Gm3uoTWH5YBoadvmJX8/lxWF07GC5tL1wsP7RPNZJodRlg6Pmsca7jvDri9w03KtYAqBB9fAWzz
	I=
X-Gm-Gg: AYBFou3Bxvb8TlrXzhu+lxNtgXt474UQJBbO1KU73GQCtOaalyvL1WHfuyFAgOgLL1v
	hGdYt4tTx8iUiA8CCiEOi7Q6w2AJrau6RSAo20R5zOzkT/PGst0Cv7UrQds2d9JoEDDeTDtuUsF
	obMvIXIoBkErMQRbZORfnlCXreJCuUiuidBF8dNOM8erralpEjLLJYWdeaa+ft9Dwv22IeQt/+E
	5UftfrBT3kuq+TgmyoSL0knWS5DQ+/jV6336QXodAGnrDJPncHn3O8/vi/0ip7j4i4Yo47Xy2Zm
	VXLjBoa+Ob0SiY6MUTv+hod/i7fRQe/8O9k3O7z/64YkFq8hiwsz4T7iQJ3Ds8muZLYuyn7peQx
	ecxAszRgQqVTIFFdLKzllWOLvYy3BdRBAMZZEWWdV79pQwobiLEaaOrL1FIsaq5/SugqB
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709280c88.20.1792603726497;
        Wed, 21 Oct 2026 10:28:46 -0700 (PDT)
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id a92af1059eb24-190a50ef799mr3709235c88.20.1792603725903;
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm8528561c88.0.2026.10.21.10.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:28:45 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 22:58:37 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAET22GoC/yXMTQrCMBBA4auUWTvQGfwBryIu0mRiRzSRTFqE0
 rsb2+W3eG8Bk6JicO0WKDKraU4NdOjAjy49BDU0A/d8pp4Jq3tlw/B26PMoRVLFyQaMHC6ejo7
 pFKHFnyJRv9v4dt9t0/AUX/83WNcfVUu1o3oAAAA=
X-Change-ID: 20261021-talos-dma-coherent-usb-f2d7c14a215f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792603721; l=959;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ETROyRThRqGdVF4MqJ6uGiPE5n9rvqkcDXa+DnHtkfI=;
 b=MF9aXAxKll2JXritzcmuL4OWujK7XURpVFZSngCES/Q0lAoQjs7TI6cPtM9TYqBZPQVv7ksKN
 NZxTeZaL3cBBRBujJS3iNdROnInd+scXzy3A0M2Pq26avexiCnwPczu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfX3kNWMTATwnyv
 aPVreRMnVq9mpnNwnrdIao0llJgssMBlxZ/i3duBVHCil9Kbibcj7t3S3VdbCERXaCVenBZmeY5
 D6+dZlxZ9aZDThDAYOoVDe0KCy3fSA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OSBTYWx0ZWRfXy6+beV/M32wU
 5sJjy6jpl0weZsqI+7VfhzGotgk/JWeIamUGoH8oq81SGzinchbSo9Qh9nogZBn+/JM6g8oPoeL
 5d2FBrRfhP2+JHEp1j+Vqiw0TgPIdCLzijlJ6ndSgcP2WLs1FHIviWVEZkEk0h6muU3gjv9r8Ft
 gw9horul8uac61MyF34RcLCwgtlJeOWo/2a3ChZQ1WWLS9P8hLouABWLNJVCilpWgPItkDGc93N
 ftlxgrqc9vrWFHCpBVWfp6TDZjgWwdrud/rB79r0q1ES6niyK4DT2W+jvySnkmGfLzenhHYV/7L
 eymk6dtVLlK1o/7mazS1xbVCyYGB1+63/R6ebODxaaiQXDlt1TtqaL3IpOqRCiby74Y68zEN+jt
 NV8s2Bv2f4YqpZX1WhMygDfi8XqUt+TdlEcj2mptZGa+bsv/77wW2e6uKsB1McS5oRQpl1wBwN2
 Z+kZyedMrL6/Jl2owjw==
X-Proofpoint-ORIG-GUID: Tk07orhFhuYWCphureccy6YF8HSt7W8v
X-Proofpoint-GUID: Tk07orhFhuYWCphureccy6YF8HSt7W8v
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad8f64f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210069

Both USB controllers on Talos are DMA coherent. Add property indicating
the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..70b002d29ef2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5158,6 +5158,7 @@ usb_1: usb@a600000 {
 			snps,usb3_lpm_capable;
 
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -5214,6 +5215,7 @@ usb_2: usb@a800000 {
 
 			maximum-speed = "high-speed";
 			wakeup-source;
+			dma-coherent;
 
 			status = "disabled";
 		};

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261021-talos-dma-coherent-usb-f2d7c14a215f

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

