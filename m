Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977334;
	b=j7/W1GZOfC16CLa50L+iBqZ6UX2IbOwloM38CkAKfXQtT4a3gvb7t1pUEvxnA6aUB1KH
	 Kd+IFyKfZq/m9oIqUCRjWyF4t+z8gf4xtsWf3tDBv7PqjOQQW4gDAV107UTFKrTqfzHi2
	 Vrs/X1pDxiSmxQM+cYkGtA/KC9niwlWLrQjGhOOR2kjL7AIw6iEaPqrSnM1hp2M8tihf9
	 Hal75Q8+TYDotM/zm0m9bgBraaHtqRif+rsVB76w7bFJ5BfmN30USVjeRDD/8jm9os2al
	 S++b7LuNcKWmsOeM0ia2tOWc72I9FCxFO5O/+ZoAcKT1PQG8gR3jY7+rrUEWlLiKK8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
	b=l/EfN72/wb+WGRHDNBZ7u3/pyykTodl2b+/GyjpUZutn5pl0ZYBV9cIqFlYq8/UKeJ+p
	 7usja9UhcJlcbehVevvj+HBJrMHsbIfiW6eZ1ElNn05G00yAAPEMQDGjfojfKN/eSBBD0
	 TPGuolsku2ZU/OBDLilAFZ0/Q1XXWBIkxbU5ATX5rdSPzrXYD+7sp5z4FjsLAb0LWYC0c
	 TEPug1YYlDiY0/oU5Dmc/EJGBIMlF64+6PlvWOGq8xQJfTKU3ZbpoFkACHJobYdB4tFv/
	 r5REIyPiVH5xY9TWsyaz+dn+rQU9NTmKnpTO/movI/RFwiomybw2EtgnwYCm/os1BXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4A606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E4A606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExuGL3722890
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=; b=SDZaldbOmYwG9NEj
	hM8bmVDNFqSSe4M/Qe0rvTogB1uxI7CoLNtl0nHoSNhO2/lXxgR+NS0kohM4SeP8
	ZTTyMogd29tIx+VsK0Y1peZr5KeQ6zAeYxWBbQAtW03cSaGVqqyvmRGZry/Zsu14
	JD3u0XniyklpslbdRRBws8fC8HN9nqxSSklCOp3yYpDmGN4slK2p2vbVQtro6Y0f
	FjvWudy3MDjLg3a+tg8qpvx7L3H1LeauMZwclexb0vmVD1/IxAJ86XX+lGqz2rFT
	NwHX5qwFvmeb2jGM+xUNldas+5nAfCDNtusDBYFKxVxxV8yVeKO6pxMHcBuTaFcV
	ocpQuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k7nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:02:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso707611a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977327; x=1794582127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=a29Yh8cU5DH5boyQ5JnEXfDmNLDEwuoLwWF7eZfcVoNKtcwFhIui1WhgUCp0pY/BY6
         QjoMBBTwvUa/Q6u8p+MxNAG903gsnOKapgxhwvV7zjD/HmD43n3CNmkmUgYt2nsPtc55
         /EIqORXvyUOWyhDfsCR1KSGFcrCfUca6mVxM026oy94A8gNZ1x07omgqwzmnS+zsNtxU
         GfwJ9V9HZzCl5AREfhFaIlSFZGRUXT68fVhYNFd51N3FW0ZX3jT+XZ+8N6ua49t0W+9b
         ZLYtW8PmjTSQUjypRFyEhoOlbWU0emeQmobKbbvwPaZDT91Dy2ggIjfTPMsHJ49wLrgd
         L3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977327; x=1794582127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=1tWLlZcMn8sSt8ITP2JGON0sQY6m0RE5BQ1W2eXyiGiIGiFNJIPeIUHlYjIdi4FAey
         dlU4qhzNY9tGTY4flzBxAQuUIQGqTelXeaX8WwvFLZwGtC7vyMBxRD2fkifsPVsV0Tgl
         7b9Z/4sq2p96gXIL3baNCbu35kPcfCAw1GpAxAZygB97ImC7ILea1ivpZGRnXq13+q8c
         mbnSPDoB1Oqpwll90Pxw9HfY1v4sYPuuvdLIAJWmseG5WxXmZ6si8dw/cDJew5dgzznZ
         7GJZ2FR2ZVRIrK+b70kV1P4sM1Urid9OVEFhyv9G9gt4q6P+KdtOa9tB7uvJkcuMz+f0
         KOEA==
