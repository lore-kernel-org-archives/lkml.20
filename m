Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223972;
	b=TzuBlxEjErQJGSEcRUi+IQtDG/Q/n9kXzSGvLJyCV9knJj0liDvxOBPEzl0DI3bDIqqD
	 SJlowWPcU6X1xCDNrD3i50vs+FwVqC1htGXgOkAlwuxZHDLZsmEQEftqoTlx5m82BnqNx
	 7UmgeWPWee/e5t1UPOuvWe3xBJBJ6Gl0U9auqqmZrnxhH3YS0OoVu+rcpSxWJDxl9uDLi
	 4EB0ztYP+MHo/61H477pB/dwxDYHjxdUMRuQMEUYK3J86Iji7E7qIs8wYf8fzWHaFXBE7
	 lSdPlvnqd57yR76USxHvwTRrFDpmRRqwarhSMy8oCQ/YYEhFPP6TtcdTlDcnIlbKSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
	b=QhWD2/mKWCPpXcuPbNH2FM0lW5NDyz53M2KaKuAtR0i0ll3tLh+pZhvpFG+70swL7x+O
	 4OMB5pGazkRB/+Ap4kqI5MXmAmykNrsrBTx18dYjxLiv0Viz6zUZP8aZ03u13EaaUlRUM
	 BClJNVkDZ+GqGV23VfeK/VlCGxewRVfM5e3ejOWrZr1u3hJld2k2QGKgEeNku8QJlG27Y
	 V8wjde9nshhihfiKYvQM447JMaIrfYTrKdcb55dgz+AfkpviLJ5xg9UostK5d58G343tP
	 lzIV/7yLFcdUwknZ10pGkP8qHfvzA7k7HARUvQAq7CYENiEmnnjBshvzphPvrxdKOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08860A2607
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C08860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsxYDtvw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qn7p2JWb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkBIQ2546667
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2qTSPs3WOjS
	MbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=; b=lsxYDtvwYLs9XrfKSB9NiPvMgl3
	2JMB8CvvW7TH7pK55uq1HkefWFDh+OydkQEEWGnMTmZlWkHcS/KXdGC2RBdPjOLO
	rPyy6qz55XQSEp5B3n9sAGlyPXvslyImKFTc0HK7dA06igjgHIwkQ1hvsNlL6wm8
	JfXKBQj1Kc9LfTgB2vtHh/88nlTtVZ1BOXDx0NcyGY5FlVPGCMajD9hVqq73UWwc
	a0SDd79TACTTZf6V4blZ6u8K9DU4ytbwE+joOv7adxqamQzVFV7dL6jlc6HaXZQu
	fTwcpQG6aPPQZ63Qvg04Bnzpccf55zGHqgU56UBu4aUv2Xthx1F9iIhXRBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0kxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so83198885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223970; x=1793828770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=Qn7p2JWbxU0y5SFU9I6cmDNxasfwLJmgXAEIR++nIJWooUqwG7Rj57+LXB/Ja2JhET
         OBNkfXcPDac39N6KAnnivt7/8cxkeRDEnkDhpIn2z08WBit2myHnCbo/4flsnt03sCFL
         SRbxVIHFM7YM0eJoRzfRcHL2V8NPjZzB0l8KkryfJRajnRazKu0U6xmidZMxVdym4ZhI
         IdB8LOaO4TyxTermOsLxmaM8IORQMteYb7xx0iUTCfWym4OWF8EDMkcNdoZSwW4kG9t/
         ey4vrxGJB7Y4qKxO73rVlTdrPQ64umrY7A8uM/5xJfu0b/To7B5rU4v42XXVB+4OkgNG
         czwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223970; x=1793828770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qTSPs3WOjSMbvYUNgRZIsLOaLBSwX10KkzzPzLpRFE=;
        b=HnZP3XOhMQxblpef7joON+YT49SlJBTrCsmETuvZt1uabjFJYTXAOjGeD4+T65k3jF
         VzkfSUoE9ouqupBRiggYrd508dWI3/BDKcyRm0Nr7tvmrfgB/rgV7muXaURdByW/tB0a
         GYq084Hia+T9n/USt5VifKbOY8BJY0+u09qtmQbTzcWJx0VH8A9Hbers7fmbw6GeYxAM
         y7pQClDJCBlucIR92ml45yaHRAXqHea4A5ea3C9pPuBLLtAPN/pz2coFqqvuZ+u4JqTa
         DKJUAeH+53c+zmZBVDpiDAIo1ifqtFcHgBZPNWg3q2Q57R1BIFD/ooH7SeElsWt5wXCx
         ta9A==
