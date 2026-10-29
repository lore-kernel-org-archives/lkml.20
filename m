Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260595;
	b=SexNgUpmYcPBbmtBxaIVyMy86NbeTs/7MP+/I7VgmcxTmdHwATUvMQMerTT218gbE3O0
	 lTQ3FLdyK8JLCXyGknULdvYS5ev3n8ivbq3skRE36SaRjBvHNYXYILukHhg4PjZ1lDrRf
	 g5NFF/ZKB2oBiX27h2mDPwODeAo/PUqCrYpKp55oLIEdjlrryMcT0MwkMBH1X7+PXhJRs
	 NUGO/o9v9FbY9kKU0X9bT+ibm2nGEyM5njxWi+zh34T/ReVJXc1lfX/at0qzcASckZvfF
	 fKBVguSSb/GcQ9tkuB9I41m7JI0iwMB0E8IlvyAhwa9DHB6X4nPlxMcPXfbUYRyXRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
	b=cmUpMQB9esFIwgKJwRf+vI0qsYhwsaFOw87mfwD4Xlrph3pBleTB8eoo+nGoDpkCmLs0
	 CSlpQ+FJvo6rdPNFUsSDM2Q+BETc44iSF8JnC28b6Y5i3l/YhhOFFbP29+WwCIlYNaQdw
	 Be0F5KixVVM7tPQUdFFZyQRmheXatIU7qxwVKU+iTJ/nTdb6COXc2tAkEqTyOKZbLFuvH
	 /DTRKS0PiJKVieMjBD5cGGgmI49hkcRQSFnK73WlXFhJsojpt0g6tr1WymsVp+9GWn8CW
	 Cbf1PtlrX+UETAn+9ydEJTfyLpc8Csj0wVYZ2VU267Al0to3eIei8w50m1GAwYbeMmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8F2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMx2g3Rx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bh0NGAU+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gnl03340953
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0BbKjuyacWjFfSxCUg+nai
	C57lOWfOhV6+ogbgLCjQA=; b=KMx2g3RxQZCfQzh5E9VGboxNpHvz9pwBZuWuqs
	53xFfZEh/+F2+d68ieP4gKJve5kNTMGg+0XRQ+F7AxPpV5DMg5Vaao1QewS1E+G9
	QiHPiO4qfc0xbSrKEPyFGnOVYdtHSq0aDPlzLkT1Dh5E6YGd92GWp08HfJ38j05R
	Lgmr89RlSD/+qDS4x3hsvDouZXdeftHSke6aO2e1ODqCOzANOPIgtkZ58eThXiYE
	nUVTnuy6ErKDbM8bRMg836SZbh+ZCT1KYNvUV/IiAXyzz6S2Nx8KdPpjNw5iGaaz
	OIwR7cTT8c+VKIKh2zdtwk9cLHgv7UE+w+HPlujcPcRXn2MA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hb1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:56:33 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f8edf0c859so629672eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260593; x=1793865393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=Bh0NGAU+0JWTXKGr98Cgo357AYrvD1XOa6UAqa/gVjECEQXBefdVK+Ha78NlAdmg27
         RO4CxCAzbXWs9WQoIF01yC4ZyN7HBO0uglN/1FphIfMKo30kCdGMIEHTLz6P9AtQ0cp2
         Q0CM6Y62fMJjcxQ8ADNf3JvaByFQ3G2kt9E0urJZt9H4v4wQ+wKg4eUU63Js9OdVEPwu
         hhFvVA0jpyhcu7Zr07k3py7MIGaYAQ6HRyM6ZuEP7MKaAEXqON9iN06z6uFvh41A5Mc+
         oIRKjXtNddksJCgcSEBcjoAoiW7wsJ5dnEMlFtXEsU0ovohcCWFl4kS8zJBwKEyP6j5W
         naMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260593; x=1793865393;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BbKjuyacWjFfSxCUg+naiC57lOWfOhV6+ogbgLCjQA=;
        b=bXHx8PXSsY1qyjoXjocm8rGkNPu+W0BCMksTs/fDI+0OCf11eAxRLa1akI9WdiI7Ww
         ZNCP/DnB2YiHgPTF1lzt/lnCwovel+jD9NHxFxVx1AJRsyZApc9jVWQf+TE+PQr3WMji
         CYlofcCAABB7cL37u0TV0eC4MWxMFwUb0dlgUin2a71EKeIIX564lsZv9jeupvRBUleN
         9W2nLj4qRjmiZVhuYI6C5q+cnogRwjw/CBFzQMoRrukk40nuU1fbBwGD/0aIo9TKuGjH
         NiDgDuYMdGwJHWC9M4V1TqT0YG4j+eTHp4ewGLNqdxlj+LbMtSLHqIDBo/EKFTXV/p9A
         soEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVqfsN5/vgl5ote524qs94z9Z8qxxsnzXcTFFMEkJrZUr61TMGJZcB7IW3yCbnLSKBZdqMSWCZFR0FmFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Je5NJNYCrb2Uv9T82sE1TZanpgnlPtKIqyxPCaLCMwiLjlo6
	pdfL5dJi2mu8W3CpTRVoZnDk09vWRgV/OEGQJFAZ8JubLbGasVS6m+sCGoyuJPHLIm4/v+lVrvE
	ntJrHheYJjltHOlrKwhEUOh5l5Y/9chNFkQOds6MKhNj+KHcGYZqz9YY9cjpdJYKB7AA=