X-Forwarded-Encrypted: i=1; AL+hErF37dJB41hAd+JvJDne0dKlIB14Ojqv9aDco59tDGX8AFfOnbVObnF1Gm9pKrDmbhqz9xR8xy8DTeRuokI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mi8ri8DGxpGeHlv1HLTNSSAndWimvQbU6da+apPPjWiMvhnSx
	ajBbmEqy7fjiYoss9gMowZGy2MS2cfft7X0qnAw91As0om13ZGZGTFD/4LThTm9VCO+j1YiKBi2
	u4zMrrA0J1j+FK9PcBR6988wkITJnh1Bgzxfz0eNLwe1FgNGWYp7ymcFVz7s/SJ3aw0k=
X-Gm-Gg: AYBFou0nwn0080LcPffUwjDsQg2QGQDo5EWBb9C8xZPPHo1H02jSzXcX4Acd5wiD6D0
	Q86LXcU+4vSdr/SDI7TA0EWZOjr6oe/JMXEYaRNyct+DJ2kP2ITLVyC1cqqu+KaxVntURU00SBX
	1N2LIsrgVPcByUVqXEwNt44kiFB7w1knfscd9ubFh6MMzzweReBCw290E2btv/zoofRKHNkmwl2
	/tkRsln4ijoAYifg2RyD8SaXrNzJREtWJ2pKDczX2XeBpvyL2PIfncDVWyVhYCbY6MMoCivLBSD
	g+V04d1rvoccNT5RxCm9PctlVxOBJsR9v6ZycuugB5CIMPNsxuWR8uSVl/OK2+hK7gozCrAnPAw
	AmilI7KuAWkh4S5PXmV3AQvrBq5egebOZimFeV5W/z6PFcG8oCcvcKhcqZTjcMeqiewcXdkLB/2
	ykf1MjLcCv
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344793a91.33.1793977327083;
        Fri, 06 Nov 2026 07:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344749a91.33.1793977326247;
        Fri, 06 Nov 2026 07:02:06 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:05 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:20 +0530
Subject: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=856;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=iJecahOznZMfSn1ZECEomSzUGcetmfIMkxUzE7I2o4s=;
 b=B5SY3JrN4UIDmzeORd0lh9riEKx7+MDEpI/r2Yb04WH6sz03eNKv/Py/s1LJ3p9cSHMUByaFT
 yK4pOmm/NlPAouJHsvCk8M/r3gq3qJbwpGP+ClC2qE9librYyE2HFba
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: QM0yoLbgUiDQ60Y3rX4DreR6UHWIwwnJ
X-Proofpoint-GUID: QM0yoLbgUiDQ60Y3rX4DreR6UHWIwwnJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX440EhEGgZbUk
 SPWEnRWOP5bsSgy4kklDttCfjt+7ZYCKooNbDwnUuVlQpAQjT13e8lsM3dndb+8Pmka3YO2TZEt
 fhlQtFpXbA9Ncg1U6sC8aZ0JhTiIxEk=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedebf5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=htPuCn9dtfDBuPHNxMEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX8zzTKdb+mB9u
 empwLeokzKMQVgyid20Q8SjDK695reW91JJCcTIotWbA2SYaD9S5YBtsP9dE/VNGvP/Yg6SYy/4
 ZVIJ7DAn5G3xgPJ92/rj7QKm5rji5+iysrgVgxRHEe60ThyhLyTEOzv8wJWj9jx0itK/3/tDkbS
 JWFxDB+8hf4JOnP9vEG+3DtPLpwPfm5AxNf8SA4yS1+wakeyx5zKoQo+Qq9jSgDByocMaKHkLiz
 cYmab8wj1vr40yd6iZZpNALes9MYRQTZDrhgIE3hPr81RpCV1TbmBkR01A3mnHJritNhjcHaoN6
 PPYZi2lhrXvZNGfFuKKpQ3uUZnkKzuMJ0CHGuDmaY9ajn7l5HaR+GoquefVzuWw9KgbMAExpEt9
 tBa1oMP+Xlrc4mjzdxo+3542uE2Wj86X/nAs1ge6ZRQViarmH9GxNQd0QGzooyfp0GRyijA/fKx
 npDlHmR5RDuZsJ4euuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
specifiers. Its value, 9, matches the GENI serial engine firmware
protocol ID for QSPI.

This lets a QSPI controller reference its TX and RX GPI DMA channels
through the dmas property, using the existing channel specifier format.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..68fc1414af55 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		9
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

