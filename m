Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670772;
	b=vsDwWIfmwmcty6058cn45pT3wlmgWVE4qwTGqiQnEhfhZXF8uZ61DmKdnP89vsquQy0X
	 K+ccBTHpa4pZGHI20FoBnPwcWKq50cLa60QgmH70+h+PNZIcUI8N/4Jzq+jBrfsfYvnzC
	 7P3c5LuKNpdzco83L5w9/Hr2xeucZm1yLOEyEyJXZchLYYwIUqVia686z5PO4As6ey/NO
	 jnjJv/U10GfYt7HF7cDpmOKAYimlkLDceNATllnTPcxnFB26vEP+459UHjQqrhLJDQ5h5
	 rSqSqyYs9zrssLxGFhCE2/zR3YjfOvvCxZ90mw1XK6IxoKcPYVztOTRSD5FwVmid3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=T1H4XbCBfgxQ8902IDaPSquZioBLVtR0axOZbiVX32/UkJAzCDYLSJfMIz7bOqcMbeBn
	 9ZY0Muzo/DEyEeHFkFF3SUZfrrNchyDbGhXBJ2stganEECX8dRuMHzKf5nQVi/haWKS9+
	 8AlFQiBnjDF7BPkWBWANHKcUKw0MyFybybkLMk8vyPDvg9teQurRH/5t9vbE8JGV0vH17
	 WnTp/14Z8fFrCqfvtTB2EvBoq+U4y2EPR2m8q8La7vzHaTdfR247dMtKKh3XFsgPQ/nux
	 FwHnJjrzAJABP/CJm/dBvB6q5h+C2nEdPJILEG9UxUI2POYSrogAiG0wJVAjSd6rs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ckjtQ2E/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1060A2617
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE1060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ckjtQ2E/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkmQ11556605
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=CdQYFmANNQYaiL39
	Qs3rz5EFvtsph67c3HwOmOjOgk4E3mZ+5zvqvcHZq2FP4R4vdwxYkSDkWHNkAJ64
	RbuPE/xRu30gyYNW74rOXAGinif/Z2JNDoAPQFnSx8TdL9ws3qB/wdb+HB6YcDZb
	qNwXlCFfqjtbpUspOHmUvjZCLAwR58MeNrmx4WbYp6DQKrKLkNmgIP0ZQ+z5Cn5m
	RNfdM9QLtj+gFohFJeiOMPiVkSXYmyw3VnLApTnxR3rsDGIg5MOxXVa+lAgnooGn
	Wc+pd6o3d4q+/v3LoCyg2MK+IOcc9Y2EMpc3SQHQTPMIEn+YWdcPviTE161ccE7I
	aoIaHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8s2mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so72690585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670770; x=1795275570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=ckjtQ2E/L4Srvl+3Mz93nK7kXVRQ8DbtOnrkTf9RMtoeqPlj3k2KKb7/GQefHmAzMI
         hdrp+ohUMyY6ci+CvJHsKoqt3fVjhwAJW75/PcToTUjdv85s711mG4gQHRocO8wPbSJp
         RgvKX8BYJPV+PPv7laeydy8vTnIKlJkBL8ZB0D+2/WpcMKd0tnYaLjr8lcGK508ogJG+
         +HjDcOpSXMVGl7/UZEUEkl5mCF4U3hRpukupHCmaSxFwhgfUvtQeG1nJ56JllZZh31Xi
         GEqEV/va/Kc2xQLLUQZXAtyF2Qt1kdryq5YS1KCHDIPCaViRzcIkmrthzr9F+39rLc3d
         kYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670770; x=1795275570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=zRKDquy1hL8vybzyjLnDboOuC09muZ29frhnzrRL6y7WG7Cmg3+ZQ36zIvRNZfRnkA
         PrcLQSiUu2CzGhiM6CwLPDvoxipIGScf6tAw+9+lP9eAF+l8WbpE9LbJJD6G2VO17hTK
         mAJ+tv8EHiBOCMiBFjchMLmV+6kTUmtnV+unAsg/fjpSteedIXmlmUZlxWuPoXHeRlaL
         qXDbNtojSFp4XMP0HAacqsp1z6GL1dWkQBafauyhX8OqRdO/eL9ZiB13tV2nvngbsu55
         Lou4+a62xFSiXqgTfcES4KcSOGtpmQDS13SZ9YYmnV9+DYM2Nd7iur1jtBaCNIQ5qw8C
         CxdQ==
