Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612874;
	b=N5nXEwazAg0b4fYPhQXPUdxhTXvXLyDho+sY/rt5gyQ22Lny47/eaceBECWF3rXr0fq+
	 zXvUTG3+rpmFRM03vqNSja+9ygI//eXnIUda8jQy0J5swP/17v8w0wRzuYojR7V+vEfp8
	 Kdanox2v9fNql7OZtGe1tcgL0J95yacZ+nmmjQoyn7wPGGfCHCdOzcRclnAAGvKHvYdtB
	 kSeESI7h+cjKe8EF5Jf3P1rQzlPdcJJ7+d1JzchpPmza5bz7OQb7qtJjamxM35vXBuLhz
	 mYLkiGpcADTzoXQkG7rbhRqPzdAxULqHn1WGiJA2Gyc/Pp+STSgT/9/baC2JJZskm9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=pdfUuLNgZUei6TD/Tg8vJHFc1BJZ75VB6x6jX/2HVVegHFGe4ry6B6v5ASCv3nyVT3u5
	 x900u/kuH/6L7pL1EkdI1ZqJCrJVwEhJtDxmN84JLLFmTnnKJ+ACcm35QBptv3yySYlva
	 PZeHIm+XpCCAQZ+XArf9A++SxrUdI5cTs4KjruQc9SIraqcbZ8Rru6/mHC03uuVQRdhhN
	 TS1NqcQZyZzkJiqXZrl5VUoRhEem7TTUdQ761zxW5GqrHCJRwzaddQ/LcHUszjI8TuPbv
	 6Efst+R7k8uofm9QYPbvvl58Q98Wws4rra+TtgVFqCtZfXIHr44wV642+HEi/yZCBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c60ltpkN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQSO5Q1l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002F606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F002F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c60ltpkN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQSO5Q1l
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AS1f3440483
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=c60ltpkN2CjgXaiR
	LE/HImbNGg1TmZ6HFXIpg06HGEsPeMxmTEnciQ6RPcaq9NZHq5O0SW5H31VDrjir
	cnbafERiEa+nKkKhhZGqvnTS72Ie/3b1eqVH3jar5nGiUOGk3j2idwTV5s3ZwzyQ
	6xFmMM/2KTgTUzyrn0Y3PUUZbvrgnz/NPu15AT1+R7Lk3UCaf8oJmNuUvOBOAvcm
	hH+5XLguFWFIW0OjBeBUHfBH1xnrXTi2mFaQ9ASdWnO2XDtoErgvrjnoHXFA9tCH
	OyrGtodN6qZAIqyfMujRxMI1QDoRvcJGRRsYeB8/hSKirlrO2hU1kn5SzQ2EpvJM
	mVlrSA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201qy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6267021a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612872; x=1794217672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=ZQSO5Q1lY0GY0T6xdQcrv03Zg43AxzQF9QV6H+FZNi9O0+hoQdVr/QxltuJ6z5Sx1h
         SAH3xU9jHOt3LSjsG4l7Bow5lnXGBMeLvBqkHlitovauSeFyu7O+nXF5zJaw3OP3m12K
         23qVhsJhdvN/xBfRoBiIDY5FqU3NJTAkzu5w2J1OlBHYgmufF28J/d9Ld9UgZKM4OEPe
         EJKHgwow/xubnVYBWJBRpIaok7PeSHLaPwcxmSedbUKnOP2pAxpFNaD4G8utDgTkw8Gp
         i2RZJABrUjblwFQcLh5NYJtKKm9zvY3XCMmnTx7qyijiAsVsIfnhaVPnG+OeP1iBVk8o
         FCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612872; x=1794217672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=NHAKNLIm5y0hLzOcaqRZkqvQkyRIYFQHS9BstCyQSZL4SzwxKCTDrDft19/4cxPfAC
         i8fsIs3ep5cmgDHLZdCpTJIQRdHQArsO3dIBLe5ZIoHr0XPhfL4nnzNGOcfRn1vi/HZX
         DF264rAqXOYneqxJfeMBMRPgsYlZvweaFclwLkk03TW5wQ8jiKBrz5yiWACG/XKhbBS3
         6JxPnL3RlsSS5ukjSt7/vL9kwAhoqyjLb4SkfeC8wvU2hTIs9eOq3RXMG0YZk+sZZaRs
         zDYZWVafuKPIhNc/ZABCjoa6Cj5/0whuvYq2BAu+0tQTcYB1LmAT3R8oD7tHn8UQONBT
         Okuw==