X-Gm-Gg: AYBFou0KYfP3oWtsiTd8lzMvvpALotWZ99l/OAgFJhzmni3h5on9NnOl68c6H29eZx2
	VfHYs6XyWXhdtjrWNx1Sga8rUf45HqU3AvFIf2HSK76zz9XuY75aiImQc9crdfrDChmK72QH+QG
	2m8SBinLqKa0jXhP9SlVuJ39gVgBi8/t+M7I8L2/2F46j1VAO4ldhrwNFa7w5alBd2rp4JbAYd8
	1GjULqAnIT7uxV2OFG+L5yKl6A5tTriysBH/FUAcnxoubVreO+owekvZrh3+FT+6izQBs12My/p
	bxxbBNEyy/eeNKnsDJi28p+oFMNIQ0Iw2mCqB4kWXHCXNMalgYBBOd7UOq2n2pbt4Tg2trMSla/
	gWFM0JVg4n/jPfnwO7zbambDyW2/aMHAxNNh4OYtoc6SJvjrVynh2m4vZsrmxAWeTbEUcgs+l5j
	tE+mKVdNcfExevZIuZNTueVw==
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879410eaf.22.1793260592748;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
X-Received: by 2002:a05:6820:628:b0:70b:8cd5:891d with SMTP id 006d021491bc7-714ddecb937mr879400eaf.22.1793260592290;
        Thu, 29 Oct 2026 00:56:32 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm3336632eaf.0.2026.10.29.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:56:31 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-advantech-som-db5830
Date: Thu, 29 Oct 2026 15:55:43 +0800
Message-ID: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Change-ID: 20261029-come_kvm-0005cb782051
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXyO6Zjl+La917
 6zcxCE2dCJ/PTb9BTU3fLgLoEIvaTzfheCTkzAfgoNNvbLMAtlMrcN6YD/yicxNqFYPN9tO0Sj4
 1avtG6p7/69sjsCLHvPNZjkv9ia7444=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX1otk0tsCdbpj
 eNTRTCN4k17Sxdz0rmz5oboTtoSvGFpIlP4EG+npsgIeisWny6iB7Donv4Y1sWtepSGzbUW2a3b
 4zoin1kcsIJmotaJJZVDCf7TQayrs9Uw6tgjdDR2EO4Jl36mZhetTryQH/I8vkN+txrl2mFjI42
 HVFtmWEg5uEOggp3EpXUV3Cd/vPi/VCwKEa+S7FfQECn83LAIUMxvulhsPTRHDR9hYJBjtiZqpL
 GzYMdqvNN1aIQRm56gmUtypGNtB9Z3CnYtbRrA7xKOBSsp72CmOCbH93zR+amLSKQwKI4hVTv2k
 iLp+hPHzSuEVQN6d/vZbyZyq0mDAK6d7UAelyu6FND+i0p0za4alTlQAWbd07rpsDG2aGaTBbdJ
 ogdMYXRwwUBAj8g5jWlWBkVX9EwLXML8TXISi8AHwvVNZxrqTWu0AhYOqQMHF4Mw61mPle5k2nU
 O+sANZDzQb4SEiXELeQ==
X-Proofpoint-ORIG-GUID: laezNHEH8ePvHT9Ju3tBeahQLIDZFcrB
X-Proofpoint-GUID: laezNHEH8ePvHT9Ju3tBeahQLIDZFcrB
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2fc31 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=50O9vvR40McnEmrengsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290030

Add support for building an EL2 combined DTB for the
hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.

The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
enabling EL2-specific configurations required by the platform.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..13e0f47bb8af 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -23,6 +23,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
+
+hamoa-advantech-som-db5830-el2-dtbs	:= hamoa-advantech-som-db5830.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-come_kvm-0005cb782051

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