X-Forwarded-Encrypted: i=1; AL+hErGPQPRIcBPkvW5pQEhPAPp2WM3/eJr7xJDMUsmonC+DHaLRdZN7RmEpaXLqz6nVg98l1CB3v13yQobcxtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+nRwcuZP3sKfEwCjJOrPeXi7B5HfTKDbXHsNP4HsP8vsofBSW
	jpHF69mnX5LQSN5F0+4xdfPcCpCxkr1T2PAbzyP0GdpieMEo0KK/msJ+BTovNSYoSZSJIPK1hJp
	e56aqyl5Op9UOevqo9lM/00FC2TNhB4OpWwFRXO/UIpoYODeH3vmrQMGGYYuUCOpopT0=
X-Gm-Gg: AYBFou05ek6BoF5cAe31XF3sjQVmtM9L9MfbTQ9MUm/QnsgGMH1cnBa8MiWDR+98jUu
	RMon9wISqmpmuhJCIO+her+lnvFb7XPCnMOoA8WVIHEutDoX9CWKrxXW4no9i69Tn7Tki/ahO2f
	SpJL+hDDcbngk5VEIIoYfMHIYEze6p6IOdg9E3zUBFTTVr6WvZOD6tXF1KuogxYM3kW3ZOFi11V
	yrtGcaC1qxZ9UPIxA2ZQDTXDDoXNhEp16LN1B9ccGPJYx21UosXuLSyPdpI6z060oRO5rzUTx2q
	SFXkuRW9Jq1JiQfaXSqBe7Sc3SG7oQL5RWUy5XY502UNlLkaTMx2AJ+8DaRCZzjVKGxr2SjzkYd
	GlZ/UAu5Rfc+QpE3n7VZ1n+BO64K5hHrQagZkDk02P6cKlAVnbSe3rGflE/ZRL7NDVlEyhd0kqX
	eZjefe+v/pQFQ/
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995698485a.44.1794670770351;
        Sat, 14 Nov 2026 07:39:30 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995693785a.44.1794670769898;
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af880b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5Ki02kqr2vSk
 gJrm/7kyBnhWShMnIQlVID2pzu1ysUlo4tDzaBh2ou7QY7/759EtPMxFbGBTJchSk7eXlioWaPH
 +gbzsE2Y1AnpCyorcTbRSQFuEw7BbVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX81okxGr5MFiz
 R/Dl1oMJtEvWxteZ4/nC+ijq8viFj57q/v458D/uYVB6DggJD+xMHL8zRtgK9yASzxWuvpjTp1s
 JNr44GBU/SrRwwYj+J9GTfkVnw5Yy6VlLJrA7tG0ZjuEQIdbtrjCbDIKJJqF8pxqQWShu+jexot
 P5ipFZYVaG6rnq/TxzfuPoZbXKP08AvpnemErr3mwcXjWZfHjaJyUvCGgkJ3Rc9EN4ikOTfgnzX
 9Nfh8GoNd01T4eesBoIzLX1kKXaNsBlTCTG3Q6nKXztCggv0ywypolfHJFJaZTmGIm2cTmDvYqS
 9EQhwf2T0w0uv/v+AgSZ1qdaVhInq88IZTit149G1tQtPbji9rRWG2XJaUSzPnKuV1M3q64spuc
 qY3Zsw7CJ6AayeIUz3FiBC5mWv5foIH/SXJaTR1h3X/7IExNLu/+730DOYKuf9QV4X5HrLIBsyk
 J/Lqamb/xuJNVpFTnUQ==
X-Proofpoint-ORIG-GUID: X2ncg2uVlrJNg8d3_oFyCE8w-wqPJRUG
X-Proofpoint-GUID: X2ncg2uVlrJNg8d3_oFyCE8w-wqPJRUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140062

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