X-Forwarded-Encrypted: i=1; AKwUvBzyk3kCwFrgt8oOX23ENbziqYAuri8HqNaoz5QkUPhy5Wh4K+KjSXaNSLZF3nObvSRnxq7mTtyBe6jZ6O0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F3uR+9HoaTlBn+c82lv9YJNfYE5/++ixwo14Dr6Eq6yuu1gPG
	QsU3s9QNLn3BxyMaY2uO0jHJQrpTl+LehzxrBRVt9a50JEtuL7XE8xUQl7e3Ev/kn3xmAHEGU5V
	ZdU6ycJ8KVeG4nvXY2kewULRP1ziXzN2Kvwnc2O+kByxo4+JQRz/sXjzuLNoyJ2JptZc=
X-Gm-Gg: AYBFou2jSgEmSpJIu8uFeWaH8l/MOCa5ezWxEaGhUAKplTGkRU+nm0aWo7OmtFfqX/y
	pcFKaqe0v4t/XyhxXWzVHuFvnz+C3CYfVCpSYkFMKYirKbMYJKOuapjBovgS+bnMHN/fDwcC1W5
	S/njW41KRtxaa0gR7izqoipqkL0D0MKBPMR6Xz0oKotLJZyadkKEUvKeRicTnW6cDaX15iqi+Q9
	u8PeU/LgJJVwDcXUXEOiXRFKs1lzThfQOwK8EXEfo01m+HnaDnDHLpvKBjNxGNbnYjxVXXMi8qv
	IB2illyXtQx1/he3ciT277o+W9lg7oGz8yWscgT30yGZKsx1k5IJqP8Rqu/TdjUDUdXnSeVFkVq
	UiO8WKO4PW1LJCOtLh3K8ujc5lCgH4XsYHWOQ8aH9tJOAj3OQ7L/3fVlqnA9OiXCgM9czWbpOES
	zukh9dLa9YVBb0BkGdjJJi+e54M2oY1lCNFyY=
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208551a91.37.1793612872006;
        Mon, 02 Nov 2026 01:47:52 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208536a91.37.1793612871588;
        Mon, 02 Nov 2026 01:47:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:34 +0800
Subject: [PATCH v21 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-6-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=o45iHlSF0WsHgk3PyUkFhRrk//RjLVAmKOrTibXwQpYiryy5lYFSxxkpsFXbsQNmRGSrSi+cq
 xRm9Iigb9M6CDBxuhsa/PC45EBycsR0Aro0FtYcSqhPCkYw7xmvRxHR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Ya-fCY6CbvRcBhyXdrJ3HA6Dsel8lcPf
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85c49 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Ya-fCY6CbvRcBhyXdrJ3HA6Dsel8lcPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxhL1v5vAdYtm
 EdJBiyzyxTLBVqxtDgXp11JidShviODQof4YwihwLdqeYSyP9rRXe3hGlc2dGwPeYca5plefFtO
 XJEPu+AeiKYigwzl7JyfqHjFQiRU229/t7Unn2KRuXBhFCAg9cHSGVIcBh2zjKs8lYRIiRXplMz
 yCFYk60jV31syDUPHezdh1pHFhgbs0r+ue3/2GJSn9FJlIE/GKgf2WJ12xfoawxfBGRBqsoyhrD
 IXbAJ6LwAVMBoxG0cjV6AioWyhDa98cWlGVd0basCFjNhsl9f/kJPZcK3AIhLGbxvkCEvmwsjbX
 dT+JP2uPnTBw1/shFcmm/ZLhxjQN6hf4PsdwiNWO30vzfWNMVgR5qaeX+P+13IrwBt7hqdZmPef
 0uMA5LoayW3CS3FwmEBRaai1U6RGxdxXrgMyJ/yoSHWEaFn0K3KQLv5pTq4+9PfBmJmmA5cb84H
 DuypDgBx/6iqQNLNLeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7XFAp19mkd71
 bvJ0NzVY+gUbg6OG+nJEsKc59gpvItloaR8qXGSbxBXCOilHGuz20fXfgKDvudD26jRKY4ZU8L1
 mYW1+9x74zfCWTN3Sz0g3b48/sRC1bM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