X-Forwarded-Encrypted: i=1; AKwUvBy+GbPhQ2haWG4+w/ljf/Wd0hUw7nyG2tuSx212IZkIOisu2FcBmvN7GVNWRz6XYj/7bEC9KJXI34w4n80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV6rbVtCwwM/xx/b2rSanJtmzukixYBLeAXlje0eQ7d3S/mV9b
	uN+sFrfbDZjZ1GSqS/BSuHpb1mbgY9iQy3SY9xEadvrPqxHutOqN1kR52icwDvuEo+YG5KFtxsi
	UFbDnwf3UeVj3jdKpX8oiljRhUO4LkIi/2ytBqRh8gCOP7XYGIYaB/GHfFPJ2xGB7smo=
X-Gm-Gg: AYBFou0cKECE2BBr0o3zdcEaVH5akOYUVpiqgx6fnlEQ4Emh95bLCSnJpJfD4TTENCw
	WzMgjohH5zFo1bIcdYYKouIH93s8VwiL98+UX4IvzpHmi0c4owQ89RZ7lH4rr+glOh9JozBaqWY
	7WhVT2HWz3DI6mO2hwJIQ8qITQaW0NRaRpbT1IEPoBilOHUJ6iCBbYcMF2CVJU9mDnR/UJ6TsP5
	zOrbU0Bvf/OoecrZVTinx9qdM9uL+exrxL9sYuFRFI5bCL14kyWfGLF/0oSoVKfdi/TqzWGwsB+
	78KPWasrRC8OR/ZZKRjvHBVOY+jacSy+NIEP3D6RjZ0gR/3VI9C8aZU5FTnn7cvUYFilyuQOZ0A
	cfu5C3/uTpRnHPXr4Eeow4Y8ssvnZ0HK1Ybipp9gBwZF+Fkw6BHR2J0Sd6IF+Rw==
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520729885a.77.1793223970189;
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr520726285a.77.1793223969751;
        Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
Date: Wed, 28 Oct 2026 21:45:50 +0000
Message-ID: <20261028214551.108424-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae26d22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yjr2dUU_5hJp1kNbtNwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gpc021AEdbtiKymlYLhMMutj7pQhcgQ_
X-Proofpoint-ORIG-GUID: gpc021AEdbtiKymlYLhMMutj7pQhcgQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX1YFybsOVQUIX
 B+vyjw0szUYroDv4vo5DsLnwTk0vGxh58zUMCrw67GNof7NhLvdjCgZnaCpDeU6oMdFZ2I6RKBq
 OzpsuYvW9pIbAQIaY9rngy1w4hSF9FLecTCypX/tv1vpUqfnxZOWDgkWm35S++WU4eFtjFfPr5l
 z2Eyw59WSAHUiAITBji7u2caZYjSkqOuziKTE/7Z1+CDTS+XS4s95klyauLFAeW0QwdpyARjhLW
 YSmHKE40cvnM1EUT0kS/N/qllRS1vLaDVSa27bd/+gD5jKZnHDvVL493NTyJww1AnIMD8m0qTcG
 FmgNKrWtIntO6uluYvRP0wh5JF3AJGzTFqhY0l0qGWltVa0Z74AS3wHHnlyb2nT0lG9dHqm949a
 RtxuwKJDbuK8MCSkVEXjYDC0WPizyGbbBBxNcHSKFnQr09wNYopM/QcQLsNwNxk2uCPIJkvSYRe
 URVPATLT4LG/btz5yog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXww8UOMi/AF7G
 TXmMzQ1WW59p36F87TgdET7cWN+P7MiZR6bAMdinPYckKY//1tS8O2SVmv6eNWECamoOeW6RVTW
 op9kDxMv26g5HAvYShngMAkiVsIQxyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
connector and add the corresponding i2c0 and spi0 aliases for them.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 940a03732eef..2fa652f3ae58 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -19,9 +19,11 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
 		serial1 = &uart10;
+		spi0 = &spi3;
 	};
 
 	chosen {
@@ -388,6 +390,11 @@ queue3 {
 	};
 };
 
+/* JHAT 40-pin I2C0 */
+&i2c0 {
+	status = "okay";
+};
+
 &i2c12 {
 	clock-frequency = <400000>;
 
@@ -562,6 +569,11 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+/* JHAT 40-pin SPI */
+&spi3 {
+	status = "okay";
+};
+
 &thermal_zones {
 	cpuss-0-0-thermal {
 		trips {
-- 
2.53.0

